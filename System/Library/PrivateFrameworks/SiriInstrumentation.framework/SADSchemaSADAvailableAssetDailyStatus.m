@interface SADSchemaSADAvailableAssetDailyStatus
- (BOOL)hasStatusReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)assetSetStatus;
- (NSArray)namespaceStatus;
- (NSData)jsonData;
- (SADSchemaSADAvailableAssetDailyStatus)initWithDictionary:(id)a3;
- (SADSchemaSADAvailableAssetDailyStatus)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)assetSetStatusAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)namespaceStatusAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)statusReason;
- (unint64_t)assetSetStatusCount;
- (unint64_t)hash;
- (unint64_t)namespaceStatusCount;
- (void)addAssetSetStatus:(id)a3;
- (void)addNamespaceStatus:(id)a3;
- (void)clearAssetSetStatus;
- (void)clearNamespaceStatus;
- (void)deleteStatusReason;
- (void)setAssetSetStatus:(id)a3;
- (void)setHasStatusReason:(BOOL)a3;
- (void)setNamespaceStatus:(id)a3;
- (void)setStatusReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SADSchemaSADAvailableAssetDailyStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SADSchemaSADAvailableAssetDailyStatus;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(SADSchemaSADAvailableAssetDailyStatus *)self namespaceStatus];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SADSchemaSADAvailableAssetDailyStatus *)self setNamespaceStatus:v7];

  v8 = [(SADSchemaSADAvailableAssetDailyStatus *)self assetSetStatus];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(SADSchemaSADAvailableAssetDailyStatus *)self setAssetSetStatus:v9];
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
  objc_storeStrong((id *)&self->_assetSetStatus, 0);
  objc_storeStrong((id *)&self->_namespaceStatus, 0);
}

- (int)statusReason
{
  return self->_statusReason;
}

- (void)setAssetSetStatus:(id)a3
{
}

- (NSArray)assetSetStatus
{
  return self->_assetSetStatus;
}

- (void)setNamespaceStatus:(id)a3
{
}

- (NSArray)namespaceStatus
{
  return self->_namespaceStatus;
}

- (SADSchemaSADAvailableAssetDailyStatus)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SADSchemaSADAvailableAssetDailyStatus;
  v5 = [(SADSchemaSADAvailableAssetDailyStatus *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"namespaceStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v31;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[SADSchemaSADTrialNamespaceStatus alloc] initWithDictionary:v12];
              [(SADSchemaSADAvailableAssetDailyStatus *)v5 addNamespaceStatus:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"assetSetStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[UAFSchemaUAFAssetSetStatus alloc] initWithDictionary:v20];
              [(SADSchemaSADAvailableAssetDailyStatus *)v5 addAssetSetStatus:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v17);
      }

      v6 = v25;
    }
    v22 = [v4 objectForKeyedSubscript:@"statusReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADAvailableAssetDailyStatus setStatusReason:](v5, "setStatusReason:", [v22 intValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (SADSchemaSADAvailableAssetDailyStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SADSchemaSADAvailableAssetDailyStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SADSchemaSADAvailableAssetDailyStatus *)self dictionaryRepresentation];
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_assetSetStatus count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = self->_assetSetStatus;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"assetSetStatus"];
  }
  if ([(NSArray *)self->_namespaceStatus count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = self->_namespaceStatus;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (void)v23);
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
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"namespaceStatus"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v20 = [(SADSchemaSADAvailableAssetDailyStatus *)self statusReason] - 1;
    if (v20 > 3) {
      v21 = @"SADAVAILABLEASSETSTATUSREASON_UNKNOWN";
    }
    else {
      v21 = off_1E5EB4BD8[v20];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, @"statusReason", (void)v23);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v23);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_namespaceStatus hash];
  uint64_t v4 = [(NSArray *)self->_assetSetStatus hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_statusReason;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SADSchemaSADAvailableAssetDailyStatus *)self namespaceStatus];
  uint64_t v6 = [v4 namespaceStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SADSchemaSADAvailableAssetDailyStatus *)self namespaceStatus];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(SADSchemaSADAvailableAssetDailyStatus *)self namespaceStatus];
    uint64_t v10 = [v4 namespaceStatus];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SADSchemaSADAvailableAssetDailyStatus *)self assetSetStatus];
  uint64_t v6 = [v4 assetSetStatus];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SADSchemaSADAvailableAssetDailyStatus *)self assetSetStatus];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(SADSchemaSADAvailableAssetDailyStatus *)self assetSetStatus];
    uint64_t v15 = [v4 assetSetStatus];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int statusReason = self->_statusReason, statusReason == [v4 statusReason]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_namespaceStatus;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_assetSetStatus;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADAvailableAssetDailyStatusReadFrom(self, (uint64_t)a3);
}

- (void)deleteStatusReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatusReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatusReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int statusReason = a3;
}

- (id)assetSetStatusAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assetSetStatus objectAtIndexedSubscript:a3];
}

- (unint64_t)assetSetStatusCount
{
  return [(NSArray *)self->_assetSetStatus count];
}

- (void)addAssetSetStatus:(id)a3
{
  id v4 = a3;
  assetSetStatus = self->_assetSetStatus;
  id v8 = v4;
  if (!assetSetStatus)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assetSetStatus;
    self->_assetSetStatus = v6;

    id v4 = v8;
    assetSetStatus = self->_assetSetStatus;
  }
  [(NSArray *)assetSetStatus addObject:v4];
}

- (void)clearAssetSetStatus
{
}

- (id)namespaceStatusAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_namespaceStatus objectAtIndexedSubscript:a3];
}

- (unint64_t)namespaceStatusCount
{
  return [(NSArray *)self->_namespaceStatus count];
}

- (void)addNamespaceStatus:(id)a3
{
  id v4 = a3;
  namespaceStatus = self->_namespaceStatus;
  id v8 = v4;
  if (!namespaceStatus)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_namespaceStatus;
    self->_namespaceStatus = v6;

    id v4 = v8;
    namespaceStatus = self->_namespaceStatus;
  }
  [(NSArray *)namespaceStatus addObject:v4];
}

- (void)clearNamespaceStatus
{
}

@end