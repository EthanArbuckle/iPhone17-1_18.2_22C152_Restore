@interface SharedChannelProvisionOffGridPacketInfo
- (BOOL)hasCommitmentSalt;
- (BOOL)hasEncryptedPacket;
- (BOOL)hasInitializationVector;
- (BOOL)hasPacketExpirationTimestampMillis;
- (BOOL)hasPacketId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)commitmentSalt;
- (NSData)encryptedPacket;
- (NSData)initializationVector;
- (NSData)packetId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)packetExpirationTimestampMillis;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommitmentSalt:(id)a3;
- (void)setEncryptedPacket:(id)a3;
- (void)setHasPacketExpirationTimestampMillis:(BOOL)a3;
- (void)setInitializationVector:(id)a3;
- (void)setPacketExpirationTimestampMillis:(unint64_t)a3;
- (void)setPacketId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelProvisionOffGridPacketInfo

- (BOOL)hasPacketId
{
  return self->_packetId != 0;
}

- (BOOL)hasEncryptedPacket
{
  return self->_encryptedPacket != 0;
}

- (void)setPacketExpirationTimestampMillis:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_packetExpirationTimestampMillis = a3;
}

- (void)setHasPacketExpirationTimestampMillis:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPacketExpirationTimestampMillis
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCommitmentSalt
{
  return self->_commitmentSalt != 0;
}

- (BOOL)hasInitializationVector
{
  return self->_initializationVector != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelProvisionOffGridPacketInfo;
  v4 = [(SharedChannelProvisionOffGridPacketInfo *)&v8 description];
  v5 = [(SharedChannelProvisionOffGridPacketInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  packetId = self->_packetId;
  if (packetId) {
    [v3 setObject:packetId forKey:@"packet_id"];
  }
  encryptedPacket = self->_encryptedPacket;
  if (encryptedPacket) {
    [v4 setObject:encryptedPacket forKey:@"encrypted_packet"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_packetExpirationTimestampMillis];
    [v4 setObject:v7 forKey:@"packet_expiration_timestamp_millis"];
  }
  commitmentSalt = self->_commitmentSalt;
  if (commitmentSalt) {
    [v4 setObject:commitmentSalt forKey:@"commitment_salt"];
  }
  initializationVector = self->_initializationVector;
  if (initializationVector) {
    [v4 setObject:initializationVector forKey:@"initialization_vector"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionOffGridPacketInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_packetId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedPacket)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_commitmentSalt)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_initializationVector)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_packetId)
  {
    objc_msgSend(v4, "setPacketId:");
    id v4 = v5;
  }
  if (self->_encryptedPacket)
  {
    objc_msgSend(v5, "setEncryptedPacket:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_packetExpirationTimestampMillis;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_commitmentSalt)
  {
    objc_msgSend(v5, "setCommitmentSalt:");
    id v4 = v5;
  }
  if (self->_initializationVector)
  {
    objc_msgSend(v5, "setInitializationVector:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_packetId copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSData *)self->_encryptedPacket copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_packetExpirationTimestampMillis;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v10 = [(NSData *)self->_commitmentSalt copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSData *)self->_initializationVector copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  packetId = self->_packetId;
  if ((unint64_t)packetId | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](packetId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  encryptedPacket = self->_encryptedPacket;
  if ((unint64_t)encryptedPacket | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](encryptedPacket, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_packetExpirationTimestampMillis != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  commitmentSalt = self->_commitmentSalt;
  if ((unint64_t)commitmentSalt | *((void *)v4 + 2)
    && !-[NSData isEqual:](commitmentSalt, "isEqual:"))
  {
    goto LABEL_15;
  }
  initializationVector = self->_initializationVector;
  if ((unint64_t)initializationVector | *((void *)v4 + 4)) {
    char v9 = -[NSData isEqual:](initializationVector, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_packetId hash];
  uint64_t v4 = [(NSData *)self->_encryptedPacket hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_packetExpirationTimestampMillis;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_commitmentSalt hash];
  return v6 ^ [(NSData *)self->_initializationVector hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unint64_t *)a3;
  unint64_t v5 = v4;
  if (v4[5])
  {
    -[SharedChannelProvisionOffGridPacketInfo setPacketId:](self, "setPacketId:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    -[SharedChannelProvisionOffGridPacketInfo setEncryptedPacket:](self, "setEncryptedPacket:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_packetExpirationTimestampMillis = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[SharedChannelProvisionOffGridPacketInfo setCommitmentSalt:](self, "setCommitmentSalt:");
    uint64_t v4 = v5;
  }
  if (v4[4])
  {
    -[SharedChannelProvisionOffGridPacketInfo setInitializationVector:](self, "setInitializationVector:");
    uint64_t v4 = v5;
  }
}

- (NSData)packetId
{
  return self->_packetId;
}

- (void)setPacketId:(id)a3
{
}

- (NSData)encryptedPacket
{
  return self->_encryptedPacket;
}

- (void)setEncryptedPacket:(id)a3
{
}

- (unint64_t)packetExpirationTimestampMillis
{
  return self->_packetExpirationTimestampMillis;
}

- (NSData)commitmentSalt
{
  return self->_commitmentSalt;
}

- (void)setCommitmentSalt:(id)a3
{
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetId, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_encryptedPacket, 0);
  objc_storeStrong((id *)&self->_commitmentSalt, 0);
}

@end