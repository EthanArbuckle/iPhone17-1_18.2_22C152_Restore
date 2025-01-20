@interface NRGPBIcon
- (BOOL)deletable;
- (BOOL)hasDeletable;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iconData;
- (NSString)bundleID;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)iconVariant;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDeletable:(BOOL)a3;
- (void)setHasDeletable:(BOOL)a3;
- (void)setIconData:(id)a3;
- (void)setIconVariant:(int)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRGPBIcon

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)setDeletable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deletable = a3;
}

- (void)setHasDeletable:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeletable
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBIcon;
  v3 = [(NRGPBIcon *)&v7 description];
  v4 = [(NRGPBIcon *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  v6 = +[NSNumber numberWithInt:self->_iconVariant];
  [v4 setObject:v6 forKey:@"iconVariant"];

  iconData = self->_iconData;
  if (iconData) {
    [v4 setObject:iconData forKey:@"iconData"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = +[NSNumber numberWithBool:self->_deletable];
    [v4 setObject:v9 forKey:@"deletable"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100006268((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_bundleID) {
    sub_1000146D0();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (!self->_iconData) {
    sub_1000146FC();
  }
  PBDataWriterWriteDataField();
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setBundleID:self->_bundleID];
  *((_DWORD *)v4 + 6) = self->_iconVariant;
  [v4 setIconData:self->_iconData];
  if (self->_version) {
    [v4 setVersion:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v4 + 40) = self->_deletable;
    *((unsigned char *)v4 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  *((_DWORD *)v5 + 6) = self->_iconVariant;
  id v8 = [(NSData *)self->_iconData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_version copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 40) = self->_deletable;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (self->_iconVariant != *((_DWORD *)v4 + 6)) {
    goto LABEL_11;
  }
  iconData = self->_iconData;
  if ((unint64_t)iconData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](iconData, "isEqual:")) {
      goto LABEL_11;
    }
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](version, "isEqual:")) {
      goto LABEL_11;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0)
    {
LABEL_11:
      BOOL v8 = 0;
      goto LABEL_12;
    }
    if (self->_deletable)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_11;
    }
    BOOL v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  uint64_t iconVariant = self->_iconVariant;
  unint64_t v5 = (unint64_t)[(NSData *)self->_iconData hash];
  NSUInteger v6 = [(NSString *)self->_version hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_deletable;
  }
  else {
    uint64_t v7 = 0;
  }
  return (2654435761 * iconVariant) ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NRGPBIcon setBundleID:](self, "setBundleID:");
    id v4 = v5;
  }
  self->_uint64_t iconVariant = *((_DWORD *)v4 + 6);
  if (*((void *)v4 + 2))
  {
    -[NRGPBIcon setIconData:](self, "setIconData:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NRGPBIcon setVersion:](self, "setVersion:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_deletable = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)iconVariant
{
  return self->_iconVariant;
}

- (void)setIconVariant:(int)a3
{
  self->_uint64_t iconVariant = a3;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)deletable
{
  return self->_deletable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_iconData, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end