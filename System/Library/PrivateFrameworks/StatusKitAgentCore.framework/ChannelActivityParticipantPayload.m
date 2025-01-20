@interface ChannelActivityParticipantPayload
- (BOOL)hasEncryptedParticipantPayload;
- (BOOL)hasServerUpdateTimestampSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedParticipantPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)serverUpdateTimestampSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedParticipantPayload:(id)a3;
- (void)setHasServerUpdateTimestampSeconds:(BOOL)a3;
- (void)setServerUpdateTimestampSeconds:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityParticipantPayload

- (BOOL)hasEncryptedParticipantPayload
{
  return self->_encryptedParticipantPayload != 0;
}

- (void)setServerUpdateTimestampSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_serverUpdateTimestampSeconds = a3;
}

- (void)setHasServerUpdateTimestampSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServerUpdateTimestampSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityParticipantPayload;
  v4 = [(ChannelActivityParticipantPayload *)&v8 description];
  v5 = [(ChannelActivityParticipantPayload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  encryptedParticipantPayload = self->_encryptedParticipantPayload;
  if (encryptedParticipantPayload) {
    [v3 setObject:encryptedParticipantPayload forKey:@"encrypted_participant_payload"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_serverUpdateTimestampSeconds];
    [v4 setObject:v6 forKey:@"server_update_timestamp_seconds"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityParticipantPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedParticipantPayload)
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
  if (self->_encryptedParticipantPayload)
  {
    id v5 = v4;
    objc_msgSend(v4, "setEncryptedParticipantPayload:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_serverUpdateTimestampSeconds;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptedParticipantPayload copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_serverUpdateTimestampSeconds;
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
  encryptedParticipantPayload = self->_encryptedParticipantPayload;
  if ((unint64_t)encryptedParticipantPayload | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptedParticipantPayload, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_serverUpdateTimestampSeconds == *((void *)v4 + 1))
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
  uint64_t v3 = [(NSData *)self->_encryptedParticipantPayload hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_serverUpdateTimestampSeconds;
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
    -[ChannelActivityParticipantPayload setEncryptedParticipantPayload:](self, "setEncryptedParticipantPayload:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_serverUpdateTimestampSeconds = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)encryptedParticipantPayload
{
  return self->_encryptedParticipantPayload;
}

- (void)setEncryptedParticipantPayload:(id)a3
{
}

- (unint64_t)serverUpdateTimestampSeconds
{
  return self->_serverUpdateTimestampSeconds;
}

- (void).cxx_destruct
{
}

@end