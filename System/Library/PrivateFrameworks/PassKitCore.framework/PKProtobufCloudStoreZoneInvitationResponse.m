@interface PKProtobufCloudStoreZoneInvitationResponse
- (BOOL)hasInvitation;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PKProtobufCloudStoreZoneInvitation)invitation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)status;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setInvitation:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufCloudStoreZoneInvitationResponse

- (BOOL)hasInvitation
{
  return self->_invitation != 0;
}

- (void)setStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCloudStoreZoneInvitationResponse;
  v4 = [(PKProtobufCloudStoreZoneInvitationResponse *)&v8 description];
  v5 = [(PKProtobufCloudStoreZoneInvitationResponse *)self dictionaryRepresentation];
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
    v7 = [NSNumber numberWithUnsignedInt:self->_status];
    [v3 setObject:v7 forKey:@"status"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCloudStoreZoneInvitationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_invitation) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[5] = self->_version;
  if (self->_invitation)
  {
    v5 = v4;
    objc_msgSend(v4, "setInvitation:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_status;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 20) = self->_version;
  id v6 = [(PKProtobufCloudStoreZoneInvitation *)self->_invitation copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (self->_version != *((_DWORD *)v4 + 5)) {
    goto LABEL_9;
  }
  invitation = self->_invitation;
  if ((unint64_t)invitation | *((void *)v4 + 1))
  {
    if (!-[PKProtobufCloudStoreZoneInvitation isEqual:](invitation, "isEqual:")) {
      goto LABEL_9;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_status == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  unint64_t v4 = [(PKProtobufCloudStoreZoneInvitation *)self->_invitation hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_status;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v5 ^ (2654435761 * version);
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_unsigned int version = v4[5];
  invitation = self->_invitation;
  uint64_t v6 = *((void *)v4 + 1);
  if (invitation)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[PKProtobufCloudStoreZoneInvitation mergeFrom:](invitation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[PKProtobufCloudStoreZoneInvitationResponse setInvitation:](self, "setInvitation:");
  }
  unint64_t v4 = v7;
LABEL_7:
  if (v4[6])
  {
    self->_status = v4[4];
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

- (PKProtobufCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end