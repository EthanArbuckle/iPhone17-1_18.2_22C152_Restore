@interface NTPBMultiABConfig
+ (Class)abConfigsType;
- (BOOL)hasDefaultConfig;
- (BOOL)hasModuloForHashing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)abConfigs;
- (NTPBConfig)defaultConfig;
- (id)abConfigsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)moduloForHashing;
- (unint64_t)abConfigsCount;
- (unint64_t)hash;
- (void)addAbConfigs:(id)a3;
- (void)clearAbConfigs;
- (void)mergeFrom:(id)a3;
- (void)setAbConfigs:(id)a3;
- (void)setDefaultConfig:(id)a3;
- (void)setHasModuloForHashing:(BOOL)a3;
- (void)setModuloForHashing:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBMultiABConfig

- (BOOL)hasDefaultConfig
{
  return self->_defaultConfig != 0;
}

- (void)setModuloForHashing:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_moduloForHashing = a3;
}

- (void)setHasModuloForHashing:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModuloForHashing
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAbConfigs
{
}

- (void)addAbConfigs:(id)a3
{
  id v4 = a3;
  abConfigs = self->_abConfigs;
  id v8 = v4;
  if (!abConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_abConfigs;
    self->_abConfigs = v6;

    id v4 = v8;
    abConfigs = self->_abConfigs;
  }
  [(NSMutableArray *)abConfigs addObject:v4];
}

- (unint64_t)abConfigsCount
{
  return [(NSMutableArray *)self->_abConfigs count];
}

- (id)abConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_abConfigs objectAtIndex:a3];
}

+ (Class)abConfigsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBMultiABConfig;
  id v4 = [(NTPBMultiABConfig *)&v8 description];
  v5 = [(NTPBMultiABConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  defaultConfig = self->_defaultConfig;
  if (defaultConfig)
  {
    v5 = [(NTPBConfig *)defaultConfig dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"default_config"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_moduloForHashing];
    [v3 setObject:v6 forKey:@"modulo_for_hashing"];
  }
  if ([(NSMutableArray *)self->_abConfigs count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_abConfigs, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_abConfigs;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"ab_configs"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMultiABConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_defaultConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_abConfigs;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBConfig *)self->_defaultConfig copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_moduloForHashing;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_abConfigs;
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
        [(id)v5 addAbConfigs:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  defaultConfig = self->_defaultConfig;
  if ((unint64_t)defaultConfig | *((void *)v4 + 3))
  {
    if (!-[NTPBConfig isEqual:](defaultConfig, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_moduloForHashing != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  abConfigs = self->_abConfigs;
  if ((unint64_t)abConfigs | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](abConfigs, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBConfig *)self->_defaultConfig hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_moduloForHashing;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSMutableArray *)self->_abConfigs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  defaultConfig = self->_defaultConfig;
  uint64_t v6 = *((void *)v4 + 3);
  if (defaultConfig)
  {
    if (v6) {
      -[NTPBConfig mergeFrom:](defaultConfig, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBMultiABConfig setDefaultConfig:](self, "setDefaultConfig:");
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_moduloForHashing = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
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
        -[NTPBMultiABConfig addAbConfigs:](self, "addAbConfigs:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NTPBConfig)defaultConfig
{
  return self->_defaultConfig;
}

- (void)setDefaultConfig:(id)a3
{
}

- (int64_t)moduloForHashing
{
  return self->_moduloForHashing;
}

- (NSMutableArray)abConfigs
{
  return self->_abConfigs;
}

- (void)setAbConfigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultConfig, 0);

  objc_storeStrong((id *)&self->_abConfigs, 0);
}

@end