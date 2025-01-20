@interface USPSchemaUSPLoggingReported
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)metrics;
- (NSArray)sessionInfoItems;
- (NSData)jsonData;
- (USPSchemaUSPLoggingReported)initWithDictionary:(id)a3;
- (USPSchemaUSPLoggingReported)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)metricsAtIndex:(unint64_t)a3;
- (id)sessionInfoItemsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (unint64_t)sessionInfoItemsCount;
- (void)addMetrics:(id)a3;
- (void)addSessionInfoItems:(id)a3;
- (void)clearMetrics;
- (void)clearSessionInfoItems;
- (void)setMetrics:(id)a3;
- (void)setSessionInfoItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USPSchemaUSPLoggingReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)USPSchemaUSPLoggingReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(USPSchemaUSPLoggingReported *)self metrics];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(USPSchemaUSPLoggingReported *)self setMetrics:v7];

  v8 = [(USPSchemaUSPLoggingReported *)self sessionInfoItems];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(USPSchemaUSPLoggingReported *)self setSessionInfoItems:v9];
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
  objc_storeStrong((id *)&self->_sessionInfoItems, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

- (void)setSessionInfoItems:(id)a3
{
}

- (NSArray)sessionInfoItems
{
  return self->_sessionInfoItems;
}

- (void)setMetrics:(id)a3
{
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (USPSchemaUSPLoggingReported)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)USPSchemaUSPLoggingReported;
  v5 = [(USPSchemaUSPLoggingReported *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"metrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[USPSchemaUSPMetric alloc] initWithDictionary:v12];
              [(USPSchemaUSPLoggingReported *)v5 addMetrics:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"sessionInfoItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[USPSchemaUSPSessionInfoItem alloc] initWithDictionary:v20];
              [(USPSchemaUSPLoggingReported *)v5 addSessionInfoItems:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v17);
      }

      v6 = v24;
    }
    v22 = v5;
  }
  return v5;
}

- (USPSchemaUSPLoggingReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USPSchemaUSPLoggingReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USPSchemaUSPLoggingReported *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_metrics count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v5 = self->_metrics;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"metrics"];
  }
  if ([(NSArray *)self->_sessionInfoItems count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = self->_sessionInfoItems;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
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
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
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
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"sessionInfoItems"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_metrics hash];
  return [(NSArray *)self->_sessionInfoItems hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(USPSchemaUSPLoggingReported *)self metrics];
  uint64_t v6 = [v4 metrics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(USPSchemaUSPLoggingReported *)self metrics];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(USPSchemaUSPLoggingReported *)self metrics];
    uint64_t v10 = [v4 metrics];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(USPSchemaUSPLoggingReported *)self sessionInfoItems];
  uint64_t v6 = [v4 sessionInfoItems];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(USPSchemaUSPLoggingReported *)self sessionInfoItems];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    uint64_t v14 = [(USPSchemaUSPLoggingReported *)self sessionInfoItems];
    uint64_t v15 = [v4 sessionInfoItems];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_metrics;
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
  uint64_t v10 = self->_sessionInfoItems;
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
}

- (BOOL)readFrom:(id)a3
{
  return USPSchemaUSPLoggingReportedReadFrom(self, (uint64_t)a3);
}

- (id)sessionInfoItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sessionInfoItems objectAtIndexedSubscript:a3];
}

- (unint64_t)sessionInfoItemsCount
{
  return [(NSArray *)self->_sessionInfoItems count];
}

- (void)addSessionInfoItems:(id)a3
{
  id v4 = a3;
  sessionInfoItems = self->_sessionInfoItems;
  id v8 = v4;
  if (!sessionInfoItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sessionInfoItems;
    self->_sessionInfoItems = v6;

    id v4 = v8;
    sessionInfoItems = self->_sessionInfoItems;
  }
  [(NSArray *)sessionInfoItems addObject:v4];
}

- (void)clearSessionInfoItems
{
}

- (id)metricsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_metrics objectAtIndexedSubscript:a3];
}

- (unint64_t)metricsCount
{
  return [(NSArray *)self->_metrics count];
}

- (void)addMetrics:(id)a3
{
  id v4 = a3;
  metrics = self->_metrics;
  id v8 = v4;
  if (!metrics)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_metrics;
    self->_metrics = v6;

    id v4 = v8;
    metrics = self->_metrics;
  }
  [(NSArray *)metrics addObject:v4];
}

- (void)clearMetrics
{
}

@end