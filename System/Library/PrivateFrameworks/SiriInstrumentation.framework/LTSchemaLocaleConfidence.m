@interface LTSchemaLocaleConfidence
- (BOOL)hasConfidence;
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaLocaleConfidence)initWithDictionary:(id)a3;
- (LTSchemaLocaleConfidence)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)locale;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)confidence;
- (void)deleteConfidence;
- (void)deleteLocale;
- (void)setConfidence:(unsigned int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaLocaleConfidence

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (LTSchemaLocaleConfidence)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LTSchemaLocaleConfidence;
  v5 = [(LTSchemaLocaleConfidence *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaLocaleConfidence *)v5 setLocale:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaLocaleConfidence setConfidence:](v5, "setConfidence:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (LTSchemaLocaleConfidence)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaLocaleConfidence *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaLocaleConfidence *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaLocaleConfidence confidence](self, "confidence"));
    [v3 setObject:v4 forKeyedSubscript:@"confidence"];
  }
  if (self->_locale)
  {
    v5 = [(LTSchemaLocaleConfidence *)self locale];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"locale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locale hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_confidence;
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
  v5 = [(LTSchemaLocaleConfidence *)self locale];
  v6 = [v4 locale];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(LTSchemaLocaleConfidence *)self locale];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(LTSchemaLocaleConfidence *)self locale];
    objc_super v11 = [v4 locale];
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
    unsigned int confidence = self->_confidence;
    if (confidence != [v4 confidence]) {
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
  uint64_t v4 = [(LTSchemaLocaleConfidence *)self locale];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaLocaleConfidenceReadFrom(self, (uint64_t)a3);
}

- (void)deleteConfidence
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfidence:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int confidence = a3;
}

- (void)deleteLocale
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

@end