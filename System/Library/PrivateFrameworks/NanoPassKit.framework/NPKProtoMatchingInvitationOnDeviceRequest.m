@interface NPKProtoMatchingInvitationOnDeviceRequest
- (BOOL)hasInvitationData;
- (BOOL)hasTimeoutInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitationData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timeoutInSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimeoutInSeconds:(BOOL)a3;
- (void)setInvitationData:(id)a3;
- (void)setTimeoutInSeconds:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoMatchingInvitationOnDeviceRequest

- (BOOL)hasInvitationData
{
  return self->_invitationData != 0;
}

- (void)setTimeoutInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeoutInSeconds = a3;
}

- (void)setHasTimeoutInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeoutInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoMatchingInvitationOnDeviceRequest;
  v4 = [(NPKProtoMatchingInvitationOnDeviceRequest *)&v8 description];
  v5 = [(NPKProtoMatchingInvitationOnDeviceRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  invitationData = self->_invitationData;
  if (invitationData) {
    [v3 setObject:invitationData forKey:@"invitationData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_timeoutInSeconds];
    [v4 setObject:v6 forKey:@"timeoutInSeconds"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoMatchingInvitationOnDeviceRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invitationData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_invitationData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setInvitationData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_timeoutInSeconds;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_invitationData copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timeoutInSeconds;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  invitationData = self->_invitationData;
  if ((unint64_t)invitationData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](invitationData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_timeoutInSeconds == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_invitationData hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_timeoutInSeconds;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[NPKProtoMatchingInvitationOnDeviceRequest setInvitationData:](self, "setInvitationData:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_timeoutInSeconds = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
}

- (unint64_t)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void).cxx_destruct
{
}

@end