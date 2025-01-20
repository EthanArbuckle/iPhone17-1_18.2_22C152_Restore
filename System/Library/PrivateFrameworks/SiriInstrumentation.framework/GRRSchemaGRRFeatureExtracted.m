@interface GRRSchemaGRRFeatureExtracted
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRFeatureExtracted)initWithDictionary:(id)a3;
- (GRRSchemaGRRFeatureExtracted)initWithJSON:(id)a3;
- (GRRSchemaGRRSource)source;
- (NSArray)featureNames;
- (NSArray)features;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)featureNamesAtIndex:(unint64_t)a3;
- (id)featuresAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)featureNamesCount;
- (unint64_t)featuresCount;
- (unint64_t)hash;
- (void)addFeatureNames:(id)a3;
- (void)addFeatures:(id)a3;
- (void)clearFeatureNames;
- (void)clearFeatures;
- (void)deleteSource;
- (void)setFeatureNames:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRFeatureExtracted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GRRSchemaGRRFeatureExtracted;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(GRRSchemaGRRFeatureExtracted *)self source];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GRRSchemaGRRFeatureExtracted *)self deleteSource];
  }
  v9 = [(GRRSchemaGRRFeatureExtracted *)self features];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(GRRSchemaGRRFeatureExtracted *)self setFeatures:v10];

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
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)setHasSource:(BOOL)a3
{
  self->_hasSource = a3;
}

- (void)setFeatures:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatureNames:(id)a3
{
}

- (NSArray)featureNames
{
  return self->_featureNames;
}

- (void)setSource:(id)a3
{
}

- (GRRSchemaGRRSource)source
{
  return self->_source;
}

- (GRRSchemaGRRFeatureExtracted)initWithDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)GRRSchemaGRRFeatureExtracted;
  v5 = [(GRRSchemaGRRFeatureExtracted *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GRRSchemaGRRSource alloc] initWithDictionary:v6];
      [(GRRSchemaGRRFeatureExtracted *)v5 setSource:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"featureNames"];
    objc_opt_class();
    v26 = v8;
    v28 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = (void *)[v14 copy];
              [(GRRSchemaGRRFeatureExtracted *)v5 addFeatureNames:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v11);
      }

      int v8 = v26;
      v6 = v28;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"features", v26, v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[GRRSchemaGRRFeature alloc] initWithDictionary:v22];
              [(GRRSchemaGRRFeatureExtracted *)v5 addFeatures:v23];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v19);
      }

      int v8 = v27;
      v6 = v29;
    }
    v24 = v5;
  }
  return v5;
}

- (GRRSchemaGRRFeatureExtracted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRFeatureExtracted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRFeatureExtracted *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_featureNames)
  {
    id v4 = [(GRRSchemaGRRFeatureExtracted *)self featureNames];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"featureNames"];
  }
  if ([(NSArray *)self->_features count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_features;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
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
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"features"];
  }
  if (self->_source)
  {
    v14 = [(GRRSchemaGRRFeatureExtracted *)self source];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"source"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"source"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GRRSchemaGRRSource *)self->_source hash];
  uint64_t v4 = [(NSArray *)self->_featureNames hash] ^ v3;
  return v4 ^ [(NSArray *)self->_features hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(GRRSchemaGRRFeatureExtracted *)self source];
  v6 = [v4 source];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(GRRSchemaGRRFeatureExtracted *)self source];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(GRRSchemaGRRFeatureExtracted *)self source];
    uint64_t v10 = [v4 source];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(GRRSchemaGRRFeatureExtracted *)self featureNames];
  v6 = [v4 featureNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(GRRSchemaGRRFeatureExtracted *)self featureNames];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(GRRSchemaGRRFeatureExtracted *)self featureNames];
    v15 = [v4 featureNames];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(GRRSchemaGRRFeatureExtracted *)self features];
  v6 = [v4 features];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(GRRSchemaGRRFeatureExtracted *)self features];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(GRRSchemaGRRFeatureExtracted *)self features];
    long long v20 = [v4 features];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(GRRSchemaGRRFeatureExtracted *)self source];

  if (v5)
  {
    v6 = [(GRRSchemaGRRFeatureExtracted *)self source];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_featureNames;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_features;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRFeatureExtractedReadFrom(self, (uint64_t)a3);
}

- (id)featuresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_features objectAtIndexedSubscript:a3];
}

- (unint64_t)featuresCount
{
  return [(NSArray *)self->_features count];
}

- (void)addFeatures:(id)a3
{
  id v4 = a3;
  features = self->_features;
  id v8 = v4;
  if (!features)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_features;
    self->_features = v6;

    id v4 = v8;
    features = self->_features;
  }
  [(NSArray *)features addObject:v4];
}

- (void)clearFeatures
{
}

- (id)featureNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_featureNames objectAtIndexedSubscript:a3];
}

- (unint64_t)featureNamesCount
{
  return [(NSArray *)self->_featureNames count];
}

- (void)addFeatureNames:(id)a3
{
  id v4 = a3;
  featureNames = self->_featureNames;
  id v8 = v4;
  if (!featureNames)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_featureNames;
    self->_featureNames = v6;

    id v4 = v8;
    featureNames = self->_featureNames;
  }
  [(NSArray *)featureNames addObject:v4];
}

- (void)clearFeatureNames
{
}

- (void)deleteSource
{
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

@end