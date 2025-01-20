@interface SADSchemaSADTrialNamespaceStatus
- (BOOL)hasNamespaceCompatabilityVersion;
- (BOOL)hasRollout;
- (BOOL)hasTrialNamespace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)assets;
- (NSData)jsonData;
- (SADSchemaSADTrialNamespaceStatus)initWithDictionary:(id)a3;
- (SADSchemaSADTrialNamespaceStatus)initWithJSON:(id)a3;
- (SADSchemaSADTrialRollout)rollout;
- (SISchemaVersion)namespaceCompatabilityVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)assetsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)trialNamespace;
- (unint64_t)assetsCount;
- (unint64_t)hash;
- (void)addAssets:(id)a3;
- (void)clearAssets;
- (void)deleteNamespaceCompatabilityVersion;
- (void)deleteRollout;
- (void)deleteTrialNamespace;
- (void)setAssets:(id)a3;
- (void)setHasNamespaceCompatabilityVersion:(BOOL)a3;
- (void)setHasRollout:(BOOL)a3;
- (void)setHasTrialNamespace:(BOOL)a3;
- (void)setNamespaceCompatabilityVersion:(id)a3;
- (void)setRollout:(id)a3;
- (void)setTrialNamespace:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SADSchemaSADTrialNamespaceStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SADSchemaSADTrialNamespaceStatus;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SADSchemaSADTrialNamespaceStatus *)self deleteNamespaceCompatabilityVersion];
  }
  v9 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SADSchemaSADTrialNamespaceStatus *)self deleteRollout];
  }
  v12 = [(SADSchemaSADTrialNamespaceStatus *)self assets];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(SADSchemaSADTrialNamespaceStatus *)self setAssets:v13];

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
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_rollout, 0);
  objc_storeStrong((id *)&self->_namespaceCompatabilityVersion, 0);
}

- (void)setHasRollout:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasNamespaceCompatabilityVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setRollout:(id)a3
{
}

- (SADSchemaSADTrialRollout)rollout
{
  return self->_rollout;
}

- (void)setNamespaceCompatabilityVersion:(id)a3
{
}

- (SISchemaVersion)namespaceCompatabilityVersion
{
  return self->_namespaceCompatabilityVersion;
}

- (SADSchemaSADTrialNamespaceStatus)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SADSchemaSADTrialNamespaceStatus;
  v5 = [(SADSchemaSADTrialNamespaceStatus *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"namespaceCompatabilityVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaVersion alloc] initWithDictionary:v6];
      [(SADSchemaSADTrialNamespaceStatus *)v5 setNamespaceCompatabilityVersion:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"rollout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SADSchemaSADTrialRollout alloc] initWithDictionary:v8];
      [(SADSchemaSADTrialNamespaceStatus *)v5 setRollout:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"assets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v8;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[SISchemaAsset alloc] initWithDictionary:v16];
              [(SADSchemaSADTrialNamespaceStatus *)v5 addAssets:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      int v8 = v21;
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"trialNamespace", v21, v22, (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADTrialNamespaceStatus setTrialNamespace:](v5, "setTrialNamespace:", [v18 intValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (SADSchemaSADTrialNamespaceStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SADSchemaSADTrialNamespaceStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SADSchemaSADTrialNamespaceStatus *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_assets count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = self->_assets;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"assets"];
  }
  if (self->_namespaceCompatabilityVersion)
  {
    uint64_t v12 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"namespaceCompatabilityVersion"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"namespaceCompatabilityVersion"];
    }
  }
  if (self->_rollout)
  {
    objc_super v15 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"rollout"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"rollout"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v18 = [(SADSchemaSADTrialNamespaceStatus *)self trialNamespace] - 1;
    if (v18 > 0xC) {
      v19 = @"SADNAMESPACE_UNKNOWN";
    }
    else {
      v19 = off_1E5EB4E20[v18];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, @"trialNamespace", (void)v21);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaVersion *)self->_namespaceCompatabilityVersion hash];
  unint64_t v4 = [(SADSchemaSADTrialRollout *)self->_rollout hash];
  uint64_t v5 = [(NSArray *)self->_assets hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_trialNamespace;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uint64_t v5 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];
  uint64_t v6 = [v4 namespaceCompatabilityVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];
    v10 = [v4 namespaceCompatabilityVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];
  uint64_t v6 = [v4 rollout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];
    objc_super v15 = [v4 rollout];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SADSchemaSADTrialNamespaceStatus *)self assets];
  uint64_t v6 = [v4 assets];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(SADSchemaSADTrialNamespaceStatus *)self assets];
  if (v17)
  {
    unsigned int v18 = (void *)v17;
    v19 = [(SADSchemaSADTrialNamespaceStatus *)self assets];
    v20 = [v4 assets];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int trialNamespace = self->_trialNamespace, trialNamespace == [v4 trialNamespace]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];

  if (v5)
  {
    uint64_t v6 = [(SADSchemaSADTrialNamespaceStatus *)self namespaceCompatabilityVersion];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];

  if (v7)
  {
    uint64_t v8 = [(SADSchemaSADTrialNamespaceStatus *)self rollout];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_assets;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADTrialNamespaceStatusReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrialNamespace
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTrialNamespace:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTrialNamespace
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTrialNamespace:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int trialNamespace = a3;
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (unint64_t)assetsCount
{
  return [(NSArray *)self->_assets count];
}

- (void)addAssets:(id)a3
{
  id v4 = a3;
  assets = self->_assets;
  id v8 = v4;
  if (!assets)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assets;
    self->_assets = v6;

    id v4 = v8;
    assets = self->_assets;
  }
  [(NSArray *)assets addObject:v4];
}

- (void)clearAssets
{
}

- (void)deleteRollout
{
}

- (BOOL)hasRollout
{
  return self->_rollout != 0;
}

- (void)deleteNamespaceCompatabilityVersion
{
}

- (BOOL)hasNamespaceCompatabilityVersion
{
  return self->_namespaceCompatabilityVersion != 0;
}

@end