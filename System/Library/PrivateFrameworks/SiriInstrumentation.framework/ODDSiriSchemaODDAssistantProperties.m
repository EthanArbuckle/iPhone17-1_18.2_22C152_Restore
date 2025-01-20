@interface ODDSiriSchemaODDAssistantProperties
- (BOOL)hasAppleIntelligence;
- (BOOL)hasHomeKit;
- (BOOL)hasInputLocale;
- (BOOL)hasIsAssistantEnabled;
- (BOOL)hasIsPreciseLocationEnabled;
- (BOOL)hasListenFor;
- (BOOL)hasLocationAccessPermission;
- (BOOL)hasNumSiriShortcutsEnabled;
- (BOOL)hasOptIn;
- (BOOL)hasVoice;
- (BOOL)isAssistantEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreciseLocationEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAppleIntelligenceProperties)appleIntelligence;
- (ODDSiriSchemaODDAssistantProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantProperties)initWithJSON:(id)a3;
- (ODDSiriSchemaODDHomeKitProperties)homeKit;
- (ODDSiriSchemaODDOptInProperties)optIn;
- (ODDSiriSchemaODDVoiceProperties)voice;
- (SISchemaISOLocale)inputLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)listenFor;
- (int)locationAccessPermission;
- (int)numSiriShortcutsEnabled;
- (unint64_t)hash;
- (void)deleteAppleIntelligence;
- (void)deleteHomeKit;
- (void)deleteInputLocale;
- (void)deleteIsAssistantEnabled;
- (void)deleteIsPreciseLocationEnabled;
- (void)deleteListenFor;
- (void)deleteLocationAccessPermission;
- (void)deleteNumSiriShortcutsEnabled;
- (void)deleteOptIn;
- (void)deleteVoice;
- (void)setAppleIntelligence:(id)a3;
- (void)setHasAppleIntelligence:(BOOL)a3;
- (void)setHasHomeKit:(BOOL)a3;
- (void)setHasInputLocale:(BOOL)a3;
- (void)setHasIsAssistantEnabled:(BOOL)a3;
- (void)setHasIsPreciseLocationEnabled:(BOOL)a3;
- (void)setHasListenFor:(BOOL)a3;
- (void)setHasLocationAccessPermission:(BOOL)a3;
- (void)setHasNumSiriShortcutsEnabled:(BOOL)a3;
- (void)setHasOptIn:(BOOL)a3;
- (void)setHasVoice:(BOOL)a3;
- (void)setHomeKit:(id)a3;
- (void)setInputLocale:(id)a3;
- (void)setIsAssistantEnabled:(BOOL)a3;
- (void)setIsPreciseLocationEnabled:(BOOL)a3;
- (void)setListenFor:(int)a3;
- (void)setLocationAccessPermission:(int)a3;
- (void)setNumSiriShortcutsEnabled:(int)a3;
- (void)setOptIn:(id)a3;
- (void)setVoice:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ODDSiriSchemaODDAssistantProperties;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssistantProperties *)self deleteInputLocale];
  }
  v9 = [(ODDSiriSchemaODDAssistantProperties *)self voice];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssistantProperties *)self deleteVoice];
  }
  v12 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDAssistantProperties *)self deleteOptIn];
  }
  v15 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ODDSiriSchemaODDAssistantProperties *)self deleteHomeKit];
  }
  v18 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ODDSiriSchemaODDAssistantProperties *)self deleteAppleIntelligence];
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
  objc_storeStrong((id *)&self->_appleIntelligence, 0);
  objc_storeStrong((id *)&self->_homeKit, 0);
  objc_storeStrong((id *)&self->_optIn, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_inputLocale, 0);
}

- (void)setHasAppleIntelligence:(BOOL)a3
{
  self->_hasVoice = a3;
}

- (void)setHasHomeKit:(BOOL)a3
{
  self->_hasInputLocale = a3;
}

- (void)setHasOptIn:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasVoice:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasInputLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAppleIntelligence:(id)a3
{
}

- (ODDSiriSchemaODDAppleIntelligenceProperties)appleIntelligence
{
  return self->_appleIntelligence;
}

- (int)locationAccessPermission
{
  return self->_locationAccessPermission;
}

- (void)setHomeKit:(id)a3
{
}

- (ODDSiriSchemaODDHomeKitProperties)homeKit
{
  return self->_homeKit;
}

- (void)setOptIn:(id)a3
{
}

- (ODDSiriSchemaODDOptInProperties)optIn
{
  return self->_optIn;
}

- (void)setVoice:(id)a3
{
}

- (ODDSiriSchemaODDVoiceProperties)voice
{
  return self->_voice;
}

- (BOOL)isPreciseLocationEnabled
{
  return self->_isPreciseLocationEnabled;
}

- (int)numSiriShortcutsEnabled
{
  return self->_numSiriShortcutsEnabled;
}

- (int)listenFor
{
  return self->_listenFor;
}

- (void)setInputLocale:(id)a3
{
}

- (SISchemaISOLocale)inputLocale
{
  return self->_inputLocale;
}

- (BOOL)isAssistantEnabled
{
  return self->_isAssistantEnabled;
}

- (ODDSiriSchemaODDAssistantProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ODDSiriSchemaODDAssistantProperties;
  v5 = [(ODDSiriSchemaODDAssistantProperties *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAssistantEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantProperties setIsAssistantEnabled:](v5, "setIsAssistantEnabled:", [v6 BOOLValue]);
    }
    v25 = v6;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"inputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaISOLocale alloc] initWithDictionary:v7];
      [(ODDSiriSchemaODDAssistantProperties *)v5 setInputLocale:v8];
    }
    v24 = (void *)v7;
    v9 = [v4 objectForKeyedSubscript:@"listenFor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantProperties setListenFor:](v5, "setListenFor:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numSiriShortcutsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantProperties setNumSiriShortcutsEnabled:](v5, "setNumSiriShortcutsEnabled:", [v10 intValue]);
    }
    v23 = v9;
    int v11 = [v4 objectForKeyedSubscript:@"isPreciseLocationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantProperties setIsPreciseLocationEnabled:](v5, "setIsPreciseLocationEnabled:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"voice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ODDSiriSchemaODDVoiceProperties alloc] initWithDictionary:v12];
      [(ODDSiriSchemaODDAssistantProperties *)v5 setVoice:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"optIn"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ODDSiriSchemaODDOptInProperties alloc] initWithDictionary:v14];
      [(ODDSiriSchemaODDAssistantProperties *)v5 setOptIn:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"homeKit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[ODDSiriSchemaODDHomeKitProperties alloc] initWithDictionary:v16];
      [(ODDSiriSchemaODDAssistantProperties *)v5 setHomeKit:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"locationAccessPermission"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantProperties setLocationAccessPermission:](v5, "setLocationAccessPermission:", [v18 intValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"appleIntelligence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v20 = [[ODDSiriSchemaODDAppleIntelligenceProperties alloc] initWithDictionary:v19];
      [(ODDSiriSchemaODDAssistantProperties *)v5 setAppleIntelligence:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantProperties *)self dictionaryRepresentation];
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
  if (self->_appleIntelligence)
  {
    id v4 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appleIntelligence"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appleIntelligence"];
    }
  }
  if (self->_homeKit)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"homeKit"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"homeKit"];
    }
  }
  if (self->_inputLocale)
  {
    v10 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"inputLocale"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"inputLocale"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAssistantProperties isAssistantEnabled](self, "isAssistantEnabled"));
    [v3 setObject:v17 forKeyedSubscript:@"isAssistantEnabled"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_18:
      if ((has & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_18;
  }
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAssistantProperties isPreciseLocationEnabled](self, "isPreciseLocationEnabled"));
  [v3 setObject:v18 forKeyedSubscript:@"isPreciseLocationEnabled"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_27:
  unsigned int v19 = [(ODDSiriSchemaODDAssistantProperties *)self listenFor] - 1;
  if (v19 > 2) {
    int v20 = @"ODDLISTENFOR_UNKNOWN";
  }
  else {
    int v20 = off_1E5EBD628[v19];
  }
  [v3 setObject:v20 forKeyedSubscript:@"listenFor"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_36:
  unsigned int v24 = [(ODDSiriSchemaODDAssistantProperties *)self locationAccessPermission] - 1;
  if (v24 > 5) {
    v25 = @"ODDLOCATIONACCESSPERMISSION_UNKNOWN";
  }
  else {
    v25 = off_1E5EBD640[v24];
  }
  [v3 setObject:v25 forKeyedSubscript:@"locationAccessPermission"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_21:
    int v14 = objc_msgSend(NSNumber, "numberWithInt:", -[ODDSiriSchemaODDAssistantProperties numSiriShortcutsEnabled](self, "numSiriShortcutsEnabled"));
    [v3 setObject:v14 forKeyedSubscript:@"numSiriShortcutsEnabled"];
  }
LABEL_22:
  if (self->_optIn)
  {
    v15 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"optIn"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"optIn"];
    }
  }
  if (self->_voice)
  {
    objc_super v22 = [(ODDSiriSchemaODDAssistantProperties *)self voice];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"voice"];
    }
    else
    {
      objc_super v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"voice"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isAssistantEnabled;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaISOLocale *)self->_inputLocale hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v5 = 2654435761 * self->_listenFor;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_numSiriShortcutsEnabled;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_isPreciseLocationEnabled;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  unint64_t v8 = [(ODDSiriSchemaODDVoiceProperties *)self->_voice hash];
  unint64_t v9 = [(ODDSiriSchemaODDOptInProperties *)self->_optIn hash];
  unint64_t v10 = [(ODDSiriSchemaODDHomeKitProperties *)self->_homeKit hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_locationAccessPermission;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(ODDSiriSchemaODDAppleIntelligenceProperties *)self->_appleIntelligence hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[80] & 1)) {
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isAssistantEnabled = self->_isAssistantEnabled;
    if (isAssistantEnabled != [v4 isAssistantEnabled]) {
      goto LABEL_44;
    }
  }
  uint64_t v6 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];
  uint64_t v7 = [v4 inputLocale];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_43;
  }
  uint64_t v8 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];
    uint64_t v11 = [v4 inputLocale];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  $06056A90C2C9AD1E04581F30C75E1244 has = self->_has;
  int v14 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v15 = v4[80];
  if (v14 != ((v15 >> 1) & 1)) {
    goto LABEL_44;
  }
  if (v14)
  {
    int listenFor = self->_listenFor;
    if (listenFor != [v4 listenFor]) {
      goto LABEL_44;
    }
    $06056A90C2C9AD1E04581F30C75E1244 has = self->_has;
    unsigned int v15 = v4[80];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1)) {
    goto LABEL_44;
  }
  if (v17)
  {
    int numSiriShortcutsEnabled = self->_numSiriShortcutsEnabled;
    if (numSiriShortcutsEnabled != [v4 numSiriShortcutsEnabled]) {
      goto LABEL_44;
    }
    $06056A90C2C9AD1E04581F30C75E1244 has = self->_has;
    unsigned int v15 = v4[80];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v15 >> 3) & 1)) {
    goto LABEL_44;
  }
  if (v19)
  {
    int isPreciseLocationEnabled = self->_isPreciseLocationEnabled;
    if (isPreciseLocationEnabled != [v4 isPreciseLocationEnabled]) {
      goto LABEL_44;
    }
  }
  uint64_t v6 = [(ODDSiriSchemaODDAssistantProperties *)self voice];
  uint64_t v7 = [v4 voice];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_43;
  }
  uint64_t v21 = [(ODDSiriSchemaODDAssistantProperties *)self voice];
  if (v21)
  {
    objc_super v22 = (void *)v21;
    v23 = [(ODDSiriSchemaODDAssistantProperties *)self voice];
    unsigned int v24 = [v4 voice];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  uint64_t v6 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];
  uint64_t v7 = [v4 optIn];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_43;
  }
  uint64_t v26 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];
    v29 = [v4 optIn];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  uint64_t v6 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];
  uint64_t v7 = [v4 homeKit];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_43;
  }
  uint64_t v31 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];
    v34 = [v4 homeKit];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  int v36 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v36 != ((v4[80] >> 4) & 1)) {
    goto LABEL_44;
  }
  if (v36)
  {
    int locationAccessPermission = self->_locationAccessPermission;
    if (locationAccessPermission != [v4 locationAccessPermission]) {
      goto LABEL_44;
    }
  }
  uint64_t v6 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];
  uint64_t v7 = [v4 appleIntelligence];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v38 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];
  if (!v38)
  {

LABEL_47:
    BOOL v43 = 1;
    goto LABEL_45;
  }
  v39 = (void *)v38;
  v40 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];
  v41 = [v4 appleIntelligence];
  char v42 = [v40 isEqual:v41];

  if (v42) {
    goto LABEL_47;
  }
LABEL_44:
  BOOL v43 = 0;
LABEL_45:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];

  if (v4)
  {
    uint64_t v5 = [(ODDSiriSchemaODDAssistantProperties *)self inputLocale];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  uint64_t v7 = [(ODDSiriSchemaODDAssistantProperties *)self voice];

  if (v7)
  {
    uint64_t v8 = [(ODDSiriSchemaODDAssistantProperties *)self voice];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];

  if (v9)
  {
    unint64_t v10 = [(ODDSiriSchemaODDAssistantProperties *)self optIn];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v11 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];

  if (v11)
  {
    int v12 = [(ODDSiriSchemaODDAssistantProperties *)self homeKit];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v13 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];

  int v14 = v16;
  if (v13)
  {
    unsigned int v15 = [(ODDSiriSchemaODDAssistantProperties *)self appleIntelligence];
    PBDataWriterWriteSubmessage();

    int v14 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppleIntelligence
{
}

- (BOOL)hasAppleIntelligence
{
  return self->_appleIntelligence != 0;
}

- (void)deleteLocationAccessPermission
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasLocationAccessPermission:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocationAccessPermission
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLocationAccessPermission:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int locationAccessPermission = a3;
}

- (void)deleteHomeKit
{
}

- (BOOL)hasHomeKit
{
  return self->_homeKit != 0;
}

- (void)deleteOptIn
{
}

- (BOOL)hasOptIn
{
  return self->_optIn != 0;
}

- (void)deleteVoice
{
}

- (BOOL)hasVoice
{
  return self->_voice != 0;
}

- (void)deleteIsPreciseLocationEnabled
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsPreciseLocationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPreciseLocationEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsPreciseLocationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isPreciseLocationEnabled = a3;
}

- (void)deleteNumSiriShortcutsEnabled
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumSiriShortcutsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSiriShortcutsEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumSiriShortcutsEnabled:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int numSiriShortcutsEnabled = a3;
}

- (void)deleteListenFor
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasListenFor:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasListenFor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setListenFor:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int listenFor = a3;
}

- (void)deleteInputLocale
{
}

- (BOOL)hasInputLocale
{
  return self->_inputLocale != 0;
}

- (void)deleteIsAssistantEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAssistantEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAssistantEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAssistantEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAssistantEnabled = a3;
}

@end