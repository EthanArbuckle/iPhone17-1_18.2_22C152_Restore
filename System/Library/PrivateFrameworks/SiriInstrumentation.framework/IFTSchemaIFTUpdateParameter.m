@interface IFTSchemaIFTUpdateParameter
- (BOOL)hasKind;
- (BOOL)hasParameterId;
- (BOOL)hasParameterIndex;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTStatementId)value;
- (IFTSchemaIFTUpdateParameter)initWithDictionary:(id)a3;
- (IFTSchemaIFTUpdateParameter)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)parameterId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)kind;
- (int64_t)parameterIndex;
- (unint64_t)hash;
- (void)deleteKind;
- (void)deleteParameterId;
- (void)deleteParameterIndex;
- (void)deleteValue;
- (void)setHasKind:(BOOL)a3;
- (void)setHasParameterId:(BOOL)a3;
- (void)setHasParameterIndex:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setParameterId:(id)a3;
- (void)setParameterIndex:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTUpdateParameter

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTUpdateParameter;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(IFTSchemaIFTUpdateParameter *)self deleteParameterId];
  }
  v6 = [(IFTSchemaIFTUpdateParameter *)self value];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTUpdateParameter *)self deleteValue];
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

- (int64_t)parameterIndex
{
  return self->_parameterIndex;
}

- (void)setValue:(id)a3
{
}

- (IFTSchemaIFTStatementId)value
{
  return self->_value;
}

- (int)kind
{
  return self->_kind;
}

- (void)setParameterId:(id)a3
{
}

- (NSString)parameterId
{
  return self->_parameterId;
}

- (IFTSchemaIFTUpdateParameter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IFTSchemaIFTUpdateParameter;
  v5 = [(IFTSchemaIFTUpdateParameter *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"parameterId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IFTSchemaIFTUpdateParameter *)v5 setParameterId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"kind"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTUpdateParameter setKind:](v5, "setKind:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v9];
      [(IFTSchemaIFTUpdateParameter *)v5 setValue:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"parameterIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTUpdateParameter setParameterIndex:](v5, "setParameterIndex:", [v11 longLongValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (IFTSchemaIFTUpdateParameter)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTUpdateParameter *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTUpdateParameter *)self dictionaryRepresentation];
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
    int v4 = [(IFTSchemaIFTUpdateParameter *)self kind];
    v5 = @"ASTUPDATEKIND_UNKNOWN";
    if (v4 == 1) {
      v5 = @"ASTUPDATEKIND_APPEND";
    }
    if (v4 == 2) {
      v6 = @"ASTUPDATEKIND_REPLACE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"kind"];
  }
  if (self->_parameterId)
  {
    uint64_t v7 = [(IFTSchemaIFTUpdateParameter *)self parameterId];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"parameterId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTUpdateParameter parameterIndex](self, "parameterIndex"));
    [v3 setObject:v9 forKeyedSubscript:@"parameterIndex"];
  }
  if (self->_value)
  {
    objc_super v10 = [(IFTSchemaIFTUpdateParameter *)self value];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"value"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"value"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_parameterId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_kind;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(IFTSchemaIFTStatementId *)self->_value hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_parameterIndex;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  unint64_t v5 = [(IFTSchemaIFTUpdateParameter *)self parameterId];
  uint64_t v6 = [v4 parameterId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(IFTSchemaIFTUpdateParameter *)self parameterId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IFTSchemaIFTUpdateParameter *)self parameterId];
    objc_super v10 = [v4 parameterId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int kind = self->_kind;
    if (kind != [v4 kind]) {
      goto LABEL_15;
    }
  }
  unint64_t v5 = [(IFTSchemaIFTUpdateParameter *)self value];
  uint64_t v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(IFTSchemaIFTUpdateParameter *)self value];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(IFTSchemaIFTUpdateParameter *)self value];
    v16 = [v4 value];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v20 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v20 == ((v4[40] >> 1) & 1))
  {
    if (!v20 || (int64_t parameterIndex = self->_parameterIndex, parameterIndex == [v4 parameterIndex]))
    {
      BOOL v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(IFTSchemaIFTUpdateParameter *)self parameterId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v5 = [(IFTSchemaIFTUpdateParameter *)self value];

  if (v5)
  {
    uint64_t v6 = [(IFTSchemaIFTUpdateParameter *)self value];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTUpdateParameterReadFrom(self, (uint64_t)a3);
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

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteKind
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasKind:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKind
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int kind = a3;
}

- (void)deleteParameterId
{
}

- (BOOL)hasParameterId
{
  return self->_parameterId != 0;
}

@end