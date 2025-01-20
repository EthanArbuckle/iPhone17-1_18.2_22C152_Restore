@interface UAFSchemaUAFAssetSetSubscription
- (BOOL)hasSubscriptionName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)assetSetIndices;
- (NSArray)assetSetUsages;
- (NSArray)usageAliases;
- (NSData)jsonData;
- (NSString)subscriptionName;
- (UAFSchemaUAFAssetSetSubscription)initWithDictionary:(id)a3;
- (UAFSchemaUAFAssetSetSubscription)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)assetSetUsagesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)usageAliasesAtIndex:(unint64_t)a3;
- (unint64_t)assetSetIndicesCount;
- (unint64_t)assetSetUsagesCount;
- (unint64_t)hash;
- (unint64_t)usageAliasesCount;
- (unsigned)assetSetIndicesAtIndex:(unint64_t)a3;
- (void)addAssetSetIndices:(unsigned int)a3;
- (void)addAssetSetUsages:(id)a3;
- (void)addUsageAliases:(id)a3;
- (void)clearAssetSetIndices;
- (void)clearAssetSetUsages;
- (void)clearUsageAliases;
- (void)deleteSubscriptionName;
- (void)setAssetSetIndices:(id)a3;
- (void)setAssetSetUsages:(id)a3;
- (void)setHasSubscriptionName:(BOOL)a3;
- (void)setSubscriptionName:(id)a3;
- (void)setUsageAliases:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAssetSetSubscription

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UAFSchemaUAFAssetSetSubscription;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetUsages];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(UAFSchemaUAFAssetSetSubscription *)self setAssetSetUsages:v7];

  v8 = [(UAFSchemaUAFAssetSetSubscription *)self usageAliases];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(UAFSchemaUAFAssetSetSubscription *)self setUsageAliases:v9];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageAliases, 0);
  objc_storeStrong((id *)&self->_assetSetUsages, 0);
  objc_storeStrong((id *)&self->_assetSetIndices, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
}

- (void)setHasSubscriptionName:(BOOL)a3
{
  self->_hasSubscriptionName = a3;
}

- (void)setUsageAliases:(id)a3
{
}

- (NSArray)usageAliases
{
  return self->_usageAliases;
}

- (void)setAssetSetUsages:(id)a3
{
}

- (NSArray)assetSetUsages
{
  return self->_assetSetUsages;
}

- (void)setAssetSetIndices:(id)a3
{
}

- (NSArray)assetSetIndices
{
  return self->_assetSetIndices;
}

- (void)setSubscriptionName:(id)a3
{
}

- (NSString)subscriptionName
{
  return self->_subscriptionName;
}

- (UAFSchemaUAFAssetSetSubscription)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)UAFSchemaUAFAssetSetSubscription;
  v5 = [(UAFSchemaUAFAssetSetSubscription *)&v48 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"subscriptionName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(UAFSchemaUAFAssetSetSubscription *)v5 setSubscriptionName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assetSetIndices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v6;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[UAFSchemaUAFAssetSetSubscription addAssetSetIndices:](v5, "addAssetSetIndices:", [v15 unsignedIntValue]);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v51 count:16];
        }
        while (v12);
      }

      v6 = v9;
    }
    v16 = [v4 objectForKeyedSubscript:@"assetSetUsages"];
    objc_opt_class();
    v35 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[UAFSchemaUAFAssetSetUsage alloc] initWithDictionary:v22];
              [(UAFSchemaUAFAssetSetSubscription *)v5 addAssetSetUsages:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v19);
      }

      v8 = v35;
    }
    v24 = [v4 objectForKeyedSubscript:@"usageAliases"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v6;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v49 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [[UAFSchemaUAFAssetUsageAlias alloc] initWithDictionary:v30];
              [(UAFSchemaUAFAssetSetSubscription *)v5 addUsageAliases:v31];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v49 count:16];
        }
        while (v27);
      }

      v6 = v34;
      v8 = v35;
    }
    v32 = v5;
  }
  return v5;
}

- (UAFSchemaUAFAssetSetSubscription)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAssetSetSubscription *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAssetSetSubscription *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_assetSetIndices count])
  {
    id v4 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetIndices];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetSetIndices"];
  }
  if ([(NSArray *)self->_assetSetUsages count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v7 = self->_assetSetUsages;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"assetSetUsages"];
  }
  if (self->_subscriptionName)
  {
    v14 = [(UAFSchemaUAFAssetSetSubscription *)self subscriptionName];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"subscriptionName"];
  }
  if ([(NSArray *)self->_usageAliases count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = self->_usageAliases;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (void)v25);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"usageAliases"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v25);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_subscriptionName hash];
  uint64_t v4 = [(NSArray *)self->_assetSetIndices hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_assetSetUsages hash];
  return v4 ^ v5 ^ [(NSArray *)self->_usageAliases hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(UAFSchemaUAFAssetSetSubscription *)self subscriptionName];
  v6 = [v4 subscriptionName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(UAFSchemaUAFAssetSetSubscription *)self subscriptionName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(UAFSchemaUAFAssetSetSubscription *)self subscriptionName];
    uint64_t v10 = [v4 subscriptionName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetIndices];
  v6 = [v4 assetSetIndices];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetIndices];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetIndices];
    v15 = [v4 assetSetIndices];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetUsages];
  v6 = [v4 assetSetUsages];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetUsages];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(UAFSchemaUAFAssetSetSubscription *)self assetSetUsages];
    uint64_t v20 = [v4 assetSetUsages];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(UAFSchemaUAFAssetSetSubscription *)self usageAliases];
  v6 = [v4 usageAliases];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(UAFSchemaUAFAssetSetSubscription *)self usageAliases];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(UAFSchemaUAFAssetSetSubscription *)self usageAliases];
    long long v25 = [v4 usageAliases];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UAFSchemaUAFAssetSetSubscription *)self subscriptionName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = self->_assetSetIndices;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v10) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v11 = self->_assetSetUsages;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v16 = self->_usageAliases;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetSubscriptionReadFrom(self, (uint64_t)a3);
}

- (id)usageAliasesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_usageAliases objectAtIndexedSubscript:a3];
}

- (unint64_t)usageAliasesCount
{
  return [(NSArray *)self->_usageAliases count];
}

- (void)addUsageAliases:(id)a3
{
  id v4 = a3;
  usageAliases = self->_usageAliases;
  id v8 = v4;
  if (!usageAliases)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_usageAliases;
    self->_usageAliases = v6;

    id v4 = v8;
    usageAliases = self->_usageAliases;
  }
  [(NSArray *)usageAliases addObject:v4];
}

- (void)clearUsageAliases
{
}

- (id)assetSetUsagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assetSetUsages objectAtIndexedSubscript:a3];
}

- (unint64_t)assetSetUsagesCount
{
  return [(NSArray *)self->_assetSetUsages count];
}

- (void)addAssetSetUsages:(id)a3
{
  id v4 = a3;
  assetSetUsages = self->_assetSetUsages;
  id v8 = v4;
  if (!assetSetUsages)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assetSetUsages;
    self->_assetSetUsages = v6;

    id v4 = v8;
    assetSetUsages = self->_assetSetUsages;
  }
  [(NSArray *)assetSetUsages addObject:v4];
}

- (void)clearAssetSetUsages
{
}

- (unsigned)assetSetIndicesAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_assetSetIndices objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)assetSetIndicesCount
{
  return [(NSArray *)self->_assetSetIndices count];
}

- (void)addAssetSetIndices:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  assetSetIndices = self->_assetSetIndices;
  if (!assetSetIndices)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assetSetIndices;
    self->_assetSetIndices = v6;

    assetSetIndices = self->_assetSetIndices;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)assetSetIndices addObject:v8];
}

- (void)clearAssetSetIndices
{
}

- (void)deleteSubscriptionName
{
}

- (BOOL)hasSubscriptionName
{
  return self->_subscriptionName != 0;
}

@end