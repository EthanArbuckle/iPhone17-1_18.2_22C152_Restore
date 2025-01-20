@interface NTPBSessionBatch
+ (Class)eventsType;
- (BOOL)hasIdentifier;
- (BOOL)hasSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)identifier;
- (NSMutableArray)events;
- (NTPBSession)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventsAtIndex:(unint64_t)a3;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (void)addEvents:(id)a3;
- (void)clearEvents;
- (void)mergeFrom:(id)a3;
- (void)setEvents:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSession:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSessionBatch

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (void)clearEvents
{
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSessionBatch;
  id v4 = [(NTPBSessionBatch *)&v8 description];
  v5 = [(NTPBSessionBatch *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  session = self->_session;
  if (session)
  {
    v5 = [(NTPBSession *)session dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"session"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_events;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"events"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSessionBatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_session) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_events;
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

  if (self->_identifier) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBSession *)self->_session copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_events;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addEvents:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_identifier copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((session = self->_session, !((unint64_t)session | v4[3])) || -[NTPBSession isEqual:](session, "isEqual:"))
    && ((events = self->_events, !((unint64_t)events | v4[1]))
     || -[NSMutableArray isEqual:](events, "isEqual:")))
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[2]) {
      char v8 = -[NSData isEqual:](identifier, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBSession *)self->_session hash];
  uint64_t v4 = [(NSMutableArray *)self->_events hash] ^ v3;
  return v4 ^ [(NSData *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  session = self->_session;
  uint64_t v6 = *((void *)v4 + 3);
  if (session)
  {
    if (v6) {
      -[NTPBSession mergeFrom:](session, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBSessionBatch setSession:](self, "setSession:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NTPBSessionBatch addEvents:](self, "addEvents:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 2)) {
    -[NTPBSessionBatch setIdentifier:](self, "setIdentifier:");
  }
}

- (NTPBSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end