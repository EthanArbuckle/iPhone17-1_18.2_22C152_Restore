@interface CDASchemaCDAUserFeedbackCompleted
- (BOOL)hasDataCollectionGroup;
- (BOOL)hasExpectedWinnerElectionParticipantId;
- (BOOL)hasExpectedWinnerSiriSpeechId;
- (BOOL)hasExperimentId;
- (BOOL)hasFailureReasonCategory;
- (BOOL)hasHasResponseFromMultipleDevices;
- (BOOL)hasIsCorrectDeviceSelected;
- (BOOL)hasResponseFromMultipleDevices;
- (BOOL)hasSurveyId;
- (BOOL)hasUserFeedbackStatus;
- (BOOL)hasUserReportedResponseDeviceDistance;
- (BOOL)isCorrectDeviceSelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAUserFeedbackCompleted)initWithDictionary:(id)a3;
- (CDASchemaCDAUserFeedbackCompleted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)experimentId;
- (NSString)failureReasonCategory;
- (NSString)surveyId;
- (SISchemaUUID)expectedWinnerElectionParticipantId;
- (SISchemaUUID)expectedWinnerSiriSpeechId;
- (double)userReportedResponseDeviceDistance;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)dataCollectionGroup;
- (int)userFeedbackStatus;
- (unint64_t)hash;
- (void)deleteDataCollectionGroup;
- (void)deleteExpectedWinnerElectionParticipantId;
- (void)deleteExpectedWinnerSiriSpeechId;
- (void)deleteExperimentId;
- (void)deleteFailureReasonCategory;
- (void)deleteHasResponseFromMultipleDevices;
- (void)deleteIsCorrectDeviceSelected;
- (void)deleteSurveyId;
- (void)deleteUserFeedbackStatus;
- (void)deleteUserReportedResponseDeviceDistance;
- (void)setDataCollectionGroup:(int)a3;
- (void)setExpectedWinnerElectionParticipantId:(id)a3;
- (void)setExpectedWinnerSiriSpeechId:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setFailureReasonCategory:(id)a3;
- (void)setHasDataCollectionGroup:(BOOL)a3;
- (void)setHasExpectedWinnerElectionParticipantId:(BOOL)a3;
- (void)setHasExpectedWinnerSiriSpeechId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasFailureReasonCategory:(BOOL)a3;
- (void)setHasHasResponseFromMultipleDevices:(BOOL)a3;
- (void)setHasIsCorrectDeviceSelected:(BOOL)a3;
- (void)setHasResponseFromMultipleDevices:(BOOL)a3;
- (void)setHasSurveyId:(BOOL)a3;
- (void)setHasUserFeedbackStatus:(BOOL)a3;
- (void)setHasUserReportedResponseDeviceDistance:(BOOL)a3;
- (void)setIsCorrectDeviceSelected:(BOOL)a3;
- (void)setSurveyId:(id)a3;
- (void)setUserFeedbackStatus:(int)a3;
- (void)setUserReportedResponseDeviceDistance:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAUserFeedbackCompleted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDASchemaCDAUserFeedbackCompleted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(CDASchemaCDAUserFeedbackCompleted *)self deleteExpectedWinnerSiriSpeechId];
  }
  v6 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CDASchemaCDAUserFeedbackCompleted *)self deleteExpectedWinnerSiriSpeechId];
  }
  v9 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CDASchemaCDAUserFeedbackCompleted *)self deleteExpectedWinnerElectionParticipantId];
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
  objc_storeStrong((id *)&self->_expectedWinnerElectionParticipantId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_failureReasonCategory, 0);
  objc_storeStrong((id *)&self->_expectedWinnerSiriSpeechId, 0);
  objc_storeStrong((id *)&self->_surveyId, 0);
}

- (void)setHasExpectedWinnerElectionParticipantId:(BOOL)a3
{
  self->_hasExpectedWinnerSiriSpeechId = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  self->_hasSurveyId = a3;
}

- (void)setHasFailureReasonCategory:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasExpectedWinnerSiriSpeechId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSurveyId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setExpectedWinnerElectionParticipantId:(id)a3
{
}

- (SISchemaUUID)expectedWinnerElectionParticipantId
{
  return self->_expectedWinnerElectionParticipantId;
}

- (BOOL)hasResponseFromMultipleDevices
{
  return self->_hasResponseFromMultipleDevices;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (int)dataCollectionGroup
{
  return self->_dataCollectionGroup;
}

- (double)userReportedResponseDeviceDistance
{
  return self->_userReportedResponseDeviceDistance;
}

- (void)setFailureReasonCategory:(id)a3
{
}

- (NSString)failureReasonCategory
{
  return self->_failureReasonCategory;
}

- (void)setExpectedWinnerSiriSpeechId:(id)a3
{
}

- (SISchemaUUID)expectedWinnerSiriSpeechId
{
  return self->_expectedWinnerSiriSpeechId;
}

- (BOOL)isCorrectDeviceSelected
{
  return self->_isCorrectDeviceSelected;
}

- (int)userFeedbackStatus
{
  return self->_userFeedbackStatus;
}

- (void)setSurveyId:(id)a3
{
}

- (NSString)surveyId
{
  return self->_surveyId;
}

- (CDASchemaCDAUserFeedbackCompleted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CDASchemaCDAUserFeedbackCompleted;
  v5 = [(CDASchemaCDAUserFeedbackCompleted *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"surveyId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(CDASchemaCDAUserFeedbackCompleted *)v5 setSurveyId:v7];
    }
    v25 = v6;
    int v8 = [v4 objectForKeyedSubscript:@"userFeedbackStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackCompleted setUserFeedbackStatus:](v5, "setUserFeedbackStatus:", [v8 intValue]);
    }
    v24 = v8;
    v9 = [v4 objectForKeyedSubscript:@"isCorrectDeviceSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackCompleted setIsCorrectDeviceSelected:](v5, "setIsCorrectDeviceSelected:", [v9 BOOLValue]);
    }
    v23 = v9;
    v10 = [v4 objectForKeyedSubscript:@"expectedWinnerSiriSpeechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(CDASchemaCDAUserFeedbackCompleted *)v5 setExpectedWinnerSiriSpeechId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"failureReasonCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(CDASchemaCDAUserFeedbackCompleted *)v5 setFailureReasonCategory:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"userReportedResponseDeviceDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[CDASchemaCDAUserFeedbackCompleted setUserReportedResponseDeviceDistance:](v5, "setUserReportedResponseDeviceDistance:");
    }
    v15 = [v4 objectForKeyedSubscript:@"dataCollectionGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackCompleted setDataCollectionGroup:](v5, "setDataCollectionGroup:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(CDASchemaCDAUserFeedbackCompleted *)v5 setExperimentId:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"hasResponseFromMultipleDevices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackCompleted setHasResponseFromMultipleDevices:](v5, "setHasResponseFromMultipleDevices:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"expectedWinnerElectionParticipantId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[SISchemaUUID alloc] initWithDictionary:v19];
      [(CDASchemaCDAUserFeedbackCompleted *)v5 setExpectedWinnerElectionParticipantId:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (CDASchemaCDAUserFeedbackCompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAUserFeedbackCompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAUserFeedbackCompleted *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unsigned int v4 = [(CDASchemaCDAUserFeedbackCompleted *)self dataCollectionGroup] - 1;
    if (v4 > 3) {
      v5 = @"CDADATACOLLECTIONGROUP_UNKNOWN";
    }
    else {
      v5 = off_1E5EBADA0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"dataCollectionGroup"];
  }
  if (self->_expectedWinnerElectionParticipantId)
  {
    v6 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"expectedWinnerElectionParticipantId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"expectedWinnerElectionParticipantId"];
    }
  }
  if (self->_expectedWinnerSiriSpeechId)
  {
    v9 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"expectedWinnerSiriSpeechId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"expectedWinnerSiriSpeechId"];
    }
  }
  if (self->_experimentId)
  {
    v12 = [(CDASchemaCDAUserFeedbackCompleted *)self experimentId];
    objc_super v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"experimentId"];
  }
  if (self->_failureReasonCategory)
  {
    v14 = [(CDASchemaCDAUserFeedbackCompleted *)self failureReasonCategory];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"failureReasonCategory"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDAUserFeedbackCompleted hasResponseFromMultipleDevices](self, "hasResponseFromMultipleDevices"));
    [v3 setObject:v17 forKeyedSubscript:@"hasResponseFromMultipleDevices"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDAUserFeedbackCompleted isCorrectDeviceSelected](self, "isCorrectDeviceSelected"));
    [v3 setObject:v18 forKeyedSubscript:@"isCorrectDeviceSelected"];
  }
  if (self->_surveyId)
  {
    v19 = [(CDASchemaCDAUserFeedbackCompleted *)self surveyId];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"surveyId"];
  }
  char v21 = (char)self->_has;
  if (v21)
  {
    unsigned int v22 = [(CDASchemaCDAUserFeedbackCompleted *)self userFeedbackStatus] - 1;
    if (v22 > 3) {
      v23 = @"CDAUSERFEEDBACKSTATUS_UNKNOWN";
    }
    else {
      v23 = off_1E5EBADC0[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"userFeedbackStatus"];
    char v21 = (char)self->_has;
  }
  if ((v21 & 4) != 0)
  {
    v24 = NSNumber;
    [(CDASchemaCDAUserFeedbackCompleted *)self userReportedResponseDeviceDistance];
    v25 = objc_msgSend(v24, "numberWithDouble:");
    [v3 setObject:v25 forKeyedSubscript:@"userReportedResponseDeviceDistance"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_surveyId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_userFeedbackStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isCorrectDeviceSelected;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(SISchemaUUID *)self->_expectedWinnerSiriSpeechId hash];
  NSUInteger v7 = [(NSString *)self->_failureReasonCategory hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double userReportedResponseDeviceDistance = self->_userReportedResponseDeviceDistance;
    double v11 = -userReportedResponseDeviceDistance;
    if (userReportedResponseDeviceDistance >= 0.0) {
      double v11 = self->_userReportedResponseDeviceDistance;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v14 = 2654435761 * self->_dataCollectionGroup;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_experimentId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v16 = 2654435761 * self->_hasResponseFromMultipleDevices;
  }
  else {
    uint64_t v16 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v15 ^ v16 ^ [(SISchemaUUID *)self->_expectedWinnerElectionParticipantId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  uint64_t v5 = [(CDASchemaCDAUserFeedbackCompleted *)self surveyId];
  unint64_t v6 = [v4 surveyId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v7 = [(CDASchemaCDAUserFeedbackCompleted *)self surveyId];
  if (v7)
  {
    int v8 = (void *)v7;
    unint64_t v9 = [(CDASchemaCDAUserFeedbackCompleted *)self surveyId];
    v10 = [v4 surveyId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  $B347903BEE51CC6F3586B64740996CC9 has = self->_has;
  unsigned int v13 = v4[80];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_44;
  }
  if (*(unsigned char *)&has)
  {
    int userFeedbackStatus = self->_userFeedbackStatus;
    if (userFeedbackStatus != [v4 userFeedbackStatus]) {
      goto LABEL_44;
    }
    $B347903BEE51CC6F3586B64740996CC9 has = self->_has;
    unsigned int v13 = v4[80];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_44;
  }
  if (v15)
  {
    int isCorrectDeviceSelected = self->_isCorrectDeviceSelected;
    if (isCorrectDeviceSelected != [v4 isCorrectDeviceSelected]) {
      goto LABEL_44;
    }
  }
  uint64_t v5 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];
  unint64_t v6 = [v4 expectedWinnerSiriSpeechId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v17 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];
    v20 = [v4 expectedWinnerSiriSpeechId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CDASchemaCDAUserFeedbackCompleted *)self failureReasonCategory];
  unint64_t v6 = [v4 failureReasonCategory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v22 = [(CDASchemaCDAUserFeedbackCompleted *)self failureReasonCategory];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(CDASchemaCDAUserFeedbackCompleted *)self failureReasonCategory];
    v25 = [v4 failureReasonCategory];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  $B347903BEE51CC6F3586B64740996CC9 v27 = self->_has;
  int v28 = (*(unsigned int *)&v27 >> 2) & 1;
  unsigned int v29 = v4[80];
  if (v28 != ((v29 >> 2) & 1)) {
    goto LABEL_44;
  }
  if (v28)
  {
    double userReportedResponseDeviceDistance = self->_userReportedResponseDeviceDistance;
    [v4 userReportedResponseDeviceDistance];
    if (userReportedResponseDeviceDistance != v31) {
      goto LABEL_44;
    }
    $B347903BEE51CC6F3586B64740996CC9 v27 = self->_has;
    unsigned int v29 = v4[80];
  }
  int v32 = (*(unsigned int *)&v27 >> 3) & 1;
  if (v32 != ((v29 >> 3) & 1)) {
    goto LABEL_44;
  }
  if (v32)
  {
    int dataCollectionGroup = self->_dataCollectionGroup;
    if (dataCollectionGroup != [v4 dataCollectionGroup]) {
      goto LABEL_44;
    }
  }
  uint64_t v5 = [(CDASchemaCDAUserFeedbackCompleted *)self experimentId];
  unint64_t v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_43;
  }
  uint64_t v34 = [(CDASchemaCDAUserFeedbackCompleted *)self experimentId];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(CDASchemaCDAUserFeedbackCompleted *)self experimentId];
    v37 = [v4 experimentId];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  int v39 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v39 != ((v4[80] >> 4) & 1)) {
    goto LABEL_44;
  }
  if (v39)
  {
    int hasResponseFromMultipleDevices = self->_hasResponseFromMultipleDevices;
    if (hasResponseFromMultipleDevices != [v4 hasResponseFromMultipleDevices]) {
      goto LABEL_44;
    }
  }
  uint64_t v5 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];
  unint64_t v6 = [v4 expectedWinnerElectionParticipantId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v41 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];
  if (!v41)
  {

LABEL_47:
    BOOL v46 = 1;
    goto LABEL_45;
  }
  v42 = (void *)v41;
  v43 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];
  v44 = [v4 expectedWinnerElectionParticipantId];
  char v45 = [v43 isEqual:v44];

  if (v45) {
    goto LABEL_47;
  }
LABEL_44:
  BOOL v46 = 0;
LABEL_45:

  return v46;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(CDASchemaCDAUserFeedbackCompleted *)self surveyId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v6 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];

  if (v6)
  {
    uint64_t v7 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerSiriSpeechId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(CDASchemaCDAUserFeedbackCompleted *)self failureReasonCategory];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  char v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v10 = [(CDASchemaCDAUserFeedbackCompleted *)self experimentId];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v11 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];

  long double v12 = v14;
  if (v11)
  {
    unsigned int v13 = [(CDASchemaCDAUserFeedbackCompleted *)self expectedWinnerElectionParticipantId];
    PBDataWriterWriteSubmessage();

    long double v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAUserFeedbackCompletedReadFrom(self, (uint64_t)a3);
}

- (void)deleteExpectedWinnerElectionParticipantId
{
}

- (BOOL)hasExpectedWinnerElectionParticipantId
{
  return self->_expectedWinnerElectionParticipantId != 0;
}

- (void)deleteHasResponseFromMultipleDevices
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasHasResponseFromMultipleDevices:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHasResponseFromMultipleDevices
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasResponseFromMultipleDevices:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int hasResponseFromMultipleDevices = a3;
}

- (void)deleteExperimentId
{
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (void)deleteDataCollectionGroup
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasDataCollectionGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDataCollectionGroup
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDataCollectionGroup:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int dataCollectionGroup = a3;
}

- (void)deleteUserReportedResponseDeviceDistance
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasUserReportedResponseDeviceDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserReportedResponseDeviceDistance
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUserReportedResponseDeviceDistance:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double userReportedResponseDeviceDistance = a3;
}

- (void)deleteFailureReasonCategory
{
}

- (BOOL)hasFailureReasonCategory
{
  return self->_failureReasonCategory != 0;
}

- (void)deleteExpectedWinnerSiriSpeechId
{
}

- (BOOL)hasExpectedWinnerSiriSpeechId
{
  return self->_expectedWinnerSiriSpeechId != 0;
}

- (void)deleteIsCorrectDeviceSelected
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsCorrectDeviceSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsCorrectDeviceSelected
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsCorrectDeviceSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isCorrectDeviceSelected = a3;
}

- (void)deleteUserFeedbackStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserFeedbackStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserFeedbackStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserFeedbackStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int userFeedbackStatus = a3;
}

- (void)deleteSurveyId
{
}

- (BOOL)hasSurveyId
{
  return self->_surveyId != 0;
}

@end