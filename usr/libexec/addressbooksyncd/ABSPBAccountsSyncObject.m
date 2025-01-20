@interface ABSPBAccountsSyncObject
- (BOOL)hasLocalContainerEnabled;
- (BOOL)hasPrimaryiCloudAccountCardDAVAccountExternalIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)localContainerEnabled;
- (BOOL)readFrom:(id)a3;
- (NSString)primaryiCloudAccountCardDAVAccountExternalIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocalContainerEnabled:(BOOL)a3;
- (void)setLocalContainerEnabled:(BOOL)a3;
- (void)setPrimaryiCloudAccountCardDAVAccountExternalIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBAccountsSyncObject

- (void)setLocalContainerEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_localContainerEnabled = a3;
}

- (void)setHasLocalContainerEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocalContainerEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPrimaryiCloudAccountCardDAVAccountExternalIdentifier
{
  return self->_primaryiCloudAccountCardDAVAccountExternalIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBAccountsSyncObject;
  v3 = [(ABSPBAccountsSyncObject *)&v7 description];
  v4 = [(ABSPBAccountsSyncObject *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithBool:self->_localContainerEnabled];
    [v3 setObject:v4 forKey:@"localContainerEnabled"];
  }
  primaryiCloudAccountCardDAVAccountExternalIdentifier = self->_primaryiCloudAccountCardDAVAccountExternalIdentifier;
  if (primaryiCloudAccountCardDAVAccountExternalIdentifier) {
    [v3 setObject:primaryiCloudAccountCardDAVAccountExternalIdentifier forKey:@"primaryiCloudAccountCardDAVAccountExternalIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBAccountsSyncObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_primaryiCloudAccountCardDAVAccountExternalIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_localContainerEnabled;
    v4[20] |= 1u;
  }
  if (self->_primaryiCloudAccountCardDAVAccountExternalIdentifier)
  {
    id v5 = v4;
    [v4 setPrimaryiCloudAccountCardDAVAccountExternalIdentifier:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 16) = self->_localContainerEnabled;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NSString *)self->_primaryiCloudAccountCardDAVAccountExternalIdentifier copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_localContainerEnabled)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    unsigned __int8 v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  primaryiCloudAccountCardDAVAccountExternalIdentifier = self->_primaryiCloudAccountCardDAVAccountExternalIdentifier;
  if ((unint64_t)primaryiCloudAccountCardDAVAccountExternalIdentifier | *((void *)v4 + 1)) {
    unsigned __int8 v5 = -[NSString isEqual:](primaryiCloudAccountCardDAVAccountExternalIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_localContainerEnabled;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_primaryiCloudAccountCardDAVAccountExternalIdentifier hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[20])
  {
    self->_localContainerEnabled = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    unsigned __int8 v5 = v4;
    -[ABSPBAccountsSyncObject setPrimaryiCloudAccountCardDAVAccountExternalIdentifier:](self, "setPrimaryiCloudAccountCardDAVAccountExternalIdentifier:");
    id v4 = v5;
  }
}

- (BOOL)localContainerEnabled
{
  return self->_localContainerEnabled;
}

- (NSString)primaryiCloudAccountCardDAVAccountExternalIdentifier
{
  return self->_primaryiCloudAccountCardDAVAccountExternalIdentifier;
}

- (void)setPrimaryiCloudAccountCardDAVAccountExternalIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end