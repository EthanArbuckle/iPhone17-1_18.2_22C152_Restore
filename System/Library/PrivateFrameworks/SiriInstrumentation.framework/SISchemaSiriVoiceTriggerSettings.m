@interface SISchemaSiriVoiceTriggerSettings
- (BOOL)hasIsEnrollmentReprompted;
- (BOOL)hasIsHeySiriTriggerPhraseEnabled;
- (BOOL)hasIsJustSiriTriggerPhraseEnabled;
- (BOOL)isEnrollmentReprompted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHeySiriTriggerPhraseEnabled;
- (BOOL)isJustSiriTriggerPhraseEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaSiriVoiceTriggerSettings)initWithDictionary:(id)a3;
- (SISchemaSiriVoiceTriggerSettings)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsEnrollmentReprompted;
- (void)deleteIsHeySiriTriggerPhraseEnabled;
- (void)deleteIsJustSiriTriggerPhraseEnabled;
- (void)setHasIsEnrollmentReprompted:(BOOL)a3;
- (void)setHasIsHeySiriTriggerPhraseEnabled:(BOOL)a3;
- (void)setHasIsJustSiriTriggerPhraseEnabled:(BOOL)a3;
- (void)setIsEnrollmentReprompted:(BOOL)a3;
- (void)setIsHeySiriTriggerPhraseEnabled:(BOOL)a3;
- (void)setIsJustSiriTriggerPhraseEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaSiriVoiceTriggerSettings

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isEnrollmentReprompted
{
  return self->_isEnrollmentReprompted;
}

- (BOOL)isJustSiriTriggerPhraseEnabled
{
  return self->_isJustSiriTriggerPhraseEnabled;
}

- (BOOL)isHeySiriTriggerPhraseEnabled
{
  return self->_isHeySiriTriggerPhraseEnabled;
}

- (SISchemaSiriVoiceTriggerSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaSiriVoiceTriggerSettings;
  v5 = [(SISchemaSiriVoiceTriggerSettings *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isHeySiriTriggerPhraseEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriVoiceTriggerSettings setIsHeySiriTriggerPhraseEnabled:](v5, "setIsHeySiriTriggerPhraseEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isJustSiriTriggerPhraseEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriVoiceTriggerSettings setIsJustSiriTriggerPhraseEnabled:](v5, "setIsJustSiriTriggerPhraseEnabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isEnrollmentReprompted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSiriVoiceTriggerSettings setIsEnrollmentReprompted:](v5, "setIsEnrollmentReprompted:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaSiriVoiceTriggerSettings)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaSiriVoiceTriggerSettings *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaSiriVoiceTriggerSettings *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isEnrollmentReprompted + 1);
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaSiriVoiceTriggerSettings isEnrollmentReprompted](self, "isEnrollmentReprompted"));
    [v3 setObject:v7 forKeyedSubscript:@"isEnrollmentReprompted"];

    char v4 = *(&self->_isEnrollmentReprompted + 1);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!*(&self->_isEnrollmentReprompted + 1))
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaSiriVoiceTriggerSettings isHeySiriTriggerPhraseEnabled](self, "isHeySiriTriggerPhraseEnabled"));
  [v3 setObject:v8 forKeyedSubscript:@"isHeySiriTriggerPhraseEnabled"];

  if ((*(&self->_isEnrollmentReprompted + 1) & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaSiriVoiceTriggerSettings isJustSiriTriggerPhraseEnabled](self, "isJustSiriTriggerPhraseEnabled"));
    [v3 setObject:v5 forKeyedSubscript:@"isJustSiriTriggerPhraseEnabled"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isEnrollmentReprompted + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_isEnrollmentReprompted + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_isEnrollmentReprompted + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_isHeySiriTriggerPhraseEnabled;
  if ((*(&self->_isEnrollmentReprompted + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isJustSiriTriggerPhraseEnabled;
  if ((*(&self->_isEnrollmentReprompted + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isEnrollmentReprompted;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isEnrollmentReprompted + 1);
  unsigned int v6 = v4[11];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int isHeySiriTriggerPhraseEnabled = self->_isHeySiriTriggerPhraseEnabled;
    if (isHeySiriTriggerPhraseEnabled != [v4 isHeySiriTriggerPhraseEnabled]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEnrollmentReprompted + 1);
    unsigned int v6 = v4[11];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int isJustSiriTriggerPhraseEnabled = self->_isJustSiriTriggerPhraseEnabled;
    if (isJustSiriTriggerPhraseEnabled == [v4 isJustSiriTriggerPhraseEnabled])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isEnrollmentReprompted + 1);
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
    int isEnrollmentReprompted = self->_isEnrollmentReprompted;
    if (isEnrollmentReprompted != [v4 isEnrollmentReprompted]) {
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
  char v5 = *(&self->_isEnrollmentReprompted + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_isEnrollmentReprompted + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isEnrollmentReprompted + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(&self->_isEnrollmentReprompted + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSiriVoiceTriggerSettingsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEnrollmentReprompted
{
  *(&self->_isEnrollmentReprompted + 1) &= ~4u;
}

- (void)setHasIsEnrollmentReprompted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEnrollmentReprompted + 1) = *(&self->_isEnrollmentReprompted + 1) & 0xFB | v3;
}

- (BOOL)hasIsEnrollmentReprompted
{
  return (*((unsigned __int8 *)&self->_isEnrollmentReprompted + 1) >> 2) & 1;
}

- (void)setIsEnrollmentReprompted:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) |= 4u;
  self->_int isEnrollmentReprompted = a3;
}

- (void)deleteIsJustSiriTriggerPhraseEnabled
{
  *(&self->_isEnrollmentReprompted + 1) &= ~2u;
}

- (void)setHasIsJustSiriTriggerPhraseEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEnrollmentReprompted + 1) = *(&self->_isEnrollmentReprompted + 1) & 0xFD | v3;
}

- (BOOL)hasIsJustSiriTriggerPhraseEnabled
{
  return (*((unsigned __int8 *)&self->_isEnrollmentReprompted + 1) >> 1) & 1;
}

- (void)setIsJustSiriTriggerPhraseEnabled:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) |= 2u;
  self->_int isJustSiriTriggerPhraseEnabled = a3;
}

- (void)deleteIsHeySiriTriggerPhraseEnabled
{
  *(&self->_isEnrollmentReprompted + 1) &= ~1u;
}

- (void)setHasIsHeySiriTriggerPhraseEnabled:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) = *(&self->_isEnrollmentReprompted + 1) & 0xFE | a3;
}

- (BOOL)hasIsHeySiriTriggerPhraseEnabled
{
  return *(&self->_isEnrollmentReprompted + 1);
}

- (void)setIsHeySiriTriggerPhraseEnabled:(BOOL)a3
{
  *(&self->_isEnrollmentReprompted + 1) |= 1u;
  self->_int isHeySiriTriggerPhraseEnabled = a3;
}

@end