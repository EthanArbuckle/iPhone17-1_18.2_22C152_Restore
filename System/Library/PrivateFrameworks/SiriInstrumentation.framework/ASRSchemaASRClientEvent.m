@interface ASRSchemaASRClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (ASRSchemaASRActiveConfigUpdateContext)activeConfigUpdateContext;
- (ASRSchemaASRAlternativeSelectionTextCategorized)alternativeSelectionTextCategorized;
- (ASRSchemaASRAppLanguageModelLoadContext)appLanguageModelLoadContext;
- (ASRSchemaASRAppleNeuralEngineCompilationContext)appleNeuralEngineCompilationContext;
- (ASRSchemaASRAppleNeuralEngineModelInitializationContext)appleNeuralEngineModelInitializationContext;
- (ASRSchemaASRAssetLoadContext)assetLoadContext;
- (ASRSchemaASRAudioPacketArrivalContext)audioPacketArrivalContext;
- (ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream)audioPacketContainingEndOfFirstWordReadyUpstream;
- (ASRSchemaASRAudioSpeechPacketArrivalContext)audioSpeechPacketArrivalContext;
- (ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived)audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
- (ASRSchemaASRClientEvent)initWithDictionary:(id)a3;
- (ASRSchemaASRClientEvent)initWithJSON:(id)a3;
- (ASRSchemaASRClientEventMetadata)eventMetadata;
- (ASRSchemaASRDictationVoiceCommandInfoTier1)dictationVoiceCommandInfoTier1;
- (ASRSchemaASRDictationVoiceCommandMetricsReported)dictationVoiceCommandMetricsReported;
- (ASRSchemaASREmbeddedSpeechProcessContext)embeddedSpeechProcessContext;
- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)finalAudioPacketContainingSpeechReadyUpstream;
- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)finalAudioPacketContainingSpeechReceived;
- (ASRSchemaASRFinalResultGenerated)finalResultGenerated;
- (ASRSchemaASRFirstAudioPacketProcessed)firstAudioPacketProcessed;
- (ASRSchemaASRFirstAudioPacketReadyUpstream)firstAudioPacketReadyUpstream;
- (ASRSchemaASRFirstAudioPacketRecorded)firstAudioPacketRecorded;
- (ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed)firstSecondAfterLeadingSilenceProcessed;
- (ASRSchemaASRFrameProcessingReady)frameProcessingReady;
- (ASRSchemaASRInitializationContext)initializationContext;
- (ASRSchemaASRIntermediateUtteranceInfoTier1)intermediateUtteranceInfoTier1;
- (ASRSchemaASRJitLanguageModelEnrollmentContext)languageModelEnrollmentContext;
- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)jitLanguageModelEnrollmentEndedTier1;
- (ASRSchemaASRLeadingSilenceProcessed)leadingSilenceProcessed;
- (ASRSchemaASRManualEditClassificationContext)manualEditClassificationContext;
- (ASRSchemaASRManualEditMetricClassified)manualEditMetricClassified;
- (ASRSchemaASRManualEditTextClassified)manualEditTextClassified;
- (ASRSchemaASRPackageGenerated)packageGenerated;
- (ASRSchemaASRPartialResultGenerated)partialResultGenerated;
- (ASRSchemaASRPreheatContext)preheatContext;
- (ASRSchemaASRRecognitionResultTier1)recognitionResultTier1;
- (ASRSchemaASRRequestContext)requestContext;
- (ASRSchemaASRRescoringDeliberationResultTier1)rescoringDeliberationResultTier1;
- (ASRSchemaASRSampledAudioFileDeleted)sampledAudioFileDeleted;
- (ASRSchemaASRSampledAudioFileDeletionFailed)sampledAudioFileDeletionFailed;
- (ASRSchemaASRSampledAudioFileEnqueueFailed)sampledAudioFileEnqueueFailed;
- (ASRSchemaASRSampledAudioFileEnqueued)sampledAudioFileEnqueued;
- (ASRSchemaASRSampledAudioFileStorageFailed)sampledAudioFileStorageFailed;
- (ASRSchemaASRSampledAudioFileStored)sampledAudioFileStored;
- (BOOL)hasActiveConfigUpdateContext;
- (BOOL)hasAlternativeSelectionTextCategorized;
- (BOOL)hasAppLanguageModelLoadContext;
- (BOOL)hasAppleNeuralEngineCompilationContext;
- (BOOL)hasAppleNeuralEngineModelInitializationContext;
- (BOOL)hasAssetLoadContext;
- (BOOL)hasAudioPacketArrivalContext;
- (BOOL)hasAudioPacketContainingEndOfFirstWordReadyUpstream;
- (BOOL)hasAudioSpeechPacketArrivalContext;
- (BOOL)hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
- (BOOL)hasDictationVoiceCommandInfoTier1;
- (BOOL)hasDictationVoiceCommandMetricsReported;
- (BOOL)hasEmbeddedSpeechProcessContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasFinalAudioPacketContainingSpeechReadyUpstream;
- (BOOL)hasFinalAudioPacketContainingSpeechReceived;
- (BOOL)hasFinalResultGenerated;
- (BOOL)hasFirstAudioPacketProcessed;
- (BOOL)hasFirstAudioPacketReadyUpstream;
- (BOOL)hasFirstAudioPacketRecorded;
- (BOOL)hasFirstSecondAfterLeadingSilenceProcessed;
- (BOOL)hasFrameProcessingReady;
- (BOOL)hasInitializationContext;
- (BOOL)hasIntermediateUtteranceInfoTier1;
- (BOOL)hasJitLanguageModelEnrollmentEndedTier1;
- (BOOL)hasLanguageModelEnrollmentContext;
- (BOOL)hasLeadingSilenceProcessed;
- (BOOL)hasManualEditClassificationContext;
- (BOOL)hasManualEditMetricClassified;
- (BOOL)hasManualEditTextClassified;
- (BOOL)hasPackageGenerated;
- (BOOL)hasPartialResultGenerated;
- (BOOL)hasPreheatContext;
- (BOOL)hasRecognitionResultTier1;
- (BOOL)hasRequestContext;
- (BOOL)hasRescoringDeliberationResultTier1;
- (BOOL)hasSampledAudioFileDeleted;
- (BOOL)hasSampledAudioFileDeletionFailed;
- (BOOL)hasSampledAudioFileEnqueueFailed;
- (BOOL)hasSampledAudioFileEnqueued;
- (BOOL)hasSampledAudioFileStorageFailed;
- (BOOL)hasSampledAudioFileStored;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
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
- (void)deleteActiveConfigUpdateContext;
- (void)deleteAlternativeSelectionTextCategorized;
- (void)deleteAppLanguageModelLoadContext;
- (void)deleteAppleNeuralEngineCompilationContext;
- (void)deleteAppleNeuralEngineModelInitializationContext;
- (void)deleteAssetLoadContext;
- (void)deleteAudioPacketArrivalContext;
- (void)deleteAudioPacketContainingEndOfFirstWordReadyUpstream;
- (void)deleteAudioSpeechPacketArrivalContext;
- (void)deleteAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
- (void)deleteDictationVoiceCommandInfoTier1;
- (void)deleteDictationVoiceCommandMetricsReported;
- (void)deleteEmbeddedSpeechProcessContext;
- (void)deleteEventMetadata;
- (void)deleteFinalAudioPacketContainingSpeechReadyUpstream;
- (void)deleteFinalAudioPacketContainingSpeechReceived;
- (void)deleteFinalResultGenerated;
- (void)deleteFirstAudioPacketProcessed;
- (void)deleteFirstAudioPacketReadyUpstream;
- (void)deleteFirstAudioPacketRecorded;
- (void)deleteFirstSecondAfterLeadingSilenceProcessed;
- (void)deleteFrameProcessingReady;
- (void)deleteInitializationContext;
- (void)deleteIntermediateUtteranceInfoTier1;
- (void)deleteJitLanguageModelEnrollmentEndedTier1;
- (void)deleteLanguageModelEnrollmentContext;
- (void)deleteLeadingSilenceProcessed;
- (void)deleteManualEditClassificationContext;
- (void)deleteManualEditMetricClassified;
- (void)deleteManualEditTextClassified;
- (void)deletePackageGenerated;
- (void)deletePartialResultGenerated;
- (void)deletePreheatContext;
- (void)deleteRecognitionResultTier1;
- (void)deleteRequestContext;
- (void)deleteRescoringDeliberationResultTier1;
- (void)deleteSampledAudioFileDeleted;
- (void)deleteSampledAudioFileDeletionFailed;
- (void)deleteSampledAudioFileEnqueueFailed;
- (void)deleteSampledAudioFileEnqueued;
- (void)deleteSampledAudioFileStorageFailed;
- (void)deleteSampledAudioFileStored;
- (void)setActiveConfigUpdateContext:(id)a3;
- (void)setAlternativeSelectionTextCategorized:(id)a3;
- (void)setAppLanguageModelLoadContext:(id)a3;
- (void)setAppleNeuralEngineCompilationContext:(id)a3;
- (void)setAppleNeuralEngineModelInitializationContext:(id)a3;
- (void)setAssetLoadContext:(id)a3;
- (void)setAudioPacketArrivalContext:(id)a3;
- (void)setAudioPacketContainingEndOfFirstWordReadyUpstream:(id)a3;
- (void)setAudioSpeechPacketArrivalContext:(id)a3;
- (void)setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:(id)a3;
- (void)setDictationVoiceCommandInfoTier1:(id)a3;
- (void)setDictationVoiceCommandMetricsReported:(id)a3;
- (void)setEmbeddedSpeechProcessContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setFinalAudioPacketContainingSpeechReadyUpstream:(id)a3;
- (void)setFinalAudioPacketContainingSpeechReceived:(id)a3;
- (void)setFinalResultGenerated:(id)a3;
- (void)setFirstAudioPacketProcessed:(id)a3;
- (void)setFirstAudioPacketReadyUpstream:(id)a3;
- (void)setFirstAudioPacketRecorded:(id)a3;
- (void)setFirstSecondAfterLeadingSilenceProcessed:(id)a3;
- (void)setFrameProcessingReady:(id)a3;
- (void)setHasActiveConfigUpdateContext:(BOOL)a3;
- (void)setHasAlternativeSelectionTextCategorized:(BOOL)a3;
- (void)setHasAppLanguageModelLoadContext:(BOOL)a3;
- (void)setHasAppleNeuralEngineCompilationContext:(BOOL)a3;
- (void)setHasAppleNeuralEngineModelInitializationContext:(BOOL)a3;
- (void)setHasAssetLoadContext:(BOOL)a3;
- (void)setHasAudioPacketArrivalContext:(BOOL)a3;
- (void)setHasAudioPacketContainingEndOfFirstWordReadyUpstream:(BOOL)a3;
- (void)setHasAudioSpeechPacketArrivalContext:(BOOL)a3;
- (void)setHasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:(BOOL)a3;
- (void)setHasDictationVoiceCommandInfoTier1:(BOOL)a3;
- (void)setHasDictationVoiceCommandMetricsReported:(BOOL)a3;
- (void)setHasEmbeddedSpeechProcessContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFinalAudioPacketContainingSpeechReadyUpstream:(BOOL)a3;
- (void)setHasFinalAudioPacketContainingSpeechReceived:(BOOL)a3;
- (void)setHasFinalResultGenerated:(BOOL)a3;
- (void)setHasFirstAudioPacketProcessed:(BOOL)a3;
- (void)setHasFirstAudioPacketReadyUpstream:(BOOL)a3;
- (void)setHasFirstAudioPacketRecorded:(BOOL)a3;
- (void)setHasFirstSecondAfterLeadingSilenceProcessed:(BOOL)a3;
- (void)setHasFrameProcessingReady:(BOOL)a3;
- (void)setHasInitializationContext:(BOOL)a3;
- (void)setHasIntermediateUtteranceInfoTier1:(BOOL)a3;
- (void)setHasJitLanguageModelEnrollmentEndedTier1:(BOOL)a3;
- (void)setHasLanguageModelEnrollmentContext:(BOOL)a3;
- (void)setHasLeadingSilenceProcessed:(BOOL)a3;
- (void)setHasManualEditClassificationContext:(BOOL)a3;
- (void)setHasManualEditMetricClassified:(BOOL)a3;
- (void)setHasManualEditTextClassified:(BOOL)a3;
- (void)setHasPackageGenerated:(BOOL)a3;
- (void)setHasPartialResultGenerated:(BOOL)a3;
- (void)setHasPreheatContext:(BOOL)a3;
- (void)setHasRecognitionResultTier1:(BOOL)a3;
- (void)setHasRequestContext:(BOOL)a3;
- (void)setHasRescoringDeliberationResultTier1:(BOOL)a3;
- (void)setHasSampledAudioFileDeleted:(BOOL)a3;
- (void)setHasSampledAudioFileDeletionFailed:(BOOL)a3;
- (void)setHasSampledAudioFileEnqueueFailed:(BOOL)a3;
- (void)setHasSampledAudioFileEnqueued:(BOOL)a3;
- (void)setHasSampledAudioFileStorageFailed:(BOOL)a3;
- (void)setHasSampledAudioFileStored:(BOOL)a3;
- (void)setInitializationContext:(id)a3;
- (void)setIntermediateUtteranceInfoTier1:(id)a3;
- (void)setJitLanguageModelEnrollmentEndedTier1:(id)a3;
- (void)setLanguageModelEnrollmentContext:(id)a3;
- (void)setLeadingSilenceProcessed:(id)a3;
- (void)setManualEditClassificationContext:(id)a3;
- (void)setManualEditMetricClassified:(id)a3;
- (void)setManualEditTextClassified:(id)a3;
- (void)setPackageGenerated:(id)a3;
- (void)setPartialResultGenerated:(id)a3;
- (void)setPreheatContext:(id)a3;
- (void)setRecognitionResultTier1:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setRescoringDeliberationResultTier1:(id)a3;
- (void)setSampledAudioFileDeleted:(id)a3;
- (void)setSampledAudioFileDeletionFailed:(id)a3;
- (void)setSampledAudioFileEnqueueFailed:(id)a3;
- (void)setSampledAudioFileEnqueued:(id)a3;
- (void)setSampledAudioFileStorageFailed:(id)a3;
- (void)setSampledAudioFileStored:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRClientEvent

- (int)componentName
{
  v3 = [(ASRSchemaASRClientEvent *)self eventMetadata];
  v4 = [v3 asrId];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    int v9 = 8;
  }
  else
  {
LABEL_5:
    v10 = [(ASRSchemaASRClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (v11)
    {
      uint64_t v12 = [v11 value];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v11 value];
        int v9 = [v14 length] != 0;
      }
      else
      {
        int v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      int v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

- (id)getComponentId
{
  v3 = [(ASRSchemaASRClientEvent *)self eventMetadata];
  v4 = [v3 asrId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  int v9 = [(ASRSchemaASRClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    id v11 = [v10 value];
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v10 value];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v4 = v10;
LABEL_8:
      id v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v134.receiver = self;
  v134.super_class = (Class)ASRSchemaASRClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v134 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ASRSchemaASRClientEvent *)self deleteRecognitionResultTier1];
    [(ASRSchemaASRClientEvent *)self deleteIntermediateUtteranceInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteJitLanguageModelEnrollmentEndedTier1];
    [(ASRSchemaASRClientEvent *)self deleteManualEditTextClassified];
    [(ASRSchemaASRClientEvent *)self deleteAlternativeSelectionTextCategorized];
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteRescoringDeliberationResultTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(ASRSchemaASRClientEvent *)self deleteRecognitionResultTier1];
    [(ASRSchemaASRClientEvent *)self deleteIntermediateUtteranceInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteJitLanguageModelEnrollmentEndedTier1];
    [(ASRSchemaASRClientEvent *)self deleteManualEditTextClassified];
    [(ASRSchemaASRClientEvent *)self deleteAlternativeSelectionTextCategorized];
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteRescoringDeliberationResultTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(ASRSchemaASRClientEvent *)self deleteRecognitionResultTier1];
    [(ASRSchemaASRClientEvent *)self deleteIntermediateUtteranceInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteJitLanguageModelEnrollmentEndedTier1];
    [(ASRSchemaASRClientEvent *)self deleteManualEditTextClassified];
    [(ASRSchemaASRClientEvent *)self deleteAlternativeSelectionTextCategorized];
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteRescoringDeliberationResultTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(ASRSchemaASRClientEvent *)self deleteRecognitionResultTier1];
    [(ASRSchemaASRClientEvent *)self deleteIntermediateUtteranceInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteJitLanguageModelEnrollmentEndedTier1];
    [(ASRSchemaASRClientEvent *)self deleteManualEditTextClassified];
    [(ASRSchemaASRClientEvent *)self deleteAlternativeSelectionTextCategorized];
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteRescoringDeliberationResultTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(ASRSchemaASRClientEvent *)self deleteRecognitionResultTier1];
    [(ASRSchemaASRClientEvent *)self deleteIntermediateUtteranceInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteJitLanguageModelEnrollmentEndedTier1];
    [(ASRSchemaASRClientEvent *)self deleteManualEditTextClassified];
    [(ASRSchemaASRClientEvent *)self deleteAlternativeSelectionTextCategorized];
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandInfoTier1];
    [(ASRSchemaASRClientEvent *)self deleteRescoringDeliberationResultTier1];
  }
  v6 = [(ASRSchemaASRClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(ASRSchemaASRClientEvent *)self preheatContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ASRSchemaASRClientEvent *)self deletePreheatContext];
  }
  uint64_t v12 = [(ASRSchemaASRClientEvent *)self requestContext];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ASRSchemaASRClientEvent *)self deleteRequestContext];
  }
  v15 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ASRSchemaASRClientEvent *)self deletePartialResultGenerated];
  }
  v18 = [(ASRSchemaASRClientEvent *)self packageGenerated];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ASRSchemaASRClientEvent *)self deletePackageGenerated];
  }
  v21 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(ASRSchemaASRClientEvent *)self deleteRecognitionResultTier1];
  }
  v24 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(ASRSchemaASRClientEvent *)self deleteFinalResultGenerated];
  }
  v27 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(ASRSchemaASRClientEvent *)self deleteIntermediateUtteranceInfoTier1];
  }
  v30 = [(ASRSchemaASRClientEvent *)self initializationContext];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(ASRSchemaASRClientEvent *)self deleteInitializationContext];
  }
  v33 = [(ASRSchemaASRClientEvent *)self assetLoadContext];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(ASRSchemaASRClientEvent *)self deleteAssetLoadContext];
  }
  v36 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(ASRSchemaASRClientEvent *)self deleteLanguageModelEnrollmentContext];
  }
  v39 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(ASRSchemaASRClientEvent *)self deleteJitLanguageModelEnrollmentEndedTier1];
  }
  v42 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(ASRSchemaASRClientEvent *)self deleteAudioPacketArrivalContext];
  }
  v45 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(ASRSchemaASRClientEvent *)self deleteFirstAudioPacketProcessed];
  }
  v48 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(ASRSchemaASRClientEvent *)self deleteFinalAudioPacketContainingSpeechReceived];
  }
  v51 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(ASRSchemaASRClientEvent *)self deleteSampledAudioFileStored];
  }
  v54 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(ASRSchemaASRClientEvent *)self deleteSampledAudioFileStorageFailed];
  }
  v57 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(ASRSchemaASRClientEvent *)self deleteSampledAudioFileEnqueued];
  }
  v60 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(ASRSchemaASRClientEvent *)self deleteSampledAudioFileEnqueueFailed];
  }
  v63 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(ASRSchemaASRClientEvent *)self deleteSampledAudioFileDeleted];
  }
  v66 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(ASRSchemaASRClientEvent *)self deleteSampledAudioFileDeletionFailed];
  }
  v69 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(ASRSchemaASRClientEvent *)self deleteAppleNeuralEngineCompilationContext];
  }
  v72 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandMetricsReported];
  }
  v75 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];
  v76 = [v75 applySensitiveConditionsPolicy:v4];
  int v77 = [v76 suppressMessage];

  if (v77) {
    [(ASRSchemaASRClientEvent *)self deleteAppLanguageModelLoadContext];
  }
  v78 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];
  v79 = [v78 applySensitiveConditionsPolicy:v4];
  int v80 = [v79 suppressMessage];

  if (v80) {
    [(ASRSchemaASRClientEvent *)self deleteEmbeddedSpeechProcessContext];
  }
  v81 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];
  v82 = [v81 applySensitiveConditionsPolicy:v4];
  int v83 = [v82 suppressMessage];

  if (v83) {
    [(ASRSchemaASRClientEvent *)self deleteManualEditTextClassified];
  }
  v84 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];
  v85 = [v84 applySensitiveConditionsPolicy:v4];
  int v86 = [v85 suppressMessage];

  if (v86) {
    [(ASRSchemaASRClientEvent *)self deleteManualEditMetricClassified];
  }
  v87 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];
  v88 = [v87 applySensitiveConditionsPolicy:v4];
  int v89 = [v88 suppressMessage];

  if (v89) {
    [(ASRSchemaASRClientEvent *)self deleteManualEditClassificationContext];
  }
  v90 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];
  v91 = [v90 applySensitiveConditionsPolicy:v4];
  int v92 = [v91 suppressMessage];

  if (v92) {
    [(ASRSchemaASRClientEvent *)self deleteActiveConfigUpdateContext];
  }
  v93 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];
  v94 = [v93 applySensitiveConditionsPolicy:v4];
  int v95 = [v94 suppressMessage];

  if (v95) {
    [(ASRSchemaASRClientEvent *)self deleteAppleNeuralEngineModelInitializationContext];
  }
  v96 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];
  v97 = [v96 applySensitiveConditionsPolicy:v4];
  int v98 = [v97 suppressMessage];

  if (v98) {
    [(ASRSchemaASRClientEvent *)self deleteFrameProcessingReady];
  }
  v99 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];
  v100 = [v99 applySensitiveConditionsPolicy:v4];
  int v101 = [v100 suppressMessage];

  if (v101) {
    [(ASRSchemaASRClientEvent *)self deleteLeadingSilenceProcessed];
  }
  v102 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];
  v103 = [v102 applySensitiveConditionsPolicy:v4];
  int v104 = [v103 suppressMessage];

  if (v104) {
    [(ASRSchemaASRClientEvent *)self deleteFirstSecondAfterLeadingSilenceProcessed];
  }
  v105 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];
  v106 = [v105 applySensitiveConditionsPolicy:v4];
  int v107 = [v106 suppressMessage];

  if (v107) {
    [(ASRSchemaASRClientEvent *)self deleteAudioSpeechPacketArrivalContext];
  }
  v108 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
  v109 = [v108 applySensitiveConditionsPolicy:v4];
  int v110 = [v109 suppressMessage];

  if (v110) {
    [(ASRSchemaASRClientEvent *)self deleteAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
  }
  v111 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];
  v112 = [v111 applySensitiveConditionsPolicy:v4];
  int v113 = [v112 suppressMessage];

  if (v113) {
    [(ASRSchemaASRClientEvent *)self deleteFirstAudioPacketRecorded];
  }
  v114 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];
  v115 = [v114 applySensitiveConditionsPolicy:v4];
  int v116 = [v115 suppressMessage];

  if (v116) {
    [(ASRSchemaASRClientEvent *)self deleteAudioPacketContainingEndOfFirstWordReadyUpstream];
  }
  v117 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];
  v118 = [v117 applySensitiveConditionsPolicy:v4];
  int v119 = [v118 suppressMessage];

  if (v119) {
    [(ASRSchemaASRClientEvent *)self deleteFirstAudioPacketReadyUpstream];
  }
  v120 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];
  v121 = [v120 applySensitiveConditionsPolicy:v4];
  int v122 = [v121 suppressMessage];

  if (v122) {
    [(ASRSchemaASRClientEvent *)self deleteFinalAudioPacketContainingSpeechReadyUpstream];
  }
  v123 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];
  v124 = [v123 applySensitiveConditionsPolicy:v4];
  int v125 = [v124 suppressMessage];

  if (v125) {
    [(ASRSchemaASRClientEvent *)self deleteAlternativeSelectionTextCategorized];
  }
  v126 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];
  v127 = [v126 applySensitiveConditionsPolicy:v4];
  int v128 = [v127 suppressMessage];

  if (v128) {
    [(ASRSchemaASRClientEvent *)self deleteDictationVoiceCommandInfoTier1];
  }
  v129 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];
  v130 = [v129 applySensitiveConditionsPolicy:v4];
  int v131 = [v130 suppressMessage];

  if (v131) {
    [(ASRSchemaASRClientEvent *)self deleteRescoringDeliberationResultTier1];
  }
  id v132 = v5;

  return v132;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(ASRSchemaASRClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0x28) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EA9C80[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x28) {
    return 0;
  }
  else {
    return off_1E5EA9DC8[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  unint64_t v2 = [(ASRSchemaASRClientEvent *)self whichEvent_Type];
  if (v2 - 125 > 0xE || ((1 << (v2 - 125)) & 0x4007) == 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rescoringDeliberationResultTier1, 0);
  objc_storeStrong((id *)&self->_dictationVoiceCommandInfoTier1, 0);
  objc_storeStrong((id *)&self->_alternativeSelectionTextCategorized, 0);
  objc_storeStrong((id *)&self->_finalAudioPacketContainingSpeechReadyUpstream, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketReadyUpstream, 0);
  objc_storeStrong((id *)&self->_audioPacketContainingEndOfFirstWordReadyUpstream, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketRecorded, 0);
  objc_storeStrong((id *)&self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived, 0);
  objc_storeStrong((id *)&self->_audioSpeechPacketArrivalContext, 0);
  objc_storeStrong((id *)&self->_firstSecondAfterLeadingSilenceProcessed, 0);
  objc_storeStrong((id *)&self->_leadingSilenceProcessed, 0);
  objc_storeStrong((id *)&self->_frameProcessingReady, 0);
  objc_storeStrong((id *)&self->_appleNeuralEngineModelInitializationContext, 0);
  objc_storeStrong((id *)&self->_activeConfigUpdateContext, 0);
  objc_storeStrong((id *)&self->_manualEditClassificationContext, 0);
  objc_storeStrong((id *)&self->_manualEditMetricClassified, 0);
  objc_storeStrong((id *)&self->_manualEditTextClassified, 0);
  objc_storeStrong((id *)&self->_embeddedSpeechProcessContext, 0);
  objc_storeStrong((id *)&self->_appLanguageModelLoadContext, 0);
  objc_storeStrong((id *)&self->_dictationVoiceCommandMetricsReported, 0);
  objc_storeStrong((id *)&self->_appleNeuralEngineCompilationContext, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileDeletionFailed, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileDeleted, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileEnqueueFailed, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileEnqueued, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileStorageFailed, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileStored, 0);
  objc_storeStrong((id *)&self->_finalAudioPacketContainingSpeechReceived, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketProcessed, 0);
  objc_storeStrong((id *)&self->_audioPacketArrivalContext, 0);
  objc_storeStrong((id *)&self->_jitLanguageModelEnrollmentEndedTier1, 0);
  objc_storeStrong((id *)&self->_languageModelEnrollmentContext, 0);
  objc_storeStrong((id *)&self->_assetLoadContext, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
  objc_storeStrong((id *)&self->_intermediateUtteranceInfoTier1, 0);
  objc_storeStrong((id *)&self->_finalResultGenerated, 0);
  objc_storeStrong((id *)&self->_recognitionResultTier1, 0);
  objc_storeStrong((id *)&self->_packageGenerated, 0);
  objc_storeStrong((id *)&self->_partialResultGenerated, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_preheatContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasRescoringDeliberationResultTier1:(BOOL)a3
{
  self->_hasRescoringDeliberationResultTier1 = a3;
}

- (BOOL)hasRescoringDeliberationResultTier1
{
  return self->_hasRescoringDeliberationResultTier1;
}

- (void)setHasDictationVoiceCommandInfoTier1:(BOOL)a3
{
  self->_hasDictationVoiceCommandInfoTier1 = a3;
}

- (BOOL)hasDictationVoiceCommandInfoTier1
{
  return self->_hasDictationVoiceCommandInfoTier1;
}

- (void)setHasAlternativeSelectionTextCategorized:(BOOL)a3
{
  self->_hasAlternativeSelectionTextCategorized = a3;
}

- (BOOL)hasAlternativeSelectionTextCategorized
{
  return self->_hasAlternativeSelectionTextCategorized;
}

- (void)setHasFinalAudioPacketContainingSpeechReadyUpstream:(BOOL)a3
{
  self->_hasFinalAudioPacketContainingSpeechReadyUpstream = a3;
}

- (BOOL)hasFinalAudioPacketContainingSpeechReadyUpstream
{
  return self->_hasFinalAudioPacketContainingSpeechReadyUpstream;
}

- (void)setHasFirstAudioPacketReadyUpstream:(BOOL)a3
{
  self->_hasFirstAudioPacketReadyUpstream = a3;
}

- (BOOL)hasFirstAudioPacketReadyUpstream
{
  return self->_hasFirstAudioPacketReadyUpstream;
}

- (void)setHasAudioPacketContainingEndOfFirstWordReadyUpstream:(BOOL)a3
{
  self->_hasAudioPacketContainingEndOfFirstWordReadyUpstream = a3;
}

- (BOOL)hasAudioPacketContainingEndOfFirstWordReadyUpstream
{
  return self->_hasAudioPacketContainingEndOfFirstWordReadyUpstream;
}

- (void)setHasFirstAudioPacketRecorded:(BOOL)a3
{
  self->_hasFirstAudioPacketRecorded = a3;
}

- (BOOL)hasFirstAudioPacketRecorded
{
  return self->_hasFirstAudioPacketRecorded;
}

- (void)setHasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:(BOOL)a3
{
  self->_hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = a3;
}

- (BOOL)hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived
{
  return self->_hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
}

- (void)setHasAudioSpeechPacketArrivalContext:(BOOL)a3
{
  self->_hasAudioSpeechPacketArrivalContext = a3;
}

- (BOOL)hasAudioSpeechPacketArrivalContext
{
  return self->_hasAudioSpeechPacketArrivalContext;
}

- (void)setHasFirstSecondAfterLeadingSilenceProcessed:(BOOL)a3
{
  self->_hasFirstSecondAfterLeadingSilenceProcessed = a3;
}

- (BOOL)hasFirstSecondAfterLeadingSilenceProcessed
{
  return self->_hasFirstSecondAfterLeadingSilenceProcessed;
}

- (void)setHasLeadingSilenceProcessed:(BOOL)a3
{
  self->_hasLeadingSilenceProcessed = a3;
}

- (BOOL)hasLeadingSilenceProcessed
{
  return self->_hasLeadingSilenceProcessed;
}

- (void)setHasFrameProcessingReady:(BOOL)a3
{
  self->_hasFrameProcessingReady = a3;
}

- (BOOL)hasFrameProcessingReady
{
  return self->_hasFrameProcessingReady;
}

- (void)setHasAppleNeuralEngineModelInitializationContext:(BOOL)a3
{
  self->_hasAppleNeuralEngineModelInitializationContext = a3;
}

- (BOOL)hasAppleNeuralEngineModelInitializationContext
{
  return self->_hasAppleNeuralEngineModelInitializationContext;
}

- (void)setHasActiveConfigUpdateContext:(BOOL)a3
{
  self->_hasActiveConfigUpdateContext = a3;
}

- (BOOL)hasActiveConfigUpdateContext
{
  return self->_hasActiveConfigUpdateContext;
}

- (void)setHasManualEditClassificationContext:(BOOL)a3
{
  self->_hasManualEditClassificationContext = a3;
}

- (BOOL)hasManualEditClassificationContext
{
  return self->_hasManualEditClassificationContext;
}

- (void)setHasManualEditMetricClassified:(BOOL)a3
{
  self->_hasManualEditMetricClassified = a3;
}

- (BOOL)hasManualEditMetricClassified
{
  return self->_hasManualEditMetricClassified;
}

- (void)setHasManualEditTextClassified:(BOOL)a3
{
  self->_hasManualEditTextClassified = a3;
}

- (BOOL)hasManualEditTextClassified
{
  return self->_hasManualEditTextClassified;
}

- (void)setHasEmbeddedSpeechProcessContext:(BOOL)a3
{
  self->_hasEmbeddedSpeechProcessContext = a3;
}

- (BOOL)hasEmbeddedSpeechProcessContext
{
  return self->_hasEmbeddedSpeechProcessContext;
}

- (void)setHasAppLanguageModelLoadContext:(BOOL)a3
{
  self->_hasAppLanguageModelLoadContext = a3;
}

- (BOOL)hasAppLanguageModelLoadContext
{
  return self->_hasAppLanguageModelLoadContext;
}

- (void)setHasDictationVoiceCommandMetricsReported:(BOOL)a3
{
  self->_hasDictationVoiceCommandMetricsReported = a3;
}

- (BOOL)hasDictationVoiceCommandMetricsReported
{
  return self->_hasDictationVoiceCommandMetricsReported;
}

- (void)setHasAppleNeuralEngineCompilationContext:(BOOL)a3
{
  self->_hasAppleNeuralEngineCompilationContext = a3;
}

- (BOOL)hasAppleNeuralEngineCompilationContext
{
  return self->_hasAppleNeuralEngineCompilationContext;
}

- (void)setHasSampledAudioFileDeletionFailed:(BOOL)a3
{
  self->_hasSampledAudioFileDeletionFailed = a3;
}

- (BOOL)hasSampledAudioFileDeletionFailed
{
  return self->_hasSampledAudioFileDeletionFailed;
}

- (void)setHasSampledAudioFileDeleted:(BOOL)a3
{
  self->_hasSampledAudioFileDeleted = a3;
}

- (BOOL)hasSampledAudioFileDeleted
{
  return self->_hasSampledAudioFileDeleted;
}

- (void)setHasSampledAudioFileEnqueueFailed:(BOOL)a3
{
  self->_hasSampledAudioFileEnqueueFailed = a3;
}

- (BOOL)hasSampledAudioFileEnqueueFailed
{
  return self->_hasSampledAudioFileEnqueueFailed;
}

- (void)setHasSampledAudioFileEnqueued:(BOOL)a3
{
  self->_hasSampledAudioFileEnqueued = a3;
}

- (BOOL)hasSampledAudioFileEnqueued
{
  return self->_hasSampledAudioFileEnqueued;
}

- (void)setHasSampledAudioFileStorageFailed:(BOOL)a3
{
  self->_hasSampledAudioFileStorageFailed = a3;
}

- (BOOL)hasSampledAudioFileStorageFailed
{
  return self->_hasSampledAudioFileStorageFailed;
}

- (void)setHasSampledAudioFileStored:(BOOL)a3
{
  self->_hasSampledAudioFileStored = a3;
}

- (BOOL)hasSampledAudioFileStored
{
  return self->_hasSampledAudioFileStored;
}

- (void)setHasFinalAudioPacketContainingSpeechReceived:(BOOL)a3
{
  self->_hasFinalAudioPacketContainingSpeechReceived = a3;
}

- (BOOL)hasFinalAudioPacketContainingSpeechReceived
{
  return self->_hasFinalAudioPacketContainingSpeechReceived;
}

- (void)setHasFirstAudioPacketProcessed:(BOOL)a3
{
  self->_hasFirstAudioPacketProcessed = a3;
}

- (BOOL)hasFirstAudioPacketProcessed
{
  return self->_hasFirstAudioPacketProcessed;
}

- (void)setHasAudioPacketArrivalContext:(BOOL)a3
{
  self->_hasAudioPacketArrivalContext = a3;
}

- (BOOL)hasAudioPacketArrivalContext
{
  return self->_hasAudioPacketArrivalContext;
}

- (void)setHasJitLanguageModelEnrollmentEndedTier1:(BOOL)a3
{
  self->_hasJitLanguageModelEnrollmentEndedTier1 = a3;
}

- (BOOL)hasJitLanguageModelEnrollmentEndedTier1
{
  return self->_hasJitLanguageModelEnrollmentEndedTier1;
}

- (void)setHasLanguageModelEnrollmentContext:(BOOL)a3
{
  self->_hasLanguageModelEnrollmentContext = a3;
}

- (BOOL)hasLanguageModelEnrollmentContext
{
  return self->_hasLanguageModelEnrollmentContext;
}

- (void)setHasAssetLoadContext:(BOOL)a3
{
  self->_hasAssetLoadContext = a3;
}

- (BOOL)hasAssetLoadContext
{
  return self->_hasAssetLoadContext;
}

- (void)setHasInitializationContext:(BOOL)a3
{
  self->_hasInitializationContext = a3;
}

- (BOOL)hasInitializationContext
{
  return self->_hasInitializationContext;
}

- (void)setHasIntermediateUtteranceInfoTier1:(BOOL)a3
{
  self->_hasIntermediateUtteranceInfoTier1 = a3;
}

- (BOOL)hasIntermediateUtteranceInfoTier1
{
  return self->_hasIntermediateUtteranceInfoTier1;
}

- (void)setHasFinalResultGenerated:(BOOL)a3
{
  self->_hasFinalResultGenerated = a3;
}

- (BOOL)hasFinalResultGenerated
{
  return self->_hasFinalResultGenerated;
}

- (void)setHasRecognitionResultTier1:(BOOL)a3
{
  self->_hasRecognitionResultTier1 = a3;
}

- (BOOL)hasRecognitionResultTier1
{
  return self->_hasRecognitionResultTier1;
}

- (void)setHasPackageGenerated:(BOOL)a3
{
  self->_hasPackageGenerated = a3;
}

- (BOOL)hasPackageGenerated
{
  return self->_hasPackageGenerated;
}

- (void)setHasPartialResultGenerated:(BOOL)a3
{
  self->_hasPartialResultGenerated = a3;
}

- (BOOL)hasPartialResultGenerated
{
  return self->_hasPartialResultGenerated;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasPreheatContext:(BOOL)a3
{
  self->_hasPreheatContext = a3;
}

- (BOOL)hasPreheatContext
{
  return self->_hasPreheatContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ASRSchemaASRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ASRSchemaASRClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v127.receiver = self;
  v127.super_class = (Class)ASRSchemaASRClientEvent;
  uint64_t v5 = [(ASRSchemaASRClientEvent *)&v127 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ASRSchemaASRClientEventMetadata alloc] initWithDictionary:v6];
      [(ASRSchemaASRClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"preheatContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[ASRSchemaASRPreheatContext alloc] initWithDictionary:v8];
      [(ASRSchemaASRClientEvent *)v5 setPreheatContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"requestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ASRSchemaASRRequestContext alloc] initWithDictionary:v10];
      [(ASRSchemaASRClientEvent *)v5 setRequestContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"partialResultGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[ASRSchemaASRPartialResultGenerated alloc] initWithDictionary:v12];
      [(ASRSchemaASRClientEvent *)v5 setPartialResultGenerated:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"packageGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ASRSchemaASRPackageGenerated alloc] initWithDictionary:v14];
      [(ASRSchemaASRClientEvent *)v5 setPackageGenerated:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"recognitionResultTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[ASRSchemaASRRecognitionResultTier1 alloc] initWithDictionary:v16];
      [(ASRSchemaASRClientEvent *)v5 setRecognitionResultTier1:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"finalResultGenerated"];
    objc_opt_class();
    v126 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[ASRSchemaASRFinalResultGenerated alloc] initWithDictionary:v18];
      [(ASRSchemaASRClientEvent *)v5 setFinalResultGenerated:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"intermediateUtteranceInfoTier1"];
    objc_opt_class();
    int v125 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[ASRSchemaASRIntermediateUtteranceInfoTier1 alloc] initWithDictionary:v20];
      [(ASRSchemaASRClientEvent *)v5 setIntermediateUtteranceInfoTier1:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"initializationContext"];
    objc_opt_class();
    v124 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[ASRSchemaASRInitializationContext alloc] initWithDictionary:v22];
      [(ASRSchemaASRClientEvent *)v5 setInitializationContext:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"assetLoadContext"];
    objc_opt_class();
    v123 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[ASRSchemaASRAssetLoadContext alloc] initWithDictionary:v24];
      [(ASRSchemaASRClientEvent *)v5 setAssetLoadContext:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"languageModelEnrollmentContext"];
    objc_opt_class();
    int v122 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[ASRSchemaASRJitLanguageModelEnrollmentContext alloc] initWithDictionary:v26];
      [(ASRSchemaASRClientEvent *)v5 setLanguageModelEnrollmentContext:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"jitLanguageModelEnrollmentEndedTier1"];
    objc_opt_class();
    v121 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 alloc] initWithDictionary:v28];
      [(ASRSchemaASRClientEvent *)v5 setJitLanguageModelEnrollmentEndedTier1:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"audioPacketArrivalContext"];
    objc_opt_class();
    v120 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[ASRSchemaASRAudioPacketArrivalContext alloc] initWithDictionary:v30];
      [(ASRSchemaASRClientEvent *)v5 setAudioPacketArrivalContext:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"firstAudioPacketProcessed"];
    objc_opt_class();
    int v119 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[ASRSchemaASRFirstAudioPacketProcessed alloc] initWithDictionary:v32];
      [(ASRSchemaASRClientEvent *)v5 setFirstAudioPacketProcessed:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"finalAudioPacketContainingSpeechReceived"];
    objc_opt_class();
    v118 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[ASRSchemaASRFinalAudioPacketContainingSpeechReceived alloc] initWithDictionary:v34];
      [(ASRSchemaASRClientEvent *)v5 setFinalAudioPacketContainingSpeechReceived:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"sampledAudioFileStored"];
    objc_opt_class();
    v117 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[ASRSchemaASRSampledAudioFileStored alloc] initWithDictionary:v36];
      [(ASRSchemaASRClientEvent *)v5 setSampledAudioFileStored:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"sampledAudioFileStorageFailed"];
    objc_opt_class();
    int v116 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[ASRSchemaASRSampledAudioFileStorageFailed alloc] initWithDictionary:v38];
      [(ASRSchemaASRClientEvent *)v5 setSampledAudioFileStorageFailed:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"sampledAudioFileEnqueued"];
    objc_opt_class();
    v115 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[ASRSchemaASRSampledAudioFileEnqueued alloc] initWithDictionary:v40];
      [(ASRSchemaASRClientEvent *)v5 setSampledAudioFileEnqueued:v41];
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"sampledAudioFileEnqueueFailed"];
    objc_opt_class();
    v114 = (void *)v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = [[ASRSchemaASRSampledAudioFileEnqueueFailed alloc] initWithDictionary:v42];
      [(ASRSchemaASRClientEvent *)v5 setSampledAudioFileEnqueueFailed:v43];
    }
    uint64_t v44 = [v4 objectForKeyedSubscript:@"sampledAudioFileDeleted"];
    objc_opt_class();
    int v113 = (void *)v44;
    if (objc_opt_isKindOfClass())
    {
      v45 = [[ASRSchemaASRSampledAudioFileDeleted alloc] initWithDictionary:v44];
      [(ASRSchemaASRClientEvent *)v5 setSampledAudioFileDeleted:v45];
    }
    uint64_t v46 = [v4 objectForKeyedSubscript:@"sampledAudioFileDeletionFailed"];
    objc_opt_class();
    v112 = (void *)v46;
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[ASRSchemaASRSampledAudioFileDeletionFailed alloc] initWithDictionary:v46];
      [(ASRSchemaASRClientEvent *)v5 setSampledAudioFileDeletionFailed:v47];
    }
    uint64_t v48 = [v4 objectForKeyedSubscript:@"appleNeuralEngineCompilationContext"];
    objc_opt_class();
    v111 = (void *)v48;
    if (objc_opt_isKindOfClass())
    {
      v49 = [[ASRSchemaASRAppleNeuralEngineCompilationContext alloc] initWithDictionary:v48];
      [(ASRSchemaASRClientEvent *)v5 setAppleNeuralEngineCompilationContext:v49];
    }
    uint64_t v50 = [v4 objectForKeyedSubscript:@"dictationVoiceCommandMetricsReported"];
    objc_opt_class();
    int v110 = (void *)v50;
    if (objc_opt_isKindOfClass())
    {
      v51 = [[ASRSchemaASRDictationVoiceCommandMetricsReported alloc] initWithDictionary:v50];
      [(ASRSchemaASRClientEvent *)v5 setDictationVoiceCommandMetricsReported:v51];
    }
    uint64_t v52 = [v4 objectForKeyedSubscript:@"appLanguageModelLoadContext"];
    objc_opt_class();
    v109 = (void *)v52;
    if (objc_opt_isKindOfClass())
    {
      int v53 = [[ASRSchemaASRAppLanguageModelLoadContext alloc] initWithDictionary:v52];
      [(ASRSchemaASRClientEvent *)v5 setAppLanguageModelLoadContext:v53];
    }
    uint64_t v54 = [v4 objectForKeyedSubscript:@"embeddedSpeechProcessContext"];
    objc_opt_class();
    v108 = (void *)v54;
    if (objc_opt_isKindOfClass())
    {
      v55 = [[ASRSchemaASREmbeddedSpeechProcessContext alloc] initWithDictionary:v54];
      [(ASRSchemaASRClientEvent *)v5 setEmbeddedSpeechProcessContext:v55];
    }
    uint64_t v56 = [v4 objectForKeyedSubscript:@"manualEditTextClassified"];
    objc_opt_class();
    int v107 = (void *)v56;
    if (objc_opt_isKindOfClass())
    {
      v57 = [[ASRSchemaASRManualEditTextClassified alloc] initWithDictionary:v56];
      [(ASRSchemaASRClientEvent *)v5 setManualEditTextClassified:v57];
    }
    uint64_t v58 = [v4 objectForKeyedSubscript:@"manualEditMetricClassified"];
    objc_opt_class();
    v106 = (void *)v58;
    if (objc_opt_isKindOfClass())
    {
      int v59 = [[ASRSchemaASRManualEditMetricClassified alloc] initWithDictionary:v58];
      [(ASRSchemaASRClientEvent *)v5 setManualEditMetricClassified:v59];
    }
    uint64_t v60 = [v4 objectForKeyedSubscript:@"manualEditClassificationContext"];
    objc_opt_class();
    v105 = (void *)v60;
    if (objc_opt_isKindOfClass())
    {
      v61 = [[ASRSchemaASRManualEditClassificationContext alloc] initWithDictionary:v60];
      [(ASRSchemaASRClientEvent *)v5 setManualEditClassificationContext:v61];
    }
    uint64_t v62 = [v4 objectForKeyedSubscript:@"activeConfigUpdateContext"];
    objc_opt_class();
    int v104 = (void *)v62;
    if (objc_opt_isKindOfClass())
    {
      v63 = [[ASRSchemaASRActiveConfigUpdateContext alloc] initWithDictionary:v62];
      [(ASRSchemaASRClientEvent *)v5 setActiveConfigUpdateContext:v63];
    }
    uint64_t v64 = [v4 objectForKeyedSubscript:@"appleNeuralEngineModelInitializationContext"];
    objc_opt_class();
    v103 = (void *)v64;
    if (objc_opt_isKindOfClass())
    {
      int v65 = [[ASRSchemaASRAppleNeuralEngineModelInitializationContext alloc] initWithDictionary:v64];
      [(ASRSchemaASRClientEvent *)v5 setAppleNeuralEngineModelInitializationContext:v65];
    }
    uint64_t v66 = [v4 objectForKeyedSubscript:@"frameProcessingReady"];
    objc_opt_class();
    v102 = (void *)v66;
    if (objc_opt_isKindOfClass())
    {
      v67 = [[ASRSchemaASRFrameProcessingReady alloc] initWithDictionary:v66];
      [(ASRSchemaASRClientEvent *)v5 setFrameProcessingReady:v67];
    }
    uint64_t v68 = [v4 objectForKeyedSubscript:@"leadingSilenceProcessed"];
    objc_opt_class();
    int v101 = (void *)v68;
    if (objc_opt_isKindOfClass())
    {
      v69 = [[ASRSchemaASRLeadingSilenceProcessed alloc] initWithDictionary:v68];
      [(ASRSchemaASRClientEvent *)v5 setLeadingSilenceProcessed:v69];
    }
    uint64_t v70 = [v4 objectForKeyedSubscript:@"firstSecondAfterLeadingSilenceProcessed"];
    objc_opt_class();
    v100 = (void *)v70;
    if (objc_opt_isKindOfClass())
    {
      int v71 = [[ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed alloc] initWithDictionary:v70];
      [(ASRSchemaASRClientEvent *)v5 setFirstSecondAfterLeadingSilenceProcessed:v71];
    }
    uint64_t v72 = [v4 objectForKeyedSubscript:@"audioSpeechPacketArrivalContext"];
    objc_opt_class();
    v99 = (void *)v72;
    if (objc_opt_isKindOfClass())
    {
      v73 = [[ASRSchemaASRAudioSpeechPacketArrivalContext alloc] initWithDictionary:v72];
      [(ASRSchemaASRClientEvent *)v5 setAudioSpeechPacketArrivalContext:v73];
    }
    v97 = (void *)v8;
    uint64_t v74 = [v4 objectForKeyedSubscript:@"audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v75 = [[ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived alloc] initWithDictionary:v74];
      [(ASRSchemaASRClientEvent *)v5 setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:v75];
    }
    v96 = (void *)v10;
    v76 = objc_msgSend(v4, "objectForKeyedSubscript:", @"firstAudioPacketRecorded", v74);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v77 = [[ASRSchemaASRFirstAudioPacketRecorded alloc] initWithDictionary:v76];
      [(ASRSchemaASRClientEvent *)v5 setFirstAudioPacketRecorded:v77];
    }
    int v95 = (void *)v12;
    v78 = [v4 objectForKeyedSubscript:@"audioPacketContainingEndOfFirstWordReadyUpstream"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v79 = [[ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream alloc] initWithDictionary:v78];
      [(ASRSchemaASRClientEvent *)v5 setAudioPacketContainingEndOfFirstWordReadyUpstream:v79];
    }
    v94 = (void *)v14;
    int v80 = [v4 objectForKeyedSubscript:@"firstAudioPacketReadyUpstream"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v81 = [[ASRSchemaASRFirstAudioPacketReadyUpstream alloc] initWithDictionary:v80];
      [(ASRSchemaASRClientEvent *)v5 setFirstAudioPacketReadyUpstream:v81];
    }
    v93 = (void *)v16;
    v82 = [v4 objectForKeyedSubscript:@"finalAudioPacketContainingSpeechReadyUpstream"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v83 = [[ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream alloc] initWithDictionary:v82];
      [(ASRSchemaASRClientEvent *)v5 setFinalAudioPacketContainingSpeechReadyUpstream:v83];
    }
    int v98 = (void *)v6;
    v84 = [v4 objectForKeyedSubscript:@"alternativeSelectionTextCategorized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v85 = [[ASRSchemaASRAlternativeSelectionTextCategorized alloc] initWithDictionary:v84];
      [(ASRSchemaASRClientEvent *)v5 setAlternativeSelectionTextCategorized:v85];
    }
    int v86 = [v4 objectForKeyedSubscript:@"dictationVoiceCommandInfoTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v87 = [[ASRSchemaASRDictationVoiceCommandInfoTier1 alloc] initWithDictionary:v86];
      [(ASRSchemaASRClientEvent *)v5 setDictationVoiceCommandInfoTier1:v87];
    }
    v88 = [v4 objectForKeyedSubscript:@"rescoringDeliberationResultTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v89 = [[ASRSchemaASRRescoringDeliberationResultTier1 alloc] initWithDictionary:v88];
      [(ASRSchemaASRClientEvent *)v5 setRescoringDeliberationResultTier1:v89];
    }
    v90 = v5;
  }
  return v5;
}

- (ASRSchemaASRClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  unint64_t v2 = [(ASRSchemaASRClientEvent *)self dictionaryRepresentation];
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
  if (self->_activeConfigUpdateContext)
  {
    id v4 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"activeConfigUpdateContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"activeConfigUpdateContext"];
    }
  }
  if (self->_alternativeSelectionTextCategorized)
  {
    uint64_t v7 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"alternativeSelectionTextCategorized"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"alternativeSelectionTextCategorized"];
    }
  }
  if (self->_appLanguageModelLoadContext)
  {
    uint64_t v10 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"appLanguageModelLoadContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"appLanguageModelLoadContext"];
    }
  }
  if (self->_appleNeuralEngineCompilationContext)
  {
    uint64_t v13 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"appleNeuralEngineCompilationContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"appleNeuralEngineCompilationContext"];
    }
  }
  if (self->_appleNeuralEngineModelInitializationContext)
  {
    uint64_t v16 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"appleNeuralEngineModelInitializationContext"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"appleNeuralEngineModelInitializationContext"];
    }
  }
  if (self->_assetLoadContext)
  {
    v19 = [(ASRSchemaASRClientEvent *)self assetLoadContext];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"assetLoadContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"assetLoadContext"];
    }
  }
  if (self->_audioPacketArrivalContext)
  {
    uint64_t v22 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"audioPacketArrivalContext"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"audioPacketArrivalContext"];
    }
  }
  if (self->_audioPacketContainingEndOfFirstWordReadyUpstream)
  {
    v25 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"audioPacketContainingEndOfFirstWordReadyUpstream"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"audioPacketContainingEndOfFirstWordReadyUpstream"];
    }
  }
  if (self->_audioSpeechPacketArrivalContext)
  {
    uint64_t v28 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"audioSpeechPacketArrivalContext"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"audioSpeechPacketArrivalContext"];
    }
  }
  if (self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived)
  {
    v31 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived"];
    }
  }
  if (self->_dictationVoiceCommandInfoTier1)
  {
    uint64_t v34 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"dictationVoiceCommandInfoTier1"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"dictationVoiceCommandInfoTier1"];
    }
  }
  if (self->_dictationVoiceCommandMetricsReported)
  {
    v37 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"dictationVoiceCommandMetricsReported"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"dictationVoiceCommandMetricsReported"];
    }
  }
  if (self->_embeddedSpeechProcessContext)
  {
    uint64_t v40 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"embeddedSpeechProcessContext"];
    }
    else
    {
      uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"embeddedSpeechProcessContext"];
    }
  }
  if (self->_eventMetadata)
  {
    v43 = [(ASRSchemaASRClientEvent *)self eventMetadata];
    uint64_t v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_finalAudioPacketContainingSpeechReadyUpstream)
  {
    uint64_t v46 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"finalAudioPacketContainingSpeechReadyUpstream"];
    }
    else
    {
      uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"finalAudioPacketContainingSpeechReadyUpstream"];
    }
  }
  if (self->_finalAudioPacketContainingSpeechReceived)
  {
    v49 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];
    uint64_t v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"finalAudioPacketContainingSpeechReceived"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"finalAudioPacketContainingSpeechReceived"];
    }
  }
  if (self->_finalResultGenerated)
  {
    uint64_t v52 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"finalResultGenerated"];
    }
    else
    {
      uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"finalResultGenerated"];
    }
  }
  if (self->_firstAudioPacketProcessed)
  {
    v55 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];
    uint64_t v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"firstAudioPacketProcessed"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"firstAudioPacketProcessed"];
    }
  }
  if (self->_firstAudioPacketReadyUpstream)
  {
    uint64_t v58 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"firstAudioPacketReadyUpstream"];
    }
    else
    {
      uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"firstAudioPacketReadyUpstream"];
    }
  }
  if (self->_firstAudioPacketRecorded)
  {
    v61 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];
    uint64_t v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"firstAudioPacketRecorded"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"firstAudioPacketRecorded"];
    }
  }
  if (self->_firstSecondAfterLeadingSilenceProcessed)
  {
    uint64_t v64 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"firstSecondAfterLeadingSilenceProcessed"];
    }
    else
    {
      uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"firstSecondAfterLeadingSilenceProcessed"];
    }
  }
  if (self->_frameProcessingReady)
  {
    v67 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];
    uint64_t v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"frameProcessingReady"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"frameProcessingReady"];
    }
  }
  if (self->_initializationContext)
  {
    uint64_t v70 = [(ASRSchemaASRClientEvent *)self initializationContext];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"initializationContext"];
    }
    else
    {
      uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"initializationContext"];
    }
  }
  if (self->_intermediateUtteranceInfoTier1)
  {
    v73 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];
    uint64_t v74 = [v73 dictionaryRepresentation];
    if (v74)
    {
      [v3 setObject:v74 forKeyedSubscript:@"intermediateUtteranceInfoTier1"];
    }
    else
    {
      v75 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v75 forKeyedSubscript:@"intermediateUtteranceInfoTier1"];
    }
  }
  if (self->_jitLanguageModelEnrollmentEndedTier1)
  {
    v76 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];
    int v77 = [v76 dictionaryRepresentation];
    if (v77)
    {
      [v3 setObject:v77 forKeyedSubscript:@"jitLanguageModelEnrollmentEndedTier1"];
    }
    else
    {
      v78 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v78 forKeyedSubscript:@"jitLanguageModelEnrollmentEndedTier1"];
    }
  }
  if (self->_languageModelEnrollmentContext)
  {
    v79 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];
    int v80 = [v79 dictionaryRepresentation];
    if (v80)
    {
      [v3 setObject:v80 forKeyedSubscript:@"languageModelEnrollmentContext"];
    }
    else
    {
      v81 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v81 forKeyedSubscript:@"languageModelEnrollmentContext"];
    }
  }
  if (self->_leadingSilenceProcessed)
  {
    v82 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];
    int v83 = [v82 dictionaryRepresentation];
    if (v83)
    {
      [v3 setObject:v83 forKeyedSubscript:@"leadingSilenceProcessed"];
    }
    else
    {
      v84 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v84 forKeyedSubscript:@"leadingSilenceProcessed"];
    }
  }
  if (self->_manualEditClassificationContext)
  {
    v85 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];
    int v86 = [v85 dictionaryRepresentation];
    if (v86)
    {
      [v3 setObject:v86 forKeyedSubscript:@"manualEditClassificationContext"];
    }
    else
    {
      v87 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v87 forKeyedSubscript:@"manualEditClassificationContext"];
    }
  }
  if (self->_manualEditMetricClassified)
  {
    v88 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];
    int v89 = [v88 dictionaryRepresentation];
    if (v89)
    {
      [v3 setObject:v89 forKeyedSubscript:@"manualEditMetricClassified"];
    }
    else
    {
      v90 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v90 forKeyedSubscript:@"manualEditMetricClassified"];
    }
  }
  if (self->_manualEditTextClassified)
  {
    v91 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];
    int v92 = [v91 dictionaryRepresentation];
    if (v92)
    {
      [v3 setObject:v92 forKeyedSubscript:@"manualEditTextClassified"];
    }
    else
    {
      v93 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v93 forKeyedSubscript:@"manualEditTextClassified"];
    }
  }
  if (self->_packageGenerated)
  {
    v94 = [(ASRSchemaASRClientEvent *)self packageGenerated];
    int v95 = [v94 dictionaryRepresentation];
    if (v95)
    {
      [v3 setObject:v95 forKeyedSubscript:@"packageGenerated"];
    }
    else
    {
      v96 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v96 forKeyedSubscript:@"packageGenerated"];
    }
  }
  if (self->_partialResultGenerated)
  {
    v97 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];
    int v98 = [v97 dictionaryRepresentation];
    if (v98)
    {
      [v3 setObject:v98 forKeyedSubscript:@"partialResultGenerated"];
    }
    else
    {
      v99 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v99 forKeyedSubscript:@"partialResultGenerated"];
    }
  }
  if (self->_preheatContext)
  {
    v100 = [(ASRSchemaASRClientEvent *)self preheatContext];
    int v101 = [v100 dictionaryRepresentation];
    if (v101)
    {
      [v3 setObject:v101 forKeyedSubscript:@"preheatContext"];
    }
    else
    {
      v102 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v102 forKeyedSubscript:@"preheatContext"];
    }
  }
  if (self->_recognitionResultTier1)
  {
    v103 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];
    int v104 = [v103 dictionaryRepresentation];
    if (v104)
    {
      [v3 setObject:v104 forKeyedSubscript:@"recognitionResultTier1"];
    }
    else
    {
      v105 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v105 forKeyedSubscript:@"recognitionResultTier1"];
    }
  }
  if (self->_requestContext)
  {
    v106 = [(ASRSchemaASRClientEvent *)self requestContext];
    int v107 = [v106 dictionaryRepresentation];
    if (v107)
    {
      [v3 setObject:v107 forKeyedSubscript:@"requestContext"];
    }
    else
    {
      v108 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v108 forKeyedSubscript:@"requestContext"];
    }
  }
  if (self->_rescoringDeliberationResultTier1)
  {
    v109 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];
    int v110 = [v109 dictionaryRepresentation];
    if (v110)
    {
      [v3 setObject:v110 forKeyedSubscript:@"rescoringDeliberationResultTier1"];
    }
    else
    {
      v111 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v111 forKeyedSubscript:@"rescoringDeliberationResultTier1"];
    }
  }
  if (self->_sampledAudioFileDeleted)
  {
    v112 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];
    int v113 = [v112 dictionaryRepresentation];
    if (v113)
    {
      [v3 setObject:v113 forKeyedSubscript:@"sampledAudioFileDeleted"];
    }
    else
    {
      v114 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v114 forKeyedSubscript:@"sampledAudioFileDeleted"];
    }
  }
  if (self->_sampledAudioFileDeletionFailed)
  {
    v115 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];
    int v116 = [v115 dictionaryRepresentation];
    if (v116)
    {
      [v3 setObject:v116 forKeyedSubscript:@"sampledAudioFileDeletionFailed"];
    }
    else
    {
      v117 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v117 forKeyedSubscript:@"sampledAudioFileDeletionFailed"];
    }
  }
  if (self->_sampledAudioFileEnqueueFailed)
  {
    v118 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];
    int v119 = [v118 dictionaryRepresentation];
    if (v119)
    {
      [v3 setObject:v119 forKeyedSubscript:@"sampledAudioFileEnqueueFailed"];
    }
    else
    {
      v120 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v120 forKeyedSubscript:@"sampledAudioFileEnqueueFailed"];
    }
  }
  if (self->_sampledAudioFileEnqueued)
  {
    v121 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];
    int v122 = [v121 dictionaryRepresentation];
    if (v122)
    {
      [v3 setObject:v122 forKeyedSubscript:@"sampledAudioFileEnqueued"];
    }
    else
    {
      v123 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v123 forKeyedSubscript:@"sampledAudioFileEnqueued"];
    }
  }
  if (self->_sampledAudioFileStorageFailed)
  {
    v124 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];
    int v125 = [v124 dictionaryRepresentation];
    if (v125)
    {
      [v3 setObject:v125 forKeyedSubscript:@"sampledAudioFileStorageFailed"];
    }
    else
    {
      v126 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v126 forKeyedSubscript:@"sampledAudioFileStorageFailed"];
    }
  }
  if (self->_sampledAudioFileStored)
  {
    objc_super v127 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];
    int v128 = [v127 dictionaryRepresentation];
    if (v128)
    {
      [v3 setObject:v128 forKeyedSubscript:@"sampledAudioFileStored"];
    }
    else
    {
      v129 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v129 forKeyedSubscript:@"sampledAudioFileStored"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v130 = v3;

  return v130;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASRSchemaASRClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(ASRSchemaASRPreheatContext *)self->_preheatContext hash] ^ v3;
  unint64_t v5 = [(ASRSchemaASRRequestContext *)self->_requestContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(ASRSchemaASRPartialResultGenerated *)self->_partialResultGenerated hash];
  unint64_t v7 = [(ASRSchemaASRPackageGenerated *)self->_packageGenerated hash];
  unint64_t v8 = v7 ^ [(ASRSchemaASRRecognitionResultTier1 *)self->_recognitionResultTier1 hash];
  unint64_t v9 = v6 ^ v8 ^ [(ASRSchemaASRFinalResultGenerated *)self->_finalResultGenerated hash];
  unint64_t v10 = [(ASRSchemaASRIntermediateUtteranceInfoTier1 *)self->_intermediateUtteranceInfoTier1 hash];
  unint64_t v11 = v10 ^ [(ASRSchemaASRInitializationContext *)self->_initializationContext hash];
  unint64_t v12 = v11 ^ [(ASRSchemaASRAssetLoadContext *)self->_assetLoadContext hash];
  unint64_t v13 = v9 ^ v12 ^ [(ASRSchemaASRJitLanguageModelEnrollmentContext *)self->_languageModelEnrollmentContext hash];
  unint64_t v14 = [(ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)self->_jitLanguageModelEnrollmentEndedTier1 hash];
  unint64_t v15 = v14 ^ [(ASRSchemaASRAudioPacketArrivalContext *)self->_audioPacketArrivalContext hash];
  unint64_t v16 = v15 ^ [(ASRSchemaASRFirstAudioPacketProcessed *)self->_firstAudioPacketProcessed hash];
  unint64_t v17 = v16 ^ [(ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)self->_finalAudioPacketContainingSpeechReceived hash];
  unint64_t v18 = v13 ^ v17 ^ [(ASRSchemaASRSampledAudioFileStored *)self->_sampledAudioFileStored hash];
  unint64_t v19 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self->_sampledAudioFileStorageFailed hash];
  unint64_t v20 = v19 ^ [(ASRSchemaASRSampledAudioFileEnqueued *)self->_sampledAudioFileEnqueued hash];
  unint64_t v21 = v20 ^ [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self->_sampledAudioFileEnqueueFailed hash];
  unint64_t v22 = v21 ^ [(ASRSchemaASRSampledAudioFileDeleted *)self->_sampledAudioFileDeleted hash];
  unint64_t v23 = v22 ^ [(ASRSchemaASRSampledAudioFileDeletionFailed *)self->_sampledAudioFileDeletionFailed hash];
  unint64_t v24 = v18 ^ v23 ^ [(ASRSchemaASRAppleNeuralEngineCompilationContext *)self->_appleNeuralEngineCompilationContext hash];
  unint64_t v25 = [(ASRSchemaASRDictationVoiceCommandMetricsReported *)self->_dictationVoiceCommandMetricsReported hash];
  unint64_t v26 = v25 ^ [(ASRSchemaASRAppLanguageModelLoadContext *)self->_appLanguageModelLoadContext hash];
  unint64_t v27 = v26 ^ [(ASRSchemaASREmbeddedSpeechProcessContext *)self->_embeddedSpeechProcessContext hash];
  unint64_t v28 = v27 ^ [(ASRSchemaASRManualEditTextClassified *)self->_manualEditTextClassified hash];
  unint64_t v29 = v28 ^ [(ASRSchemaASRManualEditMetricClassified *)self->_manualEditMetricClassified hash];
  unint64_t v30 = v29 ^ [(ASRSchemaASRManualEditClassificationContext *)self->_manualEditClassificationContext hash];
  unint64_t v31 = v24 ^ v30 ^ [(ASRSchemaASRActiveConfigUpdateContext *)self->_activeConfigUpdateContext hash];
  unint64_t v32 = [(ASRSchemaASRAppleNeuralEngineModelInitializationContext *)self->_appleNeuralEngineModelInitializationContext hash];
  unint64_t v33 = v32 ^ [(ASRSchemaASRFrameProcessingReady *)self->_frameProcessingReady hash];
  unint64_t v34 = v33 ^ [(ASRSchemaASRLeadingSilenceProcessed *)self->_leadingSilenceProcessed hash];
  unint64_t v35 = v34 ^ [(ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *)self->_firstSecondAfterLeadingSilenceProcessed hash];
  unint64_t v36 = v35 ^ [(ASRSchemaASRAudioSpeechPacketArrivalContext *)self->_audioSpeechPacketArrivalContext hash];
  unint64_t v37 = v36 ^ [(ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *)self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived hash];
  unint64_t v38 = v37 ^ [(ASRSchemaASRFirstAudioPacketRecorded *)self->_firstAudioPacketRecorded hash];
  unint64_t v39 = v31 ^ v38 ^ [(ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *)self->_audioPacketContainingEndOfFirstWordReadyUpstream hash];
  unint64_t v40 = [(ASRSchemaASRFirstAudioPacketReadyUpstream *)self->_firstAudioPacketReadyUpstream hash];
  unint64_t v41 = v40 ^ [(ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)self->_finalAudioPacketContainingSpeechReadyUpstream hash];
  unint64_t v42 = v41 ^ [(ASRSchemaASRAlternativeSelectionTextCategorized *)self->_alternativeSelectionTextCategorized hash];
  unint64_t v43 = v42 ^ [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self->_dictationVoiceCommandInfoTier1 hash];
  return v39 ^ v43 ^ [(ASRSchemaASRRescoringDeliberationResultTier1 *)self->_rescoringDeliberationResultTier1 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_213;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_213;
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v8 = [(ASRSchemaASRClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(ASRSchemaASRClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self preheatContext];
  unint64_t v7 = [v4 preheatContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v13 = [(ASRSchemaASRClientEvent *)self preheatContext];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(ASRSchemaASRClientEvent *)self preheatContext];
    unint64_t v16 = [v4 preheatContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self requestContext];
  unint64_t v7 = [v4 requestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v18 = [(ASRSchemaASRClientEvent *)self requestContext];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(ASRSchemaASRClientEvent *)self requestContext];
    unint64_t v21 = [v4 requestContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];
  unint64_t v7 = [v4 partialResultGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v23 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    unint64_t v25 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];
    unint64_t v26 = [v4 partialResultGenerated];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self packageGenerated];
  unint64_t v7 = [v4 packageGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v28 = [(ASRSchemaASRClientEvent *)self packageGenerated];
  if (v28)
  {
    unint64_t v29 = (void *)v28;
    unint64_t v30 = [(ASRSchemaASRClientEvent *)self packageGenerated];
    unint64_t v31 = [v4 packageGenerated];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];
  unint64_t v7 = [v4 recognitionResultTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v33 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];
  if (v33)
  {
    unint64_t v34 = (void *)v33;
    unint64_t v35 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];
    unint64_t v36 = [v4 recognitionResultTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];
  unint64_t v7 = [v4 finalResultGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v38 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];
  if (v38)
  {
    unint64_t v39 = (void *)v38;
    unint64_t v40 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];
    unint64_t v41 = [v4 finalResultGenerated];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];
  unint64_t v7 = [v4 intermediateUtteranceInfoTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v43 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];
  if (v43)
  {
    uint64_t v44 = (void *)v43;
    v45 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];
    uint64_t v46 = [v4 intermediateUtteranceInfoTier1];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self initializationContext];
  unint64_t v7 = [v4 initializationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v48 = [(ASRSchemaASRClientEvent *)self initializationContext];
  if (v48)
  {
    v49 = (void *)v48;
    uint64_t v50 = [(ASRSchemaASRClientEvent *)self initializationContext];
    v51 = [v4 initializationContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self assetLoadContext];
  unint64_t v7 = [v4 assetLoadContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v53 = [(ASRSchemaASRClientEvent *)self assetLoadContext];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    v55 = [(ASRSchemaASRClientEvent *)self assetLoadContext];
    uint64_t v56 = [v4 assetLoadContext];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];
  unint64_t v7 = [v4 languageModelEnrollmentContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v58 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];
  if (v58)
  {
    int v59 = (void *)v58;
    uint64_t v60 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];
    v61 = [v4 languageModelEnrollmentContext];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];
  unint64_t v7 = [v4 jitLanguageModelEnrollmentEndedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v63 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];
  if (v63)
  {
    uint64_t v64 = (void *)v63;
    int v65 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];
    uint64_t v66 = [v4 jitLanguageModelEnrollmentEndedTier1];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];
  unint64_t v7 = [v4 audioPacketArrivalContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v68 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];
  if (v68)
  {
    v69 = (void *)v68;
    uint64_t v70 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];
    int v71 = [v4 audioPacketArrivalContext];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];
  unint64_t v7 = [v4 firstAudioPacketProcessed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v73 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];
  if (v73)
  {
    uint64_t v74 = (void *)v73;
    v75 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];
    v76 = [v4 firstAudioPacketProcessed];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];
  unint64_t v7 = [v4 finalAudioPacketContainingSpeechReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v78 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];
  if (v78)
  {
    v79 = (void *)v78;
    int v80 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];
    v81 = [v4 finalAudioPacketContainingSpeechReceived];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];
  unint64_t v7 = [v4 sampledAudioFileStored];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v83 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];
    int v86 = [v4 sampledAudioFileStored];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];
  unint64_t v7 = [v4 sampledAudioFileStorageFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v88 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];
  if (v88)
  {
    int v89 = (void *)v88;
    v90 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];
    v91 = [v4 sampledAudioFileStorageFailed];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];
  unint64_t v7 = [v4 sampledAudioFileEnqueued];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v93 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];
  if (v93)
  {
    v94 = (void *)v93;
    int v95 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];
    v96 = [v4 sampledAudioFileEnqueued];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];
  unint64_t v7 = [v4 sampledAudioFileEnqueueFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v98 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];
    int v101 = [v4 sampledAudioFileEnqueueFailed];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];
  unint64_t v7 = [v4 sampledAudioFileDeleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v103 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];
  if (v103)
  {
    int v104 = (void *)v103;
    v105 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];
    v106 = [v4 sampledAudioFileDeleted];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];
  unint64_t v7 = [v4 sampledAudioFileDeletionFailed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v108 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];
  if (v108)
  {
    v109 = (void *)v108;
    int v110 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];
    v111 = [v4 sampledAudioFileDeletionFailed];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];
  unint64_t v7 = [v4 appleNeuralEngineCompilationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v113 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];
  if (v113)
  {
    v114 = (void *)v113;
    v115 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];
    int v116 = [v4 appleNeuralEngineCompilationContext];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];
  unint64_t v7 = [v4 dictationVoiceCommandMetricsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v118 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];
  if (v118)
  {
    int v119 = (void *)v118;
    v120 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];
    v121 = [v4 dictationVoiceCommandMetricsReported];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];
  unint64_t v7 = [v4 appLanguageModelLoadContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v123 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];
  if (v123)
  {
    v124 = (void *)v123;
    int v125 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];
    v126 = [v4 appLanguageModelLoadContext];
    int v127 = [v125 isEqual:v126];

    if (!v127) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];
  unint64_t v7 = [v4 embeddedSpeechProcessContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v128 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];
  if (v128)
  {
    v129 = (void *)v128;
    id v130 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];
    int v131 = [v4 embeddedSpeechProcessContext];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];
  unint64_t v7 = [v4 manualEditTextClassified];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v133 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];
  if (v133)
  {
    objc_super v134 = (void *)v133;
    v135 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];
    v136 = [v4 manualEditTextClassified];
    int v137 = [v135 isEqual:v136];

    if (!v137) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];
  unint64_t v7 = [v4 manualEditMetricClassified];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v138 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];
  if (v138)
  {
    v139 = (void *)v138;
    v140 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];
    v141 = [v4 manualEditMetricClassified];
    int v142 = [v140 isEqual:v141];

    if (!v142) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];
  unint64_t v7 = [v4 manualEditClassificationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v143 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];
  if (v143)
  {
    v144 = (void *)v143;
    v145 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];
    v146 = [v4 manualEditClassificationContext];
    int v147 = [v145 isEqual:v146];

    if (!v147) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];
  unint64_t v7 = [v4 activeConfigUpdateContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v148 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];
  if (v148)
  {
    v149 = (void *)v148;
    v150 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];
    v151 = [v4 activeConfigUpdateContext];
    int v152 = [v150 isEqual:v151];

    if (!v152) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];
  unint64_t v7 = [v4 appleNeuralEngineModelInitializationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v153 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];
  if (v153)
  {
    v154 = (void *)v153;
    v155 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];
    v156 = [v4 appleNeuralEngineModelInitializationContext];
    int v157 = [v155 isEqual:v156];

    if (!v157) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];
  unint64_t v7 = [v4 frameProcessingReady];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v158 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];
  if (v158)
  {
    v159 = (void *)v158;
    v160 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];
    v161 = [v4 frameProcessingReady];
    int v162 = [v160 isEqual:v161];

    if (!v162) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];
  unint64_t v7 = [v4 leadingSilenceProcessed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v163 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];
  if (v163)
  {
    v164 = (void *)v163;
    v165 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];
    v166 = [v4 leadingSilenceProcessed];
    int v167 = [v165 isEqual:v166];

    if (!v167) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];
  unint64_t v7 = [v4 firstSecondAfterLeadingSilenceProcessed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v168 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];
  if (v168)
  {
    v169 = (void *)v168;
    v170 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];
    v171 = [v4 firstSecondAfterLeadingSilenceProcessed];
    int v172 = [v170 isEqual:v171];

    if (!v172) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];
  unint64_t v7 = [v4 audioSpeechPacketArrivalContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v173 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];
  if (v173)
  {
    v174 = (void *)v173;
    v175 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];
    v176 = [v4 audioSpeechPacketArrivalContext];
    int v177 = [v175 isEqual:v176];

    if (!v177) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
  unint64_t v7 = [v4 audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v178 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
  if (v178)
  {
    v179 = (void *)v178;
    v180 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
    v181 = [v4 audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
    int v182 = [v180 isEqual:v181];

    if (!v182) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];
  unint64_t v7 = [v4 firstAudioPacketRecorded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v183 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];
  if (v183)
  {
    v184 = (void *)v183;
    v185 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];
    v186 = [v4 firstAudioPacketRecorded];
    int v187 = [v185 isEqual:v186];

    if (!v187) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];
  unint64_t v7 = [v4 audioPacketContainingEndOfFirstWordReadyUpstream];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v188 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];
  if (v188)
  {
    v189 = (void *)v188;
    v190 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];
    v191 = [v4 audioPacketContainingEndOfFirstWordReadyUpstream];
    int v192 = [v190 isEqual:v191];

    if (!v192) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];
  unint64_t v7 = [v4 firstAudioPacketReadyUpstream];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v193 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];
  if (v193)
  {
    v194 = (void *)v193;
    v195 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];
    v196 = [v4 firstAudioPacketReadyUpstream];
    int v197 = [v195 isEqual:v196];

    if (!v197) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];
  unint64_t v7 = [v4 finalAudioPacketContainingSpeechReadyUpstream];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v198 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];
  if (v198)
  {
    v199 = (void *)v198;
    v200 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];
    v201 = [v4 finalAudioPacketContainingSpeechReadyUpstream];
    int v202 = [v200 isEqual:v201];

    if (!v202) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];
  unint64_t v7 = [v4 alternativeSelectionTextCategorized];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v203 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];
  if (v203)
  {
    v204 = (void *)v203;
    v205 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];
    v206 = [v4 alternativeSelectionTextCategorized];
    int v207 = [v205 isEqual:v206];

    if (!v207) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];
  unint64_t v7 = [v4 dictationVoiceCommandInfoTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_212;
  }
  uint64_t v208 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];
  if (v208)
  {
    v209 = (void *)v208;
    v210 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];
    v211 = [v4 dictationVoiceCommandInfoTier1];
    int v212 = [v210 isEqual:v211];

    if (!v212) {
      goto LABEL_213;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];
  unint64_t v7 = [v4 rescoringDeliberationResultTier1];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v213 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];
    if (!v213)
    {

LABEL_216:
      BOOL v218 = 1;
      goto LABEL_214;
    }
    v214 = (void *)v213;
    v215 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];
    v216 = [v4 rescoringDeliberationResultTier1];
    char v217 = [v215 isEqual:v216];

    if (v217) {
      goto LABEL_216;
    }
  }
  else
  {
LABEL_212:
  }
LABEL_213:
  BOOL v218 = 0;
LABEL_214:

  return v218;
}

- (void)writeTo:(id)a3
{
  id v88 = a3;
  id v4 = [(ASRSchemaASRClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(ASRSchemaASRClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ASRSchemaASRClientEvent *)self preheatContext];

  if (v6)
  {
    unint64_t v7 = [(ASRSchemaASRClientEvent *)self preheatContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ASRSchemaASRClientEvent *)self requestContext];

  if (v8)
  {
    unint64_t v9 = [(ASRSchemaASRClientEvent *)self requestContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];

  if (v10)
  {
    unint64_t v11 = [(ASRSchemaASRClientEvent *)self partialResultGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(ASRSchemaASRClientEvent *)self packageGenerated];

  if (v12)
  {
    uint64_t v13 = [(ASRSchemaASRClientEvent *)self packageGenerated];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];

  if (v14)
  {
    unint64_t v15 = [(ASRSchemaASRClientEvent *)self recognitionResultTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];

  if (v16)
  {
    int v17 = [(ASRSchemaASRClientEvent *)self finalResultGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];

  if (v18)
  {
    unint64_t v19 = [(ASRSchemaASRClientEvent *)self intermediateUtteranceInfoTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(ASRSchemaASRClientEvent *)self initializationContext];

  if (v20)
  {
    unint64_t v21 = [(ASRSchemaASRClientEvent *)self initializationContext];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(ASRSchemaASRClientEvent *)self assetLoadContext];

  if (v22)
  {
    uint64_t v23 = [(ASRSchemaASRClientEvent *)self assetLoadContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];

  if (v24)
  {
    unint64_t v25 = [(ASRSchemaASRClientEvent *)self languageModelEnrollmentContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v26 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];

  if (v26)
  {
    int v27 = [(ASRSchemaASRClientEvent *)self jitLanguageModelEnrollmentEndedTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];

  if (v28)
  {
    unint64_t v29 = [(ASRSchemaASRClientEvent *)self audioPacketArrivalContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v30 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];

  if (v30)
  {
    unint64_t v31 = [(ASRSchemaASRClientEvent *)self firstAudioPacketProcessed];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];

  if (v32)
  {
    uint64_t v33 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReceived];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v34 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];

  if (v34)
  {
    unint64_t v35 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStored];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v36 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];

  if (v36)
  {
    int v37 = [(ASRSchemaASRClientEvent *)self sampledAudioFileStorageFailed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];

  if (v38)
  {
    unint64_t v39 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueued];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v40 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];

  if (v40)
  {
    unint64_t v41 = [(ASRSchemaASRClientEvent *)self sampledAudioFileEnqueueFailed];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];

  if (v42)
  {
    uint64_t v43 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeleted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v44 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];

  if (v44)
  {
    v45 = [(ASRSchemaASRClientEvent *)self sampledAudioFileDeletionFailed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v46 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];

  if (v46)
  {
    int v47 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineCompilationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];

  if (v48)
  {
    v49 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandMetricsReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v50 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];

  if (v50)
  {
    v51 = [(ASRSchemaASRClientEvent *)self appLanguageModelLoadContext];
    PBDataWriterWriteSubmessage();
  }
  int v52 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];

  if (v52)
  {
    uint64_t v53 = [(ASRSchemaASRClientEvent *)self embeddedSpeechProcessContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v54 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];

  if (v54)
  {
    v55 = [(ASRSchemaASRClientEvent *)self manualEditTextClassified];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v56 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];

  if (v56)
  {
    int v57 = [(ASRSchemaASRClientEvent *)self manualEditMetricClassified];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v58 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];

  if (v58)
  {
    int v59 = [(ASRSchemaASRClientEvent *)self manualEditClassificationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v60 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];

  if (v60)
  {
    v61 = [(ASRSchemaASRClientEvent *)self activeConfigUpdateContext];
    PBDataWriterWriteSubmessage();
  }
  int v62 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];

  if (v62)
  {
    uint64_t v63 = [(ASRSchemaASRClientEvent *)self appleNeuralEngineModelInitializationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v64 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];

  if (v64)
  {
    int v65 = [(ASRSchemaASRClientEvent *)self frameProcessingReady];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v66 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];

  if (v66)
  {
    int v67 = [(ASRSchemaASRClientEvent *)self leadingSilenceProcessed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v68 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];

  if (v68)
  {
    v69 = [(ASRSchemaASRClientEvent *)self firstSecondAfterLeadingSilenceProcessed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v70 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];

  if (v70)
  {
    int v71 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketArrivalContext];
    PBDataWriterWriteSubmessage();
  }
  int v72 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];

  if (v72)
  {
    uint64_t v73 = [(ASRSchemaASRClientEvent *)self audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v74 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];

  if (v74)
  {
    v75 = [(ASRSchemaASRClientEvent *)self firstAudioPacketRecorded];
    PBDataWriterWriteSubmessage();
  }
  v76 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];

  if (v76)
  {
    int v77 = [(ASRSchemaASRClientEvent *)self audioPacketContainingEndOfFirstWordReadyUpstream];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v78 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];

  if (v78)
  {
    v79 = [(ASRSchemaASRClientEvent *)self firstAudioPacketReadyUpstream];
    PBDataWriterWriteSubmessage();
  }
  int v80 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];

  if (v80)
  {
    v81 = [(ASRSchemaASRClientEvent *)self finalAudioPacketContainingSpeechReadyUpstream];
    PBDataWriterWriteSubmessage();
  }
  int v82 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];

  if (v82)
  {
    uint64_t v83 = [(ASRSchemaASRClientEvent *)self alternativeSelectionTextCategorized];
    PBDataWriterWriteSubmessage();
  }
  v84 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];

  if (v84)
  {
    v85 = [(ASRSchemaASRClientEvent *)self dictationVoiceCommandInfoTier1];
    PBDataWriterWriteSubmessage();
  }
  int v86 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];

  if (v86)
  {
    int v87 = [(ASRSchemaASRClientEvent *)self rescoringDeliberationResultTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteRescoringDeliberationResultTier1
{
  if (self->_whichEvent_Type == 141)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rescoringDeliberationResultTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRRescoringDeliberationResultTier1)rescoringDeliberationResultTier1
{
  if (self->_whichEvent_Type == 141) {
    unint64_t v2 = self->_rescoringDeliberationResultTier1;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setRescoringDeliberationResultTier1:(id)a3
{
  id v4 = (ASRSchemaASRRescoringDeliberationResultTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  unint64_t v45 = 141;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = v4;
}

- (void)deleteDictationVoiceCommandInfoTier1
{
  if (self->_whichEvent_Type == 140)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationVoiceCommandInfoTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRDictationVoiceCommandInfoTier1)dictationVoiceCommandInfoTier1
{
  if (self->_whichEvent_Type == 140) {
    unint64_t v2 = self->_dictationVoiceCommandInfoTier1;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setDictationVoiceCommandInfoTier1:(id)a3
{
  id v4 = (ASRSchemaASRDictationVoiceCommandInfoTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 140;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = v4;
}

- (void)deleteAlternativeSelectionTextCategorized
{
  if (self->_whichEvent_Type == 139)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_alternativeSelectionTextCategorized = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAlternativeSelectionTextCategorized)alternativeSelectionTextCategorized
{
  if (self->_whichEvent_Type == 139) {
    unint64_t v2 = self->_alternativeSelectionTextCategorized;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAlternativeSelectionTextCategorized:(id)a3
{
  id v4 = (ASRSchemaASRAlternativeSelectionTextCategorized *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 139;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = v4;
}

- (void)deleteFinalAudioPacketContainingSpeechReadyUpstream
{
  if (self->_whichEvent_Type == 138)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_finalAudioPacketContainingSpeechReadyUpstream = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)finalAudioPacketContainingSpeechReadyUpstream
{
  if (self->_whichEvent_Type == 138) {
    unint64_t v2 = self->_finalAudioPacketContainingSpeechReadyUpstream;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFinalAudioPacketContainingSpeechReadyUpstream:(id)a3
{
  id v4 = (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 138;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = v4;
}

- (void)deleteFirstAudioPacketReadyUpstream
{
  if (self->_whichEvent_Type == 137)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_firstAudioPacketReadyUpstream = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFirstAudioPacketReadyUpstream)firstAudioPacketReadyUpstream
{
  if (self->_whichEvent_Type == 137) {
    unint64_t v2 = self->_firstAudioPacketReadyUpstream;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFirstAudioPacketReadyUpstream:(id)a3
{
  id v4 = (ASRSchemaASRFirstAudioPacketReadyUpstream *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 137;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = v4;
}

- (void)deleteAudioPacketContainingEndOfFirstWordReadyUpstream
{
  if (self->_whichEvent_Type == 136)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream)audioPacketContainingEndOfFirstWordReadyUpstream
{
  if (self->_whichEvent_Type == 136) {
    unint64_t v2 = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAudioPacketContainingEndOfFirstWordReadyUpstream:(id)a3
{
  id v4 = (ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 136;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = v4;
}

- (void)deleteFirstAudioPacketRecorded
{
  if (self->_whichEvent_Type == 135)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_firstAudioPacketRecorded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFirstAudioPacketRecorded)firstAudioPacketRecorded
{
  if (self->_whichEvent_Type == 135) {
    unint64_t v2 = self->_firstAudioPacketRecorded;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFirstAudioPacketRecorded:(id)a3
{
  id v4 = (ASRSchemaASRFirstAudioPacketRecorded *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 135;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = v4;
}

- (void)deleteAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived
{
  if (self->_whichEvent_Type == 134)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived)audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived
{
  if (self->_whichEvent_Type == 134) {
    unint64_t v2 = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:(id)a3
{
  id v4 = (ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 134;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = v4;
}

- (void)deleteAudioSpeechPacketArrivalContext
{
  if (self->_whichEvent_Type == 133)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioSpeechPacketArrivalContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAudioSpeechPacketArrivalContext)audioSpeechPacketArrivalContext
{
  if (self->_whichEvent_Type == 133) {
    unint64_t v2 = self->_audioSpeechPacketArrivalContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAudioSpeechPacketArrivalContext:(id)a3
{
  id v4 = (ASRSchemaASRAudioSpeechPacketArrivalContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 133;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = v4;
}

- (void)deleteFirstSecondAfterLeadingSilenceProcessed
{
  if (self->_whichEvent_Type == 132)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_firstSecondAfterLeadingSilenceProcessed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed)firstSecondAfterLeadingSilenceProcessed
{
  if (self->_whichEvent_Type == 132) {
    unint64_t v2 = self->_firstSecondAfterLeadingSilenceProcessed;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFirstSecondAfterLeadingSilenceProcessed:(id)a3
{
  id v4 = (ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 132;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = v4;
}

- (void)deleteLeadingSilenceProcessed
{
  if (self->_whichEvent_Type == 131)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_leadingSilenceProcessed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRLeadingSilenceProcessed)leadingSilenceProcessed
{
  if (self->_whichEvent_Type == 131) {
    unint64_t v2 = self->_leadingSilenceProcessed;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setLeadingSilenceProcessed:(id)a3
{
  id v4 = (ASRSchemaASRLeadingSilenceProcessed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 131;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = v4;
}

- (void)deleteFrameProcessingReady
{
  if (self->_whichEvent_Type == 130)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_frameProcessingReady = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFrameProcessingReady)frameProcessingReady
{
  if (self->_whichEvent_Type == 130) {
    unint64_t v2 = self->_frameProcessingReady;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFrameProcessingReady:(id)a3
{
  id v4 = (ASRSchemaASRFrameProcessingReady *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 130;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = v4;
}

- (void)deleteAppleNeuralEngineModelInitializationContext
{
  if (self->_whichEvent_Type == 129)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appleNeuralEngineModelInitializationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAppleNeuralEngineModelInitializationContext)appleNeuralEngineModelInitializationContext
{
  if (self->_whichEvent_Type == 129) {
    unint64_t v2 = self->_appleNeuralEngineModelInitializationContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAppleNeuralEngineModelInitializationContext:(id)a3
{
  id v4 = (ASRSchemaASRAppleNeuralEngineModelInitializationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 129;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = v4;
}

- (void)deleteActiveConfigUpdateContext
{
  if (self->_whichEvent_Type == 128)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_activeConfigUpdateContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRActiveConfigUpdateContext)activeConfigUpdateContext
{
  if (self->_whichEvent_Type == 128) {
    unint64_t v2 = self->_activeConfigUpdateContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setActiveConfigUpdateContext:(id)a3
{
  id v4 = (ASRSchemaASRActiveConfigUpdateContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  self->_unint64_t whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = v4;
}

- (void)deleteManualEditClassificationContext
{
  if (self->_whichEvent_Type == 127)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_manualEditClassificationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRManualEditClassificationContext)manualEditClassificationContext
{
  if (self->_whichEvent_Type == 127) {
    unint64_t v2 = self->_manualEditClassificationContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setManualEditClassificationContext:(id)a3
{
  id v4 = (ASRSchemaASRManualEditClassificationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 127;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = v4;
}

- (void)deleteManualEditMetricClassified
{
  if (self->_whichEvent_Type == 126)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_manualEditMetricClassified = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRManualEditMetricClassified)manualEditMetricClassified
{
  if (self->_whichEvent_Type == 126) {
    unint64_t v2 = self->_manualEditMetricClassified;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setManualEditMetricClassified:(id)a3
{
  id v4 = (ASRSchemaASRManualEditMetricClassified *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 126;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = v4;
}

- (void)deleteManualEditTextClassified
{
  if (self->_whichEvent_Type == 125)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_manualEditTextClassified = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRManualEditTextClassified)manualEditTextClassified
{
  if (self->_whichEvent_Type == 125) {
    unint64_t v2 = self->_manualEditTextClassified;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setManualEditTextClassified:(id)a3
{
  id v4 = (ASRSchemaASRManualEditTextClassified *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 125;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = v4;
}

- (void)deleteEmbeddedSpeechProcessContext
{
  if (self->_whichEvent_Type == 124)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_embeddedSpeechProcessContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASREmbeddedSpeechProcessContext)embeddedSpeechProcessContext
{
  if (self->_whichEvent_Type == 124) {
    unint64_t v2 = self->_embeddedSpeechProcessContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setEmbeddedSpeechProcessContext:(id)a3
{
  id v4 = (ASRSchemaASREmbeddedSpeechProcessContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 124;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = v4;
}

- (void)deleteAppLanguageModelLoadContext
{
  if (self->_whichEvent_Type == 123)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appLanguageModelLoadContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAppLanguageModelLoadContext)appLanguageModelLoadContext
{
  if (self->_whichEvent_Type == 123) {
    unint64_t v2 = self->_appLanguageModelLoadContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAppLanguageModelLoadContext:(id)a3
{
  id v4 = (ASRSchemaASRAppLanguageModelLoadContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 123;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = v4;
}

- (void)deleteDictationVoiceCommandMetricsReported
{
  if (self->_whichEvent_Type == 122)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationVoiceCommandMetricsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRDictationVoiceCommandMetricsReported)dictationVoiceCommandMetricsReported
{
  if (self->_whichEvent_Type == 122) {
    unint64_t v2 = self->_dictationVoiceCommandMetricsReported;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setDictationVoiceCommandMetricsReported:(id)a3
{
  id v4 = (ASRSchemaASRDictationVoiceCommandMetricsReported *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 122;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = v4;
}

- (void)deleteAppleNeuralEngineCompilationContext
{
  if (self->_whichEvent_Type == 121)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_appleNeuralEngineCompilationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAppleNeuralEngineCompilationContext)appleNeuralEngineCompilationContext
{
  if (self->_whichEvent_Type == 121) {
    unint64_t v2 = self->_appleNeuralEngineCompilationContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAppleNeuralEngineCompilationContext:(id)a3
{
  id v4 = (ASRSchemaASRAppleNeuralEngineCompilationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 121;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = v4;
}

- (void)deleteSampledAudioFileDeletionFailed
{
  if (self->_whichEvent_Type == 120)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sampledAudioFileDeletionFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRSampledAudioFileDeletionFailed)sampledAudioFileDeletionFailed
{
  if (self->_whichEvent_Type == 120) {
    unint64_t v2 = self->_sampledAudioFileDeletionFailed;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSampledAudioFileDeletionFailed:(id)a3
{
  id v4 = (ASRSchemaASRSampledAudioFileDeletionFailed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 120;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = v4;
}

- (void)deleteSampledAudioFileDeleted
{
  if (self->_whichEvent_Type == 119)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sampledAudioFileDeleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRSampledAudioFileDeleted)sampledAudioFileDeleted
{
  if (self->_whichEvent_Type == 119) {
    unint64_t v2 = self->_sampledAudioFileDeleted;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSampledAudioFileDeleted:(id)a3
{
  id v4 = (ASRSchemaASRSampledAudioFileDeleted *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 119;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = v4;
}

- (void)deleteSampledAudioFileEnqueueFailed
{
  if (self->_whichEvent_Type == 118)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sampledAudioFileEnqueueFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRSampledAudioFileEnqueueFailed)sampledAudioFileEnqueueFailed
{
  if (self->_whichEvent_Type == 118) {
    unint64_t v2 = self->_sampledAudioFileEnqueueFailed;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSampledAudioFileEnqueueFailed:(id)a3
{
  id v4 = (ASRSchemaASRSampledAudioFileEnqueueFailed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 118;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = v4;
}

- (void)deleteSampledAudioFileEnqueued
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sampledAudioFileEnqueued = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRSampledAudioFileEnqueued)sampledAudioFileEnqueued
{
  if (self->_whichEvent_Type == 117) {
    unint64_t v2 = self->_sampledAudioFileEnqueued;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSampledAudioFileEnqueued:(id)a3
{
  id v4 = (ASRSchemaASRSampledAudioFileEnqueued *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 117;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = v4;
}

- (void)deleteSampledAudioFileStorageFailed
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sampledAudioFileStorageFailed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRSampledAudioFileStorageFailed)sampledAudioFileStorageFailed
{
  if (self->_whichEvent_Type == 116) {
    unint64_t v2 = self->_sampledAudioFileStorageFailed;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSampledAudioFileStorageFailed:(id)a3
{
  id v4 = (ASRSchemaASRSampledAudioFileStorageFailed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 116;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = v4;
}

- (void)deleteSampledAudioFileStored
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sampledAudioFileStored = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRSampledAudioFileStored)sampledAudioFileStored
{
  if (self->_whichEvent_Type == 115) {
    unint64_t v2 = self->_sampledAudioFileStored;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setSampledAudioFileStored:(id)a3
{
  id v4 = (ASRSchemaASRSampledAudioFileStored *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 115;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = v4;
}

- (void)deleteFinalAudioPacketContainingSpeechReceived
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_finalAudioPacketContainingSpeechReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)finalAudioPacketContainingSpeechReceived
{
  if (self->_whichEvent_Type == 114) {
    unint64_t v2 = self->_finalAudioPacketContainingSpeechReceived;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFinalAudioPacketContainingSpeechReceived:(id)a3
{
  id v4 = (ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 114;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = v4;
}

- (void)deleteFirstAudioPacketProcessed
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_firstAudioPacketProcessed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFirstAudioPacketProcessed)firstAudioPacketProcessed
{
  if (self->_whichEvent_Type == 113) {
    unint64_t v2 = self->_firstAudioPacketProcessed;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFirstAudioPacketProcessed:(id)a3
{
  id v4 = (ASRSchemaASRFirstAudioPacketProcessed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 113;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = v4;
}

- (void)deleteAudioPacketArrivalContext
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioPacketArrivalContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAudioPacketArrivalContext)audioPacketArrivalContext
{
  if (self->_whichEvent_Type == 112) {
    unint64_t v2 = self->_audioPacketArrivalContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAudioPacketArrivalContext:(id)a3
{
  id v4 = (ASRSchemaASRAudioPacketArrivalContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 112;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = v4;
}

- (void)deleteJitLanguageModelEnrollmentEndedTier1
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_jitLanguageModelEnrollmentEndedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)jitLanguageModelEnrollmentEndedTier1
{
  if (self->_whichEvent_Type == 111) {
    unint64_t v2 = self->_jitLanguageModelEnrollmentEndedTier1;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setJitLanguageModelEnrollmentEndedTier1:(id)a3
{
  id v4 = (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 111;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = v4;
}

- (void)deleteLanguageModelEnrollmentContext
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_languageModelEnrollmentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRJitLanguageModelEnrollmentContext)languageModelEnrollmentContext
{
  if (self->_whichEvent_Type == 110) {
    unint64_t v2 = self->_languageModelEnrollmentContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setLanguageModelEnrollmentContext:(id)a3
{
  id v4 = (ASRSchemaASRJitLanguageModelEnrollmentContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 110;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = v4;
}

- (void)deleteAssetLoadContext
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assetLoadContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRAssetLoadContext)assetLoadContext
{
  if (self->_whichEvent_Type == 109) {
    unint64_t v2 = self->_assetLoadContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setAssetLoadContext:(id)a3
{
  id v4 = (ASRSchemaASRAssetLoadContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 109;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = v4;
}

- (void)deleteInitializationContext
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_initializationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRInitializationContext)initializationContext
{
  if (self->_whichEvent_Type == 108) {
    unint64_t v2 = self->_initializationContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setInitializationContext:(id)a3
{
  id v4 = (ASRSchemaASRInitializationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 108;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  initializationContext = self->_initializationContext;
  self->_initializationContext = v4;
}

- (void)deleteIntermediateUtteranceInfoTier1
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_intermediateUtteranceInfoTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRIntermediateUtteranceInfoTier1)intermediateUtteranceInfoTier1
{
  if (self->_whichEvent_Type == 107) {
    unint64_t v2 = self->_intermediateUtteranceInfoTier1;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setIntermediateUtteranceInfoTier1:(id)a3
{
  id v4 = (ASRSchemaASRIntermediateUtteranceInfoTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 107;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = v4;
}

- (void)deleteFinalResultGenerated
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_finalResultGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRFinalResultGenerated)finalResultGenerated
{
  if (self->_whichEvent_Type == 106) {
    unint64_t v2 = self->_finalResultGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setFinalResultGenerated:(id)a3
{
  id v4 = (ASRSchemaASRFinalResultGenerated *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 106;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = v4;
}

- (void)deleteRecognitionResultTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_recognitionResultTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRRecognitionResultTier1)recognitionResultTier1
{
  if (self->_whichEvent_Type == 105) {
    unint64_t v2 = self->_recognitionResultTier1;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setRecognitionResultTier1:(id)a3
{
  id v4 = (ASRSchemaASRRecognitionResultTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 105;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = v4;
}

- (void)deletePackageGenerated
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_packageGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRPackageGenerated)packageGenerated
{
  if (self->_whichEvent_Type == 104) {
    unint64_t v2 = self->_packageGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPackageGenerated:(id)a3
{
  id v4 = (ASRSchemaASRPackageGenerated *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 104;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = v4;
}

- (void)deletePartialResultGenerated
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_partialResultGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRPartialResultGenerated)partialResultGenerated
{
  if (self->_whichEvent_Type == 103) {
    unint64_t v2 = self->_partialResultGenerated;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPartialResultGenerated:(id)a3
{
  id v4 = (ASRSchemaASRPartialResultGenerated *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 103;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = v4;
}

- (void)deleteRequestContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRRequestContext)requestContext
{
  if (self->_whichEvent_Type == 102) {
    unint64_t v2 = self->_requestContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setRequestContext:(id)a3
{
  id v4 = (ASRSchemaASRRequestContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 102;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  requestContext = self->_requestContext;
  self->_requestContext = v4;
}

- (void)deletePreheatContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_preheatContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ASRSchemaASRPreheatContext)preheatContext
{
  if (self->_whichEvent_Type == 101) {
    unint64_t v2 = self->_preheatContext;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setPreheatContext:(id)a3
{
  id v4 = (ASRSchemaASRPreheatContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  rescoringDeliberationResultTier1 = self->_rescoringDeliberationResultTier1;
  self->_rescoringDeliberationResultTier1 = 0;

  unint64_t v45 = 101;
  if (!v4) {
    unint64_t v45 = 0;
  }
  self->_unint64_t whichEvent_Type = v45;
  preheatContext = self->_preheatContext;
  self->_preheatContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(ASRSchemaASRClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0x28) {
    return @"com.apple.aiml.siri.asr.ASRClientEvent";
  }
  else {
    return off_1E5EAC690[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 20;
}

@end