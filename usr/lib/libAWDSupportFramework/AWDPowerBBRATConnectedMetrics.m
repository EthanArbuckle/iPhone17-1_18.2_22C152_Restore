@interface AWDPowerBBRATConnectedMetrics
+ (Class)rATPowerType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rATPowers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rATPowerAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rATPowersCount;
- (unint64_t)timestamp;
- (void)addRATPower:(id)a3;
- (void)clearRATPowers;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRATPowers:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBBRATConnectedMetrics

- (void)dealloc
{
  [(AWDPowerBBRATConnectedMetrics *)self setRATPowers:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBRATConnectedMetrics;
  [(AWDPowerBBRATConnectedMetrics *)&v3 dealloc];
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

- (void)clearRATPowers
{
}

- (void)addRATPower:(id)a3
{
  rATPowers = self->_rATPowers;
  if (!rATPowers)
  {
    rATPowers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rATPowers = rATPowers;
  }

  [(NSMutableArray *)rATPowers addObject:a3];
}

- (unint64_t)rATPowersCount
{
  return [(NSMutableArray *)self->_rATPowers count];
}

- (id)rATPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rATPowers objectAtIndex:a3];
}

+ (Class)rATPowerType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBRATConnectedMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBBRATConnectedMetrics description](&v3, sel_description), -[AWDPowerBBRATConnectedMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_rATPowers count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rATPowers, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    rATPowers = self->_rATPowers;
    uint64_t v6 = [(NSMutableArray *)rATPowers countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(rATPowers);
          }
          [v4 addObject:[(*(id *)(*((void *)&v11 + 1) + 8 * v9++)) dictionaryRepresentation]];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)rATPowers countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"RATPower"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBRATConnectedMetricsReadFrom((uint64_t)self, (uint64_t)a3);
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
  rATPowers = self->_rATPowers;
  uint64_t v5 = [(NSMutableArray *)rATPowers countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(rATPowers);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)rATPowers countByEnumeratingWithState:&v9 objects:v13 count:16];
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
  if ([(AWDPowerBBRATConnectedMetrics *)self rATPowersCount])
  {
    [a3 clearRATPowers];
    unint64_t v5 = [(AWDPowerBBRATConnectedMetrics *)self rATPowersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRATPower:-[AWDPowerBBRATConnectedMetrics rATPowerAtIndex:](self, "rATPowerAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
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
  rATPowers = self->_rATPowers;
  uint64_t v8 = [(NSMutableArray *)rATPowers countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_enumerationMutation(rATPowers);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addRATPower:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)rATPowers countByEnumeratingWithState:&v14 objects:v18 count:16];
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
    rATPowers = self->_rATPowers;
    if ((unint64_t)rATPowers | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](rATPowers, "isEqual:");
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
  return [(NSMutableArray *)self->_rATPowers hash] ^ v2;
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
        [(AWDPowerBBRATConnectedMetrics *)self addRATPower:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
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

- (NSMutableArray)rATPowers
{
  return self->_rATPowers;
}

- (void)setRATPowers:(id)a3
{
}

@end