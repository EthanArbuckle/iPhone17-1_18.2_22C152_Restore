@interface DODMLASRSchemaDODMLASRUtteranceInfo
- (BOOL)hasEndTimeInNs;
- (BOOL)hasStartTimeInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRUtteranceInfo)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRUtteranceInfo)initWithJSON:(id)a3;
- (NSArray)results;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)endTimeInNs;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (unint64_t)startTimeInNs;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)deleteEndTimeInNs;
- (void)deleteStartTimeInNs;
- (void)setEndTimeInNs:(unint64_t)a3;
- (void)setHasEndTimeInNs:(BOOL)a3;
- (void)setHasStartTimeInNs:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setStartTimeInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRUtteranceInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRUtteranceInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRUtteranceInfo *)self results];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(DODMLASRSchemaDODMLASRUtteranceInfo *)self setResults:v7];
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

- (unint64_t)endTimeInNs
{
  return self->_endTimeInNs;
}

- (unint64_t)startTimeInNs
{
  return self->_startTimeInNs;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (DODMLASRSchemaDODMLASRUtteranceInfo)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DODMLASRSchemaDODMLASRUtteranceInfo;
  v5 = [(DODMLASRSchemaDODMLASRUtteranceInfo *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"results"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [DODMLASRSchemaDODMLASRResultInfo alloc];
              v14 = -[DODMLASRSchemaDODMLASRResultInfo initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(DODMLASRSchemaDODMLASRUtteranceInfo *)v5 addResults:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"startTimeInNs", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRUtteranceInfo setStartTimeInNs:](v5, "setStartTimeInNs:", [v15 unsignedLongLongValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"endTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRUtteranceInfo setEndTimeInNs:](v5, "setEndTimeInNs:", [v16 unsignedLongLongValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRUtteranceInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRUtteranceInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRUtteranceInfo *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRUtteranceInfo endTimeInNs](self, "endTimeInNs"));
    [v3 setObject:v4 forKeyedSubscript:@"endTimeInNs"];
  }
  if ([(NSArray *)self->_results count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = self->_results;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation];
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"results"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRUtteranceInfo startTimeInNs](self, "startTimeInNs"));
    [v3 setObject:v13 forKeyedSubscript:@"startTimeInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_results hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_startTimeInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_endTimeInNs;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUtteranceInfo *)self results];
  v6 = [v4 results];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASRUtteranceInfo *)self results];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(DODMLASRSchemaDODMLASRUtteranceInfo *)self results];
    uint64_t v11 = [v4 results];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $F60B79F1AEB0D1197C1771A21EE4FA2C has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t startTimeInNs = self->_startTimeInNs;
    if (startTimeInNs == [v4 startTimeInNs])
    {
      $F60B79F1AEB0D1197C1771A21EE4FA2C has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    unint64_t endTimeInNs = self->_endTimeInNs;
    if (endTimeInNs != [v4 endTimeInNs]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRUtteranceInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEndTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t endTimeInNs = a3;
}

- (void)deleteStartTimeInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartTimeInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimeInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t startTimeInNs = a3;
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_results objectAtIndexedSubscript:a3];
}

- (unint64_t)resultsCount
{
  return [(NSArray *)self->_results count];
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSArray *)results addObject:v4];
}

- (void)clearResults
{
}

@end