@interface PDSProtoUserPushTokenRegRequest
+ (Class)deviceInfoType;
+ (Class)topicType;
- (BOOL)hasTtl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)deviceInfos;
- (NSMutableArray)topics;
- (PDSProtoUserPushToken)userPushToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceInfoAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)topicAtIndex:(unint64_t)a3;
- (int64_t)ttl;
- (unint64_t)deviceInfosCount;
- (unint64_t)hash;
- (unint64_t)topicsCount;
- (void)addDeviceInfo:(id)a3;
- (void)addTopic:(id)a3;
- (void)clearDeviceInfos;
- (void)clearTopics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfos:(id)a3;
- (void)setHasTtl:(BOOL)a3;
- (void)setTopics:(id)a3;
- (void)setTtl:(int64_t)a3;
- (void)setUserPushToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoUserPushTokenRegRequest

- (void)clearDeviceInfos
{
}

- (void)addDeviceInfo:(id)a3
{
  id v4 = a3;
  deviceInfos = self->_deviceInfos;
  id v8 = v4;
  if (!deviceInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_deviceInfos;
    self->_deviceInfos = v6;

    id v4 = v8;
    deviceInfos = self->_deviceInfos;
  }
  [(NSMutableArray *)deviceInfos addObject:v4];
}

- (unint64_t)deviceInfosCount
{
  return [(NSMutableArray *)self->_deviceInfos count];
}

- (id)deviceInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deviceInfos objectAtIndex:a3];
}

+ (Class)deviceInfoType
{
  return (Class)objc_opt_class();
}

- (void)setTtl:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTtl
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearTopics
{
}

- (void)addTopic:(id)a3
{
  id v4 = a3;
  topics = self->_topics;
  id v8 = v4;
  if (!topics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topics;
    self->_topics = v6;

    id v4 = v8;
    topics = self->_topics;
  }
  [(NSMutableArray *)topics addObject:v4];
}

- (unint64_t)topicsCount
{
  return [(NSMutableArray *)self->_topics count];
}

- (id)topicAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topics objectAtIndex:a3];
}

+ (Class)topicType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoUserPushTokenRegRequest;
  id v4 = [(PDSProtoUserPushTokenRegRequest *)&v8 description];
  v5 = [(PDSProtoUserPushTokenRegRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  userPushToken = self->_userPushToken;
  if (userPushToken)
  {
    v5 = [(PDSProtoUserPushToken *)userPushToken dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"user_push_token"];
  }
  if ([(NSMutableArray *)self->_deviceInfos count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_deviceInfos, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v7 = self->_deviceInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"device_info"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithLongLong:self->_ttl];
    [v3 setObject:v13 forKey:@"ttl"];
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_topics;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"topic"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserPushTokenRegRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_userPushToken) {
    -[PDSProtoUserPushTokenRegRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_deviceInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_topics;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  [v12 setUserPushToken:self->_userPushToken];
  if ([(PDSProtoUserPushTokenRegRequest *)self deviceInfosCount])
  {
    [v12 clearDeviceInfos];
    unint64_t v4 = [(PDSProtoUserPushTokenRegRequest *)self deviceInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PDSProtoUserPushTokenRegRequest *)self deviceInfoAtIndex:i];
        [v12 addDeviceInfo:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v12 + 1) = self->_ttl;
    *((unsigned char *)v12 + 40) |= 1u;
  }
  if ([(PDSProtoUserPushTokenRegRequest *)self topicsCount])
  {
    [v12 clearTopics];
    unint64_t v8 = [(PDSProtoUserPushTokenRegRequest *)self topicsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(PDSProtoUserPushTokenRegRequest *)self topicAtIndex:j];
        [v12 addTopic:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDSProtoUserPushToken *)self->_userPushToken copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_deviceInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addDeviceInfo:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_ttl;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_topics;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [(id)v5 addTopic:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  userPushToken = self->_userPushToken;
  if ((unint64_t)userPushToken | *((void *)v4 + 4))
  {
    if (!-[PDSProtoUserPushToken isEqual:](userPushToken, "isEqual:")) {
      goto LABEL_13;
    }
  }
  deviceInfos = self->_deviceInfos;
  if ((unint64_t)deviceInfos | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](deviceInfos, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_ttl != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](topics, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDSProtoUserPushToken *)self->_userPushToken hash];
  uint64_t v4 = [(NSMutableArray *)self->_deviceInfos hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_ttl;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_topics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  userPushToken = self->_userPushToken;
  uint64_t v6 = *((void *)v4 + 4);
  if (userPushToken)
  {
    if (v6) {
      -[PDSProtoUserPushToken mergeFrom:](userPushToken, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDSProtoUserPushTokenRegRequest setUserPushToken:](self, "setUserPushToken:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PDSProtoUserPushTokenRegRequest *)self addDeviceInfo:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_ttl = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[PDSProtoUserPushTokenRegRequest addTopic:](self, "addTopic:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (PDSProtoUserPushToken)userPushToken
{
  return self->_userPushToken;
}

- (void)setUserPushToken:(id)a3
{
}

- (NSMutableArray)deviceInfos
{
  return self->_deviceInfos;
}

- (void)setDeviceInfos:(id)a3
{
}

- (int64_t)ttl
{
  return self->_ttl;
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPushToken, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_deviceInfos, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoUserPushTokenRegRequest writeTo:]", "PDSProtoUserPushTokenRegRequest.m", 216, "self->_userPushToken != nil");
}

@end