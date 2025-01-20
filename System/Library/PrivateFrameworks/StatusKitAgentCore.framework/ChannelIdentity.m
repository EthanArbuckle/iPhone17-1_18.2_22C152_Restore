@interface ChannelIdentity
- (BOOL)hasChannelId;
- (BOOL)hasChannelOwnershipType;
- (BOOL)hasChannelToken;
- (BOOL)hasChannelTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (NSData)channelToken;
- (NSString)channelTopic;
- (id)channelOwnershipTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChannelOwnershipType:(id)a3;
- (int)channelOwnershipType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setChannelOwnershipType:(int)a3;
- (void)setChannelToken:(id)a3;
- (void)setChannelTopic:(id)a3;
- (void)setHasChannelOwnershipType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelIdentity

- (BOOL)hasChannelTopic
{
  return self->_channelTopic != 0;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasChannelToken
{
  return self->_channelToken != 0;
}

- (int)channelOwnershipType
{
  if (*(unsigned char *)&self->_has) {
    return self->_channelOwnershipType;
  }
  else {
    return 0;
  }
}

- (void)setChannelOwnershipType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelOwnershipType = a3;
}

- (void)setHasChannelOwnershipType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelOwnershipType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)channelOwnershipTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"SHARED_OWNERSHIP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"SELF_USER_OWNERSHIP";
  }
  return v4;
}

- (int)StringAsChannelOwnershipType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SELF_USER_OWNERSHIP"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SHARED_OWNERSHIP"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelIdentity;
  int v4 = [(ChannelIdentity *)&v8 description];
  v5 = [(ChannelIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  channelTopic = self->_channelTopic;
  if (channelTopic) {
    [v3 setObject:channelTopic forKey:@"channel_topic"];
  }
  channelId = self->_channelId;
  if (channelId) {
    [v4 setObject:channelId forKey:@"channel_id"];
  }
  channelToken = self->_channelToken;
  if (channelToken) {
    [v4 setObject:channelToken forKey:@"channel_token"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int channelOwnershipType = self->_channelOwnershipType;
    if (channelOwnershipType)
    {
      if (channelOwnershipType == 1)
      {
        v9 = @"SHARED_OWNERSHIP";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_channelOwnershipType);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = @"SELF_USER_OWNERSHIP";
    }
    [v4 setObject:v9 forKey:@"channel_ownership_type"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
  if (self->_channelToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelTopic)
  {
    objc_msgSend(v4, "setChannelTopic:");
    id v4 = v5;
  }
  if (self->_channelId)
  {
    objc_msgSend(v5, "setChannelId:");
    id v4 = v5;
  }
  if (self->_channelToken)
  {
    objc_msgSend(v5, "setChannelToken:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_channelOwnershipType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_channelTopic copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_channelId copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSData *)self->_channelToken copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_channelOwnershipType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  channelTopic = self->_channelTopic;
  if ((unint64_t)channelTopic | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelTopic, "isEqual:")) {
      goto LABEL_12;
    }
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](channelId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  channelToken = self->_channelToken;
  if ((unint64_t)channelToken | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](channelToken, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_channelOwnershipType == *((_DWORD *)v4 + 4))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelTopic hash];
  uint64_t v4 = [(NSData *)self->_channelId hash];
  uint64_t v5 = [(NSData *)self->_channelToken hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_channelOwnershipType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[ChannelIdentity setChannelTopic:](self, "setChannelTopic:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ChannelIdentity setChannelId:](self, "setChannelId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ChannelIdentity setChannelToken:](self, "setChannelToken:");
    uint64_t v4 = v5;
  }
  if (v4[10])
  {
    self->_int channelOwnershipType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
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

- (NSData)channelToken
{
  return self->_channelToken;
}

- (void)setChannelToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_channelToken, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
}

@end