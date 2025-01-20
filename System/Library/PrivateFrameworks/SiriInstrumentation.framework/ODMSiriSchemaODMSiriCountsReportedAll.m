@interface ODMSiriSchemaODMSiriCountsReportedAll
- (BOOL)hasAggregationInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)segments;
- (NSArray)siriCountsAlls;
- (NSData)jsonData;
- (ODMSiriSchemaODMSiriAggregationInterval)aggregationInterval;
- (ODMSiriSchemaODMSiriCountsReportedAll)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriCountsReportedAll)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)siriCountsAllAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)segmentsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)segmentsCount;
- (unint64_t)siriCountsAllCount;
- (void)addSegments:(int)a3;
- (void)addSiriCountsAll:(id)a3;
- (void)clearSegments;
- (void)clearSiriCountsAll;
- (void)deleteAggregationInterval;
- (void)setAggregationInterval:(id)a3;
- (void)setHasAggregationInterval:(BOOL)a3;
- (void)setSegments:(id)a3;
- (void)setSiriCountsAlls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriCountsReportedAll

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriCountsReportedAll;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODMSiriSchemaODMSiriCountsReportedAll *)self deleteAggregationInterval];
  }
  v9 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self siriCountsAlls];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ODMSiriSchemaODMSiriCountsReportedAll *)self setSiriCountsAlls:v10];

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
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_siriCountsAlls, 0);
  objc_storeStrong((id *)&self->_aggregationInterval, 0);
}

- (void)setHasAggregationInterval:(BOOL)a3
{
  self->_hasAggregationInterval = a3;
}

- (void)setSegments:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSiriCountsAlls:(id)a3
{
}

- (NSArray)siriCountsAlls
{
  return self->_siriCountsAlls;
}

- (void)setAggregationInterval:(id)a3
{
}

- (ODMSiriSchemaODMSiriAggregationInterval)aggregationInterval
{
  return self->_aggregationInterval;
}

- (ODMSiriSchemaODMSiriCountsReportedAll)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ODMSiriSchemaODMSiriCountsReportedAll;
  v5 = [(ODMSiriSchemaODMSiriCountsReportedAll *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"aggregationInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODMSiriSchemaODMSiriAggregationInterval alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMSiriCountsReportedAll *)v5 setAggregationInterval:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriCountsAll"];
    objc_opt_class();
    v25 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[ODMSiriSchemaODMSiriCountsAll alloc] initWithDictionary:v14];
              [(ODMSiriSchemaODMSiriCountsReportedAll *)v5 addSiriCountsAll:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v11);
      }

      v6 = v25;
    }
    v16 = [v4 objectForKeyedSubscript:@"segments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ODMSiriSchemaODMSiriCountsReportedAll addSegments:](v5, "addSegments:", [v22 intValue]);
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v19);
      }

      v6 = v25;
    }
    v23 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriCountsReportedAll)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriCountsReportedAll *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self dictionaryRepresentation];
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
  if (self->_aggregationInterval)
  {
    id v4 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];
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
  if ([(NSArray *)self->_segments count])
  {
    uint64_t v7 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self segments];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"segments"];
  }
  if ([(NSArray *)self->_siriCountsAlls count])
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_siriCountsAlls;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"siriCountsAll"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODMSiriSchemaODMSiriAggregationInterval *)self->_aggregationInterval hash];
  uint64_t v4 = [(NSArray *)self->_siriCountsAlls hash] ^ v3;
  return v4 ^ [(NSArray *)self->_segments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];
  v6 = [v4 aggregationInterval];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];
  if (v7)
  {
    int v8 = (void *)v7;
    id v9 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];
    uint64_t v10 = [v4 aggregationInterval];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self siriCountsAlls];
  v6 = [v4 siriCountsAlls];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self siriCountsAlls];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self siriCountsAlls];
    v15 = [v4 siriCountsAlls];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self segments];
  v6 = [v4 segments];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self segments];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self segments];
    long long v20 = [v4 segments];
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
  v5 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];

  if (v5)
  {
    v6 = [(ODMSiriSchemaODMSiriCountsReportedAll *)self aggregationInterval];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_siriCountsAlls;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v12 = self->_segments;
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
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16), "intValue", (void)v17);
        PBDataWriterWriteInt32Field();
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
  return ODMSiriSchemaODMSiriCountsReportedAllReadFrom(self, (uint64_t)a3);
}

- (int)segmentsAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_segments objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)segmentsCount
{
  return [(NSArray *)self->_segments count];
}

- (void)addSegments:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  segments = self->_segments;
  if (!segments)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_segments;
    self->_segments = v6;

    segments = self->_segments;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)segments addObject:v8];
}

- (void)clearSegments
{
}

- (id)siriCountsAllAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_siriCountsAlls objectAtIndexedSubscript:a3];
}

- (unint64_t)siriCountsAllCount
{
  return [(NSArray *)self->_siriCountsAlls count];
}

- (void)addSiriCountsAll:(id)a3
{
  id v4 = a3;
  siriCountsAlls = self->_siriCountsAlls;
  id v8 = v4;
  if (!siriCountsAlls)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_siriCountsAlls;
    self->_siriCountsAlls = v6;

    id v4 = v8;
    siriCountsAlls = self->_siriCountsAlls;
  }
  [(NSArray *)siriCountsAlls addObject:v4];
}

- (void)clearSiriCountsAll
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