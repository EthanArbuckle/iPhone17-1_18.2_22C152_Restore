@interface CLPInstSchemaCLPCDMReplaySampleEnded
- (BOOL)hasIsReplaySuccessful;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplaySuccessful;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPCDMReplaySampleEnded)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPCDMReplaySampleEnded)initWithJSON:(id)a3;
- (NSArray)comparatorResults;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)comparatorResultsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)comparatorResultsCount;
- (unint64_t)hash;
- (void)addComparatorResults:(id)a3;
- (void)clearComparatorResults;
- (void)deleteIsReplaySuccessful;
- (void)setComparatorResults:(id)a3;
- (void)setHasIsReplaySuccessful:(BOOL)a3;
- (void)setIsReplaySuccessful:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPCDMReplaySampleEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLPInstSchemaCLPCDMReplaySampleEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPCDMReplaySampleEnded *)self comparatorResults];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(CLPInstSchemaCLPCDMReplaySampleEnded *)self setComparatorResults:v7];
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

- (void)setComparatorResults:(id)a3
{
}

- (NSArray)comparatorResults
{
  return self->_comparatorResults;
}

- (BOOL)isReplaySuccessful
{
  return self->_isReplaySuccessful;
}

- (CLPInstSchemaCLPCDMReplaySampleEnded)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLPInstSchemaCLPCDMReplaySampleEnded;
  v5 = [(CLPInstSchemaCLPCDMReplaySampleEnded *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isReplaySuccessful"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCDMReplaySampleEnded setIsReplaySuccessful:](v5, "setIsReplaySuccessful:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"comparatorResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[CLPInstSchemaServiceNodeComparatorResult alloc] initWithDictionary:v13];
              [(CLPInstSchemaCLPCDMReplaySampleEnded *)v5 addComparatorResults:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v10);
      }

      v6 = v17;
    }
    v15 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPCDMReplaySampleEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPCDMReplaySampleEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPCDMReplaySampleEnded *)self dictionaryRepresentation];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_comparatorResults count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_comparatorResults;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"comparatorResults"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPCDMReplaySampleEnded isReplaySuccessful](self, "isReplaySuccessful"));
    [v3 setObject:v12 forKeyedSubscript:@"isReplaySuccessful"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v14);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_isReplaySuccessful;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSArray *)self->_comparatorResults hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int isReplaySuccessful = self->_isReplaySuccessful,
            isReplaySuccessful == [v4 isReplaySuccessful]))
      {
        uint64_t v6 = [(CLPInstSchemaCLPCDMReplaySampleEnded *)self comparatorResults];
        uint64_t v7 = [v4 comparatorResults];
        uint64_t v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(CLPInstSchemaCLPCDMReplaySampleEnded *)self comparatorResults];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(CLPInstSchemaCLPCDMReplaySampleEnded *)self comparatorResults];
          uint64_t v12 = [v4 comparatorResults];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_comparatorResults;
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
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCDMReplaySampleEndedReadFrom(self, (uint64_t)a3);
}

- (id)comparatorResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_comparatorResults objectAtIndexedSubscript:a3];
}

- (unint64_t)comparatorResultsCount
{
  return [(NSArray *)self->_comparatorResults count];
}

- (void)addComparatorResults:(id)a3
{
  id v4 = a3;
  comparatorResults = self->_comparatorResults;
  id v8 = v4;
  if (!comparatorResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_comparatorResults;
    self->_comparatorResults = v6;

    id v4 = v8;
    comparatorResults = self->_comparatorResults;
  }
  [(NSArray *)comparatorResults addObject:v4];
}

- (void)clearComparatorResults
{
}

- (void)deleteIsReplaySuccessful
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsReplaySuccessful:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsReplaySuccessful
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsReplaySuccessful:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isReplaySuccessful = a3;
}

@end