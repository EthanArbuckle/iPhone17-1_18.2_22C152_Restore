@interface IFTSchemaIFTQueryStepResults
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasOriginProgramStatementId;
- (BOOL)hasQueryResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTQueryResults)queryResults;
- (IFTSchemaIFTQueryStepResults)initWithDictionary:(id)a3;
- (IFTSchemaIFTQueryStepResults)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)originProgramStatementId;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteOriginProgramStatementId;
- (void)deleteQueryResults;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasOriginProgramStatementId:(BOOL)a3;
- (void)setHasQueryResults:(BOOL)a3;
- (void)setOriginProgramStatementId:(id)a3;
- (void)setQueryResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTQueryStepResults

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTQueryStepResults;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTQueryStepResults *)self deleteOriginProgramStatementId];
  }
  v9 = [(IFTSchemaIFTQueryStepResults *)self queryResults];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTQueryStepResults *)self deleteQueryResults];
  }

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
  objc_storeStrong((id *)&self->_queryResults, 0);
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
}

- (void)setHasQueryResults:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setQueryResults:(id)a3
{
}

- (IFTSchemaIFTQueryResults)queryResults
{
  return self->_queryResults;
}

- (void)setOriginProgramStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)originProgramStatementId
{
  return self->_originProgramStatementId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTQueryStepResults)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTQueryStepResults;
  v5 = [(IFTSchemaIFTQueryStepResults *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTQueryStepResults setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"originProgramStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v7];
      [(IFTSchemaIFTQueryStepResults *)v5 setOriginProgramStatementId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"queryResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTQueryResults alloc] initWithDictionary:v9];
      [(IFTSchemaIFTQueryStepResults *)v5 setQueryResults:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (IFTSchemaIFTQueryStepResults)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTQueryStepResults *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTQueryStepResults *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTQueryStepResults exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_originProgramStatementId)
  {
    v5 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"originProgramStatementId"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"originProgramStatementId"];
    }
  }
  if (self->_queryResults)
  {
    int v8 = [(IFTSchemaIFTQueryStepResults *)self queryResults];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"queryResults"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"queryResults"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
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
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_originProgramStatementId hash] ^ v3;
  return v4 ^ [(IFTSchemaIFTQueryResults *)self->_queryResults hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  v6 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];
  uint64_t v7 = [v4 originProgramStatementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];
    int v11 = [v4 originProgramStatementId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTQueryStepResults *)self queryResults];
  uint64_t v7 = [v4 queryResults];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(IFTSchemaIFTQueryStepResults *)self queryResults];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTQueryStepResults *)self queryResults];
    v16 = [v4 queryResults];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];

  if (v4)
  {
    v5 = [(IFTSchemaIFTQueryStepResults *)self originProgramStatementId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTQueryStepResults *)self queryResults];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(IFTSchemaIFTQueryStepResults *)self queryResults];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTQueryStepResultsReadFrom(self, (uint64_t)a3);
}

- (void)deleteQueryResults
{
}

- (BOOL)hasQueryResults
{
  return self->_queryResults != 0;
}

- (void)deleteOriginProgramStatementId
{
}

- (BOOL)hasOriginProgramStatementId
{
  return self->_originProgramStatementId != 0;
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