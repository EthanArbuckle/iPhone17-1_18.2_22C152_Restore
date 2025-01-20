@interface IFTSchemaIFTParameterNotAllowed
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasParameterId;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTParameterNotAllowed)initWithDictionary:(id)a3;
- (IFTSchemaIFTParameterNotAllowed)initWithJSON:(id)a3;
- (IFTSchemaIFTTypedValue)value;
- (NSData)jsonData;
- (NSString)parameterId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteParameterId;
- (void)deleteValue;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasParameterId:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setParameterId:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTParameterNotAllowed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTParameterNotAllowed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTParameterNotAllowed *)self value];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTParameterNotAllowed *)self deleteValue];
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
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_parameterId, 0);
}

- (void)setHasValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasParameterId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setValue:(id)a3
{
}

- (IFTSchemaIFTTypedValue)value
{
  return self->_value;
}

- (void)setParameterId:(id)a3
{
}

- (NSString)parameterId
{
  return self->_parameterId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTParameterNotAllowed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTParameterNotAllowed;
  v5 = [(IFTSchemaIFTParameterNotAllowed *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTParameterNotAllowed setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"parameterId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(IFTSchemaIFTParameterNotAllowed *)v5 setParameterId:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaIFTTypedValue alloc] initWithDictionary:v9];
      [(IFTSchemaIFTParameterNotAllowed *)v5 setValue:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (IFTSchemaIFTParameterNotAllowed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTParameterNotAllowed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTParameterNotAllowed *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTParameterNotAllowed exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_parameterId)
  {
    v5 = [(IFTSchemaIFTParameterNotAllowed *)self parameterId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"parameterId"];
  }
  if (self->_value)
  {
    uint64_t v7 = [(IFTSchemaIFTParameterNotAllowed *)self value];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"value"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"value"];
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
  NSUInteger v4 = [(NSString *)self->_parameterId hash] ^ v3;
  return v4 ^ [(IFTSchemaIFTTypedValue *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
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
  v6 = [(IFTSchemaIFTParameterNotAllowed *)self parameterId];
  uint64_t v7 = [v4 parameterId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaIFTParameterNotAllowed *)self parameterId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(IFTSchemaIFTParameterNotAllowed *)self parameterId];
    v11 = [v4 parameterId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTParameterNotAllowed *)self value];
  uint64_t v7 = [v4 value];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(IFTSchemaIFTParameterNotAllowed *)self value];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTParameterNotAllowed *)self value];
    v16 = [v4 value];
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
  id v8 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v4 = [(IFTSchemaIFTParameterNotAllowed *)self parameterId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(IFTSchemaIFTParameterNotAllowed *)self value];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(IFTSchemaIFTParameterNotAllowed *)self value];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterNotAllowedReadFrom(self, (uint64_t)a3);
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteParameterId
{
}

- (BOOL)hasParameterId
{
  return self->_parameterId != 0;
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