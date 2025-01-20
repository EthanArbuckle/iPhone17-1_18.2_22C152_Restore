@interface USOSchemaUSOSpanPropertyTier1
- (BOOL)hasKey;
- (BOOL)hasValueFloat;
- (BOOL)hasValueInt;
- (BOOL)hasValueString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)key;
- (NSString)valueString;
- (USOSchemaUSOSpanPropertyTier1)initWithDictionary:(id)a3;
- (USOSchemaUSOSpanPropertyTier1)initWithJSON:(id)a3;
- (float)valueFloat;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)valueInt;
- (unint64_t)hash;
- (void)deleteKey;
- (void)deleteValueFloat;
- (void)deleteValueInt;
- (void)deleteValueString;
- (void)setHasKey:(BOOL)a3;
- (void)setHasValueFloat:(BOOL)a3;
- (void)setHasValueInt:(BOOL)a3;
- (void)setHasValueString:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setValueFloat:(float)a3;
- (void)setValueInt:(int)a3;
- (void)setValueString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOSpanPropertyTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSOSpanPropertyTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueString];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueInt];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueFloat];
  }
  if ([v4 isConditionSet:4])
  {
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueString];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueInt];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueFloat];
  }
  if ([v4 isConditionSet:5])
  {
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueString];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueInt];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueFloat];
  }
  if ([v4 isConditionSet:6])
  {
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueString];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueInt];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueFloat];
  }
  if ([v4 isConditionSet:7])
  {
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueString];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueInt];
    [(USOSchemaUSOSpanPropertyTier1 *)self deleteValueFloat];
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
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setHasValueString:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasKey:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)valueFloat
{
  return self->_valueFloat;
}

- (int)valueInt
{
  return self->_valueInt;
}

- (void)setValueString:(id)a3
{
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (USOSchemaUSOSpanPropertyTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSOSpanPropertyTier1;
  v5 = [(USOSchemaUSOSpanPropertyTier1 *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(USOSchemaUSOSpanPropertyTier1 *)v5 setKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"valueString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(USOSchemaUSOSpanPropertyTier1 *)v5 setValueString:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"valueInt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOSpanPropertyTier1 setValueInt:](v5, "setValueInt:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"valueFloat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[USOSchemaUSOSpanPropertyTier1 setValueFloat:](v5, "setValueFloat:");
    }
    v12 = v5;
  }
  return v5;
}

- (USOSchemaUSOSpanPropertyTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOSpanPropertyTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOSpanPropertyTier1 *)self dictionaryRepresentation];
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
  if (self->_key)
  {
    id v4 = [(USOSchemaUSOSpanPropertyTier1 *)self key];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = NSNumber;
    [(USOSchemaUSOSpanPropertyTier1 *)self valueFloat];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"valueFloat"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[USOSchemaUSOSpanPropertyTier1 valueInt](self, "valueInt"));
    [v3 setObject:v9 forKeyedSubscript:@"valueInt"];
  }
  if (self->_valueString)
  {
    v10 = [(USOSchemaUSOSpanPropertyTier1 *)self valueString];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"valueString"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_valueString hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_valueInt;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float valueFloat = self->_valueFloat;
  double v7 = valueFloat;
  if (valueFloat < 0.0) {
    double v7 = -valueFloat;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(USOSchemaUSOSpanPropertyTier1 *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(USOSchemaUSOSpanPropertyTier1 *)self key];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(USOSchemaUSOSpanPropertyTier1 *)self key];
    unint64_t v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOSpanPropertyTier1 *)self valueString];
  v6 = [v4 valueString];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(USOSchemaUSOSpanPropertyTier1 *)self valueString];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(USOSchemaUSOSpanPropertyTier1 *)self valueString];
    v15 = [v4 valueString];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $2C7C400D7A7DEC554C218CAFA26C2673 has = self->_has;
  unsigned int v20 = v4[32];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int valueInt = self->_valueInt;
      if (valueInt != [v4 valueInt]) {
        goto LABEL_12;
      }
      $2C7C400D7A7DEC554C218CAFA26C2673 has = self->_has;
      unsigned int v20 = v4[32];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22 || (float valueFloat = self->_valueFloat, [v4 valueFloat], valueFloat == v24))
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(USOSchemaUSOSpanPropertyTier1 *)self key];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(USOSchemaUSOSpanPropertyTier1 *)self valueString];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOSpanPropertyTier1ReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteValueFloat
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasValueFloat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValueFloat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setValueFloat:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float valueFloat = a3;
}

- (void)deleteValueInt
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasValueInt:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueInt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValueInt:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int valueInt = a3;
}

- (void)deleteValueString
{
}

- (BOOL)hasValueString
{
  return self->_valueString != 0;
}

- (void)deleteKey
{
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end