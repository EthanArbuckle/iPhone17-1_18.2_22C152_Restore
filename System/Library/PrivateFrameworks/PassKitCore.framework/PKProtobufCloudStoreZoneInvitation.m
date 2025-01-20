@interface PKProtobufCloudStoreZoneInvitation
- (BOOL)hasContainerIdentifier;
- (BOOL)hasDateCreated;
- (BOOL)hasShareInvitationToken;
- (BOOL)hasShareURL;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)shareInvitationToken;
- (NSString)containerIdentifier;
- (NSString)shareURL;
- (NSString)zoneName;
- (double)dateCreated;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDateCreated:(double)a3;
- (void)setHasDateCreated:(BOOL)a3;
- (void)setShareInvitationToken:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufCloudStoreZoneInvitation

- (BOOL)hasShareURL
{
  return self->_shareURL != 0;
}

- (BOOL)hasShareInvitationToken
{
  return self->_shareInvitationToken != 0;
}

- (BOOL)hasContainerIdentifier
{
  return self->_containerIdentifier != 0;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (void)setDateCreated:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateCreated = a3;
}

- (void)setHasDateCreated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateCreated
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCloudStoreZoneInvitation;
  v4 = [(PKProtobufCloudStoreZoneInvitation *)&v8 description];
  v5 = [(PKProtobufCloudStoreZoneInvitation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  shareURL = self->_shareURL;
  if (shareURL) {
    [v3 setObject:shareURL forKey:@"shareURL"];
  }
  shareInvitationToken = self->_shareInvitationToken;
  if (shareInvitationToken) {
    [v3 setObject:shareInvitationToken forKey:@"shareInvitationToken"];
  }
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier) {
    [v3 setObject:containerIdentifier forKey:@"containerIdentifier"];
  }
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zoneName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithDouble:self->_dateCreated];
    [v3 setObject:v9 forKey:@"dateCreated"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCloudStoreZoneInvitationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_shareURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_shareInvitationToken) {
    PBDataWriterWriteDataField();
  }
  v4 = v5;
  if (self->_containerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[10] = self->_version;
  id v5 = v4;
  if (self->_shareURL)
  {
    objc_msgSend(v4, "setShareURL:");
    v4 = v5;
  }
  if (self->_shareInvitationToken)
  {
    objc_msgSend(v5, "setShareInvitationToken:");
    v4 = v5;
  }
  if (self->_containerIdentifier)
  {
    objc_msgSend(v5, "setContainerIdentifier:");
    v4 = v5;
  }
  if (self->_zoneName)
  {
    objc_msgSend(v5, "setZoneName:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_dateCreated;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  uint64_t v6 = [(NSString *)self->_shareURL copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_shareInvitationToken copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_containerIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_zoneName copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_dateCreated;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (self->_version != *((_DWORD *)v4 + 10)) {
    goto LABEL_15;
  }
  shareURL = self->_shareURL;
  if ((unint64_t)shareURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](shareURL, "isEqual:")) {
      goto LABEL_15;
    }
  }
  shareInvitationToken = self->_shareInvitationToken;
  if ((unint64_t)shareInvitationToken | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](shareInvitationToken, "isEqual:")) {
      goto LABEL_15;
    }
  }
  containerIdentifier = self->_containerIdentifier;
  if ((unint64_t)containerIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](containerIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_dateCreated == *((double *)v4 + 1))
    {
      BOOL v9 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v9 = 0;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  NSUInteger v4 = [(NSString *)self->_shareURL hash];
  uint64_t v5 = [(NSData *)self->_shareInvitationToken hash];
  NSUInteger v6 = [(NSString *)self->_containerIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_zoneName hash];
  if (*(unsigned char *)&self->_has)
  {
    double dateCreated = self->_dateCreated;
    double v10 = -dateCreated;
    if (dateCreated >= 0.0) {
      double v10 = self->_dateCreated;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v7 ^ (2654435761 * version) ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 10);
  id v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[PKProtobufCloudStoreZoneInvitation setShareURL:](self, "setShareURL:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufCloudStoreZoneInvitation setShareInvitationToken:](self, "setShareInvitationToken:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufCloudStoreZoneInvitation setContainerIdentifier:](self, "setContainerIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[PKProtobufCloudStoreZoneInvitation setZoneName:](self, "setZoneName:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_double dateCreated = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSData)shareInvitationToken
{
  return self->_shareInvitationToken;
}

- (void)setShareInvitationToken:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (double)dateCreated
{
  return self->_dateCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_shareInvitationToken, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end