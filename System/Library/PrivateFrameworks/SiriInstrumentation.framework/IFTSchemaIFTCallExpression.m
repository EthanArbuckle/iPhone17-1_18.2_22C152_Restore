@interface IFTSchemaIFTCallExpression
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTCallExpression)initWithDictionary:(id)a3;
- (IFTSchemaIFTCallExpression)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)toolId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteToolId;
- (void)setHasToolId:(BOOL)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTCallExpression

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IFTSchemaIFTCallExpression;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(IFTSchemaIFTCallExpression *)self deleteToolId];
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
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasToolId = a3;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (IFTSchemaIFTCallExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTCallExpression;
  v5 = [(IFTSchemaIFTCallExpression *)&v10 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IFTSchemaIFTCallExpression *)v5 setToolId:v7];
    }
    objc_super v8 = v5;
  }
  return v5;
}

- (IFTSchemaIFTCallExpression)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTCallExpression *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTCallExpression *)self dictionaryRepresentation];
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
  if (self->_toolId)
  {
    id v4 = [(IFTSchemaIFTCallExpression *)self toolId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"toolId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_toolId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(IFTSchemaIFTCallExpression *)self toolId];
    int v6 = [v4 toolId];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(IFTSchemaIFTCallExpression *)self toolId];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(IFTSchemaIFTCallExpression *)self toolId];
      v11 = [v4 toolId];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(IFTSchemaIFTCallExpression *)self toolId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTCallExpressionReadFrom(self, (uint64_t)a3);
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

@end