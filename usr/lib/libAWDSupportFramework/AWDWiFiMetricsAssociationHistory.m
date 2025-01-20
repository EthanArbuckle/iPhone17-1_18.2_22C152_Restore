@interface AWDWiFiMetricsAssociationHistory
+ (Class)associationEventsType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)associationEvents;
- (id)associationEventsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)associationEventsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addAssociationEvents:(id)a3;
- (void)clearAssociationEvents;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssociationEvents:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsAssociationHistory

- (void)dealloc
{
  [(AWDWiFiMetricsAssociationHistory *)self setAssociationEvents:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsAssociationHistory;
  [(AWDWiFiMetricsAssociationHistory *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAssociationEvents
{
}

- (void)addAssociationEvents:(id)a3
{
  associationEvents = self->_associationEvents;
  if (!associationEvents)
  {
    associationEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_associationEvents = associationEvents;
  }

  [(NSMutableArray *)associationEvents addObject:a3];
}

- (unint64_t)associationEventsCount
{
  return [(NSMutableArray *)self->_associationEvents count];
}

- (id)associationEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associationEvents objectAtIndex:a3];
}

+ (Class)associationEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsAssociationHistory;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsAssociationHistory description](&v3, sel_description), -[AWDWiFiMetricsAssociationHistory dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_associationEvents count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_associationEvents, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    associationEvents = self->_associationEvents;
    uint64_t v6 = [(NSMutableArray *)associationEvents countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(associationEvents);
          }
          [v4 addObject:[(*(id *)(*((void *)&v11 + 1) + 8 * v9++)) dictionaryRepresentation]];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)associationEvents countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"associationEvents"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsAssociationHistoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  associationEvents = self->_associationEvents;
  uint64_t v5 = [(NSMutableArray *)associationEvents countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(associationEvents);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)associationEvents countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  if ([(AWDWiFiMetricsAssociationHistory *)self associationEventsCount])
  {
    [a3 clearAssociationEvents];
    unint64_t v5 = [(AWDWiFiMetricsAssociationHistory *)self associationEventsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addAssociationEvents:-[AWDWiFiMetricsAssociationHistory associationEventsAtIndex:](self, "associationEventsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  associationEvents = self->_associationEvents;
  uint64_t v8 = [(NSMutableArray *)associationEvents countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(associationEvents);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addAssociationEvents:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)associationEvents countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    associationEvents = self->_associationEvents;
    if ((unint64_t)associationEvents | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](associationEvents, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_associationEvents hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 24))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = (void *)*((void *)a3 + 2);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AWDWiFiMetricsAssociationHistory *)self addAssociationEvents:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)associationEvents
{
  return self->_associationEvents;
}

- (void)setAssociationEvents:(id)a3
{
}

@end