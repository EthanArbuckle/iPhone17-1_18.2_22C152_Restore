@interface PDSProtoBatchRegisterReq
+ (Class)userPushTokenRegRequestsType;
- (BOOL)hasRequestTtl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)userPushTokenRegRequests;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userPushTokenRegRequestsAtIndex:(unint64_t)a3;
- (int64_t)requestTtl;
- (unint64_t)hash;
- (unint64_t)userPushTokenRegRequestsCount;
- (void)addUserPushTokenRegRequests:(id)a3;
- (void)clearUserPushTokenRegRequests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRequestTtl:(BOOL)a3;
- (void)setRequestTtl:(int64_t)a3;
- (void)setUserPushTokenRegRequests:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoBatchRegisterReq

- (void)clearUserPushTokenRegRequests
{
}

- (void)addUserPushTokenRegRequests:(id)a3
{
  id v4 = a3;
  userPushTokenRegRequests = self->_userPushTokenRegRequests;
  id v8 = v4;
  if (!userPushTokenRegRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_userPushTokenRegRequests;
    self->_userPushTokenRegRequests = v6;

    id v4 = v8;
    userPushTokenRegRequests = self->_userPushTokenRegRequests;
  }
  [(NSMutableArray *)userPushTokenRegRequests addObject:v4];
}

- (unint64_t)userPushTokenRegRequestsCount
{
  return [(NSMutableArray *)self->_userPushTokenRegRequests count];
}

- (id)userPushTokenRegRequestsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userPushTokenRegRequests objectAtIndex:a3];
}

+ (Class)userPushTokenRegRequestsType
{
  return (Class)objc_opt_class();
}

- (void)setRequestTtl:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestTtl = a3;
}

- (void)setHasRequestTtl:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestTtl
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoBatchRegisterReq;
  id v4 = [(PDSProtoBatchRegisterReq *)&v8 description];
  v5 = [(PDSProtoBatchRegisterReq *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_userPushTokenRegRequests count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_userPushTokenRegRequests, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_userPushTokenRegRequests;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"user_push_token_reg_requests"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithLongLong:self->_requestTtl];
    [v3 setObject:v11 forKey:@"request_ttl"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoBatchRegisterReqReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_userPushTokenRegRequests;
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
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(PDSProtoBatchRegisterReq *)self userPushTokenRegRequestsCount])
  {
    [v8 clearUserPushTokenRegRequests];
    unint64_t v4 = [(PDSProtoBatchRegisterReq *)self userPushTokenRegRequestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PDSProtoBatchRegisterReq *)self userPushTokenRegRequestsAtIndex:i];
        [v8 addUserPushTokenRegRequests:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = self->_requestTtl;
    *((unsigned char *)v8 + 24) |= 1u;
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
  uint64_t v6 = self->_userPushTokenRegRequests;
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
        [(id)v5 addUserPushTokenRegRequests:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_requestTtl;
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
  userPushTokenRegRequests = self->_userPushTokenRegRequests;
  if ((unint64_t)userPushTokenRegRequests | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](userPushTokenRegRequests, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_requestTtl == *((void *)v4 + 1))
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
  uint64_t v3 = [(NSMutableArray *)self->_userPushTokenRegRequests hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_requestTtl;
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
  id v5 = *((id *)v4 + 2);
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
        -[PDSProtoBatchRegisterReq addUserPushTokenRegRequests:](self, "addUserPushTokenRegRequests:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_requestTtl = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)userPushTokenRegRequests
{
  return self->_userPushTokenRegRequests;
}

- (void)setUserPushTokenRegRequests:(id)a3
{
}

- (int64_t)requestTtl
{
  return self->_requestTtl;
}

- (void).cxx_destruct
{
}

@end