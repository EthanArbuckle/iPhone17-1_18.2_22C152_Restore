@interface PDSProtoBatchRegisterResp
+ (Class)userPushTokenRegResponsesType;
- (BOOL)hasMessage;
- (BOOL)hasResponseTtl;
- (BOOL)hasRetryInterval;
- (BOOL)hasServerTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)userPushTokenRegResponses;
- (NSString)message;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userPushTokenRegResponsesAtIndex:(unint64_t)a3;
- (int)status;
- (int64_t)responseTtl;
- (int64_t)retryInterval;
- (int64_t)serverTimestamp;
- (unint64_t)hash;
- (unint64_t)userPushTokenRegResponsesCount;
- (void)addUserPushTokenRegResponses:(id)a3;
- (void)clearUserPushTokenRegResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasResponseTtl:(BOOL)a3;
- (void)setHasRetryInterval:(BOOL)a3;
- (void)setHasServerTimestamp:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setResponseTtl:(int64_t)a3;
- (void)setRetryInterval:(int64_t)a3;
- (void)setServerTimestamp:(int64_t)a3;
- (void)setStatus:(int)a3;
- (void)setUserPushTokenRegResponses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoBatchRegisterResp

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)clearUserPushTokenRegResponses
{
}

- (void)addUserPushTokenRegResponses:(id)a3
{
  id v4 = a3;
  userPushTokenRegResponses = self->_userPushTokenRegResponses;
  id v8 = v4;
  if (!userPushTokenRegResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_userPushTokenRegResponses;
    self->_userPushTokenRegResponses = v6;

    id v4 = v8;
    userPushTokenRegResponses = self->_userPushTokenRegResponses;
  }
  [(NSMutableArray *)userPushTokenRegResponses addObject:v4];
}

- (unint64_t)userPushTokenRegResponsesCount
{
  return [(NSMutableArray *)self->_userPushTokenRegResponses count];
}

- (id)userPushTokenRegResponsesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userPushTokenRegResponses objectAtIndex:a3];
}

+ (Class)userPushTokenRegResponsesType
{
  return (Class)objc_opt_class();
}

- (void)setResponseTtl:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_responseTtl = a3;
}

- (void)setHasResponseTtl:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTtl
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRetryInterval:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_retryInterval = a3;
}

- (void)setHasRetryInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_serverTimestamp = a3;
}

- (void)setHasServerTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServerTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoBatchRegisterResp;
  id v4 = [(PDSProtoBatchRegisterResp *)&v8 description];
  v5 = [(PDSProtoBatchRegisterResp *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithInt:self->_status];
  [v3 setObject:v4 forKey:@"status"];

  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }
  if ([(NSMutableArray *)self->_userPushTokenRegResponses count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_userPushTokenRegResponses, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_userPushTokenRegResponses;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"user_push_token_reg_responses"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v16 = [NSNumber numberWithLongLong:self->_responseTtl];
    [v3 setObject:v16 forKey:@"response_ttl"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_14:
      if ((has & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_14;
  }
  v17 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_retryInterval, (void)v18);
  [v3 setObject:v17 forKey:@"retry_interval"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_15:
    v14 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_serverTimestamp, (void)v18);
    [v3 setObject:v14 forKey:@"server_timestamp"];
  }
LABEL_16:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoBatchRegisterRespReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_userPushTokenRegResponses;
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
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    PBDataWriterWriteInt64Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((has & 4) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt64Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  v9[10] = self->_status;
  if (self->_message) {
    objc_msgSend(v9, "setMessage:");
  }
  if ([(PDSProtoBatchRegisterResp *)self userPushTokenRegResponsesCount])
  {
    [v9 clearUserPushTokenRegResponses];
    unint64_t v4 = [(PDSProtoBatchRegisterResp *)self userPushTokenRegResponsesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PDSProtoBatchRegisterResp *)self userPushTokenRegResponsesAtIndex:i];
        [v9 addUserPushTokenRegResponses:v7];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v9 + 1) = self->_responseTtl;
    *((unsigned char *)v9 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v9 + 2) = self->_retryInterval;
  *((unsigned char *)v9 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((void *)v9 + 3) = self->_serverTimestamp;
    *((unsigned char *)v9 + 56) |= 4u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_status;
  uint64_t v6 = [(NSString *)self->_message copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_userPushTokenRegResponses;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addUserPushTokenRegResponses:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    *(void *)(v5 + 16) = self->_retryInterval;
    *(unsigned char *)(v5 + 56) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
  *(void *)(v5 + 8) = self->_responseTtl;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    *(void *)(v5 + 24) = self->_serverTimestamp;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (self->_status != *((_DWORD *)v4 + 10)) {
    goto LABEL_21;
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](message, "isEqual:")) {
      goto LABEL_21;
    }
  }
  userPushTokenRegResponses = self->_userPushTokenRegResponses;
  if ((unint64_t)userPushTokenRegResponses | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](userPushTokenRegResponses, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_responseTtl != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_21:
    BOOL v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_retryInterval != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_serverTimestamp != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
    BOOL v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t status = self->_status;
  NSUInteger v4 = [(NSString *)self->_message hash];
  uint64_t v5 = [(NSMutableArray *)self->_userPushTokenRegResponses hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 0;
    return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * status);
  }
  uint64_t v6 = 2654435761 * self->_responseTtl;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_retryInterval;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_serverTimestamp;
  return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * status);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_uint64_t status = *((_DWORD *)v4 + 10);
  if (*((void *)v4 + 4)) {
    -[PDSProtoBatchRegisterResp setMessage:](self, "setMessage:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[PDSProtoBatchRegisterResp addUserPushTokenRegResponses:](self, "addUserPushTokenRegResponses:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 56);
  if ((v10 & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    self->_retryInterval = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v4 + 56) & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  self->_responseTtl = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v10 = *((unsigned char *)v4 + 56);
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((v10 & 4) != 0)
  {
LABEL_13:
    self->_serverTimestamp = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_14:
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_uint64_t status = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSMutableArray)userPushTokenRegResponses
{
  return self->_userPushTokenRegResponses;
}

- (void)setUserPushTokenRegResponses:(id)a3
{
}

- (int64_t)responseTtl
{
  return self->_responseTtl;
}

- (int64_t)retryInterval
{
  return self->_retryInterval;
}

- (int64_t)serverTimestamp
{
  return self->_serverTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPushTokenRegResponses, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end