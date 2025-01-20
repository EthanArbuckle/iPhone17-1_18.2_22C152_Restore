@interface SharedChannelProvisionOffGridPacket
- (BOOL)hasChannelId;
- (BOOL)hasChannelTopic;
- (BOOL)hasCommitmentSalt;
- (BOOL)hasPublishPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (NSData)commitmentSalt;
- (NSData)publishPayload;
- (NSString)channelTopic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setChannelTopic:(id)a3;
- (void)setCommitmentSalt:(id)a3;
- (void)setPublishPayload:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelProvisionOffGridPacket

- (BOOL)hasPublishPayload
{
  return self->_publishPayload != 0;
}

- (BOOL)hasChannelTopic
{
  return self->_channelTopic != 0;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasCommitmentSalt
{
  return self->_commitmentSalt != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelProvisionOffGridPacket;
  v4 = [(SharedChannelProvisionOffGridPacket *)&v8 description];
  v5 = [(SharedChannelProvisionOffGridPacket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  publishPayload = self->_publishPayload;
  if (publishPayload) {
    [v3 setObject:publishPayload forKey:@"publish_payload"];
  }
  channelTopic = self->_channelTopic;
  if (channelTopic) {
    [v4 setObject:channelTopic forKey:@"channel_topic"];
  }
  channelId = self->_channelId;
  if (channelId) {
    [v4 setObject:channelId forKey:@"channel_id"];
  }
  commitmentSalt = self->_commitmentSalt;
  if (commitmentSalt) {
    [v4 setObject:commitmentSalt forKey:@"commitment_salt"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionOffGridPacketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publishPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_channelTopic)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_commitmentSalt)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publishPayload)
  {
    objc_msgSend(v4, "setPublishPayload:");
    id v4 = v5;
  }
  if (self->_channelTopic)
  {
    objc_msgSend(v5, "setChannelTopic:");
    id v4 = v5;
  }
  if (self->_channelId)
  {
    objc_msgSend(v5, "setChannelId:");
    id v4 = v5;
  }
  if (self->_commitmentSalt)
  {
    objc_msgSend(v5, "setCommitmentSalt:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_publishPayload copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_channelTopic copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_channelId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSData *)self->_commitmentSalt copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((publishPayload = self->_publishPayload, !((unint64_t)publishPayload | v4[4]))
     || -[NSData isEqual:](publishPayload, "isEqual:"))
    && ((channelTopic = self->_channelTopic, !((unint64_t)channelTopic | v4[2]))
     || -[NSString isEqual:](channelTopic, "isEqual:"))
    && ((channelId = self->_channelId, !((unint64_t)channelId | v4[1]))
     || -[NSData isEqual:](channelId, "isEqual:")))
  {
    commitmentSalt = self->_commitmentSalt;
    if ((unint64_t)commitmentSalt | v4[3]) {
      char v9 = -[NSData isEqual:](commitmentSalt, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_publishPayload hash];
  NSUInteger v4 = [(NSString *)self->_channelTopic hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_channelId hash];
  return v4 ^ v5 ^ [(NSData *)self->_commitmentSalt hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[4]) {
    -[SharedChannelProvisionOffGridPacket setPublishPayload:](self, "setPublishPayload:");
  }
  if (v4[2]) {
    -[SharedChannelProvisionOffGridPacket setChannelTopic:](self, "setChannelTopic:");
  }
  if (v4[1]) {
    -[SharedChannelProvisionOffGridPacket setChannelId:](self, "setChannelId:");
  }
  if (v4[3]) {
    -[SharedChannelProvisionOffGridPacket setCommitmentSalt:](self, "setCommitmentSalt:");
  }
}

- (NSData)publishPayload
{
  return self->_publishPayload;
}

- (void)setPublishPayload:(id)a3
{
}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
}

- (NSData)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (NSData)commitmentSalt
{
  return self->_commitmentSalt;
}

- (void)setCommitmentSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishPayload, 0);
  objc_storeStrong((id *)&self->_commitmentSalt, 0);
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
}

@end