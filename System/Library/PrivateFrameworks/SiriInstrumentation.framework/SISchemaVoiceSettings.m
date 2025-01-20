@interface SISchemaVoiceSettings
- (BOOL)hasVoiceAccent;
- (BOOL)hasVoiceAccentV2;
- (BOOL)hasVoiceGender;
- (BOOL)hasVoiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)voiceName;
- (SISchemaISOLocale)voiceAccentV2;
- (SISchemaVoiceSettings)initWithDictionary:(id)a3;
- (SISchemaVoiceSettings)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)voiceAccent;
- (int)voiceGender;
- (unint64_t)hash;
- (void)deleteVoiceAccent;
- (void)deleteVoiceAccentV2;
- (void)deleteVoiceGender;
- (void)deleteVoiceName;
- (void)setHasVoiceAccent:(BOOL)a3;
- (void)setHasVoiceAccentV2:(BOOL)a3;
- (void)setHasVoiceGender:(BOOL)a3;
- (void)setHasVoiceName:(BOOL)a3;
- (void)setVoiceAccent:(int)a3;
- (void)setVoiceAccentV2:(id)a3;
- (void)setVoiceGender:(int)a3;
- (void)setVoiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaVoiceSettings

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaVoiceSettings;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaVoiceSettings *)self voiceAccentV2];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaVoiceSettings *)self deleteVoiceAccentV2];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceAccentV2, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
}

- (void)setHasVoiceAccentV2:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasVoiceName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setVoiceAccentV2:(id)a3
{
}

- (SISchemaISOLocale)voiceAccentV2
{
  return self->_voiceAccentV2;
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (int)voiceAccent
{
  return self->_voiceAccent;
}

- (int)voiceGender
{
  return self->_voiceGender;
}

- (SISchemaVoiceSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaVoiceSettings;
  v5 = [(SISchemaVoiceSettings *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceGender"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVoiceSettings setVoiceGender:](v5, "setVoiceGender:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"voiceAccent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVoiceSettings setVoiceAccent:](v5, "setVoiceAccent:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"voiceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaVoiceSettings *)v5 setVoiceName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"voiceAccentV2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[SISchemaISOLocale alloc] initWithDictionary:v10];
      [(SISchemaVoiceSettings *)v5 setVoiceAccentV2:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaVoiceSettings)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaVoiceSettings *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaVoiceSettings *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v4 = [(SISchemaVoiceSettings *)self voiceAccent] - 1;
    if (v4 > 0x3D) {
      v5 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v5 = off_1E5EB8DA0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"voiceAccent"];
  }
  if (self->_voiceAccentV2)
  {
    v6 = [(SISchemaVoiceSettings *)self voiceAccentV2];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"voiceAccentV2"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"voiceAccentV2"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(SISchemaVoiceSettings *)self voiceGender] - 1;
    if (v9 > 2) {
      v10 = @"VOICEGENDER_UNKNOWN_VOICE_GENDER";
    }
    else {
      v10 = off_1E5EB8F90[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"voiceGender"];
  }
  if (self->_voiceName)
  {
    v11 = [(SISchemaVoiceSettings *)self voiceName];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"voiceName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_voiceGender;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_voiceAccent;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_voiceName hash];
  return v5 ^ [(SISchemaISOLocale *)self->_voiceAccentV2 hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $09E27EB0C37AE32C8FD192ECFCBB73AC has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int voiceGender = self->_voiceGender;
    if (voiceGender != [v4 voiceGender]) {
      goto LABEL_19;
    }
    $09E27EB0C37AE32C8FD192ECFCBB73AC has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int voiceAccent = self->_voiceAccent;
    if (voiceAccent != [v4 voiceAccent]) {
      goto LABEL_19;
    }
  }
  v10 = [(SISchemaVoiceSettings *)self voiceName];
  v11 = [v4 voiceName];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_18;
  }
  uint64_t v12 = [(SISchemaVoiceSettings *)self voiceName];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(SISchemaVoiceSettings *)self voiceName];
    v15 = [v4 voiceName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  v10 = [(SISchemaVoiceSettings *)self voiceAccentV2];
  v11 = [v4 voiceAccentV2];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v17 = [(SISchemaVoiceSettings *)self voiceAccentV2];
    if (!v17)
    {

LABEL_22:
      BOOL v22 = 1;
      goto LABEL_20;
    }
    v18 = (void *)v17;
    v19 = [(SISchemaVoiceSettings *)self voiceAccentV2];
    v20 = [v4 voiceAccentV2];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_18:
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(SISchemaVoiceSettings *)self voiceName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(SISchemaVoiceSettings *)self voiceAccentV2];

  uint64_t v7 = v9;
  if (v6)
  {
    int v8 = [(SISchemaVoiceSettings *)self voiceAccentV2];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVoiceSettingsReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceAccentV2
{
}

- (BOOL)hasVoiceAccentV2
{
  return self->_voiceAccentV2 != 0;
}

- (void)deleteVoiceName
{
}

- (BOOL)hasVoiceName
{
  return self->_voiceName != 0;
}

- (void)deleteVoiceAccent
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVoiceAccent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVoiceAccent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVoiceAccent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int voiceAccent = a3;
}

- (void)deleteVoiceGender
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasVoiceGender:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVoiceGender
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVoiceGender:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int voiceGender = a3;
}

@end