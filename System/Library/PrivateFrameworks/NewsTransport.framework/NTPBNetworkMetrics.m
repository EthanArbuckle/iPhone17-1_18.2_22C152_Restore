@interface NTPBNetworkMetrics
+ (Class)failuresType;
+ (Class)successesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)failures;
- (NSMutableArray)successes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)failuresAtIndex:(unint64_t)a3;
- (id)successesAtIndex:(unint64_t)a3;
- (unint64_t)failuresCount;
- (unint64_t)hash;
- (unint64_t)successesCount;
- (void)addFailures:(id)a3;
- (void)addSuccesses:(id)a3;
- (void)clearFailures;
- (void)clearSuccesses;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFailures:(id)a3;
- (void)setSuccesses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNetworkMetrics

- (void)dealloc
{
  [(NTPBNetworkMetrics *)self setSuccesses:0];
  [(NTPBNetworkMetrics *)self setFailures:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkMetrics;
  [(NTPBNetworkMetrics *)&v3 dealloc];
}

- (void)clearSuccesses
{
}

- (void)addSuccesses:(id)a3
{
  successes = self->_successes;
  if (!successes)
  {
    successes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_successes = successes;
  }

  [(NSMutableArray *)successes addObject:a3];
}

- (unint64_t)successesCount
{
  return [(NSMutableArray *)self->_successes count];
}

- (id)successesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_successes objectAtIndex:a3];
}

+ (Class)successesType
{
  return (Class)objc_opt_class();
}

- (void)clearFailures
{
}

- (void)addFailures:(id)a3
{
  failures = self->_failures;
  if (!failures)
  {
    failures = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_failures = failures;
  }

  [(NSMutableArray *)failures addObject:a3];
}

- (unint64_t)failuresCount
{
  return [(NSMutableArray *)self->_failures count];
}

- (id)failuresAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_failures objectAtIndex:a3];
}

+ (Class)failuresType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNetworkMetrics description](&v3, sel_description), -[NTPBNetworkMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_successes count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_successes, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    successes = self->_successes;
    uint64_t v6 = [(NSMutableArray *)successes countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(successes);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)successes countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"successes"];
  }
  if ([(NSMutableArray *)self->_failures count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_failures, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    failures = self->_failures;
    uint64_t v12 = [(NSMutableArray *)failures countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(failures);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)failures countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"failures"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  successes = self->_successes;
  uint64_t v5 = [(NSMutableArray *)successes countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(successes);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)successes countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  failures = self->_failures;
  uint64_t v10 = [(NSMutableArray *)failures countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(failures);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)failures countByEnumeratingWithState:&v14 objects:v22 count:16];
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
  successes = self->_successes;
  uint64_t v7 = [(NSMutableArray *)successes countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(successes);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addSuccesses:v11];
      }
      uint64_t v8 = [(NSMutableArray *)successes countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  failures = self->_failures;
  uint64_t v13 = [(NSMutableArray *)failures countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(failures);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [v5 addFailures:v17];
      }
      uint64_t v14 = [(NSMutableArray *)failures countByEnumeratingWithState:&v19 objects:v27 count:16];
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
    successes = self->_successes;
    if (!((unint64_t)successes | *((void *)a3 + 2))
      || (int v5 = -[NSMutableArray isEqual:](successes, "isEqual:")) != 0)
    {
      failures = self->_failures;
      if ((unint64_t)failures | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](failures, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_successes hash];
  return [(NSMutableArray *)self->_failures hash] ^ v3;
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
        [(NTPBNetworkMetrics *)self addSuccesses:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
        [(NTPBNetworkMetrics *)self addFailures:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)successes
{
  return self->_successes;
}

- (void)setSuccesses:(id)a3
{
}

- (NSMutableArray)failures
{
  return self->_failures;
}

- (void)setFailures:(id)a3
{
}

@end