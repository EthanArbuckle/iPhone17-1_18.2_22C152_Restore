@interface ChannelDeferredPublishInfo
+ (Class)channelProvisionOffGridPacketInfoType;
- (BOOL)hasAdopter;
- (BOOL)hasChannelIdentity;
- (BOOL)hasPushPriority;
- (BOOL)hasRetryCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelIdentity)channelIdentity;
- (NSMutableArray)channelProvisionOffGridPacketInfos;
- (NSString)adopter;
- (id)channelProvisionOffGridPacketInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pushPriorityAsString:(int)a3;
- (int)StringAsPushPriority:(id)a3;
- (int)pushPriority;
- (unint64_t)channelProvisionOffGridPacketInfosCount;
- (unint64_t)hash;
- (unsigned)retryCount;
- (void)addChannelProvisionOffGridPacketInfo:(id)a3;
- (void)clearChannelProvisionOffGridPacketInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopter:(id)a3;
- (void)setChannelIdentity:(id)a3;
- (void)setChannelProvisionOffGridPacketInfos:(id)a3;
- (void)setHasPushPriority:(BOOL)a3;
- (void)setHasRetryCount:(BOOL)a3;
- (void)setPushPriority:(int)a3;
- (void)setRetryCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelDeferredPublishInfo

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (void)clearChannelProvisionOffGridPacketInfos
{
}

- (void)addChannelProvisionOffGridPacketInfo:(id)a3
{
  id v4 = a3;
  channelProvisionOffGridPacketInfos = self->_channelProvisionOffGridPacketInfos;
  id v8 = v4;
  if (!channelProvisionOffGridPacketInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelProvisionOffGridPacketInfos;
    self->_channelProvisionOffGridPacketInfos = v6;

    id v4 = v8;
    channelProvisionOffGridPacketInfos = self->_channelProvisionOffGridPacketInfos;
  }
  [(NSMutableArray *)channelProvisionOffGridPacketInfos addObject:v4];
}

- (unint64_t)channelProvisionOffGridPacketInfosCount
{
  return [(NSMutableArray *)self->_channelProvisionOffGridPacketInfos count];
}

- (id)channelProvisionOffGridPacketInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelProvisionOffGridPacketInfos objectAtIndex:a3];
}

+ (Class)channelProvisionOffGridPacketInfoType
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
    v3 = off_2646E1F80[a3];
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

- (void)setRetryCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelDeferredPublishInfo;
  int v4 = [(ChannelDeferredPublishInfo *)&v8 description];
  v5 = [(ChannelDeferredPublishInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    v5 = [(ChannelIdentity *)channelIdentity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"channel_identity"];
  }
  if ([(NSMutableArray *)self->_channelProvisionOffGridPacketInfos count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_channelProvisionOffGridPacketInfos, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = self->_channelProvisionOffGridPacketInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"channel_provision_off_grid_packet_info"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t pushPriority = self->_pushPriority;
    if (pushPriority >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pushPriority);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_2646E1F80[pushPriority];
    }
    [v3 setObject:v15 forKey:@"push_priority"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v16 = [NSNumber numberWithUnsignedInt:self->_retryCount];
    [v3 setObject:v16 forKey:@"retry_count"];
  }
  adopter = self->_adopter;
  if (adopter) {
    [v3 setObject:adopter forKey:@"adopter"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelDeferredPublishInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_channelIdentity) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_channelProvisionOffGridPacketInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_adopter) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_channelIdentity) {
    objc_msgSend(v10, "setChannelIdentity:");
  }
  if ([(ChannelDeferredPublishInfo *)self channelProvisionOffGridPacketInfosCount])
  {
    [v10 clearChannelProvisionOffGridPacketInfos];
    unint64_t v4 = [(ChannelDeferredPublishInfo *)self channelProvisionOffGridPacketInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ChannelDeferredPublishInfo *)self channelProvisionOffGridPacketInfoAtIndex:i];
        [v10 addChannelProvisionOffGridPacketInfo:v7];
      }
    }
  }
  char has = (char)self->_has;
  uint64_t v9 = v10;
  if (has)
  {
    *((_DWORD *)v10 + 8) = self->_pushPriority;
    *((unsigned char *)v10 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 9) = self->_retryCount;
    *((unsigned char *)v10 + 40) |= 2u;
  }
  if (self->_adopter)
  {
    objc_msgSend(v10, "setAdopter:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ChannelIdentity *)self->_channelIdentity copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_channelProvisionOffGridPacketInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addChannelProvisionOffGridPacketInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 32) = self->_pushPriority;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_retryCount;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v15 = -[NSString copyWithZone:](self->_adopter, "copyWithZone:", a3, (void)v18);
  uint64_t v16 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((void *)v4 + 2))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:")) {
      goto LABEL_18;
    }
  }
  channelProvisionOffGridPacketInfos = self->_channelProvisionOffGridPacketInfos;
  if ((unint64_t)channelProvisionOffGridPacketInfos | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](channelProvisionOffGridPacketInfos, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_pushPriority != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_retryCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](adopter, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ChannelIdentity *)self->_channelIdentity hash];
  uint64_t v4 = [(NSMutableArray *)self->_channelProvisionOffGridPacketInfos hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_pushPriority;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_adopter hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_retryCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_adopter hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  channelIdentity = self->_channelIdentity;
  uint64_t v6 = *((void *)v4 + 2);
  if (channelIdentity)
  {
    if (v6) {
      -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ChannelDeferredPublishInfo setChannelIdentity:](self, "setChannelIdentity:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ChannelDeferredPublishInfo addChannelProvisionOffGridPacketInfo:](self, "addChannelProvisionOffGridPacketInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v4 + 40);
  if (v12)
  {
    self->_uint64_t pushPriority = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v12 = *((unsigned char *)v4 + 40);
  }
  if ((v12 & 2) != 0)
  {
    self->_retryCount = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1)) {
    -[ChannelDeferredPublishInfo setAdopter:](self, "setAdopter:");
  }
}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
}

- (NSMutableArray)channelProvisionOffGridPacketInfos
{
  return self->_channelProvisionOffGridPacketInfos;
}

- (void)setChannelProvisionOffGridPacketInfos:(id)a3
{
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (NSString)adopter
{
  return self->_adopter;
}

- (void)setAdopter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelProvisionOffGridPacketInfos, 0);
  objc_storeStrong((id *)&self->_channelIdentity, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end