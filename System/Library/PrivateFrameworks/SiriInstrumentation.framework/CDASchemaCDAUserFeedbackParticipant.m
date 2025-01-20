@interface CDASchemaCDAUserFeedbackParticipant
- (BOOL)hasAdvertisement;
- (BOOL)hasAlarmState;
- (BOOL)hasBuild;
- (BOOL)hasCdaId;
- (BOOL)hasDecision;
- (BOOL)hasGranularBoostDecay;
- (BOOL)hasGranularBoostValue;
- (BOOL)hasHalTargetSiriSpeechId;
- (BOOL)hasIsNearMiss;
- (BOOL)hasLocale;
- (BOOL)hasMediaState;
- (BOOL)hasPsdScore;
- (BOOL)hasRawGoodnessScore;
- (BOOL)hasRequestId;
- (BOOL)hasRoomNameHash;
- (BOOL)hasScoreBoosters;
- (BOOL)hasSiriSpeechId;
- (BOOL)hasTimeSinceLastWinInMilliseconds;
- (BOOL)hasTimeSinceTriggerInMilliseconds;
- (BOOL)hasTimerState;
- (BOOL)hasTriggerType;
- (BOOL)hasTrumpReason;
- (BOOL)hasVoiceTriggerTimeNS;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearMiss;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAAdvertisementData)advertisement;
- (CDASchemaCDAScoreBoosters)scoreBoosters;
- (CDASchemaCDAUserFeedbackParticipant)initWithDictionary:(id)a3;
- (CDASchemaCDAUserFeedbackParticipant)initWithJSON:(id)a3;
- (NSArray)productTypes;
- (NSData)jsonData;
- (NSString)build;
- (NSString)locale;
- (NSString)roomNameHash;
- (SISchemaUUID)cdaId;
- (SISchemaUUID)halTargetSiriSpeechId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)siriSpeechId;
- (double)granularBoostDecay;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)productTypesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)alarmState;
- (int)decision;
- (int)mediaState;
- (int)timerState;
- (int)triggerType;
- (int)trumpReason;
- (unint64_t)hash;
- (unint64_t)productTypesCount;
- (unint64_t)timeSinceLastWinInMilliseconds;
- (unint64_t)timeSinceTriggerInMilliseconds;
- (unint64_t)voiceTriggerTimeNS;
- (unsigned)granularBoostValue;
- (unsigned)psdScore;
- (unsigned)rawGoodnessScore;
- (void)addProductTypes:(id)a3;
- (void)clearProductTypes;
- (void)deleteAdvertisement;
- (void)deleteAlarmState;
- (void)deleteBuild;
- (void)deleteCdaId;
- (void)deleteDecision;
- (void)deleteGranularBoostDecay;
- (void)deleteGranularBoostValue;
- (void)deleteHalTargetSiriSpeechId;
- (void)deleteIsNearMiss;
- (void)deleteLocale;
- (void)deleteMediaState;
- (void)deletePsdScore;
- (void)deleteRawGoodnessScore;
- (void)deleteRequestId;
- (void)deleteRoomNameHash;
- (void)deleteScoreBoosters;
- (void)deleteSiriSpeechId;
- (void)deleteTimeSinceLastWinInMilliseconds;
- (void)deleteTimeSinceTriggerInMilliseconds;
- (void)deleteTimerState;
- (void)deleteTriggerType;
- (void)deleteTrumpReason;
- (void)deleteVoiceTriggerTimeNS;
- (void)setAdvertisement:(id)a3;
- (void)setAlarmState:(int)a3;
- (void)setBuild:(id)a3;
- (void)setCdaId:(id)a3;
- (void)setDecision:(int)a3;
- (void)setGranularBoostDecay:(double)a3;
- (void)setGranularBoostValue:(unsigned int)a3;
- (void)setHalTargetSiriSpeechId:(id)a3;
- (void)setHasAdvertisement:(BOOL)a3;
- (void)setHasAlarmState:(BOOL)a3;
- (void)setHasBuild:(BOOL)a3;
- (void)setHasCdaId:(BOOL)a3;
- (void)setHasDecision:(BOOL)a3;
- (void)setHasGranularBoostDecay:(BOOL)a3;
- (void)setHasGranularBoostValue:(BOOL)a3;
- (void)setHasHalTargetSiriSpeechId:(BOOL)a3;
- (void)setHasIsNearMiss:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasMediaState:(BOOL)a3;
- (void)setHasPsdScore:(BOOL)a3;
- (void)setHasRawGoodnessScore:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasRoomNameHash:(BOOL)a3;
- (void)setHasScoreBoosters:(BOOL)a3;
- (void)setHasSiriSpeechId:(BOOL)a3;
- (void)setHasTimeSinceLastWinInMilliseconds:(BOOL)a3;
- (void)setHasTimeSinceTriggerInMilliseconds:(BOOL)a3;
- (void)setHasTimerState:(BOOL)a3;
- (void)setHasTriggerType:(BOOL)a3;
- (void)setHasTrumpReason:(BOOL)a3;
- (void)setHasVoiceTriggerTimeNS:(BOOL)a3;
- (void)setIsNearMiss:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMediaState:(int)a3;
- (void)setProductTypes:(id)a3;
- (void)setPsdScore:(unsigned int)a3;
- (void)setRawGoodnessScore:(unsigned int)a3;
- (void)setRequestId:(id)a3;
- (void)setRoomNameHash:(id)a3;
- (void)setScoreBoosters:(id)a3;
- (void)setSiriSpeechId:(id)a3;
- (void)setTimeSinceLastWinInMilliseconds:(unint64_t)a3;
- (void)setTimeSinceTriggerInMilliseconds:(unint64_t)a3;
- (void)setTimerState:(int)a3;
- (void)setTriggerType:(int)a3;
- (void)setTrumpReason:(int)a3;
- (void)setVoiceTriggerTimeNS:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAUserFeedbackParticipant

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CDASchemaCDAUserFeedbackParticipant;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8])
  {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteSiriSpeechId];
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteHalTargetSiriSpeechId];
  }
  v6 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteSiriSpeechId];
  }
  v9 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteCdaId];
  }
  v12 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteRequestId];
  }
  v15 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteHalTargetSiriSpeechId];
  }
  v18 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteScoreBoosters];
  }
  v21 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(CDASchemaCDAUserFeedbackParticipant *)self deleteAdvertisement];
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
  objc_storeStrong((id *)&self->_productTypes, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_scoreBoosters, 0);
  objc_storeStrong((id *)&self->_roomNameHash, 0);
  objc_storeStrong((id *)&self->_halTargetSiriSpeechId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_cdaId, 0);
  objc_storeStrong((id *)&self->_siriSpeechId, 0);
}

- (void)setHasAdvertisement:(BOOL)a3
{
  self->_hasHalTargetSiriSpeechId = a3;
}

- (void)setHasLocale:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasBuild:(BOOL)a3
{
  self->_hasCdaId = a3;
}

- (void)setHasScoreBoosters:(BOOL)a3
{
  self->_hasSiriSpeechId = a3;
}

- (void)setHasRoomNameHash:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasHalTargetSiriSpeechId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasCdaId:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasSiriSpeechId:(BOOL)a3
{
  *(&self->_isNearMiss + 3) = a3;
}

- (BOOL)isNearMiss
{
  return self->_isNearMiss;
}

- (void)setProductTypes:(id)a3
{
}

- (NSArray)productTypes
{
  return self->_productTypes;
}

- (void)setAdvertisement:(id)a3
{
}

- (CDASchemaCDAAdvertisementData)advertisement
{
  return self->_advertisement;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setBuild:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setScoreBoosters:(id)a3
{
}

- (CDASchemaCDAScoreBoosters)scoreBoosters
{
  return self->_scoreBoosters;
}

- (unint64_t)timeSinceTriggerInMilliseconds
{
  return self->_timeSinceTriggerInMilliseconds;
}

- (void)setRoomNameHash:(id)a3
{
}

- (NSString)roomNameHash
{
  return self->_roomNameHash;
}

- (int)triggerType
{
  return self->_triggerType;
}

- (unint64_t)timeSinceLastWinInMilliseconds
{
  return self->_timeSinceLastWinInMilliseconds;
}

- (int)timerState
{
  return self->_timerState;
}

- (int)alarmState
{
  return self->_alarmState;
}

- (int)mediaState
{
  return self->_mediaState;
}

- (unsigned)psdScore
{
  return self->_psdScore;
}

- (int)trumpReason
{
  return self->_trumpReason;
}

- (double)granularBoostDecay
{
  return self->_granularBoostDecay;
}

- (unsigned)granularBoostValue
{
  return self->_granularBoostValue;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (unint64_t)voiceTriggerTimeNS
{
  return self->_voiceTriggerTimeNS;
}

- (int)decision
{
  return self->_decision;
}

- (void)setHalTargetSiriSpeechId:(id)a3
{
}

- (SISchemaUUID)halTargetSiriSpeechId
{
  return self->_halTargetSiriSpeechId;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setCdaId:(id)a3
{
}

- (SISchemaUUID)cdaId
{
  return self->_cdaId;
}

- (void)setSiriSpeechId:(id)a3
{
}

- (SISchemaUUID)siriSpeechId
{
  return self->_siriSpeechId;
}

- (CDASchemaCDAUserFeedbackParticipant)initWithDictionary:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CDASchemaCDAUserFeedbackParticipant;
  v5 = [(CDASchemaCDAUserFeedbackParticipant *)&v76 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"siriSpeechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setSiriSpeechId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"cdaId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setCdaId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setRequestId:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"halTargetSiriSpeechId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setHalTargetSiriSpeechId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"decision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setDecision:](v5, "setDecision:", [v14 intValue]);
    }
    v64 = (void *)v12;
    v15 = (void *)v10;
    v16 = [v4 objectForKeyedSubscript:@"voiceTriggerTimeNS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setVoiceTriggerTimeNS:](v5, "setVoiceTriggerTimeNS:", [v16 unsignedLongLongValue]);
    }
    int v17 = [v4 objectForKeyedSubscript:@"rawGoodnessScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setRawGoodnessScore:](v5, "setRawGoodnessScore:", [v17 unsignedIntValue]);
    }
    v61 = v17;
    v18 = [v4 objectForKeyedSubscript:@"granularBoostValue"];
    objc_opt_class();
    v71 = v18;
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setGranularBoostValue:](v5, "setGranularBoostValue:", [v18 unsignedIntValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"granularBoostDecay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 doubleValue];
      -[CDASchemaCDAUserFeedbackParticipant setGranularBoostDecay:](v5, "setGranularBoostDecay:");
    }
    v60 = v19;
    int v20 = [v4 objectForKeyedSubscript:@"trumpReason"];
    objc_opt_class();
    v70 = v20;
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setTrumpReason:](v5, "setTrumpReason:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"psdScore"];
    objc_opt_class();
    v69 = v21;
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setPsdScore:](v5, "setPsdScore:", [v21 unsignedIntValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"mediaState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setMediaState:](v5, "setMediaState:", [v22 intValue]);
    }
    int v23 = [v4 objectForKeyedSubscript:@"alarmState"];
    objc_opt_class();
    v68 = v23;
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setAlarmState:](v5, "setAlarmState:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"timerState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setTimerState:](v5, "setTimerState:", [v24 intValue]);
    }
    objc_super v25 = [v4 objectForKeyedSubscript:@"timeSinceLastWinInMilliseconds"];
    objc_opt_class();
    v67 = v25;
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setTimeSinceLastWinInMilliseconds:](v5, "setTimeSinceLastWinInMilliseconds:", [v25 unsignedLongLongValue]);
    }
    v62 = v16;
    v26 = [v4 objectForKeyedSubscript:@"triggerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setTriggerType:](v5, "setTriggerType:", [v26 intValue]);
    }
    v63 = v14;
    v27 = [v4 objectForKeyedSubscript:@"roomNameHash"];
    objc_opt_class();
    v66 = v27;
    v28 = (void *)v6;
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v27 copy];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setRoomNameHash:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"timeSinceTriggerInMilliseconds"];
    objc_opt_class();
    v31 = (void *)v8;
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setTimeSinceTriggerInMilliseconds:](v5, "setTimeSinceTriggerInMilliseconds:", [v30 unsignedLongLongValue]);
    }
    v57 = v30;
    uint64_t v32 = [v4 objectForKeyedSubscript:@"scoreBoosters"];
    objc_opt_class();
    v65 = (void *)v32;
    v33 = v15;
    if (objc_opt_isKindOfClass())
    {
      v34 = [[CDASchemaCDAScoreBoosters alloc] initWithDictionary:v32];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setScoreBoosters:v34];
    }
    v35 = [v4 objectForKeyedSubscript:@"build"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = (void *)[v35 copy];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setBuild:v36];
    }
    v56 = v35;
    v37 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = (void *)[v37 copy];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setLocale:v38];
    }
    v55 = v37;
    v58 = v24;
    v59 = v22;
    v39 = [v4 objectForKeyedSubscript:@"advertisement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[CDASchemaCDAAdvertisementData alloc] initWithDictionary:v39];
      [(CDASchemaCDAUserFeedbackParticipant *)v5 setAdvertisement:v40];
    }
    v41 = [v4 objectForKeyedSubscript:@"productTypes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = v33;
      v53 = v31;
      v54 = v28;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v42 = v41;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v72 objects:v77 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v73 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v48 = (void *)[v47 copy];
              [(CDASchemaCDAUserFeedbackParticipant *)v5 addProductTypes:v48];
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v72 objects:v77 count:16];
        }
        while (v44);
      }

      v31 = v53;
      v28 = v54;
      v33 = v52;
    }
    v49 = [v4 objectForKeyedSubscript:@"isNearMiss"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAUserFeedbackParticipant setIsNearMiss:](v5, "setIsNearMiss:", [v49 BOOLValue]);
    }
    v50 = v5;
  }
  return v5;
}

- (CDASchemaCDAUserFeedbackParticipant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAUserFeedbackParticipant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAUserFeedbackParticipant *)self dictionaryRepresentation];
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
  if (self->_advertisement)
  {
    id v4 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"advertisement"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"advertisement"];
    }
  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x100) != 0)
  {
    unsigned int v7 = [(CDASchemaCDAUserFeedbackParticipant *)self alarmState] - 1;
    if (v7 > 2) {
      uint64_t v8 = @"CDATEMPORALUTILITYSTATE_UNKNOWN";
    }
    else {
      uint64_t v8 = off_1E5EBAE10[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"alarmState"];
  }
  if (self->_build)
  {
    v9 = [(CDASchemaCDAUserFeedbackParticipant *)self build];
    uint64_t v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"build"];
  }
  if (self->_cdaId)
  {
    int v11 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];
    uint64_t v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"cdaId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"cdaId"];
    }
  }
  __int16 v14 = *(_WORD *)(&self->_isNearMiss + 1);
  if (v14)
  {
    int v15 = [(CDASchemaCDAUserFeedbackParticipant *)self decision];
    v16 = @"CDADECISION_UNKNOWN";
    if (v15 == 1) {
      v16 = @"CDADECISION_WIN";
    }
    if (v15 == 2) {
      int v17 = @"CDADECISION_LOSS";
    }
    else {
      int v17 = v16;
    }
    [v3 setObject:v17 forKeyedSubscript:@"decision"];
    __int16 v14 = *(_WORD *)(&self->_isNearMiss + 1);
  }
  if ((v14 & 0x10) != 0)
  {
    v18 = NSNumber;
    [(CDASchemaCDAUserFeedbackParticipant *)self granularBoostDecay];
    v19 = objc_msgSend(v18, "numberWithDouble:");
    [v3 setObject:v19 forKeyedSubscript:@"granularBoostDecay"];

    __int16 v14 = *(_WORD *)(&self->_isNearMiss + 1);
  }
  if ((v14 & 8) != 0)
  {
    int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAUserFeedbackParticipant granularBoostValue](self, "granularBoostValue"));
    [v3 setObject:v20 forKeyedSubscript:@"granularBoostValue"];
  }
  if (self->_halTargetSiriSpeechId)
  {
    v21 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"halTargetSiriSpeechId"];
    }
    else
    {
      int v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"halTargetSiriSpeechId"];
    }
  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x2000) != 0)
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[CDASchemaCDAUserFeedbackParticipant isNearMiss](self, "isNearMiss"));
    [v3 setObject:v24 forKeyedSubscript:@"isNearMiss"];
  }
  if (self->_locale)
  {
    objc_super v25 = [(CDASchemaCDAUserFeedbackParticipant *)self locale];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"locale"];
  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x80) != 0)
  {
    unsigned int v27 = [(CDASchemaCDAUserFeedbackParticipant *)self mediaState] - 1;
    if (v27 > 5) {
      v28 = @"MEDIAPLAYBACKSTATE_UNKNOWN";
    }
    else {
      v28 = off_1E5EBADE0[v27];
    }
    [v3 setObject:v28 forKeyedSubscript:@"mediaState"];
  }
  if (self->_productTypes)
  {
    v29 = [(CDASchemaCDAUserFeedbackParticipant *)self productTypes];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"productTypes"];
  }
  __int16 v31 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v31 & 0x40) != 0)
  {
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAUserFeedbackParticipant psdScore](self, "psdScore"));
    [v3 setObject:v32 forKeyedSubscript:@"psdScore"];

    __int16 v31 = *(_WORD *)(&self->_isNearMiss + 1);
  }
  if ((v31 & 4) != 0)
  {
    v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAUserFeedbackParticipant rawGoodnessScore](self, "rawGoodnessScore"));
    [v3 setObject:v33 forKeyedSubscript:@"rawGoodnessScore"];
  }
  if (self->_requestId)
  {
    v34 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];
    v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_roomNameHash)
  {
    v37 = [(CDASchemaCDAUserFeedbackParticipant *)self roomNameHash];
    v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"roomNameHash"];
  }
  if (self->_scoreBoosters)
  {
    v39 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];
    v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"scoreBoosters"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"scoreBoosters"];
    }
  }
  if (self->_siriSpeechId)
  {
    id v42 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];
    uint64_t v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"siriSpeechId"];
    }
    else
    {
      uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"siriSpeechId"];
    }
  }
  __int16 v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x400) != 0)
  {
    v49 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CDASchemaCDAUserFeedbackParticipant timeSinceLastWinInMilliseconds](self, "timeSinceLastWinInMilliseconds"));
    [v3 setObject:v49 forKeyedSubscript:@"timeSinceLastWinInMilliseconds"];

    __int16 v45 = *(_WORD *)(&self->_isNearMiss + 1);
    if ((v45 & 0x1000) == 0)
    {
LABEL_68:
      if ((v45 & 0x200) == 0) {
        goto LABEL_69;
      }
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x1000) == 0)
  {
    goto LABEL_68;
  }
  v50 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CDASchemaCDAUserFeedbackParticipant timeSinceTriggerInMilliseconds](self, "timeSinceTriggerInMilliseconds"));
  [v3 setObject:v50 forKeyedSubscript:@"timeSinceTriggerInMilliseconds"];

  __int16 v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x200) == 0)
  {
LABEL_69:
    if ((v45 & 0x800) == 0) {
      goto LABEL_70;
    }
    goto LABEL_80;
  }
LABEL_76:
  unsigned int v51 = [(CDASchemaCDAUserFeedbackParticipant *)self timerState] - 1;
  if (v51 > 2) {
    v52 = @"CDATEMPORALUTILITYSTATE_UNKNOWN";
  }
  else {
    v52 = off_1E5EBAE10[v51];
  }
  [v3 setObject:v52 forKeyedSubscript:@"timerState"];
  __int16 v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x800) == 0)
  {
LABEL_70:
    if ((v45 & 0x20) == 0) {
      goto LABEL_71;
    }
LABEL_84:
    unsigned int v55 = [(CDASchemaCDAUserFeedbackParticipant *)self trumpReason] - 1;
    if (v55 > 7) {
      v56 = @"CDATRUMPREASON_UNKNOWN";
    }
    else {
      v56 = off_1E5EBAE68[v55];
    }
    [v3 setObject:v56 forKeyedSubscript:@"trumpReason"];
    if ((*(_WORD *)(&self->_isNearMiss + 1) & 2) != 0) {
      goto LABEL_72;
    }
    goto LABEL_73;
  }
LABEL_80:
  unsigned int v53 = [(CDASchemaCDAUserFeedbackParticipant *)self triggerType] - 1;
  if (v53 > 7) {
    v54 = @"CDATRIGGER_UKNOWN";
  }
  else {
    v54 = off_1E5EBAE28[v53];
  }
  [v3 setObject:v54 forKeyedSubscript:@"triggerType"];
  __int16 v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x20) != 0) {
    goto LABEL_84;
  }
LABEL_71:
  if ((v45 & 2) != 0)
  {
LABEL_72:
    v46 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CDASchemaCDAUserFeedbackParticipant voiceTriggerTimeNS](self, "voiceTriggerTimeNS"));
    [v3 setObject:v46 forKeyedSubscript:@"voiceTriggerTimeNS"];
  }
LABEL_73:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v47 = v3;

  return v47;
}

- (unint64_t)hash
{
  unint64_t v32 = [(SISchemaUUID *)self->_siriSpeechId hash];
  unint64_t v31 = [(SISchemaUUID *)self->_cdaId hash];
  unint64_t v30 = [(SISchemaUUID *)self->_requestId hash];
  unint64_t v29 = [(SISchemaUUID *)self->_halTargetSiriSpeechId hash];
  __int16 v3 = *(_WORD *)(&self->_isNearMiss + 1);
  if (v3)
  {
    uint64_t v28 = 2654435761 * self->_decision;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      unint64_t v27 = 2654435761u * self->_voiceTriggerTimeNS;
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v27 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    uint64_t v26 = 2654435761 * self->_rawGoodnessScore;
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v25 = 0;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v8 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v26 = 0;
  if ((v3 & 8) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v25 = 2654435761 * self->_granularBoostValue;
  if ((v3 & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double granularBoostDecay = self->_granularBoostDecay;
  double v5 = -granularBoostDecay;
  if (granularBoostDecay >= 0.0) {
    double v5 = self->_granularBoostDecay;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_17:
  if ((v3 & 0x20) != 0)
  {
    uint64_t v24 = 2654435761 * self->_trumpReason;
    if ((v3 & 0x40) != 0)
    {
LABEL_19:
      uint64_t v23 = 2654435761 * self->_psdScore;
      if ((v3 & 0x80) != 0) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((v3 & 0x40) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v23 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_20:
    uint64_t v22 = 2654435761 * self->_mediaState;
    if ((v3 & 0x100) != 0) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v22 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_21:
    uint64_t v21 = 2654435761 * self->_alarmState;
    if ((v3 & 0x200) != 0) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v21 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_22:
    uint64_t v20 = 2654435761 * self->_timerState;
    if ((v3 & 0x400) != 0) {
      goto LABEL_23;
    }
LABEL_30:
    unint64_t v19 = 0;
    if ((v3 & 0x800) != 0) {
      goto LABEL_24;
    }
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v20 = 0;
  if ((v3 & 0x400) == 0) {
    goto LABEL_30;
  }
LABEL_23:
  unint64_t v19 = 2654435761u * self->_timeSinceLastWinInMilliseconds;
  if ((v3 & 0x800) != 0)
  {
LABEL_24:
    uint64_t v18 = 2654435761 * self->_triggerType;
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v18 = 0;
LABEL_32:
  NSUInteger v9 = [(NSString *)self->_roomNameHash hash];
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x1000) != 0) {
    unint64_t v10 = 2654435761u * self->_timeSinceTriggerInMilliseconds;
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = [(CDASchemaCDAScoreBoosters *)self->_scoreBoosters hash];
  NSUInteger v12 = [(NSString *)self->_build hash];
  NSUInteger v13 = [(NSString *)self->_locale hash];
  unint64_t v14 = [(CDASchemaCDAAdvertisementData *)self->_advertisement hash];
  uint64_t v15 = [(NSArray *)self->_productTypes hash];
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x2000) != 0) {
    uint64_t v16 = 2654435761 * self->_isNearMiss;
  }
  else {
    uint64_t v16 = 0;
  }
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v8 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_102;
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];
  long double v6 = [v4 siriSpeechId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v7 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    NSUInteger v9 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];
    unint64_t v10 = [v4 siriSpeechId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];
  long double v6 = [v4 cdaId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v12 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    unint64_t v14 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];
    uint64_t v15 = [v4 cdaId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];
  long double v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v17 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    unint64_t v19 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];
    uint64_t v20 = [v4 requestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];
  long double v6 = [v4 halTargetSiriSpeechId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v22 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];
    uint64_t v25 = [v4 halTargetSiriSpeechId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
  unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  if ((v27 & 1) != (v28 & 1)) {
    goto LABEL_102;
  }
  if (v27)
  {
    int decision = self->_decision;
    if (decision != [v4 decision]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v30 = (v27 >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1)) {
    goto LABEL_102;
  }
  if (v30)
  {
    unint64_t voiceTriggerTimeNS = self->_voiceTriggerTimeNS;
    if (voiceTriggerTimeNS != [v4 voiceTriggerTimeNS]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v32 = (v27 >> 2) & 1;
  if (v32 != ((v28 >> 2) & 1)) {
    goto LABEL_102;
  }
  if (v32)
  {
    unsigned int rawGoodnessScore = self->_rawGoodnessScore;
    if (rawGoodnessScore != [v4 rawGoodnessScore]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v34 = (v27 >> 3) & 1;
  if (v34 != ((v28 >> 3) & 1)) {
    goto LABEL_102;
  }
  if (v34)
  {
    unsigned int granularBoostValue = self->_granularBoostValue;
    if (granularBoostValue != [v4 granularBoostValue]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v36 = (v27 >> 4) & 1;
  if (v36 != ((v28 >> 4) & 1)) {
    goto LABEL_102;
  }
  if (v36)
  {
    double granularBoostDecay = self->_granularBoostDecay;
    [v4 granularBoostDecay];
    if (granularBoostDecay != v38) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v39 = (v27 >> 5) & 1;
  if (v39 != ((v28 >> 5) & 1)) {
    goto LABEL_102;
  }
  if (v39)
  {
    int trumpReason = self->_trumpReason;
    if (trumpReason != [v4 trumpReason]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v41 = (v27 >> 6) & 1;
  if (v41 != ((v28 >> 6) & 1)) {
    goto LABEL_102;
  }
  if (v41)
  {
    unsigned int psdScore = self->_psdScore;
    if (psdScore != [v4 psdScore]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v43 = (v27 >> 7) & 1;
  if (v43 != ((v28 >> 7) & 1)) {
    goto LABEL_102;
  }
  if (v43)
  {
    int mediaState = self->_mediaState;
    if (mediaState != [v4 mediaState]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v45 = (v27 >> 8) & 1;
  if (v45 != ((v28 >> 8) & 1)) {
    goto LABEL_102;
  }
  if (v45)
  {
    int alarmState = self->_alarmState;
    if (alarmState != [v4 alarmState]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v47 = (v27 >> 9) & 1;
  if (v47 != ((v28 >> 9) & 1)) {
    goto LABEL_102;
  }
  if (v47)
  {
    int timerState = self->_timerState;
    if (timerState != [v4 timerState]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v49 = (v27 >> 10) & 1;
  if (v49 != ((v28 >> 10) & 1)) {
    goto LABEL_102;
  }
  if (v49)
  {
    unint64_t timeSinceLastWinInMilliseconds = self->_timeSinceLastWinInMilliseconds;
    if (timeSinceLastWinInMilliseconds != [v4 timeSinceLastWinInMilliseconds]) {
      goto LABEL_102;
    }
    unsigned int v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    unsigned int v28 = *(unsigned __int16 *)(v4 + 169);
  }
  int v51 = (v27 >> 11) & 1;
  if (v51 != ((v28 >> 11) & 1)) {
    goto LABEL_102;
  }
  if (v51)
  {
    int triggerType = self->_triggerType;
    if (triggerType != [v4 triggerType]) {
      goto LABEL_102;
    }
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self roomNameHash];
  long double v6 = [v4 roomNameHash];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v53 = [(CDASchemaCDAUserFeedbackParticipant *)self roomNameHash];
  if (v53)
  {
    v54 = (void *)v53;
    unsigned int v55 = [(CDASchemaCDAUserFeedbackParticipant *)self roomNameHash];
    v56 = [v4 roomNameHash];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  int v58 = (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 12) & 1;
  if (v58 != ((*(unsigned __int16 *)(v4 + 169) >> 12) & 1)) {
    goto LABEL_102;
  }
  if (v58)
  {
    unint64_t timeSinceTriggerInMilliseconds = self->_timeSinceTriggerInMilliseconds;
    if (timeSinceTriggerInMilliseconds != [v4 timeSinceTriggerInMilliseconds]) {
      goto LABEL_102;
    }
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];
  long double v6 = [v4 scoreBoosters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v60 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];
  if (v60)
  {
    v61 = (void *)v60;
    v62 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];
    v63 = [v4 scoreBoosters];
    int v64 = [v62 isEqual:v63];

    if (!v64) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self build];
  long double v6 = [v4 build];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v65 = [(CDASchemaCDAUserFeedbackParticipant *)self build];
  if (v65)
  {
    v66 = (void *)v65;
    v67 = [(CDASchemaCDAUserFeedbackParticipant *)self build];
    v68 = [v4 build];
    int v69 = [v67 isEqual:v68];

    if (!v69) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self locale];
  long double v6 = [v4 locale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v70 = [(CDASchemaCDAUserFeedbackParticipant *)self locale];
  if (v70)
  {
    v71 = (void *)v70;
    long long v72 = [(CDASchemaCDAUserFeedbackParticipant *)self locale];
    long long v73 = [v4 locale];
    int v74 = [v72 isEqual:v73];

    if (!v74) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];
  long double v6 = [v4 advertisement];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_101;
  }
  uint64_t v75 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];
  if (v75)
  {
    objc_super v76 = (void *)v75;
    v77 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];
    uint64_t v78 = [v4 advertisement];
    int v79 = [v77 isEqual:v78];

    if (!v79) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self productTypes];
  long double v6 = [v4 productTypes];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_101:

    goto LABEL_102;
  }
  uint64_t v80 = [(CDASchemaCDAUserFeedbackParticipant *)self productTypes];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(CDASchemaCDAUserFeedbackParticipant *)self productTypes];
    v83 = [v4 productTypes];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_102;
    }
  }
  else
  {
  }
  int v87 = (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 13) & 1;
  if (v87 == ((*(unsigned __int16 *)(v4 + 169) >> 13) & 1))
  {
    if (!v87 || (int isNearMiss = self->_isNearMiss, isNearMiss == [v4 isNearMiss]))
    {
      BOOL v85 = 1;
      goto LABEL_103;
    }
  }
LABEL_102:
  BOOL v85 = 0;
LABEL_103:

  return v85;
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];

  if (v5)
  {
    long double v6 = [(CDASchemaCDAUserFeedbackParticipant *)self siriSpeechId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];

  if (v7)
  {
    unint64_t v8 = [(CDASchemaCDAUserFeedbackParticipant *)self cdaId];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v9 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];

  if (v9)
  {
    unint64_t v10 = [(CDASchemaCDAUserFeedbackParticipant *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];

  if (v11)
  {
    uint64_t v12 = [(CDASchemaCDAUserFeedbackParticipant *)self halTargetSiriSpeechId];
    PBDataWriterWriteSubmessage();
  }
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if (v13)
  {
    PBDataWriterWriteInt32Field();
    __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
    if ((v13 & 2) == 0)
    {
LABEL_11:
      if ((v13 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_46;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 4) == 0)
  {
LABEL_12:
    if ((v13 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 8) == 0)
  {
LABEL_13:
    if ((v13 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x10) == 0)
  {
LABEL_14:
    if ((v13 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x20) == 0)
  {
LABEL_15:
    if ((v13 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x40) == 0)
  {
LABEL_16:
    if ((v13 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x80) == 0)
  {
LABEL_17:
    if ((v13 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x100) == 0)
  {
LABEL_18:
    if ((v13 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x200) == 0)
  {
LABEL_19:
    if ((v13 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  __int16 v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x400) == 0)
  {
LABEL_20:
    if ((v13 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x800) != 0) {
LABEL_21:
  }
    PBDataWriterWriteInt32Field();
LABEL_22:
  unint64_t v14 = [(CDASchemaCDAUserFeedbackParticipant *)self roomNameHash];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x1000) != 0) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v15 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];

  if (v15)
  {
    int v16 = [(CDASchemaCDAUserFeedbackParticipant *)self scoreBoosters];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(CDASchemaCDAUserFeedbackParticipant *)self build];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  uint64_t v18 = [(CDASchemaCDAUserFeedbackParticipant *)self locale];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  unint64_t v19 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];

  if (v19)
  {
    uint64_t v20 = [(CDASchemaCDAUserFeedbackParticipant *)self advertisement];
    PBDataWriterWriteSubmessage();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v21 = self->_productTypes;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v23);
  }

  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x2000) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAUserFeedbackParticipantReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsNearMiss
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x2000u;
}

- (void)setHasIsNearMiss:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xDFFF | v3;
}

- (BOOL)hasIsNearMiss
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 13) & 1;
}

- (void)setIsNearMiss:(BOOL)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x2000u;
  self->_int isNearMiss = a3;
}

- (id)productTypesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_productTypes objectAtIndexedSubscript:a3];
}

- (unint64_t)productTypesCount
{
  return [(NSArray *)self->_productTypes count];
}

- (void)addProductTypes:(id)a3
{
  id v4 = a3;
  productTypes = self->_productTypes;
  id v8 = v4;
  if (!productTypes)
  {
    long double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_productTypes;
    self->_productTypes = v6;

    id v4 = v8;
    productTypes = self->_productTypes;
  }
  [(NSArray *)productTypes addObject:v4];
}

- (void)clearProductTypes
{
}

- (void)deleteAdvertisement
{
}

- (BOOL)hasAdvertisement
{
  return self->_advertisement != 0;
}

- (void)deleteLocale
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteBuild
{
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)deleteScoreBoosters
{
}

- (BOOL)hasScoreBoosters
{
  return self->_scoreBoosters != 0;
}

- (void)deleteTimeSinceTriggerInMilliseconds
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x1000u;
}

- (void)setHasTimeSinceTriggerInMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xEFFF | v3;
}

- (BOOL)hasTimeSinceTriggerInMilliseconds
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 12) & 1;
}

- (void)setTimeSinceTriggerInMilliseconds:(unint64_t)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x1000u;
  self->_unint64_t timeSinceTriggerInMilliseconds = a3;
}

- (void)deleteRoomNameHash
{
}

- (BOOL)hasRoomNameHash
{
  return self->_roomNameHash != 0;
}

- (void)deleteTriggerType
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x800u;
}

- (void)setHasTriggerType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xF7FF | v3;
}

- (BOOL)hasTriggerType
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 11) & 1;
}

- (void)setTriggerType:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x800u;
  self->_int triggerType = a3;
}

- (void)deleteTimeSinceLastWinInMilliseconds
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x400u;
}

- (void)setHasTimeSinceLastWinInMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFBFF | v3;
}

- (BOOL)hasTimeSinceLastWinInMilliseconds
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 10) & 1;
}

- (void)setTimeSinceLastWinInMilliseconds:(unint64_t)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x400u;
  self->_unint64_t timeSinceLastWinInMilliseconds = a3;
}

- (void)deleteTimerState
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x200u;
}

- (void)setHasTimerState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFDFF | v3;
}

- (BOOL)hasTimerState
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 9) & 1;
}

- (void)setTimerState:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x200u;
  self->_int timerState = a3;
}

- (void)deleteAlarmState
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x100u;
}

- (void)setHasAlarmState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFEFF | v3;
}

- (BOOL)hasAlarmState
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isNearMiss + 1)) & 1;
}

- (void)setAlarmState:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x100u;
  self->_int alarmState = a3;
}

- (void)deleteMediaState
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x80u;
}

- (void)setHasMediaState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFF7F | v3;
}

- (BOOL)hasMediaState
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 7) & 1;
}

- (void)setMediaState:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x80u;
  self->_int mediaState = a3;
}

- (void)deletePsdScore
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x40u;
}

- (void)setHasPsdScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFBF | v3;
}

- (BOOL)hasPsdScore
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 6) & 1;
}

- (void)setPsdScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x40u;
  self->_unsigned int psdScore = a3;
}

- (void)deleteTrumpReason
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x20u;
}

- (void)setHasTrumpReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFDF | v3;
}

- (BOOL)hasTrumpReason
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 5) & 1;
}

- (void)setTrumpReason:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x20u;
  self->_int trumpReason = a3;
}

- (void)deleteGranularBoostDecay
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x10u;
}

- (void)setHasGranularBoostDecay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFEF | v3;
}

- (BOOL)hasGranularBoostDecay
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 4) & 1;
}

- (void)setGranularBoostDecay:(double)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x10u;
  self->_double granularBoostDecay = a3;
}

- (void)deleteGranularBoostValue
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~8u;
}

- (void)setHasGranularBoostValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFF7 | v3;
}

- (BOOL)hasGranularBoostValue
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 3) & 1;
}

- (void)setGranularBoostValue:(unsigned int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 8u;
  self->_unsigned int granularBoostValue = a3;
}

- (void)deleteRawGoodnessScore
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~4u;
}

- (void)setHasRawGoodnessScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFFB | v3;
}

- (BOOL)hasRawGoodnessScore
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 2) & 1;
}

- (void)setRawGoodnessScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 4u;
  self->_unsigned int rawGoodnessScore = a3;
}

- (void)deleteVoiceTriggerTimeNS
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~2u;
}

- (void)setHasVoiceTriggerTimeNS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFFD | v3;
}

- (BOOL)hasVoiceTriggerTimeNS
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 1) & 1;
}

- (void)setVoiceTriggerTimeNS:(unint64_t)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 2u;
  self->_unint64_t voiceTriggerTimeNS = a3;
}

- (void)deleteDecision
{
  *(_WORD *)(&self->_isNearMiss + 1) &= ~1u;
}

- (void)setHasDecision:(BOOL)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFFE | a3;
}

- (BOOL)hasDecision
{
  return *(_WORD *)(&self->_isNearMiss + 1) & 1;
}

- (void)setDecision:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 1u;
  self->_int decision = a3;
}

- (void)deleteHalTargetSiriSpeechId
{
}

- (BOOL)hasHalTargetSiriSpeechId
{
  return self->_halTargetSiriSpeechId != 0;
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteCdaId
{
}

- (BOOL)hasCdaId
{
  return self->_cdaId != 0;
}

- (void)deleteSiriSpeechId
{
}

- (BOOL)hasSiriSpeechId
{
  return self->_siriSpeechId != 0;
}

@end