@interface SISchemaDeviceFixedContext
- (BOOL)hasDeviceType;
- (BOOL)hasIsSatellitePaired;
- (BOOL)hasSiriDeviceID;
- (BOOL)hasSiriInputLanguage;
- (BOOL)hasSiriUISettings;
- (BOOL)hasSiriVoiceLanguage;
- (BOOL)hasSpeechID;
- (BOOL)hasSystemBuild;
- (BOOL)hasSystemLocale;
- (BOOL)hasVoiceSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSatellitePaired;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)deviceType;
- (NSString)siriDeviceID;
- (NSString)siriInputLanguage;
- (NSString)siriVoiceLanguage;
- (NSString)speechID;
- (NSString)systemBuild;
- (NSString)systemLocale;
- (SISchemaDeviceFixedContext)initWithDictionary:(id)a3;
- (SISchemaDeviceFixedContext)initWithJSON:(id)a3;
- (SISchemaSiriUISettings)siriUISettings;
- (SISchemaVoiceSettings)voiceSettings;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDeviceType;
- (void)deleteIsSatellitePaired;
- (void)deleteSiriDeviceID;
- (void)deleteSiriInputLanguage;
- (void)deleteSiriUISettings;
- (void)deleteSiriVoiceLanguage;
- (void)deleteSpeechID;
- (void)deleteSystemBuild;
- (void)deleteSystemLocale;
- (void)deleteVoiceSettings;
- (void)setDeviceType:(id)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasIsSatellitePaired:(BOOL)a3;
- (void)setHasSiriDeviceID:(BOOL)a3;
- (void)setHasSiriInputLanguage:(BOOL)a3;
- (void)setHasSiriUISettings:(BOOL)a3;
- (void)setHasSiriVoiceLanguage:(BOOL)a3;
- (void)setHasSpeechID:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setHasSystemLocale:(BOOL)a3;
- (void)setHasVoiceSettings:(BOOL)a3;
- (void)setIsSatellitePaired:(BOOL)a3;
- (void)setSiriDeviceID:(id)a3;
- (void)setSiriInputLanguage:(id)a3;
- (void)setSiriUISettings:(id)a3;
- (void)setSiriVoiceLanguage:(id)a3;
- (void)setSpeechID:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)setSystemLocale:(id)a3;
- (void)setVoiceSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDeviceFixedContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDeviceFixedContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8])
  {
    [(SISchemaDeviceFixedContext *)self deleteSiriDeviceID];
    [(SISchemaDeviceFixedContext *)self deleteSpeechID];
  }
  v6 = [(SISchemaDeviceFixedContext *)self siriUISettings];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaDeviceFixedContext *)self deleteSiriUISettings];
  }
  v9 = [(SISchemaDeviceFixedContext *)self voiceSettings];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaDeviceFixedContext *)self deleteVoiceSettings];
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
  objc_storeStrong((id *)&self->_voiceSettings, 0);
  objc_storeStrong((id *)&self->_siriUISettings, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_siriVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_siriInputLanguage, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  self->_hasSiriDeviceID = a3;
}

- (void)setHasSiriUISettings:(BOOL)a3
{
  self->_hasSystemLocale = a3;
}

- (void)setHasSpeechID:(BOOL)a3
{
  self->_hasSiriVoiceLanguage = a3;
}

- (void)setHasSiriDeviceID:(BOOL)a3
{
  self->_hasSiriInputLanguage = a3;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasSiriVoiceLanguage:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasSiriInputLanguage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setVoiceSettings:(id)a3
{
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (BOOL)isSatellitePaired
{
  return self->_isSatellitePaired;
}

- (void)setSiriUISettings:(id)a3
{
}

- (SISchemaSiriUISettings)siriUISettings
{
  return self->_siriUISettings;
}

- (void)setSpeechID:(id)a3
{
}

- (NSString)speechID
{
  return self->_speechID;
}

- (void)setSiriDeviceID:(id)a3
{
}

- (NSString)siriDeviceID
{
  return self->_siriDeviceID;
}

- (void)setSystemLocale:(id)a3
{
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (void)setSiriVoiceLanguage:(id)a3
{
}

- (NSString)siriVoiceLanguage
{
  return self->_siriVoiceLanguage;
}

- (void)setSiriInputLanguage:(id)a3
{
}

- (NSString)siriInputLanguage
{
  return self->_siriInputLanguage;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (SISchemaDeviceFixedContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SISchemaDeviceFixedContext;
  v5 = [(SISchemaDeviceFixedContext *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaDeviceFixedContext *)v5 setDeviceType:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaDeviceFixedContext *)v5 setSystemBuild:v9];
    }
    v28 = v8;
    v10 = [v4 objectForKeyedSubscript:@"siriInputLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(SISchemaDeviceFixedContext *)v5 setSiriInputLanguage:v11];
    }
    v27 = v10;
    v12 = [v4 objectForKeyedSubscript:@"siriVoiceLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(SISchemaDeviceFixedContext *)v5 setSiriVoiceLanguage:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"systemLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(SISchemaDeviceFixedContext *)v5 setSystemLocale:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"siriDeviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(SISchemaDeviceFixedContext *)v5 setSiriDeviceID:v17];
    }
    v29 = v6;
    v18 = [v4 objectForKeyedSubscript:@"speechID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(SISchemaDeviceFixedContext *)v5 setSpeechID:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"siriUISettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[SISchemaSiriUISettings alloc] initWithDictionary:v20];
      [(SISchemaDeviceFixedContext *)v5 setSiriUISettings:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"isSatellitePaired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDeviceFixedContext setIsSatellitePaired:](v5, "setIsSatellitePaired:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"voiceSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[SISchemaVoiceSettings alloc] initWithDictionary:v23];
      [(SISchemaDeviceFixedContext *)v5 setVoiceSettings:v24];
    }
    v25 = v5;
  }
  return v5;
}

- (SISchemaDeviceFixedContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDeviceFixedContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDeviceFixedContext *)self dictionaryRepresentation];
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
  if (self->_deviceType)
  {
    id v4 = [(SISchemaDeviceFixedContext *)self deviceType];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"deviceType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaDeviceFixedContext isSatellitePaired](self, "isSatellitePaired"));
    [v3 setObject:v6 forKeyedSubscript:@"isSatellitePaired"];
  }
  if (self->_siriDeviceID)
  {
    uint64_t v7 = [(SISchemaDeviceFixedContext *)self siriDeviceID];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"siriDeviceID"];
  }
  if (self->_siriInputLanguage)
  {
    v9 = [(SISchemaDeviceFixedContext *)self siriInputLanguage];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"siriInputLanguage"];
  }
  if (self->_siriUISettings)
  {
    int v11 = [(SISchemaDeviceFixedContext *)self siriUISettings];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"siriUISettings"];
    }
    else
    {
      objc_super v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"siriUISettings"];
    }
  }
  if (self->_siriVoiceLanguage)
  {
    v14 = [(SISchemaDeviceFixedContext *)self siriVoiceLanguage];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"siriVoiceLanguage"];
  }
  if (self->_speechID)
  {
    v16 = [(SISchemaDeviceFixedContext *)self speechID];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"speechID"];
  }
  if (self->_systemBuild)
  {
    v18 = [(SISchemaDeviceFixedContext *)self systemBuild];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"systemBuild"];
  }
  if (self->_systemLocale)
  {
    v20 = [(SISchemaDeviceFixedContext *)self systemLocale];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"systemLocale"];
  }
  if (self->_voiceSettings)
  {
    v22 = [(SISchemaDeviceFixedContext *)self voiceSettings];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"voiceSettings"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"voiceSettings"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceType hash];
  NSUInteger v4 = [(NSString *)self->_systemBuild hash];
  NSUInteger v5 = [(NSString *)self->_siriInputLanguage hash];
  NSUInteger v6 = [(NSString *)self->_siriVoiceLanguage hash];
  NSUInteger v7 = [(NSString *)self->_systemLocale hash];
  NSUInteger v8 = [(NSString *)self->_siriDeviceID hash];
  NSUInteger v9 = [(NSString *)self->_speechID hash];
  unint64_t v10 = [(SISchemaSiriUISettings *)self->_siriUISettings hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_isSatellitePaired;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(SISchemaVoiceSettings *)self->_voiceSettings hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self deviceType];
  NSUInteger v6 = [v4 deviceType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v7 = [(SISchemaDeviceFixedContext *)self deviceType];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(SISchemaDeviceFixedContext *)self deviceType];
    unint64_t v10 = [v4 deviceType];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self systemBuild];
  NSUInteger v6 = [v4 systemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v12 = [(SISchemaDeviceFixedContext *)self systemBuild];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaDeviceFixedContext *)self systemBuild];
    v15 = [v4 systemBuild];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self siriInputLanguage];
  NSUInteger v6 = [v4 siriInputLanguage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v17 = [(SISchemaDeviceFixedContext *)self siriInputLanguage];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(SISchemaDeviceFixedContext *)self siriInputLanguage];
    v20 = [v4 siriInputLanguage];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self siriVoiceLanguage];
  NSUInteger v6 = [v4 siriVoiceLanguage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v22 = [(SISchemaDeviceFixedContext *)self siriVoiceLanguage];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(SISchemaDeviceFixedContext *)self siriVoiceLanguage];
    v25 = [v4 siriVoiceLanguage];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self systemLocale];
  NSUInteger v6 = [v4 systemLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v27 = [(SISchemaDeviceFixedContext *)self systemLocale];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(SISchemaDeviceFixedContext *)self systemLocale];
    objc_super v30 = [v4 systemLocale];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self siriDeviceID];
  NSUInteger v6 = [v4 siriDeviceID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v32 = [(SISchemaDeviceFixedContext *)self siriDeviceID];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(SISchemaDeviceFixedContext *)self siriDeviceID];
    v35 = [v4 siriDeviceID];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self speechID];
  NSUInteger v6 = [v4 speechID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v37 = [(SISchemaDeviceFixedContext *)self speechID];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(SISchemaDeviceFixedContext *)self speechID];
    v40 = [v4 speechID];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self siriUISettings];
  NSUInteger v6 = [v4 siriUISettings];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v42 = [(SISchemaDeviceFixedContext *)self siriUISettings];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(SISchemaDeviceFixedContext *)self siriUISettings];
    v45 = [v4 siriUISettings];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[88] & 1)) {
    goto LABEL_50;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isSatellitePaired = self->_isSatellitePaired;
    if (isSatellitePaired != [v4 isSatellitePaired]) {
      goto LABEL_50;
    }
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self voiceSettings];
  NSUInteger v6 = [v4 voiceSettings];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v48 = [(SISchemaDeviceFixedContext *)self voiceSettings];
    if (!v48)
    {

LABEL_53:
      BOOL v53 = 1;
      goto LABEL_51;
    }
    v49 = (void *)v48;
    v50 = [(SISchemaDeviceFixedContext *)self voiceSettings];
    v51 = [v4 voiceSettings];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_53;
    }
  }
  else
  {
LABEL_49:
  }
LABEL_50:
  BOOL v53 = 0;
LABEL_51:

  return v53;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  NSUInteger v4 = [(SISchemaDeviceFixedContext *)self deviceType];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(SISchemaDeviceFixedContext *)self systemBuild];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(SISchemaDeviceFixedContext *)self siriInputLanguage];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SISchemaDeviceFixedContext *)self siriVoiceLanguage];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(SISchemaDeviceFixedContext *)self systemLocale];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v9 = [(SISchemaDeviceFixedContext *)self siriDeviceID];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  unint64_t v10 = [(SISchemaDeviceFixedContext *)self speechID];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(SISchemaDeviceFixedContext *)self siriUISettings];

  if (v11)
  {
    uint64_t v12 = [(SISchemaDeviceFixedContext *)self siriUISettings];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  objc_super v13 = [(SISchemaDeviceFixedContext *)self voiceSettings];

  v14 = v16;
  if (v13)
  {
    v15 = [(SISchemaDeviceFixedContext *)self voiceSettings];
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDeviceFixedContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceSettings
{
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (void)deleteIsSatellitePaired
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSatellitePaired:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSatellitePaired
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSatellitePaired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSatellitePaired = a3;
}

- (void)deleteSiriUISettings
{
}

- (BOOL)hasSiriUISettings
{
  return self->_siriUISettings != 0;
}

- (void)deleteSpeechID
{
}

- (BOOL)hasSpeechID
{
  return self->_speechID != 0;
}

- (void)deleteSiriDeviceID
{
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
}

- (void)deleteSystemLocale
{
}

- (BOOL)hasSystemLocale
{
  return self->_systemLocale != 0;
}

- (void)deleteSiriVoiceLanguage
{
}

- (BOOL)hasSiriVoiceLanguage
{
  return self->_siriVoiceLanguage != 0;
}

- (void)deleteSiriInputLanguage
{
}

- (BOOL)hasSiriInputLanguage
{
  return self->_siriInputLanguage != 0;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

@end