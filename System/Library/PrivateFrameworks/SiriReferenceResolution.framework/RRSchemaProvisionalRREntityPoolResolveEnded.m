@interface RRSchemaProvisionalRREntityPoolResolveEnded
- (BOOL)hasOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)queryResults;
- (NSData)jsonData;
- (RRSchemaProvisionalRREntityPoolResolveEnded)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRREntityPoolResolveEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)queryResultsAtIndex:(unint64_t)a3;
- (int)outcome;
- (unint64_t)hash;
- (unint64_t)queryResultsCount;
- (void)addQueryResults:(id)a3;
- (void)clearQueryResults;
- (void)setHasOutcome:(BOOL)a3;
- (void)setOutcome:(int)a3;
- (void)setQueryResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRREntityPoolResolveEnded

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

- (RRSchemaProvisionalRREntityPoolResolveEnded)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RRSchemaProvisionalRREntityPoolResolveEnded;
  v5 = [(RRSchemaProvisionalRREntityPoolResolveEnded *)&v22 init];
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
              v13 = [RRSchemaProvisionalRRAnnotatedEntity alloc];
              v14 = -[RRSchemaProvisionalRRAnnotatedEntity initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(RRSchemaProvisionalRREntityPoolResolveEnded *)v5 addQueryResults:v14];
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
      -[RRSchemaProvisionalRREntityPoolResolveEnded setOutcome:](v5, "setOutcome:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRREntityPoolResolveEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRREntityPoolResolveEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRREntityPoolResolveEnded *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(RRSchemaProvisionalRREntityPoolResolveEnded *)self outcome] - 1;
    if (v4 > 3) {
      v5 = @"RRRESOLVEOUTCOME_UNKNOWN";
    }
    else {
      v5 = off_264463658[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"outcome"];
  }
  if ([(NSArray *)self->_queryResults count])
  {
    v6 = [MEMORY[0x263EFF980] array];
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
            v13 = [MEMORY[0x263EFF9D0] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"queryResults"];
  }
  -[RRSchemaProvisionalRREntityPoolResolveEnded willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
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
  v5 = [(RRSchemaProvisionalRREntityPoolResolveEnded *)self queryResults];
  v6 = [v4 queryResults];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(RRSchemaProvisionalRREntityPoolResolveEnded *)self queryResults];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(RRSchemaProvisionalRREntityPoolResolveEnded *)self queryResults];
    uint64_t v11 = [v4 queryResults];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((v4[20] & 1) != (*(unsigned char *)&self->_has & 1)) {
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
  uint64_t v15 = *MEMORY[0x263EF8340];
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
  return RRSchemaProvisionalRREntityPoolResolveEndedReadFrom(self, (uint64_t)a3);
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
    uint64_t v6 = [MEMORY[0x263EFF980] array];
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