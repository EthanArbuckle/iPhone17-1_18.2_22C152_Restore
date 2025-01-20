@interface SDAutoUnlockLTKInfo
- (BOOL)hasLtk;
- (BOOL)hasLtkID;
- (BOOL)hasSignout;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)signout;
- (NSData)ltk;
- (NSData)ltkID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSignout:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLtk:(id)a3;
- (void)setLtkID:(id)a3;
- (void)setSignout:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockLTKInfo

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLtk
{
  return self->_ltk != 0;
}

- (BOOL)hasLtkID
{
  return self->_ltkID != 0;
}

- (void)setSignout:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_signout = a3;
}

- (void)setHasSignout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignout
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockLTKInfo;
  char v3 = [(SDAutoUnlockLTKInfo *)&v7 description];
  v4 = [(SDAutoUnlockLTKInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  ltk = self->_ltk;
  if (ltk) {
    [v3 setObject:ltk forKey:@"ltk"];
  }
  ltkID = self->_ltkID;
  if (ltkID) {
    [v3 setObject:ltkID forKey:@"ltkID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_signout];
    [v3 setObject:v7 forKey:@"signout"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_ltk) {
    PBDataWriterWriteDataField();
  }
  if (self->_ltkID) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_ltk)
  {
    [v4 setLtk:];
    id v4 = v5;
  }
  if (self->_ltkID)
  {
    [v5 setLtkID:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_signout;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[6] = self->_version;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(NSData *)self->_ltk copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(NSData *)self->_ltkID copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v6 + 28) = self->_signout;
    *((unsigned char *)v6 + 32) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_13;
  }
  ltk = self->_ltk;
  if ((unint64_t)ltk | *((void *)v4 + 1) && !-[NSData isEqual:](ltk, "isEqual:")) {
    goto LABEL_13;
  }
  ltkID = self->_ltkID;
  if ((unint64_t)ltkID | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](ltkID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_signout)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_ltk hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_ltkID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_signout;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 32))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDAutoUnlockLTKInfo setLtk:](self, "setLtk:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockLTKInfo setLtkID:](self, "setLtkID:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_signout = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)ltk
{
  return self->_ltk;
}

- (void)setLtk:(id)a3
{
}

- (NSData)ltkID
{
  return self->_ltkID;
}

- (void)setLtkID:(id)a3
{
}

- (BOOL)signout
{
  return self->_signout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkID, 0);

  objc_storeStrong((id *)&self->_ltk, 0);
}

@end