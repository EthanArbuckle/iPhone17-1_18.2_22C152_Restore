@interface IFTSchemaIFTAction
- (BOOL)exists;
- (BOOL)hasBundleId;
- (BOOL)hasExists;
- (BOOL)hasIsConfirmed;
- (BOOL)hasPlanEventId;
- (BOOL)hasStatementId;
- (BOOL)hasToolId;
- (BOOL)isConfirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTAction)initWithDictionary:(id)a3;
- (IFTSchemaIFTAction)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)statementId;
- (NSData)jsonData;
- (NSString)bundleId;
- (NSString)toolId;
- (SISchemaUUID)planEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteBundleId;
- (void)deleteExists;
- (void)deleteIsConfirmed;
- (void)deletePlanEventId;
- (void)deleteStatementId;
- (void)deleteToolId;
- (void)setBundleId:(id)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasIsConfirmed:(BOOL)a3;
- (void)setHasPlanEventId:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setIsConfirmed:(BOOL)a3;
- (void)setPlanEventId:(id)a3;
- (void)setStatementId:(id)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTAction;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4])
  {
    [(IFTSchemaIFTAction *)self deleteToolId];
    [(IFTSchemaIFTAction *)self deleteBundleId];
  }
  v6 = [(IFTSchemaIFTAction *)self statementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTAction *)self deleteStatementId];
  }
  v9 = [(IFTSchemaIFTAction *)self planEventId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTAction *)self deletePlanEventId];
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
  objc_storeStrong((id *)&self->_planEventId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

- (void)setHasPlanEventId:(BOOL)a3
{
  self->_hasStatementId = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPlanEventId:(id)a3
{
}

- (SISchemaUUID)planEventId
{
  return self->_planEventId;
}

- (BOOL)isConfirmed
{
  return self->_isConfirmed;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
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

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IFTSchemaIFTAction;
  v5 = [(IFTSchemaIFTAction *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTAction setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v7];
      [(IFTSchemaIFTAction *)v5 setStatementId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(IFTSchemaIFTAction *)v5 setToolId:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(IFTSchemaIFTAction *)v5 setBundleId:v12];
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"isConfirmed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTAction setIsConfirmed:](v5, "setIsConfirmed:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"planEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(IFTSchemaIFTAction *)v5 setPlanEventId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (IFTSchemaIFTAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTAction *)self dictionaryRepresentation];
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
  if (self->_bundleId)
  {
    id v4 = [(IFTSchemaIFTAction *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTAction exists](self, "exists"));
    [v3 setObject:v7 forKeyedSubscript:@"exists"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTAction isConfirmed](self, "isConfirmed"));
    [v3 setObject:v8 forKeyedSubscript:@"isConfirmed"];
  }
  if (self->_planEventId)
  {
    v9 = [(IFTSchemaIFTAction *)self planEventId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"planEventId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"planEventId"];
    }
  }
  if (self->_statementId)
  {
    v12 = [(IFTSchemaIFTAction *)self statementId];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"statementId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"statementId"];
    }
  }
  if (self->_toolId)
  {
    v15 = [(IFTSchemaIFTAction *)self toolId];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"toolId"];
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
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_statementId hash];
  NSUInteger v5 = [(NSString *)self->_toolId hash];
  NSUInteger v6 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_isConfirmed;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(SISchemaUUID *)self->_planEventId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_28;
    }
  }
  NSUInteger v6 = [(IFTSchemaIFTAction *)self statementId];
  uint64_t v7 = [v4 statementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(IFTSchemaIFTAction *)self statementId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTAction *)self statementId];
    int v11 = [v4 statementId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(IFTSchemaIFTAction *)self toolId];
  uint64_t v7 = [v4 toolId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(IFTSchemaIFTAction *)self toolId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTAction *)self toolId];
    v16 = [v4 toolId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(IFTSchemaIFTAction *)self bundleId];
  uint64_t v7 = [v4 bundleId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(IFTSchemaIFTAction *)self bundleId];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(IFTSchemaIFTAction *)self bundleId];
    v21 = [v4 bundleId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  int v23 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v23 != ((v4[56] >> 1) & 1)) {
    goto LABEL_28;
  }
  if (v23)
  {
    int isConfirmed = self->_isConfirmed;
    if (isConfirmed != [v4 isConfirmed]) {
      goto LABEL_28;
    }
  }
  NSUInteger v6 = [(IFTSchemaIFTAction *)self planEventId];
  uint64_t v7 = [v4 planEventId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v25 = [(IFTSchemaIFTAction *)self planEventId];
    if (!v25)
    {

LABEL_31:
      BOOL v30 = 1;
      goto LABEL_29;
    }
    v26 = (void *)v25;
    v27 = [(IFTSchemaIFTAction *)self planEventId];
    v28 = [v4 planEventId];
    char v29 = [v27 isEqual:v28];

    if (v29) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v30 = 0;
LABEL_29:

  return v30;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(IFTSchemaIFTAction *)self statementId];

  if (v4)
  {
    NSUInteger v5 = [(IFTSchemaIFTAction *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(IFTSchemaIFTAction *)self toolId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(IFTSchemaIFTAction *)self bundleId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v8 = [(IFTSchemaIFTAction *)self planEventId];

  v9 = v11;
  if (v8)
  {
    v10 = [(IFTSchemaIFTAction *)self planEventId];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionReadFrom(self, (uint64_t)a3);
}

- (void)deletePlanEventId
{
}

- (BOOL)hasPlanEventId
{
  return self->_planEventId != 0;
}

- (void)deleteIsConfirmed
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsConfirmed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsConfirmed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsConfirmed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isConfirmed = a3;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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