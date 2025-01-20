@interface IFTSchemaIFTParameterConfirmation
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasItem;
- (BOOL)hasParameterId;
- (BOOL)hasParameterIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTParameterConfirmation)initWithDictionary:(id)a3;
- (IFTSchemaIFTParameterConfirmation)initWithJSON:(id)a3;
- (IFTSchemaIFTTypedValue)item;
- (NSData)jsonData;
- (NSString)parameterId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)parameterIndex;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteItem;
- (void)deleteParameterId;
- (void)deleteParameterIndex;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasItem:(BOOL)a3;
- (void)setHasParameterId:(BOOL)a3;
- (void)setHasParameterIndex:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setParameterId:(id)a3;
- (void)setParameterIndex:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTParameterConfirmation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTParameterConfirmation;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTParameterConfirmation *)self item];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTParameterConfirmation *)self deleteItem];
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
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_parameterId, 0);
}

- (void)setHasItem:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasParameterId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setItem:(id)a3
{
}

- (IFTSchemaIFTTypedValue)item
{
  return self->_item;
}

- (int64_t)parameterIndex
{
  return self->_parameterIndex;
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

- (IFTSchemaIFTParameterConfirmation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IFTSchemaIFTParameterConfirmation;
  v5 = [(IFTSchemaIFTParameterConfirmation *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTParameterConfirmation setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"parameterId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(IFTSchemaIFTParameterConfirmation *)v5 setParameterId:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"parameterIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTParameterConfirmation setParameterIndex:](v5, "setParameterIndex:", [v9 longLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"item"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[IFTSchemaIFTTypedValue alloc] initWithDictionary:v10];
      [(IFTSchemaIFTParameterConfirmation *)v5 setItem:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (IFTSchemaIFTParameterConfirmation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTParameterConfirmation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTParameterConfirmation *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTParameterConfirmation exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_item)
  {
    v5 = [(IFTSchemaIFTParameterConfirmation *)self item];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"item"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"item"];
    }
  }
  if (self->_parameterId)
  {
    v8 = [(IFTSchemaIFTParameterConfirmation *)self parameterId];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"parameterId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTParameterConfirmation parameterIndex](self, "parameterIndex"));
    [v3 setObject:v10 forKeyedSubscript:@"parameterIndex"];
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
  NSUInteger v4 = [(NSString *)self->_parameterId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_parameterIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(IFTSchemaIFTTypedValue *)self->_item hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_18;
    }
  }
  v6 = [(IFTSchemaIFTParameterConfirmation *)self parameterId];
  uint64_t v7 = [v4 parameterId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(IFTSchemaIFTParameterConfirmation *)self parameterId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(IFTSchemaIFTParameterConfirmation *)self parameterId];
    v11 = [v4 parameterId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int64_t parameterIndex = self->_parameterIndex;
    if (parameterIndex != [v4 parameterIndex]) {
      goto LABEL_18;
    }
  }
  v6 = [(IFTSchemaIFTParameterConfirmation *)self item];
  uint64_t v7 = [v4 item];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v15 = [(IFTSchemaIFTParameterConfirmation *)self item];
    if (!v15)
    {

LABEL_21:
      BOOL v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    v17 = [(IFTSchemaIFTParameterConfirmation *)self item];
    v18 = [v4 item];
    char v19 = [v17 isEqual:v18];

    if (v19) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v4 = [(IFTSchemaIFTParameterConfirmation *)self parameterId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  uint64_t v5 = [(IFTSchemaIFTParameterConfirmation *)self item];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(IFTSchemaIFTParameterConfirmation *)self item];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterConfirmationReadFrom(self, (uint64_t)a3);
}

- (void)deleteItem
{
}

- (BOOL)hasItem
{
  return self->_item != 0;
}

- (void)deleteParameterIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasParameterIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParameterIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setParameterIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t parameterIndex = a3;
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