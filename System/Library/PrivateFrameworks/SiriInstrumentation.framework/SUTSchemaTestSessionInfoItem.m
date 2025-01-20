@interface SUTSchemaTestSessionInfoItem
- (BOOL)hasName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (NSString)value;
- (SUTSchemaTestSessionInfoItem)initWithDictionary:(id)a3;
- (SUTSchemaTestSessionInfoItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteName;
- (void)deleteValue;
- (void)setHasName:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUTSchemaTestSessionInfoItem

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (SUTSchemaTestSessionInfoItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUTSchemaTestSessionInfoItem;
  v5 = [(SUTSchemaTestSessionInfoItem *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SUTSchemaTestSessionInfoItem *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SUTSchemaTestSessionInfoItem *)v5 setValue:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SUTSchemaTestSessionInfoItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUTSchemaTestSessionInfoItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUTSchemaTestSessionInfoItem *)self dictionaryRepresentation];
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
  if (self->_name)
  {
    id v4 = [(SUTSchemaTestSessionInfoItem *)self name];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  if (self->_value)
  {
    v6 = [(SUTSchemaTestSessionInfoItem *)self value];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"value"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SUTSchemaTestSessionInfoItem *)self name];
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SUTSchemaTestSessionInfoItem *)self name];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SUTSchemaTestSessionInfoItem *)self name];
    v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SUTSchemaTestSessionInfoItem *)self value];
  v6 = [v4 value];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SUTSchemaTestSessionInfoItem *)self value];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SUTSchemaTestSessionInfoItem *)self value];
    v15 = [v4 value];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(SUTSchemaTestSessionInfoItem *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SUTSchemaTestSessionInfoItem *)self value];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestSessionInfoItemReadFrom(self, (uint64_t)a3);
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end