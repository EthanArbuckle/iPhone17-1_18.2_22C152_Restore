@interface SADSchemaSADImmediateDownloadTriggered
- (BOOL)existingAssets;
- (BOOL)hasExistingAssets;
- (BOOL)hasLocale;
- (BOOL)hasRetryCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SADSchemaSADImmediateDownloadTriggered)initWithDictionary:(id)a3;
- (SADSchemaSADImmediateDownloadTriggered)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locale;
- (unint64_t)hash;
- (unsigned)retryCount;
- (void)deleteExistingAssets;
- (void)deleteLocale;
- (void)deleteRetryCount;
- (void)setExistingAssets:(BOOL)a3;
- (void)setHasExistingAssets:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasRetryCount:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)setRetryCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SADSchemaSADImmediateDownloadTriggered

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (BOOL)existingAssets
{
  return self->_existingAssets;
}

- (int)locale
{
  return self->_locale;
}

- (SADSchemaSADImmediateDownloadTriggered)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SADSchemaSADImmediateDownloadTriggered;
  v5 = [(SADSchemaSADImmediateDownloadTriggered *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADImmediateDownloadTriggered setLocale:](v5, "setLocale:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"existingAssets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADImmediateDownloadTriggered setExistingAssets:](v5, "setExistingAssets:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"retryCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADImmediateDownloadTriggered setRetryCount:](v5, "setRetryCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SADSchemaSADImmediateDownloadTriggered)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SADSchemaSADImmediateDownloadTriggered *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SADSchemaSADImmediateDownloadTriggered *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SADSchemaSADImmediateDownloadTriggered existingAssets](self, "existingAssets"));
    [v3 setObject:v7 forKeyedSubscript:@"existingAssets"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(SADSchemaSADImmediateDownloadTriggered *)self locale] - 1;
  if (v8 > 0x3D) {
    v9 = @"LOCALE_UNKNOWN_LOCALE";
  }
  else {
    v9 = off_1E5EB4C30[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"locale"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SADSchemaSADImmediateDownloadTriggered retryCount](self, "retryCount"));
  [v3 setObject:v5 forKeyedSubscript:@"retryCount"];

LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_locale;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_existingAssets;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_retryCount;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $25C9E36BE6107429B28F79A9D959A98C has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int locale = self->_locale;
    if (locale != [v4 locale]) {
      goto LABEL_14;
    }
    $25C9E36BE6107429B28F79A9D959A98C has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int existingAssets = self->_existingAssets;
    if (existingAssets == [v4 existingAssets])
    {
      $25C9E36BE6107429B28F79A9D959A98C has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    unsigned int retryCount = self->_retryCount;
    if (retryCount != [v4 retryCount]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADImmediateDownloadTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)deleteRetryCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasRetryCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRetryCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRetryCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int retryCount = a3;
}

- (void)deleteExistingAssets
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasExistingAssets:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExistingAssets
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setExistingAssets:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int existingAssets = a3;
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