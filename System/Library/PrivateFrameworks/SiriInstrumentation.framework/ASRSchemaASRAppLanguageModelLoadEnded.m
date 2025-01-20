@interface ASRSchemaASRAppLanguageModelLoadEnded
- (ASRSchemaASRAppLanguageModelLoadEnded)initWithDictionary:(id)a3;
- (ASRSchemaASRAppLanguageModelLoadEnded)initWithJSON:(id)a3;
- (BOOL)hasForegroundCheckTimeInNs;
- (BOOL)hasLoadTimeInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)foregroundCheckTimeInNs;
- (unint64_t)hash;
- (unint64_t)loadTimeInNs;
- (void)deleteForegroundCheckTimeInNs;
- (void)deleteLoadTimeInNs;
- (void)setForegroundCheckTimeInNs:(unint64_t)a3;
- (void)setHasForegroundCheckTimeInNs:(BOOL)a3;
- (void)setHasLoadTimeInNs:(BOOL)a3;
- (void)setLoadTimeInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRAppLanguageModelLoadEnded

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

- (ASRSchemaASRAppLanguageModelLoadEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRAppLanguageModelLoadEnded;
  v5 = [(ASRSchemaASRAppLanguageModelLoadEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"loadTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRAppLanguageModelLoadEnded setLoadTimeInNs:](v5, "setLoadTimeInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"foregroundCheckTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRAppLanguageModelLoadEnded setForegroundCheckTimeInNs:](v5, "setForegroundCheckTimeInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ASRSchemaASRAppLanguageModelLoadEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRAppLanguageModelLoadEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRAppLanguageModelLoadEnded *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRAppLanguageModelLoadEnded foregroundCheckTimeInNs](self, "foregroundCheckTimeInNs"));
    [v3 setObject:v5 forKeyedSubscript:@"foregroundCheckTimeInNs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRAppLanguageModelLoadEnded loadTimeInNs](self, "loadTimeInNs"));
    [v3 setObject:v6 forKeyedSubscript:@"loadTimeInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_loadTimeInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_foregroundCheckTimeInNs;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $C687C0EDAD2FAD1E293E53B41A92454B has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t loadTimeInNs = self->_loadTimeInNs;
    if (loadTimeInNs != [v4 loadTimeInNs])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $C687C0EDAD2FAD1E293E53B41A92454B has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unint64_t foregroundCheckTimeInNs = self->_foregroundCheckTimeInNs;
    if (foregroundCheckTimeInNs != [v4 foregroundCheckTimeInNs]) {
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
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRAppLanguageModelLoadEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteForegroundCheckTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasForegroundCheckTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasForegroundCheckTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setForegroundCheckTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t foregroundCheckTimeInNs = a3;
}

- (void)deleteLoadTimeInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLoadTimeInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLoadTimeInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLoadTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t loadTimeInNs = a3;
}

@end