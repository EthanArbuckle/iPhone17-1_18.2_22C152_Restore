@interface ASRSchemaASRAppLanguageModelLoadFailed
- (ASRSchemaASRAppLanguageModelLoadFailed)initWithDictionary:(id)a3;
- (ASRSchemaASRAppLanguageModelLoadFailed)initWithJSON:(id)a3;
- (BOOL)hasForegroundCheckTimeInNs;
- (BOOL)hasLoadTimeInNs;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)foregroundCheckTimeInNs;
- (unint64_t)hash;
- (unint64_t)loadTimeInNs;
- (void)deleteForegroundCheckTimeInNs;
- (void)deleteLoadTimeInNs;
- (void)deleteReason;
- (void)setForegroundCheckTimeInNs:(unint64_t)a3;
- (void)setHasForegroundCheckTimeInNs:(BOOL)a3;
- (void)setHasLoadTimeInNs:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setLoadTimeInNs:(unint64_t)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRAppLanguageModelLoadFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)foregroundCheckTimeInNs
{
  return self->_foregroundCheckTimeInNs;
}

- (unint64_t)loadTimeInNs
{
  return self->_loadTimeInNs;
}

- (int)reason
{
  return self->_reason;
}

- (ASRSchemaASRAppLanguageModelLoadFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASRSchemaASRAppLanguageModelLoadFailed;
  v5 = [(ASRSchemaASRAppLanguageModelLoadFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRAppLanguageModelLoadFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"loadTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRAppLanguageModelLoadFailed setLoadTimeInNs:](v5, "setLoadTimeInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"foregroundCheckTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRAppLanguageModelLoadFailed setForegroundCheckTimeInNs:](v5, "setForegroundCheckTimeInNs:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ASRSchemaASRAppLanguageModelLoadFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRAppLanguageModelLoadFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRAppLanguageModelLoadFailed *)self dictionaryRepresentation];
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
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRAppLanguageModelLoadFailed loadTimeInNs](self, "loadTimeInNs"));
    [v3 setObject:v6 forKeyedSubscript:@"loadTimeInNs"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    unsigned int v7 = [(ASRSchemaASRAppLanguageModelLoadFailed *)self reason] - 1;
    if (v7 > 5) {
      v8 = @"ASRAPPLANGUAGEMODELLOADFAILURE_REASON_UNKNOWN";
    }
    else {
      v8 = off_1E5EAC320[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"reason"];
    goto LABEL_11;
  }
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRAppLanguageModelLoadFailed foregroundCheckTimeInNs](self, "foregroundCheckTimeInNs"));
  [v3 setObject:v5 forKeyedSubscript:@"foregroundCheckTimeInNs"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (has) {
    goto LABEL_7;
  }
LABEL_11:
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
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_reason;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_loadTimeInNs;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_foregroundCheckTimeInNs;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $01F569575AFC5F0CBC349D388374869D has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_14;
    }
    $01F569575AFC5F0CBC349D388374869D has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unint64_t loadTimeInNs = self->_loadTimeInNs;
    if (loadTimeInNs == [v4 loadTimeInNs])
    {
      $01F569575AFC5F0CBC349D388374869D has = self->_has;
      unsigned int v6 = v4[32];
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
    unint64_t foregroundCheckTimeInNs = self->_foregroundCheckTimeInNs;
    if (foregroundCheckTimeInNs != [v4 foregroundCheckTimeInNs]) {
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
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRAppLanguageModelLoadFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteForegroundCheckTimeInNs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasForegroundCheckTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasForegroundCheckTimeInNs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setForegroundCheckTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t foregroundCheckTimeInNs = a3;
}

- (void)deleteLoadTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLoadTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLoadTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLoadTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t loadTimeInNs = a3;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end