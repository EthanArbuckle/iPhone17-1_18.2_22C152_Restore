@interface RTSSchemaRTSSecondPassPolicyDecisionMade
- (BOOL)hasIsReplayModeEnabled;
- (BOOL)hasIsSecondPassTriggered;
- (BOOL)hasProcessedAudioDurationInMs;
- (BOOL)hasSpeakingProbability;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplayModeEnabled;
- (BOOL)isSecondPassTriggered;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RTSSchemaRTSSecondPassPolicyDecisionMade)initWithDictionary:(id)a3;
- (RTSSchemaRTSSecondPassPolicyDecisionMade)initWithJSON:(id)a3;
- (double)processedAudioDurationInMs;
- (double)speakingProbability;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsReplayModeEnabled;
- (void)deleteIsSecondPassTriggered;
- (void)deleteProcessedAudioDurationInMs;
- (void)deleteSpeakingProbability;
- (void)setHasIsReplayModeEnabled:(BOOL)a3;
- (void)setHasIsSecondPassTriggered:(BOOL)a3;
- (void)setHasProcessedAudioDurationInMs:(BOOL)a3;
- (void)setHasSpeakingProbability:(BOOL)a3;
- (void)setIsReplayModeEnabled:(BOOL)a3;
- (void)setIsSecondPassTriggered:(BOOL)a3;
- (void)setProcessedAudioDurationInMs:(double)a3;
- (void)setSpeakingProbability:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation RTSSchemaRTSSecondPassPolicyDecisionMade

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isReplayModeEnabled
{
  return self->_isReplayModeEnabled;
}

- (double)processedAudioDurationInMs
{
  return self->_processedAudioDurationInMs;
}

- (double)speakingProbability
{
  return self->_speakingProbability;
}

- (BOOL)isSecondPassTriggered
{
  return self->_isSecondPassTriggered;
}

- (RTSSchemaRTSSecondPassPolicyDecisionMade)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSSchemaRTSSecondPassPolicyDecisionMade;
  v5 = [(RTSSchemaRTSSecondPassPolicyDecisionMade *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSecondPassTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RTSSchemaRTSSecondPassPolicyDecisionMade setIsSecondPassTriggered:](v5, "setIsSecondPassTriggered:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"speakingProbability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[RTSSchemaRTSSecondPassPolicyDecisionMade setSpeakingProbability:](v5, "setSpeakingProbability:");
    }
    v8 = [v4 objectForKeyedSubscript:@"processedAudioDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[RTSSchemaRTSSecondPassPolicyDecisionMade setProcessedAudioDurationInMs:](v5, "setProcessedAudioDurationInMs:");
    }
    v9 = [v4 objectForKeyedSubscript:@"isReplayModeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RTSSchemaRTSSecondPassPolicyDecisionMade setIsReplayModeEnabled:](v5, "setIsReplayModeEnabled:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (RTSSchemaRTSSecondPassPolicyDecisionMade)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RTSSchemaRTSSecondPassPolicyDecisionMade *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RTSSchemaRTSSecondPassPolicyDecisionMade *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 8) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[RTSSchemaRTSSecondPassPolicyDecisionMade isReplayModeEnabled](self, "isReplayModeEnabled"));
    [v3 setObject:v8 forKeyedSubscript:@"isReplayModeEnabled"];

    char v4 = *(&self->_isReplayModeEnabled + 1);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if (!*(&self->_isReplayModeEnabled + 1))
  {
    goto LABEL_3;
  }
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[RTSSchemaRTSSecondPassPolicyDecisionMade isSecondPassTriggered](self, "isSecondPassTriggered"));
  [v3 setObject:v9 forKeyedSubscript:@"isSecondPassTriggered"];

  char v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v10 = NSNumber;
  [(RTSSchemaRTSSecondPassPolicyDecisionMade *)self processedAudioDurationInMs];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"processedAudioDurationInMs"];

  if ((*(&self->_isReplayModeEnabled + 1) & 2) != 0)
  {
LABEL_5:
    v5 = NSNumber;
    [(RTSSchemaRTSSecondPassPolicyDecisionMade *)self speakingProbability];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"speakingProbability"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char v3 = *(&self->_isReplayModeEnabled + 1);
  if (v3)
  {
    uint64_t v4 = 2654435761 * self->_isSecondPassTriggered;
    if ((*(&self->_isReplayModeEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(&self->_isReplayModeEnabled + 1) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double speakingProbability = self->_speakingProbability;
  double v6 = -speakingProbability;
  if (speakingProbability >= 0.0) {
    double v6 = self->_speakingProbability;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((v3 & 4) != 0)
  {
    double processedAudioDurationInMs = self->_processedAudioDurationInMs;
    double v12 = -processedAudioDurationInMs;
    if (processedAudioDurationInMs >= 0.0) {
      double v12 = self->_processedAudioDurationInMs;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((v3 & 8) != 0) {
    uint64_t v15 = 2654435761 * self->_isReplayModeEnabled;
  }
  else {
    uint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
  unsigned int v6 = v4[33];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (v5)
  {
    int isSecondPassTriggered = self->_isSecondPassTriggered;
    if (isSecondPassTriggered != [v4 isSecondPassTriggered]) {
      goto LABEL_18;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
    unsigned int v6 = v4[33];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    double speakingProbability = self->_speakingProbability;
    [v4 speakingProbability];
    if (speakingProbability != v10) {
      goto LABEL_18;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
    unsigned int v6 = v4[33];
  }
  int v11 = (v5 >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v11)
  {
    double processedAudioDurationInMs = self->_processedAudioDurationInMs;
    [v4 processedAudioDurationInMs];
    if (processedAudioDurationInMs == v13)
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
      unsigned int v6 = v4[33];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v16 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v14 = (v5 >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v14)
  {
    int isReplayModeEnabled = self->_isReplayModeEnabled;
    if (isReplayModeEnabled != [v4 isReplayModeEnabled]) {
      goto LABEL_18;
    }
  }
  BOOL v16 = 1;
LABEL_19:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isReplayModeEnabled + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_isReplayModeEnabled + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(&self->_isReplayModeEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if ((*(&self->_isReplayModeEnabled + 1) & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSSecondPassPolicyDecisionMadeReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsReplayModeEnabled
{
  *(&self->_isReplayModeEnabled + 1) &= ~8u;
}

- (void)setHasIsReplayModeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xF7 | v3;
}

- (BOOL)hasIsReplayModeEnabled
{
  return (*((unsigned __int8 *)&self->_isReplayModeEnabled + 1) >> 3) & 1;
}

- (void)setIsReplayModeEnabled:(BOOL)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 8u;
  self->_int isReplayModeEnabled = a3;
}

- (void)deleteProcessedAudioDurationInMs
{
  *(&self->_isReplayModeEnabled + 1) &= ~4u;
}

- (void)setHasProcessedAudioDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasProcessedAudioDurationInMs
{
  return (*((unsigned __int8 *)&self->_isReplayModeEnabled + 1) >> 2) & 1;
}

- (void)setProcessedAudioDurationInMs:(double)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 4u;
  self->_double processedAudioDurationInMs = a3;
}

- (void)deleteSpeakingProbability
{
  *(&self->_isReplayModeEnabled + 1) &= ~2u;
}

- (void)setHasSpeakingProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasSpeakingProbability
{
  return (*((unsigned __int8 *)&self->_isReplayModeEnabled + 1) >> 1) & 1;
}

- (void)setSpeakingProbability:(double)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 2u;
  self->_double speakingProbability = a3;
}

- (void)deleteIsSecondPassTriggered
{
  *(&self->_isReplayModeEnabled + 1) &= ~1u;
}

- (void)setHasIsSecondPassTriggered:(BOOL)a3
{
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsSecondPassTriggered
{
  return *(&self->_isReplayModeEnabled + 1);
}

- (void)setIsSecondPassTriggered:(BOOL)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 1u;
  self->_int isSecondPassTriggered = a3;
}

@end