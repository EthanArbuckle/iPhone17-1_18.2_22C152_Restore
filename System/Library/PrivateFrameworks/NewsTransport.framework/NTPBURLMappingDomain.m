@interface NTPBURLMappingDomain
+ (Class)pathsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)paths;
- (NSString)domain;
- (double)averageSafariVisitsPerDay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pathsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pathsCount;
- (void)addPaths:(id)a3;
- (void)clearPaths;
- (void)mergeFrom:(id)a3;
- (void)setAverageSafariVisitsPerDay:(double)a3;
- (void)setDomain:(id)a3;
- (void)setPaths:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBURLMappingDomain

- (NSString)domain
{
  return self->_domain;
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (double)averageSafariVisitsPerDay
{
  return self->_averageSafariVisitsPerDay;
}

- (void)addPaths:(id)a3
{
  id v4 = a3;
  paths = self->_paths;
  id v8 = v4;
  if (!paths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_paths;
    self->_paths = v6;

    id v4 = v8;
    paths = self->_paths;
  }
  [(NSMutableArray *)paths addObject:v4];
}

- (void)clearPaths
{
}

- (unint64_t)pathsCount
{
  return [(NSMutableArray *)self->_paths count];
}

- (id)pathsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paths objectAtIndex:a3];
}

+ (Class)pathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBURLMappingDomain;
  id v4 = [(NTPBURLMappingDomain *)&v8 description];
  v5 = [(NTPBURLMappingDomain *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if ([(NSMutableArray *)self->_paths count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_paths, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_paths;
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

    [v4 setObject:v6 forKey:@"paths"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithDouble:", self->_averageSafariVisitsPerDay, (void)v15);
  [v4 setObject:v13 forKey:@"average_safari_visits_per_day"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBURLMappingDomainReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_paths;
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

  PBDataWriterWriteDoubleField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_paths;
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
        [(id)v5 addPaths:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  *(double *)(v5 + 8) = self->_averageSafariVisitsPerDay;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | *((void *)v4 + 2)))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((paths = self->_paths, !((unint64_t)paths | *((void *)v4 + 3)))
     || -[NSMutableArray isEqual:](paths, "isEqual:"))
    && self->_averageSafariVisitsPerDay == *((double *)v4 + 1);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  uint64_t v4 = [(NSMutableArray *)self->_paths hash];
  double averageSafariVisitsPerDay = self->_averageSafariVisitsPerDay;
  double v6 = -averageSafariVisitsPerDay;
  if (averageSafariVisitsPerDay >= 0.0) {
    double v6 = self->_averageSafariVisitsPerDay;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  double v9 = fmod(v7, 1.84467441e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabs(v8);
  if (v8 >= 0.0) {
    unint64_t v12 = v11;
  }
  return v4 ^ v3 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NTPBURLMappingDomain setDomain:](self, "setDomain:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[NTPBURLMappingDomain addPaths:](self, "addPaths:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  self->_double averageSafariVisitsPerDay = *((double *)v4 + 1);
}

- (void)setDomain:(id)a3
{
}

- (void)setPaths:(id)a3
{
}

- (void)setAverageSafariVisitsPerDay:(double)a3
{
  self->_double averageSafariVisitsPerDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end