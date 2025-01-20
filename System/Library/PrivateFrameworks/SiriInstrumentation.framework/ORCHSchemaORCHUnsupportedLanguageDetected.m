@interface ORCHSchemaORCHUnsupportedLanguageDetected
- (BOOL)hasLanguageDetected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHUnsupportedLanguageDetected)initWithDictionary:(id)a3;
- (ORCHSchemaORCHUnsupportedLanguageDetected)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)languageDetected;
- (unint64_t)hash;
- (void)deleteLanguageDetected;
- (void)setHasLanguageDetected:(BOOL)a3;
- (void)setLanguageDetected:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHUnsupportedLanguageDetected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)languageDetected
{
  return self->_languageDetected;
}

- (ORCHSchemaORCHUnsupportedLanguageDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ORCHSchemaORCHUnsupportedLanguageDetected;
  v5 = [(ORCHSchemaORCHUnsupportedLanguageDetected *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"languageDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHUnsupportedLanguageDetected setLanguageDetected:](v5, "setLanguageDetected:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHUnsupportedLanguageDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHUnsupportedLanguageDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHUnsupportedLanguageDetected *)self dictionaryRepresentation];
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
    unsigned int v4 = [(ORCHSchemaORCHUnsupportedLanguageDetected *)self languageDetected] - 1;
    if (v4 > 0xB8) {
      v5 = @"ISOLANGUAGECODE_UNKNOWN";
    }
    else {
      v5 = off_1E5EC05C8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"languageDetected"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_languageDetected;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int languageDetected = self->_languageDetected,
            languageDetected == [v4 languageDetected]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHUnsupportedLanguageDetectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLanguageDetected
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLanguageDetected:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLanguageDetected
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLanguageDetected:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int languageDetected = a3;
}

@end