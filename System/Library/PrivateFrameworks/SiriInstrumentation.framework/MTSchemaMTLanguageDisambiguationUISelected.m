@interface MTSchemaMTLanguageDisambiguationUISelected
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTLanguageDisambiguationUISelected)initWithDictionary:(id)a3;
- (MTSchemaMTLanguageDisambiguationUISelected)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locale;
- (unint64_t)hash;
- (void)deleteLocale;
- (void)setHasLocale:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTLanguageDisambiguationUISelected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)locale
{
  return self->_locale;
}

- (MTSchemaMTLanguageDisambiguationUISelected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSchemaMTLanguageDisambiguationUISelected;
  v5 = [(MTSchemaMTLanguageDisambiguationUISelected *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTLanguageDisambiguationUISelected setLocale:](v5, "setLocale:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (MTSchemaMTLanguageDisambiguationUISelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTLanguageDisambiguationUISelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTLanguageDisambiguationUISelected *)self dictionaryRepresentation];
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
    unsigned int v4 = [(MTSchemaMTLanguageDisambiguationUISelected *)self locale] - 1;
    if (v4 > 0x3D) {
      v5 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v5 = off_1E5EBE240[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"locale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_locale;
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
        || (int locale = self->_locale, locale == [v4 locale]))
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
  return MTSchemaMTLanguageDisambiguationUISelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLocale:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int locale = a3;
}

@end