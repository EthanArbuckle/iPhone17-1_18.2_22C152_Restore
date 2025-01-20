@interface RRSchemaRREntityPoolResolveEnded
- (BOOL)hasOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)queryResults;
- (NSData)jsonData;
- (RRSchemaRREntityPoolResolveEnded)initWithDictionary:(id)a3;
- (RRSchemaRREntityPoolResolveEnded)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)queryResultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)outcome;
- (unint64_t)hash;
- (unint64_t)queryResultsCount;
- (void)addQueryResults:(id)a3;
- (void)clearQueryResults;
- (void)deleteOutcome;
- (void)setHasOutcome:(BOOL)a3;
- (void)setOutcome:(int)a3;
- (void)setQueryResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaRREntityPoolResolveEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RRSchemaRREntityPoolResolveEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(RRSchemaRREntityPoolResolveEnded *)self queryResults];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(RRSchemaRREntityPoolResolveEnded *)self setQueryResults:v7];
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
}

- (int)outcome
{
  return self->_outcome;
}

- (void)setQueryResults:(id)a3
{
}

- (NSArray)queryResults
{
  return self->_queryResults;
}

- (RRSchemaRREntityPoolResolveEnded)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RRSchemaRREntityPoolResolveEnded;
  v5 = [(RRSchemaRREntityPoolResolveEnded *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"queryResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [RRSchemaRRAnnotatedEntity alloc];
              v14 = -[RRSchemaRRAnnotatedEntity initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(RRSchemaRREntityPoolResolveEnded *)v5 addQueryResults:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"outcome", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaRREntityPoolResolveEnded setOutcome:](v5, "setOutcome:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (RRSchemaRREntityPoolResolveEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaRREntityPoolResolveEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaRREntityPoolResolveEnded *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(RRSchemaRREntityPoolResolveEnded *)self outcome] - 1;
    if (v4 > 3) {
      v5 = @"RRRESOLVEOUTCOME_UNKNOWN";
    }
    else {
      v5 = off_1E5EB49F0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"outcome"];
  }
  if ([(NSArray *)self->_queryResults count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_queryResults;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"queryResults"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_queryResults hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_outcome;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(RRSchemaRREntityPoolResolveEnded *)self queryResults];
  v6 = [v4 queryResults];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(RRSchemaRREntityPoolResolveEnded *)self queryResults];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(RRSchemaRREntityPoolResolveEnded *)self queryResults];
    uint64_t v11 = [v4 queryResults];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int outcome = self->_outcome;
    if (outcome != [v4 outcome]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_queryResults;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRREntityPoolResolveEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteOutcome
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOutcome:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutcome
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int outcome = a3;
}

- (id)queryResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_queryResults objectAtIndexedSubscript:a3];
}

- (unint64_t)queryResultsCount
{
  return [(NSArray *)self->_queryResults count];
}

- (void)addQueryResults:(id)a3
{
  id v4 = a3;
  queryResults = self->_queryResults;
  id v8 = v4;
  if (!queryResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_queryResults;
    self->_queryResults = v6;

    id v4 = v8;
    queryResults = self->_queryResults;
  }
  [(NSArray *)queryResults addObject:v4];
}

- (void)clearQueryResults
{
}

@end