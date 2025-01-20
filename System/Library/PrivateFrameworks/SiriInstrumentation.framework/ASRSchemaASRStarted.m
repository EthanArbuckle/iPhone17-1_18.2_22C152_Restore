@interface ASRSchemaASRStarted
- (ASRSchemaASRStarted)initWithDictionary:(id)a3;
- (ASRSchemaASRStarted)initWithJSON:(id)a3;
- (BOOL)atypicalSpeechEnabled;
- (BOOL)geoLanguageModelLoaded;
- (BOOL)hasAtypicalSpeechEnabled;
- (BOOL)hasDatapackVersion;
- (BOOL)hasDictationUiInteractionId;
- (BOOL)hasGeoLanguageModelLoaded;
- (BOOL)hasGeoLanguageModelRegion;
- (BOOL)hasHammerVersion;
- (BOOL)hasIsEmptyTextField;
- (BOOL)hasIsHighQualityAsset;
- (BOOL)hasModelLocale;
- (BOOL)hasPortraitExperimentVariantName;
- (BOOL)hasSpeechProfileAgeInNs;
- (BOOL)hasStartState;
- (BOOL)hasTask;
- (BOOL)isEmptyTextField;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighQualityAsset;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)datapackVersion;
- (NSString)geoLanguageModelRegion;
- (NSString)hammerVersion;
- (NSString)portraitExperimentVariantName;
- (SISchemaUUID)dictationUiInteractionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)modelLocale;
- (int)startState;
- (int)task;
- (unint64_t)hash;
- (unint64_t)speechProfileAgeInNs;
- (void)deleteAtypicalSpeechEnabled;
- (void)deleteDatapackVersion;
- (void)deleteDictationUiInteractionId;
- (void)deleteGeoLanguageModelLoaded;
- (void)deleteGeoLanguageModelRegion;
- (void)deleteHammerVersion;
- (void)deleteIsEmptyTextField;
- (void)deleteIsHighQualityAsset;
- (void)deleteModelLocale;
- (void)deletePortraitExperimentVariantName;
- (void)deleteSpeechProfileAgeInNs;
- (void)deleteStartState;
- (void)deleteTask;
- (void)setAtypicalSpeechEnabled:(BOOL)a3;
- (void)setDatapackVersion:(id)a3;
- (void)setDictationUiInteractionId:(id)a3;
- (void)setGeoLanguageModelLoaded:(BOOL)a3;
- (void)setGeoLanguageModelRegion:(id)a3;
- (void)setHammerVersion:(id)a3;
- (void)setHasAtypicalSpeechEnabled:(BOOL)a3;
- (void)setHasDatapackVersion:(BOOL)a3;
- (void)setHasDictationUiInteractionId:(BOOL)a3;
- (void)setHasGeoLanguageModelLoaded:(BOOL)a3;
- (void)setHasGeoLanguageModelRegion:(BOOL)a3;
- (void)setHasHammerVersion:(BOOL)a3;
- (void)setHasIsEmptyTextField:(BOOL)a3;
- (void)setHasIsHighQualityAsset:(BOOL)a3;
- (void)setHasModelLocale:(BOOL)a3;
- (void)setHasPortraitExperimentVariantName:(BOOL)a3;
- (void)setHasSpeechProfileAgeInNs:(BOOL)a3;
- (void)setHasStartState:(BOOL)a3;
- (void)setHasTask:(BOOL)a3;
- (void)setIsEmptyTextField:(BOOL)a3;
- (void)setIsHighQualityAsset:(BOOL)a3;
- (void)setModelLocale:(int)a3;
- (void)setPortraitExperimentVariantName:(id)a3;
- (void)setSpeechProfileAgeInNs:(unint64_t)a3;
- (void)setStartState:(int)a3;
- (void)setTask:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASRSchemaASRStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ASRSchemaASRStarted *)self deleteDictationUiInteractionId];
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
  objc_storeStrong((id *)&self->_portraitExperimentVariantName, 0);
  objc_storeStrong((id *)&self->_dictationUiInteractionId, 0);
  objc_storeStrong((id *)&self->_geoLanguageModelRegion, 0);
  objc_storeStrong((id *)&self->_hammerVersion, 0);
  objc_storeStrong((id *)&self->_datapackVersion, 0);
}

- (void)setHasPortraitExperimentVariantName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasDictationUiInteractionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasGeoLanguageModelRegion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasHammerVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasDatapackVersion:(BOOL)a3
{
  *(&self->_isEmptyTextField + 2) = a3;
}

- (BOOL)isEmptyTextField
{
  return self->_isEmptyTextField;
}

- (BOOL)atypicalSpeechEnabled
{
  return self->_atypicalSpeechEnabled;
}

- (int)startState
{
  return self->_startState;
}

- (void)setPortraitExperimentVariantName:(id)a3
{
}

- (NSString)portraitExperimentVariantName
{
  return self->_portraitExperimentVariantName;
}

- (void)setDictationUiInteractionId:(id)a3
{
}

- (SISchemaUUID)dictationUiInteractionId
{
  return self->_dictationUiInteractionId;
}

- (unint64_t)speechProfileAgeInNs
{
  return self->_speechProfileAgeInNs;
}

- (BOOL)geoLanguageModelLoaded
{
  return self->_geoLanguageModelLoaded;
}

- (void)setGeoLanguageModelRegion:(id)a3
{
}

- (NSString)geoLanguageModelRegion
{
  return self->_geoLanguageModelRegion;
}

- (void)setHammerVersion:(id)a3
{
}

- (NSString)hammerVersion
{
  return self->_hammerVersion;
}

- (BOOL)isHighQualityAsset
{
  return self->_isHighQualityAsset;
}

- (void)setDatapackVersion:(id)a3
{
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (int)modelLocale
{
  return self->_modelLocale;
}

- (int)task
{
  return self->_task;
}

- (ASRSchemaASRStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASRSchemaASRStarted;
  v5 = [(ASRSchemaASRStarted *)&v31 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"task"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setTask:](v5, "setTask:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"modelLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setModelLocale:](v5, "setModelLocale:", [v7 intValue]);
    }
    v29 = v7;
    v8 = [v4 objectForKeyedSubscript:@"datapackVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(ASRSchemaASRStarted *)v5 setDatapackVersion:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isHighQualityAsset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setIsHighQualityAsset:](v5, "setIsHighQualityAsset:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"hammerVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(ASRSchemaASRStarted *)v5 setHammerVersion:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"geoLanguageModelRegion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(ASRSchemaASRStarted *)v5 setGeoLanguageModelRegion:v14];
    }
    v27 = v13;
    v15 = [v4 objectForKeyedSubscript:@"geoLanguageModelLoaded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setGeoLanguageModelLoaded:](v5, "setGeoLanguageModelLoaded:", [v15 BOOLValue]);
    }
    v30 = v6;
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"speechProfileAgeInNs", v15);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setSpeechProfileAgeInNs:](v5, "setSpeechProfileAgeInNs:", [v16 unsignedLongLongValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"dictationUiInteractionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[SISchemaUUID alloc] initWithDictionary:v17];
      [(ASRSchemaASRStarted *)v5 setDictationUiInteractionId:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"portraitExperimentVariantName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = (void *)[v19 copy];
      [(ASRSchemaASRStarted *)v5 setPortraitExperimentVariantName:v20];
    }
    v28 = v8;
    v21 = [v4 objectForKeyedSubscript:@"startState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setStartState:](v5, "setStartState:", [v21 intValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"atypicalSpeechEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setAtypicalSpeechEnabled:](v5, "setAtypicalSpeechEnabled:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"isEmptyTextField"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRStarted setIsEmptyTextField:](v5, "setIsEmptyTextField:", [v23 BOOLValue]);
    }
    v24 = v5;
  }
  return v5;
}

- (ASRSchemaASRStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRStarted *)self dictionaryRepresentation];
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
  if ((*(&self->_isEmptyTextField + 1) & 0x40) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRStarted atypicalSpeechEnabled](self, "atypicalSpeechEnabled"));
    [v3 setObject:v4 forKeyedSubscript:@"atypicalSpeechEnabled"];
  }
  if (self->_datapackVersion)
  {
    v5 = [(ASRSchemaASRStarted *)self datapackVersion];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"datapackVersion"];
  }
  if (self->_dictationUiInteractionId)
  {
    uint64_t v7 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"dictationUiInteractionId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"dictationUiInteractionId"];
    }
  }
  if ((*(&self->_isEmptyTextField + 1) & 8) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRStarted geoLanguageModelLoaded](self, "geoLanguageModelLoaded"));
    [v3 setObject:v10 forKeyedSubscript:@"geoLanguageModelLoaded"];
  }
  if (self->_geoLanguageModelRegion)
  {
    v11 = [(ASRSchemaASRStarted *)self geoLanguageModelRegion];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"geoLanguageModelRegion"];
  }
  if (self->_hammerVersion)
  {
    v13 = [(ASRSchemaASRStarted *)self hammerVersion];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"hammerVersion"];
  }
  int v15 = *((char *)&self->_isEmptyTextField + 1);
  if ((v15 & 0x80000000) == 0)
  {
    if ((v15 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRStarted isEmptyTextField](self, "isEmptyTextField"));
  [v3 setObject:v19 forKeyedSubscript:@"isEmptyTextField"];

  LOBYTE(v15) = *(&self->_isEmptyTextField + 1);
  if ((v15 & 4) != 0)
  {
LABEL_18:
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRStarted isHighQualityAsset](self, "isHighQualityAsset"));
    [v3 setObject:v16 forKeyedSubscript:@"isHighQualityAsset"];

    LOBYTE(v15) = *(&self->_isEmptyTextField + 1);
  }
LABEL_19:
  if ((v15 & 2) != 0)
  {
    unsigned int v17 = [(ASRSchemaASRStarted *)self modelLocale] - 1;
    if (v17 > 0x3D) {
      v18 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v18 = off_1E5EAC850[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"modelLocale"];
  }
  if (self->_portraitExperimentVariantName)
  {
    v20 = [(ASRSchemaASRStarted *)self portraitExperimentVariantName];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"portraitExperimentVariantName"];
  }
  char v22 = *(&self->_isEmptyTextField + 1);
  if ((v22 & 0x10) == 0)
  {
    if ((*(&self->_isEmptyTextField + 1) & 0x20) == 0) {
      goto LABEL_30;
    }
LABEL_33:
    unsigned int v24 = [(ASRSchemaASRStarted *)self startState] - 1;
    if (v24 > 2) {
      v25 = @"ASRSTARTSTATE_UNKNOWN";
    }
    else {
      v25 = off_1E5EACA40[v24];
    }
    [v3 setObject:v25 forKeyedSubscript:@"startState"];
    if (!*(&self->_isEmptyTextField + 1)) {
      goto LABEL_41;
    }
    goto LABEL_37;
  }
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRStarted speechProfileAgeInNs](self, "speechProfileAgeInNs"));
  [v3 setObject:v23 forKeyedSubscript:@"speechProfileAgeInNs"];

  char v22 = *(&self->_isEmptyTextField + 1);
  if ((v22 & 0x20) != 0) {
    goto LABEL_33;
  }
LABEL_30:
  if (v22)
  {
LABEL_37:
    unsigned int v26 = [(ASRSchemaASRStarted *)self task] - 1;
    if (v26 > 7) {
      v27 = @"ASRDATAPACKTASK_UNKNOWN";
    }
    else {
      v27 = off_1E5EACA58[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"task"];
  }
LABEL_41:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isEmptyTextField + 1))
  {
    uint64_t v3 = 2654435761 * self->_task;
    if ((*(&self->_isEmptyTextField + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_isEmptyTextField + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_modelLocale;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_datapackVersion hash];
  if ((*(&self->_isEmptyTextField + 1) & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_isHighQualityAsset;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_hammerVersion hash];
  NSUInteger v7 = [(NSString *)self->_geoLanguageModelRegion hash];
  if ((*(&self->_isEmptyTextField + 1) & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_geoLanguageModelLoaded;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v7;
  if ((*(&self->_isEmptyTextField + 1) & 0x10) != 0) {
    unint64_t v10 = 2654435761u * self->_speechProfileAgeInNs;
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = [(SISchemaUUID *)self->_dictationUiInteractionId hash];
  NSUInteger v12 = [(NSString *)self->_portraitExperimentVariantName hash];
  if ((*(&self->_isEmptyTextField + 1) & 0x20) != 0) {
    uint64_t v13 = 2654435761 * self->_startState;
  }
  else {
    uint64_t v13 = 0;
  }
  if ((*(&self->_isEmptyTextField + 1) & 0x40) != 0)
  {
    uint64_t v14 = 2654435761 * self->_atypicalSpeechEnabled;
    if (*(&self->_isEmptyTextField + 1) < 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v17 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((*(&self->_isEmptyTextField + 1) & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v15 = 2654435761 * self->_isEmptyTextField;
  return v4 ^ v3 ^ v6 ^ v5 ^ v17 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
  unsigned int v6 = v4[86];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_44;
  }
  if (v5)
  {
    int task = self->_task;
    if (task != [v4 task]) {
      goto LABEL_44;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
    unsigned int v6 = v4[86];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_44;
  }
  if (v8)
  {
    int modelLocale = self->_modelLocale;
    if (modelLocale != [v4 modelLocale]) {
      goto LABEL_44;
    }
  }
  unint64_t v10 = [(ASRSchemaASRStarted *)self datapackVersion];
  unint64_t v11 = [v4 datapackVersion];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_43;
  }
  uint64_t v12 = [(ASRSchemaASRStarted *)self datapackVersion];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ASRSchemaASRStarted *)self datapackVersion];
    uint64_t v15 = [v4 datapackVersion];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  int v17 = (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 2) & 1;
  if (v17 != ((v4[86] >> 2) & 1)) {
    goto LABEL_44;
  }
  if (v17)
  {
    int isHighQualityAsset = self->_isHighQualityAsset;
    if (isHighQualityAsset != [v4 isHighQualityAsset]) {
      goto LABEL_44;
    }
  }
  unint64_t v10 = [(ASRSchemaASRStarted *)self hammerVersion];
  unint64_t v11 = [v4 hammerVersion];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_43;
  }
  uint64_t v19 = [(ASRSchemaASRStarted *)self hammerVersion];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(ASRSchemaASRStarted *)self hammerVersion];
    char v22 = [v4 hammerVersion];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ASRSchemaASRStarted *)self geoLanguageModelRegion];
  unint64_t v11 = [v4 geoLanguageModelRegion];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_43;
  }
  uint64_t v24 = [(ASRSchemaASRStarted *)self geoLanguageModelRegion];
  if (v24)
  {
    v25 = (void *)v24;
    unsigned int v26 = [(ASRSchemaASRStarted *)self geoLanguageModelRegion];
    v27 = [v4 geoLanguageModelRegion];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unsigned int v29 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
  int v30 = (v29 >> 3) & 1;
  unsigned int v31 = v4[86];
  if (v30 != ((v31 >> 3) & 1)) {
    goto LABEL_44;
  }
  if (v30)
  {
    int geoLanguageModelLoaded = self->_geoLanguageModelLoaded;
    if (geoLanguageModelLoaded != [v4 geoLanguageModelLoaded]) {
      goto LABEL_44;
    }
    unsigned int v29 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
    unsigned int v31 = v4[86];
  }
  int v33 = (v29 >> 4) & 1;
  if (v33 != ((v31 >> 4) & 1)) {
    goto LABEL_44;
  }
  if (v33)
  {
    unint64_t speechProfileAgeInNs = self->_speechProfileAgeInNs;
    if (speechProfileAgeInNs != [v4 speechProfileAgeInNs]) {
      goto LABEL_44;
    }
  }
  unint64_t v10 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];
  unint64_t v11 = [v4 dictationUiInteractionId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_43;
  }
  uint64_t v35 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];
    v38 = [v4 dictationUiInteractionId];
    int v39 = [v37 isEqual:v38];

    if (!v39) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ASRSchemaASRStarted *)self portraitExperimentVariantName];
  unint64_t v11 = [v4 portraitExperimentVariantName];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v40 = [(ASRSchemaASRStarted *)self portraitExperimentVariantName];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [(ASRSchemaASRStarted *)self portraitExperimentVariantName];
    v43 = [v4 portraitExperimentVariantName];
    int v44 = [v42 isEqual:v43];

    if (!v44) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  unsigned int v47 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
  int v48 = (v47 >> 5) & 1;
  unsigned int v49 = v4[86];
  if (v48 == ((v49 >> 5) & 1))
  {
    if (v48)
    {
      int startState = self->_startState;
      if (startState != [v4 startState]) {
        goto LABEL_44;
      }
      unsigned int v47 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
      unsigned int v49 = v4[86];
    }
    int v51 = (v47 >> 6) & 1;
    if (v51 == ((v49 >> 6) & 1))
    {
      if (v51)
      {
        int atypicalSpeechEnabled = self->_atypicalSpeechEnabled;
        if (atypicalSpeechEnabled != [v4 atypicalSpeechEnabled]) {
          goto LABEL_44;
        }
        unsigned int v47 = *((unsigned __int8 *)&self->_isEmptyTextField + 1);
        unsigned int v49 = v4[86];
      }
      if (((v49 ^ v47) & 0x80) == 0)
      {
        if ((v47 & 0x80) == 0
          || (int isEmptyTextField = self->_isEmptyTextField,
              isEmptyTextField == [v4 isEmptyTextField]))
        {
          BOOL v45 = 1;
          goto LABEL_45;
        }
      }
    }
  }
LABEL_44:
  BOOL v45 = 0;
LABEL_45:

  return v45;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  char v4 = *(&self->_isEmptyTextField + 1);
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    char v4 = *(&self->_isEmptyTextField + 1);
  }
  if ((v4 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v5 = [(ASRSchemaASRStarted *)self datapackVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(&self->_isEmptyTextField + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unsigned int v6 = [(ASRSchemaASRStarted *)self hammerVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v7 = [(ASRSchemaASRStarted *)self geoLanguageModelRegion];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char v8 = *(&self->_isEmptyTextField + 1);
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v8 = *(&self->_isEmptyTextField + 1);
  }
  if ((v8 & 0x10) != 0) {
    PBDataWriterWriteUint64Field();
  }
  NSUInteger v9 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];

  if (v9)
  {
    unint64_t v10 = [(ASRSchemaASRStarted *)self dictationUiInteractionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v11 = [(ASRSchemaASRStarted *)self portraitExperimentVariantName];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  char v12 = *(&self->_isEmptyTextField + 1);
  if ((v12 & 0x20) == 0)
  {
    if ((*(&self->_isEmptyTextField + 1) & 0x40) == 0) {
      goto LABEL_23;
    }
LABEL_28:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isEmptyTextField + 1) & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field();
  char v12 = *(&self->_isEmptyTextField + 1);
  if ((v12 & 0x40) != 0) {
    goto LABEL_28;
  }
LABEL_23:
  if ((v12 & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
LABEL_24:
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsEmptyTextField
{
  *(&self->_isEmptyTextField + 1) &= ~0x80u;
}

- (void)setHasIsEmptyTextField:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = v3 & 0x80 | *(&self->_isEmptyTextField + 1) & 0x7F;
}

- (BOOL)hasIsEmptyTextField
{
  return *((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 7;
}

- (void)setIsEmptyTextField:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x80u;
  self->_int isEmptyTextField = a3;
}

- (void)deleteAtypicalSpeechEnabled
{
  *(&self->_isEmptyTextField + 1) &= ~0x40u;
}

- (void)setHasAtypicalSpeechEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xBF | v3;
}

- (BOOL)hasAtypicalSpeechEnabled
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 6) & 1;
}

- (void)setAtypicalSpeechEnabled:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x40u;
  self->_int atypicalSpeechEnabled = a3;
}

- (void)deleteStartState
{
  *(&self->_isEmptyTextField + 1) &= ~0x20u;
}

- (void)setHasStartState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xDF | v3;
}

- (BOOL)hasStartState
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 5) & 1;
}

- (void)setStartState:(int)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x20u;
  self->_int startState = a3;
}

- (void)deletePortraitExperimentVariantName
{
}

- (BOOL)hasPortraitExperimentVariantName
{
  return self->_portraitExperimentVariantName != 0;
}

- (void)deleteDictationUiInteractionId
{
}

- (BOOL)hasDictationUiInteractionId
{
  return self->_dictationUiInteractionId != 0;
}

- (void)deleteSpeechProfileAgeInNs
{
  *(&self->_isEmptyTextField + 1) &= ~0x10u;
}

- (void)setHasSpeechProfileAgeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xEF | v3;
}

- (BOOL)hasSpeechProfileAgeInNs
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 4) & 1;
}

- (void)setSpeechProfileAgeInNs:(unint64_t)a3
{
  *(&self->_isEmptyTextField + 1) |= 0x10u;
  self->_unint64_t speechProfileAgeInNs = a3;
}

- (void)deleteGeoLanguageModelLoaded
{
  *(&self->_isEmptyTextField + 1) &= ~8u;
}

- (void)setHasGeoLanguageModelLoaded:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xF7 | v3;
}

- (BOOL)hasGeoLanguageModelLoaded
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 3) & 1;
}

- (void)setGeoLanguageModelLoaded:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 8u;
  self->_int geoLanguageModelLoaded = a3;
}

- (void)deleteGeoLanguageModelRegion
{
}

- (BOOL)hasGeoLanguageModelRegion
{
  return self->_geoLanguageModelRegion != 0;
}

- (void)deleteHammerVersion
{
}

- (BOOL)hasHammerVersion
{
  return self->_hammerVersion != 0;
}

- (void)deleteIsHighQualityAsset
{
  *(&self->_isEmptyTextField + 1) &= ~4u;
}

- (void)setHasIsHighQualityAsset:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xFB | v3;
}

- (BOOL)hasIsHighQualityAsset
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 2) & 1;
}

- (void)setIsHighQualityAsset:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) |= 4u;
  self->_int isHighQualityAsset = a3;
}

- (void)deleteDatapackVersion
{
}

- (BOOL)hasDatapackVersion
{
  return self->_datapackVersion != 0;
}

- (void)deleteModelLocale
{
  *(&self->_isEmptyTextField + 1) &= ~2u;
}

- (void)setHasModelLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xFD | v3;
}

- (BOOL)hasModelLocale
{
  return (*((unsigned __int8 *)&self->_isEmptyTextField + 1) >> 1) & 1;
}

- (void)setModelLocale:(int)a3
{
  *(&self->_isEmptyTextField + 1) |= 2u;
  self->_int modelLocale = a3;
}

- (void)deleteTask
{
  *(&self->_isEmptyTextField + 1) &= ~1u;
}

- (void)setHasTask:(BOOL)a3
{
  *(&self->_isEmptyTextField + 1) = *(&self->_isEmptyTextField + 1) & 0xFE | a3;
}

- (BOOL)hasTask
{
  return *(&self->_isEmptyTextField + 1);
}

- (void)setTask:(int)a3
{
  *(&self->_isEmptyTextField + 1) |= 1u;
  self->_int task = a3;
}

@end