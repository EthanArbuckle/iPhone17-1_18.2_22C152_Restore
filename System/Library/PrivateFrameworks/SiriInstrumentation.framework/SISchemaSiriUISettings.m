@interface SISchemaSiriUISettings
- (BOOL)alwaysBlurBackground;
- (BOOL)alwaysShowSiriDialog;
- (BOOL)alwaysShowUserSpeechTranscript;
- (BOOL)hasAlwaysBlurBackground;
- (BOOL)hasAlwaysShowSiriDialog;
- (BOOL)hasAlwaysShowUserSpeechTranscript;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaSiriUISettings)initWithDictionary:(id)a3;
- (SISchemaSiriUISettings)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAlwaysBlurBackground;
- (void)deleteAlwaysShowSiriDialog;
- (void)deleteAlwaysShowUserSpeechTranscript;
- (void)setAlwaysBlurBackground:(BOOL)a3;
- (void)setAlwaysShowSiriDialog:(BOOL)a3;
- (void)setAlwaysShowUserSpeechTranscript:(BOOL)a3;
- (void)setHasAlwaysBlurBackground:(BOOL)a3;
- (void)setHasAlwaysShowSiriDialog:(BOOL)a3;
- (void)setHasAlwaysShowUserSpeechTranscript:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaSiriUISettings

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)alwaysShowSiriDialog
{
  return self->_alwaysShowSiriDialog;
}

- (BOOL)alwaysBlurBackground
{
  return self->_alwaysBlurBackground;
}

- (BOOL)alwaysShowUserSpeechTranscript
{
  return self->_alwaysShowUserSpeechTranscript;
}

- (SISchemaSiriUISettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaSiriUISettings;
  v5 = [(SISchemaSiriUISettings *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"alwaysShowUserSpeechTranscript"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriUISettings setAlwaysShowUserSpeechTranscript:](v5, "setAlwaysShowUserSpeechTranscript:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"alwaysBlurBackground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriUISettings setAlwaysBlurBackground:](v5, "setAlwaysBlurBackground:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"alwaysShowSiriDialog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriUISettings setAlwaysShowSiriDialog:](v5, "setAlwaysShowSiriDialog:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaSiriUISettings)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaSiriUISettings *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaSiriUISettings *)self dictionaryRepresentation];
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
  char v4 = *(&self->_alwaysShowSiriDialog + 1);
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaSiriUISettings alwaysBlurBackground](self, "alwaysBlurBackground"));
    [v3 setObject:v7 forKeyedSubscript:@"alwaysBlurBackground"];

    char v4 = *(&self->_alwaysShowSiriDialog + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_alwaysShowSiriDialog + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaSiriUISettings alwaysShowSiriDialog](self, "alwaysShowSiriDialog"));
  [v3 setObject:v8 forKeyedSubscript:@"alwaysShowSiriDialog"];

  if (*(&self->_alwaysShowSiriDialog + 1))
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaSiriUISettings alwaysShowUserSpeechTranscript](self, "alwaysShowUserSpeechTranscript"));
    [v3 setObject:v5 forKeyedSubscript:@"alwaysShowUserSpeechTranscript"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_alwaysShowSiriDialog + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_alwaysShowSiriDialog + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_alwaysShowSiriDialog + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_alwaysShowUserSpeechTranscript;
  if ((*(&self->_alwaysShowSiriDialog + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_alwaysBlurBackground;
  if ((*(&self->_alwaysShowSiriDialog + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_alwaysShowSiriDialog;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_alwaysShowSiriDialog + 1);
  unsigned int v6 = v4[11];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int alwaysShowUserSpeechTranscript = self->_alwaysShowUserSpeechTranscript;
    if (alwaysShowUserSpeechTranscript != [v4 alwaysShowUserSpeechTranscript]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_alwaysShowSiriDialog + 1);
    unsigned int v6 = v4[11];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int alwaysBlurBackground = self->_alwaysBlurBackground;
    if (alwaysBlurBackground == [v4 alwaysBlurBackground])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_alwaysShowSiriDialog + 1);
      unsigned int v6 = v4[11];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int alwaysShowSiriDialog = self->_alwaysShowSiriDialog;
    if (alwaysShowSiriDialog != [v4 alwaysShowSiriDialog]) {
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
  char v5 = *(&self->_alwaysShowSiriDialog + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_alwaysShowSiriDialog + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_alwaysShowSiriDialog + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(&self->_alwaysShowSiriDialog + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSiriUISettingsReadFrom(self, (uint64_t)a3);
}

- (void)deleteAlwaysShowSiriDialog
{
  *(&self->_alwaysShowSiriDialog + 1) &= ~4u;
}

- (void)setHasAlwaysShowSiriDialog:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_alwaysShowSiriDialog + 1) = *(&self->_alwaysShowSiriDialog + 1) & 0xFB | v3;
}

- (BOOL)hasAlwaysShowSiriDialog
{
  return (*((unsigned __int8 *)&self->_alwaysShowSiriDialog + 1) >> 2) & 1;
}

- (void)setAlwaysShowSiriDialog:(BOOL)a3
{
  *(&self->_alwaysShowSiriDialog + 1) |= 4u;
  self->_int alwaysShowSiriDialog = a3;
}

- (void)deleteAlwaysBlurBackground
{
  *(&self->_alwaysShowSiriDialog + 1) &= ~2u;
}

- (void)setHasAlwaysBlurBackground:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_alwaysShowSiriDialog + 1) = *(&self->_alwaysShowSiriDialog + 1) & 0xFD | v3;
}

- (BOOL)hasAlwaysBlurBackground
{
  return (*((unsigned __int8 *)&self->_alwaysShowSiriDialog + 1) >> 1) & 1;
}

- (void)setAlwaysBlurBackground:(BOOL)a3
{
  *(&self->_alwaysShowSiriDialog + 1) |= 2u;
  self->_int alwaysBlurBackground = a3;
}

- (void)deleteAlwaysShowUserSpeechTranscript
{
  *(&self->_alwaysShowSiriDialog + 1) &= ~1u;
}

- (void)setHasAlwaysShowUserSpeechTranscript:(BOOL)a3
{
  *(&self->_alwaysShowSiriDialog + 1) = *(&self->_alwaysShowSiriDialog + 1) & 0xFE | a3;
}

- (BOOL)hasAlwaysShowUserSpeechTranscript
{
  return *(&self->_alwaysShowSiriDialog + 1);
}

- (void)setAlwaysShowUserSpeechTranscript:(BOOL)a3
{
  *(&self->_alwaysShowSiriDialog + 1) |= 1u;
  self->_int alwaysShowUserSpeechTranscript = a3;
}

@end