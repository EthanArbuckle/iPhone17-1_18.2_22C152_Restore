@interface IFTSchemaIFTStatementResult
- (BOOL)exists;
- (BOOL)hasActionEventId;
- (BOOL)hasExists;
- (BOOL)hasOriginProgramStatementId;
- (BOOL)hasOriginTaskStatementId;
- (BOOL)hasPayload;
- (BOOL)hasResultStatementId;
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTStatementId)originProgramStatementId;
- (IFTSchemaIFTStatementId)originTaskStatementId;
- (IFTSchemaIFTStatementId)resultStatementId;
- (IFTSchemaIFTStatementResult)initWithDictionary:(id)a3;
- (IFTSchemaIFTStatementResult)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementResultPayload)payload;
- (NSData)jsonData;
- (NSString)toolId;
- (SISchemaUUID)actionEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteActionEventId;
- (void)deleteExists;
- (void)deleteOriginProgramStatementId;
- (void)deleteOriginTaskStatementId;
- (void)deletePayload;
- (void)deleteResultStatementId;
- (void)deleteToolId;
- (void)setActionEventId:(id)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasActionEventId:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasOriginProgramStatementId:(BOOL)a3;
- (void)setHasOriginTaskStatementId:(BOOL)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setHasResultStatementId:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setOriginProgramStatementId:(id)a3;
- (void)setOriginTaskStatementId:(id)a3;
- (void)setPayload:(id)a3;
- (void)setResultStatementId:(id)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTStatementResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IFTSchemaIFTStatementResult;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(IFTSchemaIFTStatementResult *)self deleteToolId];
  }
  v6 = [(IFTSchemaIFTStatementResult *)self resultStatementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTStatementResult *)self deleteResultStatementId];
  }
  v9 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTStatementResult *)self deleteOriginProgramStatementId];
  }
  v12 = [(IFTSchemaIFTStatementResult *)self payload];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTStatementResult *)self deletePayload];
  }
  v15 = [(IFTSchemaIFTStatementResult *)self actionEventId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTStatementResult *)self deleteActionEventId];
  }
  v18 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTStatementResult *)self deleteOriginTaskStatementId];
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
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
  objc_storeStrong((id *)&self->_resultStatementId, 0);
}

- (void)setHasOriginTaskStatementId:(BOOL)a3
{
  self->_hasPayload = a3;
}

- (void)setHasActionEventId:(BOOL)a3
{
  self->_hasOriginProgramStatementId = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasResultStatementId = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasResultStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (void)setPayload:(id)a3
{
}

- (IFTSchemaIFTStatementResultPayload)payload
{
  return self->_payload;
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

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTStatementResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IFTSchemaIFTStatementResult;
  v5 = [(IFTSchemaIFTStatementResult *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTStatementResult setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"resultStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v7];
      [(IFTSchemaIFTStatementResult *)v5 setResultStatementId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"originProgramStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v9];
      [(IFTSchemaIFTStatementResult *)v5 setOriginProgramStatementId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"payload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[IFTSchemaIFTStatementResultPayload alloc] initWithDictionary:v11];
      [(IFTSchemaIFTStatementResult *)v5 setPayload:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = (void *)[v13 copy];
      [(IFTSchemaIFTStatementResult *)v5 setToolId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"actionEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(IFTSchemaIFTStatementResult *)v5 setActionEventId:v16];
    }
    int v17 = [v4 objectForKeyedSubscript:@"originTaskStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v17];
      [(IFTSchemaIFTStatementResult *)v5 setOriginTaskStatementId:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (IFTSchemaIFTStatementResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTStatementResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTStatementResult *)self dictionaryRepresentation];
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
    id v4 = [(IFTSchemaIFTStatementResult *)self actionEventId];
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
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTStatementResult exists](self, "exists"));
    [v3 setObject:v7 forKeyedSubscript:@"exists"];
  }
  if (self->_originProgramStatementId)
  {
    int v8 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"originProgramStatementId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"originProgramStatementId"];
    }
  }
  if (self->_originTaskStatementId)
  {
    int v11 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"originTaskStatementId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"originTaskStatementId"];
    }
  }
  if (self->_payload)
  {
    int v14 = [(IFTSchemaIFTStatementResult *)self payload];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"payload"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"payload"];
    }
  }
  if (self->_resultStatementId)
  {
    int v17 = [(IFTSchemaIFTStatementResult *)self resultStatementId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"resultStatementId"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"resultStatementId"];
    }
  }
  if (self->_toolId)
  {
    int v20 = [(IFTSchemaIFTStatementResult *)self toolId];
    objc_super v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"toolId"];
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
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_resultStatementId hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTStatementId *)self->_originProgramStatementId hash];
  unint64_t v6 = v4 ^ v5 ^ [(IFTSchemaIFTStatementResultPayload *)self->_payload hash];
  NSUInteger v7 = [(NSString *)self->_toolId hash];
  unint64_t v8 = v7 ^ [(SISchemaUUID *)self->_actionEventId hash];
  return v6 ^ v8 ^ [(IFTSchemaIFTStatementId *)self->_originTaskStatementId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[64] & 1)) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_35;
    }
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self resultStatementId];
  NSUInteger v7 = [v4 resultStatementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_34;
  }
  uint64_t v8 = [(IFTSchemaIFTStatementResult *)self resultStatementId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTStatementResult *)self resultStatementId];
    int v11 = [v4 resultStatementId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];
  NSUInteger v7 = [v4 originProgramStatementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_34;
  }
  uint64_t v13 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];
    v16 = [v4 originProgramStatementId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self payload];
  NSUInteger v7 = [v4 payload];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_34;
  }
  uint64_t v18 = [(IFTSchemaIFTStatementResult *)self payload];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(IFTSchemaIFTStatementResult *)self payload];
    objc_super v21 = [v4 payload];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self toolId];
  NSUInteger v7 = [v4 toolId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_34;
  }
  uint64_t v23 = [(IFTSchemaIFTStatementResult *)self toolId];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(IFTSchemaIFTStatementResult *)self toolId];
    v26 = [v4 toolId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self actionEventId];
  NSUInteger v7 = [v4 actionEventId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_34;
  }
  uint64_t v28 = [(IFTSchemaIFTStatementResult *)self actionEventId];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(IFTSchemaIFTStatementResult *)self actionEventId];
    v31 = [v4 actionEventId];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];
  NSUInteger v7 = [v4 originTaskStatementId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];
    if (!v33)
    {

LABEL_38:
      BOOL v38 = 1;
      goto LABEL_36;
    }
    v34 = (void *)v33;
    v35 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];
    v36 = [v4 originTaskStatementId];
    char v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_38;
    }
  }
  else
  {
LABEL_34:
  }
LABEL_35:
  BOOL v38 = 0;
LABEL_36:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(IFTSchemaIFTStatementResult *)self resultStatementId];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTStatementResult *)self resultStatementId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];

  if (v6)
  {
    NSUInteger v7 = [(IFTSchemaIFTStatementResult *)self originProgramStatementId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTStatementResult *)self payload];

  if (v8)
  {
    v9 = [(IFTSchemaIFTStatementResult *)self payload];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(IFTSchemaIFTStatementResult *)self toolId];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(IFTSchemaIFTStatementResult *)self actionEventId];

  if (v11)
  {
    int v12 = [(IFTSchemaIFTStatementResult *)self actionEventId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v13 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];

  int v14 = v16;
  if (v13)
  {
    v15 = [(IFTSchemaIFTStatementResult *)self originTaskStatementId];
    PBDataWriterWriteSubmessage();

    int v14 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTStatementResultReadFrom(self, (uint64_t)a3);
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

- (void)deletePayload
{
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
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