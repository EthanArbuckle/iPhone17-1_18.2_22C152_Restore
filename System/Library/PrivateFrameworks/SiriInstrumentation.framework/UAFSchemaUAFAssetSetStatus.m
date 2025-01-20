@interface UAFSchemaUAFAssetSetStatus
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)allAssets;
- (NSArray)uafAssetSets;
- (NSArray)uafAssetSubscriptions;
- (NSData)jsonData;
- (UAFSchemaUAFAssetSetStatus)initWithDictionary:(id)a3;
- (UAFSchemaUAFAssetSetStatus)initWithJSON:(id)a3;
- (id)allAssetsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)uafAssetSetsAtIndex:(unint64_t)a3;
- (id)uafAssetSubscriptionsAtIndex:(unint64_t)a3;
- (unint64_t)allAssetsCount;
- (unint64_t)hash;
- (unint64_t)uafAssetSetsCount;
- (unint64_t)uafAssetSubscriptionsCount;
- (void)addAllAssets:(id)a3;
- (void)addUafAssetSets:(id)a3;
- (void)addUafAssetSubscriptions:(id)a3;
- (void)clearAllAssets;
- (void)clearUafAssetSets;
- (void)clearUafAssetSubscriptions;
- (void)setAllAssets:(id)a3;
- (void)setUafAssetSets:(id)a3;
- (void)setUafAssetSubscriptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAssetSetStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UAFSchemaUAFAssetSetStatus;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSets];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(UAFSchemaUAFAssetSetStatus *)self setUafAssetSets:v7];

  v8 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSubscriptions];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(UAFSchemaUAFAssetSetStatus *)self setUafAssetSubscriptions:v9];

  v10 = [(UAFSchemaUAFAssetSetStatus *)self allAssets];
  v11 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v10 underConditions:v4];

  [(UAFSchemaUAFAssetSetStatus *)self setAllAssets:v11];
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
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_uafAssetSubscriptions, 0);
  objc_storeStrong((id *)&self->_uafAssetSets, 0);
}

- (void)setAllAssets:(id)a3
{
}

- (NSArray)allAssets
{
  return self->_allAssets;
}

- (void)setUafAssetSubscriptions:(id)a3
{
}

- (NSArray)uafAssetSubscriptions
{
  return self->_uafAssetSubscriptions;
}

- (void)setUafAssetSets:(id)a3
{
}

- (NSArray)uafAssetSets
{
  return self->_uafAssetSets;
}

- (UAFSchemaUAFAssetSetStatus)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)UAFSchemaUAFAssetSetStatus;
  v5 = [(UAFSchemaUAFAssetSetStatus *)&v47 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"uafAssetSets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v44;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v44 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[UAFSchemaUAFAssetSet alloc] initWithDictionary:v13];
              [(UAFSchemaUAFAssetSetStatus *)v5 addUafAssetSets:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v15 = [v4 objectForKeyedSubscript:@"uafAssetSubscriptions"];
    objc_opt_class();
    v34 = v15;
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * v20);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[UAFSchemaUAFAssetSubscriberSubscriptions alloc] initWithDictionary:v21];
              [(UAFSchemaUAFAssetSetStatus *)v5 addUafAssetSubscriptions:v22];
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
        }
        while (v18);
      }

      v15 = v34;
    }
    v23 = [v4 objectForKeyedSubscript:@"allAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = v6;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v36;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * v28);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [[UAFSchemaUAFAssetMetadata alloc] initWithDictionary:v29];
              [(UAFSchemaUAFAssetSetStatus *)v5 addAllAssets:v30];
            }
            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v48 count:16];
        }
        while (v26);
      }

      v6 = v33;
      v15 = v34;
    }
    v31 = v5;
  }
  return v5;
}

- (UAFSchemaUAFAssetSetStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAssetSetStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAssetSetStatus *)self dictionaryRepresentation];
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
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_allAssets count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v5 = self->_allAssets;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"allAssets"];
  }
  if ([(NSArray *)self->_uafAssetSets count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v13 = self->_uafAssetSets;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"uafAssetSets"];
  }
  if ([(NSArray *)self->_uafAssetSubscriptions count])
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v21 = self->_uafAssetSubscriptions;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "dictionaryRepresentation", (void)v29);
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"uafAssetSubscriptions"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v29);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_uafAssetSets hash];
  uint64_t v4 = [(NSArray *)self->_uafAssetSubscriptions hash] ^ v3;
  return v4 ^ [(NSArray *)self->_allAssets hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSets];
  uint64_t v6 = [v4 uafAssetSets];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSets];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSets];
    uint64_t v10 = [v4 uafAssetSets];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSubscriptions];
  uint64_t v6 = [v4 uafAssetSubscriptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSubscriptions];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(UAFSchemaUAFAssetSetStatus *)self uafAssetSubscriptions];
    uint64_t v15 = [v4 uafAssetSubscriptions];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(UAFSchemaUAFAssetSetStatus *)self allAssets];
  uint64_t v6 = [v4 allAssets];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(UAFSchemaUAFAssetSetStatus *)self allAssets];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(UAFSchemaUAFAssetSetStatus *)self allAssets];
    uint64_t v20 = [v4 allAssets];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_uafAssetSets;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_uafAssetSubscriptions;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_allAssets;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetStatusReadFrom(self, (uint64_t)a3);
}

- (id)allAssetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_allAssets objectAtIndexedSubscript:a3];
}

- (unint64_t)allAssetsCount
{
  return [(NSArray *)self->_allAssets count];
}

- (void)addAllAssets:(id)a3
{
  id v4 = a3;
  allAssets = self->_allAssets;
  id v8 = v4;
  if (!allAssets)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_allAssets;
    self->_allAssets = v6;

    id v4 = v8;
    allAssets = self->_allAssets;
  }
  [(NSArray *)allAssets addObject:v4];
}

- (void)clearAllAssets
{
}

- (id)uafAssetSubscriptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_uafAssetSubscriptions objectAtIndexedSubscript:a3];
}

- (unint64_t)uafAssetSubscriptionsCount
{
  return [(NSArray *)self->_uafAssetSubscriptions count];
}

- (void)addUafAssetSubscriptions:(id)a3
{
  id v4 = a3;
  uafAssetSubscriptions = self->_uafAssetSubscriptions;
  id v8 = v4;
  if (!uafAssetSubscriptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_uafAssetSubscriptions;
    self->_uafAssetSubscriptions = v6;

    id v4 = v8;
    uafAssetSubscriptions = self->_uafAssetSubscriptions;
  }
  [(NSArray *)uafAssetSubscriptions addObject:v4];
}

- (void)clearUafAssetSubscriptions
{
}

- (id)uafAssetSetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_uafAssetSets objectAtIndexedSubscript:a3];
}

- (unint64_t)uafAssetSetsCount
{
  return [(NSArray *)self->_uafAssetSets count];
}

- (void)addUafAssetSets:(id)a3
{
  id v4 = a3;
  uafAssetSets = self->_uafAssetSets;
  id v8 = v4;
  if (!uafAssetSets)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_uafAssetSets;
    self->_uafAssetSets = v6;

    id v4 = v8;
    uafAssetSets = self->_uafAssetSets;
  }
  [(NSArray *)uafAssetSets addObject:v4];
}

- (void)clearUafAssetSets
{
}

@end