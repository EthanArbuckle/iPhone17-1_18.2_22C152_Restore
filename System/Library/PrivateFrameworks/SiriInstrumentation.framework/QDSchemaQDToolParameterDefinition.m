@interface QDSchemaQDToolParameterDefinition
- (BOOL)hasDescription;
- (BOOL)hasEntityType;
- (BOOL)hasKey;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)description;
- (NSString)key;
- (NSString)name;
- (QDSchemaQDEntityType)entityType;
- (QDSchemaQDToolParameterDefinition)initWithDictionary:(id)a3;
- (QDSchemaQDToolParameterDefinition)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDescription;
- (void)deleteEntityType;
- (void)deleteKey;
- (void)deleteName;
- (void)setDescription:(id)a3;
- (void)setEntityType:(id)a3;
- (void)setHasDescription:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDToolParameterDefinition

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)QDSchemaQDToolParameterDefinition;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(QDSchemaQDToolParameterDefinition *)self entityType];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(QDSchemaQDToolParameterDefinition *)self deleteEntityType];
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
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setHasDescription:(BOOL)a3
{
  self->_hasDescription = a3;
}

- (void)setHasEntityType:(BOOL)a3
{
  self->_hasEntityType = a3;
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (void)setHasKey:(BOOL)a3
{
  self->_hasKey = a3;
}

- (void)setDescription:(id)a3
{
}

- (NSString)description
{
  return self->_description;
}

- (void)setEntityType:(id)a3
{
}

- (QDSchemaQDEntityType)entityType
{
  return self->_entityType;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (QDSchemaQDToolParameterDefinition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QDSchemaQDToolParameterDefinition;
  v5 = [(QDSchemaQDToolParameterDefinition *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(QDSchemaQDToolParameterDefinition *)v5 setKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(QDSchemaQDToolParameterDefinition *)v5 setName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"entityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[QDSchemaQDEntityType alloc] initWithDictionary:v10];
      [(QDSchemaQDToolParameterDefinition *)v5 setEntityType:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(QDSchemaQDToolParameterDefinition *)v5 setDescription:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (QDSchemaQDToolParameterDefinition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDToolParameterDefinition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDToolParameterDefinition *)self dictionaryRepresentation];
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
  if (self->_description)
  {
    id v4 = [(QDSchemaQDToolParameterDefinition *)self description];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"description"];
  }
  if (self->_entityType)
  {
    v6 = [(QDSchemaQDToolParameterDefinition *)self entityType];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"entityType"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"entityType"];
    }
  }
  if (self->_key)
  {
    objc_super v9 = [(QDSchemaQDToolParameterDefinition *)self key];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"key"];
  }
  if (self->_name)
  {
    v11 = [(QDSchemaQDToolParameterDefinition *)self name];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"name"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t v5 = [(QDSchemaQDEntityType *)self->_entityType hash];
  return v4 ^ v5 ^ [(NSString *)self->_description hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(QDSchemaQDToolParameterDefinition *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(QDSchemaQDToolParameterDefinition *)self key];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(QDSchemaQDToolParameterDefinition *)self key];
    v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(QDSchemaQDToolParameterDefinition *)self name];
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(QDSchemaQDToolParameterDefinition *)self name];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(QDSchemaQDToolParameterDefinition *)self name];
    v15 = [v4 name];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(QDSchemaQDToolParameterDefinition *)self entityType];
  v6 = [v4 entityType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(QDSchemaQDToolParameterDefinition *)self entityType];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(QDSchemaQDToolParameterDefinition *)self entityType];
    v20 = [v4 entityType];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(QDSchemaQDToolParameterDefinition *)self description];
  v6 = [v4 description];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(QDSchemaQDToolParameterDefinition *)self description];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(QDSchemaQDToolParameterDefinition *)self description];
    v25 = [v4 description];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(QDSchemaQDToolParameterDefinition *)self key];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(QDSchemaQDToolParameterDefinition *)self name];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(QDSchemaQDToolParameterDefinition *)self entityType];

  if (v6)
  {
    uint64_t v7 = [(QDSchemaQDToolParameterDefinition *)self entityType];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(QDSchemaQDToolParameterDefinition *)self description];

  objc_super v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    objc_super v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDToolParameterDefinitionReadFrom(self, (uint64_t)a3);
}

- (void)deleteDescription
{
}

- (BOOL)hasDescription
{
  return self->_description != 0;
}

- (void)deleteEntityType
{
}

- (BOOL)hasEntityType
{
  return self->_entityType != 0;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteKey
{
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end