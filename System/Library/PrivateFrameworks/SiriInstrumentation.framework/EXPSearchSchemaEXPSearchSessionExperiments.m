@interface EXPSearchSchemaEXPSearchSessionExperiments
- (BOOL)hasSearchSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSearchSchemaEXPSearchSessionExperiments)initWithDictionary:(id)a3;
- (EXPSearchSchemaEXPSearchSessionExperiments)initWithJSON:(id)a3;
- (NSArray)activeExperiments;
- (NSData)jsonData;
- (SISchemaUUID)searchSessionId;
- (id)activeExperimentsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)activeExperimentsCount;
- (unint64_t)hash;
- (void)addActiveExperiments:(id)a3;
- (void)clearActiveExperiments;
- (void)deleteSearchSessionId;
- (void)setActiveExperiments:(id)a3;
- (void)setHasSearchSessionId:(BOOL)a3;
- (void)setSearchSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSearchSchemaEXPSearchSessionExperiments

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EXPSearchSchemaEXPSearchSessionExperiments;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(EXPSearchSchemaEXPSearchSessionExperiments *)self deleteSearchSessionId];
  }
  v9 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self activeExperiments];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(EXPSearchSchemaEXPSearchSessionExperiments *)self setActiveExperiments:v10];

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
  objc_storeStrong((id *)&self->_activeExperiments, 0);
  objc_storeStrong((id *)&self->_searchSessionId, 0);
}

- (void)setHasSearchSessionId:(BOOL)a3
{
  self->_hasSearchSessionId = a3;
}

- (void)setActiveExperiments:(id)a3
{
}

- (NSArray)activeExperiments
{
  return self->_activeExperiments;
}

- (void)setSearchSessionId:(id)a3
{
}

- (SISchemaUUID)searchSessionId
{
  return self->_searchSessionId;
}

- (EXPSearchSchemaEXPSearchSessionExperiments)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EXPSearchSchemaEXPSearchSessionExperiments;
  v5 = [(EXPSearchSchemaEXPSearchSessionExperiments *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(EXPSearchSchemaEXPSearchSessionExperiments *)v5 setSearchSessionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"activeExperiments"];
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
              v15 = [[EXPSchemaEXPTrialExperiment alloc] initWithDictionary:v14];
              [(EXPSearchSchemaEXPSearchSessionExperiments *)v5 addActiveExperiments:v15];
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

- (EXPSearchSchemaEXPSearchSessionExperiments)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSearchSchemaEXPSearchSessionExperiments *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_activeExperiments count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_activeExperiments;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"activeExperiments"];
  }
  if (self->_searchSessionId)
  {
    uint64_t v12 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"searchSessionId"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"searchSessionId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_searchSessionId hash];
  return [(NSArray *)self->_activeExperiments hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];
  uint64_t v6 = [v4 searchSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];
    uint64_t v10 = [v4 searchSessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self activeExperiments];
  uint64_t v6 = [v4 activeExperiments];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self activeExperiments];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self activeExperiments];
    v15 = [v4 activeExperiments];
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
  v5 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];

  if (v5)
  {
    uint64_t v6 = [(EXPSearchSchemaEXPSearchSessionExperiments *)self searchSessionId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_activeExperiments;
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
  return EXPSearchSchemaEXPSearchSessionExperimentsReadFrom(self, (uint64_t)a3);
}

- (id)activeExperimentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_activeExperiments objectAtIndexedSubscript:a3];
}

- (unint64_t)activeExperimentsCount
{
  return [(NSArray *)self->_activeExperiments count];
}

- (void)addActiveExperiments:(id)a3
{
  id v4 = a3;
  activeExperiments = self->_activeExperiments;
  id v8 = v4;
  if (!activeExperiments)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_activeExperiments;
    self->_activeExperiments = v6;

    id v4 = v8;
    activeExperiments = self->_activeExperiments;
  }
  [(NSArray *)activeExperiments addObject:v4];
}

- (void)clearActiveExperiments
{
}

- (void)deleteSearchSessionId
{
}

- (BOOL)hasSearchSessionId
{
  return self->_searchSessionId != 0;
}

@end