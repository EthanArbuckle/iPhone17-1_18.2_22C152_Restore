@interface NTPBNetworkSessionList
+ (Class)networkEventsType;
+ (Class)networkSessionsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)networkEvents;
- (NSMutableArray)networkSessions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkEventsAtIndex:(unint64_t)a3;
- (id)networkSessionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)networkEventsCount;
- (unint64_t)networkSessionsCount;
- (void)addNetworkEvents:(id)a3;
- (void)addNetworkSessions:(id)a3;
- (void)clearNetworkEvents;
- (void)clearNetworkSessions;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setNetworkEvents:(id)a3;
- (void)setNetworkSessions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNetworkSessionList

- (void)dealloc
{
  [(NTPBNetworkSessionList *)self setNetworkSessions:0];
  [(NTPBNetworkSessionList *)self setNetworkEvents:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkSessionList;
  [(NTPBNetworkSessionList *)&v3 dealloc];
}

- (void)setNetworkSessions:(id)a3
{
}

- (void)setNetworkEvents:(id)a3
{
}

- (void)addNetworkEvents:(id)a3
{
  networkEvents = self->_networkEvents;
  if (!networkEvents)
  {
    networkEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_networkEvents = networkEvents;
  }

  [(NSMutableArray *)networkEvents addObject:a3];
}

- (void)addNetworkSessions:(id)a3
{
  networkSessions = self->_networkSessions;
  if (!networkSessions)
  {
    networkSessions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_networkSessions = networkSessions;
  }

  [(NSMutableArray *)networkSessions addObject:a3];
}

- (NSMutableArray)networkSessions
{
  return self->_networkSessions;
}

- (NSMutableArray)networkEvents
{
  return self->_networkEvents;
}

- (void)clearNetworkSessions
{
}

- (unint64_t)networkSessionsCount
{
  return [(NSMutableArray *)self->_networkSessions count];
}

- (id)networkSessionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkSessions objectAtIndex:a3];
}

+ (Class)networkSessionsType
{
  return (Class)objc_opt_class();
}

- (void)clearNetworkEvents
{
}

- (unint64_t)networkEventsCount
{
  return [(NSMutableArray *)self->_networkEvents count];
}

- (id)networkEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkEvents objectAtIndex:a3];
}

+ (Class)networkEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkSessionList;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNetworkSessionList description](&v3, sel_description), -[NTPBNetworkSessionList dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_networkSessions count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_networkSessions, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    networkSessions = self->_networkSessions;
    uint64_t v6 = [(NSMutableArray *)networkSessions countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(networkSessions);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)networkSessions countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"network_sessions"];
  }
  if ([(NSMutableArray *)self->_networkEvents count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_networkEvents, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    networkEvents = self->_networkEvents;
    uint64_t v12 = [(NSMutableArray *)networkEvents countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(networkEvents);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)networkEvents countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"network_events"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkSessionListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  networkSessions = self->_networkSessions;
  uint64_t v5 = [(NSMutableArray *)networkSessions countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(networkSessions);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)networkSessions countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  networkEvents = self->_networkEvents;
  uint64_t v10 = [(NSMutableArray *)networkEvents countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(networkEvents);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)networkEvents countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  networkSessions = self->_networkSessions;
  uint64_t v7 = [(NSMutableArray *)networkSessions countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(networkSessions);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addNetworkSessions:v11];
      }
      uint64_t v8 = [(NSMutableArray *)networkSessions countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  networkEvents = self->_networkEvents;
  uint64_t v13 = [(NSMutableArray *)networkEvents countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(networkEvents);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [v5 addNetworkEvents:v17];
      }
      uint64_t v14 = [(NSMutableArray *)networkEvents countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    networkSessions = self->_networkSessions;
    if (!((unint64_t)networkSessions | *((void *)a3 + 2))
      || (int v5 = -[NSMutableArray isEqual:](networkSessions, "isEqual:")) != 0)
    {
      networkEvents = self->_networkEvents;
      if ((unint64_t)networkEvents | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](networkEvents, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_networkSessions hash];
  return [(NSMutableArray *)self->_networkEvents hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBNetworkSessionList *)self addNetworkSessions:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBNetworkSessionList *)self addNetworkEvents:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

@end