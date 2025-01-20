@interface NLXSchemaCDMMultilingualVariant
- (BOOL)hasLanguageVariantConfidenceScore;
- (BOOL)hasLanguageVariantName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMMultilingualVariant)initWithDictionary:(id)a3;
- (NLXSchemaCDMMultilingualVariant)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)languageVariantName;
- (double)languageVariantConfidenceScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLanguageVariantConfidenceScore;
- (void)deleteLanguageVariantName;
- (void)setHasLanguageVariantConfidenceScore:(BOOL)a3;
- (void)setHasLanguageVariantName:(BOOL)a3;
- (void)setLanguageVariantConfidenceScore:(double)a3;
- (void)setLanguageVariantName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMMultilingualVariant

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasLanguageVariantName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)languageVariantConfidenceScore
{
  return self->_languageVariantConfidenceScore;
}

- (void)setLanguageVariantName:(id)a3
{
}

- (NSString)languageVariantName
{
  return self->_languageVariantName;
}

- (NLXSchemaCDMMultilingualVariant)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMMultilingualVariant;
  v5 = [(NLXSchemaCDMMultilingualVariant *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"languageVariantName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NLXSchemaCDMMultilingualVariant *)v5 setLanguageVariantName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"languageVariantConfidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[NLXSchemaCDMMultilingualVariant setLanguageVariantConfidenceScore:](v5, "setLanguageVariantConfidenceScore:");
    }
    v9 = v5;
  }
  return v5;
}

- (NLXSchemaCDMMultilingualVariant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMMultilingualVariant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMMultilingualVariant *)self dictionaryRepresentation];
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
    id v4 = NSNumber;
    [(NLXSchemaCDMMultilingualVariant *)self languageVariantConfidenceScore];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"languageVariantConfidenceScore"];
  }
  if (self->_languageVariantName)
  {
    v6 = [(NLXSchemaCDMMultilingualVariant *)self languageVariantName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"languageVariantName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageVariantName hash];
  if (*(unsigned char *)&self->_has)
  {
    double languageVariantConfidenceScore = self->_languageVariantConfidenceScore;
    double v6 = -languageVariantConfidenceScore;
    if (languageVariantConfidenceScore >= 0.0) {
      double v6 = self->_languageVariantConfidenceScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  v5 = [(NLXSchemaCDMMultilingualVariant *)self languageVariantName];
  double v6 = [v4 languageVariantName];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(NLXSchemaCDMMultilingualVariant *)self languageVariantName];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(NLXSchemaCDMMultilingualVariant *)self languageVariantName];
      objc_super v11 = [v4 languageVariantName];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (double languageVariantConfidenceScore = self->_languageVariantConfidenceScore,
            [v4 languageVariantConfidenceScore],
            languageVariantConfidenceScore == v14))
      {
        BOOL v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {
  }
LABEL_11:
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(NLXSchemaCDMMultilingualVariant *)self languageVariantName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMultilingualVariantReadFrom(self, (uint64_t)a3);
}

- (void)deleteLanguageVariantConfidenceScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLanguageVariantConfidenceScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLanguageVariantConfidenceScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLanguageVariantConfidenceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double languageVariantConfidenceScore = a3;
}

- (void)deleteLanguageVariantName
{
}

- (BOOL)hasLanguageVariantName
{
  return self->_languageVariantName != 0;
}

@end