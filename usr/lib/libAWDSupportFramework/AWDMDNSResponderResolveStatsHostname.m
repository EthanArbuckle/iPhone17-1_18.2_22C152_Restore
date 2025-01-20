@interface AWDMDNSResponderResolveStatsHostname
+ (Class)resultType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)results;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (void)addResult:(id)a3;
- (void)clearResults;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMDNSResponderResolveStatsHostname

- (void)dealloc
{
  [(AWDMDNSResponderResolveStatsHostname *)self setName:0];
  [(AWDMDNSResponderResolveStatsHostname *)self setResults:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsHostname;
  [(AWDMDNSResponderResolveStatsHostname *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearResults
{
}

- (void)addResult:(id)a3
{
  results = self->_results;
  if (!results)
  {
    results = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_results = results;
  }

  [(NSMutableArray *)results addObject:a3];
}

- (unint64_t)resultsCount
{
  return [(NSMutableArray *)self->_results count];
}

- (id)resultAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_results objectAtIndex:a3];
}

+ (Class)resultType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsHostname;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMDNSResponderResolveStatsHostname description](&v3, sel_description), -[AWDMDNSResponderResolveStatsHostname dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_results count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_results, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    results = self->_results;
    uint64_t v8 = [(NSMutableArray *)results countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(results);
          }
          [v6 addObject:[*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)results countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v4 setObject:v6 forKey:@"result"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderResolveStatsHostnameReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  results = self->_results;
  uint64_t v5 = [(NSMutableArray *)results countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(results);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)results countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_name) {
    [a3 setName:];
  }
  if ([(AWDMDNSResponderResolveStatsHostname *)self resultsCount])
  {
    [a3 clearResults];
    unint64_t v5 = [(AWDMDNSResponderResolveStatsHostname *)self resultsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addResult:-[AWDMDNSResponderResolveStatsHostname resultAtIndex:](self, "resultAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[1] = (id)[(NSString *)self->_name copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  results = self->_results;
  uint64_t v7 = [(NSMutableArray *)results countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(results);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addResult:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)results countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      results = self->_results;
      if ((unint64_t)results | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](results, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSMutableArray *)self->_results hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 1)) {
    -[AWDMDNSResponderResolveStatsHostname setName:](self, "setName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
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
        [(AWDMDNSResponderResolveStatsHostname *)self addResult:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

@end