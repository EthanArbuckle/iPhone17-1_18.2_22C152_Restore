@interface IASchemaIAVoiceTriggerEventSummary
- (BOOL)hasAppIntentEvent;
- (BOOL)hasAppLaunchEvent;
- (BOOL)hasDeviceUnlockEvent;
- (BOOL)hasFirstPassDetectionTimestampInSec;
- (BOOL)hasFirstPassPeakScoreHS;
- (BOOL)hasFirstPassPeakScoreJS;
- (BOOL)hasHasAppIntentEvent;
- (BOOL)hasHasAppLaunchEvent;
- (BOOL)hasHasDeviceUnlockEvent;
- (BOOL)hasHasNextRejection;
- (BOOL)hasHasNextTurn;
- (BOOL)hasHasTextInputEvent;
- (BOOL)hasInvocationTypeId;
- (BOOL)hasIsNextTurnValid;
- (BOOL)hasMitigationScore;
- (BOOL)hasMitigationScoreThreshold;
- (BOOL)hasNextRejection;
- (BOOL)hasNextTurn;
- (BOOL)hasNextTurnId;
- (BOOL)hasNextTurnInvocationSource;
- (BOOL)hasRepetitionSimilarityScore;
- (BOOL)hasTdSpeakerRecognizerCombinedScore;
- (BOOL)hasTdSpeakerRecognizerCombinedThreshold;
- (BOOL)hasTextInputEvent;
- (BOOL)hasTimeDeltaToAppIntentEventInSec;
- (BOOL)hasTimeDeltaToAppLaunchInSec;
- (BOOL)hasTimeDeltaToDeviceUnlockInSec;
- (BOOL)hasTimeDeltaToNextRejectionInSec;
- (BOOL)hasTimeDeltaToNextTurnInSec;
- (BOOL)hasTimeDeltaToTextInputInSec;
- (BOOL)hasTriggerScoreHS;
- (BOOL)hasTriggerScoreHSThreshold;
- (BOOL)hasTriggerScoreJS;
- (BOOL)hasTriggerScoreJSThreshold;
- (BOOL)hasUserActionTimeThreshold;
- (BOOL)hasVoiceTriggerConfigVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNextTurnValid;
- (BOOL)readFrom:(id)a3;
- (IASchemaIAVoiceTriggerEventSummary)initWithDictionary:(id)a3;
- (IASchemaIAVoiceTriggerEventSummary)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)voiceTriggerConfigVersion;
- (SISchemaUUID)nextTurnId;
- (float)firstPassPeakScoreHS;
- (float)firstPassPeakScoreJS;
- (float)mitigationScore;
- (float)mitigationScoreThreshold;
- (float)repetitionSimilarityScore;
- (float)tdSpeakerRecognizerCombinedScore;
- (float)tdSpeakerRecognizerCombinedThreshold;
- (float)timeDeltaToAppIntentEventInSec;
- (float)timeDeltaToAppLaunchInSec;
- (float)timeDeltaToDeviceUnlockInSec;
- (float)timeDeltaToNextRejectionInSec;
- (float)timeDeltaToNextTurnInSec;
- (float)timeDeltaToTextInputInSec;
- (float)triggerScoreHS;
- (float)triggerScoreHSThreshold;
- (float)triggerScoreJS;
- (float)triggerScoreJSThreshold;
- (float)userActionTimeThreshold;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)firstPassDetectionTimestampInSec;
- (unint64_t)hash;
- (unsigned)invocationTypeId;
- (unsigned)nextTurnInvocationSource;
- (void)deleteFirstPassDetectionTimestampInSec;
- (void)deleteFirstPassPeakScoreHS;
- (void)deleteFirstPassPeakScoreJS;
- (void)deleteHasAppIntentEvent;
- (void)deleteHasAppLaunchEvent;
- (void)deleteHasDeviceUnlockEvent;
- (void)deleteHasNextRejection;
- (void)deleteHasNextTurn;
- (void)deleteHasTextInputEvent;
- (void)deleteInvocationTypeId;
- (void)deleteIsNextTurnValid;
- (void)deleteMitigationScore;
- (void)deleteMitigationScoreThreshold;
- (void)deleteNextTurnId;
- (void)deleteNextTurnInvocationSource;
- (void)deleteRepetitionSimilarityScore;
- (void)deleteTdSpeakerRecognizerCombinedScore;
- (void)deleteTdSpeakerRecognizerCombinedThreshold;
- (void)deleteTimeDeltaToAppIntentEventInSec;
- (void)deleteTimeDeltaToAppLaunchInSec;
- (void)deleteTimeDeltaToDeviceUnlockInSec;
- (void)deleteTimeDeltaToNextRejectionInSec;
- (void)deleteTimeDeltaToNextTurnInSec;
- (void)deleteTimeDeltaToTextInputInSec;
- (void)deleteTriggerScoreHS;
- (void)deleteTriggerScoreHSThreshold;
- (void)deleteTriggerScoreJS;
- (void)deleteTriggerScoreJSThreshold;
- (void)deleteUserActionTimeThreshold;
- (void)deleteVoiceTriggerConfigVersion;
- (void)setFirstPassDetectionTimestampInSec:(unint64_t)a3;
- (void)setFirstPassPeakScoreHS:(float)a3;
- (void)setFirstPassPeakScoreJS:(float)a3;
- (void)setHasAppIntentEvent:(BOOL)a3;
- (void)setHasAppLaunchEvent:(BOOL)a3;
- (void)setHasDeviceUnlockEvent:(BOOL)a3;
- (void)setHasFirstPassDetectionTimestampInSec:(BOOL)a3;
- (void)setHasFirstPassPeakScoreHS:(BOOL)a3;
- (void)setHasFirstPassPeakScoreJS:(BOOL)a3;
- (void)setHasHasAppIntentEvent:(BOOL)a3;
- (void)setHasHasAppLaunchEvent:(BOOL)a3;
- (void)setHasHasDeviceUnlockEvent:(BOOL)a3;
- (void)setHasHasNextRejection:(BOOL)a3;
- (void)setHasHasNextTurn:(BOOL)a3;
- (void)setHasHasTextInputEvent:(BOOL)a3;
- (void)setHasInvocationTypeId:(BOOL)a3;
- (void)setHasIsNextTurnValid:(BOOL)a3;
- (void)setHasMitigationScore:(BOOL)a3;
- (void)setHasMitigationScoreThreshold:(BOOL)a3;
- (void)setHasNextRejection:(BOOL)a3;
- (void)setHasNextTurn:(BOOL)a3;
- (void)setHasNextTurnId:(BOOL)a3;
- (void)setHasNextTurnInvocationSource:(BOOL)a3;
- (void)setHasRepetitionSimilarityScore:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedThreshold:(BOOL)a3;
- (void)setHasTextInputEvent:(BOOL)a3;
- (void)setHasTimeDeltaToAppIntentEventInSec:(BOOL)a3;
- (void)setHasTimeDeltaToAppLaunchInSec:(BOOL)a3;
- (void)setHasTimeDeltaToDeviceUnlockInSec:(BOOL)a3;
- (void)setHasTimeDeltaToNextRejectionInSec:(BOOL)a3;
- (void)setHasTimeDeltaToNextTurnInSec:(BOOL)a3;
- (void)setHasTimeDeltaToTextInputInSec:(BOOL)a3;
- (void)setHasTriggerScoreHS:(BOOL)a3;
- (void)setHasTriggerScoreHSThreshold:(BOOL)a3;
- (void)setHasTriggerScoreJS:(BOOL)a3;
- (void)setHasTriggerScoreJSThreshold:(BOOL)a3;
- (void)setHasUserActionTimeThreshold:(BOOL)a3;
- (void)setHasVoiceTriggerConfigVersion:(BOOL)a3;
- (void)setInvocationTypeId:(unsigned int)a3;
- (void)setIsNextTurnValid:(BOOL)a3;
- (void)setMitigationScore:(float)a3;
- (void)setMitigationScoreThreshold:(float)a3;
- (void)setNextTurnId:(id)a3;
- (void)setNextTurnInvocationSource:(unsigned int)a3;
- (void)setRepetitionSimilarityScore:(float)a3;
- (void)setTdSpeakerRecognizerCombinedScore:(float)a3;
- (void)setTdSpeakerRecognizerCombinedThreshold:(float)a3;
- (void)setTimeDeltaToAppIntentEventInSec:(float)a3;
- (void)setTimeDeltaToAppLaunchInSec:(float)a3;
- (void)setTimeDeltaToDeviceUnlockInSec:(float)a3;
- (void)setTimeDeltaToNextRejectionInSec:(float)a3;
- (void)setTimeDeltaToNextTurnInSec:(float)a3;
- (void)setTimeDeltaToTextInputInSec:(float)a3;
- (void)setTriggerScoreHS:(float)a3;
- (void)setTriggerScoreHSThreshold:(float)a3;
- (void)setTriggerScoreJS:(float)a3;
- (void)setTriggerScoreJSThreshold:(float)a3;
- (void)setUserActionTimeThreshold:(float)a3;
- (void)setVoiceTriggerConfigVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IASchemaIAVoiceTriggerEventSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IASchemaIAVoiceTriggerEventSummary;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IASchemaIAVoiceTriggerEventSummary *)self deleteNextTurnId];
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
  objc_storeStrong((id *)&self->_nextTurnId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerConfigVersion, 0);
}

- (void)setHasNextTurnId:(BOOL)a3
{
  self->_hasNextTurnId = a3;
}

- (void)setHasVoiceTriggerConfigVersion:(BOOL)a3
{
  self->_hasVoiceTriggerConfigVersion = a3;
}

- (float)timeDeltaToDeviceUnlockInSec
{
  return self->_timeDeltaToDeviceUnlockInSec;
}

- (BOOL)hasDeviceUnlockEvent
{
  return self->_hasDeviceUnlockEvent;
}

- (float)timeDeltaToTextInputInSec
{
  return self->_timeDeltaToTextInputInSec;
}

- (BOOL)hasTextInputEvent
{
  return self->_hasTextInputEvent;
}

- (float)timeDeltaToAppIntentEventInSec
{
  return self->_timeDeltaToAppIntentEventInSec;
}

- (BOOL)hasAppIntentEvent
{
  return self->_hasAppIntentEvent;
}

- (float)timeDeltaToAppLaunchInSec
{
  return self->_timeDeltaToAppLaunchInSec;
}

- (BOOL)hasAppLaunchEvent
{
  return self->_hasAppLaunchEvent;
}

- (float)timeDeltaToNextRejectionInSec
{
  return self->_timeDeltaToNextRejectionInSec;
}

- (BOOL)hasNextRejection
{
  return self->_hasNextRejection;
}

- (float)repetitionSimilarityScore
{
  return self->_repetitionSimilarityScore;
}

- (BOOL)isNextTurnValid
{
  return self->_isNextTurnValid;
}

- (unsigned)nextTurnInvocationSource
{
  return self->_nextTurnInvocationSource;
}

- (void)setNextTurnId:(id)a3
{
}

- (SISchemaUUID)nextTurnId
{
  return self->_nextTurnId;
}

- (float)timeDeltaToNextTurnInSec
{
  return self->_timeDeltaToNextTurnInSec;
}

- (BOOL)hasNextTurn
{
  return self->_hasNextTurn;
}

- (float)userActionTimeThreshold
{
  return self->_userActionTimeThreshold;
}

- (void)setVoiceTriggerConfigVersion:(id)a3
{
}

- (NSString)voiceTriggerConfigVersion
{
  return self->_voiceTriggerConfigVersion;
}

- (float)tdSpeakerRecognizerCombinedThreshold
{
  return self->_tdSpeakerRecognizerCombinedThreshold;
}

- (float)mitigationScoreThreshold
{
  return self->_mitigationScoreThreshold;
}

- (float)triggerScoreJSThreshold
{
  return self->_triggerScoreJSThreshold;
}

- (float)triggerScoreHSThreshold
{
  return self->_triggerScoreHSThreshold;
}

- (float)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (float)mitigationScore
{
  return self->_mitigationScore;
}

- (float)triggerScoreJS
{
  return self->_triggerScoreJS;
}

- (float)triggerScoreHS
{
  return self->_triggerScoreHS;
}

- (unsigned)invocationTypeId
{
  return self->_invocationTypeId;
}

- (float)firstPassPeakScoreJS
{
  return self->_firstPassPeakScoreJS;
}

- (float)firstPassPeakScoreHS
{
  return self->_firstPassPeakScoreHS;
}

- (unint64_t)firstPassDetectionTimestampInSec
{
  return self->_firstPassDetectionTimestampInSec;
}

- (IASchemaIAVoiceTriggerEventSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)IASchemaIAVoiceTriggerEventSummary;
  v5 = [(IASchemaIAVoiceTriggerEventSummary *)&v65 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"firstPassDetectionTimestampInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setFirstPassDetectionTimestampInSec:](v5, "setFirstPassDetectionTimestampInSec:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"firstPassPeakScoreHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setFirstPassPeakScoreHS:](v5, "setFirstPassPeakScoreHS:");
    }
    v8 = [v4 objectForKeyedSubscript:@"firstPassPeakScoreJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setFirstPassPeakScoreJS:](v5, "setFirstPassPeakScoreJS:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"invocationTypeId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setInvocationTypeId:](v5, "setInvocationTypeId:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"triggerScoreHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreHS:](v5, "setTriggerScoreHS:");
    }
    v50 = v6;
    v11 = [v4 objectForKeyedSubscript:@"triggerScoreJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreJS:](v5, "setTriggerScoreJS:");
    }
    v12 = [v4 objectForKeyedSubscript:@"mitigationScore"];
    objc_opt_class();
    v64 = v12;
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setMitigationScore:](v5, "setMitigationScore:");
    }
    v13 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];
    objc_opt_class();
    v63 = v13;
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTdSpeakerRecognizerCombinedScore:](v5, "setTdSpeakerRecognizerCombinedScore:");
    }
    v14 = [v4 objectForKeyedSubscript:@"triggerScoreHSThreshold"];
    objc_opt_class();
    v62 = v14;
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreHSThreshold:](v5, "setTriggerScoreHSThreshold:");
    }
    v15 = [v4 objectForKeyedSubscript:@"triggerScoreJSThreshold"];
    objc_opt_class();
    v61 = v15;
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreJSThreshold:](v5, "setTriggerScoreJSThreshold:");
    }
    v16 = [v4 objectForKeyedSubscript:@"mitigationScoreThreshold"];
    objc_opt_class();
    v60 = v16;
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setMitigationScoreThreshold:](v5, "setMitigationScoreThreshold:");
    }
    v17 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThreshold"];
    objc_opt_class();
    v59 = v17;
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTdSpeakerRecognizerCombinedThreshold:](v5, "setTdSpeakerRecognizerCombinedThreshold:");
    }
    v18 = [v4 objectForKeyedSubscript:@"voiceTriggerConfigVersion"];
    objc_opt_class();
    v58 = v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(IASchemaIAVoiceTriggerEventSummary *)v5 setVoiceTriggerConfigVersion:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"userActionTimeThreshold"];
    objc_opt_class();
    v57 = v20;
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setUserActionTimeThreshold:](v5, "setUserActionTimeThreshold:");
    }
    v21 = [v4 objectForKeyedSubscript:@"hasNextTurn"];
    objc_opt_class();
    v56 = v21;
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setHasNextTurn:](v5, "setHasNextTurn:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"timeDeltaToNextTurnInSec"];
    objc_opt_class();
    v55 = v22;
    if (objc_opt_isKindOfClass())
    {
      [v22 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToNextTurnInSec:](v5, "setTimeDeltaToNextTurnInSec:");
    }
    v47 = v9;
    uint64_t v23 = [v4 objectForKeyedSubscript:@"nextTurnId"];
    objc_opt_class();
    v54 = (void *)v23;
    if (objc_opt_isKindOfClass())
    {
      v24 = [[SISchemaUUID alloc] initWithDictionary:v23];
      [(IASchemaIAVoiceTriggerEventSummary *)v5 setNextTurnId:v24];
    }
    v25 = v7;
    v26 = [v4 objectForKeyedSubscript:@"nextTurnInvocationSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setNextTurnInvocationSource:](v5, "setNextTurnInvocationSource:", [v26 unsignedIntValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"isNextTurnValid"];
    objc_opt_class();
    v53 = v27;
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setIsNextTurnValid:](v5, "setIsNextTurnValid:", [v27 BOOLValue]);
    }
    v28 = v8;
    v29 = [v4 objectForKeyedSubscript:@"repetitionSimilarityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v29 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setRepetitionSimilarityScore:](v5, "setRepetitionSimilarityScore:");
    }
    v30 = [v4 objectForKeyedSubscript:@"hasNextRejection"];
    objc_opt_class();
    v52 = v30;
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setHasNextRejection:](v5, "setHasNextRejection:", [v30 BOOLValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"timeDeltaToNextRejectionInSec"];
    objc_opt_class();
    v51 = v31;
    if (objc_opt_isKindOfClass())
    {
      [v31 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToNextRejectionInSec:](v5, "setTimeDeltaToNextRejectionInSec:");
    }
    v45 = v11;
    v32 = [v4 objectForKeyedSubscript:@"hasAppLaunchEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setHasAppLaunchEvent:](v5, "setHasAppLaunchEvent:", [v32 BOOLValue]);
    }
    v44 = v26;
    v33 = objc_msgSend(v4, "objectForKeyedSubscript:", @"timeDeltaToAppLaunchInSec", v32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v33 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToAppLaunchInSec:](v5, "setTimeDeltaToAppLaunchInSec:");
    }
    v43 = v29;
    v34 = [v4 objectForKeyedSubscript:@"hasAppIntentEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setHasAppIntentEvent:](v5, "setHasAppIntentEvent:", [v34 BOOLValue]);
    }
    v49 = v25;
    v35 = [v4 objectForKeyedSubscript:@"timeDeltaToAppIntentEventInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v35 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToAppIntentEventInSec:](v5, "setTimeDeltaToAppIntentEventInSec:");
    }
    v48 = v28;
    v36 = [v4 objectForKeyedSubscript:@"hasTextInputEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setHasTextInputEvent:](v5, "setHasTextInputEvent:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"timeDeltaToTextInputInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v37 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToTextInputInSec:](v5, "setTimeDeltaToTextInputInSec:");
    }
    v46 = v10;
    v38 = [v4 objectForKeyedSubscript:@"hasDeviceUnlockEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IASchemaIAVoiceTriggerEventSummary setHasDeviceUnlockEvent:](v5, "setHasDeviceUnlockEvent:", [v38 BOOLValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"timeDeltaToDeviceUnlockInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v39 floatValue];
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToDeviceUnlockInSec:](v5, "setTimeDeltaToDeviceUnlockInSec:");
    }
    v40 = v5;
  }
  return v5;
}

- (IASchemaIAVoiceTriggerEventSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IASchemaIAVoiceTriggerEventSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IASchemaIAVoiceTriggerEventSummary *)self dictionaryRepresentation];
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
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if (*(unsigned char *)&has)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IASchemaIAVoiceTriggerEventSummary firstPassDetectionTimestampInSec](self, "firstPassDetectionTimestampInSec"));
    [v3 setObject:v9 forKeyedSubscript:@"firstPassDetectionTimestampInSec"];

    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self firstPassPeakScoreHS];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"firstPassPeakScoreHS"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self firstPassPeakScoreJS];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  [v3 setObject:v13 forKeyedSubscript:@"firstPassPeakScoreJS"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasAppIntentEvent](self, "hasAppIntentEvent"));
  [v3 setObject:v14 forKeyedSubscript:@"hasAppIntentEvent"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasAppLaunchEvent](self, "hasAppLaunchEvent"));
  [v3 setObject:v15 forKeyedSubscript:@"hasAppLaunchEvent"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasDeviceUnlockEvent](self, "hasDeviceUnlockEvent"));
  [v3 setObject:v16 forKeyedSubscript:@"hasDeviceUnlockEvent"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasNextRejection](self, "hasNextRejection"));
  [v3 setObject:v17 forKeyedSubscript:@"hasNextRejection"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasNextTurn](self, "hasNextTurn"));
  [v3 setObject:v18 forKeyedSubscript:@"hasNextTurn"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasTextInputEvent](self, "hasTextInputEvent"));
  [v3 setObject:v19 forKeyedSubscript:@"hasTextInputEvent"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[IASchemaIAVoiceTriggerEventSummary invocationTypeId](self, "invocationTypeId"));
  [v3 setObject:v20 forKeyedSubscript:@"invocationTypeId"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary isNextTurnValid](self, "isNextTurnValid"));
  [v3 setObject:v21 forKeyedSubscript:@"isNextTurnValid"];

  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v22 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self mitigationScore];
  uint64_t v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"mitigationScore"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_14:
    v5 = NSNumber;
    [(IASchemaIAVoiceTriggerEventSummary *)self mitigationScoreThreshold];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"mitigationScoreThreshold"];
  }
LABEL_15:
  if (self->_nextTurnId)
  {
    uint64_t v7 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"nextTurnId"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"nextTurnId"];
    }
  }
  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) != 0)
  {
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[IASchemaIAVoiceTriggerEventSummary nextTurnInvocationSource](self, "nextTurnInvocationSource"));
    [v3 setObject:v31 forKeyedSubscript:@"nextTurnInvocationSource"];

    $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
    if ((*(_DWORD *)&v25 & 0x20000) == 0)
    {
LABEL_35:
      if ((*(unsigned char *)&v25 & 0x80) == 0) {
        goto LABEL_36;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v25 & 0x20000) == 0)
  {
    goto LABEL_35;
  }
  v32 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self repetitionSimilarityScore];
  v33 = objc_msgSend(v32, "numberWithFloat:");
  [v3 setObject:v33 forKeyedSubscript:@"repetitionSimilarityScore"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x80) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v25 & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_57;
  }
LABEL_56:
  v34 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self tdSpeakerRecognizerCombinedScore];
  v35 = objc_msgSend(v34, "numberWithFloat:");
  [v3 setObject:v35 forKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x800) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v25 & 0x800000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_58;
  }
LABEL_57:
  v36 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self tdSpeakerRecognizerCombinedThreshold];
  v37 = objc_msgSend(v36, "numberWithFloat:");
  [v3 setObject:v37 forKeyedSubscript:@"tdSpeakerRecognizerCombinedThreshold"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x800000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v25 & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_59;
  }
LABEL_58:
  v38 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self timeDeltaToAppIntentEventInSec];
  v39 = objc_msgSend(v38, "numberWithFloat:");
  [v3 setObject:v39 forKeyedSubscript:@"timeDeltaToAppIntentEventInSec"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x200000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v25 & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_60;
  }
LABEL_59:
  v40 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self timeDeltaToAppLaunchInSec];
  v41 = objc_msgSend(v40, "numberWithFloat:");
  [v3 setObject:v41 forKeyedSubscript:@"timeDeltaToAppLaunchInSec"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v25 & 0x80000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_61;
  }
LABEL_60:
  v42 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self timeDeltaToDeviceUnlockInSec];
  v43 = objc_msgSend(v42, "numberWithFloat:");
  [v3 setObject:v43 forKeyedSubscript:@"timeDeltaToDeviceUnlockInSec"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x80000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v25 & 0x4000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_62;
  }
LABEL_61:
  v44 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self timeDeltaToNextRejectionInSec];
  v45 = objc_msgSend(v44, "numberWithFloat:");
  [v3 setObject:v45 forKeyedSubscript:@"timeDeltaToNextRejectionInSec"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v25 & 0x2000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_63;
  }
LABEL_62:
  v46 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self timeDeltaToNextTurnInSec];
  v47 = objc_msgSend(v46, "numberWithFloat:");
  [v3 setObject:v47 forKeyedSubscript:@"timeDeltaToNextTurnInSec"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x2000000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v25 & 0x10) == 0) {
      goto LABEL_44;
    }
    goto LABEL_64;
  }
LABEL_63:
  v48 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self timeDeltaToTextInputInSec];
  v49 = objc_msgSend(v48, "numberWithFloat:");
  [v3 setObject:v49 forKeyedSubscript:@"timeDeltaToTextInputInSec"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x10) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v25 & 0x100) == 0) {
      goto LABEL_45;
    }
    goto LABEL_65;
  }
LABEL_64:
  v50 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self triggerScoreHS];
  v51 = objc_msgSend(v50, "numberWithFloat:");
  [v3 setObject:v51 forKeyedSubscript:@"triggerScoreHS"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v25 & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_66;
  }
LABEL_65:
  v52 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self triggerScoreHSThreshold];
  v53 = objc_msgSend(v52, "numberWithFloat:");
  [v3 setObject:v53 forKeyedSubscript:@"triggerScoreHSThreshold"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x20) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v25 & 0x200) == 0) {
      goto LABEL_47;
    }
    goto LABEL_67;
  }
LABEL_66:
  v54 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self triggerScoreJS];
  v55 = objc_msgSend(v54, "numberWithFloat:");
  [v3 setObject:v55 forKeyedSubscript:@"triggerScoreJS"];

  $C40809A43C7E90BBA9878EFFED84D921 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x200) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v25 & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_67:
  v56 = NSNumber;
  [(IASchemaIAVoiceTriggerEventSummary *)self triggerScoreJSThreshold];
  v57 = objc_msgSend(v56, "numberWithFloat:");
  [v3 setObject:v57 forKeyedSubscript:@"triggerScoreJSThreshold"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_48:
    v26 = NSNumber;
    [(IASchemaIAVoiceTriggerEventSummary *)self userActionTimeThreshold];
    v27 = objc_msgSend(v26, "numberWithFloat:");
    [v3 setObject:v27 forKeyedSubscript:@"userActionTimeThreshold"];
  }
LABEL_49:
  if (self->_voiceTriggerConfigVersion)
  {
    v28 = [(IASchemaIAVoiceTriggerEventSummary *)self voiceTriggerConfigVersion];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"voiceTriggerConfigVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v119 = 2654435761u * self->_firstPassDetectionTimestampInSec;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  unint64_t v119 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
  double v5 = firstPassPeakScoreHS;
  if (firstPassPeakScoreHS < 0.0) {
    double v5 = -firstPassPeakScoreHS;
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
LABEL_11:
  if ((*(unsigned char *)&has & 4) != 0)
  {
    float firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
    double v11 = firstPassPeakScoreJS;
    if (firstPassPeakScoreJS < 0.0) {
      double v11 = -firstPassPeakScoreJS;
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
  if ((*(unsigned char *)&has & 8) != 0)
  {
    uint64_t v118 = 2654435761 * self->_invocationTypeId;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_21;
    }
LABEL_26:
    unint64_t v18 = 0;
    goto LABEL_29;
  }
  uint64_t v118 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_21:
  float triggerScoreHS = self->_triggerScoreHS;
  double v15 = triggerScoreHS;
  if (triggerScoreHS < 0.0) {
    double v15 = -triggerScoreHS;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    float triggerScoreJS = self->_triggerScoreJS;
    double v21 = triggerScoreJS;
    if (triggerScoreJS < 0.0) {
      double v21 = -triggerScoreJS;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    float mitigationScore = self->_mitigationScore;
    double v26 = mitigationScore;
    if (mitigationScore < 0.0) {
      double v26 = -mitigationScore;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    float tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    double v31 = tdSpeakerRecognizerCombinedScore;
    if (tdSpeakerRecognizerCombinedScore < 0.0) {
      double v31 = -tdSpeakerRecognizerCombinedScore;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    float triggerScoreHSThreshold = self->_triggerScoreHSThreshold;
    double v36 = triggerScoreHSThreshold;
    if (triggerScoreHSThreshold < 0.0) {
      double v36 = -triggerScoreHSThreshold;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v114 = v34;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    float triggerScoreJSThreshold = self->_triggerScoreJSThreshold;
    double v41 = triggerScoreJSThreshold;
    if (triggerScoreJSThreshold < 0.0) {
      double v41 = -triggerScoreJSThreshold;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v113 = v39;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    float mitigationScoreThreshold = self->_mitigationScoreThreshold;
    double v46 = mitigationScoreThreshold;
    if (mitigationScoreThreshold < 0.0) {
      double v46 = -mitigationScoreThreshold;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v112 = v44;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    float tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    double v51 = tdSpeakerRecognizerCombinedThreshold;
    if (tdSpeakerRecognizerCombinedThreshold < 0.0) {
      double v51 = -tdSpeakerRecognizerCombinedThreshold;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v111 = v49;
  NSUInteger v110 = [(NSString *)self->_voiceTriggerConfigVersion hash];
  $C40809A43C7E90BBA9878EFFED84D921 v54 = self->_has;
  if ((*(_WORD *)&v54 & 0x1000) != 0)
  {
    float userActionTimeThreshold = self->_userActionTimeThreshold;
    double v57 = userActionTimeThreshold;
    if (userActionTimeThreshold < 0.0) {
      double v57 = -userActionTimeThreshold;
    }
    long double v58 = floor(v57 + 0.5);
    double v59 = (v57 - v58) * 1.84467441e19;
    unint64_t v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0) {
        v55 += (unint64_t)v59;
      }
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    unint64_t v55 = 0;
  }
  if ((*(_WORD *)&v54 & 0x2000) != 0) {
    uint64_t v108 = 2654435761 * self->_hasNextTurn;
  }
  else {
    uint64_t v108 = 0;
  }
  unint64_t v109 = v55;
  unint64_t v115 = v29;
  if ((*(_WORD *)&v54 & 0x4000) != 0)
  {
    float timeDeltaToNextTurnInSec = self->_timeDeltaToNextTurnInSec;
    double v62 = timeDeltaToNextTurnInSec;
    if (timeDeltaToNextTurnInSec < 0.0) {
      double v62 = -timeDeltaToNextTurnInSec;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v60 += (unint64_t)v64;
      }
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    unint64_t v60 = 0;
  }
  unint64_t v107 = v60;
  unint64_t v106 = [(SISchemaUUID *)self->_nextTurnId hash];
  $C40809A43C7E90BBA9878EFFED84D921 v65 = self->_has;
  if ((*(_WORD *)&v65 & 0x8000) == 0)
  {
    uint64_t v105 = 0;
    if ((*(_DWORD *)&v65 & 0x10000) != 0) {
      goto LABEL_106;
    }
LABEL_112:
    uint64_t v104 = 0;
    if ((*(_DWORD *)&v65 & 0x20000) != 0) {
      goto LABEL_107;
    }
LABEL_113:
    unint64_t v70 = 0;
    goto LABEL_116;
  }
  uint64_t v105 = 2654435761 * self->_nextTurnInvocationSource;
  if ((*(_DWORD *)&v65 & 0x10000) == 0) {
    goto LABEL_112;
  }
LABEL_106:
  uint64_t v104 = 2654435761 * self->_isNextTurnValid;
  if ((*(_DWORD *)&v65 & 0x20000) == 0) {
    goto LABEL_113;
  }
LABEL_107:
  float repetitionSimilarityScore = self->_repetitionSimilarityScore;
  double v67 = repetitionSimilarityScore;
  if (repetitionSimilarityScore < 0.0) {
    double v67 = -repetitionSimilarityScore;
  }
  long double v68 = floor(v67 + 0.5);
  double v69 = (v67 - v68) * 1.84467441e19;
  unint64_t v70 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
  if (v69 >= 0.0)
  {
    if (v69 > 0.0) {
      v70 += (unint64_t)v69;
    }
  }
  else
  {
    v70 -= (unint64_t)fabs(v69);
  }
LABEL_116:
  if ((*(_DWORD *)&v65 & 0x40000) != 0)
  {
    uint64_t v103 = 2654435761 * self->_hasNextRejection;
    if ((*(_DWORD *)&v65 & 0x80000) != 0) {
      goto LABEL_118;
    }
LABEL_123:
    unint64_t v75 = 0;
    goto LABEL_126;
  }
  uint64_t v103 = 0;
  if ((*(_DWORD *)&v65 & 0x80000) == 0) {
    goto LABEL_123;
  }
LABEL_118:
  float timeDeltaToNextRejectionInSec = self->_timeDeltaToNextRejectionInSec;
  double v72 = timeDeltaToNextRejectionInSec;
  if (timeDeltaToNextRejectionInSec < 0.0) {
    double v72 = -timeDeltaToNextRejectionInSec;
  }
  long double v73 = floor(v72 + 0.5);
  double v74 = (v72 - v73) * 1.84467441e19;
  unint64_t v75 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
  if (v74 >= 0.0)
  {
    if (v74 > 0.0) {
      v75 += (unint64_t)v74;
    }
  }
  else
  {
    v75 -= (unint64_t)fabs(v74);
  }
LABEL_126:
  if ((*(_DWORD *)&v65 & 0x100000) != 0)
  {
    uint64_t v102 = 2654435761 * self->_hasAppLaunchEvent;
    if ((*(_DWORD *)&v65 & 0x200000) != 0) {
      goto LABEL_128;
    }
LABEL_133:
    unint64_t v80 = 0;
    goto LABEL_136;
  }
  uint64_t v102 = 0;
  if ((*(_DWORD *)&v65 & 0x200000) == 0) {
    goto LABEL_133;
  }
LABEL_128:
  float timeDeltaToAppLaunchInSec = self->_timeDeltaToAppLaunchInSec;
  double v77 = timeDeltaToAppLaunchInSec;
  if (timeDeltaToAppLaunchInSec < 0.0) {
    double v77 = -timeDeltaToAppLaunchInSec;
  }
  long double v78 = floor(v77 + 0.5);
  double v79 = (v77 - v78) * 1.84467441e19;
  unint64_t v80 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
  if (v79 >= 0.0)
  {
    if (v79 > 0.0) {
      v80 += (unint64_t)v79;
    }
  }
  else
  {
    v80 -= (unint64_t)fabs(v79);
  }
LABEL_136:
  unint64_t v117 = v9;
  unint64_t v101 = v80;
  if ((*(_DWORD *)&v65 & 0x400000) != 0) {
    uint64_t v100 = 2654435761 * self->_hasAppIntentEvent;
  }
  else {
    uint64_t v100 = 0;
  }
  unint64_t v116 = v8;
  if ((*(_DWORD *)&v65 & 0x800000) != 0)
  {
    float timeDeltaToAppIntentEventInSec = self->_timeDeltaToAppIntentEventInSec;
    double v83 = timeDeltaToAppIntentEventInSec;
    if (timeDeltaToAppIntentEventInSec < 0.0) {
      double v83 = -timeDeltaToAppIntentEventInSec;
    }
    long double v84 = floor(v83 + 0.5);
    double v85 = (v83 - v84) * 1.84467441e19;
    unint64_t v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0) {
        v81 += (unint64_t)v85;
      }
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    unint64_t v81 = 0;
  }
  if ((*(_DWORD *)&v65 & 0x1000000) != 0)
  {
    uint64_t v99 = 2654435761 * self->_hasTextInputEvent;
    if ((*(_DWORD *)&v65 & 0x2000000) != 0) {
      goto LABEL_149;
    }
LABEL_154:
    unint64_t v90 = 0;
    goto LABEL_157;
  }
  uint64_t v99 = 0;
  if ((*(_DWORD *)&v65 & 0x2000000) == 0) {
    goto LABEL_154;
  }
LABEL_149:
  float timeDeltaToTextInputInSec = self->_timeDeltaToTextInputInSec;
  double v87 = timeDeltaToTextInputInSec;
  if (timeDeltaToTextInputInSec < 0.0) {
    double v87 = -timeDeltaToTextInputInSec;
  }
  long double v88 = floor(v87 + 0.5);
  double v89 = (v87 - v88) * 1.84467441e19;
  unint64_t v90 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
  if (v89 >= 0.0)
  {
    if (v89 > 0.0) {
      v90 += (unint64_t)v89;
    }
  }
  else
  {
    v90 -= (unint64_t)fabs(v89);
  }
LABEL_157:
  if ((*(_DWORD *)&v65 & 0x4000000) == 0)
  {
    uint64_t v91 = 0;
    if ((*(_DWORD *)&v65 & 0x8000000) != 0) {
      goto LABEL_159;
    }
LABEL_164:
    unint64_t v96 = 0;
    goto LABEL_165;
  }
  uint64_t v91 = 2654435761 * self->_hasDeviceUnlockEvent;
  if ((*(_DWORD *)&v65 & 0x8000000) == 0) {
    goto LABEL_164;
  }
LABEL_159:
  float timeDeltaToDeviceUnlockInSec = self->_timeDeltaToDeviceUnlockInSec;
  double v93 = timeDeltaToDeviceUnlockInSec;
  if (timeDeltaToDeviceUnlockInSec < 0.0) {
    double v93 = -timeDeltaToDeviceUnlockInSec;
  }
  long double v94 = floor(v93 + 0.5);
  double v95 = (v93 - v94) * 1.84467441e19;
  unint64_t v96 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
  if (v95 < 0.0)
  {
    v96 -= (unint64_t)fabs(v95);
LABEL_165:
    unint64_t v97 = v115;
    return v116 ^ v119 ^ v117 ^ v118 ^ v18 ^ v19 ^ v24 ^ v97 ^ v114 ^ v113 ^ v112 ^ v111 ^ v109 ^ v108 ^ v107 ^ v110 ^ v106 ^ v105 ^ v104 ^ v70 ^ v103 ^ v75 ^ v102 ^ v101 ^ v100 ^ v81 ^ v99 ^ v90 ^ v91 ^ v96;
  }
  unint64_t v97 = v115;
  if (v95 > 0.0) {
    v96 += (unint64_t)v95;
  }
  return v116 ^ v119 ^ v117 ^ v118 ^ v18 ^ v19 ^ v24 ^ v97 ^ v114 ^ v113 ^ v112 ^ v111 ^ v109 ^ v108 ^ v107 ^ v110 ^ v106 ^ v105 ^ v104 ^ v70 ^ v103 ^ v75 ^ v102 ^ v101 ^ v100 ^ v81 ^ v99 ^ v90 ^ v91 ^ v96;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_70;
  }
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  unsigned int v6 = v4[37];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_70;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t firstPassDetectionTimestampInSec = self->_firstPassDetectionTimestampInSec;
    if (firstPassDetectionTimestampInSec != [v4 firstPassDetectionTimestampInSec]) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_70;
  }
  if (v8)
  {
    float firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
    [v4 firstPassPeakScoreHS];
    if (firstPassPeakScoreHS != v10) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_70;
  }
  if (v11)
  {
    float firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
    [v4 firstPassPeakScoreJS];
    if (firstPassPeakScoreJS != v13) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v14 = (*(unsigned int *)&has >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1)) {
    goto LABEL_70;
  }
  if (v14)
  {
    unsigned int invocationTypeId = self->_invocationTypeId;
    if (invocationTypeId != [v4 invocationTypeId]) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v16 = (*(unsigned int *)&has >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1)) {
    goto LABEL_70;
  }
  if (v16)
  {
    float triggerScoreHS = self->_triggerScoreHS;
    [v4 triggerScoreHS];
    if (triggerScoreHS != v18) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1)) {
    goto LABEL_70;
  }
  if (v19)
  {
    float triggerScoreJS = self->_triggerScoreJS;
    [v4 triggerScoreJS];
    if (triggerScoreJS != v21) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v22 = (*(unsigned int *)&has >> 6) & 1;
  if (v22 != ((v6 >> 6) & 1)) {
    goto LABEL_70;
  }
  if (v22)
  {
    float mitigationScore = self->_mitigationScore;
    [v4 mitigationScore];
    if (mitigationScore != v24) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v25 = (*(unsigned int *)&has >> 7) & 1;
  if (v25 != ((v6 >> 7) & 1)) {
    goto LABEL_70;
  }
  if (v25)
  {
    float tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    [v4 tdSpeakerRecognizerCombinedScore];
    if (tdSpeakerRecognizerCombinedScore != v27) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v28 = (*(unsigned int *)&has >> 8) & 1;
  if (v28 != ((v6 >> 8) & 1)) {
    goto LABEL_70;
  }
  if (v28)
  {
    float triggerScoreHSThreshold = self->_triggerScoreHSThreshold;
    [v4 triggerScoreHSThreshold];
    if (triggerScoreHSThreshold != v30) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v31 = (*(unsigned int *)&has >> 9) & 1;
  if (v31 != ((v6 >> 9) & 1)) {
    goto LABEL_70;
  }
  if (v31)
  {
    float triggerScoreJSThreshold = self->_triggerScoreJSThreshold;
    [v4 triggerScoreJSThreshold];
    if (triggerScoreJSThreshold != v33) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v34 = (*(unsigned int *)&has >> 10) & 1;
  if (v34 != ((v6 >> 10) & 1)) {
    goto LABEL_70;
  }
  if (v34)
  {
    float mitigationScoreThreshold = self->_mitigationScoreThreshold;
    [v4 mitigationScoreThreshold];
    if (mitigationScoreThreshold != v36) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    unsigned int v6 = v4[37];
  }
  int v37 = (*(unsigned int *)&has >> 11) & 1;
  if (v37 != ((v6 >> 11) & 1)) {
    goto LABEL_70;
  }
  if (v37)
  {
    float tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    [v4 tdSpeakerRecognizerCombinedThreshold];
    if (tdSpeakerRecognizerCombinedThreshold != v39) {
      goto LABEL_70;
    }
  }
  v40 = [(IASchemaIAVoiceTriggerEventSummary *)self voiceTriggerConfigVersion];
  double v41 = [v4 voiceTriggerConfigVersion];
  if ((v40 == 0) == (v41 != 0)) {
    goto LABEL_69;
  }
  uint64_t v42 = [(IASchemaIAVoiceTriggerEventSummary *)self voiceTriggerConfigVersion];
  if (v42)
  {
    double v43 = (void *)v42;
    unint64_t v44 = [(IASchemaIAVoiceTriggerEventSummary *)self voiceTriggerConfigVersion];
    v45 = [v4 voiceTriggerConfigVersion];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_70;
    }
  }
  else
  {
  }
  $C40809A43C7E90BBA9878EFFED84D921 v47 = self->_has;
  int v48 = (*(unsigned int *)&v47 >> 12) & 1;
  unsigned int v49 = v4[37];
  if (v48 != ((v49 >> 12) & 1)) {
    goto LABEL_70;
  }
  if (v48)
  {
    float userActionTimeThreshold = self->_userActionTimeThreshold;
    [v4 userActionTimeThreshold];
    if (userActionTimeThreshold != v51) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 v47 = self->_has;
    unsigned int v49 = v4[37];
  }
  int v52 = (*(unsigned int *)&v47 >> 13) & 1;
  if (v52 != ((v49 >> 13) & 1)) {
    goto LABEL_70;
  }
  if (v52)
  {
    int hasNextTurn = self->_hasNextTurn;
    if (hasNextTurn != [v4 hasNextTurn]) {
      goto LABEL_70;
    }
    $C40809A43C7E90BBA9878EFFED84D921 v47 = self->_has;
    unsigned int v49 = v4[37];
  }
  int v54 = (*(unsigned int *)&v47 >> 14) & 1;
  if (v54 != ((v49 >> 14) & 1)) {
    goto LABEL_70;
  }
  if (v54)
  {
    float timeDeltaToNextTurnInSec = self->_timeDeltaToNextTurnInSec;
    [v4 timeDeltaToNextTurnInSec];
    if (timeDeltaToNextTurnInSec != v56) {
      goto LABEL_70;
    }
  }
  v40 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];
  double v41 = [v4 nextTurnId];
  if ((v40 == 0) == (v41 != 0))
  {
LABEL_69:

    goto LABEL_70;
  }
  uint64_t v57 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];
  if (v57)
  {
    long double v58 = (void *)v57;
    double v59 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];
    unint64_t v60 = [v4 nextTurnId];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_70;
    }
  }
  else
  {
  }
  $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
  int v65 = (*(unsigned int *)&v64 >> 15) & 1;
  unsigned int v66 = v4[37];
  if (v65 == ((v66 >> 15) & 1))
  {
    if (v65)
    {
      unsigned int nextTurnInvocationSource = self->_nextTurnInvocationSource;
      if (nextTurnInvocationSource != [v4 nextTurnInvocationSource]) {
        goto LABEL_70;
      }
      $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
      unsigned int v66 = v4[37];
    }
    int v68 = HIWORD(*(unsigned int *)&v64) & 1;
    if (v68 == (HIWORD(v66) & 1))
    {
      if (v68)
      {
        int isNextTurnValid = self->_isNextTurnValid;
        if (isNextTurnValid != [v4 isNextTurnValid]) {
          goto LABEL_70;
        }
        $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
        unsigned int v66 = v4[37];
      }
      int v70 = (*(unsigned int *)&v64 >> 17) & 1;
      if (v70 == ((v66 >> 17) & 1))
      {
        if (v70)
        {
          float repetitionSimilarityScore = self->_repetitionSimilarityScore;
          [v4 repetitionSimilarityScore];
          if (repetitionSimilarityScore != v72) {
            goto LABEL_70;
          }
          $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
          unsigned int v66 = v4[37];
        }
        int v73 = (*(unsigned int *)&v64 >> 18) & 1;
        if (v73 == ((v66 >> 18) & 1))
        {
          if (v73)
          {
            int hasNextRejection = self->_hasNextRejection;
            if (hasNextRejection != [v4 hasNextRejection]) {
              goto LABEL_70;
            }
            $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
            unsigned int v66 = v4[37];
          }
          int v75 = (*(unsigned int *)&v64 >> 19) & 1;
          if (v75 == ((v66 >> 19) & 1))
          {
            if (v75)
            {
              float timeDeltaToNextRejectionInSec = self->_timeDeltaToNextRejectionInSec;
              [v4 timeDeltaToNextRejectionInSec];
              if (timeDeltaToNextRejectionInSec != v77) {
                goto LABEL_70;
              }
              $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
              unsigned int v66 = v4[37];
            }
            int v78 = (*(unsigned int *)&v64 >> 20) & 1;
            if (v78 == ((v66 >> 20) & 1))
            {
              if (v78)
              {
                int hasAppLaunchEvent = self->_hasAppLaunchEvent;
                if (hasAppLaunchEvent != [v4 hasAppLaunchEvent]) {
                  goto LABEL_70;
                }
                $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                unsigned int v66 = v4[37];
              }
              int v80 = (*(unsigned int *)&v64 >> 21) & 1;
              if (v80 == ((v66 >> 21) & 1))
              {
                if (v80)
                {
                  float timeDeltaToAppLaunchInSec = self->_timeDeltaToAppLaunchInSec;
                  [v4 timeDeltaToAppLaunchInSec];
                  if (timeDeltaToAppLaunchInSec != v82) {
                    goto LABEL_70;
                  }
                  $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                  unsigned int v66 = v4[37];
                }
                int v83 = (*(unsigned int *)&v64 >> 22) & 1;
                if (v83 == ((v66 >> 22) & 1))
                {
                  if (v83)
                  {
                    int hasAppIntentEvent = self->_hasAppIntentEvent;
                    if (hasAppIntentEvent != [v4 hasAppIntentEvent]) {
                      goto LABEL_70;
                    }
                    $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                    unsigned int v66 = v4[37];
                  }
                  int v85 = (*(unsigned int *)&v64 >> 23) & 1;
                  if (v85 == ((v66 >> 23) & 1))
                  {
                    if (v85)
                    {
                      float timeDeltaToAppIntentEventInSec = self->_timeDeltaToAppIntentEventInSec;
                      [v4 timeDeltaToAppIntentEventInSec];
                      if (timeDeltaToAppIntentEventInSec != v87) {
                        goto LABEL_70;
                      }
                      $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                      unsigned int v66 = v4[37];
                    }
                    int v88 = HIBYTE(*(unsigned int *)&v64) & 1;
                    if (v88 == (HIBYTE(v66) & 1))
                    {
                      if (v88)
                      {
                        int hasTextInputEvent = self->_hasTextInputEvent;
                        if (hasTextInputEvent != [v4 hasTextInputEvent]) {
                          goto LABEL_70;
                        }
                        $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                        unsigned int v66 = v4[37];
                      }
                      int v90 = (*(unsigned int *)&v64 >> 25) & 1;
                      if (v90 == ((v66 >> 25) & 1))
                      {
                        if (v90)
                        {
                          float timeDeltaToTextInputInSec = self->_timeDeltaToTextInputInSec;
                          [v4 timeDeltaToTextInputInSec];
                          if (timeDeltaToTextInputInSec != v92) {
                            goto LABEL_70;
                          }
                          $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                          unsigned int v66 = v4[37];
                        }
                        int v93 = (*(unsigned int *)&v64 >> 26) & 1;
                        if (v93 == ((v66 >> 26) & 1))
                        {
                          if (v93)
                          {
                            int hasDeviceUnlockEvent = self->_hasDeviceUnlockEvent;
                            if (hasDeviceUnlockEvent != [v4 hasDeviceUnlockEvent]) {
                              goto LABEL_70;
                            }
                            $C40809A43C7E90BBA9878EFFED84D921 v64 = self->_has;
                            unsigned int v66 = v4[37];
                          }
                          int v95 = (*(unsigned int *)&v64 >> 27) & 1;
                          if (v95 == ((v66 >> 27) & 1))
                          {
                            if (!v95
                              || (float timeDeltaToDeviceUnlockInSec = self->_timeDeltaToDeviceUnlockInSec,
                                  [v4 timeDeltaToDeviceUnlockInSec],
                                  timeDeltaToDeviceUnlockInSec == v97))
                            {
                              BOOL v62 = 1;
                              goto LABEL_71;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_70:
  BOOL v62 = 0;
LABEL_71:

  return v62;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_49:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_13:
  }
    PBDataWriterWriteFloatField();
LABEL_14:
  double v5 = [(IASchemaIAVoiceTriggerEventSummary *)self voiceTriggerConfigVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  $C40809A43C7E90BBA9878EFFED84D921 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteFloatField();
    $C40809A43C7E90BBA9878EFFED84D921 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v6 & 0x4000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteFloatField();
LABEL_20:
  double v7 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];

  if (v7)
  {
    int v8 = [(IASchemaIAVoiceTriggerEventSummary *)self nextTurnId];
    PBDataWriterWriteSubmessage();
  }
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
    {
LABEL_24:
      if ((*(_DWORD *)&v9 & 0x20000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteBOOLField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x40000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v9 & 0x4000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteFloatField();
  $C40809A43C7E90BBA9878EFFED84D921 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v9 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0) {
LABEL_35:
  }
    PBDataWriterWriteFloatField();
LABEL_36:
}

- (BOOL)readFrom:(id)a3
{
  return IASchemaIAVoiceTriggerEventSummaryReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteTimeDeltaToDeviceUnlockInSec
{
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setHasTimeDeltaToDeviceUnlockInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTimeDeltaToDeviceUnlockInSec
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setTimeDeltaToDeviceUnlockInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_float timeDeltaToDeviceUnlockInSec = a3;
}

- (void)deleteHasDeviceUnlockEvent
{
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setHasHasDeviceUnlockEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasHasDeviceUnlockEvent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasDeviceUnlockEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_int hasDeviceUnlockEvent = a3;
}

- (void)deleteTimeDeltaToTextInputInSec
{
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setHasTimeDeltaToTextInputInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTimeDeltaToTextInputInSec
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTimeDeltaToTextInputInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_float timeDeltaToTextInputInSec = a3;
}

- (void)deleteHasTextInputEvent
{
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setHasHasTextInputEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasHasTextInputEvent
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasTextInputEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_int hasTextInputEvent = a3;
}

- (void)deleteTimeDeltaToAppIntentEventInSec
{
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasTimeDeltaToAppIntentEventInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTimeDeltaToAppIntentEventInSec
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTimeDeltaToAppIntentEventInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_float timeDeltaToAppIntentEventInSec = a3;
}

- (void)deleteHasAppIntentEvent
{
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setHasHasAppIntentEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasHasAppIntentEvent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasAppIntentEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_int hasAppIntentEvent = a3;
}

- (void)deleteTimeDeltaToAppLaunchInSec
{
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasTimeDeltaToAppLaunchInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTimeDeltaToAppLaunchInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTimeDeltaToAppLaunchInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_float timeDeltaToAppLaunchInSec = a3;
}

- (void)deleteHasAppLaunchEvent
{
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setHasHasAppLaunchEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasHasAppLaunchEvent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasAppLaunchEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_int hasAppLaunchEvent = a3;
}

- (void)deleteTimeDeltaToNextRejectionInSec
{
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasTimeDeltaToNextRejectionInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTimeDeltaToNextRejectionInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTimeDeltaToNextRejectionInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_float timeDeltaToNextRejectionInSec = a3;
}

- (void)deleteHasNextRejection
{
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setHasHasNextRejection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasHasNextRejection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasNextRejection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_int hasNextRejection = a3;
}

- (void)deleteRepetitionSimilarityScore
{
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasRepetitionSimilarityScore:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRepetitionSimilarityScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRepetitionSimilarityScore:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_float repetitionSimilarityScore = a3;
}

- (void)deleteIsNextTurnValid
{
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setHasIsNextTurnValid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsNextTurnValid
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsNextTurnValid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_int isNextTurnValid = a3;
}

- (void)deleteNextTurnInvocationSource
{
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setHasNextTurnInvocationSource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNextTurnInvocationSource
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNextTurnInvocationSource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_unsigned int nextTurnInvocationSource = a3;
}

- (void)deleteNextTurnId
{
}

- (BOOL)hasNextTurnId
{
  return self->_nextTurnId != 0;
}

- (void)deleteTimeDeltaToNextTurnInSec
{
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setHasTimeDeltaToNextTurnInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimeDeltaToNextTurnInSec
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTimeDeltaToNextTurnInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_float timeDeltaToNextTurnInSec = a3;
}

- (void)deleteHasNextTurn
{
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setHasHasNextTurn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasHasNextTurn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasNextTurn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_int hasNextTurn = a3;
}

- (void)deleteUserActionTimeThreshold
{
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasUserActionTimeThreshold:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasUserActionTimeThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setUserActionTimeThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_float userActionTimeThreshold = a3;
}

- (void)deleteVoiceTriggerConfigVersion
{
}

- (BOOL)hasVoiceTriggerConfigVersion
{
  return self->_voiceTriggerConfigVersion != 0;
}

- (void)deleteTdSpeakerRecognizerCombinedThreshold
{
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setHasTdSpeakerRecognizerCombinedThreshold:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTdSpeakerRecognizerCombinedThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTdSpeakerRecognizerCombinedThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_float tdSpeakerRecognizerCombinedThreshold = a3;
}

- (void)deleteMitigationScoreThreshold
{
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setHasMitigationScoreThreshold:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMitigationScoreThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMitigationScoreThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_float mitigationScoreThreshold = a3;
}

- (void)deleteTriggerScoreJSThreshold
{
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setHasTriggerScoreJSThreshold:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTriggerScoreJSThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTriggerScoreJSThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_float triggerScoreJSThreshold = a3;
}

- (void)deleteTriggerScoreHSThreshold
{
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setHasTriggerScoreHSThreshold:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTriggerScoreHSThreshold
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTriggerScoreHSThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_float triggerScoreHSThreshold = a3;
}

- (void)deleteTdSpeakerRecognizerCombinedScore
{
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTdSpeakerRecognizerCombinedScore:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_float tdSpeakerRecognizerCombinedScore = a3;
}

- (void)deleteMitigationScore
{
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasMitigationScore:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMitigationScore
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMitigationScore:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_float mitigationScore = a3;
}

- (void)deleteTriggerScoreJS
{
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setHasTriggerScoreJS:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTriggerScoreJS
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTriggerScoreJS:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_float triggerScoreJS = a3;
}

- (void)deleteTriggerScoreHS
{
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setHasTriggerScoreHS:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTriggerScoreHS
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTriggerScoreHS:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_float triggerScoreHS = a3;
}

- (void)deleteInvocationTypeId
{
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setHasInvocationTypeId:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasInvocationTypeId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInvocationTypeId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_unsigned int invocationTypeId = a3;
}

- (void)deleteFirstPassPeakScoreJS
{
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHasFirstPassPeakScoreJS:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFirstPassPeakScoreJS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFirstPassPeakScoreJS:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_float firstPassPeakScoreJS = a3;
}

- (void)deleteFirstPassPeakScoreHS
{
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHasFirstPassPeakScoreHS:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasFirstPassPeakScoreHS
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFirstPassPeakScoreHS:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_float firstPassPeakScoreHS = a3;
}

- (void)deleteFirstPassDetectionTimestampInSec
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasFirstPassDetectionTimestampInSec:(BOOL)a3
{
  self->_$C40809A43C7E90BBA9878EFFED84D921 has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasFirstPassDetectionTimestampInSec
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setFirstPassDetectionTimestampInSec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_unint64_t firstPassDetectionTimestampInSec = a3;
}

@end