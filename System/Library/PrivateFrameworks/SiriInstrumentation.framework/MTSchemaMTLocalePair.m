@interface MTSchemaMTLocalePair
- (BOOL)hasSourceLocale;
- (BOOL)hasTargetLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTLocalePair)initWithDictionary:(id)a3;
- (MTSchemaMTLocalePair)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sourceLocale;
- (int)targetLocale;
- (unint64_t)hash;
- (void)deleteSourceLocale;
- (void)deleteTargetLocale;
- (void)setHasSourceLocale:(BOOL)a3;
- (void)setHasTargetLocale:(BOOL)a3;
- (void)setSourceLocale:(int)a3;
- (void)setTargetLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTLocalePair

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)targetLocale
{
  return self->_targetLocale;
}

- (int)sourceLocale
{
  return self->_sourceLocale;
}

- (MTSchemaMTLocalePair)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTSchemaMTLocalePair;
  v5 = [(MTSchemaMTLocalePair *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sourceLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTLocalePair setSourceLocale:](v5, "setSourceLocale:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"targetLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTLocalePair setTargetLocale:](v5, "setTargetLocale:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (MTSchemaMTLocalePair)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTLocalePair *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTLocalePair *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(MTSchemaMTLocalePair *)self sourceLocale] - 1;
    if (v5 > 0x3D) {
      v6 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v6 = off_1E5EB1BE8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"sourceLocale"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(MTSchemaMTLocalePair *)self targetLocale] - 1;
    if (v7 > 0x3D) {
      v8 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v8 = off_1E5EB1BE8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"targetLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_sourceLocale;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_targetLocale;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $6F478D73B3806558BB2990DBB0E654F2 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int sourceLocale = self->_sourceLocale;
    if (sourceLocale != [v4 sourceLocale])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $6F478D73B3806558BB2990DBB0E654F2 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int targetLocale = self->_targetLocale;
    if (targetLocale != [v4 targetLocale]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTLocalePairReadFrom(self, (uint64_t)a3);
}

- (void)deleteTargetLocale
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTargetLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTargetLocale
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTargetLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int targetLocale = a3;
}

- (void)deleteSourceLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSourceLocale:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSourceLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSourceLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sourceLocale = a3;
}

@end