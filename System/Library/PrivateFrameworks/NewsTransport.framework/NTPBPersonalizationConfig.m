@interface NTPBPersonalizationConfig
+ (Class)personalizationBucketsType;
+ (Class)personalizationTreatmentsType;
- (BOOL)hasBinningConfig;
- (BOOL)hasDefaultPersonalizationTreatment;
- (BOOL)hasModuloForHashing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)personalizationBuckets;
- (NSMutableArray)personalizationTreatments;
- (NTPBBinningConfig)binningConfig;
- (NTPBPersonalizationTreatment)defaultPersonalizationTreatment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)personalizationBucketsAtIndex:(unint64_t)a3;
- (id)personalizationTreatmentsAtIndex:(unint64_t)a3;
- (int64_t)moduloForHashing;
- (unint64_t)hash;
- (unint64_t)personalizationBucketsCount;
- (unint64_t)personalizationTreatmentsCount;
- (void)addPersonalizationBuckets:(id)a3;
- (void)addPersonalizationTreatments:(id)a3;
- (void)clearPersonalizationBuckets;
- (void)clearPersonalizationTreatments;
- (void)mergeFrom:(id)a3;
- (void)setBinningConfig:(id)a3;
- (void)setDefaultPersonalizationTreatment:(id)a3;
- (void)setHasModuloForHashing:(BOOL)a3;
- (void)setModuloForHashing:(int64_t)a3;
- (void)setPersonalizationBuckets:(id)a3;
- (void)setPersonalizationTreatments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationConfig

- (BOOL)hasBinningConfig
{
  return self->_binningConfig != 0;
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

- (BOOL)hasDefaultPersonalizationTreatment
{
  return self->_defaultPersonalizationTreatment != 0;
}

- (void)clearPersonalizationBuckets
{
}

- (void)addPersonalizationBuckets:(id)a3
{
  id v4 = a3;
  personalizationBuckets = self->_personalizationBuckets;
  id v8 = v4;
  if (!personalizationBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_personalizationBuckets;
    self->_personalizationBuckets = v6;

    id v4 = v8;
    personalizationBuckets = self->_personalizationBuckets;
  }
  [(NSMutableArray *)personalizationBuckets addObject:v4];
}

- (unint64_t)personalizationBucketsCount
{
  return [(NSMutableArray *)self->_personalizationBuckets count];
}

- (id)personalizationBucketsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_personalizationBuckets objectAtIndex:a3];
}

+ (Class)personalizationBucketsType
{
  return (Class)objc_opt_class();
}

- (void)clearPersonalizationTreatments
{
}

- (void)addPersonalizationTreatments:(id)a3
{
  id v4 = a3;
  personalizationTreatments = self->_personalizationTreatments;
  id v8 = v4;
  if (!personalizationTreatments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_personalizationTreatments;
    self->_personalizationTreatments = v6;

    id v4 = v8;
    personalizationTreatments = self->_personalizationTreatments;
  }
  [(NSMutableArray *)personalizationTreatments addObject:v4];
}

- (unint64_t)personalizationTreatmentsCount
{
  return [(NSMutableArray *)self->_personalizationTreatments count];
}

- (id)personalizationTreatmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_personalizationTreatments objectAtIndex:a3];
}

+ (Class)personalizationTreatmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPersonalizationConfig;
  id v4 = [(NTPBPersonalizationConfig *)&v8 description];
  v5 = [(NTPBPersonalizationConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  binningConfig = self->_binningConfig;
  if (binningConfig)
  {
    v5 = [(NTPBBinningConfig *)binningConfig dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"binning_config"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_moduloForHashing];
    [v3 setObject:v6 forKey:@"modulo_for_hashing"];
  }
  defaultPersonalizationTreatment = self->_defaultPersonalizationTreatment;
  if (defaultPersonalizationTreatment)
  {
    objc_super v8 = [(NTPBPersonalizationTreatment *)defaultPersonalizationTreatment dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"default_personalization_treatment"];
  }
  if ([(NSMutableArray *)self->_personalizationBuckets count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_personalizationBuckets, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v10 = self->_personalizationBuckets;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"personalization_buckets"];
  }
  if ([(NSMutableArray *)self->_personalizationTreatments count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_personalizationTreatments, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = self->_personalizationTreatments;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"personalization_treatments"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_binningConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_defaultPersonalizationTreatment) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_personalizationBuckets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_personalizationTreatments;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBBinningConfig *)self->_binningConfig copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_moduloForHashing;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v8 = [(NTPBPersonalizationTreatment *)self->_defaultPersonalizationTreatment copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v10 = self->_personalizationBuckets;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v14) copyWithZone:a3];
        [(id)v5 addPersonalizationBuckets:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_personalizationTreatments;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [(id)v5 addPersonalizationTreatments:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  binningConfig = self->_binningConfig;
  if ((unint64_t)binningConfig | *((void *)v4 + 2))
  {
    if (!-[NTPBBinningConfig isEqual:](binningConfig, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_moduloForHashing != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  defaultPersonalizationTreatment = self->_defaultPersonalizationTreatment;
  if ((unint64_t)defaultPersonalizationTreatment | *((void *)v4 + 3)
    && !-[NTPBPersonalizationTreatment isEqual:](defaultPersonalizationTreatment, "isEqual:"))
  {
    goto LABEL_15;
  }
  personalizationBuckets = self->_personalizationBuckets;
  if ((unint64_t)personalizationBuckets | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](personalizationBuckets, "isEqual:")) {
      goto LABEL_15;
    }
  }
  personalizationTreatments = self->_personalizationTreatments;
  if ((unint64_t)personalizationTreatments | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](personalizationTreatments, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBBinningConfig *)self->_binningConfig hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_moduloForHashing;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(NTPBPersonalizationTreatment *)self->_defaultPersonalizationTreatment hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSMutableArray *)self->_personalizationBuckets hash];
  return v7 ^ [(NSMutableArray *)self->_personalizationTreatments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  binningConfig = self->_binningConfig;
  uint64_t v6 = *((void *)v4 + 2);
  if (binningConfig)
  {
    if (v6) {
      -[NTPBBinningConfig mergeFrom:](binningConfig, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPersonalizationConfig setBinningConfig:](self, "setBinningConfig:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_moduloForHashing = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  defaultPersonalizationTreatment = self->_defaultPersonalizationTreatment;
  uint64_t v8 = *((void *)v4 + 3);
  if (defaultPersonalizationTreatment)
  {
    if (v8) {
      -[NTPBPersonalizationTreatment mergeFrom:](defaultPersonalizationTreatment, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBPersonalizationConfig setDefaultPersonalizationTreatment:](self, "setDefaultPersonalizationTreatment:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 4);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NTPBPersonalizationConfig *)self addPersonalizationBuckets:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 5);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NTPBPersonalizationConfig addPersonalizationTreatments:](self, "addPersonalizationTreatments:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (NTPBBinningConfig)binningConfig
{
  return self->_binningConfig;
}

- (void)setBinningConfig:(id)a3
{
}

- (int64_t)moduloForHashing
{
  return self->_moduloForHashing;
}

- (NTPBPersonalizationTreatment)defaultPersonalizationTreatment
{
  return self->_defaultPersonalizationTreatment;
}

- (void)setDefaultPersonalizationTreatment:(id)a3
{
}

- (NSMutableArray)personalizationBuckets
{
  return self->_personalizationBuckets;
}

- (void)setPersonalizationBuckets:(id)a3
{
}

- (NSMutableArray)personalizationTreatments
{
  return self->_personalizationTreatments;
}

- (void)setPersonalizationTreatments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationTreatments, 0);
  objc_storeStrong((id *)&self->_personalizationBuckets, 0);
  objc_storeStrong((id *)&self->_defaultPersonalizationTreatment, 0);

  objc_storeStrong((id *)&self->_binningConfig, 0);
}

@end