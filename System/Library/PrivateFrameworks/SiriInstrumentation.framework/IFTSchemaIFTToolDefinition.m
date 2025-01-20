@interface IFTSchemaIFTToolDefinition
- (BOOL)hasToolId;
- (BOOL)hasToolType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTToolDefinition)initWithDictionary:(id)a3;
- (IFTSchemaIFTToolDefinition)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)toolId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)toolType;
- (unint64_t)hash;
- (void)deleteToolId;
- (void)deleteToolType;
- (void)setHasToolId:(BOOL)a3;
- (void)setHasToolType:(BOOL)a3;
- (void)setToolId:(id)a3;
- (void)setToolType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTToolDefinition

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IFTSchemaIFTToolDefinition;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(IFTSchemaIFTToolDefinition *)self deleteToolId];
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
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)toolType
{
  return self->_toolType;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (IFTSchemaIFTToolDefinition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTToolDefinition;
  v5 = [(IFTSchemaIFTToolDefinition *)&v11 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IFTSchemaIFTToolDefinition *)v5 setToolId:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"toolType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTToolDefinition setToolType:](v5, "setToolType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTToolDefinition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTToolDefinition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTToolDefinition *)self dictionaryRepresentation];
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
    id v4 = [(IFTSchemaIFTToolDefinition *)self toolId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"toolId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(IFTSchemaIFTToolDefinition *)self toolType] - 1;
    if (v6 > 2) {
      uint64_t v7 = @"IFTTOOLTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBF688[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"toolType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_toolId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_toolType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFTSchemaIFTToolDefinition *)self toolId];
  unsigned int v6 = [v4 toolId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(IFTSchemaIFTToolDefinition *)self toolId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTToolDefinition *)self toolId];
    objc_super v11 = [v4 toolId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int toolType = self->_toolType;
    if (toolType != [v4 toolType]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(IFTSchemaIFTToolDefinition *)self toolId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTToolDefinitionReadFrom(self, (uint64_t)a3);
}

- (void)deleteToolType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasToolType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasToolType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setToolType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int toolType = a3;
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

@end