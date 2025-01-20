@interface SharedChannelProvisionStorageValue
+ (Class)channelPublishProvisionPacketInfoType;
- (BOOL)hasPushPriority;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)channelPublishProvisionPacketInfos;
- (id)channelPublishProvisionPacketInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pushPriorityAsString:(int)a3;
- (int)StringAsPushPriority:(id)a3;
- (int)pushPriority;
- (unint64_t)channelPublishProvisionPacketInfosCount;
- (unint64_t)hash;
- (void)addChannelPublishProvisionPacketInfo:(id)a3;
- (void)clearChannelPublishProvisionPacketInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelPublishProvisionPacketInfos:(id)a3;
- (void)setHasPushPriority:(BOOL)a3;
- (void)setPushPriority:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelProvisionStorageValue

- (void)clearChannelPublishProvisionPacketInfos
{
}

- (void)addChannelPublishProvisionPacketInfo:(id)a3
{
  id v4 = a3;
  channelPublishProvisionPacketInfos = self->_channelPublishProvisionPacketInfos;
  id v8 = v4;
  if (!channelPublishProvisionPacketInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelPublishProvisionPacketInfos;
    self->_channelPublishProvisionPacketInfos = v6;

    id v4 = v8;
    channelPublishProvisionPacketInfos = self->_channelPublishProvisionPacketInfos;
  }
  [(NSMutableArray *)channelPublishProvisionPacketInfos addObject:v4];
}

- (unint64_t)channelPublishProvisionPacketInfosCount
{
  return [(NSMutableArray *)self->_channelPublishProvisionPacketInfos count];
}

- (id)channelPublishProvisionPacketInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelPublishProvisionPacketInfos objectAtIndex:a3];
}

+ (Class)channelPublishProvisionPacketInfoType
{
  return (Class)objc_opt_class();
}

- (int)pushPriority
{
  if (*(unsigned char *)&self->_has) {
    return self->_pushPriority;
  }
  else {
    return 0;
  }
}

- (void)setPushPriority:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pushPriority = a3;
}

- (void)setHasPushPriority:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPushPriority
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)pushPriorityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646E1AA0[a3];
  }
  return v3;
}

- (int)StringAsPushPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOW"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NORMAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HIGH"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelProvisionStorageValue;
  int v4 = [(SharedChannelProvisionStorageValue *)&v8 description];
  v5 = [(SharedChannelProvisionStorageValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_channelPublishProvisionPacketInfos count])
  {
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_channelPublishProvisionPacketInfos, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_channelPublishProvisionPacketInfos;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"channel_publish_provision_packet_info"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t pushPriority = self->_pushPriority;
    if (pushPriority >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pushPriority);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_2646E1AA0[pushPriority];
    }
    [v3 setObject:v12 forKey:@"push_priority"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelProvisionStorageValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_channelPublishProvisionPacketInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(SharedChannelProvisionStorageValue *)self channelPublishProvisionPacketInfosCount])
  {
    [v8 clearChannelPublishProvisionPacketInfos];
    unint64_t v4 = [(SharedChannelProvisionStorageValue *)self channelPublishProvisionPacketInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SharedChannelProvisionStorageValue *)self channelPublishProvisionPacketInfoAtIndex:i];
        [v8 addChannelPublishProvisionPacketInfo:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 4) = self->_pushPriority;
    *((unsigned char *)v8 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_channelPublishProvisionPacketInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addChannelPublishProvisionPacketInfo:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_pushPriority;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  channelPublishProvisionPacketInfos = self->_channelPublishProvisionPacketInfos;
  if ((unint64_t)channelPublishProvisionPacketInfos | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](channelPublishProvisionPacketInfos, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_pushPriority == *((_DWORD *)v4 + 4))
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
  uint64_t v3 = [(NSMutableArray *)self->_channelPublishProvisionPacketInfos hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_pushPriority;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SharedChannelProvisionStorageValue addChannelPublishProvisionPacketInfo:](self, "addChannelPublishProvisionPacketInfo:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 20))
  {
    self->_uint64_t pushPriority = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)channelPublishProvisionPacketInfos
{
  return self->_channelPublishProvisionPacketInfos;
}

- (void)setChannelPublishProvisionPacketInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end