@interface IFTSchemaIFTSystemResponse
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasOutcome;
- (BOOL)hasStatementId;
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTStatementId)statementId;
- (IFTSchemaIFTStatementOutcome)outcome;
- (IFTSchemaIFTSystemResponse)initWithDictionary:(id)a3;
- (IFTSchemaIFTSystemResponse)initWithJSON:(id)a3;
- (NSArray)interpretedStatementResults;
- (NSData)jsonData;
- (NSString)toolId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)interpretedStatementResultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)interpretedStatementResultsCount;
- (void)addInterpretedStatementResults:(id)a3;
- (void)clearInterpretedStatementResults;
- (void)deleteExists;
- (void)deleteOutcome;
- (void)deleteStatementId;
- (void)deleteToolId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setInterpretedStatementResults:(id)a3;
- (void)setOutcome:(id)a3;
- (void)setStatementId:(id)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTSystemResponse

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTSystemResponse;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTSystemResponse *)self outcome];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTSystemResponse *)self deleteOutcome];
  }
  v9 = [(IFTSchemaIFTSystemResponse *)self statementId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTSystemResponse *)self deleteStatementId];
  }
  v12 = [(IFTSchemaIFTSystemResponse *)self interpretedStatementResults];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(IFTSchemaIFTSystemResponse *)self setInterpretedStatementResults:v13];

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
  objc_storeStrong((id *)&self->_interpretedStatementResults, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
}

- (void)setHasToolId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setInterpretedStatementResults:(id)a3
{
}

- (NSArray)interpretedStatementResults
{
  return self->_interpretedStatementResults;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setOutcome:(id)a3
{
}

- (IFTSchemaIFTStatementOutcome)outcome
{
  return self->_outcome;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTSystemResponse)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)IFTSchemaIFTSystemResponse;
  v5 = [(IFTSchemaIFTSystemResponse *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSystemResponse setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"outcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementOutcome alloc] initWithDictionary:v7];
      [(IFTSchemaIFTSystemResponse *)v5 setOutcome:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v9];
      [(IFTSchemaIFTSystemResponse *)v5 setStatementId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(IFTSchemaIFTSystemResponse *)v5 setToolId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"interpretedStatementResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v11;
      v24 = v7;
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[IFTSchemaIFTInterpretedStatementResult alloc] initWithDictionary:v19];
              [(IFTSchemaIFTSystemResponse *)v5 addInterpretedStatementResults:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v16);
      }

      v7 = v24;
      v6 = v25;
      int v11 = v23;
    }
    v21 = v5;
  }
  return v5;
}

- (IFTSchemaIFTSystemResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTSystemResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTSystemResponse *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSystemResponse exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if ([(NSArray *)self->_interpretedStatementResults count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = self->_interpretedStatementResults;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"interpretedStatementResults"];
  }
  if (self->_outcome)
  {
    v13 = [(IFTSchemaIFTSystemResponse *)self outcome];
    id v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"outcome"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"outcome"];
    }
  }
  if (self->_statementId)
  {
    uint64_t v16 = [(IFTSchemaIFTSystemResponse *)self statementId];
    uint64_t v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"statementId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"statementId"];
    }
  }
  if (self->_toolId)
  {
    uint64_t v19 = [(IFTSchemaIFTSystemResponse *)self toolId];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"toolId"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v22);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(IFTSchemaIFTStatementOutcome *)self->_outcome hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTStatementId *)self->_statementId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_toolId hash];
  return v6 ^ [(NSArray *)self->_interpretedStatementResults hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_25;
    }
  }
  NSUInteger v6 = [(IFTSchemaIFTSystemResponse *)self outcome];
  uint64_t v7 = [v4 outcome];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v8 = [(IFTSchemaIFTSystemResponse *)self outcome];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(IFTSchemaIFTSystemResponse *)self outcome];
    int v11 = [v4 outcome];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(IFTSchemaIFTSystemResponse *)self statementId];
  uint64_t v7 = [v4 statementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v13 = [(IFTSchemaIFTSystemResponse *)self statementId];
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = [(IFTSchemaIFTSystemResponse *)self statementId];
    uint64_t v16 = [v4 statementId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(IFTSchemaIFTSystemResponse *)self toolId];
  uint64_t v7 = [v4 toolId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(IFTSchemaIFTSystemResponse *)self toolId];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = [(IFTSchemaIFTSystemResponse *)self toolId];
    v21 = [v4 toolId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(IFTSchemaIFTSystemResponse *)self interpretedStatementResults];
  uint64_t v7 = [v4 interpretedStatementResults];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(IFTSchemaIFTSystemResponse *)self interpretedStatementResults];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    long long v24 = (void *)v23;
    long long v25 = [(IFTSchemaIFTSystemResponse *)self interpretedStatementResults];
    long long v26 = [v4 interpretedStatementResults];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v5 = [(IFTSchemaIFTSystemResponse *)self outcome];

  if (v5)
  {
    NSUInteger v6 = [(IFTSchemaIFTSystemResponse *)self outcome];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(IFTSchemaIFTSystemResponse *)self statementId];

  if (v7)
  {
    uint64_t v8 = [(IFTSchemaIFTSystemResponse *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v9 = [(IFTSchemaIFTSystemResponse *)self toolId];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_interpretedStatementResults;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSystemResponseReadFrom(self, (uint64_t)a3);
}

- (id)interpretedStatementResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_interpretedStatementResults objectAtIndexedSubscript:a3];
}

- (unint64_t)interpretedStatementResultsCount
{
  return [(NSArray *)self->_interpretedStatementResults count];
}

- (void)addInterpretedStatementResults:(id)a3
{
  id v4 = a3;
  interpretedStatementResults = self->_interpretedStatementResults;
  id v8 = v4;
  if (!interpretedStatementResults)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_interpretedStatementResults;
    self->_interpretedStatementResults = v6;

    id v4 = v8;
    interpretedStatementResults = self->_interpretedStatementResults;
  }
  [(NSArray *)interpretedStatementResults addObject:v4];
}

- (void)clearInterpretedStatementResults
{
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteStatementId
{
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteOutcome
{
}

- (BOOL)hasOutcome
{
  return self->_outcome != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end