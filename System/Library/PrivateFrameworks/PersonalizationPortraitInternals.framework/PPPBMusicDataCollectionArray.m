@interface PPPBMusicDataCollectionArray
+ (Class)experimentalGroupsType;
+ (Class)recordsType;
+ (id)options;
- (BOOL)hasAssetVersion;
- (BOOL)hasHasMusicSubscription;
- (BOOL)hasMusicSubscription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)experimentalGroups;
- (NSMutableArray)records;
- (NSString)assetVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)experimentalGroupsAtIndex:(unint64_t)a3;
- (id)recordsAtIndex:(unint64_t)a3;
- (unint64_t)experimentalGroupsCount;
- (unint64_t)hash;
- (unint64_t)recordsCount;
- (void)addExperimentalGroups:(id)a3;
- (void)addRecords:(id)a3;
- (void)clearExperimentalGroups;
- (void)clearRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setExperimentalGroups:(id)a3;
- (void)setHasHasMusicSubscription:(BOOL)a3;
- (void)setHasMusicSubscription:(BOOL)a3;
- (void)setRecords:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBMusicDataCollectionArray

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_experimentalGroups, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setExperimentalGroups:(id)a3
{
}

- (NSMutableArray)experimentalGroups
{
  return self->_experimentalGroups;
}

- (BOOL)hasMusicSubscription
{
  return self->_hasMusicSubscription;
}

- (void)setRecords:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 3);
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
        [(PPPBMusicDataCollectionArray *)self addRecords:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 36))
  {
    self->_hasMusicSubscription = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 2);
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
        -[PPPBMusicDataCollectionArray addExperimentalGroups:](self, "addExperimentalGroups:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 1)) {
    -[PPPBMusicDataCollectionArray setAssetVersion:](self, "setAssetVersion:");
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_records hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_hasMusicSubscription;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_experimentalGroups hash];
  return v5 ^ v6 ^ [(NSString *)self->_assetVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  records = self->_records;
  if ((unint64_t)records | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](records, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_hasMusicSubscription)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_16;
  }
LABEL_12:
  experimentalGroups = self->_experimentalGroups;
  if ((unint64_t)experimentalGroups | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](experimentalGroups, "isEqual:"))
  {
    goto LABEL_16;
  }
  assetVersion = self->_assetVersion;
  if ((unint64_t)assetVersion | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](assetVersion, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_17:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_records;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addRecords:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_hasMusicSubscription;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = self->_experimentalGroups;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (void)v21);
        [(id)v5 addExperimentalGroups:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_assetVersion copyWithZone:a3];
  long long v19 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v18;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = a3;
  if ([(PPPBMusicDataCollectionArray *)self recordsCount])
  {
    [v12 clearRecords];
    unint64_t v4 = [(PPPBMusicDataCollectionArray *)self recordsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PPPBMusicDataCollectionArray *)self recordsAtIndex:i];
        [v12 addRecords:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v12[32] = self->_hasMusicSubscription;
    v12[36] |= 1u;
  }
  if ([(PPPBMusicDataCollectionArray *)self experimentalGroupsCount])
  {
    [v12 clearExperimentalGroups];
    unint64_t v8 = [(PPPBMusicDataCollectionArray *)self experimentalGroupsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PPPBMusicDataCollectionArray *)self experimentalGroupsAtIndex:j];
        [v12 addExperimentalGroups:v11];
      }
    }
  }
  if (self->_assetVersion) {
    objc_msgSend(v12, "setAssetVersion:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_records;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_experimentalGroups;
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

  if (self->_assetVersion) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBMusicDataCollectionArrayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_records count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    unint64_t v5 = self->_records;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"records"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = [NSNumber numberWithBool:self->_hasMusicSubscription];
    [v3 setObject:v11 forKey:@"hasMusicSubscription"];
  }
  if ([(NSMutableArray *)self->_experimentalGroups count])
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_experimentalGroups, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = self->_experimentalGroups;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"experimentalGroups"];
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v3 setObject:assetVersion forKey:@"assetVersion"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBMusicDataCollectionArray;
  id v4 = [(PPPBMusicDataCollectionArray *)&v8 description];
  unint64_t v5 = [(PPPBMusicDataCollectionArray *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (id)experimentalGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_experimentalGroups objectAtIndex:a3];
}

- (unint64_t)experimentalGroupsCount
{
  return [(NSMutableArray *)self->_experimentalGroups count];
}

- (void)addExperimentalGroups:(id)a3
{
  id v4 = a3;
  experimentalGroups = self->_experimentalGroups;
  id v8 = v4;
  if (!experimentalGroups)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_experimentalGroups;
    self->_experimentalGroups = v6;

    id v4 = v8;
    experimentalGroups = self->_experimentalGroups;
  }
  [(NSMutableArray *)experimentalGroups addObject:v4];
}

- (void)clearExperimentalGroups
{
}

- (BOOL)hasHasMusicSubscription
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasHasMusicSubscription:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHasMusicSubscription:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hasMusicSubscription = a3;
}

- (id)recordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_records objectAtIndex:a3];
}

- (unint64_t)recordsCount
{
  return [(NSMutableArray *)self->_records count];
}

- (void)addRecords:(id)a3
{
  id v4 = a3;
  records = self->_records;
  id v8 = v4;
  if (!records)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_records;
    self->_records = v6;

    id v4 = v8;
    records = self->_records;
  }
  [(NSMutableArray *)records addObject:v4];
}

- (void)clearRecords
{
}

+ (Class)experimentalGroupsType
{
  return (Class)objc_opt_class();
}

+ (Class)recordsType
{
  return (Class)objc_opt_class();
}

+ (id)options
{
  if (options_once_6751 != -1) {
    dispatch_once(&options_once_6751, &__block_literal_global_6752);
  }
  v2 = (void *)options_sOptions_6753;
  return v2;
}

void __39__PPPBMusicDataCollectionArray_options__block_invoke()
{
  v0 = (void *)options_sOptions_6753;
  options_sOptions_6753 = (uint64_t)&unk_1F256B078;
}

@end