@interface CAPContactFillerContactFillerEventForShare
+ (Class)shareEventsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)shareEvents;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)shareEventsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)shareEventsCount;
- (void)addShareEvents:(id)a3;
- (void)clearShareEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setShareEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAPContactFillerContactFillerEventForShare

- (void)clearShareEvents
{
}

- (void)addShareEvents:(id)a3
{
  id v4 = a3;
  shareEvents = self->_shareEvents;
  id v8 = v4;
  if (!shareEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_shareEvents;
    self->_shareEvents = v6;

    id v4 = v8;
    shareEvents = self->_shareEvents;
  }
  [(NSMutableArray *)shareEvents addObject:v4];
}

- (unint64_t)shareEventsCount
{
  return [(NSMutableArray *)self->_shareEvents count];
}

- (id)shareEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_shareEvents objectAtIndex:a3];
}

+ (Class)shareEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAPContactFillerContactFillerEventForShare;
  id v4 = [(CAPContactFillerContactFillerEventForShare *)&v8 description];
  v5 = [(CAPContactFillerContactFillerEventForShare *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  if ([(NSMutableArray *)self->_shareEvents count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_shareEvents, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_shareEvents;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"shareEvents"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CAPContactFillerContactFillerEventForShareReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_sessionId) {
    -[CAPContactFillerContactFillerEventForShare writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_shareEvents;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setSessionId:self->_sessionId];
  if ([(CAPContactFillerContactFillerEventForShare *)self shareEventsCount])
  {
    [v8 clearShareEvents];
    unint64_t v4 = [(CAPContactFillerContactFillerEventForShare *)self shareEventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CAPContactFillerContactFillerEventForShare *)self shareEventsAtIndex:i];
        [v8 addShareEvents:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionId copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_shareEvents;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addShareEvents:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sessionId = self->_sessionId, !((unint64_t)sessionId | v4[1]))
     || -[NSString isEqual:](sessionId, "isEqual:")))
  {
    shareEvents = self->_shareEvents;
    if ((unint64_t)shareEvents | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](shareEvents, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionId hash];
  return [(NSMutableArray *)self->_shareEvents hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[CAPContactFillerContactFillerEventForShare setSessionId:](self, "setSessionId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CAPContactFillerContactFillerEventForShare addShareEvents:](self, "addShareEvents:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSMutableArray)shareEvents
{
  return self->_shareEvents;
}

- (void)setShareEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareEvents, 0);

  objc_storeStrong((id *)&self->_sessionId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CAPContactFillerContactFillerEventForShare writeTo:]", "CAPContactFillerContactFillerEventForShare.m", 126, "nil != self->_sessionId");
}

@end