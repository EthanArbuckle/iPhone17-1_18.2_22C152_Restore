@interface NTPBNotificationChannel
- (BOOL)hasChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)channelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationChannel

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBNotificationChannel;
  v4 = [(NTPBNotificationChannel *)&v8 description];
  v5 = [(NTPBNotificationChannel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationChannelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_channelId) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_channelId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    channelId = self->_channelId;
    if ((unint64_t)channelId | v4[1]) {
      char v6 = -[NSString isEqual:](channelId, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_channelId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBNotificationChannel setChannelId:](self, "setChannelId:");
  }
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end