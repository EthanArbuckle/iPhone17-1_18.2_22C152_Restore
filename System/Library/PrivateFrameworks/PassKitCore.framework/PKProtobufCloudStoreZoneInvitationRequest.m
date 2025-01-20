@interface PKProtobufCloudStoreZoneInvitationRequest
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasErrorDomain;
- (BOOL)hasInvitation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDescription;
- (NSString)errorDomain;
- (PKProtobufCloudStoreZoneInvitation)invitation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setInvitation:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufCloudStoreZoneInvitationRequest

- (BOOL)hasInvitation
{
  return self->_invitation != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCloudStoreZoneInvitationRequest;
  v4 = [(PKProtobufCloudStoreZoneInvitationRequest *)&v8 description];
  v5 = [(PKProtobufCloudStoreZoneInvitationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  invitation = self->_invitation;
  if (invitation)
  {
    v6 = [(PKProtobufCloudStoreZoneInvitation *)invitation dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"invitation"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v7 forKey:@"errorCode"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCloudStoreZoneInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_invitation) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v4 = v5;
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[10] = self->_version;
  id v5 = v4;
  if (self->_invitation)
  {
    objc_msgSend(v4, "setInvitation:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  id v6 = [(PKProtobufCloudStoreZoneInvitation *)self->_invitation copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_errorCode;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (self->_version != *((_DWORD *)v4 + 10)) {
    goto LABEL_14;
  }
  invitation = self->_invitation;
  if ((unint64_t)invitation | *((void *)v4 + 4))
  {
    if (!-[PKProtobufCloudStoreZoneInvitation isEqual:](invitation, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_14:
    char v8 = 0;
    goto LABEL_15;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 3)
    && !-[NSString isEqual:](errorDomain, "isEqual:"))
  {
    goto LABEL_14;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](errorDescription, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  unint64_t v4 = [(PKProtobufCloudStoreZoneInvitation *)self->_invitation hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 2654435761 * version;
  NSUInteger v7 = v4 ^ v5 ^ [(NSString *)self->_errorDomain hash];
  return v7 ^ [(NSString *)self->_errorDescription hash] ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_unsigned int version = v4[10];
  invitation = self->_invitation;
  uint64_t v6 = *((void *)v4 + 4);
  NSUInteger v7 = v4;
  if (invitation)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufCloudStoreZoneInvitation mergeFrom:](invitation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PKProtobufCloudStoreZoneInvitationRequest setInvitation:](self, "setInvitation:");
  }
  unint64_t v4 = v7;
LABEL_7:
  if (v4[11])
  {
    self->_errorCode = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorDomain:](self, "setErrorDomain:");
    unint64_t v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorDescription:](self, "setErrorDescription:");
    unint64_t v4 = v7;
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

- (PKProtobufCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end