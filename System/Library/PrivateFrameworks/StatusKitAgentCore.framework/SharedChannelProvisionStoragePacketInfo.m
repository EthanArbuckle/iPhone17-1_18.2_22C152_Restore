@interface SharedChannelProvisionStoragePacketInfo
- (BOOL)hasChannelTopicCommitment;
- (BOOL)hasEncryptedPacket;
- (BOOL)hasInitializationVector;
- (BOOL)hasPacketId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelTopicCommitment;
- (NSData)encryptedPacket;
- (NSData)initializationVector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)packetId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelTopicCommitment:(id)a3;
- (void)setEncryptedPacket:(id)a3;
- (void)setHasPacketId:(BOOL)a3;
- (void)setInitializationVector:(id)a3;
- (void)setPacketId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelProvisionStoragePacketInfo

- (void)setPacketId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_packetId = a3;
}

- (void)setHasPacketId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPacketId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEncryptedPacket
{
  return self->_encryptedPacket != 0;
}

- (BOOL)hasChannelTopicCommitment
{
  return self->_channelTopicCommitment != 0;
}

- (BOOL)hasInitializationVector
{
  return self->_initializationVector != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelProvisionStoragePacketInfo;
  v4 = [(SharedChannelProvisionStoragePacketInfo *)&v8 description];
  v5 = [(SharedChannelProvisionStoragePacketInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_packetId];
    [v3 setObject:v4 forKey:@"packet_id"];
  }
  encryptedPacket = self->_encryptedPacket;
  if (encryptedPacket) {
    [v3 setObject:encryptedPacket forKey:@"encrypted_packet"];
  }
  channelTopicCommitment = self->_channelTopicCommitment;
  if (channelTopicCommitment) {
    [v3 setObject:channelTopicCommitment forKey:@"channel_topic_commitment"];
  }
  initializationVector = self->_initializationVector;
  if (initializationVector) {
    [v3 setObject:initializationVector forKey:@"initialization_vector"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionStoragePacketInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_encryptedPacket)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_channelTopicCommitment)
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_packetId;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_encryptedPacket)
  {
    objc_msgSend(v4, "setEncryptedPacket:");
    id v4 = v5;
  }
  if (self->_channelTopicCommitment)
  {
    objc_msgSend(v5, "setChannelTopicCommitment:");
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
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_packetId;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_encryptedPacket copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSData *)self->_channelTopicCommitment copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  uint64_t v11 = [(NSData *)self->_initializationVector copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

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
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_packetId != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  encryptedPacket = self->_encryptedPacket;
  if ((unint64_t)encryptedPacket | *((void *)v4 + 3)
    && !-[NSData isEqual:](encryptedPacket, "isEqual:"))
  {
    goto LABEL_13;
  }
  channelTopicCommitment = self->_channelTopicCommitment;
  if ((unint64_t)channelTopicCommitment | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](channelTopicCommitment, "isEqual:")) {
      goto LABEL_13;
    }
  }
  initializationVector = self->_initializationVector;
  if ((unint64_t)initializationVector | *((void *)v4 + 4)) {
    char v8 = -[NSData isEqual:](initializationVector, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_packetId;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_encryptedPacket hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_channelTopicCommitment hash];
  return v4 ^ v5 ^ [(NSData *)self->_initializationVector hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[5])
  {
    self->_packetId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (v4[3])
  {
    -[SharedChannelProvisionStoragePacketInfo setEncryptedPacket:](self, "setEncryptedPacket:");
    uint64_t v4 = v5;
  }
  if (v4[2])
  {
    -[SharedChannelProvisionStoragePacketInfo setChannelTopicCommitment:](self, "setChannelTopicCommitment:");
    uint64_t v4 = v5;
  }
  if (v4[4])
  {
    -[SharedChannelProvisionStoragePacketInfo setInitializationVector:](self, "setInitializationVector:");
    uint64_t v4 = v5;
  }
}

- (unint64_t)packetId
{
  return self->_packetId;
}

- (NSData)encryptedPacket
{
  return self->_encryptedPacket;
}

- (void)setEncryptedPacket:(id)a3
{
}

- (NSData)channelTopicCommitment
{
  return self->_channelTopicCommitment;
}

- (void)setChannelTopicCommitment:(id)a3
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
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_encryptedPacket, 0);
  objc_storeStrong((id *)&self->_channelTopicCommitment, 0);
}

@end