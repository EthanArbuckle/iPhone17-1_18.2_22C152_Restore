@interface IFTSchemaIFTInterpretedStatementResult
- (BOOL)hasActionEventId;
- (BOOL)hasOriginProgramStatementId;
- (BOOL)hasOriginTaskStatementId;
- (BOOL)hasOutcome;
- (BOOL)hasResultStatementId;
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTInterpretedStatementResult)initWithDictionary:(id)a3;
- (IFTSchemaIFTInterpretedStatementResult)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)originProgramStatementId;
- (IFTSchemaIFTStatementId)originTaskStatementId;
- (IFTSchemaIFTStatementId)resultStatementId;
- (IFTSchemaIFTStatementOutcome)outcome;
- (NSData)jsonData;
- (NSString)toolId;
- (SISchemaUUID)actionEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteActionEventId;
- (void)deleteOriginProgramStatementId;
- (void)deleteOriginTaskStatementId;
- (void)deleteOutcome;
- (void)deleteResultStatementId;
- (void)deleteToolId;
- (void)setActionEventId:(id)a3;
- (void)setHasActionEventId:(BOOL)a3;
- (void)setHasOriginProgramStatementId:(BOOL)a3;
- (void)setHasOriginTaskStatementId:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setHasResultStatementId:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setOriginProgramStatementId:(id)a3;
- (void)setOriginTaskStatementId:(id)a3;
- (void)setOutcome:(id)a3;
- (void)setResultStatementId:(id)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTInterpretedStatementResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IFTSchemaIFTInterpretedStatementResult;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(IFTSchemaIFTInterpretedStatementResult *)self deleteToolId];
  }
  v6 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTInterpretedStatementResult *)self deleteOutcome];
  }
  v9 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTInterpretedStatementResult *)self deleteResultStatementId];
  }
  v12 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTInterpretedStatementResult *)self deleteOriginProgramStatementId];
  }
  v15 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTInterpretedStatementResult *)self deleteActionEventId];
  }
  v18 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTInterpretedStatementResult *)self deleteOriginTaskStatementId];
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
  objc_storeStrong((id *)&self->_originTaskStatementId, 0);
  objc_storeStrong((id *)&self->_actionEventId, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
  objc_storeStrong((id *)&self->_resultStatementId, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
}

- (void)setHasOriginTaskStatementId:(BOOL)a3
{
  self->_hasOriginTaskStatementId = a3;
}

- (void)setHasActionEventId:(BOOL)a3
{
  self->_hasActionEventId = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasToolId = a3;
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  self->_hasOriginProgramStatementId = a3;
}

- (void)setHasResultStatementId:(BOOL)a3
{
  self->_hasResultStatementId = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  self->_hasOutcome = a3;
}

- (void)setOriginTaskStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)originTaskStatementId
{
  return self->_originTaskStatementId;
}

- (void)setActionEventId:(id)a3
{
}

- (SISchemaUUID)actionEventId
{
  return self->_actionEventId;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setOriginProgramStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)originProgramStatementId
{
  return self->_originProgramStatementId;
}

- (void)setResultStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)resultStatementId
{
  return self->_resultStatementId;
}

- (void)setOutcome:(id)a3
{
}

- (IFTSchemaIFTStatementOutcome)outcome
{
  return self->_outcome;
}

- (IFTSchemaIFTInterpretedStatementResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IFTSchemaIFTInterpretedStatementResult;
  v5 = [(IFTSchemaIFTInterpretedStatementResult *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"outcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTStatementOutcome alloc] initWithDictionary:v6];
      [(IFTSchemaIFTInterpretedStatementResult *)v5 setOutcome:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v8];
      [(IFTSchemaIFTInterpretedStatementResult *)v5 setResultStatementId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"originProgramStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v10];
      [(IFTSchemaIFTInterpretedStatementResult *)v5 setOriginProgramStatementId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(IFTSchemaIFTInterpretedStatementResult *)v5 setToolId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"actionEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(IFTSchemaIFTInterpretedStatementResult *)v5 setActionEventId:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"originTaskStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v16];
      [(IFTSchemaIFTInterpretedStatementResult *)v5 setOriginTaskStatementId:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (IFTSchemaIFTInterpretedStatementResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTInterpretedStatementResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTInterpretedStatementResult *)self dictionaryRepresentation];
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
  if (self->_actionEventId)
  {
    id v4 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionEventId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionEventId"];
    }
  }
  if (self->_originProgramStatementId)
  {
    uint64_t v7 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"originProgramStatementId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"originProgramStatementId"];
    }
  }
  if (self->_originTaskStatementId)
  {
    v10 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"originTaskStatementId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"originTaskStatementId"];
    }
  }
  if (self->_outcome)
  {
    v13 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"outcome"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"outcome"];
    }
  }
  if (self->_resultStatementId)
  {
    v16 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"resultStatementId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"resultStatementId"];
    }
  }
  if (self->_toolId)
  {
    v19 = [(IFTSchemaIFTInterpretedStatementResult *)self toolId];
    objc_super v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"toolId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTStatementOutcome *)self->_outcome hash];
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_resultStatementId hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTStatementId *)self->_originProgramStatementId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_toolId hash];
  unint64_t v7 = [(SISchemaUUID *)self->_actionEventId hash];
  return v6 ^ v7 ^ [(IFTSchemaIFTStatementId *)self->_originTaskStatementId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];
  NSUInteger v6 = [v4 outcome];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];
    v10 = [v4 outcome];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];
  NSUInteger v6 = [v4 resultStatementId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];
    v15 = [v4 resultStatementId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];
  NSUInteger v6 = [v4 originProgramStatementId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];
    objc_super v20 = [v4 originProgramStatementId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self toolId];
  NSUInteger v6 = [v4 toolId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(IFTSchemaIFTInterpretedStatementResult *)self toolId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(IFTSchemaIFTInterpretedStatementResult *)self toolId];
    v25 = [v4 toolId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];
  NSUInteger v6 = [v4 actionEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];
    v30 = [v4 actionEventId];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];
  NSUInteger v6 = [v4 originTaskStatementId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];
    v35 = [v4 originTaskStatementId];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTInterpretedStatementResult *)self outcome];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTInterpretedStatementResult *)self resultStatementId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];

  if (v8)
  {
    v9 = [(IFTSchemaIFTInterpretedStatementResult *)self originProgramStatementId];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(IFTSchemaIFTInterpretedStatementResult *)self toolId];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];

  if (v11)
  {
    uint64_t v12 = [(IFTSchemaIFTInterpretedStatementResult *)self actionEventId];
    PBDataWriterWriteSubmessage();
  }
  v13 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];

  if (v13)
  {
    int v14 = [(IFTSchemaIFTInterpretedStatementResult *)self originTaskStatementId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTInterpretedStatementResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteOriginTaskStatementId
{
}

- (BOOL)hasOriginTaskStatementId
{
  return self->_originTaskStatementId != 0;
}

- (void)deleteActionEventId
{
}

- (BOOL)hasActionEventId
{
  return self->_actionEventId != 0;
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteOriginProgramStatementId
{
}

- (BOOL)hasOriginProgramStatementId
{
  return self->_originProgramStatementId != 0;
}

- (void)deleteResultStatementId
{
}

- (BOOL)hasResultStatementId
{
  return self->_resultStatementId != 0;
}

- (void)deleteOutcome
{
}

- (BOOL)hasOutcome
{
  return self->_outcome != 0;
}

@end