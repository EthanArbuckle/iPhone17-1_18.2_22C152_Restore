@interface ODMSiriSchemaODMSiriCountsReported
- (BOOL)hasAggregationInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)siriCounts;
- (NSData)jsonData;
- (ODMSiriSchemaODMSiriAggregationInterval)aggregationInterval;
- (ODMSiriSchemaODMSiriCountsReported)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriCountsReported)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)siriCountsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)siriCountsCount;
- (void)addSiriCounts:(id)a3;
- (void)clearSiriCounts;
- (void)deleteAggregationInterval;
- (void)setAggregationInterval:(id)a3;
- (void)setHasAggregationInterval:(BOOL)a3;
- (void)setSiriCounts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriCountsReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriCountsReported;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODMSiriSchemaODMSiriCountsReported *)self deleteAggregationInterval];
  }
  v9 = [(ODMSiriSchemaODMSiriCountsReported *)self siriCounts];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ODMSiriSchemaODMSiriCountsReported *)self setSiriCounts:v10];

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
  objc_storeStrong((id *)&self->_siriCounts, 0);
  objc_storeStrong((id *)&self->_aggregationInterval, 0);
}

- (void)setHasAggregationInterval:(BOOL)a3
{
  self->_hasAggregationInterval = a3;
}

- (void)setSiriCounts:(id)a3
{
}

- (NSArray)siriCounts
{
  return self->_siriCounts;
}

- (void)setAggregationInterval:(id)a3
{
}

- (ODMSiriSchemaODMSiriAggregationInterval)aggregationInterval
{
  return self->_aggregationInterval;
}

- (ODMSiriSchemaODMSiriCountsReported)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ODMSiriSchemaODMSiriCountsReported;
  v5 = [(ODMSiriSchemaODMSiriCountsReported *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aggregationInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODMSiriSchemaODMSiriAggregationInterval alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMSiriCountsReported *)v5 setAggregationInterval:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[ODMSiriSchemaODMSiriCounts alloc] initWithDictionary:v14];
              [(ODMSiriSchemaODMSiriCountsReported *)v5 addSiriCounts:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriCountsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriCountsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriCountsReported *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_aggregationInterval)
  {
    id v4 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aggregationInterval"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aggregationInterval"];
    }
  }
  if ([(NSArray *)self->_siriCounts count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v8 = self->_siriCounts;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"siriCounts"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODMSiriSchemaODMSiriAggregationInterval *)self->_aggregationInterval hash];
  return [(NSArray *)self->_siriCounts hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];
  v6 = [v4 aggregationInterval];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];
    uint64_t v10 = [v4 aggregationInterval];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODMSiriSchemaODMSiriCountsReported *)self siriCounts];
  v6 = [v4 siriCounts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ODMSiriSchemaODMSiriCountsReported *)self siriCounts];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ODMSiriSchemaODMSiriCountsReported *)self siriCounts];
    v15 = [v4 siriCounts];
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
  v5 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];

  if (v5)
  {
    v6 = [(ODMSiriSchemaODMSiriCountsReported *)self aggregationInterval];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_siriCounts;
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
        PBDataWriterWriteSubmessage();
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
  return ODMSiriSchemaODMSiriCountsReportedReadFrom(self, (uint64_t)a3);
}

- (id)siriCountsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_siriCounts objectAtIndexedSubscript:a3];
}

- (unint64_t)siriCountsCount
{
  return [(NSArray *)self->_siriCounts count];
}

- (void)addSiriCounts:(id)a3
{
  id v4 = a3;
  siriCounts = self->_siriCounts;
  id v8 = v4;
  if (!siriCounts)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_siriCounts;
    self->_siriCounts = v6;

    id v4 = v8;
    siriCounts = self->_siriCounts;
  }
  [(NSArray *)siriCounts addObject:v4];
}

- (void)clearSiriCounts
{
}

- (void)deleteAggregationInterval
{
}

- (BOOL)hasAggregationInterval
{
  return self->_aggregationInterval != 0;
}

@end