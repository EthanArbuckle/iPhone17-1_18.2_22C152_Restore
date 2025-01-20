@interface NLXSchemaCDMSetupMissingAssetsDetected
- (BOOL)hasContextId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSetupMissingAssetsDetected)initWithDictionary:(id)a3;
- (NLXSchemaCDMSetupMissingAssetsDetected)initWithJSON:(id)a3;
- (NSArray)servicesMissingAssets;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)servicesMissingAssetAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)servicesMissingAssetCount;
- (void)addServicesMissingAsset:(int)a3;
- (void)clearServicesMissingAsset;
- (void)deleteContextId;
- (void)setContextId:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setServicesMissingAssets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSetupMissingAssetsDetected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMSetupMissingAssetsDetected;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMSetupMissingAssetsDetected *)self deleteContextId];
  }
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
  objc_storeStrong((id *)&self->_servicesMissingAssets, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (void)setServicesMissingAssets:(id)a3
{
}

- (NSArray)servicesMissingAssets
{
  return self->_servicesMissingAssets;
}

- (void)setContextId:(id)a3
{
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (NLXSchemaCDMSetupMissingAssetsDetected)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NLXSchemaCDMSetupMissingAssetsDetected;
  v5 = [(NLXSchemaCDMSetupMissingAssetsDetected *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMSetupMissingAssetsDetected *)v5 setContextId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"servicesMissingAsset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[NLXSchemaCDMSetupMissingAssetsDetected addServicesMissingAsset:](v5, "addServicesMissingAsset:", objc_msgSend(v14, "intValue", (void)v17));
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v11);
      }
    }
    v15 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSetupMissingAssetsDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSetupMissingAssetsDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_contextId)
  {
    id v4 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }
  if ([(NSArray *)self->_servicesMissingAssets count])
  {
    uint64_t v7 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self servicesMissingAssets];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"servicesMissingAsset"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_contextId hash];
  return [(NSArray *)self->_servicesMissingAssets hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];
  v6 = [v4 contextId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];
    uint64_t v10 = [v4 contextId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self servicesMissingAssets];
  v6 = [v4 servicesMissingAssets];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self servicesMissingAssets];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    v14 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self servicesMissingAssets];
    v15 = [v4 servicesMissingAssets];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];

  if (v5)
  {
    v6 = [(NLXSchemaCDMSetupMissingAssetsDetected *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_servicesMissingAssets;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "intValue", (void)v12);
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSetupMissingAssetsDetectedReadFrom(self, (uint64_t)a3);
}

- (int)servicesMissingAssetAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_servicesMissingAssets objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)servicesMissingAssetCount
{
  return [(NSArray *)self->_servicesMissingAssets count];
}

- (void)addServicesMissingAsset:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  servicesMissingAssets = self->_servicesMissingAssets;
  if (!servicesMissingAssets)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_servicesMissingAssets;
    self->_servicesMissingAssets = v6;

    servicesMissingAssets = self->_servicesMissingAssets;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)servicesMissingAssets addObject:v8];
}

- (void)clearServicesMissingAsset
{
}

- (void)deleteContextId
{
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

@end