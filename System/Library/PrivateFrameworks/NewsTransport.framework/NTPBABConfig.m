@interface NTPBABConfig
+ (Class)configBucketsType;
- (BOOL)hasConfigControl;
- (BOOL)hasPopulationCeiling;
- (BOOL)hasPopulationFloor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)configBuckets;
- (NTPBConfig)configControl;
- (id)configBucketsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)populationCeiling;
- (int64_t)populationFloor;
- (unint64_t)configBucketsCount;
- (unint64_t)hash;
- (void)addConfigBuckets:(id)a3;
- (void)clearConfigBuckets;
- (void)mergeFrom:(id)a3;
- (void)setConfigBuckets:(id)a3;
- (void)setConfigControl:(id)a3;
- (void)setHasPopulationCeiling:(BOOL)a3;
- (void)setHasPopulationFloor:(BOOL)a3;
- (void)setPopulationCeiling:(int64_t)a3;
- (void)setPopulationFloor:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBABConfig

- (void)setPopulationFloor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_populationFloor = a3;
}

- (void)setHasPopulationFloor:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPopulationFloor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPopulationCeiling:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_populationCeiling = a3;
}

- (void)setHasPopulationCeiling:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPopulationCeiling
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasConfigControl
{
  return self->_configControl != 0;
}

- (void)clearConfigBuckets
{
}

- (void)addConfigBuckets:(id)a3
{
  id v4 = a3;
  configBuckets = self->_configBuckets;
  id v8 = v4;
  if (!configBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_configBuckets;
    self->_configBuckets = v6;

    id v4 = v8;
    configBuckets = self->_configBuckets;
  }
  [(NSMutableArray *)configBuckets addObject:v4];
}

- (unint64_t)configBucketsCount
{
  return [(NSMutableArray *)self->_configBuckets count];
}

- (id)configBucketsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_configBuckets objectAtIndex:a3];
}

+ (Class)configBucketsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBABConfig;
  id v4 = [(NTPBABConfig *)&v8 description];
  v5 = [(NTPBABConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_populationFloor];
    [v3 setObject:v5 forKey:@"population_floor"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithLongLong:self->_populationCeiling];
    [v3 setObject:v6 forKey:@"population_ceiling"];
  }
  configControl = self->_configControl;
  if (configControl)
  {
    objc_super v8 = [(NTPBConfig *)configControl dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"config_control"];
  }
  if ([(NSMutableArray *)self->_configBuckets count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_configBuckets, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_configBuckets;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"config_buckets"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBABConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_configControl) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_configBuckets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_populationFloor;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_populationCeiling;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v8 = [(NTPBConfig *)self->_configControl copyWithZone:a3];
  uint64_t v9 = (void *)v6[4];
  v6[4] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_configBuckets;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [v6 addConfigBuckets:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_populationFloor != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_populationCeiling != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_16;
  }
  configControl = self->_configControl;
  if ((unint64_t)configControl | *((void *)v4 + 4) && !-[NTPBConfig isEqual:](configControl, "isEqual:")) {
    goto LABEL_16;
  }
  configBuckets = self->_configBuckets;
  if ((unint64_t)configBuckets | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](configBuckets, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_populationFloor;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_populationCeiling;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(NTPBConfig *)self->_configControl hash];
  return v5 ^ [(NSMutableArray *)self->_configBuckets hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (int64_t *)a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 2) != 0)
  {
    self->_populationFloor = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if (v6)
  {
    self->_populationCeiling = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  configControl = self->_configControl;
  uint64_t v8 = v5[4];
  if (configControl)
  {
    if (v8) {
      -[NTPBConfig mergeFrom:](configControl, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBABConfig setConfigControl:](self, "setConfigControl:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = (id)v5[3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NTPBABConfig addConfigBuckets:](self, "addConfigBuckets:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (int64_t)populationFloor
{
  return self->_populationFloor;
}

- (int64_t)populationCeiling
{
  return self->_populationCeiling;
}

- (NTPBConfig)configControl
{
  return self->_configControl;
}

- (void)setConfigControl:(id)a3
{
}

- (NSMutableArray)configBuckets
{
  return self->_configBuckets;
}

- (void)setConfigBuckets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configControl, 0);

  objc_storeStrong((id *)&self->_configBuckets, 0);
}

@end