@interface IFTSchemaIFTToolResolution
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasOriginProgramStatementId;
- (BOOL)hasStatementId;
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTStatementId)originProgramStatementId;
- (IFTSchemaIFTStatementId)statementId;
- (IFTSchemaIFTToolResolution)initWithDictionary:(id)a3;
- (IFTSchemaIFTToolResolution)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)toolId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteOriginProgramStatementId;
- (void)deleteStatementId;
- (void)deleteToolId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasOriginProgramStatementId:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setOriginProgramStatementId:(id)a3;
- (void)setStatementId:(id)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTToolResolution

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTToolResolution;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(IFTSchemaIFTToolResolution *)self deleteToolId];
  }
  v6 = [(IFTSchemaIFTToolResolution *)self statementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTToolResolution *)self deleteStatementId];
  }
  v9 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTToolResolution *)self deleteOriginProgramStatementId];
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
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOriginProgramStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)originProgramStatementId
{
  return self->_originProgramStatementId;
}

- (void)setStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTToolResolution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IFTSchemaIFTToolResolution;
  v5 = [(IFTSchemaIFTToolResolution *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTToolResolution setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = (void *)[v7 copy];
      [(IFTSchemaIFTToolResolution *)v5 setToolId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v9];
      [(IFTSchemaIFTToolResolution *)v5 setStatementId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"originProgramStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v11];
      [(IFTSchemaIFTToolResolution *)v5 setOriginProgramStatementId:v12];
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (IFTSchemaIFTToolResolution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTToolResolution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTToolResolution *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTToolResolution exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_originProgramStatementId)
  {
    v5 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];
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
  if (self->_statementId)
  {
    int v8 = [(IFTSchemaIFTToolResolution *)self statementId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"statementId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"statementId"];
    }
  }
  if (self->_toolId)
  {
    int v11 = [(IFTSchemaIFTToolResolution *)self toolId];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"toolId"];
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
  NSUInteger v4 = [(NSString *)self->_toolId hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTStatementId *)self->_statementId hash];
  return v4 ^ v5 ^ [(IFTSchemaIFTStatementId *)self->_originProgramStatementId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_20;
    }
  }
  v6 = [(IFTSchemaIFTToolResolution *)self toolId];
  uint64_t v7 = [v4 toolId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(IFTSchemaIFTToolResolution *)self toolId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTToolResolution *)self toolId];
    int v11 = [v4 toolId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTToolResolution *)self statementId];
  uint64_t v7 = [v4 statementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(IFTSchemaIFTToolResolution *)self statementId];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(IFTSchemaIFTToolResolution *)self statementId];
    v16 = [v4 statementId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];
  uint64_t v7 = [v4 originProgramStatementId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];
    v21 = [v4 originProgramStatementId];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v4 = [(IFTSchemaIFTToolResolution *)self toolId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(IFTSchemaIFTToolResolution *)self statementId];

  if (v5)
  {
    v6 = [(IFTSchemaIFTToolResolution *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];

  uint64_t v8 = v10;
  if (v7)
  {
    v9 = [(IFTSchemaIFTToolResolution *)self originProgramStatementId];
    PBDataWriterWriteSubmessage();

    uint64_t v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTToolResolutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteOriginProgramStatementId
{
}

- (BOOL)hasOriginProgramStatementId
{
  return self->_originProgramStatementId != 0;
}

- (void)deleteStatementId
{
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
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