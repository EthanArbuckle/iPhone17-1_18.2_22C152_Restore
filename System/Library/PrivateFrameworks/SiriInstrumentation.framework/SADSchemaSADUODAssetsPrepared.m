@interface SADSchemaSADUODAssetsPrepared
- (BOOL)hasElapsedSeconds;
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SADSchemaSADUODAssetsPrepared)initWithDictionary:(id)a3;
- (SADSchemaSADUODAssetsPrepared)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locale;
- (unint64_t)hash;
- (unsigned)elapsedSeconds;
- (void)deleteElapsedSeconds;
- (void)deleteLocale;
- (void)setElapsedSeconds:(unsigned int)a3;
- (void)setHasElapsedSeconds:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SADSchemaSADUODAssetsPrepared

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)elapsedSeconds
{
  return self->_elapsedSeconds;
}

- (int)locale
{
  return self->_locale;
}

- (SADSchemaSADUODAssetsPrepared)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SADSchemaSADUODAssetsPrepared;
  v5 = [(SADSchemaSADUODAssetsPrepared *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADUODAssetsPrepared setLocale:](v5, "setLocale:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"elapsedSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADUODAssetsPrepared setElapsedSeconds:](v5, "setElapsedSeconds:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (SADSchemaSADUODAssetsPrepared)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SADSchemaSADUODAssetsPrepared *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SADSchemaSADUODAssetsPrepared *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SADSchemaSADUODAssetsPrepared elapsedSeconds](self, "elapsedSeconds"));
    [v3 setObject:v5 forKeyedSubscript:@"elapsedSeconds"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(SADSchemaSADUODAssetsPrepared *)self locale] - 1;
    if (v6 > 0x3D) {
      uint64_t v7 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      uint64_t v7 = off_1E5EB4E88[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"locale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_locale;
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
  uint64_t v3 = 2654435761 * self->_elapsedSeconds;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $0AA6E08B4EADA8B39DBD698815324617 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int locale = self->_locale;
    if (locale != [v4 locale])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $0AA6E08B4EADA8B39DBD698815324617 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int elapsedSeconds = self->_elapsedSeconds;
    if (elapsedSeconds != [v4 elapsedSeconds]) {
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
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADUODAssetsPreparedReadFrom(self, (uint64_t)a3);
}

- (void)deleteElapsedSeconds
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasElapsedSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasElapsedSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setElapsedSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int elapsedSeconds = a3;
}

- (void)deleteLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLocale:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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