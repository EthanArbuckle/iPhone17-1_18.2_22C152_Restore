@interface AWDCoreRoutineLMPScoreBoard
+ (Class)instancesType;
+ (Class)secondaryInstancesType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)instances;
- (NSMutableArray)secondaryInstances;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instancesAtIndex:(unint64_t)a3;
- (id)secondaryInstancesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)instancesCount;
- (unint64_t)secondaryInstancesCount;
- (unint64_t)timestamp;
- (void)addInstances:(id)a3;
- (void)addSecondaryInstances:(id)a3;
- (void)clearInstances;
- (void)clearSecondaryInstances;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstances:(id)a3;
- (void)setSecondaryInstances:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLMPScoreBoard

- (void)dealloc
{
  [(AWDCoreRoutineLMPScoreBoard *)self setInstances:0];
  [(AWDCoreRoutineLMPScoreBoard *)self setSecondaryInstances:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoard;
  [(AWDCoreRoutineLMPScoreBoard *)&v3 dealloc];
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

- (void)clearInstances
{
}

- (void)addInstances:(id)a3
{
  instances = self->_instances;
  if (!instances)
  {
    instances = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_instances = instances;
  }

  [(NSMutableArray *)instances addObject:a3];
}

- (unint64_t)instancesCount
{
  return [(NSMutableArray *)self->_instances count];
}

- (id)instancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_instances objectAtIndex:a3];
}

+ (Class)instancesType
{
  return (Class)objc_opt_class();
}

- (void)clearSecondaryInstances
{
}

- (void)addSecondaryInstances:(id)a3
{
  secondaryInstances = self->_secondaryInstances;
  if (!secondaryInstances)
  {
    secondaryInstances = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_secondaryInstances = secondaryInstances;
  }

  [(NSMutableArray *)secondaryInstances addObject:a3];
}

- (unint64_t)secondaryInstancesCount
{
  return [(NSMutableArray *)self->_secondaryInstances count];
}

- (id)secondaryInstancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_secondaryInstances objectAtIndex:a3];
}

+ (Class)secondaryInstancesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoard;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLMPScoreBoard description](&v3, sel_description), -[AWDCoreRoutineLMPScoreBoard dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_instances count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_instances, "count")];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    instances = self->_instances;
    uint64_t v6 = [(NSMutableArray *)instances countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(instances);
          }
          [v4 addObject:[*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)instances countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"instances"];
  }
  if ([(NSMutableArray *)self->_secondaryInstances count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_secondaryInstances, "count")];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    secondaryInstances = self->_secondaryInstances;
    uint64_t v12 = [(NSMutableArray *)secondaryInstances countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(secondaryInstances);
          }
          [v10 addObject:[*(id *)(*((void *)&v17 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)secondaryInstances countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"secondary_instances"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPScoreBoardReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  instances = self->_instances;
  uint64_t v5 = [(NSMutableArray *)instances countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(instances);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)instances countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  secondaryInstances = self->_secondaryInstances;
  uint64_t v10 = [(NSMutableArray *)secondaryInstances countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(secondaryInstances);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)secondaryInstances countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if ([(AWDCoreRoutineLMPScoreBoard *)self instancesCount])
  {
    [a3 clearInstances];
    unint64_t v5 = [(AWDCoreRoutineLMPScoreBoard *)self instancesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addInstances:-[AWDCoreRoutineLMPScoreBoard instancesAtIndex:](self, "instancesAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineLMPScoreBoard *)self secondaryInstancesCount])
  {
    [a3 clearSecondaryInstances];
    unint64_t v8 = [(AWDCoreRoutineLMPScoreBoard *)self secondaryInstancesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addSecondaryInstances:[[self secondaryInstancesAtIndex:j]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  instances = self->_instances;
  uint64_t v8 = [(NSMutableArray *)instances countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(instances);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [v6 addInstances:v12];
      }
      uint64_t v9 = [(NSMutableArray *)instances countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  secondaryInstances = self->_secondaryInstances;
  uint64_t v14 = [(NSMutableArray *)secondaryInstances countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(secondaryInstances);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * j) copyWithZone:a3];
        [v6 addSecondaryInstances:v18];
      }
      uint64_t v15 = [(NSMutableArray *)secondaryInstances countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
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
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    instances = self->_instances;
    if (!((unint64_t)instances | *((void *)a3 + 2))
      || (int v5 = -[NSMutableArray isEqual:](instances, "isEqual:")) != 0)
    {
      secondaryInstances = self->_secondaryInstances;
      if ((unint64_t)secondaryInstances | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](secondaryInstances, "isEqual:");
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
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_instances hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_secondaryInstances hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDCoreRoutineLMPScoreBoard *)self addInstances:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDCoreRoutineLMPScoreBoard *)self addSecondaryInstances:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
}

- (NSMutableArray)secondaryInstances
{
  return self->_secondaryInstances;
}

- (void)setSecondaryInstances:(id)a3
{
}

@end