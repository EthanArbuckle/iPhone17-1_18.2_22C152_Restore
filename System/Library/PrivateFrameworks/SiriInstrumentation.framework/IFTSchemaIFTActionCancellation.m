@interface IFTSchemaIFTActionCancellation
- (BOOL)exists;
- (BOOL)hasCancelledActionStatementId;
- (BOOL)hasExists;
- (BOOL)hasStatementId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionCancellation)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionCancellation)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)cancelledActionStatementId;
- (IFTSchemaIFTStatementId)statementId;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCancelledActionStatementId;
- (void)deleteExists;
- (void)deleteStatementId;
- (void)setCancelledActionStatementId:(id)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasCancelledActionStatementId:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setStatementId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionCancellation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTActionCancellation;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTActionCancellation *)self deleteCancelledActionStatementId];
  }
  v9 = [(IFTSchemaIFTActionCancellation *)self statementId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTActionCancellation *)self deleteStatementId];
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
  objc_storeStrong((id *)&self->_statementId, 0);
  objc_storeStrong((id *)&self->_cancelledActionStatementId, 0);
}

- (void)setHasStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCancelledActionStatementId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setCancelledActionStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)cancelledActionStatementId
{
  return self->_cancelledActionStatementId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTActionCancellation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTActionCancellation;
  v5 = [(IFTSchemaIFTActionCancellation *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionCancellation setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"cancelledActionStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v7];
      [(IFTSchemaIFTActionCancellation *)v5 setCancelledActionStatementId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v9];
      [(IFTSchemaIFTActionCancellation *)v5 setStatementId:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionCancellation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionCancellation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionCancellation *)self dictionaryRepresentation];
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
  if (self->_cancelledActionStatementId)
  {
    id v4 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cancelledActionStatementId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cancelledActionStatementId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionCancellation exists](self, "exists"));
    [v3 setObject:v7 forKeyedSubscript:@"exists"];
  }
  if (self->_statementId)
  {
    int v8 = [(IFTSchemaIFTActionCancellation *)self statementId];
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
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_cancelledActionStatementId hash] ^ v3;
  return v4 ^ [(IFTSchemaIFTStatementId *)self->_statementId hash];
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
  v6 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];
  uint64_t v7 = [v4 cancelledActionStatementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];
    int v11 = [v4 cancelledActionStatementId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTActionCancellation *)self statementId];
  uint64_t v7 = [v4 statementId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(IFTSchemaIFTActionCancellation *)self statementId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTActionCancellation *)self statementId];
    v16 = [v4 statementId];
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
  unint64_t v4 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];

  if (v4)
  {
    v5 = [(IFTSchemaIFTActionCancellation *)self cancelledActionStatementId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTActionCancellation *)self statementId];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(IFTSchemaIFTActionCancellation *)self statementId];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionCancellationReadFrom(self, (uint64_t)a3);
}

- (void)deleteStatementId
{
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteCancelledActionStatementId
{
}

- (BOOL)hasCancelledActionStatementId
{
  return self->_cancelledActionStatementId != 0;
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