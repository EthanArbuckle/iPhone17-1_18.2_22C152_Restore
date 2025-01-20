@interface LTSchemaSpeechTranslationEvent
- (BOOL)hasError;
- (BOOL)hasInRestrictedMode;
- (BOOL)hasIsAutomaticLID;
- (BOOL)hasMobileAssetConfigVersion;
- (BOOL)hasRequestID;
- (BOOL)hasSessionID;
- (BOOL)hasStatus;
- (BOOL)hasTask;
- (BOOL)hasTimeToCancel;
- (BOOL)hasTimeToFirstPartialDisplayed;
- (BOOL)hasTimeToRecordingDialogDismissed;
- (BOOL)hasTimeToShowTranslationCard;
- (BOOL)hasUiMode;
- (BOOL)inRestrictedMode;
- (BOOL)isAutomaticLID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaError)error;
- (LTSchemaSpeechTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaSpeechTranslationEvent)initWithJSON:(id)a3;
- (LTSchemaTask)task;
- (NSData)jsonData;
- (NSString)mobileAssetConfigVersion;
- (NSString)requestID;
- (NSString)sessionID;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)status;
- (int)uiMode;
- (unint64_t)hash;
- (unsigned)timeToCancel;
- (unsigned)timeToFirstPartialDisplayed;
- (unsigned)timeToRecordingDialogDismissed;
- (unsigned)timeToShowTranslationCard;
- (void)deleteError;
- (void)deleteInRestrictedMode;
- (void)deleteIsAutomaticLID;
- (void)deleteMobileAssetConfigVersion;
- (void)deleteRequestID;
- (void)deleteSessionID;
- (void)deleteStatus;
- (void)deleteTask;
- (void)deleteTimeToCancel;
- (void)deleteTimeToFirstPartialDisplayed;
- (void)deleteTimeToRecordingDialogDismissed;
- (void)deleteTimeToShowTranslationCard;
- (void)deleteUiMode;
- (void)setError:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasInRestrictedMode:(BOOL)a3;
- (void)setHasIsAutomaticLID:(BOOL)a3;
- (void)setHasMobileAssetConfigVersion:(BOOL)a3;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTask:(BOOL)a3;
- (void)setHasTimeToCancel:(BOOL)a3;
- (void)setHasTimeToFirstPartialDisplayed:(BOOL)a3;
- (void)setHasTimeToRecordingDialogDismissed:(BOOL)a3;
- (void)setHasTimeToShowTranslationCard:(BOOL)a3;
- (void)setHasUiMode:(BOOL)a3;
- (void)setInRestrictedMode:(BOOL)a3;
- (void)setIsAutomaticLID:(BOOL)a3;
- (void)setMobileAssetConfigVersion:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTask:(id)a3;
- (void)setTimeToCancel:(unsigned int)a3;
- (void)setTimeToFirstPartialDisplayed:(unsigned int)a3;
- (void)setTimeToRecordingDialogDismissed:(unsigned int)a3;
- (void)setTimeToShowTranslationCard:(unsigned int)a3;
- (void)setUiMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaSpeechTranslationEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTSchemaSpeechTranslationEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(LTSchemaSpeechTranslationEvent *)self task];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LTSchemaSpeechTranslationEvent *)self deleteTask];
  }
  v9 = [(LTSchemaSpeechTranslationEvent *)self error];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(LTSchemaSpeechTranslationEvent *)self deleteError];
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
  objc_storeStrong((id *)&self->_mobileAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (void)setHasMobileAssetConfigVersion:(BOOL)a3
{
  self->_hasSessionID = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTask:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)status
{
  return self->_status;
}

- (unsigned)timeToCancel
{
  return self->_timeToCancel;
}

- (unsigned)timeToShowTranslationCard
{
  return self->_timeToShowTranslationCard;
}

- (unsigned)timeToRecordingDialogDismissed
{
  return self->_timeToRecordingDialogDismissed;
}

- (unsigned)timeToFirstPartialDisplayed
{
  return self->_timeToFirstPartialDisplayed;
}

- (void)setMobileAssetConfigVersion:(id)a3
{
}

- (NSString)mobileAssetConfigVersion
{
  return self->_mobileAssetConfigVersion;
}

- (int)uiMode
{
  return self->_uiMode;
}

- (void)setError:(id)a3
{
}

- (LTSchemaError)error
{
  return self->_error;
}

- (BOOL)isAutomaticLID
{
  return self->_isAutomaticLID;
}

- (BOOL)inRestrictedMode
{
  return self->_inRestrictedMode;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setTask:(id)a3
{
}

- (LTSchemaTask)task
{
  return self->_task;
}

- (LTSchemaSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)LTSchemaSpeechTranslationEvent;
  v5 = [(LTSchemaSpeechTranslationEvent *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"task"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[LTSchemaTask alloc] initWithDictionary:v6];
      [(LTSchemaSpeechTranslationEvent *)v5 setTask:v7];
    }
    v32 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"sessionID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaSpeechTranslationEvent *)v5 setSessionID:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(LTSchemaSpeechTranslationEvent *)v5 setRequestID:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"inRestrictedMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setInRestrictedMode:](v5, "setInRestrictedMode:", [v12 BOOLValue]);
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"isAutomaticLID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setIsAutomaticLID:](v5, "setIsAutomaticLID:", [v13 BOOLValue]);
    }
    v30 = v12;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[LTSchemaError alloc] initWithDictionary:v14];
      [(LTSchemaSpeechTranslationEvent *)v5 setError:v15];
    }
    v28 = (void *)v14;
    v16 = [v4 objectForKeyedSubscript:@"uiMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setUiMode:](v5, "setUiMode:", [v16 intValue]);
    }
    v17 = objc_msgSend(v4, "objectForKeyedSubscript:", @"mobileAssetConfigVersion", v16);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(LTSchemaSpeechTranslationEvent *)v5 setMobileAssetConfigVersion:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"timeToFirstPartialDisplayed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setTimeToFirstPartialDisplayed:](v5, "setTimeToFirstPartialDisplayed:", [v19 unsignedIntValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"timeToRecordingDialogDismissed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setTimeToRecordingDialogDismissed:](v5, "setTimeToRecordingDialogDismissed:", [v20 unsignedIntValue]);
    }
    v29 = v13;
    v31 = v8;
    v21 = [v4 objectForKeyedSubscript:@"timeToShowTranslationCard"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setTimeToShowTranslationCard:](v5, "setTimeToShowTranslationCard:", [v21 unsignedIntValue]);
    }
    v22 = v10;
    v23 = [v4 objectForKeyedSubscript:@"timeToCancel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setTimeToCancel:](v5, "setTimeToCancel:", [v23 unsignedIntValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaSpeechTranslationEvent setStatus:](v5, "setStatus:", [v24 intValue]);
    }
    v25 = v5;
  }
  return v5;
}

- (LTSchemaSpeechTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaSpeechTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaSpeechTranslationEvent *)self dictionaryRepresentation];
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
  if (self->_error)
  {
    id v4 = [(LTSchemaSpeechTranslationEvent *)self error];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"error"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"error"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[LTSchemaSpeechTranslationEvent inRestrictedMode](self, "inRestrictedMode"));
    [v3 setObject:v8 forKeyedSubscript:@"inRestrictedMode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[LTSchemaSpeechTranslationEvent isAutomaticLID](self, "isAutomaticLID"));
    [v3 setObject:v9 forKeyedSubscript:@"isAutomaticLID"];
  }
  if (self->_mobileAssetConfigVersion)
  {
    v10 = [(LTSchemaSpeechTranslationEvent *)self mobileAssetConfigVersion];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"mobileAssetConfigVersion"];
  }
  if (self->_requestID)
  {
    v12 = [(LTSchemaSpeechTranslationEvent *)self requestID];
    objc_super v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"requestID"];
  }
  if (self->_sessionID)
  {
    uint64_t v14 = [(LTSchemaSpeechTranslationEvent *)self sessionID];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"sessionID"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    unsigned int v16 = [(LTSchemaSpeechTranslationEvent *)self status] - 1;
    if (v16 > 2) {
      v17 = @"SPEECHTRANSLATIONSTATUS_UNKNOWN";
    }
    else {
      v17 = off_1E5EB1098[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"status"];
  }
  if (self->_task)
  {
    v18 = [(LTSchemaSpeechTranslationEvent *)self task];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"task"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"task"];
    }
  }
  char v21 = (char)self->_has;
  if ((v21 & 0x40) != 0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToCancel](self, "timeToCancel"));
    [v3 setObject:v22 forKeyedSubscript:@"timeToCancel"];

    char v21 = (char)self->_has;
    if ((v21 & 8) == 0)
    {
LABEL_28:
      if ((v21 & 0x10) == 0) {
        goto LABEL_29;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_28;
  }
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToFirstPartialDisplayed](self, "timeToFirstPartialDisplayed"));
  [v3 setObject:v23 forKeyedSubscript:@"timeToFirstPartialDisplayed"];

  char v21 = (char)self->_has;
  if ((v21 & 0x10) == 0)
  {
LABEL_29:
    if ((v21 & 0x20) == 0) {
      goto LABEL_30;
    }
LABEL_35:
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToShowTranslationCard](self, "timeToShowTranslationCard"));
    [v3 setObject:v25 forKeyedSubscript:@"timeToShowTranslationCard"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_40;
    }
LABEL_36:
    unsigned int v26 = [(LTSchemaSpeechTranslationEvent *)self uiMode] - 1;
    if (v26 > 2) {
      v27 = @"UI_MODE_UNKNOWN";
    }
    else {
      v27 = off_1E5EB10B0[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"uiMode"];
    goto LABEL_40;
  }
LABEL_34:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaSpeechTranslationEvent timeToRecordingDialogDismissed](self, "timeToRecordingDialogDismissed"));
  [v3 setObject:v24 forKeyedSubscript:@"timeToRecordingDialogDismissed"];

  char v21 = (char)self->_has;
  if ((v21 & 0x20) != 0) {
    goto LABEL_35;
  }
LABEL_30:
  if ((v21 & 4) != 0) {
    goto LABEL_36;
  }
LABEL_40:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(LTSchemaTask *)self->_task hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash];
  NSUInteger v5 = [(NSString *)self->_requestID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_inRestrictedMode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_isAutomaticLID;
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  unint64_t v8 = [(LTSchemaError *)self->_error hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_uiMode;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_mobileAssetConfigVersion hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_timeToFirstPartialDisplayed;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_11:
      uint64_t v12 = 2654435761 * self->_timeToRecordingDialogDismissed;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_timeToShowTranslationCard;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_18:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_17:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_timeToCancel;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_status;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  NSUInteger v5 = [(LTSchemaSpeechTranslationEvent *)self task];
  uint64_t v6 = [v4 task];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(LTSchemaSpeechTranslationEvent *)self task];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(LTSchemaSpeechTranslationEvent *)self task];
    NSUInteger v10 = [v4 task];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaSpeechTranslationEvent *)self sessionID];
  uint64_t v6 = [v4 sessionID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(LTSchemaSpeechTranslationEvent *)self sessionID];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(LTSchemaSpeechTranslationEvent *)self sessionID];
    uint64_t v15 = [v4 sessionID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaSpeechTranslationEvent *)self requestID];
  uint64_t v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(LTSchemaSpeechTranslationEvent *)self requestID];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(LTSchemaSpeechTranslationEvent *)self requestID];
    v20 = [v4 requestID];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  $A808366AEAC10ABA8EE62D4E47B60E4D has = self->_has;
  unsigned int v23 = v4[84];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_37;
  }
  if (*(unsigned char *)&has)
  {
    int inRestrictedMode = self->_inRestrictedMode;
    if (inRestrictedMode != [v4 inRestrictedMode]) {
      goto LABEL_37;
    }
    $A808366AEAC10ABA8EE62D4E47B60E4D has = self->_has;
    unsigned int v23 = v4[84];
  }
  int v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1)) {
    goto LABEL_37;
  }
  if (v25)
  {
    int isAutomaticLID = self->_isAutomaticLID;
    if (isAutomaticLID != [v4 isAutomaticLID]) {
      goto LABEL_37;
    }
  }
  NSUInteger v5 = [(LTSchemaSpeechTranslationEvent *)self error];
  uint64_t v6 = [v4 error];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(LTSchemaSpeechTranslationEvent *)self error];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(LTSchemaSpeechTranslationEvent *)self error];
    v30 = [v4 error];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int v32 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v32 != ((v4[84] >> 2) & 1)) {
    goto LABEL_37;
  }
  if (v32)
  {
    int uiMode = self->_uiMode;
    if (uiMode != [v4 uiMode]) {
      goto LABEL_37;
    }
  }
  NSUInteger v5 = [(LTSchemaSpeechTranslationEvent *)self mobileAssetConfigVersion];
  uint64_t v6 = [v4 mobileAssetConfigVersion];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v34 = [(LTSchemaSpeechTranslationEvent *)self mobileAssetConfigVersion];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(LTSchemaSpeechTranslationEvent *)self mobileAssetConfigVersion];
    v37 = [v4 mobileAssetConfigVersion];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  $A808366AEAC10ABA8EE62D4E47B60E4D v41 = self->_has;
  int v42 = (*(unsigned int *)&v41 >> 3) & 1;
  unsigned int v43 = v4[84];
  if (v42 == ((v43 >> 3) & 1))
  {
    if (v42)
    {
      unsigned int timeToFirstPartialDisplayed = self->_timeToFirstPartialDisplayed;
      if (timeToFirstPartialDisplayed != [v4 timeToFirstPartialDisplayed]) {
        goto LABEL_37;
      }
      $A808366AEAC10ABA8EE62D4E47B60E4D v41 = self->_has;
      unsigned int v43 = v4[84];
    }
    int v45 = (*(unsigned int *)&v41 >> 4) & 1;
    if (v45 == ((v43 >> 4) & 1))
    {
      if (v45)
      {
        unsigned int timeToRecordingDialogDismissed = self->_timeToRecordingDialogDismissed;
        if (timeToRecordingDialogDismissed != [v4 timeToRecordingDialogDismissed]) {
          goto LABEL_37;
        }
        $A808366AEAC10ABA8EE62D4E47B60E4D v41 = self->_has;
        unsigned int v43 = v4[84];
      }
      int v47 = (*(unsigned int *)&v41 >> 5) & 1;
      if (v47 == ((v43 >> 5) & 1))
      {
        if (v47)
        {
          unsigned int timeToShowTranslationCard = self->_timeToShowTranslationCard;
          if (timeToShowTranslationCard != [v4 timeToShowTranslationCard]) {
            goto LABEL_37;
          }
          $A808366AEAC10ABA8EE62D4E47B60E4D v41 = self->_has;
          unsigned int v43 = v4[84];
        }
        int v49 = (*(unsigned int *)&v41 >> 6) & 1;
        if (v49 == ((v43 >> 6) & 1))
        {
          if (v49)
          {
            unsigned int timeToCancel = self->_timeToCancel;
            if (timeToCancel != [v4 timeToCancel]) {
              goto LABEL_37;
            }
            $A808366AEAC10ABA8EE62D4E47B60E4D v41 = self->_has;
            unsigned int v43 = v4[84];
          }
          if (((v43 ^ *(_DWORD *)&v41) & 0x80) == 0)
          {
            if ((*(unsigned char *)&v41 & 0x80) == 0
              || (int status = self->_status, status == [v4 status]))
            {
              BOOL v39 = 1;
              goto LABEL_38;
            }
          }
        }
      }
    }
  }
LABEL_37:
  BOOL v39 = 0;
LABEL_38:

  return v39;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  NSUInteger v4 = [(LTSchemaSpeechTranslationEvent *)self task];

  if (v4)
  {
    NSUInteger v5 = [(LTSchemaSpeechTranslationEvent *)self task];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(LTSchemaSpeechTranslationEvent *)self sessionID];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(LTSchemaSpeechTranslationEvent *)self requestID];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v9 = [(LTSchemaSpeechTranslationEvent *)self error];

  if (v9)
  {
    NSUInteger v10 = [(LTSchemaSpeechTranslationEvent *)self error];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v11 = [(LTSchemaSpeechTranslationEvent *)self mobileAssetConfigVersion];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  char v12 = (char)self->_has;
  uint64_t v13 = v14;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v13 = v14;
    char v12 = (char)self->_has;
    if ((v12 & 0x10) == 0)
    {
LABEL_19:
      if ((v12 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v13 = v14;
  char v12 = (char)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_20:
    if ((v12 & 0x40) == 0) {
      goto LABEL_21;
    }
LABEL_28:
    PBDataWriterWriteUint32Field();
    uint64_t v13 = v14;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  uint64_t v13 = v14;
  char v12 = (char)self->_has;
  if ((v12 & 0x40) != 0) {
    goto LABEL_28;
  }
LABEL_21:
  if ((v12 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  uint64_t v13 = v14;
LABEL_22:
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_int status = a3;
}

- (void)deleteTimeToCancel
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasTimeToCancel:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimeToCancel
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTimeToCancel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unsigned int timeToCancel = a3;
}

- (void)deleteTimeToShowTranslationCard
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasTimeToShowTranslationCard:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimeToShowTranslationCard
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTimeToShowTranslationCard:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int timeToShowTranslationCard = a3;
}

- (void)deleteTimeToRecordingDialogDismissed
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTimeToRecordingDialogDismissed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeToRecordingDialogDismissed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimeToRecordingDialogDismissed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int timeToRecordingDialogDismissed = a3;
}

- (void)deleteTimeToFirstPartialDisplayed
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTimeToFirstPartialDisplayed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeToFirstPartialDisplayed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTimeToFirstPartialDisplayed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int timeToFirstPartialDisplayed = a3;
}

- (void)deleteMobileAssetConfigVersion
{
}

- (BOOL)hasMobileAssetConfigVersion
{
  return self->_mobileAssetConfigVersion != 0;
}

- (void)deleteUiMode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasUiMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUiMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUiMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int uiMode = a3;
}

- (void)deleteError
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteIsAutomaticLID
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsAutomaticLID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAutomaticLID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAutomaticLID:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isAutomaticLID = a3;
}

- (void)deleteInRestrictedMode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInRestrictedMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInRestrictedMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInRestrictedMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int inRestrictedMode = a3;
}

- (void)deleteRequestID
{
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteSessionID
{
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)deleteTask
{
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end