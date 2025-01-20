@interface MHSchemaMHClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAcousticFalseTriggerMitigationEvaluationContext;
- (BOOL)hasAdblockerContext;
- (BOOL)hasApplicationPlaybackAttempted;
- (BOOL)hasAsrAudioConfigureStarted;
- (BOOL)hasAssistantDaemonAudioBluetoothInfo;
- (BOOL)hasAssistantDaemonAudioConfigureContext;
- (BOOL)hasAssistantDaemonAudioFetchRouteContext;
- (BOOL)hasAssistantDaemonAudioInitContext;
- (BOOL)hasAssistantDaemonAudioLateBufferDetected;
- (BOOL)hasAssistantDaemonAudioPrepareContext;
- (BOOL)hasAssistantDaemonAudioPrewarmContext;
- (BOOL)hasAssistantDaemonAudioRecordingContext;
- (BOOL)hasAssistantDaemonAudioRecordingFailureInsufficientPriority;
- (BOOL)hasAssistantDaemonAudioRecordingFirstBufferContext;
- (BOOL)hasAssistantDaemonAudioRecordingInterruptionContext;
- (BOOL)hasAssistantDaemonAudioRecordingInterruptionStartedTier1;
- (BOOL)hasAssistantDaemonAudioRecordingLastBufferContext;
- (BOOL)hasAssistantDaemonAudioRecordingMissedBufferDetected;
- (BOOL)hasAssistantDaemonAudioSessionSetActiveContext;
- (BOOL)hasAssistantDaemonAudioSessionSetInactiveContext;
- (BOOL)hasAssistantDaemonAudioStartRecordingContext;
- (BOOL)hasAssistantDaemonAudioStopRecordingContext;
- (BOOL)hasAssistantDaemonAudioTwoShotTransitionContext;
- (BOOL)hasAttendingContext;
- (BOOL)hasAudioDucked;
- (BOOL)hasAudioRecordingFailed;
- (BOOL)hasCarPlayLangaugeMismatched;
- (BOOL)hasCoreSpeechPreprocessorCompleted;
- (BOOL)hasCrownPressed;
- (BOOL)hasDarwinConnectedDeviceWakeContext;
- (BOOL)hasEndpointDelayContext;
- (BOOL)hasEndpointDetected;
- (BOOL)hasEndpointLatencyInfoReported;
- (BOOL)hasEndpointerAccessibleContext;
- (BOOL)hasEndpointerUsed;
- (BOOL)hasEventMetadata;
- (BOOL)hasFinalMitigationRecommendation;
- (BOOL)hasLatticeFalseTriggerMitigationEvaluationContext;
- (BOOL)hasMhId;
- (BOOL)hasOdldFalseTriggerMitigated;
- (BOOL)hasOnDeviceEndpointerContext;
- (BOOL)hasRtsFalseRejectDetected;
- (BOOL)hasRtsFirstPassPolicyTriggered;
- (BOOL)hasRtsSecondPassPolicyDecisionMade;
- (BOOL)hasRtsTriggered;
- (BOOL)hasSensorControlStatusReported;
- (BOOL)hasServerEndpointerContext;
- (BOOL)hasSiriDirectedSpeechDetectionFailed;
- (BOOL)hasSiriLaunchRequestContext;
- (BOOL)hasSpeakerFalseTriggerMitigated;
- (BOOL)hasSpeechDetectorContext;
- (BOOL)hasSpeechStopDetected;
- (BOOL)hasStoppedListeningForSpeechContinuation;
- (BOOL)hasTrpCreated;
- (BOOL)hasUnintendedResponseSuppressionExecutionContext;
- (BOOL)hasUserEngagementModelContext;
- (BOOL)hasUserSpeakingContext;
- (BOOL)hasVoiceProfileICloudSyncFinished;
- (BOOL)hasVoiceProfileOnboarded;
- (BOOL)hasVoiceTriggerContext;
- (BOOL)hasVoiceTriggerRePrompted;
- (BOOL)hasVoiceTriggerRejectDetected;
- (BOOL)hasVoiceTriggerTwoShotDetected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHASRAudioConfigureStarted)asrAudioConfigureStarted;
- (MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext)acousticFalseTriggerMitigationEvaluationContext;
- (MHSchemaMHApplicationPlaybackAttempted)applicationPlaybackAttempted;
- (MHSchemaMHAssistantDaemonAudioBluetoothInfo)assistantDaemonAudioBluetoothInfo;
- (MHSchemaMHAssistantDaemonAudioConfigureContext)assistantDaemonAudioConfigureContext;
- (MHSchemaMHAssistantDaemonAudioFetchRouteContext)assistantDaemonAudioFetchRouteContext;
- (MHSchemaMHAssistantDaemonAudioInitContext)assistantDaemonAudioInitContext;
- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)assistantDaemonAudioLateBufferDetected;
- (MHSchemaMHAssistantDaemonAudioPrepareContext)assistantDaemonAudioPrepareContext;
- (MHSchemaMHAssistantDaemonAudioPrewarmContext)assistantDaemonAudioPrewarmContext;
- (MHSchemaMHAssistantDaemonAudioRecordingContext)assistantDaemonAudioRecordingContext;
- (MHSchemaMHAssistantDaemonAudioRecordingFailed)audioRecordingFailed;
- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)assistantDaemonAudioRecordingFailureInsufficientPriority;
- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext)assistantDaemonAudioRecordingFirstBufferContext;
- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext)assistantDaemonAudioRecordingInterruptionContext;
- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)assistantDaemonAudioRecordingInterruptionStartedTier1;
- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext)assistantDaemonAudioRecordingLastBufferContext;
- (MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected)assistantDaemonAudioRecordingMissedBufferDetected;
- (MHSchemaMHAssistantDaemonAudioSessionSetActiveContext)assistantDaemonAudioSessionSetActiveContext;
- (MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext)assistantDaemonAudioSessionSetInactiveContext;
- (MHSchemaMHAssistantDaemonAudioStartRecordingContext)assistantDaemonAudioStartRecordingContext;
- (MHSchemaMHAssistantDaemonAudioStopRecordingContext)assistantDaemonAudioStopRecordingContext;
- (MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext)assistantDaemonAudioTwoShotTransitionContext;
- (MHSchemaMHAttendingContext)attendingContext;
- (MHSchemaMHAudioDucked)audioDucked;
- (MHSchemaMHCarplayLanguageMismatch)carPlayLangaugeMismatched;
- (MHSchemaMHClientEvent)initWithDictionary:(id)a3;
- (MHSchemaMHClientEvent)initWithJSON:(id)a3;
- (MHSchemaMHClientEventMetadata)eventMetadata;
- (MHSchemaMHCoreSpeechPreprocessorCompleted)coreSpeechPreprocessorCompleted;
- (MHSchemaMHCrownPressed)crownPressed;
- (MHSchemaMHDarwinConnectedDeviceWakeContext)darwinConnectedDeviceWakeContext;
- (MHSchemaMHEndpointDelayContext)endpointDelayContext;
- (MHSchemaMHEndpointDetected)endpointDetected;
- (MHSchemaMHEndpointLatencyInfoReported)endpointLatencyInfoReported;
- (MHSchemaMHEndpointerAccessibleContext)endpointerAccessibleContext;
- (MHSchemaMHEndpointerUsed)endpointerUsed;
- (MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext)latticeFalseTriggerMitigationEvaluationContext;
- (MHSchemaMHMitigationDecisionRecommended)finalMitigationRecommendation;
- (MHSchemaMHOdldFalseTriggerMitigated)odldFalseTriggerMitigated;
- (MHSchemaMHOnDeviceEndpointerContext)onDeviceEndpointerContext;
- (MHSchemaMHRTSFalseRejectDetected)rtsFalseRejectDetected;
- (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered)rtsFirstPassPolicyTriggered;
- (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade)rtsSecondPassPolicyDecisionMade;
- (MHSchemaMHRaiseToSpeakTriggered)rtsTriggered;
- (MHSchemaMHSensorControlStatusReported)sensorControlStatusReported;
- (MHSchemaMHServerEndpointerContext)serverEndpointerContext;
- (MHSchemaMHSiriDirectedSpeechDetectionFailed)siriDirectedSpeechDetectionFailed;
- (MHSchemaMHSiriLaunchRequestContext)siriLaunchRequestContext;
- (MHSchemaMHSpeakerFalseTriggerMitigated)speakerFalseTriggerMitigated;
- (MHSchemaMHSpeechDetectorContext)speechDetectorContext;
- (MHSchemaMHSpeechStopDetected)speechStopDetected;
- (MHSchemaMHStoppedListeningForSpeechContinuation)stoppedListeningForSpeechContinuation;
- (MHSchemaMHTRPCreated)trpCreated;
- (MHSchemaMHUnintendedResponseSuppressionEvaluationContext)unintendedResponseSuppressionExecutionContext;
- (MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext)userEngagementModelContext;
- (MHSchemaMHUserSpeakingContext)userSpeakingContext;
- (MHSchemaMHVoiceAdBlockerContext)adblockerContext;
- (MHSchemaMHVoiceProfileICloudSyncFinished)voiceProfileICloudSyncFinished;
- (MHSchemaMHVoiceProfileOnboarded)voiceProfileOnboarded;
- (MHSchemaMHVoiceTriggerContext)voiceTriggerContext;
- (MHSchemaMHVoiceTriggerRePrompted)voiceTriggerRePrompted;
- (MHSchemaMHVoiceTriggerRejectDetected)voiceTriggerRejectDetected;
- (MHSchemaMHVoiceTriggerTwoShotDetected)voiceTriggerTwoShotDetected;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (SISchemaUUID)mhId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAcousticFalseTriggerMitigationEvaluationContext;
- (void)deleteAdblockerContext;
- (void)deleteApplicationPlaybackAttempted;
- (void)deleteAsrAudioConfigureStarted;
- (void)deleteAssistantDaemonAudioBluetoothInfo;
- (void)deleteAssistantDaemonAudioConfigureContext;
- (void)deleteAssistantDaemonAudioFetchRouteContext;
- (void)deleteAssistantDaemonAudioInitContext;
- (void)deleteAssistantDaemonAudioLateBufferDetected;
- (void)deleteAssistantDaemonAudioPrepareContext;
- (void)deleteAssistantDaemonAudioPrewarmContext;
- (void)deleteAssistantDaemonAudioRecordingContext;
- (void)deleteAssistantDaemonAudioRecordingFailureInsufficientPriority;
- (void)deleteAssistantDaemonAudioRecordingFirstBufferContext;
- (void)deleteAssistantDaemonAudioRecordingInterruptionContext;
- (void)deleteAssistantDaemonAudioRecordingInterruptionStartedTier1;
- (void)deleteAssistantDaemonAudioRecordingLastBufferContext;
- (void)deleteAssistantDaemonAudioRecordingMissedBufferDetected;
- (void)deleteAssistantDaemonAudioSessionSetActiveContext;
- (void)deleteAssistantDaemonAudioSessionSetInactiveContext;
- (void)deleteAssistantDaemonAudioStartRecordingContext;
- (void)deleteAssistantDaemonAudioStopRecordingContext;
- (void)deleteAssistantDaemonAudioTwoShotTransitionContext;
- (void)deleteAttendingContext;
- (void)deleteAudioDucked;
- (void)deleteAudioRecordingFailed;
- (void)deleteCarPlayLangaugeMismatched;
- (void)deleteCoreSpeechPreprocessorCompleted;
- (void)deleteCrownPressed;
- (void)deleteDarwinConnectedDeviceWakeContext;
- (void)deleteEndpointDelayContext;
- (void)deleteEndpointDetected;
- (void)deleteEndpointLatencyInfoReported;
- (void)deleteEndpointerAccessibleContext;
- (void)deleteEndpointerUsed;
- (void)deleteEventMetadata;
- (void)deleteFinalMitigationRecommendation;
- (void)deleteLatticeFalseTriggerMitigationEvaluationContext;
- (void)deleteMhId;
- (void)deleteOdldFalseTriggerMitigated;
- (void)deleteOnDeviceEndpointerContext;
- (void)deleteRtsFalseRejectDetected;
- (void)deleteRtsFirstPassPolicyTriggered;
- (void)deleteRtsSecondPassPolicyDecisionMade;
- (void)deleteRtsTriggered;
- (void)deleteSensorControlStatusReported;
- (void)deleteServerEndpointerContext;
- (void)deleteSiriDirectedSpeechDetectionFailed;
- (void)deleteSiriLaunchRequestContext;
- (void)deleteSpeakerFalseTriggerMitigated;
- (void)deleteSpeechDetectorContext;
- (void)deleteSpeechStopDetected;
- (void)deleteStoppedListeningForSpeechContinuation;
- (void)deleteTrpCreated;
- (void)deleteUnintendedResponseSuppressionExecutionContext;
- (void)deleteUserEngagementModelContext;
- (void)deleteUserSpeakingContext;
- (void)deleteVoiceProfileICloudSyncFinished;
- (void)deleteVoiceProfileOnboarded;
- (void)deleteVoiceTriggerContext;
- (void)deleteVoiceTriggerRePrompted;
- (void)deleteVoiceTriggerRejectDetected;
- (void)deleteVoiceTriggerTwoShotDetected;
- (void)setAcousticFalseTriggerMitigationEvaluationContext:(id)a3;
- (void)setAdblockerContext:(id)a3;
- (void)setApplicationPlaybackAttempted:(id)a3;
- (void)setAsrAudioConfigureStarted:(id)a3;
- (void)setAssistantDaemonAudioBluetoothInfo:(id)a3;
- (void)setAssistantDaemonAudioConfigureContext:(id)a3;
- (void)setAssistantDaemonAudioFetchRouteContext:(id)a3;
- (void)setAssistantDaemonAudioInitContext:(id)a3;
- (void)setAssistantDaemonAudioLateBufferDetected:(id)a3;
- (void)setAssistantDaemonAudioPrepareContext:(id)a3;
- (void)setAssistantDaemonAudioPrewarmContext:(id)a3;
- (void)setAssistantDaemonAudioRecordingContext:(id)a3;
- (void)setAssistantDaemonAudioRecordingFailureInsufficientPriority:(id)a3;
- (void)setAssistantDaemonAudioRecordingFirstBufferContext:(id)a3;
- (void)setAssistantDaemonAudioRecordingInterruptionContext:(id)a3;
- (void)setAssistantDaemonAudioRecordingInterruptionStartedTier1:(id)a3;
- (void)setAssistantDaemonAudioRecordingLastBufferContext:(id)a3;
- (void)setAssistantDaemonAudioRecordingMissedBufferDetected:(id)a3;
- (void)setAssistantDaemonAudioSessionSetActiveContext:(id)a3;
- (void)setAssistantDaemonAudioSessionSetInactiveContext:(id)a3;
- (void)setAssistantDaemonAudioStartRecordingContext:(id)a3;
- (void)setAssistantDaemonAudioStopRecordingContext:(id)a3;
- (void)setAssistantDaemonAudioTwoShotTransitionContext:(id)a3;
- (void)setAttendingContext:(id)a3;
- (void)setAudioDucked:(id)a3;
- (void)setAudioRecordingFailed:(id)a3;
- (void)setCarPlayLangaugeMismatched:(id)a3;
- (void)setCoreSpeechPreprocessorCompleted:(id)a3;
- (void)setCrownPressed:(id)a3;
- (void)setDarwinConnectedDeviceWakeContext:(id)a3;
- (void)setEndpointDelayContext:(id)a3;
- (void)setEndpointDetected:(id)a3;
- (void)setEndpointLatencyInfoReported:(id)a3;
- (void)setEndpointerAccessibleContext:(id)a3;
- (void)setEndpointerUsed:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setFinalMitigationRecommendation:(id)a3;
- (void)setHasAcousticFalseTriggerMitigationEvaluationContext:(BOOL)a3;
- (void)setHasAdblockerContext:(BOOL)a3;
- (void)setHasApplicationPlaybackAttempted:(BOOL)a3;
- (void)setHasAsrAudioConfigureStarted:(BOOL)a3;
- (void)setHasAssistantDaemonAudioBluetoothInfo:(BOOL)a3;
- (void)setHasAssistantDaemonAudioConfigureContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioFetchRouteContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioInitContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioLateBufferDetected:(BOOL)a3;
- (void)setHasAssistantDaemonAudioPrepareContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioPrewarmContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingFailureInsufficientPriority:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingFirstBufferContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingInterruptionContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingInterruptionStartedTier1:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingLastBufferContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioRecordingMissedBufferDetected:(BOOL)a3;
- (void)setHasAssistantDaemonAudioSessionSetActiveContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioSessionSetInactiveContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioStartRecordingContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioStopRecordingContext:(BOOL)a3;
- (void)setHasAssistantDaemonAudioTwoShotTransitionContext:(BOOL)a3;
- (void)setHasAttendingContext:(BOOL)a3;
- (void)setHasAudioDucked:(BOOL)a3;
- (void)setHasAudioRecordingFailed:(BOOL)a3;
- (void)setHasCarPlayLangaugeMismatched:(BOOL)a3;
- (void)setHasCoreSpeechPreprocessorCompleted:(BOOL)a3;
- (void)setHasCrownPressed:(BOOL)a3;
- (void)setHasDarwinConnectedDeviceWakeContext:(BOOL)a3;
- (void)setHasEndpointDelayContext:(BOOL)a3;
- (void)setHasEndpointDetected:(BOOL)a3;
- (void)setHasEndpointLatencyInfoReported:(BOOL)a3;
- (void)setHasEndpointerAccessibleContext:(BOOL)a3;
- (void)setHasEndpointerUsed:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFinalMitigationRecommendation:(BOOL)a3;
- (void)setHasLatticeFalseTriggerMitigationEvaluationContext:(BOOL)a3;
- (void)setHasMhId:(BOOL)a3;
- (void)setHasOdldFalseTriggerMitigated:(BOOL)a3;
- (void)setHasOnDeviceEndpointerContext:(BOOL)a3;
- (void)setHasRtsFalseRejectDetected:(BOOL)a3;
- (void)setHasRtsFirstPassPolicyTriggered:(BOOL)a3;
- (void)setHasRtsSecondPassPolicyDecisionMade:(BOOL)a3;
- (void)setHasRtsTriggered:(BOOL)a3;
- (void)setHasSensorControlStatusReported:(BOOL)a3;
- (void)setHasServerEndpointerContext:(BOOL)a3;
- (void)setHasSiriDirectedSpeechDetectionFailed:(BOOL)a3;
- (void)setHasSiriLaunchRequestContext:(BOOL)a3;
- (void)setHasSpeakerFalseTriggerMitigated:(BOOL)a3;
- (void)setHasSpeechDetectorContext:(BOOL)a3;
- (void)setHasSpeechStopDetected:(BOOL)a3;
- (void)setHasStoppedListeningForSpeechContinuation:(BOOL)a3;
- (void)setHasTrpCreated:(BOOL)a3;
- (void)setHasUnintendedResponseSuppressionExecutionContext:(BOOL)a3;
- (void)setHasUserEngagementModelContext:(BOOL)a3;
- (void)setHasUserSpeakingContext:(BOOL)a3;
- (void)setHasVoiceProfileICloudSyncFinished:(BOOL)a3;
- (void)setHasVoiceProfileOnboarded:(BOOL)a3;
- (void)setHasVoiceTriggerContext:(BOOL)a3;
- (void)setHasVoiceTriggerRePrompted:(BOOL)a3;
- (void)setHasVoiceTriggerRejectDetected:(BOOL)a3;
- (void)setHasVoiceTriggerTwoShotDetected:(BOOL)a3;
- (void)setLatticeFalseTriggerMitigationEvaluationContext:(id)a3;
- (void)setMhId:(id)a3;
- (void)setOdldFalseTriggerMitigated:(id)a3;
- (void)setOnDeviceEndpointerContext:(id)a3;
- (void)setRtsFalseRejectDetected:(id)a3;
- (void)setRtsFirstPassPolicyTriggered:(id)a3;
- (void)setRtsSecondPassPolicyDecisionMade:(id)a3;
- (void)setRtsTriggered:(id)a3;
- (void)setSensorControlStatusReported:(id)a3;
- (void)setServerEndpointerContext:(id)a3;
- (void)setSiriDirectedSpeechDetectionFailed:(id)a3;
- (void)setSiriLaunchRequestContext:(id)a3;
- (void)setSpeakerFalseTriggerMitigated:(id)a3;
- (void)setSpeechDetectorContext:(id)a3;
- (void)setSpeechStopDetected:(id)a3;
- (void)setStoppedListeningForSpeechContinuation:(id)a3;
- (void)setTrpCreated:(id)a3;
- (void)setUnintendedResponseSuppressionExecutionContext:(id)a3;
- (void)setUserEngagementModelContext:(id)a3;
- (void)setUserSpeakingContext:(id)a3;
- (void)setVoiceProfileICloudSyncFinished:(id)a3;
- (void)setVoiceProfileOnboarded:(id)a3;
- (void)setVoiceTriggerContext:(id)a3;
- (void)setVoiceTriggerRePrompted:(id)a3;
- (void)setVoiceTriggerRejectDetected:(id)a3;
- (void)setVoiceTriggerTwoShotDetected:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHClientEvent

- (int)componentName
{
  v2 = [(MHSchemaMHClientEvent *)self eventMetadata];
  v3 = [v2 mhId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 9;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(MHSchemaMHClientEvent *)self eventMetadata];
  v3 = [v2 mhId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v197.receiver = self;
  v197.super_class = (Class)MHSchemaMHClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v197 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(MHSchemaMHClientEvent *)self mhId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MHSchemaMHClientEvent *)self deleteMhId];
  }
  v9 = [(MHSchemaMHClientEvent *)self eventMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MHSchemaMHClientEvent *)self deleteEventMetadata];
  }
  v12 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MHSchemaMHClientEvent *)self deleteAcousticFalseTriggerMitigationEvaluationContext];
  }
  v15 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(MHSchemaMHClientEvent *)self deleteLatticeFalseTriggerMitigationEvaluationContext];
  }
  v18 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(MHSchemaMHClientEvent *)self deleteUnintendedResponseSuppressionExecutionContext];
  }
  v21 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(MHSchemaMHClientEvent *)self deleteCoreSpeechPreprocessorCompleted];
  }
  v24 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(MHSchemaMHClientEvent *)self deleteAsrAudioConfigureStarted];
  }
  v27 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioInitContext];
  }
  v30 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioConfigureContext];
  }
  v33 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioPrepareContext];
  }
  v36 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioPrewarmContext];
  }
  v39 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioStartRecordingContext];
  }
  v42 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioStopRecordingContext];
  }
  v45 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioSessionSetActiveContext];
  }
  v48 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioSessionSetInactiveContext];
  }
  v51 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioFetchRouteContext];
  }
  v54 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingContext];
  }
  v57 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingMissedBufferDetected];
  }
  v60 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioLateBufferDetected];
  }
  v63 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingFirstBufferContext];
  }
  v66 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingLastBufferContext];
  }
  v69 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingInterruptionContext];
  }
  v72 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingInterruptionStartedTier1];
  }
  v75 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];
  v76 = [v75 applySensitiveConditionsPolicy:v4];
  int v77 = [v76 suppressMessage];

  if (v77) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioBluetoothInfo];
  }
  v78 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];
  v79 = [v78 applySensitiveConditionsPolicy:v4];
  int v80 = [v79 suppressMessage];

  if (v80) {
    [(MHSchemaMHClientEvent *)self deleteVoiceTriggerTwoShotDetected];
  }
  v81 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];
  v82 = [v81 applySensitiveConditionsPolicy:v4];
  int v83 = [v82 suppressMessage];

  if (v83) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioTwoShotTransitionContext];
  }
  v84 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];
  v85 = [v84 applySensitiveConditionsPolicy:v4];
  int v86 = [v85 suppressMessage];

  if (v86) {
    [(MHSchemaMHClientEvent *)self deleteVoiceTriggerContext];
  }
  v87 = [(MHSchemaMHClientEvent *)self endpointDetected];
  v88 = [v87 applySensitiveConditionsPolicy:v4];
  int v89 = [v88 suppressMessage];

  if (v89) {
    [(MHSchemaMHClientEvent *)self deleteEndpointDetected];
  }
  v90 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];
  v91 = [v90 applySensitiveConditionsPolicy:v4];
  int v92 = [v91 suppressMessage];

  if (v92) {
    [(MHSchemaMHClientEvent *)self deleteEndpointLatencyInfoReported];
  }
  v93 = [(MHSchemaMHClientEvent *)self adblockerContext];
  v94 = [v93 applySensitiveConditionsPolicy:v4];
  int v95 = [v94 suppressMessage];

  if (v95) {
    [(MHSchemaMHClientEvent *)self deleteAdblockerContext];
  }
  v96 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];
  v97 = [v96 applySensitiveConditionsPolicy:v4];
  int v98 = [v97 suppressMessage];

  if (v98) {
    [(MHSchemaMHClientEvent *)self deleteOnDeviceEndpointerContext];
  }
  v99 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];
  v100 = [v99 applySensitiveConditionsPolicy:v4];
  int v101 = [v100 suppressMessage];

  if (v101) {
    [(MHSchemaMHClientEvent *)self deleteServerEndpointerContext];
  }
  v102 = [(MHSchemaMHClientEvent *)self endpointerUsed];
  v103 = [v102 applySensitiveConditionsPolicy:v4];
  int v104 = [v103 suppressMessage];

  if (v104) {
    [(MHSchemaMHClientEvent *)self deleteEndpointerUsed];
  }
  v105 = [(MHSchemaMHClientEvent *)self endpointDelayContext];
  v106 = [v105 applySensitiveConditionsPolicy:v4];
  int v107 = [v106 suppressMessage];

  if (v107) {
    [(MHSchemaMHClientEvent *)self deleteEndpointDelayContext];
  }
  v108 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];
  v109 = [v108 applySensitiveConditionsPolicy:v4];
  int v110 = [v109 suppressMessage];

  if (v110) {
    [(MHSchemaMHClientEvent *)self deleteFinalMitigationRecommendation];
  }
  v111 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];
  v112 = [v111 applySensitiveConditionsPolicy:v4];
  int v113 = [v112 suppressMessage];

  if (v113) {
    [(MHSchemaMHClientEvent *)self deleteApplicationPlaybackAttempted];
  }
  v114 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];
  v115 = [v114 applySensitiveConditionsPolicy:v4];
  int v116 = [v115 suppressMessage];

  if (v116) {
    [(MHSchemaMHClientEvent *)self deleteSiriLaunchRequestContext];
  }
  v117 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];
  v118 = [v117 applySensitiveConditionsPolicy:v4];
  int v119 = [v118 suppressMessage];

  if (v119) {
    [(MHSchemaMHClientEvent *)self deleteEndpointerAccessibleContext];
  }
  v120 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];
  v121 = [v120 applySensitiveConditionsPolicy:v4];
  int v122 = [v121 suppressMessage];

  if (v122) {
    [(MHSchemaMHClientEvent *)self deleteCarPlayLangaugeMismatched];
  }
  v123 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];
  v124 = [v123 applySensitiveConditionsPolicy:v4];
  int v125 = [v124 suppressMessage];

  if (v125) {
    [(MHSchemaMHClientEvent *)self deleteDarwinConnectedDeviceWakeContext];
  }
  v126 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];
  v127 = [v126 applySensitiveConditionsPolicy:v4];
  int v128 = [v127 suppressMessage];

  if (v128) {
    [(MHSchemaMHClientEvent *)self deleteOdldFalseTriggerMitigated];
  }
  v129 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];
  v130 = [v129 applySensitiveConditionsPolicy:v4];
  int v131 = [v130 suppressMessage];

  if (v131) {
    [(MHSchemaMHClientEvent *)self deleteSpeakerFalseTriggerMitigated];
  }
  v132 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];
  v133 = [v132 applySensitiveConditionsPolicy:v4];
  int v134 = [v133 suppressMessage];

  if (v134) {
    [(MHSchemaMHClientEvent *)self deleteSiriDirectedSpeechDetectionFailed];
  }
  v135 = [(MHSchemaMHClientEvent *)self audioDucked];
  v136 = [v135 applySensitiveConditionsPolicy:v4];
  int v137 = [v136 suppressMessage];

  if (v137) {
    [(MHSchemaMHClientEvent *)self deleteAudioDucked];
  }
  v138 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];
  v139 = [v138 applySensitiveConditionsPolicy:v4];
  int v140 = [v139 suppressMessage];

  if (v140) {
    [(MHSchemaMHClientEvent *)self deleteAudioRecordingFailed];
  }
  v141 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];
  v142 = [v141 applySensitiveConditionsPolicy:v4];
  int v143 = [v142 suppressMessage];

  if (v143) {
    [(MHSchemaMHClientEvent *)self deleteRtsFalseRejectDetected];
  }
  v144 = [(MHSchemaMHClientEvent *)self trpCreated];
  v145 = [v144 applySensitiveConditionsPolicy:v4];
  int v146 = [v145 suppressMessage];

  if (v146) {
    [(MHSchemaMHClientEvent *)self deleteTrpCreated];
  }
  v147 = [(MHSchemaMHClientEvent *)self userSpeakingContext];
  v148 = [v147 applySensitiveConditionsPolicy:v4];
  int v149 = [v148 suppressMessage];

  if (v149) {
    [(MHSchemaMHClientEvent *)self deleteUserSpeakingContext];
  }
  v150 = [(MHSchemaMHClientEvent *)self speechStopDetected];
  v151 = [v150 applySensitiveConditionsPolicy:v4];
  int v152 = [v151 suppressMessage];

  if (v152) {
    [(MHSchemaMHClientEvent *)self deleteSpeechStopDetected];
  }
  v153 = [(MHSchemaMHClientEvent *)self speechDetectorContext];
  v154 = [v153 applySensitiveConditionsPolicy:v4];
  int v155 = [v154 suppressMessage];

  if (v155) {
    [(MHSchemaMHClientEvent *)self deleteSpeechDetectorContext];
  }
  v156 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];
  v157 = [v156 applySensitiveConditionsPolicy:v4];
  int v158 = [v157 suppressMessage];

  if (v158) {
    [(MHSchemaMHClientEvent *)self deleteStoppedListeningForSpeechContinuation];
  }
  v159 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];
  v160 = [v159 applySensitiveConditionsPolicy:v4];
  int v161 = [v160 suppressMessage];

  if (v161) {
    [(MHSchemaMHClientEvent *)self deleteUserEngagementModelContext];
  }
  v162 = [(MHSchemaMHClientEvent *)self attendingContext];
  v163 = [v162 applySensitiveConditionsPolicy:v4];
  int v164 = [v163 suppressMessage];

  if (v164) {
    [(MHSchemaMHClientEvent *)self deleteAttendingContext];
  }
  v165 = [(MHSchemaMHClientEvent *)self crownPressed];
  v166 = [v165 applySensitiveConditionsPolicy:v4];
  int v167 = [v166 suppressMessage];

  if (v167) {
    [(MHSchemaMHClientEvent *)self deleteCrownPressed];
  }
  v168 = [(MHSchemaMHClientEvent *)self rtsTriggered];
  v169 = [v168 applySensitiveConditionsPolicy:v4];
  int v170 = [v169 suppressMessage];

  if (v170) {
    [(MHSchemaMHClientEvent *)self deleteRtsTriggered];
  }
  v171 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];
  v172 = [v171 applySensitiveConditionsPolicy:v4];
  int v173 = [v172 suppressMessage];

  if (v173) {
    [(MHSchemaMHClientEvent *)self deleteRtsFirstPassPolicyTriggered];
  }
  v174 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];
  v175 = [v174 applySensitiveConditionsPolicy:v4];
  int v176 = [v175 suppressMessage];

  if (v176) {
    [(MHSchemaMHClientEvent *)self deleteRtsSecondPassPolicyDecisionMade];
  }
  v177 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];
  v178 = [v177 applySensitiveConditionsPolicy:v4];
  int v179 = [v178 suppressMessage];

  if (v179) {
    [(MHSchemaMHClientEvent *)self deleteVoiceProfileOnboarded];
  }
  v180 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];
  v181 = [v180 applySensitiveConditionsPolicy:v4];
  int v182 = [v181 suppressMessage];

  if (v182) {
    [(MHSchemaMHClientEvent *)self deleteSensorControlStatusReported];
  }
  v183 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];
  v184 = [v183 applySensitiveConditionsPolicy:v4];
  int v185 = [v184 suppressMessage];

  if (v185) {
    [(MHSchemaMHClientEvent *)self deleteVoiceTriggerRePrompted];
  }
  v186 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];
  v187 = [v186 applySensitiveConditionsPolicy:v4];
  int v188 = [v187 suppressMessage];

  if (v188) {
    [(MHSchemaMHClientEvent *)self deleteAssistantDaemonAudioRecordingFailureInsufficientPriority];
  }
  v189 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];
  v190 = [v189 applySensitiveConditionsPolicy:v4];
  int v191 = [v190 suppressMessage];

  if (v191) {
    [(MHSchemaMHClientEvent *)self deleteVoiceProfileICloudSyncFinished];
  }
  v192 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];
  v193 = [v192 applySensitiveConditionsPolicy:v4];
  int v194 = [v193 suppressMessage];

  if (v194) {
    [(MHSchemaMHClientEvent *)self deleteVoiceTriggerRejectDetected];
  }
  id v195 = v5;

  return v195;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(MHSchemaMHClientEvent *)self whichEvent_Type];
  if (v3 - 100 > 0x3C) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAAAA8[v3 - 100]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 100 > 0x3C) {
    return 0;
  }
  else {
    return off_1E5EAAC90[a3 - 100];
  }
}

- (int)clockIsolationLevel
{
  if ((([(MHSchemaMHClientEvent *)self whichEvent_Type] - 157) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerRejectDetected, 0);
  objc_storeStrong((id *)&self->_voiceProfileICloudSyncFinished, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingFailureInsufficientPriority, 0);
  objc_storeStrong((id *)&self->_voiceTriggerRePrompted, 0);
  objc_storeStrong((id *)&self->_sensorControlStatusReported, 0);
  objc_storeStrong((id *)&self->_voiceProfileOnboarded, 0);
  objc_storeStrong((id *)&self->_rtsSecondPassPolicyDecisionMade, 0);
  objc_storeStrong((id *)&self->_rtsFirstPassPolicyTriggered, 0);
  objc_storeStrong((id *)&self->_rtsTriggered, 0);
  objc_storeStrong((id *)&self->_crownPressed, 0);
  objc_storeStrong((id *)&self->_attendingContext, 0);
  objc_storeStrong((id *)&self->_userEngagementModelContext, 0);
  objc_storeStrong((id *)&self->_stoppedListeningForSpeechContinuation, 0);
  objc_storeStrong((id *)&self->_speechDetectorContext, 0);
  objc_storeStrong((id *)&self->_speechStopDetected, 0);
  objc_storeStrong((id *)&self->_userSpeakingContext, 0);
  objc_storeStrong((id *)&self->_trpCreated, 0);
  objc_storeStrong((id *)&self->_rtsFalseRejectDetected, 0);
  objc_storeStrong((id *)&self->_audioRecordingFailed, 0);
  objc_storeStrong((id *)&self->_audioDucked, 0);
  objc_storeStrong((id *)&self->_siriDirectedSpeechDetectionFailed, 0);
  objc_storeStrong((id *)&self->_speakerFalseTriggerMitigated, 0);
  objc_storeStrong((id *)&self->_odldFalseTriggerMitigated, 0);
  objc_storeStrong((id *)&self->_darwinConnectedDeviceWakeContext, 0);
  objc_storeStrong((id *)&self->_carPlayLangaugeMismatched, 0);
  objc_storeStrong((id *)&self->_endpointerAccessibleContext, 0);
  objc_storeStrong((id *)&self->_siriLaunchRequestContext, 0);
  objc_storeStrong((id *)&self->_applicationPlaybackAttempted, 0);
  objc_storeStrong((id *)&self->_finalMitigationRecommendation, 0);
  objc_storeStrong((id *)&self->_endpointDelayContext, 0);
  objc_storeStrong((id *)&self->_endpointerUsed, 0);
  objc_storeStrong((id *)&self->_serverEndpointerContext, 0);
  objc_storeStrong((id *)&self->_onDeviceEndpointerContext, 0);
  objc_storeStrong((id *)&self->_adblockerContext, 0);
  objc_storeStrong((id *)&self->_endpointLatencyInfoReported, 0);
  objc_storeStrong((id *)&self->_endpointDetected, 0);
  objc_storeStrong((id *)&self->_voiceTriggerContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioTwoShotTransitionContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerTwoShotDetected, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioBluetoothInfo, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingInterruptionStartedTier1, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingInterruptionContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingLastBufferContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingFirstBufferContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioLateBufferDetected, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingMissedBufferDetected, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioFetchRouteContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioSessionSetInactiveContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioSessionSetActiveContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioStopRecordingContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioStartRecordingContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioPrewarmContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioPrepareContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioConfigureContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioInitContext, 0);
  objc_storeStrong((id *)&self->_asrAudioConfigureStarted, 0);
  objc_storeStrong((id *)&self->_coreSpeechPreprocessorCompleted, 0);
  objc_storeStrong((id *)&self->_unintendedResponseSuppressionExecutionContext, 0);
  objc_storeStrong((id *)&self->_latticeFalseTriggerMitigationEvaluationContext, 0);
  objc_storeStrong((id *)&self->_acousticFalseTriggerMitigationEvaluationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
}

- (void)setHasVoiceTriggerRejectDetected:(BOOL)a3
{
  self->_hasVoiceTriggerRejectDetected = a3;
}

- (BOOL)hasVoiceTriggerRejectDetected
{
  return self->_hasVoiceTriggerRejectDetected;
}

- (void)setHasVoiceProfileICloudSyncFinished:(BOOL)a3
{
  self->_hasVoiceProfileICloudSyncFinished = a3;
}

- (BOOL)hasVoiceProfileICloudSyncFinished
{
  return self->_hasVoiceProfileICloudSyncFinished;
}

- (void)setHasAssistantDaemonAudioRecordingFailureInsufficientPriority:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingFailureInsufficientPriority = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingFailureInsufficientPriority
{
  return self->_hasAssistantDaemonAudioRecordingFailureInsufficientPriority;
}

- (void)setHasVoiceTriggerRePrompted:(BOOL)a3
{
  self->_hasVoiceTriggerRePrompted = a3;
}

- (BOOL)hasVoiceTriggerRePrompted
{
  return self->_hasVoiceTriggerRePrompted;
}

- (void)setHasSensorControlStatusReported:(BOOL)a3
{
  self->_hasSensorControlStatusReported = a3;
}

- (BOOL)hasSensorControlStatusReported
{
  return self->_hasSensorControlStatusReported;
}

- (void)setHasVoiceProfileOnboarded:(BOOL)a3
{
  self->_hasVoiceProfileOnboarded = a3;
}

- (BOOL)hasVoiceProfileOnboarded
{
  return self->_hasVoiceProfileOnboarded;
}

- (void)setHasRtsSecondPassPolicyDecisionMade:(BOOL)a3
{
  self->_hasRtsSecondPassPolicyDecisionMade = a3;
}

- (BOOL)hasRtsSecondPassPolicyDecisionMade
{
  return self->_hasRtsSecondPassPolicyDecisionMade;
}

- (void)setHasRtsFirstPassPolicyTriggered:(BOOL)a3
{
  self->_hasRtsFirstPassPolicyTriggered = a3;
}

- (BOOL)hasRtsFirstPassPolicyTriggered
{
  return self->_hasRtsFirstPassPolicyTriggered;
}

- (void)setHasRtsTriggered:(BOOL)a3
{
  self->_hasRtsTriggered = a3;
}

- (BOOL)hasRtsTriggered
{
  return self->_hasRtsTriggered;
}

- (void)setHasCrownPressed:(BOOL)a3
{
  self->_hasCrownPressed = a3;
}

- (BOOL)hasCrownPressed
{
  return self->_hasCrownPressed;
}

- (void)setHasAttendingContext:(BOOL)a3
{
  self->_hasAttendingContext = a3;
}

- (BOOL)hasAttendingContext
{
  return self->_hasAttendingContext;
}

- (void)setHasUserEngagementModelContext:(BOOL)a3
{
  self->_hasUserEngagementModelContext = a3;
}

- (BOOL)hasUserEngagementModelContext
{
  return self->_hasUserEngagementModelContext;
}

- (void)setHasStoppedListeningForSpeechContinuation:(BOOL)a3
{
  self->_hasStoppedListeningForSpeechContinuation = a3;
}

- (BOOL)hasStoppedListeningForSpeechContinuation
{
  return self->_hasStoppedListeningForSpeechContinuation;
}

- (void)setHasSpeechDetectorContext:(BOOL)a3
{
  self->_hasSpeechDetectorContext = a3;
}

- (BOOL)hasSpeechDetectorContext
{
  return self->_hasSpeechDetectorContext;
}

- (void)setHasSpeechStopDetected:(BOOL)a3
{
  self->_hasSpeechStopDetected = a3;
}

- (BOOL)hasSpeechStopDetected
{
  return self->_hasSpeechStopDetected;
}

- (void)setHasUserSpeakingContext:(BOOL)a3
{
  self->_hasUserSpeakingContext = a3;
}

- (BOOL)hasUserSpeakingContext
{
  return self->_hasUserSpeakingContext;
}

- (void)setHasTrpCreated:(BOOL)a3
{
  self->_hasTrpCreated = a3;
}

- (BOOL)hasTrpCreated
{
  return self->_hasTrpCreated;
}

- (void)setHasRtsFalseRejectDetected:(BOOL)a3
{
  self->_hasRtsFalseRejectDetected = a3;
}

- (BOOL)hasRtsFalseRejectDetected
{
  return self->_hasRtsFalseRejectDetected;
}

- (void)setHasAudioRecordingFailed:(BOOL)a3
{
  self->_hasAudioRecordingFailed = a3;
}

- (BOOL)hasAudioRecordingFailed
{
  return self->_hasAudioRecordingFailed;
}

- (void)setHasAudioDucked:(BOOL)a3
{
  self->_hasAudioDucked = a3;
}

- (BOOL)hasAudioDucked
{
  return self->_hasAudioDucked;
}

- (void)setHasSiriDirectedSpeechDetectionFailed:(BOOL)a3
{
  self->_hasSiriDirectedSpeechDetectionFailed = a3;
}

- (BOOL)hasSiriDirectedSpeechDetectionFailed
{
  return self->_hasSiriDirectedSpeechDetectionFailed;
}

- (void)setHasSpeakerFalseTriggerMitigated:(BOOL)a3
{
  self->_hasSpeakerFalseTriggerMitigated = a3;
}

- (BOOL)hasSpeakerFalseTriggerMitigated
{
  return self->_hasSpeakerFalseTriggerMitigated;
}

- (void)setHasOdldFalseTriggerMitigated:(BOOL)a3
{
  self->_hasOdldFalseTriggerMitigated = a3;
}

- (BOOL)hasOdldFalseTriggerMitigated
{
  return self->_hasOdldFalseTriggerMitigated;
}

- (void)setHasDarwinConnectedDeviceWakeContext:(BOOL)a3
{
  self->_hasDarwinConnectedDeviceWakeContext = a3;
}

- (BOOL)hasDarwinConnectedDeviceWakeContext
{
  return self->_hasDarwinConnectedDeviceWakeContext;
}

- (void)setHasCarPlayLangaugeMismatched:(BOOL)a3
{
  self->_hasCarPlayLangaugeMismatched = a3;
}

- (BOOL)hasCarPlayLangaugeMismatched
{
  return self->_hasCarPlayLangaugeMismatched;
}

- (void)setHasEndpointerAccessibleContext:(BOOL)a3
{
  self->_hasEndpointerAccessibleContext = a3;
}

- (BOOL)hasEndpointerAccessibleContext
{
  return self->_hasEndpointerAccessibleContext;
}

- (void)setHasSiriLaunchRequestContext:(BOOL)a3
{
  self->_hasSiriLaunchRequestContext = a3;
}

- (BOOL)hasSiriLaunchRequestContext
{
  return self->_hasSiriLaunchRequestContext;
}

- (void)setHasApplicationPlaybackAttempted:(BOOL)a3
{
  self->_hasApplicationPlaybackAttempted = a3;
}

- (BOOL)hasApplicationPlaybackAttempted
{
  return self->_hasApplicationPlaybackAttempted;
}

- (void)setHasFinalMitigationRecommendation:(BOOL)a3
{
  self->_hasFinalMitigationRecommendation = a3;
}

- (BOOL)hasFinalMitigationRecommendation
{
  return self->_hasFinalMitigationRecommendation;
}

- (void)setHasEndpointDelayContext:(BOOL)a3
{
  self->_hasEndpointDelayContext = a3;
}

- (BOOL)hasEndpointDelayContext
{
  return self->_hasEndpointDelayContext;
}

- (void)setHasEndpointerUsed:(BOOL)a3
{
  self->_hasEndpointerUsed = a3;
}

- (BOOL)hasEndpointerUsed
{
  return self->_hasEndpointerUsed;
}

- (void)setHasServerEndpointerContext:(BOOL)a3
{
  self->_hasServerEndpointerContext = a3;
}

- (BOOL)hasServerEndpointerContext
{
  return self->_hasServerEndpointerContext;
}

- (void)setHasOnDeviceEndpointerContext:(BOOL)a3
{
  self->_hasOnDeviceEndpointerContext = a3;
}

- (BOOL)hasOnDeviceEndpointerContext
{
  return self->_hasOnDeviceEndpointerContext;
}

- (void)setHasAdblockerContext:(BOOL)a3
{
  self->_hasAdblockerContext = a3;
}

- (BOOL)hasAdblockerContext
{
  return self->_hasAdblockerContext;
}

- (void)setHasEndpointLatencyInfoReported:(BOOL)a3
{
  self->_hasEndpointLatencyInfoReported = a3;
}

- (BOOL)hasEndpointLatencyInfoReported
{
  return self->_hasEndpointLatencyInfoReported;
}

- (void)setHasEndpointDetected:(BOOL)a3
{
  self->_hasEndpointDetected = a3;
}

- (BOOL)hasEndpointDetected
{
  return self->_hasEndpointDetected;
}

- (void)setHasVoiceTriggerContext:(BOOL)a3
{
  self->_hasVoiceTriggerContext = a3;
}

- (BOOL)hasVoiceTriggerContext
{
  return self->_hasVoiceTriggerContext;
}

- (void)setHasAssistantDaemonAudioTwoShotTransitionContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioTwoShotTransitionContext = a3;
}

- (BOOL)hasAssistantDaemonAudioTwoShotTransitionContext
{
  return self->_hasAssistantDaemonAudioTwoShotTransitionContext;
}

- (void)setHasVoiceTriggerTwoShotDetected:(BOOL)a3
{
  self->_hasVoiceTriggerTwoShotDetected = a3;
}

- (BOOL)hasVoiceTriggerTwoShotDetected
{
  return self->_hasVoiceTriggerTwoShotDetected;
}

- (void)setHasAssistantDaemonAudioBluetoothInfo:(BOOL)a3
{
  self->_hasAssistantDaemonAudioBluetoothInfo = a3;
}

- (BOOL)hasAssistantDaemonAudioBluetoothInfo
{
  return self->_hasAssistantDaemonAudioBluetoothInfo;
}

- (void)setHasAssistantDaemonAudioRecordingInterruptionStartedTier1:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingInterruptionStartedTier1 = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingInterruptionStartedTier1
{
  return self->_hasAssistantDaemonAudioRecordingInterruptionStartedTier1;
}

- (void)setHasAssistantDaemonAudioRecordingInterruptionContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingInterruptionContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingInterruptionContext
{
  return self->_hasAssistantDaemonAudioRecordingInterruptionContext;
}

- (void)setHasAssistantDaemonAudioRecordingLastBufferContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingLastBufferContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingLastBufferContext
{
  return self->_hasAssistantDaemonAudioRecordingLastBufferContext;
}

- (void)setHasAssistantDaemonAudioRecordingFirstBufferContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingFirstBufferContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingFirstBufferContext
{
  return self->_hasAssistantDaemonAudioRecordingFirstBufferContext;
}

- (void)setHasAssistantDaemonAudioLateBufferDetected:(BOOL)a3
{
  self->_hasAssistantDaemonAudioLateBufferDetected = a3;
}

- (BOOL)hasAssistantDaemonAudioLateBufferDetected
{
  return self->_hasAssistantDaemonAudioLateBufferDetected;
}

- (void)setHasAssistantDaemonAudioRecordingMissedBufferDetected:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingMissedBufferDetected = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingMissedBufferDetected
{
  return self->_hasAssistantDaemonAudioRecordingMissedBufferDetected;
}

- (void)setHasAssistantDaemonAudioRecordingContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingContext
{
  return self->_hasAssistantDaemonAudioRecordingContext;
}

- (void)setHasAssistantDaemonAudioFetchRouteContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioFetchRouteContext = a3;
}

- (BOOL)hasAssistantDaemonAudioFetchRouteContext
{
  return self->_hasAssistantDaemonAudioFetchRouteContext;
}

- (void)setHasAssistantDaemonAudioSessionSetInactiveContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioSessionSetInactiveContext = a3;
}

- (BOOL)hasAssistantDaemonAudioSessionSetInactiveContext
{
  return self->_hasAssistantDaemonAudioSessionSetInactiveContext;
}

- (void)setHasAssistantDaemonAudioSessionSetActiveContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioSessionSetActiveContext = a3;
}

- (BOOL)hasAssistantDaemonAudioSessionSetActiveContext
{
  return self->_hasAssistantDaemonAudioSessionSetActiveContext;
}

- (void)setHasAssistantDaemonAudioStopRecordingContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioStopRecordingContext = a3;
}

- (BOOL)hasAssistantDaemonAudioStopRecordingContext
{
  return self->_hasAssistantDaemonAudioStopRecordingContext;
}

- (void)setHasAssistantDaemonAudioStartRecordingContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioStartRecordingContext = a3;
}

- (BOOL)hasAssistantDaemonAudioStartRecordingContext
{
  return self->_hasAssistantDaemonAudioStartRecordingContext;
}

- (void)setHasAssistantDaemonAudioPrewarmContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioPrewarmContext = a3;
}

- (BOOL)hasAssistantDaemonAudioPrewarmContext
{
  return self->_hasAssistantDaemonAudioPrewarmContext;
}

- (void)setHasAssistantDaemonAudioPrepareContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioPrepareContext = a3;
}

- (BOOL)hasAssistantDaemonAudioPrepareContext
{
  return self->_hasAssistantDaemonAudioPrepareContext;
}

- (void)setHasAssistantDaemonAudioConfigureContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioConfigureContext = a3;
}

- (BOOL)hasAssistantDaemonAudioConfigureContext
{
  return self->_hasAssistantDaemonAudioConfigureContext;
}

- (void)setHasAssistantDaemonAudioInitContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioInitContext = a3;
}

- (BOOL)hasAssistantDaemonAudioInitContext
{
  return self->_hasAssistantDaemonAudioInitContext;
}

- (void)setHasAsrAudioConfigureStarted:(BOOL)a3
{
  self->_hasAsrAudioConfigureStarted = a3;
}

- (BOOL)hasAsrAudioConfigureStarted
{
  return self->_hasAsrAudioConfigureStarted;
}

- (void)setHasCoreSpeechPreprocessorCompleted:(BOOL)a3
{
  self->_hasCoreSpeechPreprocessorCompleted = a3;
}

- (BOOL)hasCoreSpeechPreprocessorCompleted
{
  return self->_hasCoreSpeechPreprocessorCompleted;
}

- (void)setHasUnintendedResponseSuppressionExecutionContext:(BOOL)a3
{
  self->_hasUnintendedResponseSuppressionExecutionContext = a3;
}

- (BOOL)hasUnintendedResponseSuppressionExecutionContext
{
  return self->_hasUnintendedResponseSuppressionExecutionContext;
}

- (void)setHasLatticeFalseTriggerMitigationEvaluationContext:(BOOL)a3
{
  self->_hasLatticeFalseTriggerMitigationEvaluationContext = a3;
}

- (BOOL)hasLatticeFalseTriggerMitigationEvaluationContext
{
  return self->_hasLatticeFalseTriggerMitigationEvaluationContext;
}

- (void)setHasAcousticFalseTriggerMitigationEvaluationContext:(BOOL)a3
{
  self->_hasAcousticFalseTriggerMitigationEvaluationContext = a3;
}

- (BOOL)hasAcousticFalseTriggerMitigationEvaluationContext
{
  return self->_hasAcousticFalseTriggerMitigationEvaluationContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setHasMhId:(BOOL)a3
{
  self->_hasMhId = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (MHSchemaMHClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setMhId:(id)a3
{
}

- (SISchemaUUID)mhId
{
  return self->_mhId;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (MHSchemaMHClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v190.receiver = self;
  v190.super_class = (Class)MHSchemaMHClientEvent;
  v5 = [(MHSchemaMHClientEvent *)&v190 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"mhId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MHSchemaMHClientEvent *)v5 setMhId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[MHSchemaMHClientEventMetadata alloc] initWithDictionary:v8];
      [(MHSchemaMHClientEvent *)v5 setEventMetadata:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"acousticFalseTriggerMitigationEvaluationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext alloc] initWithDictionary:v10];
      [(MHSchemaMHClientEvent *)v5 setAcousticFalseTriggerMitigationEvaluationContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"latticeFalseTriggerMitigationEvaluationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext alloc] initWithDictionary:v12];
      [(MHSchemaMHClientEvent *)v5 setLatticeFalseTriggerMitigationEvaluationContext:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"unintendedResponseSuppressionExecutionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[MHSchemaMHUnintendedResponseSuppressionEvaluationContext alloc] initWithDictionary:v14];
      [(MHSchemaMHClientEvent *)v5 setUnintendedResponseSuppressionExecutionContext:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"coreSpeechPreprocessorCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[MHSchemaMHCoreSpeechPreprocessorCompleted alloc] initWithDictionary:v16];
      [(MHSchemaMHClientEvent *)v5 setCoreSpeechPreprocessorCompleted:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"asrAudioConfigureStarted"];
    objc_opt_class();
    v189 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[MHSchemaMHASRAudioConfigureStarted alloc] initWithDictionary:v18];
      [(MHSchemaMHClientEvent *)v5 setAsrAudioConfigureStarted:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioInitContext"];
    objc_opt_class();
    int v188 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[MHSchemaMHAssistantDaemonAudioInitContext alloc] initWithDictionary:v20];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioInitContext:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioConfigureContext"];
    objc_opt_class();
    v187 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[MHSchemaMHAssistantDaemonAudioConfigureContext alloc] initWithDictionary:v22];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioConfigureContext:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioPrepareContext"];
    objc_opt_class();
    v186 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[MHSchemaMHAssistantDaemonAudioPrepareContext alloc] initWithDictionary:v24];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioPrepareContext:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioPrewarmContext"];
    objc_opt_class();
    int v185 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[MHSchemaMHAssistantDaemonAudioPrewarmContext alloc] initWithDictionary:v26];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioPrewarmContext:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioStartRecordingContext"];
    objc_opt_class();
    v184 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[MHSchemaMHAssistantDaemonAudioStartRecordingContext alloc] initWithDictionary:v28];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioStartRecordingContext:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioStopRecordingContext"];
    objc_opt_class();
    v183 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[MHSchemaMHAssistantDaemonAudioStopRecordingContext alloc] initWithDictionary:v30];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioStopRecordingContext:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioSessionSetActiveContext"];
    objc_opt_class();
    int v182 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[MHSchemaMHAssistantDaemonAudioSessionSetActiveContext alloc] initWithDictionary:v32];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioSessionSetActiveContext:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioSessionSetInactiveContext"];
    objc_opt_class();
    v181 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext alloc] initWithDictionary:v34];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioSessionSetInactiveContext:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioFetchRouteContext"];
    objc_opt_class();
    v180 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[MHSchemaMHAssistantDaemonAudioFetchRouteContext alloc] initWithDictionary:v36];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioFetchRouteContext:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingContext"];
    objc_opt_class();
    int v179 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[MHSchemaMHAssistantDaemonAudioRecordingContext alloc] initWithDictionary:v38];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingContext:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingMissedBufferDetected"];
    objc_opt_class();
    v178 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected alloc] initWithDictionary:v40];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingMissedBufferDetected:v41];
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioLateBufferDetected"];
    objc_opt_class();
    v177 = (void *)v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = [[MHSchemaMHAssistantDaemonAudioLateBufferDetected alloc] initWithDictionary:v42];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioLateBufferDetected:v43];
    }
    uint64_t v44 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingFirstBufferContext"];
    objc_opt_class();
    int v176 = (void *)v44;
    if (objc_opt_isKindOfClass())
    {
      v45 = [[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext alloc] initWithDictionary:v44];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingFirstBufferContext:v45];
    }
    uint64_t v46 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingLastBufferContext"];
    objc_opt_class();
    v175 = (void *)v46;
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext alloc] initWithDictionary:v46];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingLastBufferContext:v47];
    }
    uint64_t v48 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingInterruptionContext"];
    objc_opt_class();
    v174 = (void *)v48;
    if (objc_opt_isKindOfClass())
    {
      v49 = [[MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext alloc] initWithDictionary:v48];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingInterruptionContext:v49];
    }
    uint64_t v50 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingInterruptionStartedTier1"];
    objc_opt_class();
    int v173 = (void *)v50;
    if (objc_opt_isKindOfClass())
    {
      v51 = [[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 alloc] initWithDictionary:v50];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingInterruptionStartedTier1:v51];
    }
    uint64_t v52 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioBluetoothInfo"];
    objc_opt_class();
    v172 = (void *)v52;
    if (objc_opt_isKindOfClass())
    {
      int v53 = [[MHSchemaMHAssistantDaemonAudioBluetoothInfo alloc] initWithDictionary:v52];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioBluetoothInfo:v53];
    }
    uint64_t v54 = [v4 objectForKeyedSubscript:@"voiceTriggerTwoShotDetected"];
    objc_opt_class();
    v171 = (void *)v54;
    if (objc_opt_isKindOfClass())
    {
      v55 = [[MHSchemaMHVoiceTriggerTwoShotDetected alloc] initWithDictionary:v54];
      [(MHSchemaMHClientEvent *)v5 setVoiceTriggerTwoShotDetected:v55];
    }
    uint64_t v56 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioTwoShotTransitionContext"];
    objc_opt_class();
    int v170 = (void *)v56;
    if (objc_opt_isKindOfClass())
    {
      v57 = [[MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext alloc] initWithDictionary:v56];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioTwoShotTransitionContext:v57];
    }
    uint64_t v58 = [v4 objectForKeyedSubscript:@"voiceTriggerContext"];
    objc_opt_class();
    v169 = (void *)v58;
    if (objc_opt_isKindOfClass())
    {
      int v59 = [[MHSchemaMHVoiceTriggerContext alloc] initWithDictionary:v58];
      [(MHSchemaMHClientEvent *)v5 setVoiceTriggerContext:v59];
    }
    uint64_t v60 = [v4 objectForKeyedSubscript:@"endpointDetected"];
    objc_opt_class();
    v168 = (void *)v60;
    if (objc_opt_isKindOfClass())
    {
      v61 = [[MHSchemaMHEndpointDetected alloc] initWithDictionary:v60];
      [(MHSchemaMHClientEvent *)v5 setEndpointDetected:v61];
    }
    uint64_t v62 = [v4 objectForKeyedSubscript:@"endpointLatencyInfoReported"];
    objc_opt_class();
    int v167 = (void *)v62;
    if (objc_opt_isKindOfClass())
    {
      v63 = [[MHSchemaMHEndpointLatencyInfoReported alloc] initWithDictionary:v62];
      [(MHSchemaMHClientEvent *)v5 setEndpointLatencyInfoReported:v63];
    }
    uint64_t v64 = [v4 objectForKeyedSubscript:@"adblockerContext"];
    objc_opt_class();
    v166 = (void *)v64;
    if (objc_opt_isKindOfClass())
    {
      int v65 = [[MHSchemaMHVoiceAdBlockerContext alloc] initWithDictionary:v64];
      [(MHSchemaMHClientEvent *)v5 setAdblockerContext:v65];
    }
    uint64_t v66 = [v4 objectForKeyedSubscript:@"onDeviceEndpointerContext"];
    objc_opt_class();
    v165 = (void *)v66;
    if (objc_opt_isKindOfClass())
    {
      v67 = [[MHSchemaMHOnDeviceEndpointerContext alloc] initWithDictionary:v66];
      [(MHSchemaMHClientEvent *)v5 setOnDeviceEndpointerContext:v67];
    }
    uint64_t v68 = [v4 objectForKeyedSubscript:@"serverEndpointerContext"];
    objc_opt_class();
    int v164 = (void *)v68;
    if (objc_opt_isKindOfClass())
    {
      v69 = [[MHSchemaMHServerEndpointerContext alloc] initWithDictionary:v68];
      [(MHSchemaMHClientEvent *)v5 setServerEndpointerContext:v69];
    }
    uint64_t v70 = [v4 objectForKeyedSubscript:@"endpointerUsed"];
    objc_opt_class();
    v163 = (void *)v70;
    if (objc_opt_isKindOfClass())
    {
      int v71 = [[MHSchemaMHEndpointerUsed alloc] initWithDictionary:v70];
      [(MHSchemaMHClientEvent *)v5 setEndpointerUsed:v71];
    }
    uint64_t v72 = [v4 objectForKeyedSubscript:@"endpointDelayContext"];
    objc_opt_class();
    v162 = (void *)v72;
    if (objc_opt_isKindOfClass())
    {
      v73 = [[MHSchemaMHEndpointDelayContext alloc] initWithDictionary:v72];
      [(MHSchemaMHClientEvent *)v5 setEndpointDelayContext:v73];
    }
    uint64_t v74 = [v4 objectForKeyedSubscript:@"finalMitigationRecommendation"];
    objc_opt_class();
    int v161 = (void *)v74;
    if (objc_opt_isKindOfClass())
    {
      v75 = [[MHSchemaMHMitigationDecisionRecommended alloc] initWithDictionary:v74];
      [(MHSchemaMHClientEvent *)v5 setFinalMitigationRecommendation:v75];
    }
    uint64_t v76 = [v4 objectForKeyedSubscript:@"applicationPlaybackAttempted"];
    objc_opt_class();
    v160 = (void *)v76;
    if (objc_opt_isKindOfClass())
    {
      int v77 = [[MHSchemaMHApplicationPlaybackAttempted alloc] initWithDictionary:v76];
      [(MHSchemaMHClientEvent *)v5 setApplicationPlaybackAttempted:v77];
    }
    uint64_t v78 = [v4 objectForKeyedSubscript:@"siriLaunchRequestContext"];
    objc_opt_class();
    v159 = (void *)v78;
    if (objc_opt_isKindOfClass())
    {
      v79 = [[MHSchemaMHSiriLaunchRequestContext alloc] initWithDictionary:v78];
      [(MHSchemaMHClientEvent *)v5 setSiriLaunchRequestContext:v79];
    }
    uint64_t v80 = [v4 objectForKeyedSubscript:@"endpointerAccessibleContext"];
    objc_opt_class();
    int v158 = (void *)v80;
    if (objc_opt_isKindOfClass())
    {
      v81 = [[MHSchemaMHEndpointerAccessibleContext alloc] initWithDictionary:v80];
      [(MHSchemaMHClientEvent *)v5 setEndpointerAccessibleContext:v81];
    }
    uint64_t v82 = [v4 objectForKeyedSubscript:@"carPlayLangaugeMismatched"];
    objc_opt_class();
    v157 = (void *)v82;
    if (objc_opt_isKindOfClass())
    {
      int v83 = [[MHSchemaMHCarplayLanguageMismatch alloc] initWithDictionary:v82];
      [(MHSchemaMHClientEvent *)v5 setCarPlayLangaugeMismatched:v83];
    }
    uint64_t v84 = [v4 objectForKeyedSubscript:@"darwinConnectedDeviceWakeContext"];
    objc_opt_class();
    v156 = (void *)v84;
    if (objc_opt_isKindOfClass())
    {
      v85 = [[MHSchemaMHDarwinConnectedDeviceWakeContext alloc] initWithDictionary:v84];
      [(MHSchemaMHClientEvent *)v5 setDarwinConnectedDeviceWakeContext:v85];
    }
    uint64_t v86 = [v4 objectForKeyedSubscript:@"odldFalseTriggerMitigated"];
    objc_opt_class();
    int v155 = (void *)v86;
    if (objc_opt_isKindOfClass())
    {
      v87 = [[MHSchemaMHOdldFalseTriggerMitigated alloc] initWithDictionary:v86];
      [(MHSchemaMHClientEvent *)v5 setOdldFalseTriggerMitigated:v87];
    }
    uint64_t v88 = [v4 objectForKeyedSubscript:@"speakerFalseTriggerMitigated"];
    objc_opt_class();
    v154 = (void *)v88;
    if (objc_opt_isKindOfClass())
    {
      int v89 = [[MHSchemaMHSpeakerFalseTriggerMitigated alloc] initWithDictionary:v88];
      [(MHSchemaMHClientEvent *)v5 setSpeakerFalseTriggerMitigated:v89];
    }
    uint64_t v90 = [v4 objectForKeyedSubscript:@"siriDirectedSpeechDetectionFailed"];
    objc_opt_class();
    v153 = (void *)v90;
    if (objc_opt_isKindOfClass())
    {
      v91 = [[MHSchemaMHSiriDirectedSpeechDetectionFailed alloc] initWithDictionary:v90];
      [(MHSchemaMHClientEvent *)v5 setSiriDirectedSpeechDetectionFailed:v91];
    }
    uint64_t v92 = [v4 objectForKeyedSubscript:@"audioDucked"];
    objc_opt_class();
    int v152 = (void *)v92;
    if (objc_opt_isKindOfClass())
    {
      v93 = [[MHSchemaMHAudioDucked alloc] initWithDictionary:v92];
      [(MHSchemaMHClientEvent *)v5 setAudioDucked:v93];
    }
    uint64_t v94 = [v4 objectForKeyedSubscript:@"audioRecordingFailed"];
    objc_opt_class();
    v151 = (void *)v94;
    if (objc_opt_isKindOfClass())
    {
      int v95 = [[MHSchemaMHAssistantDaemonAudioRecordingFailed alloc] initWithDictionary:v94];
      [(MHSchemaMHClientEvent *)v5 setAudioRecordingFailed:v95];
    }
    uint64_t v96 = [v4 objectForKeyedSubscript:@"rtsFalseRejectDetected"];
    objc_opt_class();
    v150 = (void *)v96;
    if (objc_opt_isKindOfClass())
    {
      v97 = [[MHSchemaMHRTSFalseRejectDetected alloc] initWithDictionary:v96];
      [(MHSchemaMHClientEvent *)v5 setRtsFalseRejectDetected:v97];
    }
    uint64_t v98 = [v4 objectForKeyedSubscript:@"trpCreated"];
    objc_opt_class();
    int v149 = (void *)v98;
    if (objc_opt_isKindOfClass())
    {
      v99 = [[MHSchemaMHTRPCreated alloc] initWithDictionary:v98];
      [(MHSchemaMHClientEvent *)v5 setTrpCreated:v99];
    }
    uint64_t v100 = [v4 objectForKeyedSubscript:@"userSpeakingContext"];
    objc_opt_class();
    v148 = (void *)v100;
    if (objc_opt_isKindOfClass())
    {
      int v101 = [[MHSchemaMHUserSpeakingContext alloc] initWithDictionary:v100];
      [(MHSchemaMHClientEvent *)v5 setUserSpeakingContext:v101];
    }
    uint64_t v102 = [v4 objectForKeyedSubscript:@"speechStopDetected"];
    objc_opt_class();
    v147 = (void *)v102;
    if (objc_opt_isKindOfClass())
    {
      v103 = [[MHSchemaMHSpeechStopDetected alloc] initWithDictionary:v102];
      [(MHSchemaMHClientEvent *)v5 setSpeechStopDetected:v103];
    }
    uint64_t v104 = [v4 objectForKeyedSubscript:@"speechDetectorContext"];
    objc_opt_class();
    int v146 = (void *)v104;
    if (objc_opt_isKindOfClass())
    {
      v105 = [[MHSchemaMHSpeechDetectorContext alloc] initWithDictionary:v104];
      [(MHSchemaMHClientEvent *)v5 setSpeechDetectorContext:v105];
    }
    uint64_t v106 = [v4 objectForKeyedSubscript:@"stoppedListeningForSpeechContinuation"];
    objc_opt_class();
    v145 = (void *)v106;
    if (objc_opt_isKindOfClass())
    {
      int v107 = [[MHSchemaMHStoppedListeningForSpeechContinuation alloc] initWithDictionary:v106];
      [(MHSchemaMHClientEvent *)v5 setStoppedListeningForSpeechContinuation:v107];
    }
    uint64_t v108 = [v4 objectForKeyedSubscript:@"userEngagementModelContext"];
    objc_opt_class();
    v144 = (void *)v108;
    if (objc_opt_isKindOfClass())
    {
      v109 = [[MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext alloc] initWithDictionary:v108];
      [(MHSchemaMHClientEvent *)v5 setUserEngagementModelContext:v109];
    }
    uint64_t v110 = [v4 objectForKeyedSubscript:@"attendingContext"];
    objc_opt_class();
    int v143 = (void *)v110;
    if (objc_opt_isKindOfClass())
    {
      v111 = [[MHSchemaMHAttendingContext alloc] initWithDictionary:v110];
      [(MHSchemaMHClientEvent *)v5 setAttendingContext:v111];
    }
    uint64_t v112 = [v4 objectForKeyedSubscript:@"crownPressed"];
    objc_opt_class();
    v142 = (void *)v112;
    if (objc_opt_isKindOfClass())
    {
      int v113 = [[MHSchemaMHCrownPressed alloc] initWithDictionary:v112];
      [(MHSchemaMHClientEvent *)v5 setCrownPressed:v113];
    }
    uint64_t v114 = [v4 objectForKeyedSubscript:@"rtsTriggered"];
    objc_opt_class();
    v141 = (void *)v114;
    if (objc_opt_isKindOfClass())
    {
      v115 = [[MHSchemaMHRaiseToSpeakTriggered alloc] initWithDictionary:v114];
      [(MHSchemaMHClientEvent *)v5 setRtsTriggered:v115];
    }
    int v140 = (void *)v6;
    uint64_t v116 = [v4 objectForKeyedSubscript:@"rtsFirstPassPolicyTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v117 = [[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered alloc] initWithDictionary:v116];
      [(MHSchemaMHClientEvent *)v5 setRtsFirstPassPolicyTriggered:v117];
    }
    int v134 = (void *)v116;
    v139 = (void *)v8;
    v118 = [v4 objectForKeyedSubscript:@"rtsSecondPassPolicyDecisionMade"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v119 = [[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade alloc] initWithDictionary:v118];
      [(MHSchemaMHClientEvent *)v5 setRtsSecondPassPolicyDecisionMade:v119];
    }
    v138 = (void *)v10;
    v120 = [v4 objectForKeyedSubscript:@"voiceProfileOnboarded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v121 = [[MHSchemaMHVoiceProfileOnboarded alloc] initWithDictionary:v120];
      [(MHSchemaMHClientEvent *)v5 setVoiceProfileOnboarded:v121];
    }
    int v137 = (void *)v12;
    int v122 = [v4 objectForKeyedSubscript:@"sensorControlStatusReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v123 = [[MHSchemaMHSensorControlStatusReported alloc] initWithDictionary:v122];
      [(MHSchemaMHClientEvent *)v5 setSensorControlStatusReported:v123];
    }
    v136 = (void *)v14;
    v124 = [v4 objectForKeyedSubscript:@"voiceTriggerRePrompted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v125 = [[MHSchemaMHVoiceTriggerRePrompted alloc] initWithDictionary:v124];
      [(MHSchemaMHClientEvent *)v5 setVoiceTriggerRePrompted:v125];
    }
    v135 = (void *)v16;
    v126 = [v4 objectForKeyedSubscript:@"assistantDaemonAudioRecordingFailureInsufficientPriority"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v127 = [[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority alloc] initWithDictionary:v126];
      [(MHSchemaMHClientEvent *)v5 setAssistantDaemonAudioRecordingFailureInsufficientPriority:v127];
    }
    int v128 = [v4 objectForKeyedSubscript:@"voiceProfileICloudSyncFinished"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v129 = [[MHSchemaMHVoiceProfileICloudSyncFinished alloc] initWithDictionary:v128];
      [(MHSchemaMHClientEvent *)v5 setVoiceProfileICloudSyncFinished:v129];
    }
    v130 = [v4 objectForKeyedSubscript:@"voiceTriggerRejectDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v131 = [[MHSchemaMHVoiceTriggerRejectDetected alloc] initWithDictionary:v130];
      [(MHSchemaMHClientEvent *)v5 setVoiceTriggerRejectDetected:v131];
    }
    v132 = v5;
  }
  return v5;
}

- (MHSchemaMHClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_acousticFalseTriggerMitigationEvaluationContext)
  {
    id v4 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"acousticFalseTriggerMitigationEvaluationContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"acousticFalseTriggerMitigationEvaluationContext"];
    }
  }
  if (self->_adblockerContext)
  {
    uint64_t v7 = [(MHSchemaMHClientEvent *)self adblockerContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"adblockerContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"adblockerContext"];
    }
  }
  if (self->_applicationPlaybackAttempted)
  {
    uint64_t v10 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"applicationPlaybackAttempted"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"applicationPlaybackAttempted"];
    }
  }
  if (self->_asrAudioConfigureStarted)
  {
    v13 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"asrAudioConfigureStarted"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"asrAudioConfigureStarted"];
    }
  }
  if (self->_assistantDaemonAudioBluetoothInfo)
  {
    uint64_t v16 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"assistantDaemonAudioBluetoothInfo"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"assistantDaemonAudioBluetoothInfo"];
    }
  }
  if (self->_assistantDaemonAudioConfigureContext)
  {
    v19 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"assistantDaemonAudioConfigureContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"assistantDaemonAudioConfigureContext"];
    }
  }
  if (self->_assistantDaemonAudioFetchRouteContext)
  {
    uint64_t v22 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"assistantDaemonAudioFetchRouteContext"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"assistantDaemonAudioFetchRouteContext"];
    }
  }
  if (self->_assistantDaemonAudioInitContext)
  {
    v25 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"assistantDaemonAudioInitContext"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"assistantDaemonAudioInitContext"];
    }
  }
  if (self->_assistantDaemonAudioLateBufferDetected)
  {
    uint64_t v28 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"assistantDaemonAudioLateBufferDetected"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"assistantDaemonAudioLateBufferDetected"];
    }
  }
  if (self->_assistantDaemonAudioPrepareContext)
  {
    v31 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"assistantDaemonAudioPrepareContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"assistantDaemonAudioPrepareContext"];
    }
  }
  if (self->_assistantDaemonAudioPrewarmContext)
  {
    uint64_t v34 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"assistantDaemonAudioPrewarmContext"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"assistantDaemonAudioPrewarmContext"];
    }
  }
  if (self->_assistantDaemonAudioRecordingContext)
  {
    v37 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"assistantDaemonAudioRecordingContext"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"assistantDaemonAudioRecordingContext"];
    }
  }
  if (self->_assistantDaemonAudioRecordingFailureInsufficientPriority)
  {
    uint64_t v40 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"assistantDaemonAudioRecordingFailureInsufficientPriority"];
    }
    else
    {
      uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"assistantDaemonAudioRecordingFailureInsufficientPriority"];
    }
  }
  if (self->_assistantDaemonAudioRecordingFirstBufferContext)
  {
    v43 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];
    uint64_t v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"assistantDaemonAudioRecordingFirstBufferContext"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"assistantDaemonAudioRecordingFirstBufferContext"];
    }
  }
  if (self->_assistantDaemonAudioRecordingInterruptionContext)
  {
    uint64_t v46 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"assistantDaemonAudioRecordingInterruptionContext"];
    }
    else
    {
      uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"assistantDaemonAudioRecordingInterruptionContext"];
    }
  }
  if (self->_assistantDaemonAudioRecordingInterruptionStartedTier1)
  {
    v49 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];
    uint64_t v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"assistantDaemonAudioRecordingInterruptionStartedTier1"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"assistantDaemonAudioRecordingInterruptionStartedTier1"];
    }
  }
  if (self->_assistantDaemonAudioRecordingLastBufferContext)
  {
    uint64_t v52 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"assistantDaemonAudioRecordingLastBufferContext"];
    }
    else
    {
      uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"assistantDaemonAudioRecordingLastBufferContext"];
    }
  }
  if (self->_assistantDaemonAudioRecordingMissedBufferDetected)
  {
    v55 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];
    uint64_t v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"assistantDaemonAudioRecordingMissedBufferDetected"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"assistantDaemonAudioRecordingMissedBufferDetected"];
    }
  }
  if (self->_assistantDaemonAudioSessionSetActiveContext)
  {
    uint64_t v58 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"assistantDaemonAudioSessionSetActiveContext"];
    }
    else
    {
      uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"assistantDaemonAudioSessionSetActiveContext"];
    }
  }
  if (self->_assistantDaemonAudioSessionSetInactiveContext)
  {
    v61 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];
    uint64_t v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"assistantDaemonAudioSessionSetInactiveContext"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"assistantDaemonAudioSessionSetInactiveContext"];
    }
  }
  if (self->_assistantDaemonAudioStartRecordingContext)
  {
    uint64_t v64 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"assistantDaemonAudioStartRecordingContext"];
    }
    else
    {
      uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"assistantDaemonAudioStartRecordingContext"];
    }
  }
  if (self->_assistantDaemonAudioStopRecordingContext)
  {
    v67 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];
    uint64_t v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"assistantDaemonAudioStopRecordingContext"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"assistantDaemonAudioStopRecordingContext"];
    }
  }
  if (self->_assistantDaemonAudioTwoShotTransitionContext)
  {
    uint64_t v70 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"assistantDaemonAudioTwoShotTransitionContext"];
    }
    else
    {
      uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"assistantDaemonAudioTwoShotTransitionContext"];
    }
  }
  if (self->_attendingContext)
  {
    v73 = [(MHSchemaMHClientEvent *)self attendingContext];
    uint64_t v74 = [v73 dictionaryRepresentation];
    if (v74)
    {
      [v3 setObject:v74 forKeyedSubscript:@"attendingContext"];
    }
    else
    {
      v75 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v75 forKeyedSubscript:@"attendingContext"];
    }
  }
  if (self->_audioDucked)
  {
    uint64_t v76 = [(MHSchemaMHClientEvent *)self audioDucked];
    int v77 = [v76 dictionaryRepresentation];
    if (v77)
    {
      [v3 setObject:v77 forKeyedSubscript:@"audioDucked"];
    }
    else
    {
      uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v78 forKeyedSubscript:@"audioDucked"];
    }
  }
  if (self->_audioRecordingFailed)
  {
    v79 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];
    uint64_t v80 = [v79 dictionaryRepresentation];
    if (v80)
    {
      [v3 setObject:v80 forKeyedSubscript:@"audioRecordingFailed"];
    }
    else
    {
      v81 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v81 forKeyedSubscript:@"audioRecordingFailed"];
    }
  }
  if (self->_carPlayLangaugeMismatched)
  {
    uint64_t v82 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];
    int v83 = [v82 dictionaryRepresentation];
    if (v83)
    {
      [v3 setObject:v83 forKeyedSubscript:@"carPlayLangaugeMismatched"];
    }
    else
    {
      uint64_t v84 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v84 forKeyedSubscript:@"carPlayLangaugeMismatched"];
    }
  }
  if (self->_coreSpeechPreprocessorCompleted)
  {
    v85 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];
    uint64_t v86 = [v85 dictionaryRepresentation];
    if (v86)
    {
      [v3 setObject:v86 forKeyedSubscript:@"coreSpeechPreprocessorCompleted"];
    }
    else
    {
      v87 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v87 forKeyedSubscript:@"coreSpeechPreprocessorCompleted"];
    }
  }
  if (self->_crownPressed)
  {
    uint64_t v88 = [(MHSchemaMHClientEvent *)self crownPressed];
    int v89 = [v88 dictionaryRepresentation];
    if (v89)
    {
      [v3 setObject:v89 forKeyedSubscript:@"crownPressed"];
    }
    else
    {
      uint64_t v90 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v90 forKeyedSubscript:@"crownPressed"];
    }
  }
  if (self->_darwinConnectedDeviceWakeContext)
  {
    v91 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];
    uint64_t v92 = [v91 dictionaryRepresentation];
    if (v92)
    {
      [v3 setObject:v92 forKeyedSubscript:@"darwinConnectedDeviceWakeContext"];
    }
    else
    {
      v93 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v93 forKeyedSubscript:@"darwinConnectedDeviceWakeContext"];
    }
  }
  if (self->_endpointDelayContext)
  {
    uint64_t v94 = [(MHSchemaMHClientEvent *)self endpointDelayContext];
    int v95 = [v94 dictionaryRepresentation];
    if (v95)
    {
      [v3 setObject:v95 forKeyedSubscript:@"endpointDelayContext"];
    }
    else
    {
      uint64_t v96 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v96 forKeyedSubscript:@"endpointDelayContext"];
    }
  }
  if (self->_endpointDetected)
  {
    v97 = [(MHSchemaMHClientEvent *)self endpointDetected];
    uint64_t v98 = [v97 dictionaryRepresentation];
    if (v98)
    {
      [v3 setObject:v98 forKeyedSubscript:@"endpointDetected"];
    }
    else
    {
      v99 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v99 forKeyedSubscript:@"endpointDetected"];
    }
  }
  if (self->_endpointLatencyInfoReported)
  {
    uint64_t v100 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];
    int v101 = [v100 dictionaryRepresentation];
    if (v101)
    {
      [v3 setObject:v101 forKeyedSubscript:@"endpointLatencyInfoReported"];
    }
    else
    {
      uint64_t v102 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v102 forKeyedSubscript:@"endpointLatencyInfoReported"];
    }
  }
  if (self->_endpointerAccessibleContext)
  {
    v103 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];
    uint64_t v104 = [v103 dictionaryRepresentation];
    if (v104)
    {
      [v3 setObject:v104 forKeyedSubscript:@"endpointerAccessibleContext"];
    }
    else
    {
      v105 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v105 forKeyedSubscript:@"endpointerAccessibleContext"];
    }
  }
  if (self->_endpointerUsed)
  {
    uint64_t v106 = [(MHSchemaMHClientEvent *)self endpointerUsed];
    int v107 = [v106 dictionaryRepresentation];
    if (v107)
    {
      [v3 setObject:v107 forKeyedSubscript:@"endpointerUsed"];
    }
    else
    {
      uint64_t v108 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v108 forKeyedSubscript:@"endpointerUsed"];
    }
  }
  if (self->_eventMetadata)
  {
    v109 = [(MHSchemaMHClientEvent *)self eventMetadata];
    uint64_t v110 = [v109 dictionaryRepresentation];
    if (v110)
    {
      [v3 setObject:v110 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v111 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v111 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_finalMitigationRecommendation)
  {
    uint64_t v112 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];
    int v113 = [v112 dictionaryRepresentation];
    if (v113)
    {
      [v3 setObject:v113 forKeyedSubscript:@"finalMitigationRecommendation"];
    }
    else
    {
      uint64_t v114 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v114 forKeyedSubscript:@"finalMitigationRecommendation"];
    }
  }
  if (self->_latticeFalseTriggerMitigationEvaluationContext)
  {
    v115 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];
    uint64_t v116 = [v115 dictionaryRepresentation];
    if (v116)
    {
      [v3 setObject:v116 forKeyedSubscript:@"latticeFalseTriggerMitigationEvaluationContext"];
    }
    else
    {
      v117 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v117 forKeyedSubscript:@"latticeFalseTriggerMitigationEvaluationContext"];
    }
  }
  if (self->_mhId)
  {
    v118 = [(MHSchemaMHClientEvent *)self mhId];
    int v119 = [v118 dictionaryRepresentation];
    if (v119)
    {
      [v3 setObject:v119 forKeyedSubscript:@"mhId"];
    }
    else
    {
      v120 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v120 forKeyedSubscript:@"mhId"];
    }
  }
  if (self->_odldFalseTriggerMitigated)
  {
    v121 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];
    int v122 = [v121 dictionaryRepresentation];
    if (v122)
    {
      [v3 setObject:v122 forKeyedSubscript:@"odldFalseTriggerMitigated"];
    }
    else
    {
      v123 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v123 forKeyedSubscript:@"odldFalseTriggerMitigated"];
    }
  }
  if (self->_onDeviceEndpointerContext)
  {
    v124 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];
    int v125 = [v124 dictionaryRepresentation];
    if (v125)
    {
      [v3 setObject:v125 forKeyedSubscript:@"onDeviceEndpointerContext"];
    }
    else
    {
      v126 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v126 forKeyedSubscript:@"onDeviceEndpointerContext"];
    }
  }
  if (self->_rtsFalseRejectDetected)
  {
    v127 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];
    int v128 = [v127 dictionaryRepresentation];
    if (v128)
    {
      [v3 setObject:v128 forKeyedSubscript:@"rtsFalseRejectDetected"];
    }
    else
    {
      v129 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v129 forKeyedSubscript:@"rtsFalseRejectDetected"];
    }
  }
  if (self->_rtsFirstPassPolicyTriggered)
  {
    v130 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];
    int v131 = [v130 dictionaryRepresentation];
    if (v131)
    {
      [v3 setObject:v131 forKeyedSubscript:@"rtsFirstPassPolicyTriggered"];
    }
    else
    {
      v132 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v132 forKeyedSubscript:@"rtsFirstPassPolicyTriggered"];
    }
  }
  if (self->_rtsSecondPassPolicyDecisionMade)
  {
    v133 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];
    int v134 = [v133 dictionaryRepresentation];
    if (v134)
    {
      [v3 setObject:v134 forKeyedSubscript:@"rtsSecondPassPolicyDecisionMade"];
    }
    else
    {
      v135 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v135 forKeyedSubscript:@"rtsSecondPassPolicyDecisionMade"];
    }
  }
  if (self->_rtsTriggered)
  {
    v136 = [(MHSchemaMHClientEvent *)self rtsTriggered];
    int v137 = [v136 dictionaryRepresentation];
    if (v137)
    {
      [v3 setObject:v137 forKeyedSubscript:@"rtsTriggered"];
    }
    else
    {
      v138 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v138 forKeyedSubscript:@"rtsTriggered"];
    }
  }
  if (self->_sensorControlStatusReported)
  {
    v139 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];
    int v140 = [v139 dictionaryRepresentation];
    if (v140)
    {
      [v3 setObject:v140 forKeyedSubscript:@"sensorControlStatusReported"];
    }
    else
    {
      v141 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v141 forKeyedSubscript:@"sensorControlStatusReported"];
    }
  }
  if (self->_serverEndpointerContext)
  {
    v142 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];
    int v143 = [v142 dictionaryRepresentation];
    if (v143)
    {
      [v3 setObject:v143 forKeyedSubscript:@"serverEndpointerContext"];
    }
    else
    {
      v144 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v144 forKeyedSubscript:@"serverEndpointerContext"];
    }
  }
  if (self->_siriDirectedSpeechDetectionFailed)
  {
    v145 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];
    int v146 = [v145 dictionaryRepresentation];
    if (v146)
    {
      [v3 setObject:v146 forKeyedSubscript:@"siriDirectedSpeechDetectionFailed"];
    }
    else
    {
      v147 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v147 forKeyedSubscript:@"siriDirectedSpeechDetectionFailed"];
    }
  }
  if (self->_siriLaunchRequestContext)
  {
    v148 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];
    int v149 = [v148 dictionaryRepresentation];
    if (v149)
    {
      [v3 setObject:v149 forKeyedSubscript:@"siriLaunchRequestContext"];
    }
    else
    {
      v150 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v150 forKeyedSubscript:@"siriLaunchRequestContext"];
    }
  }
  if (self->_speakerFalseTriggerMitigated)
  {
    v151 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];
    int v152 = [v151 dictionaryRepresentation];
    if (v152)
    {
      [v3 setObject:v152 forKeyedSubscript:@"speakerFalseTriggerMitigated"];
    }
    else
    {
      v153 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v153 forKeyedSubscript:@"speakerFalseTriggerMitigated"];
    }
  }
  if (self->_speechDetectorContext)
  {
    v154 = [(MHSchemaMHClientEvent *)self speechDetectorContext];
    int v155 = [v154 dictionaryRepresentation];
    if (v155)
    {
      [v3 setObject:v155 forKeyedSubscript:@"speechDetectorContext"];
    }
    else
    {
      v156 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v156 forKeyedSubscript:@"speechDetectorContext"];
    }
  }
  if (self->_speechStopDetected)
  {
    v157 = [(MHSchemaMHClientEvent *)self speechStopDetected];
    int v158 = [v157 dictionaryRepresentation];
    if (v158)
    {
      [v3 setObject:v158 forKeyedSubscript:@"speechStopDetected"];
    }
    else
    {
      v159 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v159 forKeyedSubscript:@"speechStopDetected"];
    }
  }
  if (self->_stoppedListeningForSpeechContinuation)
  {
    v160 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];
    int v161 = [v160 dictionaryRepresentation];
    if (v161)
    {
      [v3 setObject:v161 forKeyedSubscript:@"stoppedListeningForSpeechContinuation"];
    }
    else
    {
      v162 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v162 forKeyedSubscript:@"stoppedListeningForSpeechContinuation"];
    }
  }
  if (self->_trpCreated)
  {
    v163 = [(MHSchemaMHClientEvent *)self trpCreated];
    int v164 = [v163 dictionaryRepresentation];
    if (v164)
    {
      [v3 setObject:v164 forKeyedSubscript:@"trpCreated"];
    }
    else
    {
      v165 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v165 forKeyedSubscript:@"trpCreated"];
    }
  }
  if (self->_unintendedResponseSuppressionExecutionContext)
  {
    v166 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];
    int v167 = [v166 dictionaryRepresentation];
    if (v167)
    {
      [v3 setObject:v167 forKeyedSubscript:@"unintendedResponseSuppressionExecutionContext"];
    }
    else
    {
      v168 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v168 forKeyedSubscript:@"unintendedResponseSuppressionExecutionContext"];
    }
  }
  if (self->_userEngagementModelContext)
  {
    v169 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];
    int v170 = [v169 dictionaryRepresentation];
    if (v170)
    {
      [v3 setObject:v170 forKeyedSubscript:@"userEngagementModelContext"];
    }
    else
    {
      v171 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v171 forKeyedSubscript:@"userEngagementModelContext"];
    }
  }
  if (self->_userSpeakingContext)
  {
    v172 = [(MHSchemaMHClientEvent *)self userSpeakingContext];
    int v173 = [v172 dictionaryRepresentation];
    if (v173)
    {
      [v3 setObject:v173 forKeyedSubscript:@"userSpeakingContext"];
    }
    else
    {
      v174 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v174 forKeyedSubscript:@"userSpeakingContext"];
    }
  }
  if (self->_voiceProfileICloudSyncFinished)
  {
    v175 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];
    int v176 = [v175 dictionaryRepresentation];
    if (v176)
    {
      [v3 setObject:v176 forKeyedSubscript:@"voiceProfileICloudSyncFinished"];
    }
    else
    {
      v177 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v177 forKeyedSubscript:@"voiceProfileICloudSyncFinished"];
    }
  }
  if (self->_voiceProfileOnboarded)
  {
    v178 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];
    int v179 = [v178 dictionaryRepresentation];
    if (v179)
    {
      [v3 setObject:v179 forKeyedSubscript:@"voiceProfileOnboarded"];
    }
    else
    {
      v180 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v180 forKeyedSubscript:@"voiceProfileOnboarded"];
    }
  }
  if (self->_voiceTriggerContext)
  {
    v181 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];
    int v182 = [v181 dictionaryRepresentation];
    if (v182)
    {
      [v3 setObject:v182 forKeyedSubscript:@"voiceTriggerContext"];
    }
    else
    {
      v183 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v183 forKeyedSubscript:@"voiceTriggerContext"];
    }
  }
  if (self->_voiceTriggerRePrompted)
  {
    v184 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];
    int v185 = [v184 dictionaryRepresentation];
    if (v185)
    {
      [v3 setObject:v185 forKeyedSubscript:@"voiceTriggerRePrompted"];
    }
    else
    {
      v186 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v186 forKeyedSubscript:@"voiceTriggerRePrompted"];
    }
  }
  if (self->_voiceTriggerRejectDetected)
  {
    v187 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];
    int v188 = [v187 dictionaryRepresentation];
    if (v188)
    {
      [v3 setObject:v188 forKeyedSubscript:@"voiceTriggerRejectDetected"];
    }
    else
    {
      v189 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v189 forKeyedSubscript:@"voiceTriggerRejectDetected"];
    }
  }
  if (self->_voiceTriggerTwoShotDetected)
  {
    objc_super v190 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];
    int v191 = [v190 dictionaryRepresentation];
    if (v191)
    {
      [v3 setObject:v191 forKeyedSubscript:@"voiceTriggerTwoShotDetected"];
    }
    else
    {
      v192 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v192 forKeyedSubscript:@"voiceTriggerTwoShotDetected"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v193 = v3;

  return v193;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_mhId hash];
  unint64_t v4 = [(MHSchemaMHClientEventMetadata *)self->_eventMetadata hash] ^ v3;
  unint64_t v5 = [(MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *)self->_acousticFalseTriggerMitigationEvaluationContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *)self->_latticeFalseTriggerMitigationEvaluationContext hash];
  unint64_t v7 = [(MHSchemaMHUnintendedResponseSuppressionEvaluationContext *)self->_unintendedResponseSuppressionExecutionContext hash];
  unint64_t v8 = v7 ^ [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self->_coreSpeechPreprocessorCompleted hash];
  unint64_t v9 = v6 ^ v8 ^ [(MHSchemaMHASRAudioConfigureStarted *)self->_asrAudioConfigureStarted hash];
  unint64_t v10 = [(MHSchemaMHAssistantDaemonAudioInitContext *)self->_assistantDaemonAudioInitContext hash];
  unint64_t v11 = v10 ^ [(MHSchemaMHAssistantDaemonAudioConfigureContext *)self->_assistantDaemonAudioConfigureContext hash];
  unint64_t v12 = v11 ^ [(MHSchemaMHAssistantDaemonAudioPrepareContext *)self->_assistantDaemonAudioPrepareContext hash];
  unint64_t v13 = v9 ^ v12 ^ [(MHSchemaMHAssistantDaemonAudioPrewarmContext *)self->_assistantDaemonAudioPrewarmContext hash];
  unint64_t v14 = [(MHSchemaMHAssistantDaemonAudioStartRecordingContext *)self->_assistantDaemonAudioStartRecordingContext hash];
  unint64_t v15 = v14 ^ [(MHSchemaMHAssistantDaemonAudioStopRecordingContext *)self->_assistantDaemonAudioStopRecordingContext hash];
  unint64_t v16 = v15 ^ [(MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *)self->_assistantDaemonAudioSessionSetActiveContext hash];
  unint64_t v17 = v16 ^ [(MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *)self->_assistantDaemonAudioSessionSetInactiveContext hash];
  unint64_t v18 = v13 ^ v17 ^ [(MHSchemaMHAssistantDaemonAudioFetchRouteContext *)self->_assistantDaemonAudioFetchRouteContext hash];
  unint64_t v19 = [(MHSchemaMHAssistantDaemonAudioRecordingContext *)self->_assistantDaemonAudioRecordingContext hash];
  unint64_t v20 = v19 ^ [(MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *)self->_assistantDaemonAudioRecordingMissedBufferDetected hash];
  unint64_t v21 = v20 ^ [(MHSchemaMHAssistantDaemonAudioLateBufferDetected *)self->_assistantDaemonAudioLateBufferDetected hash];
  unint64_t v22 = v21 ^ [(MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *)self->_assistantDaemonAudioRecordingFirstBufferContext hash];
  unint64_t v23 = v22 ^ [(MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *)self->_assistantDaemonAudioRecordingLastBufferContext hash];
  unint64_t v24 = v18 ^ v23 ^ [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *)self->_assistantDaemonAudioRecordingInterruptionContext hash];
  unint64_t v25 = [(MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)self->_assistantDaemonAudioRecordingInterruptionStartedTier1 hash];
  unint64_t v26 = v25 ^ [(MHSchemaMHAssistantDaemonAudioBluetoothInfo *)self->_assistantDaemonAudioBluetoothInfo hash];
  unint64_t v27 = v26 ^ [(MHSchemaMHVoiceTriggerTwoShotDetected *)self->_voiceTriggerTwoShotDetected hash];
  unint64_t v28 = v27 ^ [(MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *)self->_assistantDaemonAudioTwoShotTransitionContext hash];
  unint64_t v29 = v28 ^ [(MHSchemaMHVoiceTriggerContext *)self->_voiceTriggerContext hash];
  unint64_t v30 = v29 ^ [(MHSchemaMHEndpointDetected *)self->_endpointDetected hash];
  unint64_t v31 = v24 ^ v30 ^ [(MHSchemaMHEndpointLatencyInfoReported *)self->_endpointLatencyInfoReported hash];
  unint64_t v32 = [(MHSchemaMHVoiceAdBlockerContext *)self->_adblockerContext hash];
  unint64_t v33 = v32 ^ [(MHSchemaMHOnDeviceEndpointerContext *)self->_onDeviceEndpointerContext hash];
  unint64_t v34 = v33 ^ [(MHSchemaMHServerEndpointerContext *)self->_serverEndpointerContext hash];
  unint64_t v35 = v34 ^ [(MHSchemaMHEndpointerUsed *)self->_endpointerUsed hash];
  unint64_t v36 = v35 ^ [(MHSchemaMHEndpointDelayContext *)self->_endpointDelayContext hash];
  unint64_t v37 = v36 ^ [(MHSchemaMHMitigationDecisionRecommended *)self->_finalMitigationRecommendation hash];
  unint64_t v38 = v37 ^ [(MHSchemaMHApplicationPlaybackAttempted *)self->_applicationPlaybackAttempted hash];
  unint64_t v39 = v31 ^ v38 ^ [(MHSchemaMHSiriLaunchRequestContext *)self->_siriLaunchRequestContext hash];
  unint64_t v40 = [(MHSchemaMHEndpointerAccessibleContext *)self->_endpointerAccessibleContext hash];
  unint64_t v41 = v40 ^ [(MHSchemaMHCarplayLanguageMismatch *)self->_carPlayLangaugeMismatched hash];
  unint64_t v42 = v41 ^ [(MHSchemaMHDarwinConnectedDeviceWakeContext *)self->_darwinConnectedDeviceWakeContext hash];
  unint64_t v43 = v42 ^ [(MHSchemaMHOdldFalseTriggerMitigated *)self->_odldFalseTriggerMitigated hash];
  unint64_t v44 = v43 ^ [(MHSchemaMHSpeakerFalseTriggerMitigated *)self->_speakerFalseTriggerMitigated hash];
  unint64_t v45 = v44 ^ [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self->_siriDirectedSpeechDetectionFailed hash];
  unint64_t v46 = v45 ^ [(MHSchemaMHAudioDucked *)self->_audioDucked hash];
  unint64_t v47 = v46 ^ [(MHSchemaMHAssistantDaemonAudioRecordingFailed *)self->_audioRecordingFailed hash];
  unint64_t v48 = v39 ^ v47 ^ [(MHSchemaMHRTSFalseRejectDetected *)self->_rtsFalseRejectDetected hash];
  unint64_t v49 = [(MHSchemaMHTRPCreated *)self->_trpCreated hash];
  unint64_t v50 = v49 ^ [(MHSchemaMHUserSpeakingContext *)self->_userSpeakingContext hash];
  unint64_t v51 = v50 ^ [(MHSchemaMHSpeechStopDetected *)self->_speechStopDetected hash];
  unint64_t v52 = v51 ^ [(MHSchemaMHSpeechDetectorContext *)self->_speechDetectorContext hash];
  unint64_t v53 = v52 ^ [(MHSchemaMHStoppedListeningForSpeechContinuation *)self->_stoppedListeningForSpeechContinuation hash];
  unint64_t v54 = v53 ^ [(MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *)self->_userEngagementModelContext hash];
  unint64_t v55 = v54 ^ [(MHSchemaMHAttendingContext *)self->_attendingContext hash];
  unint64_t v56 = v55 ^ [(MHSchemaMHCrownPressed *)self->_crownPressed hash];
  unint64_t v57 = v56 ^ [(MHSchemaMHRaiseToSpeakTriggered *)self->_rtsTriggered hash];
  unint64_t v58 = v48 ^ v57 ^ [(MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *)self->_rtsFirstPassPolicyTriggered hash];
  unint64_t v59 = [(MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *)self->_rtsSecondPassPolicyDecisionMade hash];
  unint64_t v60 = v59 ^ [(MHSchemaMHVoiceProfileOnboarded *)self->_voiceProfileOnboarded hash];
  unint64_t v61 = v60 ^ [(MHSchemaMHSensorControlStatusReported *)self->_sensorControlStatusReported hash];
  unint64_t v62 = v61 ^ [(MHSchemaMHVoiceTriggerRePrompted *)self->_voiceTriggerRePrompted hash];
  unint64_t v63 = v62 ^ [(MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)self->_assistantDaemonAudioRecordingFailureInsufficientPriority hash];
  unint64_t v64 = v63 ^ [(MHSchemaMHVoiceProfileICloudSyncFinished *)self->_voiceProfileICloudSyncFinished hash];
  return v58 ^ v64 ^ [(MHSchemaMHVoiceTriggerRejectDetected *)self->_voiceTriggerRejectDetected hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_318;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_318;
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self mhId];
  unint64_t v7 = [v4 mhId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v8 = [(MHSchemaMHClientEvent *)self mhId];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(MHSchemaMHClientEvent *)self mhId];
    unint64_t v11 = [v4 mhId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v13 = [(MHSchemaMHClientEvent *)self eventMetadata];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(MHSchemaMHClientEvent *)self eventMetadata];
    unint64_t v16 = [v4 eventMetadata];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];
  unint64_t v7 = [v4 acousticFalseTriggerMitigationEvaluationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v18 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];
    unint64_t v21 = [v4 acousticFalseTriggerMitigationEvaluationContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];
  unint64_t v7 = [v4 latticeFalseTriggerMitigationEvaluationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v23 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    unint64_t v25 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];
    unint64_t v26 = [v4 latticeFalseTriggerMitigationEvaluationContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];
  unint64_t v7 = [v4 unintendedResponseSuppressionExecutionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v28 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];
  if (v28)
  {
    unint64_t v29 = (void *)v28;
    unint64_t v30 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];
    unint64_t v31 = [v4 unintendedResponseSuppressionExecutionContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];
  unint64_t v7 = [v4 coreSpeechPreprocessorCompleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v33 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];
  if (v33)
  {
    unint64_t v34 = (void *)v33;
    unint64_t v35 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];
    unint64_t v36 = [v4 coreSpeechPreprocessorCompleted];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];
  unint64_t v7 = [v4 asrAudioConfigureStarted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v38 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];
  if (v38)
  {
    unint64_t v39 = (void *)v38;
    unint64_t v40 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];
    unint64_t v41 = [v4 asrAudioConfigureStarted];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];
  unint64_t v7 = [v4 assistantDaemonAudioInitContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v43 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];
  if (v43)
  {
    unint64_t v44 = (void *)v43;
    unint64_t v45 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];
    unint64_t v46 = [v4 assistantDaemonAudioInitContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];
  unint64_t v7 = [v4 assistantDaemonAudioConfigureContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v48 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];
  if (v48)
  {
    unint64_t v49 = (void *)v48;
    unint64_t v50 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];
    unint64_t v51 = [v4 assistantDaemonAudioConfigureContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];
  unint64_t v7 = [v4 assistantDaemonAudioPrepareContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v53 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];
  if (v53)
  {
    unint64_t v54 = (void *)v53;
    unint64_t v55 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];
    unint64_t v56 = [v4 assistantDaemonAudioPrepareContext];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];
  unint64_t v7 = [v4 assistantDaemonAudioPrewarmContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v58 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];
  if (v58)
  {
    unint64_t v59 = (void *)v58;
    unint64_t v60 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];
    unint64_t v61 = [v4 assistantDaemonAudioPrewarmContext];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];
  unint64_t v7 = [v4 assistantDaemonAudioStartRecordingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v63 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];
  if (v63)
  {
    unint64_t v64 = (void *)v63;
    int v65 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];
    uint64_t v66 = [v4 assistantDaemonAudioStartRecordingContext];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];
  unint64_t v7 = [v4 assistantDaemonAudioStopRecordingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v68 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];
  if (v68)
  {
    v69 = (void *)v68;
    uint64_t v70 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];
    int v71 = [v4 assistantDaemonAudioStopRecordingContext];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];
  unint64_t v7 = [v4 assistantDaemonAudioSessionSetActiveContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v73 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];
  if (v73)
  {
    uint64_t v74 = (void *)v73;
    v75 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];
    uint64_t v76 = [v4 assistantDaemonAudioSessionSetActiveContext];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];
  unint64_t v7 = [v4 assistantDaemonAudioSessionSetInactiveContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v78 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];
  if (v78)
  {
    v79 = (void *)v78;
    uint64_t v80 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];
    v81 = [v4 assistantDaemonAudioSessionSetInactiveContext];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];
  unint64_t v7 = [v4 assistantDaemonAudioFetchRouteContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v83 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];
  if (v83)
  {
    uint64_t v84 = (void *)v83;
    v85 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];
    uint64_t v86 = [v4 assistantDaemonAudioFetchRouteContext];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v88 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];
  if (v88)
  {
    int v89 = (void *)v88;
    uint64_t v90 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];
    v91 = [v4 assistantDaemonAudioRecordingContext];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingMissedBufferDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v93 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];
  if (v93)
  {
    uint64_t v94 = (void *)v93;
    int v95 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];
    uint64_t v96 = [v4 assistantDaemonAudioRecordingMissedBufferDetected];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];
  unint64_t v7 = [v4 assistantDaemonAudioLateBufferDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v98 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];
  if (v98)
  {
    v99 = (void *)v98;
    uint64_t v100 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];
    int v101 = [v4 assistantDaemonAudioLateBufferDetected];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingFirstBufferContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v103 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];
  if (v103)
  {
    uint64_t v104 = (void *)v103;
    v105 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];
    uint64_t v106 = [v4 assistantDaemonAudioRecordingFirstBufferContext];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingLastBufferContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v108 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];
  if (v108)
  {
    v109 = (void *)v108;
    uint64_t v110 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];
    v111 = [v4 assistantDaemonAudioRecordingLastBufferContext];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingInterruptionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v113 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];
  if (v113)
  {
    uint64_t v114 = (void *)v113;
    v115 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];
    uint64_t v116 = [v4 assistantDaemonAudioRecordingInterruptionContext];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingInterruptionStartedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v118 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];
  if (v118)
  {
    int v119 = (void *)v118;
    v120 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];
    v121 = [v4 assistantDaemonAudioRecordingInterruptionStartedTier1];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];
  unint64_t v7 = [v4 assistantDaemonAudioBluetoothInfo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v123 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];
  if (v123)
  {
    v124 = (void *)v123;
    int v125 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];
    v126 = [v4 assistantDaemonAudioBluetoothInfo];
    int v127 = [v125 isEqual:v126];

    if (!v127) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];
  unint64_t v7 = [v4 voiceTriggerTwoShotDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v128 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];
  if (v128)
  {
    v129 = (void *)v128;
    v130 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];
    int v131 = [v4 voiceTriggerTwoShotDetected];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];
  unint64_t v7 = [v4 assistantDaemonAudioTwoShotTransitionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v133 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];
  if (v133)
  {
    int v134 = (void *)v133;
    v135 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];
    v136 = [v4 assistantDaemonAudioTwoShotTransitionContext];
    int v137 = [v135 isEqual:v136];

    if (!v137) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];
  unint64_t v7 = [v4 voiceTriggerContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v138 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];
  if (v138)
  {
    v139 = (void *)v138;
    int v140 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];
    v141 = [v4 voiceTriggerContext];
    int v142 = [v140 isEqual:v141];

    if (!v142) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self endpointDetected];
  unint64_t v7 = [v4 endpointDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v143 = [(MHSchemaMHClientEvent *)self endpointDetected];
  if (v143)
  {
    v144 = (void *)v143;
    v145 = [(MHSchemaMHClientEvent *)self endpointDetected];
    int v146 = [v4 endpointDetected];
    int v147 = [v145 isEqual:v146];

    if (!v147) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];
  unint64_t v7 = [v4 endpointLatencyInfoReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v148 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];
  if (v148)
  {
    int v149 = (void *)v148;
    v150 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];
    v151 = [v4 endpointLatencyInfoReported];
    int v152 = [v150 isEqual:v151];

    if (!v152) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self adblockerContext];
  unint64_t v7 = [v4 adblockerContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v153 = [(MHSchemaMHClientEvent *)self adblockerContext];
  if (v153)
  {
    v154 = (void *)v153;
    int v155 = [(MHSchemaMHClientEvent *)self adblockerContext];
    v156 = [v4 adblockerContext];
    int v157 = [v155 isEqual:v156];

    if (!v157) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];
  unint64_t v7 = [v4 onDeviceEndpointerContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v158 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];
  if (v158)
  {
    v159 = (void *)v158;
    v160 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];
    int v161 = [v4 onDeviceEndpointerContext];
    int v162 = [v160 isEqual:v161];

    if (!v162) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];
  unint64_t v7 = [v4 serverEndpointerContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v163 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];
  if (v163)
  {
    int v164 = (void *)v163;
    v165 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];
    v166 = [v4 serverEndpointerContext];
    int v167 = [v165 isEqual:v166];

    if (!v167) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self endpointerUsed];
  unint64_t v7 = [v4 endpointerUsed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v168 = [(MHSchemaMHClientEvent *)self endpointerUsed];
  if (v168)
  {
    v169 = (void *)v168;
    int v170 = [(MHSchemaMHClientEvent *)self endpointerUsed];
    v171 = [v4 endpointerUsed];
    int v172 = [v170 isEqual:v171];

    if (!v172) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self endpointDelayContext];
  unint64_t v7 = [v4 endpointDelayContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v173 = [(MHSchemaMHClientEvent *)self endpointDelayContext];
  if (v173)
  {
    v174 = (void *)v173;
    v175 = [(MHSchemaMHClientEvent *)self endpointDelayContext];
    int v176 = [v4 endpointDelayContext];
    int v177 = [v175 isEqual:v176];

    if (!v177) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];
  unint64_t v7 = [v4 finalMitigationRecommendation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v178 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];
  if (v178)
  {
    int v179 = (void *)v178;
    v180 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];
    v181 = [v4 finalMitigationRecommendation];
    int v182 = [v180 isEqual:v181];

    if (!v182) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];
  unint64_t v7 = [v4 applicationPlaybackAttempted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v183 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];
  if (v183)
  {
    v184 = (void *)v183;
    int v185 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];
    v186 = [v4 applicationPlaybackAttempted];
    int v187 = [v185 isEqual:v186];

    if (!v187) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];
  unint64_t v7 = [v4 siriLaunchRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v188 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];
  if (v188)
  {
    v189 = (void *)v188;
    objc_super v190 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];
    int v191 = [v4 siriLaunchRequestContext];
    int v192 = [v190 isEqual:v191];

    if (!v192) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];
  unint64_t v7 = [v4 endpointerAccessibleContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v193 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];
  if (v193)
  {
    int v194 = (void *)v193;
    id v195 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];
    v196 = [v4 endpointerAccessibleContext];
    int v197 = [v195 isEqual:v196];

    if (!v197) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];
  unint64_t v7 = [v4 carPlayLangaugeMismatched];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v198 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];
  if (v198)
  {
    v199 = (void *)v198;
    v200 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];
    v201 = [v4 carPlayLangaugeMismatched];
    int v202 = [v200 isEqual:v201];

    if (!v202) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];
  unint64_t v7 = [v4 darwinConnectedDeviceWakeContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v203 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];
  if (v203)
  {
    v204 = (void *)v203;
    v205 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];
    v206 = [v4 darwinConnectedDeviceWakeContext];
    int v207 = [v205 isEqual:v206];

    if (!v207) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];
  unint64_t v7 = [v4 odldFalseTriggerMitigated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v208 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];
  if (v208)
  {
    v209 = (void *)v208;
    v210 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];
    v211 = [v4 odldFalseTriggerMitigated];
    int v212 = [v210 isEqual:v211];

    if (!v212) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];
  unint64_t v7 = [v4 speakerFalseTriggerMitigated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v213 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];
  if (v213)
  {
    v214 = (void *)v213;
    v215 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];
    v216 = [v4 speakerFalseTriggerMitigated];
    int v217 = [v215 isEqual:v216];

    if (!v217) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];
  unint64_t v7 = [v4 siriDirectedSpeechDetectionFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v218 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];
  if (v218)
  {
    v219 = (void *)v218;
    v220 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];
    v221 = [v4 siriDirectedSpeechDetectionFailed];
    int v222 = [v220 isEqual:v221];

    if (!v222) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self audioDucked];
  unint64_t v7 = [v4 audioDucked];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v223 = [(MHSchemaMHClientEvent *)self audioDucked];
  if (v223)
  {
    v224 = (void *)v223;
    v225 = [(MHSchemaMHClientEvent *)self audioDucked];
    v226 = [v4 audioDucked];
    int v227 = [v225 isEqual:v226];

    if (!v227) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];
  unint64_t v7 = [v4 audioRecordingFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v228 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];
  if (v228)
  {
    v229 = (void *)v228;
    v230 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];
    v231 = [v4 audioRecordingFailed];
    int v232 = [v230 isEqual:v231];

    if (!v232) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];
  unint64_t v7 = [v4 rtsFalseRejectDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v233 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];
  if (v233)
  {
    v234 = (void *)v233;
    v235 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];
    v236 = [v4 rtsFalseRejectDetected];
    int v237 = [v235 isEqual:v236];

    if (!v237) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self trpCreated];
  unint64_t v7 = [v4 trpCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v238 = [(MHSchemaMHClientEvent *)self trpCreated];
  if (v238)
  {
    v239 = (void *)v238;
    v240 = [(MHSchemaMHClientEvent *)self trpCreated];
    v241 = [v4 trpCreated];
    int v242 = [v240 isEqual:v241];

    if (!v242) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self userSpeakingContext];
  unint64_t v7 = [v4 userSpeakingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v243 = [(MHSchemaMHClientEvent *)self userSpeakingContext];
  if (v243)
  {
    v244 = (void *)v243;
    v245 = [(MHSchemaMHClientEvent *)self userSpeakingContext];
    v246 = [v4 userSpeakingContext];
    int v247 = [v245 isEqual:v246];

    if (!v247) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self speechStopDetected];
  unint64_t v7 = [v4 speechStopDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v248 = [(MHSchemaMHClientEvent *)self speechStopDetected];
  if (v248)
  {
    v249 = (void *)v248;
    v250 = [(MHSchemaMHClientEvent *)self speechStopDetected];
    v251 = [v4 speechStopDetected];
    int v252 = [v250 isEqual:v251];

    if (!v252) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self speechDetectorContext];
  unint64_t v7 = [v4 speechDetectorContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v253 = [(MHSchemaMHClientEvent *)self speechDetectorContext];
  if (v253)
  {
    v254 = (void *)v253;
    v255 = [(MHSchemaMHClientEvent *)self speechDetectorContext];
    v256 = [v4 speechDetectorContext];
    int v257 = [v255 isEqual:v256];

    if (!v257) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];
  unint64_t v7 = [v4 stoppedListeningForSpeechContinuation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v258 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];
  if (v258)
  {
    v259 = (void *)v258;
    v260 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];
    v261 = [v4 stoppedListeningForSpeechContinuation];
    int v262 = [v260 isEqual:v261];

    if (!v262) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];
  unint64_t v7 = [v4 userEngagementModelContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v263 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];
  if (v263)
  {
    v264 = (void *)v263;
    v265 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];
    v266 = [v4 userEngagementModelContext];
    int v267 = [v265 isEqual:v266];

    if (!v267) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self attendingContext];
  unint64_t v7 = [v4 attendingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v268 = [(MHSchemaMHClientEvent *)self attendingContext];
  if (v268)
  {
    v269 = (void *)v268;
    v270 = [(MHSchemaMHClientEvent *)self attendingContext];
    v271 = [v4 attendingContext];
    int v272 = [v270 isEqual:v271];

    if (!v272) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self crownPressed];
  unint64_t v7 = [v4 crownPressed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v273 = [(MHSchemaMHClientEvent *)self crownPressed];
  if (v273)
  {
    v274 = (void *)v273;
    v275 = [(MHSchemaMHClientEvent *)self crownPressed];
    v276 = [v4 crownPressed];
    int v277 = [v275 isEqual:v276];

    if (!v277) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self rtsTriggered];
  unint64_t v7 = [v4 rtsTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v278 = [(MHSchemaMHClientEvent *)self rtsTriggered];
  if (v278)
  {
    v279 = (void *)v278;
    v280 = [(MHSchemaMHClientEvent *)self rtsTriggered];
    v281 = [v4 rtsTriggered];
    int v282 = [v280 isEqual:v281];

    if (!v282) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];
  unint64_t v7 = [v4 rtsFirstPassPolicyTriggered];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v283 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];
  if (v283)
  {
    v284 = (void *)v283;
    v285 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];
    v286 = [v4 rtsFirstPassPolicyTriggered];
    int v287 = [v285 isEqual:v286];

    if (!v287) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];
  unint64_t v7 = [v4 rtsSecondPassPolicyDecisionMade];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v288 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];
  if (v288)
  {
    v289 = (void *)v288;
    v290 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];
    v291 = [v4 rtsSecondPassPolicyDecisionMade];
    int v292 = [v290 isEqual:v291];

    if (!v292) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];
  unint64_t v7 = [v4 voiceProfileOnboarded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v293 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];
  if (v293)
  {
    v294 = (void *)v293;
    v295 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];
    v296 = [v4 voiceProfileOnboarded];
    int v297 = [v295 isEqual:v296];

    if (!v297) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];
  unint64_t v7 = [v4 sensorControlStatusReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v298 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];
  if (v298)
  {
    v299 = (void *)v298;
    v300 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];
    v301 = [v4 sensorControlStatusReported];
    int v302 = [v300 isEqual:v301];

    if (!v302) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];
  unint64_t v7 = [v4 voiceTriggerRePrompted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v303 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];
  if (v303)
  {
    v304 = (void *)v303;
    v305 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];
    v306 = [v4 voiceTriggerRePrompted];
    int v307 = [v305 isEqual:v306];

    if (!v307) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];
  unint64_t v7 = [v4 assistantDaemonAudioRecordingFailureInsufficientPriority];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v308 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];
  if (v308)
  {
    v309 = (void *)v308;
    v310 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];
    v311 = [v4 assistantDaemonAudioRecordingFailureInsufficientPriority];
    int v312 = [v310 isEqual:v311];

    if (!v312) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];
  unint64_t v7 = [v4 voiceProfileICloudSyncFinished];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_317;
  }
  uint64_t v313 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];
  if (v313)
  {
    v314 = (void *)v313;
    v315 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];
    v316 = [v4 voiceProfileICloudSyncFinished];
    int v317 = [v315 isEqual:v316];

    if (!v317) {
      goto LABEL_318;
    }
  }
  else
  {
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];
  unint64_t v7 = [v4 voiceTriggerRejectDetected];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v318 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];
    if (!v318)
    {

LABEL_321:
      BOOL v323 = 1;
      goto LABEL_319;
    }
    v319 = (void *)v318;
    v320 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];
    v321 = [v4 voiceTriggerRejectDetected];
    char v322 = [v320 isEqual:v321];

    if (v322) {
      goto LABEL_321;
    }
  }
  else
  {
LABEL_317:
  }
LABEL_318:
  BOOL v323 = 0;
LABEL_319:

  return v323;
}

- (void)writeTo:(id)a3
{
  id v130 = a3;
  id v4 = [(MHSchemaMHClientEvent *)self mhId];

  if (v4)
  {
    unint64_t v5 = [(MHSchemaMHClientEvent *)self mhId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(MHSchemaMHClientEvent *)self eventMetadata];

  if (v6)
  {
    unint64_t v7 = [(MHSchemaMHClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];

  if (v8)
  {
    unint64_t v9 = [(MHSchemaMHClientEvent *)self acousticFalseTriggerMitigationEvaluationContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];

  if (v10)
  {
    unint64_t v11 = [(MHSchemaMHClientEvent *)self latticeFalseTriggerMitigationEvaluationContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];

  if (v12)
  {
    uint64_t v13 = [(MHSchemaMHClientEvent *)self unintendedResponseSuppressionExecutionContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];

  if (v14)
  {
    unint64_t v15 = [(MHSchemaMHClientEvent *)self coreSpeechPreprocessorCompleted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];

  if (v16)
  {
    int v17 = [(MHSchemaMHClientEvent *)self asrAudioConfigureStarted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];

  if (v18)
  {
    unint64_t v19 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioInitContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];

  if (v20)
  {
    unint64_t v21 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioConfigureContext];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];

  if (v22)
  {
    uint64_t v23 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrepareContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];

  if (v24)
  {
    unint64_t v25 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioPrewarmContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v26 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];

  if (v26)
  {
    int v27 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStartRecordingContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];

  if (v28)
  {
    unint64_t v29 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioStopRecordingContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v30 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];

  if (v30)
  {
    unint64_t v31 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetActiveContext];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];

  if (v32)
  {
    uint64_t v33 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioSessionSetInactiveContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v34 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];

  if (v34)
  {
    unint64_t v35 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioFetchRouteContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v36 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];

  if (v36)
  {
    int v37 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];

  if (v38)
  {
    unint64_t v39 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingMissedBufferDetected];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v40 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];

  if (v40)
  {
    unint64_t v41 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioLateBufferDetected];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];

  if (v42)
  {
    uint64_t v43 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFirstBufferContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v44 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];

  if (v44)
  {
    unint64_t v45 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingLastBufferContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v46 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];

  if (v46)
  {
    int v47 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];

  if (v48)
  {
    unint64_t v49 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingInterruptionStartedTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v50 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];

  if (v50)
  {
    unint64_t v51 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioBluetoothInfo];
    PBDataWriterWriteSubmessage();
  }
  int v52 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];

  if (v52)
  {
    uint64_t v53 = [(MHSchemaMHClientEvent *)self voiceTriggerTwoShotDetected];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v54 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];

  if (v54)
  {
    unint64_t v55 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioTwoShotTransitionContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v56 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];

  if (v56)
  {
    int v57 = [(MHSchemaMHClientEvent *)self voiceTriggerContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v58 = [(MHSchemaMHClientEvent *)self endpointDetected];

  if (v58)
  {
    unint64_t v59 = [(MHSchemaMHClientEvent *)self endpointDetected];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v60 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];

  if (v60)
  {
    unint64_t v61 = [(MHSchemaMHClientEvent *)self endpointLatencyInfoReported];
    PBDataWriterWriteSubmessage();
  }
  int v62 = [(MHSchemaMHClientEvent *)self adblockerContext];

  if (v62)
  {
    uint64_t v63 = [(MHSchemaMHClientEvent *)self adblockerContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v64 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];

  if (v64)
  {
    int v65 = [(MHSchemaMHClientEvent *)self onDeviceEndpointerContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v66 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];

  if (v66)
  {
    int v67 = [(MHSchemaMHClientEvent *)self serverEndpointerContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v68 = [(MHSchemaMHClientEvent *)self endpointerUsed];

  if (v68)
  {
    v69 = [(MHSchemaMHClientEvent *)self endpointerUsed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v70 = [(MHSchemaMHClientEvent *)self endpointDelayContext];

  if (v70)
  {
    int v71 = [(MHSchemaMHClientEvent *)self endpointDelayContext];
    PBDataWriterWriteSubmessage();
  }
  int v72 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];

  if (v72)
  {
    uint64_t v73 = [(MHSchemaMHClientEvent *)self finalMitigationRecommendation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v74 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];

  if (v74)
  {
    v75 = [(MHSchemaMHClientEvent *)self applicationPlaybackAttempted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v76 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];

  if (v76)
  {
    int v77 = [(MHSchemaMHClientEvent *)self siriLaunchRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v78 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];

  if (v78)
  {
    v79 = [(MHSchemaMHClientEvent *)self endpointerAccessibleContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v80 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];

  if (v80)
  {
    v81 = [(MHSchemaMHClientEvent *)self carPlayLangaugeMismatched];
    PBDataWriterWriteSubmessage();
  }
  int v82 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];

  if (v82)
  {
    uint64_t v83 = [(MHSchemaMHClientEvent *)self darwinConnectedDeviceWakeContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v84 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];

  if (v84)
  {
    v85 = [(MHSchemaMHClientEvent *)self odldFalseTriggerMitigated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v86 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];

  if (v86)
  {
    int v87 = [(MHSchemaMHClientEvent *)self speakerFalseTriggerMitigated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v88 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];

  if (v88)
  {
    int v89 = [(MHSchemaMHClientEvent *)self siriDirectedSpeechDetectionFailed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v90 = [(MHSchemaMHClientEvent *)self audioDucked];

  if (v90)
  {
    v91 = [(MHSchemaMHClientEvent *)self audioDucked];
    PBDataWriterWriteSubmessage();
  }
  int v92 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];

  if (v92)
  {
    uint64_t v93 = [(MHSchemaMHClientEvent *)self audioRecordingFailed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v94 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];

  if (v94)
  {
    int v95 = [(MHSchemaMHClientEvent *)self rtsFalseRejectDetected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v96 = [(MHSchemaMHClientEvent *)self trpCreated];

  if (v96)
  {
    int v97 = [(MHSchemaMHClientEvent *)self trpCreated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v98 = [(MHSchemaMHClientEvent *)self userSpeakingContext];

  if (v98)
  {
    v99 = [(MHSchemaMHClientEvent *)self userSpeakingContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v100 = [(MHSchemaMHClientEvent *)self speechStopDetected];

  if (v100)
  {
    int v101 = [(MHSchemaMHClientEvent *)self speechStopDetected];
    PBDataWriterWriteSubmessage();
  }
  int v102 = [(MHSchemaMHClientEvent *)self speechDetectorContext];

  if (v102)
  {
    uint64_t v103 = [(MHSchemaMHClientEvent *)self speechDetectorContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v104 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];

  if (v104)
  {
    v105 = [(MHSchemaMHClientEvent *)self stoppedListeningForSpeechContinuation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v106 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];

  if (v106)
  {
    int v107 = [(MHSchemaMHClientEvent *)self userEngagementModelContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v108 = [(MHSchemaMHClientEvent *)self attendingContext];

  if (v108)
  {
    v109 = [(MHSchemaMHClientEvent *)self attendingContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v110 = [(MHSchemaMHClientEvent *)self crownPressed];

  if (v110)
  {
    v111 = [(MHSchemaMHClientEvent *)self crownPressed];
    PBDataWriterWriteSubmessage();
  }
  int v112 = [(MHSchemaMHClientEvent *)self rtsTriggered];

  if (v112)
  {
    uint64_t v113 = [(MHSchemaMHClientEvent *)self rtsTriggered];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v114 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];

  if (v114)
  {
    v115 = [(MHSchemaMHClientEvent *)self rtsFirstPassPolicyTriggered];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v116 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];

  if (v116)
  {
    int v117 = [(MHSchemaMHClientEvent *)self rtsSecondPassPolicyDecisionMade];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v118 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];

  if (v118)
  {
    int v119 = [(MHSchemaMHClientEvent *)self voiceProfileOnboarded];
    PBDataWriterWriteSubmessage();
  }
  v120 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];

  if (v120)
  {
    v121 = [(MHSchemaMHClientEvent *)self sensorControlStatusReported];
    PBDataWriterWriteSubmessage();
  }
  int v122 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];

  if (v122)
  {
    uint64_t v123 = [(MHSchemaMHClientEvent *)self voiceTriggerRePrompted];
    PBDataWriterWriteSubmessage();
  }
  v124 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];

  if (v124)
  {
    int v125 = [(MHSchemaMHClientEvent *)self assistantDaemonAudioRecordingFailureInsufficientPriority];
    PBDataWriterWriteSubmessage();
  }
  v126 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];

  if (v126)
  {
    int v127 = [(MHSchemaMHClientEvent *)self voiceProfileICloudSyncFinished];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v128 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];

  if (v128)
  {
    v129 = [(MHSchemaMHClientEvent *)self voiceTriggerRejectDetected];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceTriggerRejectDetected
{
  if (self->_whichEvent_Type == 160)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceTriggerRejectDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceTriggerRejectDetected)voiceTriggerRejectDetected
{
  if (self->_whichEvent_Type == 160) {
    v2 = self->_voiceTriggerRejectDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceTriggerRejectDetected:(id)a3
{
  id v4 = (MHSchemaMHVoiceTriggerRejectDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  unint64_t v65 = 160;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = v4;
}

- (void)deleteVoiceProfileICloudSyncFinished
{
  if (self->_whichEvent_Type == 159)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceProfileICloudSyncFinished = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceProfileICloudSyncFinished)voiceProfileICloudSyncFinished
{
  if (self->_whichEvent_Type == 159) {
    v2 = self->_voiceProfileICloudSyncFinished;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceProfileICloudSyncFinished:(id)a3
{
  id v4 = (MHSchemaMHVoiceProfileICloudSyncFinished *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 159;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = v4;
}

- (void)deleteAssistantDaemonAudioRecordingFailureInsufficientPriority
{
  if (self->_whichEvent_Type == 158)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)assistantDaemonAudioRecordingFailureInsufficientPriority
{
  if (self->_whichEvent_Type == 158) {
    v2 = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingFailureInsufficientPriority:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 158;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = v4;
}

- (void)deleteVoiceTriggerRePrompted
{
  if (self->_whichEvent_Type == 157)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceTriggerRePrompted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceTriggerRePrompted)voiceTriggerRePrompted
{
  if (self->_whichEvent_Type == 157) {
    v2 = self->_voiceTriggerRePrompted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceTriggerRePrompted:(id)a3
{
  id v4 = (MHSchemaMHVoiceTriggerRePrompted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 157;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = v4;
}

- (void)deleteSensorControlStatusReported
{
  if (self->_whichEvent_Type == 156)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sensorControlStatusReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHSensorControlStatusReported)sensorControlStatusReported
{
  if (self->_whichEvent_Type == 156) {
    v2 = self->_sensorControlStatusReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSensorControlStatusReported:(id)a3
{
  id v4 = (MHSchemaMHSensorControlStatusReported *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 156;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = v4;
}

- (void)deleteVoiceProfileOnboarded
{
  if (self->_whichEvent_Type == 155)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceProfileOnboarded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceProfileOnboarded)voiceProfileOnboarded
{
  if (self->_whichEvent_Type == 155) {
    v2 = self->_voiceProfileOnboarded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceProfileOnboarded:(id)a3
{
  id v4 = (MHSchemaMHVoiceProfileOnboarded *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 155;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = v4;
}

- (void)deleteRtsSecondPassPolicyDecisionMade
{
  if (self->_whichEvent_Type == 154)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsSecondPassPolicyDecisionMade = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade)rtsSecondPassPolicyDecisionMade
{
  if (self->_whichEvent_Type == 154) {
    v2 = self->_rtsSecondPassPolicyDecisionMade;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsSecondPassPolicyDecisionMade:(id)a3
{
  id v4 = (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 154;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = v4;
}

- (void)deleteRtsFirstPassPolicyTriggered
{
  if (self->_whichEvent_Type == 153)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsFirstPassPolicyTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered)rtsFirstPassPolicyTriggered
{
  if (self->_whichEvent_Type == 153) {
    v2 = self->_rtsFirstPassPolicyTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsFirstPassPolicyTriggered:(id)a3
{
  id v4 = (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 153;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = v4;
}

- (void)deleteRtsTriggered
{
  if (self->_whichEvent_Type == 152)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHRaiseToSpeakTriggered)rtsTriggered
{
  if (self->_whichEvent_Type == 152) {
    v2 = self->_rtsTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsTriggered:(id)a3
{
  id v4 = (MHSchemaMHRaiseToSpeakTriggered *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 152;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = v4;
}

- (void)deleteCrownPressed
{
  if (self->_whichEvent_Type == 151)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_crownPressed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHCrownPressed)crownPressed
{
  if (self->_whichEvent_Type == 151) {
    v2 = self->_crownPressed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCrownPressed:(id)a3
{
  id v4 = (MHSchemaMHCrownPressed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 151;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  crownPressed = self->_crownPressed;
  self->_crownPressed = v4;
}

- (void)deleteAttendingContext
{
  if (self->_whichEvent_Type == 150)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_attendingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAttendingContext)attendingContext
{
  if (self->_whichEvent_Type == 150) {
    v2 = self->_attendingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAttendingContext:(id)a3
{
  id v4 = (MHSchemaMHAttendingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 150;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  attendingContext = self->_attendingContext;
  self->_attendingContext = v4;
}

- (void)deleteUserEngagementModelContext
{
  if (self->_whichEvent_Type == 149)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userEngagementModelContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext)userEngagementModelContext
{
  if (self->_whichEvent_Type == 149) {
    v2 = self->_userEngagementModelContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserEngagementModelContext:(id)a3
{
  id v4 = (MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 149;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = v4;
}

- (void)deleteStoppedListeningForSpeechContinuation
{
  if (self->_whichEvent_Type == 148)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stoppedListeningForSpeechContinuation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHStoppedListeningForSpeechContinuation)stoppedListeningForSpeechContinuation
{
  if (self->_whichEvent_Type == 148) {
    v2 = self->_stoppedListeningForSpeechContinuation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStoppedListeningForSpeechContinuation:(id)a3
{
  id v4 = (MHSchemaMHStoppedListeningForSpeechContinuation *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 148;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = v4;
}

- (void)deleteSpeechDetectorContext
{
  if (self->_whichEvent_Type == 147)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechDetectorContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHSpeechDetectorContext)speechDetectorContext
{
  if (self->_whichEvent_Type == 147) {
    v2 = self->_speechDetectorContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechDetectorContext:(id)a3
{
  id v4 = (MHSchemaMHSpeechDetectorContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 147;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = v4;
}

- (void)deleteSpeechStopDetected
{
  if (self->_whichEvent_Type == 146)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechStopDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHSpeechStopDetected)speechStopDetected
{
  if (self->_whichEvent_Type == 146) {
    v2 = self->_speechStopDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechStopDetected:(id)a3
{
  id v4 = (MHSchemaMHSpeechStopDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 146;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = v4;
}

- (void)deleteUserSpeakingContext
{
  if (self->_whichEvent_Type == 145)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userSpeakingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHUserSpeakingContext)userSpeakingContext
{
  if (self->_whichEvent_Type == 145) {
    v2 = self->_userSpeakingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserSpeakingContext:(id)a3
{
  id v4 = (MHSchemaMHUserSpeakingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 145;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = v4;
}

- (void)deleteTrpCreated
{
  if (self->_whichEvent_Type == 144)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_trpCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHTRPCreated)trpCreated
{
  if (self->_whichEvent_Type == 144) {
    v2 = self->_trpCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTrpCreated:(id)a3
{
  id v4 = (MHSchemaMHTRPCreated *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 144;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  trpCreated = self->_trpCreated;
  self->_trpCreated = v4;
}

- (void)deleteRtsFalseRejectDetected
{
  if (self->_whichEvent_Type == 143)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rtsFalseRejectDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHRTSFalseRejectDetected)rtsFalseRejectDetected
{
  if (self->_whichEvent_Type == 143) {
    v2 = self->_rtsFalseRejectDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRtsFalseRejectDetected:(id)a3
{
  id v4 = (MHSchemaMHRTSFalseRejectDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 143;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = v4;
}

- (void)deleteAudioRecordingFailed
{
  if (self->_whichEvent_Type == 142)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioRecordingFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingFailed)audioRecordingFailed
{
  if (self->_whichEvent_Type == 142) {
    v2 = self->_audioRecordingFailed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAudioRecordingFailed:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingFailed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 142;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = v4;
}

- (void)deleteAudioDucked
{
  if (self->_whichEvent_Type == 141)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioDucked = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAudioDucked)audioDucked
{
  if (self->_whichEvent_Type == 141) {
    v2 = self->_audioDucked;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAudioDucked:(id)a3
{
  id v4 = (MHSchemaMHAudioDucked *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 141;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  audioDucked = self->_audioDucked;
  self->_audioDucked = v4;
}

- (void)deleteSiriDirectedSpeechDetectionFailed
{
  if (self->_whichEvent_Type == 140)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriDirectedSpeechDetectionFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHSiriDirectedSpeechDetectionFailed)siriDirectedSpeechDetectionFailed
{
  if (self->_whichEvent_Type == 140) {
    v2 = self->_siriDirectedSpeechDetectionFailed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSiriDirectedSpeechDetectionFailed:(id)a3
{
  id v4 = (MHSchemaMHSiriDirectedSpeechDetectionFailed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 140;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = v4;
}

- (void)deleteSpeakerFalseTriggerMitigated
{
  if (self->_whichEvent_Type == 139)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speakerFalseTriggerMitigated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHSpeakerFalseTriggerMitigated)speakerFalseTriggerMitigated
{
  if (self->_whichEvent_Type == 139) {
    v2 = self->_speakerFalseTriggerMitigated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeakerFalseTriggerMitigated:(id)a3
{
  id v4 = (MHSchemaMHSpeakerFalseTriggerMitigated *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 139;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = v4;
}

- (void)deleteOdldFalseTriggerMitigated
{
  if (self->_whichEvent_Type == 138)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_odldFalseTriggerMitigated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHOdldFalseTriggerMitigated)odldFalseTriggerMitigated
{
  if (self->_whichEvent_Type == 138) {
    v2 = self->_odldFalseTriggerMitigated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOdldFalseTriggerMitigated:(id)a3
{
  id v4 = (MHSchemaMHOdldFalseTriggerMitigated *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 138;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = v4;
}

- (void)deleteDarwinConnectedDeviceWakeContext
{
  if (self->_whichEvent_Type == 137)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_darwinConnectedDeviceWakeContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHDarwinConnectedDeviceWakeContext)darwinConnectedDeviceWakeContext
{
  if (self->_whichEvent_Type == 137) {
    v2 = self->_darwinConnectedDeviceWakeContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDarwinConnectedDeviceWakeContext:(id)a3
{
  id v4 = (MHSchemaMHDarwinConnectedDeviceWakeContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 137;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = v4;
}

- (void)deleteCarPlayLangaugeMismatched
{
  if (self->_whichEvent_Type == 136)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_carPlayLangaugeMismatched = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHCarplayLanguageMismatch)carPlayLangaugeMismatched
{
  if (self->_whichEvent_Type == 136) {
    v2 = self->_carPlayLangaugeMismatched;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCarPlayLangaugeMismatched:(id)a3
{
  id v4 = (MHSchemaMHCarplayLanguageMismatch *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 136;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = v4;
}

- (void)deleteEndpointerAccessibleContext
{
  if (self->_whichEvent_Type == 135)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_endpointerAccessibleContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHEndpointerAccessibleContext)endpointerAccessibleContext
{
  if (self->_whichEvent_Type == 135) {
    v2 = self->_endpointerAccessibleContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEndpointerAccessibleContext:(id)a3
{
  id v4 = (MHSchemaMHEndpointerAccessibleContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 135;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = v4;
}

- (void)deleteSiriLaunchRequestContext
{
  if (self->_whichEvent_Type == 134)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriLaunchRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHSiriLaunchRequestContext)siriLaunchRequestContext
{
  if (self->_whichEvent_Type == 134) {
    v2 = self->_siriLaunchRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSiriLaunchRequestContext:(id)a3
{
  id v4 = (MHSchemaMHSiriLaunchRequestContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 134;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = v4;
}

- (void)deleteApplicationPlaybackAttempted
{
  if (self->_whichEvent_Type == 133)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_applicationPlaybackAttempted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHApplicationPlaybackAttempted)applicationPlaybackAttempted
{
  if (self->_whichEvent_Type == 133) {
    v2 = self->_applicationPlaybackAttempted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setApplicationPlaybackAttempted:(id)a3
{
  id v4 = (MHSchemaMHApplicationPlaybackAttempted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 133;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = v4;
}

- (void)deleteFinalMitigationRecommendation
{
  if (self->_whichEvent_Type == 132)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_finalMitigationRecommendation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHMitigationDecisionRecommended)finalMitigationRecommendation
{
  if (self->_whichEvent_Type == 132) {
    v2 = self->_finalMitigationRecommendation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFinalMitigationRecommendation:(id)a3
{
  id v4 = (MHSchemaMHMitigationDecisionRecommended *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 132;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = v4;
}

- (void)deleteEndpointDelayContext
{
  if (self->_whichEvent_Type == 131)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_endpointDelayContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHEndpointDelayContext)endpointDelayContext
{
  if (self->_whichEvent_Type == 131) {
    v2 = self->_endpointDelayContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEndpointDelayContext:(id)a3
{
  id v4 = (MHSchemaMHEndpointDelayContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 131;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = v4;
}

- (void)deleteEndpointerUsed
{
  if (self->_whichEvent_Type == 130)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_endpointerUsed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHEndpointerUsed)endpointerUsed
{
  if (self->_whichEvent_Type == 130) {
    v2 = self->_endpointerUsed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEndpointerUsed:(id)a3
{
  id v4 = (MHSchemaMHEndpointerUsed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 130;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = v4;
}

- (void)deleteServerEndpointerContext
{
  if (self->_whichEvent_Type == 129)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_serverEndpointerContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHServerEndpointerContext)serverEndpointerContext
{
  if (self->_whichEvent_Type == 129) {
    v2 = self->_serverEndpointerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServerEndpointerContext:(id)a3
{
  id v4 = (MHSchemaMHServerEndpointerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 129;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = v4;
}

- (void)deleteOnDeviceEndpointerContext
{
  if (self->_whichEvent_Type == 128)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_onDeviceEndpointerContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHOnDeviceEndpointerContext)onDeviceEndpointerContext
{
  if (self->_whichEvent_Type == 128) {
    v2 = self->_onDeviceEndpointerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOnDeviceEndpointerContext:(id)a3
{
  id v4 = (MHSchemaMHOnDeviceEndpointerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  self->_unint64_t whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = v4;
}

- (void)deleteAdblockerContext
{
  if (self->_whichEvent_Type == 127)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_adblockerContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceAdBlockerContext)adblockerContext
{
  if (self->_whichEvent_Type == 127) {
    v2 = self->_adblockerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAdblockerContext:(id)a3
{
  id v4 = (MHSchemaMHVoiceAdBlockerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 127;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = v4;
}

- (void)deleteEndpointLatencyInfoReported
{
  if (self->_whichEvent_Type == 126)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_endpointLatencyInfoReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHEndpointLatencyInfoReported)endpointLatencyInfoReported
{
  if (self->_whichEvent_Type == 126) {
    v2 = self->_endpointLatencyInfoReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEndpointLatencyInfoReported:(id)a3
{
  id v4 = (MHSchemaMHEndpointLatencyInfoReported *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 126;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = v4;
}

- (void)deleteEndpointDetected
{
  if (self->_whichEvent_Type == 125)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_endpointDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHEndpointDetected)endpointDetected
{
  if (self->_whichEvent_Type == 125) {
    v2 = self->_endpointDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEndpointDetected:(id)a3
{
  id v4 = (MHSchemaMHEndpointDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 125;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = v4;
}

- (void)deleteVoiceTriggerContext
{
  if (self->_whichEvent_Type == 124)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceTriggerContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceTriggerContext)voiceTriggerContext
{
  if (self->_whichEvent_Type == 124) {
    v2 = self->_voiceTriggerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceTriggerContext:(id)a3
{
  id v4 = (MHSchemaMHVoiceTriggerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 124;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = v4;
}

- (void)deleteAssistantDaemonAudioTwoShotTransitionContext
{
  if (self->_whichEvent_Type == 123)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioTwoShotTransitionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext)assistantDaemonAudioTwoShotTransitionContext
{
  if (self->_whichEvent_Type == 123) {
    v2 = self->_assistantDaemonAudioTwoShotTransitionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioTwoShotTransitionContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 123;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = v4;
}

- (void)deleteVoiceTriggerTwoShotDetected
{
  if (self->_whichEvent_Type == 122)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_voiceTriggerTwoShotDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHVoiceTriggerTwoShotDetected)voiceTriggerTwoShotDetected
{
  if (self->_whichEvent_Type == 122) {
    v2 = self->_voiceTriggerTwoShotDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceTriggerTwoShotDetected:(id)a3
{
  id v4 = (MHSchemaMHVoiceTriggerTwoShotDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 122;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = v4;
}

- (void)deleteAssistantDaemonAudioBluetoothInfo
{
  if (self->_whichEvent_Type == 121)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioBluetoothInfo = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioBluetoothInfo)assistantDaemonAudioBluetoothInfo
{
  if (self->_whichEvent_Type == 121) {
    v2 = self->_assistantDaemonAudioBluetoothInfo;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioBluetoothInfo:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioBluetoothInfo *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 121;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = v4;
}

- (void)deleteAssistantDaemonAudioRecordingInterruptionStartedTier1
{
  if (self->_whichEvent_Type == 120)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)assistantDaemonAudioRecordingInterruptionStartedTier1
{
  if (self->_whichEvent_Type == 120) {
    v2 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingInterruptionStartedTier1:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 120;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = v4;
}

- (void)deleteAssistantDaemonAudioRecordingInterruptionContext
{
  if (self->_whichEvent_Type == 119)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingInterruptionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext)assistantDaemonAudioRecordingInterruptionContext
{
  if (self->_whichEvent_Type == 119) {
    v2 = self->_assistantDaemonAudioRecordingInterruptionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingInterruptionContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 119;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = v4;
}

- (void)deleteAssistantDaemonAudioRecordingLastBufferContext
{
  if (self->_whichEvent_Type == 118)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingLastBufferContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext)assistantDaemonAudioRecordingLastBufferContext
{
  if (self->_whichEvent_Type == 118) {
    v2 = self->_assistantDaemonAudioRecordingLastBufferContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingLastBufferContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 118;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = v4;
}

- (void)deleteAssistantDaemonAudioRecordingFirstBufferContext
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingFirstBufferContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext)assistantDaemonAudioRecordingFirstBufferContext
{
  if (self->_whichEvent_Type == 117) {
    v2 = self->_assistantDaemonAudioRecordingFirstBufferContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingFirstBufferContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 117;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = v4;
}

- (void)deleteAssistantDaemonAudioLateBufferDetected
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioLateBufferDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)assistantDaemonAudioLateBufferDetected
{
  if (self->_whichEvent_Type == 116) {
    v2 = self->_assistantDaemonAudioLateBufferDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioLateBufferDetected:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioLateBufferDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 116;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = v4;
}

- (void)deleteAssistantDaemonAudioRecordingMissedBufferDetected
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected)assistantDaemonAudioRecordingMissedBufferDetected
{
  if (self->_whichEvent_Type == 115) {
    v2 = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingMissedBufferDetected:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 115;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = v4;
}

- (void)deleteAssistantDaemonAudioRecordingContext
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioRecordingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioRecordingContext)assistantDaemonAudioRecordingContext
{
  if (self->_whichEvent_Type == 114) {
    v2 = self->_assistantDaemonAudioRecordingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioRecordingContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioRecordingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 114;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = v4;
}

- (void)deleteAssistantDaemonAudioFetchRouteContext
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioFetchRouteContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioFetchRouteContext)assistantDaemonAudioFetchRouteContext
{
  if (self->_whichEvent_Type == 113) {
    v2 = self->_assistantDaemonAudioFetchRouteContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioFetchRouteContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioFetchRouteContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 113;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = v4;
}

- (void)deleteAssistantDaemonAudioSessionSetInactiveContext
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioSessionSetInactiveContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext)assistantDaemonAudioSessionSetInactiveContext
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_assistantDaemonAudioSessionSetInactiveContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioSessionSetInactiveContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 112;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = v4;
}

- (void)deleteAssistantDaemonAudioSessionSetActiveContext
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioSessionSetActiveContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioSessionSetActiveContext)assistantDaemonAudioSessionSetActiveContext
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_assistantDaemonAudioSessionSetActiveContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioSessionSetActiveContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 111;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = v4;
}

- (void)deleteAssistantDaemonAudioStopRecordingContext
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioStopRecordingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioStopRecordingContext)assistantDaemonAudioStopRecordingContext
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_assistantDaemonAudioStopRecordingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioStopRecordingContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioStopRecordingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 110;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = v4;
}

- (void)deleteAssistantDaemonAudioStartRecordingContext
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioStartRecordingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioStartRecordingContext)assistantDaemonAudioStartRecordingContext
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_assistantDaemonAudioStartRecordingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioStartRecordingContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioStartRecordingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 109;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = v4;
}

- (void)deleteAssistantDaemonAudioPrewarmContext
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioPrewarmContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioPrewarmContext)assistantDaemonAudioPrewarmContext
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_assistantDaemonAudioPrewarmContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioPrewarmContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioPrewarmContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 108;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = v4;
}

- (void)deleteAssistantDaemonAudioPrepareContext
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioPrepareContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioPrepareContext)assistantDaemonAudioPrepareContext
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_assistantDaemonAudioPrepareContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioPrepareContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioPrepareContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 107;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = v4;
}

- (void)deleteAssistantDaemonAudioConfigureContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioConfigureContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioConfigureContext)assistantDaemonAudioConfigureContext
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_assistantDaemonAudioConfigureContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioConfigureContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioConfigureContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 106;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = v4;
}

- (void)deleteAssistantDaemonAudioInitContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDaemonAudioInitContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAssistantDaemonAudioInitContext)assistantDaemonAudioInitContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_assistantDaemonAudioInitContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDaemonAudioInitContext:(id)a3
{
  id v4 = (MHSchemaMHAssistantDaemonAudioInitContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 105;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = v4;
}

- (void)deleteAsrAudioConfigureStarted
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_asrAudioConfigureStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHASRAudioConfigureStarted)asrAudioConfigureStarted
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_asrAudioConfigureStarted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAsrAudioConfigureStarted:(id)a3
{
  id v4 = (MHSchemaMHASRAudioConfigureStarted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 104;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = v4;
}

- (void)deleteCoreSpeechPreprocessorCompleted
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_coreSpeechPreprocessorCompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHCoreSpeechPreprocessorCompleted)coreSpeechPreprocessorCompleted
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_coreSpeechPreprocessorCompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCoreSpeechPreprocessorCompleted:(id)a3
{
  id v4 = (MHSchemaMHCoreSpeechPreprocessorCompleted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 103;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = v4;
}

- (void)deleteUnintendedResponseSuppressionExecutionContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_unintendedResponseSuppressionExecutionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHUnintendedResponseSuppressionEvaluationContext)unintendedResponseSuppressionExecutionContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_unintendedResponseSuppressionExecutionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUnintendedResponseSuppressionExecutionContext:(id)a3
{
  id v4 = (MHSchemaMHUnintendedResponseSuppressionEvaluationContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 102;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = v4;
}

- (void)deleteLatticeFalseTriggerMitigationEvaluationContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_latticeFalseTriggerMitigationEvaluationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext)latticeFalseTriggerMitigationEvaluationContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_latticeFalseTriggerMitigationEvaluationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLatticeFalseTriggerMitigationEvaluationContext:(id)a3
{
  id v4 = (MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 101;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = v4;
}

- (void)deleteAcousticFalseTriggerMitigationEvaluationContext
{
  if (self->_whichEvent_Type == 100)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_acousticFalseTriggerMitigationEvaluationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext)acousticFalseTriggerMitigationEvaluationContext
{
  if (self->_whichEvent_Type == 100) {
    v2 = self->_acousticFalseTriggerMitigationEvaluationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAcousticFalseTriggerMitigationEvaluationContext:(id)a3
{
  id v4 = (MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *)a3;
  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  voiceTriggerRejectDetected = self->_voiceTriggerRejectDetected;
  self->_voiceTriggerRejectDetected = 0;

  unint64_t v65 = 100;
  if (!v4) {
    unint64_t v65 = 0;
  }
  self->_unint64_t whichEvent_Type = v65;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteMhId
{
}

- (BOOL)hasMhId
{
  return self->_mhId != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(MHSchemaMHClientEvent *)self whichEvent_Type];
  if (v2 - 100 > 0x3C) {
    return @"com.apple.aiml.siri.mh.MHClientEvent";
  }
  else {
    return off_1E5EB1660[v2 - 100];
  }
}

- (int)getAnyEventType
{
  return 23;
}

@end