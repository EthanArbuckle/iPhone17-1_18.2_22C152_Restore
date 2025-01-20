@interface MTSchemaMTInvocationStarted
- (BOOL)hasApiInvocationMetadata;
- (BOOL)hasAppInvocationMetadata;
- (BOOL)hasDisplayMode;
- (BOOL)hasInputSource;
- (BOOL)hasInvocationType;
- (BOOL)hasIsExplicitLanguageFilterEnabled;
- (BOOL)hasIsLanguageIdentificationEnabled;
- (BOOL)hasIsOnDeviceTranslation;
- (BOOL)hasLinkId;
- (BOOL)hasMobileAssetConfigVersion;
- (BOOL)hasQssSessionId;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitLanguageFilterEnabled;
- (BOOL)isLanguageIdentificationEnabled;
- (BOOL)isOnDeviceTranslation;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTApiInvocationMetadata)apiInvocationMetadata;
- (MTSchemaMTAppInvocationMetadata)appInvocationMetadata;
- (MTSchemaMTInvocationStarted)initWithDictionary:(id)a3;
- (MTSchemaMTInvocationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (SISchemaUUID)qssSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)displayMode;
- (int)inputSource;
- (int)invocationType;
- (int)task;
- (unint64_t)hash;
- (unint64_t)whichInvocationmetadata;
- (unsigned)mobileAssetConfigVersion;
- (void)deleteApiInvocationMetadata;
- (void)deleteAppInvocationMetadata;
- (void)deleteDisplayMode;
- (void)deleteInputSource;
- (void)deleteInvocationType;
- (void)deleteIsExplicitLanguageFilterEnabled;
- (void)deleteIsLanguageIdentificationEnabled;
- (void)deleteIsOnDeviceTranslation;
- (void)deleteLinkId;
- (void)deleteMobileAssetConfigVersion;
- (void)deleteQssSessionId;
- (void)deleteTask;
- (void)setApiInvocationMetadata:(id)a3;
- (void)setAppInvocationMetadata:(id)a3;
- (void)setDisplayMode:(int)a3;
- (void)setHasApiInvocationMetadata:(BOOL)a3;
- (void)setHasAppInvocationMetadata:(BOOL)a3;
- (void)setHasDisplayMode:(BOOL)a3;
- (void)setHasInputSource:(BOOL)a3;
- (void)setHasInvocationType:(BOOL)a3;
- (void)setHasIsExplicitLanguageFilterEnabled:(BOOL)a3;
- (void)setHasIsLanguageIdentificationEnabled:(BOOL)a3;
- (void)setHasIsOnDeviceTranslation:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMobileAssetConfigVersion:(BOOL)a3;
- (void)setHasQssSessionId:(BOOL)a3;
- (void)setHasTask:(BOOL)a3;
- (void)setInputSource:(int)a3;
- (void)setInvocationType:(int)a3;
- (void)setIsExplicitLanguageFilterEnabled:(BOOL)a3;
- (void)setIsLanguageIdentificationEnabled:(BOOL)a3;
- (void)setIsOnDeviceTranslation:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setMobileAssetConfigVersion:(unsigned int)a3;
- (void)setQssSessionId:(id)a3;
- (void)setTask:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTInvocationStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MTSchemaMTInvocationStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTInvocationStarted *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MTSchemaMTInvocationStarted *)self deleteLinkId];
  }
  v9 = [(MTSchemaMTInvocationStarted *)self qssSessionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MTSchemaMTInvocationStarted *)self deleteQssSessionId];
  }
  v12 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MTSchemaMTInvocationStarted *)self deleteAppInvocationMetadata];
  }
  v15 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(MTSchemaMTInvocationStarted *)self deleteApiInvocationMetadata];
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
  objc_storeStrong((id *)&self->_apiInvocationMetadata, 0);
  objc_storeStrong((id *)&self->_appInvocationMetadata, 0);
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasApiInvocationMetadata:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (BOOL)hasApiInvocationMetadata
{
  return self->_hasLinkId;
}

- (void)setHasAppInvocationMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasAppInvocationMetadata
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasQssSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)invocationType
{
  return self->_invocationType;
}

- (void)setQssSessionId:(id)a3
{
}

- (SISchemaUUID)qssSessionId
{
  return self->_qssSessionId;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (BOOL)isLanguageIdentificationEnabled
{
  return self->_isLanguageIdentificationEnabled;
}

- (BOOL)isExplicitLanguageFilterEnabled
{
  return self->_isExplicitLanguageFilterEnabled;
}

- (int)inputSource
{
  return self->_inputSource;
}

- (int)task
{
  return self->_task;
}

- (unsigned)mobileAssetConfigVersion
{
  return self->_mobileAssetConfigVersion;
}

- (BOOL)isOnDeviceTranslation
{
  return self->_isOnDeviceTranslation;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (unint64_t)whichInvocationmetadata
{
  return self->_whichInvocationmetadata;
}

- (MTSchemaMTInvocationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MTSchemaMTInvocationStarted;
  v5 = [(MTSchemaMTInvocationStarted *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MTSchemaMTInvocationStarted *)v5 setLinkId:v7];
    }
    v28 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"isOnDeviceTranslation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setIsOnDeviceTranslation:](v5, "setIsOnDeviceTranslation:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"mobileAssetConfigVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setMobileAssetConfigVersion:](v5, "setMobileAssetConfigVersion:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"task"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setTask:](v5, "setTask:", [v10 intValue]);
    }
    v25 = v10;
    int v11 = [v4 objectForKeyedSubscript:@"inputSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setInputSource:](v5, "setInputSource:", [v11 intValue]);
    }
    v24 = v11;
    v12 = [v4 objectForKeyedSubscript:@"isExplicitLanguageFilterEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setIsExplicitLanguageFilterEnabled:](v5, "setIsExplicitLanguageFilterEnabled:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isLanguageIdentificationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setIsLanguageIdentificationEnabled:](v5, "setIsLanguageIdentificationEnabled:", [v13 BOOLValue]);
    }
    v27 = v8;
    int v14 = [v4 objectForKeyedSubscript:@"displayMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setDisplayMode:](v5, "setDisplayMode:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"qssSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(MTSchemaMTInvocationStarted *)v5 setQssSessionId:v16];
    }
    v26 = v9;
    int v17 = [v4 objectForKeyedSubscript:@"invocationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationStarted setInvocationType:](v5, "setInvocationType:", [v17 intValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"appInvocationMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v19 = [[MTSchemaMTAppInvocationMetadata alloc] initWithDictionary:v18];
      [(MTSchemaMTInvocationStarted *)v5 setAppInvocationMetadata:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"apiInvocationMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[MTSchemaMTApiInvocationMetadata alloc] initWithDictionary:v20];
      [(MTSchemaMTInvocationStarted *)v5 setApiInvocationMetadata:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (MTSchemaMTInvocationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTInvocationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTInvocationStarted *)self dictionaryRepresentation];
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
  if (self->_apiInvocationMetadata)
  {
    id v4 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"apiInvocationMetadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"apiInvocationMetadata"];
    }
  }
  if (self->_appInvocationMetadata)
  {
    uint64_t v7 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"appInvocationMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"appInvocationMetadata"];
    }
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    unsigned int v11 = [(MTSchemaMTInvocationStarted *)self displayMode] - 1;
    if (v11 > 2) {
      v12 = @"MTAPPDISPLAYMODE_UNKNOWN";
    }
    else {
      v12 = off_1E5EB1B18[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"displayMode"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x80) == 0) {
        goto LABEL_27;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  unsigned int v13 = [(MTSchemaMTInvocationStarted *)self inputSource] - 1;
  if (v13 > 3) {
    int v14 = @"MTINPUTSOURCE_UNKNOWN";
  }
  else {
    int v14 = off_1E5EB1B30[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"inputSource"];
  char has = (char)self->_has;
  if (has < 0)
  {
LABEL_23:
    unsigned int v15 = [(MTSchemaMTInvocationStarted *)self invocationType] - 1;
    if (v15 > 0xE) {
      v16 = @"MTINVOCATIONTYPE_UNKNOWN";
    }
    else {
      v16 = off_1E5EB1B50[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"invocationType"];
    char has = (char)self->_has;
  }
LABEL_27:
  if ((has & 0x10) != 0)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTInvocationStarted isExplicitLanguageFilterEnabled](self, "isExplicitLanguageFilterEnabled"));
    [v3 setObject:v20 forKeyedSubscript:@"isExplicitLanguageFilterEnabled"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_29:
      if ((has & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_29;
  }
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTInvocationStarted isLanguageIdentificationEnabled](self, "isLanguageIdentificationEnabled"));
  [v3 setObject:v21 forKeyedSubscript:@"isLanguageIdentificationEnabled"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_30:
    int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTInvocationStarted isOnDeviceTranslation](self, "isOnDeviceTranslation"));
    [v3 setObject:v17 forKeyedSubscript:@"isOnDeviceTranslation"];
  }
LABEL_31:
  if (self->_linkId)
  {
    v18 = [(MTSchemaMTInvocationStarted *)self linkId];
    objc_super v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"linkId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTSchemaMTInvocationStarted mobileAssetConfigVersion](self, "mobileAssetConfigVersion"));
    [v3 setObject:v23 forKeyedSubscript:@"mobileAssetConfigVersion"];
  }
  if (self->_qssSessionId)
  {
    v24 = [(MTSchemaMTInvocationStarted *)self qssSessionId];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"qssSessionId"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"qssSessionId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v27 = [(MTSchemaMTInvocationStarted *)self task] - 1;
    if (v27 > 3) {
      v28 = @"MTTASK_UNKNOWN";
    }
    else {
      v28 = off_1E5EB1BC8[v27];
    }
    [v3 setObject:v28 forKeyedSubscript:@"task"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v16 = 2654435761 * self->_isOnDeviceTranslation;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_mobileAssetConfigVersion;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_task;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_inputSource;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isExplicitLanguageFilterEnabled;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_isLanguageIdentificationEnabled;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v8 = 0;
LABEL_14:
  unint64_t v9 = v3;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v10 = 2654435761 * self->_displayMode;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(SISchemaUUID *)self->_qssSessionId hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v12 = 2654435761 * self->_invocationType;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v16 ^ v9 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11;
  unint64_t v14 = v12 ^ [(MTSchemaMTAppInvocationMetadata *)self->_appInvocationMetadata hash];
  return v13 ^ v14 ^ [(MTSchemaMTApiInvocationMetadata *)self->_apiInvocationMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  unint64_t whichInvocationmetadata = self->_whichInvocationmetadata;
  if (whichInvocationmetadata != [v4 whichInvocationmetadata]) {
    goto LABEL_53;
  }
  uint64_t v6 = [(MTSchemaMTInvocationStarted *)self linkId];
  uint64_t v7 = [v4 linkId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v8 = [(MTSchemaMTInvocationStarted *)self linkId];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    uint64_t v10 = [(MTSchemaMTInvocationStarted *)self linkId];
    unint64_t v11 = [v4 linkId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
  unsigned int v14 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v14 & 1)) {
    goto LABEL_53;
  }
  if (*(unsigned char *)&has)
  {
    int isOnDeviceTranslation = self->_isOnDeviceTranslation;
    if (isOnDeviceTranslation != [v4 isOnDeviceTranslation]) {
      goto LABEL_53;
    }
    $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_53;
  }
  if (v16)
  {
    unsigned int mobileAssetConfigVersion = self->_mobileAssetConfigVersion;
    if (mobileAssetConfigVersion != [v4 mobileAssetConfigVersion]) {
      goto LABEL_53;
    }
    $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_53;
  }
  if (v18)
  {
    int task = self->_task;
    if (task != [v4 task]) {
      goto LABEL_53;
    }
    $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_53;
  }
  if (v20)
  {
    int inputSource = self->_inputSource;
    if (inputSource != [v4 inputSource]) {
      goto LABEL_53;
    }
    $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_53;
  }
  if (v22)
  {
    int isExplicitLanguageFilterEnabled = self->_isExplicitLanguageFilterEnabled;
    if (isExplicitLanguageFilterEnabled != [v4 isExplicitLanguageFilterEnabled]) {
      goto LABEL_53;
    }
    $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_53;
  }
  if (v24)
  {
    int isLanguageIdentificationEnabled = self->_isLanguageIdentificationEnabled;
    if (isLanguageIdentificationEnabled != [v4 isLanguageIdentificationEnabled]) {
      goto LABEL_53;
    }
    $FD8C404CD88DEFFF107DCA083DE2BCA6 has = self->_has;
    unsigned int v14 = v4[72];
  }
  int v26 = (*(unsigned int *)&has >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1)) {
    goto LABEL_53;
  }
  if (v26)
  {
    int displayMode = self->_displayMode;
    if (displayMode != [v4 displayMode]) {
      goto LABEL_53;
    }
  }
  uint64_t v6 = [(MTSchemaMTInvocationStarted *)self qssSessionId];
  uint64_t v7 = [v4 qssSessionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v28 = [(MTSchemaMTInvocationStarted *)self qssSessionId];
  if (v28)
  {
    objc_super v29 = (void *)v28;
    v30 = [(MTSchemaMTInvocationStarted *)self qssSessionId];
    v31 = [v4 qssSessionId];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  $FD8C404CD88DEFFF107DCA083DE2BCA6 v33 = self->_has;
  if (((v4[72] ^ *(unsigned int *)&v33) & 0x80) != 0) {
    goto LABEL_53;
  }
  if ((*(_DWORD *)&v33 & 0x80000000) != 0)
  {
    int invocationType = self->_invocationType;
    if (invocationType != [v4 invocationType]) {
      goto LABEL_53;
    }
  }
  uint64_t v6 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];
  uint64_t v7 = [v4 appInvocationMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v35 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];
    v38 = [v4 appInvocationMetadata];
    int v39 = [v37 isEqual:v38];

    if (!v39) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  uint64_t v6 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];
  uint64_t v7 = [v4 apiInvocationMetadata];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v40 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];
  if (!v40)
  {

LABEL_56:
    BOOL v45 = 1;
    goto LABEL_54;
  }
  v41 = (void *)v40;
  v42 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];
  v43 = [v4 apiInvocationMetadata];
  char v44 = [v42 isEqual:v43];

  if (v44) {
    goto LABEL_56;
  }
LABEL_53:
  BOOL v45 = 0;
LABEL_54:

  return v45;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(MTSchemaMTInvocationStarted *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(MTSchemaMTInvocationStarted *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
  uint64_t v7 = [(MTSchemaMTInvocationStarted *)self qssSessionId];

  if (v7)
  {
    uint64_t v8 = [(MTSchemaMTInvocationStarted *)self qssSessionId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v9 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];

  if (v9)
  {
    uint64_t v10 = [(MTSchemaMTInvocationStarted *)self appInvocationMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v11 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];

  int v12 = v14;
  if (v11)
  {
    unint64_t v13 = [(MTSchemaMTInvocationStarted *)self apiInvocationMetadata];
    PBDataWriterWriteSubmessage();

    int v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTInvocationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteApiInvocationMetadata
{
  if (self->_whichInvocationmetadata == 12)
  {
    self->_unint64_t whichInvocationmetadata = 0;
    self->_apiInvocationMetadata = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTApiInvocationMetadata)apiInvocationMetadata
{
  if (self->_whichInvocationmetadata == 12) {
    v2 = self->_apiInvocationMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setApiInvocationMetadata:(id)a3
{
  uint64_t v4 = (MTSchemaMTApiInvocationMetadata *)a3;
  appInvocationMetadata = self->_appInvocationMetadata;
  self->_appInvocationMetadata = 0;

  unint64_t v6 = 12;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichInvocationmetadata = v6;
  apiInvocationMetadata = self->_apiInvocationMetadata;
  self->_apiInvocationMetadata = v4;
}

- (void)deleteAppInvocationMetadata
{
  if (self->_whichInvocationmetadata == 11)
  {
    self->_unint64_t whichInvocationmetadata = 0;
    self->_appInvocationMetadata = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MTSchemaMTAppInvocationMetadata)appInvocationMetadata
{
  if (self->_whichInvocationmetadata == 11) {
    v2 = self->_appInvocationMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppInvocationMetadata:(id)a3
{
  uint64_t v4 = (MTSchemaMTAppInvocationMetadata *)a3;
  apiInvocationMetadata = self->_apiInvocationMetadata;
  self->_apiInvocationMetadata = 0;

  unint64_t v6 = 11;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichInvocationmetadata = v6;
  appInvocationMetadata = self->_appInvocationMetadata;
  self->_appInvocationMetadata = v4;
}

- (void)deleteInvocationType
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasInvocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasInvocationType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setInvocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_int invocationType = a3;
}

- (void)deleteQssSessionId
{
}

- (BOOL)hasQssSessionId
{
  return self->_qssSessionId != 0;
}

- (void)deleteDisplayMode
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasDisplayMode:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasDisplayMode
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDisplayMode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int displayMode = a3;
}

- (void)deleteIsLanguageIdentificationEnabled
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsLanguageIdentificationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsLanguageIdentificationEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsLanguageIdentificationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isLanguageIdentificationEnabled = a3;
}

- (void)deleteIsExplicitLanguageFilterEnabled
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsExplicitLanguageFilterEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsExplicitLanguageFilterEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsExplicitLanguageFilterEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isExplicitLanguageFilterEnabled = a3;
}

- (void)deleteInputSource
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasInputSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInputSource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInputSource:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int inputSource = a3;
}

- (void)deleteTask
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTask:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTask
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTask:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int task = a3;
}

- (void)deleteMobileAssetConfigVersion
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMobileAssetConfigVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMobileAssetConfigVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMobileAssetConfigVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int mobileAssetConfigVersion = a3;
}

- (void)deleteIsOnDeviceTranslation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsOnDeviceTranslation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsOnDeviceTranslation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsOnDeviceTranslation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isOnDeviceTranslation = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end