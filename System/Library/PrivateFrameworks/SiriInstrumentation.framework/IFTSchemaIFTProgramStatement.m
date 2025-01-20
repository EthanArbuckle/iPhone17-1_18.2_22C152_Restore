@interface IFTSchemaIFTProgramStatement
- (BOOL)hasExpression;
- (BOOL)hasExpressionName;
- (BOOL)hasStatementId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTASTFlatExpr)expression;
- (IFTSchemaIFTExpression)expressionName;
- (IFTSchemaIFTProgramStatement)initWithDictionary:(id)a3;
- (IFTSchemaIFTProgramStatement)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)statementId;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExpression;
- (void)deleteExpressionName;
- (void)deleteStatementId;
- (void)setExpression:(id)a3;
- (void)setExpressionName:(id)a3;
- (void)setHasExpression:(BOOL)a3;
- (void)setHasExpressionName:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setStatementId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTProgramStatement

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTProgramStatement;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTProgramStatement *)self statementId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTProgramStatement *)self deleteStatementId];
  }
  v9 = [(IFTSchemaIFTProgramStatement *)self expression];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTProgramStatement *)self deleteExpression];
  }
  v12 = [(IFTSchemaIFTProgramStatement *)self expressionName];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTProgramStatement *)self deleteExpressionName];
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
  objc_storeStrong((id *)&self->_expressionName, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

- (void)setHasExpressionName:(BOOL)a3
{
  self->_hasExpressionName = a3;
}

- (void)setHasExpression:(BOOL)a3
{
  self->_hasExpression = a3;
}

- (void)setHasStatementId:(BOOL)a3
{
  self->_hasStatementId = a3;
}

- (void)setExpressionName:(id)a3
{
}

- (IFTSchemaIFTExpression)expressionName
{
  return self->_expressionName;
}

- (void)setExpression:(id)a3
{
}

- (IFTSchemaIFTASTFlatExpr)expression
{
  return self->_expression;
}

- (void)setStatementId:(id)a3
{
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (IFTSchemaIFTProgramStatement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IFTSchemaIFTProgramStatement;
  v5 = [(IFTSchemaIFTProgramStatement *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v6];
      [(IFTSchemaIFTProgramStatement *)v5 setStatementId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"expression"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTASTFlatExpr alloc] initWithDictionary:v8];
      [(IFTSchemaIFTProgramStatement *)v5 setExpression:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"expressionName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTExpression alloc] initWithDictionary:v10];
      [(IFTSchemaIFTProgramStatement *)v5 setExpressionName:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (IFTSchemaIFTProgramStatement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTProgramStatement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTProgramStatement *)self dictionaryRepresentation];
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
  if (self->_expression)
  {
    id v4 = [(IFTSchemaIFTProgramStatement *)self expression];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"expression"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"expression"];
    }
  }
  if (self->_expressionName)
  {
    uint64_t v7 = [(IFTSchemaIFTProgramStatement *)self expressionName];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"expressionName"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"expressionName"];
    }
  }
  if (self->_statementId)
  {
    v10 = [(IFTSchemaIFTProgramStatement *)self statementId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"statementId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"statementId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTStatementId *)self->_statementId hash];
  unint64_t v4 = [(IFTSchemaIFTASTFlatExpr *)self->_expression hash] ^ v3;
  return v4 ^ [(IFTSchemaIFTExpression *)self->_expressionName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(IFTSchemaIFTProgramStatement *)self statementId];
  v6 = [v4 statementId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(IFTSchemaIFTProgramStatement *)self statementId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IFTSchemaIFTProgramStatement *)self statementId];
    v10 = [v4 statementId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(IFTSchemaIFTProgramStatement *)self expression];
  v6 = [v4 expression];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(IFTSchemaIFTProgramStatement *)self expression];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(IFTSchemaIFTProgramStatement *)self expression];
    v15 = [v4 expression];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(IFTSchemaIFTProgramStatement *)self expressionName];
  v6 = [v4 expressionName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(IFTSchemaIFTProgramStatement *)self expressionName];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(IFTSchemaIFTProgramStatement *)self expressionName];
    v20 = [v4 expressionName];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(IFTSchemaIFTProgramStatement *)self statementId];

  if (v4)
  {
    v5 = [(IFTSchemaIFTProgramStatement *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTProgramStatement *)self expression];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTProgramStatement *)self expression];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(IFTSchemaIFTProgramStatement *)self expressionName];

  if (v8)
  {
    v9 = [(IFTSchemaIFTProgramStatement *)self expressionName];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTProgramStatementReadFrom(self, (uint64_t)a3);
}

- (void)deleteExpressionName
{
}

- (BOOL)hasExpressionName
{
  return self->_expressionName != 0;
}

- (void)deleteExpression
{
}

- (BOOL)hasExpression
{
  return self->_expression != 0;
}

- (void)deleteStatementId
{
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

@end