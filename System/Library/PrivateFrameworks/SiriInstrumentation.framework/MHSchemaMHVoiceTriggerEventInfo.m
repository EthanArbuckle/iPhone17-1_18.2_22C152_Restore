@interface MHSchemaMHVoiceTriggerEventInfo
- (BOOL)deviceHandheld;
- (BOOL)didAudioStall;
- (BOOL)didWakeAP;
- (BOOL)hasActiveChannel;
- (BOOL)hasAnalyzerPrependingSamples;
- (BOOL)hasAnalyzerTrailingSamples;
- (BOOL)hasAudioProviderUUID;
- (BOOL)hasBiometricClue;
- (BOOL)hasCaptureFilePath;
- (BOOL)hasClientStartSampleCount;
- (BOOL)hasConfigDataHash;
- (BOOL)hasConfigPath;
- (BOOL)hasConfigVersion;
- (BOOL)hasCumulativeDowntimeInSec;
- (BOOL)hasCumulativeUptimeInSec;
- (BOOL)hasDeltaTimeInNsFromlastPHSReject;
- (BOOL)hasDeviceHandheld;
- (BOOL)hasDidAudioStall;
- (BOOL)hasDidWakeAP;
- (BOOL)hasDisplayWakeTimeOffsetInNs;
- (BOOL)hasDowntimeInSec;
- (BOOL)hasEffectiveThreshold;
- (BOOL)hasEnhancedCarplayTriggerMode;
- (BOOL)hasExtraSamplesAtStart;
- (BOOL)hasHardwareSamplerate;
- (BOOL)hasHostPowerStateAtTrigger;
- (BOOL)hasIsBargeIn;
- (BOOL)hasIsContinuous;
- (BOOL)hasIsHSJSTriggerFromAlwaysOnMicBuffer;
- (BOOL)hasIsMaximized;
- (BOOL)hasIsMediaPlaying;
- (BOOL)hasIsSecondChance;
- (BOOL)hasIsTriggerEvent;
- (BOOL)hasIsWakeFromSleep;
- (BOOL)hasLastConsecutivePHSRejects;
- (BOOL)hasLastConsecutiveVTRejects;
- (BOOL)hasLastDisplayWakeTimeOffsetInNs;
- (BOOL)hasMediaVolume;
- (BOOL)hasNeptuneDetectionApiScore;
- (BOOL)hasOnBatteryPower;
- (BOOL)hasRecognizerScaleFactor;
- (BOOL)hasRecognizerScore;
- (BOOL)hasRecognizerThresholdOffset;
- (BOOL)hasRecognizerWaitTimeInNs;
- (BOOL)hasRemoteMicVADMyriadThreshold;
- (BOOL)hasRemoteMicVADScore;
- (BOOL)hasRemoteMicVADThreshold;
- (BOOL)hasSatBeingTrained;
- (BOOL)hasSatNumTrainingUtterances;
- (BOOL)hasSatScore;
- (BOOL)hasSatThreshold;
- (BOOL)hasSatTriggered;
- (BOOL)hasSecondPassAnalyerEndSampleCount;
- (BOOL)hasSecondPassAnalyerStartSampleCount;
- (BOOL)hasSecondPassAssetLoadCompleteTimeInNs;
- (BOOL)hasSecondPassAssetLoadStartTimeInNs;
- (BOOL)hasSecondPassAssetQueryCompleteTimeInNs;
- (BOOL)hasSecondPassAssetQueryStartTimeInNs;
- (BOOL)hasSecondPassAudioStreamReadyTimeInNs;
- (BOOL)hasSecondPassAudioStreamStartTimeInNs;
- (BOOL)hasSecondPassCheckerModelKeywordDetectionEndTimeInNs;
- (BOOL)hasSecondPassCheckerModelKeywordDetectionStartTimeInNs;
- (BOOL)hasSecondPassFirstAudioPacketReceptionTimeInNs;
- (BOOL)hasSecondPassLastAudioPacketReceptionTimeInNs;
- (BOOL)hasShadowMicScore;
- (BOOL)hasShadowMicScoreThresholdForVAD;
- (BOOL)hasSiriIsActiveOrOtherAssertion;
- (BOOL)hasTdSpeakerRecognizerCombinationWeight;
- (BOOL)hasTdSpeakerRecognizerCombinedScore;
- (BOOL)hasTdSpeakerRecognizerCombinedThreshold;
- (BOOL)hasTdSpeakerRecognizerScore;
- (BOOL)hasThreshold;
- (BOOL)hasTotalSampleCount;
- (BOOL)hasTotalSamplesAtEndOfCapture;
- (BOOL)hasTotalSamplesAtTriggerEnd;
- (BOOL)hasTotalSamplesAtTriggerStart;
- (BOOL)hasTriggerDurationInNs;
- (BOOL)hasTriggerEndNs;
- (BOOL)hasTriggerEndSampleCount;
- (BOOL)hasTriggerEndTime;
- (BOOL)hasTriggerEndTimeOffsetInNs;
- (BOOL)hasTriggerExplicitSatScore;
- (BOOL)hasTriggerExplicitTDSRSatScore;
- (BOOL)hasTriggerFireNs;
- (BOOL)hasTriggerFireSampleCount;
- (BOOL)hasTriggerFireTimeOffsetInNs;
- (BOOL)hasTriggerFiredTime;
- (BOOL)hasTriggerPhrase;
- (BOOL)hasTriggerScore;
- (BOOL)hasTriggerStartNs;
- (BOOL)hasTriggerStartSampleCount;
- (BOOL)hasTriggerStartTime;
- (BOOL)hasTriggerStartTimeOffsetInNs;
- (BOOL)hasTwoShotAudibleFeedbackDelayInNs;
- (BOOL)hasUptimeInSec;
- (BOOL)isBargeIn;
- (BOOL)isContinuous;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHSJSTriggerFromAlwaysOnMicBuffer;
- (BOOL)isMaximized;
- (BOOL)isMediaPlaying;
- (BOOL)isSecondChance;
- (BOOL)isTriggerEvent;
- (BOOL)isWakeFromSleep;
- (BOOL)onBatteryPower;
- (BOOL)readFrom:(id)a3;
- (BOOL)satBeingTrained;
- (BOOL)satTriggered;
- (BOOL)siriIsActiveOrOtherAssertion;
- (MHSchemaMHVoiceTriggerEventInfo)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceTriggerEventInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)captureFilePath;
- (NSString)configDataHash;
- (NSString)configPath;
- (NSString)configVersion;
- (NSString)triggerPhrase;
- (SISchemaUUID)audioProviderUUID;
- (double)lastDisplayWakeTimeOffsetInNs;
- (double)triggerEndTime;
- (double)triggerFiredTime;
- (double)triggerStartTime;
- (float)cumulativeDowntimeInSec;
- (float)cumulativeUptimeInSec;
- (float)downtimeInSec;
- (float)effectiveThreshold;
- (float)mediaVolume;
- (float)neptuneDetectionApiScore;
- (float)recognizerScaleFactor;
- (float)recognizerScore;
- (float)recognizerThresholdOffset;
- (float)remoteMicVADMyriadThreshold;
- (float)remoteMicVADScore;
- (float)remoteMicVADThreshold;
- (float)satScore;
- (float)satThreshold;
- (float)shadowMicScore;
- (float)shadowMicScoreThresholdForVAD;
- (float)tdSpeakerRecognizerCombinationWeight;
- (float)tdSpeakerRecognizerCombinedScore;
- (float)tdSpeakerRecognizerCombinedThreshold;
- (float)tdSpeakerRecognizerScore;
- (float)threshold;
- (float)triggerDurationInNs;
- (float)triggerExplicitSatScore;
- (float)triggerExplicitTDSRSatScore;
- (float)triggerScore;
- (float)uptimeInSec;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)biometricClue;
- (int)enhancedCarplayTriggerMode;
- (int)hostPowerStateAtTrigger;
- (unint64_t)analyzerPrependingSamples;
- (unint64_t)analyzerTrailingSamples;
- (unint64_t)clientStartSampleCount;
- (unint64_t)deltaTimeInNsFromlastPHSReject;
- (unint64_t)displayWakeTimeOffsetInNs;
- (unint64_t)extraSamplesAtStart;
- (unint64_t)hash;
- (unint64_t)recognizerWaitTimeInNs;
- (unint64_t)secondPassAnalyerEndSampleCount;
- (unint64_t)secondPassAnalyerStartSampleCount;
- (unint64_t)secondPassAssetLoadCompleteTimeInNs;
- (unint64_t)secondPassAssetLoadStartTimeInNs;
- (unint64_t)secondPassAssetQueryCompleteTimeInNs;
- (unint64_t)secondPassAssetQueryStartTimeInNs;
- (unint64_t)secondPassAudioStreamReadyTimeInNs;
- (unint64_t)secondPassAudioStreamStartTimeInNs;
- (unint64_t)secondPassCheckerModelKeywordDetectionEndTimeInNs;
- (unint64_t)secondPassCheckerModelKeywordDetectionStartTimeInNs;
- (unint64_t)secondPassFirstAudioPacketReceptionTimeInNs;
- (unint64_t)secondPassLastAudioPacketReceptionTimeInNs;
- (unint64_t)totalSampleCount;
- (unint64_t)totalSamplesAtEndOfCapture;
- (unint64_t)totalSamplesAtTriggerEnd;
- (unint64_t)totalSamplesAtTriggerStart;
- (unint64_t)triggerEndNs;
- (unint64_t)triggerEndSampleCount;
- (unint64_t)triggerEndTimeOffsetInNs;
- (unint64_t)triggerFireNs;
- (unint64_t)triggerFireSampleCount;
- (unint64_t)triggerFireTimeOffsetInNs;
- (unint64_t)triggerStartNs;
- (unint64_t)triggerStartSampleCount;
- (unint64_t)triggerStartTimeOffsetInNs;
- (unint64_t)twoShotAudibleFeedbackDelayInNs;
- (unsigned)activeChannel;
- (unsigned)hardwareSamplerate;
- (unsigned)lastConsecutivePHSRejects;
- (unsigned)lastConsecutiveVTRejects;
- (unsigned)satNumTrainingUtterances;
- (void)deleteActiveChannel;
- (void)deleteAnalyzerPrependingSamples;
- (void)deleteAnalyzerTrailingSamples;
- (void)deleteAudioProviderUUID;
- (void)deleteBiometricClue;
- (void)deleteCaptureFilePath;
- (void)deleteClientStartSampleCount;
- (void)deleteConfigDataHash;
- (void)deleteConfigPath;
- (void)deleteConfigVersion;
- (void)deleteCumulativeDowntimeInSec;
- (void)deleteCumulativeUptimeInSec;
- (void)deleteDeltaTimeInNsFromlastPHSReject;
- (void)deleteDeviceHandheld;
- (void)deleteDidAudioStall;
- (void)deleteDidWakeAP;
- (void)deleteDisplayWakeTimeOffsetInNs;
- (void)deleteDowntimeInSec;
- (void)deleteEffectiveThreshold;
- (void)deleteEnhancedCarplayTriggerMode;
- (void)deleteExtraSamplesAtStart;
- (void)deleteHardwareSamplerate;
- (void)deleteHostPowerStateAtTrigger;
- (void)deleteIsBargeIn;
- (void)deleteIsContinuous;
- (void)deleteIsHSJSTriggerFromAlwaysOnMicBuffer;
- (void)deleteIsMaximized;
- (void)deleteIsMediaPlaying;
- (void)deleteIsSecondChance;
- (void)deleteIsTriggerEvent;
- (void)deleteIsWakeFromSleep;
- (void)deleteLastConsecutivePHSRejects;
- (void)deleteLastConsecutiveVTRejects;
- (void)deleteLastDisplayWakeTimeOffsetInNs;
- (void)deleteMediaVolume;
- (void)deleteNeptuneDetectionApiScore;
- (void)deleteOnBatteryPower;
- (void)deleteRecognizerScaleFactor;
- (void)deleteRecognizerScore;
- (void)deleteRecognizerThresholdOffset;
- (void)deleteRecognizerWaitTimeInNs;
- (void)deleteRemoteMicVADMyriadThreshold;
- (void)deleteRemoteMicVADScore;
- (void)deleteRemoteMicVADThreshold;
- (void)deleteSatBeingTrained;
- (void)deleteSatNumTrainingUtterances;
- (void)deleteSatScore;
- (void)deleteSatThreshold;
- (void)deleteSatTriggered;
- (void)deleteSecondPassAnalyerEndSampleCount;
- (void)deleteSecondPassAnalyerStartSampleCount;
- (void)deleteSecondPassAssetLoadCompleteTimeInNs;
- (void)deleteSecondPassAssetLoadStartTimeInNs;
- (void)deleteSecondPassAssetQueryCompleteTimeInNs;
- (void)deleteSecondPassAssetQueryStartTimeInNs;
- (void)deleteSecondPassAudioStreamReadyTimeInNs;
- (void)deleteSecondPassAudioStreamStartTimeInNs;
- (void)deleteSecondPassCheckerModelKeywordDetectionEndTimeInNs;
- (void)deleteSecondPassCheckerModelKeywordDetectionStartTimeInNs;
- (void)deleteSecondPassFirstAudioPacketReceptionTimeInNs;
- (void)deleteSecondPassLastAudioPacketReceptionTimeInNs;
- (void)deleteShadowMicScore;
- (void)deleteShadowMicScoreThresholdForVAD;
- (void)deleteSiriIsActiveOrOtherAssertion;
- (void)deleteTdSpeakerRecognizerCombinationWeight;
- (void)deleteTdSpeakerRecognizerCombinedScore;
- (void)deleteTdSpeakerRecognizerCombinedThreshold;
- (void)deleteTdSpeakerRecognizerScore;
- (void)deleteThreshold;
- (void)deleteTotalSampleCount;
- (void)deleteTotalSamplesAtEndOfCapture;
- (void)deleteTotalSamplesAtTriggerEnd;
- (void)deleteTotalSamplesAtTriggerStart;
- (void)deleteTriggerDurationInNs;
- (void)deleteTriggerEndNs;
- (void)deleteTriggerEndSampleCount;
- (void)deleteTriggerEndTime;
- (void)deleteTriggerEndTimeOffsetInNs;
- (void)deleteTriggerExplicitSatScore;
- (void)deleteTriggerExplicitTDSRSatScore;
- (void)deleteTriggerFireNs;
- (void)deleteTriggerFireSampleCount;
- (void)deleteTriggerFireTimeOffsetInNs;
- (void)deleteTriggerFiredTime;
- (void)deleteTriggerPhrase;
- (void)deleteTriggerScore;
- (void)deleteTriggerStartNs;
- (void)deleteTriggerStartSampleCount;
- (void)deleteTriggerStartTime;
- (void)deleteTriggerStartTimeOffsetInNs;
- (void)deleteTwoShotAudibleFeedbackDelayInNs;
- (void)deleteUptimeInSec;
- (void)setActiveChannel:(unsigned int)a3;
- (void)setAnalyzerPrependingSamples:(unint64_t)a3;
- (void)setAnalyzerTrailingSamples:(unint64_t)a3;
- (void)setAudioProviderUUID:(id)a3;
- (void)setBiometricClue:(int)a3;
- (void)setCaptureFilePath:(id)a3;
- (void)setClientStartSampleCount:(unint64_t)a3;
- (void)setConfigDataHash:(id)a3;
- (void)setConfigPath:(id)a3;
- (void)setConfigVersion:(id)a3;
- (void)setCumulativeDowntimeInSec:(float)a3;
- (void)setCumulativeUptimeInSec:(float)a3;
- (void)setDeltaTimeInNsFromlastPHSReject:(unint64_t)a3;
- (void)setDeviceHandheld:(BOOL)a3;
- (void)setDidAudioStall:(BOOL)a3;
- (void)setDidWakeAP:(BOOL)a3;
- (void)setDisplayWakeTimeOffsetInNs:(unint64_t)a3;
- (void)setDowntimeInSec:(float)a3;
- (void)setEffectiveThreshold:(float)a3;
- (void)setEnhancedCarplayTriggerMode:(int)a3;
- (void)setExtraSamplesAtStart:(unint64_t)a3;
- (void)setHardwareSamplerate:(unsigned int)a3;
- (void)setHasActiveChannel:(BOOL)a3;
- (void)setHasAnalyzerPrependingSamples:(BOOL)a3;
- (void)setHasAnalyzerTrailingSamples:(BOOL)a3;
- (void)setHasAudioProviderUUID:(BOOL)a3;
- (void)setHasBiometricClue:(BOOL)a3;
- (void)setHasCaptureFilePath:(BOOL)a3;
- (void)setHasClientStartSampleCount:(BOOL)a3;
- (void)setHasConfigDataHash:(BOOL)a3;
- (void)setHasConfigPath:(BOOL)a3;
- (void)setHasConfigVersion:(BOOL)a3;
- (void)setHasCumulativeDowntimeInSec:(BOOL)a3;
- (void)setHasCumulativeUptimeInSec:(BOOL)a3;
- (void)setHasDeltaTimeInNsFromlastPHSReject:(BOOL)a3;
- (void)setHasDeviceHandheld:(BOOL)a3;
- (void)setHasDidAudioStall:(BOOL)a3;
- (void)setHasDidWakeAP:(BOOL)a3;
- (void)setHasDisplayWakeTimeOffsetInNs:(BOOL)a3;
- (void)setHasDowntimeInSec:(BOOL)a3;
- (void)setHasEffectiveThreshold:(BOOL)a3;
- (void)setHasEnhancedCarplayTriggerMode:(BOOL)a3;
- (void)setHasExtraSamplesAtStart:(BOOL)a3;
- (void)setHasHardwareSamplerate:(BOOL)a3;
- (void)setHasHostPowerStateAtTrigger:(BOOL)a3;
- (void)setHasIsBargeIn:(BOOL)a3;
- (void)setHasIsContinuous:(BOOL)a3;
- (void)setHasIsHSJSTriggerFromAlwaysOnMicBuffer:(BOOL)a3;
- (void)setHasIsMaximized:(BOOL)a3;
- (void)setHasIsMediaPlaying:(BOOL)a3;
- (void)setHasIsSecondChance:(BOOL)a3;
- (void)setHasIsTriggerEvent:(BOOL)a3;
- (void)setHasIsWakeFromSleep:(BOOL)a3;
- (void)setHasLastConsecutivePHSRejects:(BOOL)a3;
- (void)setHasLastConsecutiveVTRejects:(BOOL)a3;
- (void)setHasLastDisplayWakeTimeOffsetInNs:(BOOL)a3;
- (void)setHasMediaVolume:(BOOL)a3;
- (void)setHasNeptuneDetectionApiScore:(BOOL)a3;
- (void)setHasOnBatteryPower:(BOOL)a3;
- (void)setHasRecognizerScaleFactor:(BOOL)a3;
- (void)setHasRecognizerScore:(BOOL)a3;
- (void)setHasRecognizerThresholdOffset:(BOOL)a3;
- (void)setHasRecognizerWaitTimeInNs:(BOOL)a3;
- (void)setHasRemoteMicVADMyriadThreshold:(BOOL)a3;
- (void)setHasRemoteMicVADScore:(BOOL)a3;
- (void)setHasRemoteMicVADThreshold:(BOOL)a3;
- (void)setHasSatBeingTrained:(BOOL)a3;
- (void)setHasSatNumTrainingUtterances:(BOOL)a3;
- (void)setHasSatScore:(BOOL)a3;
- (void)setHasSatThreshold:(BOOL)a3;
- (void)setHasSatTriggered:(BOOL)a3;
- (void)setHasSecondPassAnalyerEndSampleCount:(BOOL)a3;
- (void)setHasSecondPassAnalyerStartSampleCount:(BOOL)a3;
- (void)setHasSecondPassAssetLoadCompleteTimeInNs:(BOOL)a3;
- (void)setHasSecondPassAssetLoadStartTimeInNs:(BOOL)a3;
- (void)setHasSecondPassAssetQueryCompleteTimeInNs:(BOOL)a3;
- (void)setHasSecondPassAssetQueryStartTimeInNs:(BOOL)a3;
- (void)setHasSecondPassAudioStreamReadyTimeInNs:(BOOL)a3;
- (void)setHasSecondPassAudioStreamStartTimeInNs:(BOOL)a3;
- (void)setHasSecondPassCheckerModelKeywordDetectionEndTimeInNs:(BOOL)a3;
- (void)setHasSecondPassCheckerModelKeywordDetectionStartTimeInNs:(BOOL)a3;
- (void)setHasSecondPassFirstAudioPacketReceptionTimeInNs:(BOOL)a3;
- (void)setHasSecondPassLastAudioPacketReceptionTimeInNs:(BOOL)a3;
- (void)setHasShadowMicScore:(BOOL)a3;
- (void)setHasShadowMicScoreThresholdForVAD:(BOOL)a3;
- (void)setHasSiriIsActiveOrOtherAssertion:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinationWeight:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedThreshold:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerScore:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)setHasTotalSampleCount:(BOOL)a3;
- (void)setHasTotalSamplesAtEndOfCapture:(BOOL)a3;
- (void)setHasTotalSamplesAtTriggerEnd:(BOOL)a3;
- (void)setHasTotalSamplesAtTriggerStart:(BOOL)a3;
- (void)setHasTriggerDurationInNs:(BOOL)a3;
- (void)setHasTriggerEndNs:(BOOL)a3;
- (void)setHasTriggerEndSampleCount:(BOOL)a3;
- (void)setHasTriggerEndTime:(BOOL)a3;
- (void)setHasTriggerEndTimeOffsetInNs:(BOOL)a3;
- (void)setHasTriggerExplicitSatScore:(BOOL)a3;
- (void)setHasTriggerExplicitTDSRSatScore:(BOOL)a3;
- (void)setHasTriggerFireNs:(BOOL)a3;
- (void)setHasTriggerFireSampleCount:(BOOL)a3;
- (void)setHasTriggerFireTimeOffsetInNs:(BOOL)a3;
- (void)setHasTriggerFiredTime:(BOOL)a3;
- (void)setHasTriggerPhrase:(BOOL)a3;
- (void)setHasTriggerScore:(BOOL)a3;
- (void)setHasTriggerStartNs:(BOOL)a3;
- (void)setHasTriggerStartSampleCount:(BOOL)a3;
- (void)setHasTriggerStartTime:(BOOL)a3;
- (void)setHasTriggerStartTimeOffsetInNs:(BOOL)a3;
- (void)setHasTwoShotAudibleFeedbackDelayInNs:(BOOL)a3;
- (void)setHasUptimeInSec:(BOOL)a3;
- (void)setHostPowerStateAtTrigger:(int)a3;
- (void)setIsBargeIn:(BOOL)a3;
- (void)setIsContinuous:(BOOL)a3;
- (void)setIsHSJSTriggerFromAlwaysOnMicBuffer:(BOOL)a3;
- (void)setIsMaximized:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setIsSecondChance:(BOOL)a3;
- (void)setIsTriggerEvent:(BOOL)a3;
- (void)setIsWakeFromSleep:(BOOL)a3;
- (void)setLastConsecutivePHSRejects:(unsigned int)a3;
- (void)setLastConsecutiveVTRejects:(unsigned int)a3;
- (void)setLastDisplayWakeTimeOffsetInNs:(double)a3;
- (void)setMediaVolume:(float)a3;
- (void)setNeptuneDetectionApiScore:(float)a3;
- (void)setOnBatteryPower:(BOOL)a3;
- (void)setRecognizerScaleFactor:(float)a3;
- (void)setRecognizerScore:(float)a3;
- (void)setRecognizerThresholdOffset:(float)a3;
- (void)setRecognizerWaitTimeInNs:(unint64_t)a3;
- (void)setRemoteMicVADMyriadThreshold:(float)a3;
- (void)setRemoteMicVADScore:(float)a3;
- (void)setRemoteMicVADThreshold:(float)a3;
- (void)setSatBeingTrained:(BOOL)a3;
- (void)setSatNumTrainingUtterances:(unsigned int)a3;
- (void)setSatScore:(float)a3;
- (void)setSatThreshold:(float)a3;
- (void)setSatTriggered:(BOOL)a3;
- (void)setSecondPassAnalyerEndSampleCount:(unint64_t)a3;
- (void)setSecondPassAnalyerStartSampleCount:(unint64_t)a3;
- (void)setSecondPassAssetLoadCompleteTimeInNs:(unint64_t)a3;
- (void)setSecondPassAssetLoadStartTimeInNs:(unint64_t)a3;
- (void)setSecondPassAssetQueryCompleteTimeInNs:(unint64_t)a3;
- (void)setSecondPassAssetQueryStartTimeInNs:(unint64_t)a3;
- (void)setSecondPassAudioStreamReadyTimeInNs:(unint64_t)a3;
- (void)setSecondPassAudioStreamStartTimeInNs:(unint64_t)a3;
- (void)setSecondPassCheckerModelKeywordDetectionEndTimeInNs:(unint64_t)a3;
- (void)setSecondPassCheckerModelKeywordDetectionStartTimeInNs:(unint64_t)a3;
- (void)setSecondPassFirstAudioPacketReceptionTimeInNs:(unint64_t)a3;
- (void)setSecondPassLastAudioPacketReceptionTimeInNs:(unint64_t)a3;
- (void)setShadowMicScore:(float)a3;
- (void)setShadowMicScoreThresholdForVAD:(float)a3;
- (void)setSiriIsActiveOrOtherAssertion:(BOOL)a3;
- (void)setTdSpeakerRecognizerCombinationWeight:(float)a3;
- (void)setTdSpeakerRecognizerCombinedScore:(float)a3;
- (void)setTdSpeakerRecognizerCombinedThreshold:(float)a3;
- (void)setTdSpeakerRecognizerScore:(float)a3;
- (void)setThreshold:(float)a3;
- (void)setTotalSampleCount:(unint64_t)a3;
- (void)setTotalSamplesAtEndOfCapture:(unint64_t)a3;
- (void)setTotalSamplesAtTriggerEnd:(unint64_t)a3;
- (void)setTotalSamplesAtTriggerStart:(unint64_t)a3;
- (void)setTriggerDurationInNs:(float)a3;
- (void)setTriggerEndNs:(unint64_t)a3;
- (void)setTriggerEndSampleCount:(unint64_t)a3;
- (void)setTriggerEndTime:(double)a3;
- (void)setTriggerEndTimeOffsetInNs:(unint64_t)a3;
- (void)setTriggerExplicitSatScore:(float)a3;
- (void)setTriggerExplicitTDSRSatScore:(float)a3;
- (void)setTriggerFireNs:(unint64_t)a3;
- (void)setTriggerFireSampleCount:(unint64_t)a3;
- (void)setTriggerFireTimeOffsetInNs:(unint64_t)a3;
- (void)setTriggerFiredTime:(double)a3;
- (void)setTriggerPhrase:(id)a3;
- (void)setTriggerScore:(float)a3;
- (void)setTriggerStartNs:(unint64_t)a3;
- (void)setTriggerStartSampleCount:(unint64_t)a3;
- (void)setTriggerStartTime:(double)a3;
- (void)setTriggerStartTimeOffsetInNs:(unint64_t)a3;
- (void)setTwoShotAudibleFeedbackDelayInNs:(unint64_t)a3;
- (void)setUptimeInSec:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceTriggerEventInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHVoiceTriggerEventInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MHSchemaMHVoiceTriggerEventInfo *)self deleteAudioProviderUUID];
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
  objc_storeStrong((id *)&self->_triggerPhrase, 0);
  objc_storeStrong((id *)&self->_configDataHash, 0);
  objc_storeStrong((id *)&self->_captureFilePath, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

- (void)setHasTriggerPhrase:(BOOL)a3
{
  self->_hasConfigDataHash = a3;
}

- (void)setHasConfigDataHash:(BOOL)a3
{
  self->_hasCaptureFilePath = a3;
}

- (void)setHasCaptureFilePath:(BOOL)a3
{
  self->_hasAudioProviderUUID = a3;
}

- (void)setHasAudioProviderUUID:(BOOL)a3
{
  self->_hasConfigPath = a3;
}

- (void)setHasConfigPath:(BOOL)a3
{
  self->_hasConfigVersion = a3;
}

- (void)setHasConfigVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 11) = a3;
}

- (float)neptuneDetectionApiScore
{
  return self->_neptuneDetectionApiScore;
}

- (unint64_t)displayWakeTimeOffsetInNs
{
  return self->_displayWakeTimeOffsetInNs;
}

- (BOOL)isHSJSTriggerFromAlwaysOnMicBuffer
{
  return self->_isHSJSTriggerFromAlwaysOnMicBuffer;
}

- (double)lastDisplayWakeTimeOffsetInNs
{
  return self->_lastDisplayWakeTimeOffsetInNs;
}

- (void)setTriggerPhrase:(id)a3
{
}

- (NSString)triggerPhrase
{
  return self->_triggerPhrase;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionEndTimeInNs
{
  return self->_secondPassCheckerModelKeywordDetectionEndTimeInNs;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionStartTimeInNs
{
  return self->_secondPassCheckerModelKeywordDetectionStartTimeInNs;
}

- (unint64_t)secondPassLastAudioPacketReceptionTimeInNs
{
  return self->_secondPassLastAudioPacketReceptionTimeInNs;
}

- (unint64_t)secondPassFirstAudioPacketReceptionTimeInNs
{
  return self->_secondPassFirstAudioPacketReceptionTimeInNs;
}

- (unint64_t)secondPassAudioStreamReadyTimeInNs
{
  return self->_secondPassAudioStreamReadyTimeInNs;
}

- (unint64_t)secondPassAudioStreamStartTimeInNs
{
  return self->_secondPassAudioStreamStartTimeInNs;
}

- (unint64_t)secondPassAssetLoadCompleteTimeInNs
{
  return self->_secondPassAssetLoadCompleteTimeInNs;
}

- (unint64_t)secondPassAssetLoadStartTimeInNs
{
  return self->_secondPassAssetLoadStartTimeInNs;
}

- (unint64_t)secondPassAssetQueryCompleteTimeInNs
{
  return self->_secondPassAssetQueryCompleteTimeInNs;
}

- (unint64_t)secondPassAssetQueryStartTimeInNs
{
  return self->_secondPassAssetQueryStartTimeInNs;
}

- (BOOL)isWakeFromSleep
{
  return self->_isWakeFromSleep;
}

- (BOOL)isBargeIn
{
  return self->_isBargeIn;
}

- (BOOL)didAudioStall
{
  return self->_didAudioStall;
}

- (BOOL)siriIsActiveOrOtherAssertion
{
  return self->_siriIsActiveOrOtherAssertion;
}

- (void)setConfigDataHash:(id)a3
{
}

- (NSString)configDataHash
{
  return self->_configDataHash;
}

- (void)setCaptureFilePath:(id)a3
{
}

- (NSString)captureFilePath
{
  return self->_captureFilePath;
}

- (unsigned)lastConsecutiveVTRejects
{
  return self->_lastConsecutiveVTRejects;
}

- (float)downtimeInSec
{
  return self->_downtimeInSec;
}

- (float)uptimeInSec
{
  return self->_uptimeInSec;
}

- (BOOL)didWakeAP
{
  return self->_didWakeAP;
}

- (BOOL)onBatteryPower
{
  return self->_onBatteryPower;
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (SISchemaUUID)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (float)mediaVolume
{
  return self->_mediaVolume;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (int)hostPowerStateAtTrigger
{
  return self->_hostPowerStateAtTrigger;
}

- (float)cumulativeDowntimeInSec
{
  return self->_cumulativeDowntimeInSec;
}

- (float)cumulativeUptimeInSec
{
  return self->_cumulativeUptimeInSec;
}

- (unint64_t)twoShotAudibleFeedbackDelayInNs
{
  return self->_twoShotAudibleFeedbackDelayInNs;
}

- (unsigned)activeChannel
{
  return self->_activeChannel;
}

- (BOOL)deviceHandheld
{
  return self->_deviceHandheld;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setConfigPath:(id)a3
{
}

- (NSString)configPath
{
  return self->_configPath;
}

- (void)setConfigVersion:(id)a3
{
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (unint64_t)totalSamplesAtEndOfCapture
{
  return self->_totalSamplesAtEndOfCapture;
}

- (unint64_t)totalSamplesAtTriggerEnd
{
  return self->_totalSamplesAtTriggerEnd;
}

- (unint64_t)totalSamplesAtTriggerStart
{
  return self->_totalSamplesAtTriggerStart;
}

- (float)triggerDurationInNs
{
  return self->_triggerDurationInNs;
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (unsigned)hardwareSamplerate
{
  return self->_hardwareSamplerate;
}

- (double)triggerFiredTime
{
  return self->_triggerFiredTime;
}

- (double)triggerEndTime
{
  return self->_triggerEndTime;
}

- (double)triggerStartTime
{
  return self->_triggerStartTime;
}

- (unint64_t)triggerFireTimeOffsetInNs
{
  return self->_triggerFireTimeOffsetInNs;
}

- (unint64_t)triggerEndTimeOffsetInNs
{
  return self->_triggerEndTimeOffsetInNs;
}

- (unint64_t)triggerStartTimeOffsetInNs
{
  return self->_triggerStartTimeOffsetInNs;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)recognizerScaleFactor
{
  return self->_recognizerScaleFactor;
}

- (unint64_t)recognizerWaitTimeInNs
{
  return self->_recognizerWaitTimeInNs;
}

- (float)recognizerThresholdOffset
{
  return self->_recognizerThresholdOffset;
}

- (float)recognizerScore
{
  return self->_recognizerScore;
}

- (float)effectiveThreshold
{
  return self->_effectiveThreshold;
}

- (BOOL)isMaximized
{
  return self->_isMaximized;
}

- (float)triggerScore
{
  return self->_triggerScore;
}

- (unint64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (BOOL)isTriggerEvent
{
  return self->_isTriggerEvent;
}

- (unint64_t)analyzerTrailingSamples
{
  return self->_analyzerTrailingSamples;
}

- (unint64_t)analyzerPrependingSamples
{
  return self->_analyzerPrependingSamples;
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (unint64_t)triggerFireNs
{
  return self->_triggerFireNs;
}

- (unint64_t)triggerEndNs
{
  return self->_triggerEndNs;
}

- (unint64_t)triggerStartNs
{
  return self->_triggerStartNs;
}

- (unint64_t)triggerFireSampleCount
{
  return self->_triggerFireSampleCount;
}

- (unint64_t)triggerEndSampleCount
{
  return self->_triggerEndSampleCount;
}

- (unint64_t)clientStartSampleCount
{
  return self->_clientStartSampleCount;
}

- (unint64_t)triggerStartSampleCount
{
  return self->_triggerStartSampleCount;
}

- (int)enhancedCarplayTriggerMode
{
  return self->_enhancedCarplayTriggerMode;
}

- (float)remoteMicVADMyriadThreshold
{
  return self->_remoteMicVADMyriadThreshold;
}

- (float)remoteMicVADThreshold
{
  return self->_remoteMicVADThreshold;
}

- (float)remoteMicVADScore
{
  return self->_remoteMicVADScore;
}

- (float)shadowMicScoreThresholdForVAD
{
  return self->_shadowMicScoreThresholdForVAD;
}

- (float)shadowMicScore
{
  return self->_shadowMicScore;
}

- (float)triggerExplicitTDSRSatScore
{
  return self->_triggerExplicitTDSRSatScore;
}

- (float)triggerExplicitSatScore
{
  return self->_triggerExplicitSatScore;
}

- (unint64_t)deltaTimeInNsFromlastPHSReject
{
  return self->_deltaTimeInNsFromlastPHSReject;
}

- (unsigned)lastConsecutivePHSRejects
{
  return self->_lastConsecutivePHSRejects;
}

- (BOOL)satBeingTrained
{
  return self->_satBeingTrained;
}

- (int)biometricClue
{
  return self->_biometricClue;
}

- (float)tdSpeakerRecognizerCombinationWeight
{
  return self->_tdSpeakerRecognizerCombinationWeight;
}

- (float)tdSpeakerRecognizerCombinedThreshold
{
  return self->_tdSpeakerRecognizerCombinedThreshold;
}

- (float)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (float)tdSpeakerRecognizerScore
{
  return self->_tdSpeakerRecognizerScore;
}

- (BOOL)satTriggered
{
  return self->_satTriggered;
}

- (float)satThreshold
{
  return self->_satThreshold;
}

- (unsigned)satNumTrainingUtterances
{
  return self->_satNumTrainingUtterances;
}

- (float)satScore
{
  return self->_satScore;
}

- (unint64_t)secondPassAnalyerEndSampleCount
{
  return self->_secondPassAnalyerEndSampleCount;
}

- (unint64_t)secondPassAnalyerStartSampleCount
{
  return self->_secondPassAnalyerStartSampleCount;
}

- (MHSchemaMHVoiceTriggerEventInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v199.receiver = self;
  v199.super_class = (Class)MHSchemaMHVoiceTriggerEventInfo;
  v5 = [(MHSchemaMHVoiceTriggerEventInfo *)&v199 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"secondPassAnalyerStartSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAnalyerStartSampleCount:](v5, "setSecondPassAnalyerStartSampleCount:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"secondPassAnalyerEndSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAnalyerEndSampleCount:](v5, "setSecondPassAnalyerEndSampleCount:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"satScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setSatScore:](v5, "setSatScore:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"satNumTrainingUtterances"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSatNumTrainingUtterances:](v5, "setSatNumTrainingUtterances:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"satThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setSatThreshold:](v5, "setSatThreshold:");
    }
    v11 = [v4 objectForKeyedSubscript:@"satTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSatTriggered:](v5, "setSatTriggered:", [v11 BOOLValue]);
    }
    v147 = v8;
    v12 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerScore:](v5, "setTdSpeakerRecognizerScore:");
    }
    v143 = v12;
    v13 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];
    objc_opt_class();
    v198 = v13;
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinedScore:](v5, "setTdSpeakerRecognizerCombinedScore:");
    }
    v146 = v9;
    v14 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinedThreshold:](v5, "setTdSpeakerRecognizerCombinedThreshold:");
    }
    v15 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinationWeight"];
    objc_opt_class();
    v197 = v15;
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinationWeight:](v5, "setTdSpeakerRecognizerCombinationWeight:");
    }
    v142 = v14;
    v16 = [v4 objectForKeyedSubscript:@"biometricClue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setBiometricClue:](v5, "setBiometricClue:", [v16 intValue]);
    }
    v141 = v16;
    v17 = [v4 objectForKeyedSubscript:@"satBeingTrained"];
    objc_opt_class();
    v196 = v17;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSatBeingTrained:](v5, "setSatBeingTrained:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"lastConsecutivePHSRejects"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setLastConsecutivePHSRejects:](v5, "setLastConsecutivePHSRejects:", [v18 unsignedIntValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"deltaTimeInNsFromlastPHSReject"];
    objc_opt_class();
    v195 = v19;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setDeltaTimeInNsFromlastPHSReject:](v5, "setDeltaTimeInNsFromlastPHSReject:", [v19 unsignedLongLongValue]);
    }
    v145 = v10;
    v20 = [v4 objectForKeyedSubscript:@"triggerExplicitSatScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerExplicitSatScore:](v5, "setTriggerExplicitSatScore:");
    }
    v21 = [v4 objectForKeyedSubscript:@"triggerExplicitTDSRSatScore"];
    objc_opt_class();
    v194 = v21;
    if (objc_opt_isKindOfClass())
    {
      [v21 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerExplicitTDSRSatScore:](v5, "setTriggerExplicitTDSRSatScore:");
    }
    v144 = v11;
    v22 = [v4 objectForKeyedSubscript:@"shadowMicScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v22 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setShadowMicScore:](v5, "setShadowMicScore:");
    }
    v23 = [v4 objectForKeyedSubscript:@"shadowMicScoreThresholdForVAD"];
    objc_opt_class();
    v193 = v23;
    if (objc_opt_isKindOfClass())
    {
      [v23 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setShadowMicScoreThresholdForVAD:](v5, "setShadowMicScoreThresholdForVAD:");
    }
    v24 = [v4 objectForKeyedSubscript:@"remoteMicVADScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v24 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADScore:](v5, "setRemoteMicVADScore:");
    }
    v25 = [v4 objectForKeyedSubscript:@"remoteMicVADThreshold"];
    objc_opt_class();
    v192 = v25;
    if (objc_opt_isKindOfClass())
    {
      [v25 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADThreshold:](v5, "setRemoteMicVADThreshold:");
    }
    v140 = v18;
    v26 = [v4 objectForKeyedSubscript:@"remoteMicVADMyriadThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v26 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADMyriadThreshold:](v5, "setRemoteMicVADMyriadThreshold:");
    }
    v136 = v26;
    v27 = [v4 objectForKeyedSubscript:@"enhancedCarplayTriggerMode"];
    objc_opt_class();
    v191 = v27;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setEnhancedCarplayTriggerMode:](v5, "setEnhancedCarplayTriggerMode:", [v27 intValue]);
    }
    v139 = v20;
    v28 = [v4 objectForKeyedSubscript:@"triggerStartSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartSampleCount:](v5, "setTriggerStartSampleCount:", [v28 unsignedLongLongValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"clientStartSampleCount"];
    objc_opt_class();
    v190 = v29;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setClientStartSampleCount:](v5, "setClientStartSampleCount:", [v29 unsignedLongLongValue]);
    }
    v138 = v22;
    v30 = [v4 objectForKeyedSubscript:@"triggerEndSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndSampleCount:](v5, "setTriggerEndSampleCount:", [v30 unsignedLongLongValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"triggerFireSampleCount"];
    objc_opt_class();
    v189 = v31;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireSampleCount:](v5, "setTriggerFireSampleCount:", [v31 unsignedLongLongValue]);
    }
    v135 = v28;
    v32 = [v4 objectForKeyedSubscript:@"triggerStartNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartNs:](v5, "setTriggerStartNs:", [v32 unsignedLongLongValue]);
    }
    v133 = v32;
    v33 = [v4 objectForKeyedSubscript:@"triggerEndNs"];
    objc_opt_class();
    v188 = v33;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndNs:](v5, "setTriggerEndNs:", [v33 unsignedLongLongValue]);
    }
    v137 = v24;
    v34 = [v4 objectForKeyedSubscript:@"triggerFireNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireNs:](v5, "setTriggerFireNs:", [v34 unsignedLongLongValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"extraSamplesAtStart"];
    objc_opt_class();
    v187 = v35;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setExtraSamplesAtStart:](v5, "setExtraSamplesAtStart:", [v35 unsignedLongLongValue]);
    }
    v134 = v30;
    v36 = [v4 objectForKeyedSubscript:@"analyzerPrependingSamples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setAnalyzerPrependingSamples:](v5, "setAnalyzerPrependingSamples:", [v36 unsignedLongLongValue]);
    }
    v131 = v36;
    v37 = [v4 objectForKeyedSubscript:@"analyzerTrailingSamples"];
    objc_opt_class();
    v186 = v37;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setAnalyzerTrailingSamples:](v5, "setAnalyzerTrailingSamples:", [v37 unsignedLongLongValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"isTriggerEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsTriggerEvent:](v5, "setIsTriggerEvent:", [v38 BOOLValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"totalSampleCount"];
    objc_opt_class();
    v185 = v39;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSampleCount:](v5, "setTotalSampleCount:", [v39 unsignedLongLongValue]);
    }
    v132 = v34;
    v40 = [v4 objectForKeyedSubscript:@"triggerScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v40 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerScore:](v5, "setTriggerScore:");
    }
    v129 = v40;
    v41 = [v4 objectForKeyedSubscript:@"isMaximized"];
    objc_opt_class();
    v184 = v41;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsMaximized:](v5, "setIsMaximized:", [v41 BOOLValue]);
    }
    v130 = v38;
    v42 = [v4 objectForKeyedSubscript:@"effectiveThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v42 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setEffectiveThreshold:](v5, "setEffectiveThreshold:");
    }
    v43 = [v4 objectForKeyedSubscript:@"recognizerScore"];
    objc_opt_class();
    v183 = v43;
    if (objc_opt_isKindOfClass())
    {
      [v43 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerScore:](v5, "setRecognizerScore:");
    }
    v44 = [v4 objectForKeyedSubscript:@"recognizerThresholdOffset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v44 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerThresholdOffset:](v5, "setRecognizerThresholdOffset:");
    }
    v45 = [v4 objectForKeyedSubscript:@"recognizerWaitTimeInNs"];
    objc_opt_class();
    v182 = v45;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerWaitTimeInNs:](v5, "setRecognizerWaitTimeInNs:", [v45 unsignedLongLongValue]);
    }
    v46 = [v4 objectForKeyedSubscript:@"recognizerScaleFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v46 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerScaleFactor:](v5, "setRecognizerScaleFactor:");
    }
    v47 = [v4 objectForKeyedSubscript:@"threshold"];
    objc_opt_class();
    v181 = v47;
    if (objc_opt_isKindOfClass())
    {
      [v47 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setThreshold:](v5, "setThreshold:");
    }
    v128 = v42;
    v48 = [v4 objectForKeyedSubscript:@"triggerStartTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartTimeOffsetInNs:](v5, "setTriggerStartTimeOffsetInNs:", [v48 unsignedLongLongValue]);
    }
    v125 = v48;
    v49 = [v4 objectForKeyedSubscript:@"triggerEndTimeOffsetInNs"];
    objc_opt_class();
    v180 = v49;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndTimeOffsetInNs:](v5, "setTriggerEndTimeOffsetInNs:", [v49 unsignedLongLongValue]);
    }
    v50 = v6;
    v51 = [v4 objectForKeyedSubscript:@"triggerFireTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireTimeOffsetInNs:](v5, "setTriggerFireTimeOffsetInNs:", [v51 unsignedLongLongValue]);
    }
    v124 = v51;
    v52 = [v4 objectForKeyedSubscript:@"triggerStartTime"];
    objc_opt_class();
    v179 = v52;
    if (objc_opt_isKindOfClass())
    {
      [v52 doubleValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartTime:](v5, "setTriggerStartTime:");
    }
    uint64_t v53 = [v4 objectForKeyedSubscript:@"triggerEndTime"];
    objc_opt_class();
    v178 = (void *)v53;
    v54 = v50;
    if (objc_opt_isKindOfClass())
    {
      [v178 doubleValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndTime:](v5, "setTriggerEndTime:");
    }
    v55 = [v4 objectForKeyedSubscript:@"triggerFiredTime"];
    objc_opt_class();
    v177 = v55;
    v127 = v44;
    if (objc_opt_isKindOfClass())
    {
      [v55 doubleValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFiredTime:](v5, "setTriggerFiredTime:");
    }
    v56 = [v4 objectForKeyedSubscript:@"hardwareSamplerate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setHardwareSamplerate:](v5, "setHardwareSamplerate:", [v56 unsignedIntValue]);
    }
    v123 = v56;
    v57 = [v4 objectForKeyedSubscript:@"isContinuous"];
    objc_opt_class();
    v176 = v57;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsContinuous:](v5, "setIsContinuous:", [v57 BOOLValue]);
    }
    v58 = v7;
    v59 = [v4 objectForKeyedSubscript:@"triggerDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v59 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerDurationInNs:](v5, "setTriggerDurationInNs:");
    }
    v122 = v59;
    v60 = [v4 objectForKeyedSubscript:@"totalSamplesAtTriggerStart"];
    objc_opt_class();
    v175 = v60;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtTriggerStart:](v5, "setTotalSamplesAtTriggerStart:", [v60 unsignedLongLongValue]);
    }
    v61 = [v4 objectForKeyedSubscript:@"totalSamplesAtTriggerEnd"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtTriggerEnd:](v5, "setTotalSamplesAtTriggerEnd:", [v61 unsignedLongLongValue]);
    }
    v121 = v61;
    v148 = v58;
    v149 = v54;
    v62 = [v4 objectForKeyedSubscript:@"totalSamplesAtEndOfCapture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtEndOfCapture:](v5, "setTotalSamplesAtEndOfCapture:", [v62 unsignedLongLongValue]);
    }
    v120 = v62;
    v63 = [v4 objectForKeyedSubscript:@"configVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v64 = (void *)[v63 copy];
      [(MHSchemaMHVoiceTriggerEventInfo *)v5 setConfigVersion:v64];
    }
    v65 = [v4 objectForKeyedSubscript:@"configPath"];
    objc_opt_class();
    v174 = v65;
    if (objc_opt_isKindOfClass())
    {
      v66 = (void *)[v65 copy];
      [(MHSchemaMHVoiceTriggerEventInfo *)v5 setConfigPath:v66];
    }
    v67 = [v4 objectForKeyedSubscript:@"isSecondChance"];
    objc_opt_class();
    v173 = v67;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsSecondChance:](v5, "setIsSecondChance:", [v67 BOOLValue]);
    }
    v68 = [v4 objectForKeyedSubscript:@"deviceHandheld"];
    objc_opt_class();
    v172 = v68;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setDeviceHandheld:](v5, "setDeviceHandheld:", [v68 BOOLValue]);
    }
    v69 = [v4 objectForKeyedSubscript:@"activeChannel"];
    objc_opt_class();
    v171 = v69;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setActiveChannel:](v5, "setActiveChannel:", [v69 unsignedIntValue]);
    }
    v70 = [v4 objectForKeyedSubscript:@"twoShotAudibleFeedbackDelayInNs"];
    objc_opt_class();
    v170 = v70;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setTwoShotAudibleFeedbackDelayInNs:](v5, "setTwoShotAudibleFeedbackDelayInNs:", [v70 unsignedLongLongValue]);
    }
    v71 = [v4 objectForKeyedSubscript:@"cumulativeUptimeInSec"];
    objc_opt_class();
    v169 = v71;
    if (objc_opt_isKindOfClass())
    {
      [v71 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setCumulativeUptimeInSec:](v5, "setCumulativeUptimeInSec:");
    }
    v72 = [v4 objectForKeyedSubscript:@"cumulativeDowntimeInSec"];
    objc_opt_class();
    v168 = v72;
    if (objc_opt_isKindOfClass())
    {
      [v72 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setCumulativeDowntimeInSec:](v5, "setCumulativeDowntimeInSec:");
    }
    v73 = [v4 objectForKeyedSubscript:@"hostPowerStateAtTrigger"];
    objc_opt_class();
    v167 = v73;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setHostPowerStateAtTrigger:](v5, "setHostPowerStateAtTrigger:", [v73 intValue]);
    }
    v74 = [v4 objectForKeyedSubscript:@"isMediaPlaying"];
    objc_opt_class();
    v166 = v74;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsMediaPlaying:](v5, "setIsMediaPlaying:", [v74 BOOLValue]);
    }
    v75 = [v4 objectForKeyedSubscript:@"mediaVolume"];
    objc_opt_class();
    v165 = v75;
    if (objc_opt_isKindOfClass())
    {
      [v75 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setMediaVolume:](v5, "setMediaVolume:");
    }
    uint64_t v76 = [v4 objectForKeyedSubscript:@"audioProviderUUID"];
    objc_opt_class();
    v164 = (void *)v76;
    if (objc_opt_isKindOfClass())
    {
      v77 = [[SISchemaUUID alloc] initWithDictionary:v76];
      [(MHSchemaMHVoiceTriggerEventInfo *)v5 setAudioProviderUUID:v77];
    }
    v78 = [v4 objectForKeyedSubscript:@"onBatteryPower"];
    objc_opt_class();
    v163 = v78;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setOnBatteryPower:](v5, "setOnBatteryPower:", [v78 BOOLValue]);
    }
    v79 = [v4 objectForKeyedSubscript:@"didWakeAP"];
    objc_opt_class();
    v162 = v79;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setDidWakeAP:](v5, "setDidWakeAP:", [v79 BOOLValue]);
    }
    v80 = [v4 objectForKeyedSubscript:@"uptimeInSec"];
    objc_opt_class();
    v161 = v80;
    if (objc_opt_isKindOfClass())
    {
      [v80 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setUptimeInSec:](v5, "setUptimeInSec:");
    }
    v81 = [v4 objectForKeyedSubscript:@"downtimeInSec"];
    objc_opt_class();
    v160 = v81;
    if (objc_opt_isKindOfClass())
    {
      [v81 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setDowntimeInSec:](v5, "setDowntimeInSec:");
    }
    v82 = [v4 objectForKeyedSubscript:@"lastConsecutiveVTRejects"];
    objc_opt_class();
    v159 = v82;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setLastConsecutiveVTRejects:](v5, "setLastConsecutiveVTRejects:", [v82 unsignedIntValue]);
    }
    v83 = [v4 objectForKeyedSubscript:@"captureFilePath"];
    objc_opt_class();
    v158 = v83;
    if (objc_opt_isKindOfClass())
    {
      v84 = (void *)[v83 copy];
      [(MHSchemaMHVoiceTriggerEventInfo *)v5 setCaptureFilePath:v84];
    }
    v85 = [v4 objectForKeyedSubscript:@"configDataHash"];
    objc_opt_class();
    v157 = v85;
    if (objc_opt_isKindOfClass())
    {
      v86 = (void *)[v85 copy];
      [(MHSchemaMHVoiceTriggerEventInfo *)v5 setConfigDataHash:v86];
    }
    v87 = v46;
    v88 = [v4 objectForKeyedSubscript:@"siriIsActiveOrOtherAssertion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSiriIsActiveOrOtherAssertion:](v5, "setSiriIsActiveOrOtherAssertion:", [v88 BOOLValue]);
    }
    v89 = [v4 objectForKeyedSubscript:@"didAudioStall"];
    objc_opt_class();
    v156 = v89;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setDidAudioStall:](v5, "setDidAudioStall:", [v89 BOOLValue]);
    }
    uint64_t v90 = [v4 objectForKeyedSubscript:@"isBargeIn"];
    objc_opt_class();
    v155 = (void *)v90;
    v91 = v87;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsBargeIn:](v5, "setIsBargeIn:", [v155 BOOLValue]);
    }
    v92 = [v4 objectForKeyedSubscript:@"isWakeFromSleep"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsWakeFromSleep:](v5, "setIsWakeFromSleep:", [v92 BOOLValue]);
    }
    v93 = [v4 objectForKeyedSubscript:@"secondPassAssetQueryStartTimeInNs"];
    objc_opt_class();
    v154 = v93;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetQueryStartTimeInNs:](v5, "setSecondPassAssetQueryStartTimeInNs:", [v93 unsignedLongLongValue]);
    }
    v94 = [v4 objectForKeyedSubscript:@"secondPassAssetQueryCompleteTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetQueryCompleteTimeInNs:](v5, "setSecondPassAssetQueryCompleteTimeInNs:", [v94 unsignedLongLongValue]);
    }
    v95 = [v4 objectForKeyedSubscript:@"secondPassAssetLoadStartTimeInNs"];
    objc_opt_class();
    v153 = v95;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetLoadStartTimeInNs:](v5, "setSecondPassAssetLoadStartTimeInNs:", [v95 unsignedLongLongValue]);
    }
    v96 = [v4 objectForKeyedSubscript:@"secondPassAssetLoadCompleteTimeInNs"];
    objc_opt_class();
    v152 = v96;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetLoadCompleteTimeInNs:](v5, "setSecondPassAssetLoadCompleteTimeInNs:", [v96 unsignedLongLongValue]);
    }
    v97 = v63;
    v98 = [v4 objectForKeyedSubscript:@"secondPassAudioStreamStartTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAudioStreamStartTimeInNs:](v5, "setSecondPassAudioStreamStartTimeInNs:", [v98 unsignedLongLongValue]);
    }
    v99 = [v4 objectForKeyedSubscript:@"secondPassAudioStreamReadyTimeInNs"];
    objc_opt_class();
    v151 = v99;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAudioStreamReadyTimeInNs:](v5, "setSecondPassAudioStreamReadyTimeInNs:", [v99 unsignedLongLongValue]);
    }
    uint64_t v100 = [v4 objectForKeyedSubscript:@"secondPassFirstAudioPacketReceptionTimeInNs"];
    objc_opt_class();
    v150 = (void *)v100;
    v101 = v97;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassFirstAudioPacketReceptionTimeInNs:](v5, "setSecondPassFirstAudioPacketReceptionTimeInNs:", [v150 unsignedLongLongValue]);
    }
    v126 = v91;
    v102 = [v4 objectForKeyedSubscript:@"secondPassLastAudioPacketReceptionTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassLastAudioPacketReceptionTimeInNs:](v5, "setSecondPassLastAudioPacketReceptionTimeInNs:", [v102 unsignedLongLongValue]);
    }
    v117 = v92;
    v103 = [v4 objectForKeyedSubscript:@"secondPassCheckerModelKeywordDetectionStartTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassCheckerModelKeywordDetectionStartTimeInNs:](v5, "setSecondPassCheckerModelKeywordDetectionStartTimeInNs:", [v103 unsignedLongLongValue]);
    }
    v116 = v98;
    v118 = v88;
    v104 = [v4 objectForKeyedSubscript:@"secondPassCheckerModelKeywordDetectionEndTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassCheckerModelKeywordDetectionEndTimeInNs:](v5, "setSecondPassCheckerModelKeywordDetectionEndTimeInNs:", [v104 unsignedLongLongValue]);
    }
    v105 = [v4 objectForKeyedSubscript:@"triggerPhrase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v106 = (void *)[v105 copy];
      [(MHSchemaMHVoiceTriggerEventInfo *)v5 setTriggerPhrase:v106];
    }
    v115 = v102;
    v107 = [v4 objectForKeyedSubscript:@"lastDisplayWakeTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v107 doubleValue];
      -[MHSchemaMHVoiceTriggerEventInfo setLastDisplayWakeTimeOffsetInNs:](v5, "setLastDisplayWakeTimeOffsetInNs:");
    }
    v119 = v101;
    v108 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isHSJSTriggerFromAlwaysOnMicBuffer", v103);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setIsHSJSTriggerFromAlwaysOnMicBuffer:](v5, "setIsHSJSTriggerFromAlwaysOnMicBuffer:", [v108 BOOLValue]);
    }
    v109 = v94;
    v110 = [v4 objectForKeyedSubscript:@"displayWakeTimeOffsetInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerEventInfo setDisplayWakeTimeOffsetInNs:](v5, "setDisplayWakeTimeOffsetInNs:", [v110 unsignedLongLongValue]);
    }
    v111 = [v4 objectForKeyedSubscript:@"neptuneDetectionApiScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v111 floatValue];
      -[MHSchemaMHVoiceTriggerEventInfo setNeptuneDetectionApiScore:](v5, "setNeptuneDetectionApiScore:");
    }
    v112 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceTriggerEventInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceTriggerEventInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceTriggerEventInfo *)self dictionaryRepresentation];
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
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) != 0)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo activeChannel](self, "activeChannel"));
    [v3 setObject:v9 forKeyedSubscript:@"activeChannel"];

    uint64_t has = *(void *)p_has;
    if ((*(void *)p_has & 0x40000000) == 0)
    {
LABEL_3:
      if ((has & 0x80000000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x40000000) == 0)
  {
    goto LABEL_3;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo analyzerPrependingSamples](self, "analyzerPrependingSamples"));
  [v3 setObject:v10 forKeyedSubscript:@"analyzerPrependingSamples"];

  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_4:
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo analyzerTrailingSamples](self, "analyzerTrailingSamples"));
    [v3 setObject:v6 forKeyedSubscript:@"analyzerTrailingSamples"];
  }
LABEL_5:
  if (self->_audioProviderUUID)
  {
    uint64_t v7 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"audioProviderUUID"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"audioProviderUUID"];
    }
  }
  if ((*(void *)&self->_has & 0x400) != 0)
  {
    unsigned int v12 = [(MHSchemaMHVoiceTriggerEventInfo *)self biometricClue] - 1;
    if (v12 > 3) {
      v13 = @"MHBIOMETRICMATCHRESULT_UNKOWN";
    }
    else {
      v13 = off_1E5EB18B8[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"biometricClue"];
  }
  if (self->_captureFilePath)
  {
    v14 = [(MHSchemaMHVoiceTriggerEventInfo *)self captureFilePath];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"captureFilePath"];
  }
  if ((*(void *)&self->_has & 0x800000) != 0)
  {
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo clientStartSampleCount](self, "clientStartSampleCount"));
    [v3 setObject:v16 forKeyedSubscript:@"clientStartSampleCount"];
  }
  if (self->_configDataHash)
  {
    v17 = [(MHSchemaMHVoiceTriggerEventInfo *)self configDataHash];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"configDataHash"];
  }
  if (self->_configPath)
  {
    v19 = [(MHSchemaMHVoiceTriggerEventInfo *)self configPath];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"configPath"];
  }
  if (self->_configVersion)
  {
    v21 = [(MHSchemaMHVoiceTriggerEventInfo *)self configVersion];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"configVersion"];
  }
  v23 = &self->_has;
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x800000000000000) != 0)
  {
    v26 = NSNumber;
    [(MHSchemaMHVoiceTriggerEventInfo *)self cumulativeDowntimeInSec];
    v27 = objc_msgSend(v26, "numberWithFloat:");
    [v3 setObject:v27 forKeyedSubscript:@"cumulativeDowntimeInSec"];

    int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    uint64_t v24 = *(void *)v23;
    if ((*(void *)v23 & 0x400000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v24 & 0x400000000000000) != 0)
  {
LABEL_32:
    v28 = NSNumber;
    [(MHSchemaMHVoiceTriggerEventInfo *)self cumulativeUptimeInSec];
    v29 = objc_msgSend(v28, "numberWithFloat:");
    [v3 setObject:v29 forKeyedSubscript:@"cumulativeUptimeInSec"];

    int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    uint64_t v24 = (uint64_t)self->_has;
  }
LABEL_33:
  if ((v24 & 0x2000) != 0)
  {
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo deltaTimeInNsFromlastPHSReject](self, "deltaTimeInNsFromlastPHSReject"));
    [v3 setObject:v37 forKeyedSubscript:@"deltaTimeInNsFromlastPHSReject"];

    int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    uint64_t v24 = (uint64_t)self->_has;
    if ((v24 & 0x80000000000000) == 0)
    {
LABEL_35:
      if ((v25 & 0x20) == 0) {
        goto LABEL_36;
      }
      goto LABEL_113;
    }
  }
  else if ((v24 & 0x80000000000000) == 0)
  {
    goto LABEL_35;
  }
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo deviceHandheld](self, "deviceHandheld"));
  [v3 setObject:v38 forKeyedSubscript:@"deviceHandheld"];

  int v39 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v39 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v39 & 0x20) == 0)
  {
LABEL_36:
    if ((v25 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_114;
  }
LABEL_113:
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo didAudioStall](self, "didAudioStall"));
  [v3 setObject:v40 forKeyedSubscript:@"didAudioStall"];

  int v41 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v41 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v41 & 1) == 0)
  {
LABEL_37:
    if ((v25 & 0x100000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_115;
  }
LABEL_114:
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo didWakeAP](self, "didWakeAP"));
  [v3 setObject:v42 forKeyedSubscript:@"didWakeAP"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x100000) == 0)
  {
LABEL_38:
    if ((v25 & 4) == 0) {
      goto LABEL_39;
    }
    goto LABEL_116;
  }
LABEL_115:
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo displayWakeTimeOffsetInNs](self, "displayWakeTimeOffsetInNs"));
  [v3 setObject:v43 forKeyedSubscript:@"displayWakeTimeOffsetInNs"];

  int v44 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v44 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v44 & 4) == 0)
  {
LABEL_39:
    if ((v24 & 0x1000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_117;
  }
LABEL_116:
  v45 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self downtimeInSec];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  [v3 setObject:v46 forKeyedSubscript:@"downtimeInSec"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000000) == 0)
  {
LABEL_40:
    if ((v24 & 0x200000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_118;
  }
LABEL_117:
  v47 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self effectiveThreshold];
  v48 = objc_msgSend(v47, "numberWithFloat:");
  [v3 setObject:v48 forKeyedSubscript:@"effectiveThreshold"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x200000) == 0)
  {
LABEL_41:
    if ((v24 & 0x20000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_136;
  }
LABEL_118:
  unsigned int v49 = [(MHSchemaMHVoiceTriggerEventInfo *)self enhancedCarplayTriggerMode] - 1;
  if (v49 > 2) {
    v50 = @"MHFIRSTPASSENHANCEDCARPLAYTRIGGERMODE_UNKNOWN";
  }
  else {
    v50 = off_1E5EB18D8[v49];
  }
  [v3 setObject:v50 forKeyedSubscript:@"enhancedCarplayTriggerMode"];
  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000000) == 0)
  {
LABEL_42:
    if ((v24 & 0x1000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_137;
  }
LABEL_136:
  v63 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo extraSamplesAtStart](self, "extraSamplesAtStart"));
  [v3 setObject:v63 forKeyedSubscript:@"extraSamplesAtStart"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000000000) == 0)
  {
LABEL_43:
    if ((v24 & 0x1000000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_138;
  }
LABEL_137:
  v64 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo hardwareSamplerate](self, "hardwareSamplerate"));
  [v3 setObject:v64 forKeyedSubscript:@"hardwareSamplerate"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000000000000) == 0)
  {
LABEL_44:
    if ((v25 & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_142;
  }
LABEL_138:
  unsigned int v65 = [(MHSchemaMHVoiceTriggerEventInfo *)self hostPowerStateAtTrigger] - 1;
  if (v65 > 3) {
    v66 = @"MHHOSTPOWERSTATE_UNKNOWN";
  }
  else {
    v66 = off_1E5EB18F0[v65];
  }
  [v3 setObject:v66 forKeyedSubscript:@"hostPowerStateAtTrigger"];
  int v67 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v67 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v67 & 0x40) == 0)
  {
LABEL_45:
    if ((v24 & 0x2000000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_143;
  }
LABEL_142:
  v68 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isBargeIn](self, "isBargeIn"));
  [v3 setObject:v68 forKeyedSubscript:@"isBargeIn"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000000000) == 0)
  {
LABEL_46:
    if ((v25 & 0x80000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_144;
  }
LABEL_143:
  v69 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isContinuous](self, "isContinuous"));
  [v3 setObject:v69 forKeyedSubscript:@"isContinuous"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x80000) == 0)
  {
LABEL_47:
    if ((v24 & 0x800000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_145;
  }
LABEL_144:
  v70 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isHSJSTriggerFromAlwaysOnMicBuffer](self, "isHSJSTriggerFromAlwaysOnMicBuffer"));
  [v3 setObject:v70 forKeyedSubscript:@"isHSJSTriggerFromAlwaysOnMicBuffer"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x800000000) == 0)
  {
LABEL_48:
    if ((v24 & 0x2000000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_146;
  }
LABEL_145:
  v71 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isMaximized](self, "isMaximized"));
  [v3 setObject:v71 forKeyedSubscript:@"isMaximized"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000000000000) == 0)
  {
LABEL_49:
    if ((v24 & 0x40000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_147;
  }
LABEL_146:
  v72 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isMediaPlaying](self, "isMediaPlaying"));
  [v3 setObject:v72 forKeyedSubscript:@"isMediaPlaying"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x40000000000000) == 0)
  {
LABEL_50:
    if ((v24 & 0x100000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_148;
  }
LABEL_147:
  v73 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isSecondChance](self, "isSecondChance"));
  [v3 setObject:v73 forKeyedSubscript:@"isSecondChance"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x100000000) == 0)
  {
LABEL_51:
    if ((v25 & 0x80) == 0) {
      goto LABEL_52;
    }
    goto LABEL_149;
  }
LABEL_148:
  v74 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isTriggerEvent](self, "isTriggerEvent"));
  [v3 setObject:v74 forKeyedSubscript:@"isTriggerEvent"];

  int v75 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v75 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v75 & 0x80) == 0)
  {
LABEL_52:
    if ((v24 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_150;
  }
LABEL_149:
  uint64_t v76 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isWakeFromSleep](self, "isWakeFromSleep"));
  [v3 setObject:v76 forKeyedSubscript:@"isWakeFromSleep"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000) == 0)
  {
LABEL_53:
    if ((v25 & 8) == 0) {
      goto LABEL_54;
    }
    goto LABEL_151;
  }
LABEL_150:
  v77 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo lastConsecutivePHSRejects](self, "lastConsecutivePHSRejects"));
  [v3 setObject:v77 forKeyedSubscript:@"lastConsecutivePHSRejects"];

  int v78 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v78 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v78 & 8) == 0)
  {
LABEL_54:
    if ((v25 & 0x40000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_152;
  }
LABEL_151:
  v79 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo lastConsecutiveVTRejects](self, "lastConsecutiveVTRejects"));
  [v3 setObject:v79 forKeyedSubscript:@"lastConsecutiveVTRejects"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x40000) == 0)
  {
LABEL_55:
    if ((v24 & 0x4000000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_153;
  }
LABEL_152:
  v80 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self lastDisplayWakeTimeOffsetInNs];
  v81 = objc_msgSend(v80, "numberWithDouble:");
  [v3 setObject:v81 forKeyedSubscript:@"lastDisplayWakeTimeOffsetInNs"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000000000000000) == 0)
  {
LABEL_56:
    if ((v25 & 0x200000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_154;
  }
LABEL_153:
  v82 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self mediaVolume];
  v83 = objc_msgSend(v82, "numberWithFloat:");
  [v3 setObject:v83 forKeyedSubscript:@"mediaVolume"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x200000) == 0)
  {
LABEL_57:
    if ((v24 & 0x8000000000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_155;
  }
LABEL_154:
  v84 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self neptuneDetectionApiScore];
  v85 = objc_msgSend(v84, "numberWithFloat:");
  [v3 setObject:v85 forKeyedSubscript:@"neptuneDetectionApiScore"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000000000000) == 0)
  {
LABEL_58:
    if ((v24 & 0x10000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_156;
  }
LABEL_155:
  v86 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo onBatteryPower](self, "onBatteryPower"));
  [v3 setObject:v86 forKeyedSubscript:@"onBatteryPower"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000000000) == 0)
  {
LABEL_59:
    if ((v24 & 0x2000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_157;
  }
LABEL_156:
  v87 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self recognizerScaleFactor];
  v88 = objc_msgSend(v87, "numberWithFloat:");
  [v3 setObject:v88 forKeyedSubscript:@"recognizerScaleFactor"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000000) == 0)
  {
LABEL_60:
    if ((v24 & 0x4000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_158;
  }
LABEL_157:
  v89 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self recognizerScore];
  uint64_t v90 = objc_msgSend(v89, "numberWithFloat:");
  [v3 setObject:v90 forKeyedSubscript:@"recognizerScore"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000000000) == 0)
  {
LABEL_61:
    if ((v24 & 0x8000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_159;
  }
LABEL_158:
  v91 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self recognizerThresholdOffset];
  v92 = objc_msgSend(v91, "numberWithFloat:");
  [v3 setObject:v92 forKeyedSubscript:@"recognizerThresholdOffset"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000000) == 0)
  {
LABEL_62:
    if ((v24 & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_160;
  }
LABEL_159:
  v93 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo recognizerWaitTimeInNs](self, "recognizerWaitTimeInNs"));
  [v3 setObject:v93 forKeyedSubscript:@"recognizerWaitTimeInNs"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x100000) == 0)
  {
LABEL_63:
    if ((v24 & 0x40000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_161;
  }
LABEL_160:
  v94 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self remoteMicVADMyriadThreshold];
  v95 = objc_msgSend(v94, "numberWithFloat:");
  [v3 setObject:v95 forKeyedSubscript:@"remoteMicVADMyriadThreshold"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x40000) == 0)
  {
LABEL_64:
    if ((v24 & 0x80000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_162;
  }
LABEL_161:
  v96 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self remoteMicVADScore];
  v97 = objc_msgSend(v96, "numberWithFloat:");
  [v3 setObject:v97 forKeyedSubscript:@"remoteMicVADScore"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x80000) == 0)
  {
LABEL_65:
    if ((v24 & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_163;
  }
LABEL_162:
  v98 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self remoteMicVADThreshold];
  v99 = objc_msgSend(v98, "numberWithFloat:");
  [v3 setObject:v99 forKeyedSubscript:@"remoteMicVADThreshold"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x800) == 0)
  {
LABEL_66:
    if ((v24 & 8) == 0) {
      goto LABEL_67;
    }
    goto LABEL_164;
  }
LABEL_163:
  uint64_t v100 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo satBeingTrained](self, "satBeingTrained"));
  [v3 setObject:v100 forKeyedSubscript:@"satBeingTrained"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 8) == 0)
  {
LABEL_67:
    if ((v24 & 4) == 0) {
      goto LABEL_68;
    }
    goto LABEL_165;
  }
LABEL_164:
  v101 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo satNumTrainingUtterances](self, "satNumTrainingUtterances"));
  [v3 setObject:v101 forKeyedSubscript:@"satNumTrainingUtterances"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 4) == 0)
  {
LABEL_68:
    if ((v24 & 0x10) == 0) {
      goto LABEL_69;
    }
    goto LABEL_166;
  }
LABEL_165:
  v102 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self satScore];
  v103 = objc_msgSend(v102, "numberWithFloat:");
  [v3 setObject:v103 forKeyedSubscript:@"satScore"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x10) == 0)
  {
LABEL_69:
    if ((v24 & 0x20) == 0) {
      goto LABEL_70;
    }
    goto LABEL_167;
  }
LABEL_166:
  v104 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self satThreshold];
  v105 = objc_msgSend(v104, "numberWithFloat:");
  [v3 setObject:v105 forKeyedSubscript:@"satThreshold"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x20) == 0)
  {
LABEL_70:
    if ((v24 & 2) == 0) {
      goto LABEL_71;
    }
    goto LABEL_168;
  }
LABEL_167:
  v106 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo satTriggered](self, "satTriggered"));
  [v3 setObject:v106 forKeyedSubscript:@"satTriggered"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 2) == 0)
  {
LABEL_71:
    if ((v24 & 1) == 0) {
      goto LABEL_72;
    }
    goto LABEL_169;
  }
LABEL_168:
  v107 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAnalyerEndSampleCount](self, "secondPassAnalyerEndSampleCount"));
  [v3 setObject:v107 forKeyedSubscript:@"secondPassAnalyerEndSampleCount"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 1) == 0)
  {
LABEL_72:
    if ((v25 & 0x800) == 0) {
      goto LABEL_73;
    }
    goto LABEL_170;
  }
LABEL_169:
  v108 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAnalyerStartSampleCount](self, "secondPassAnalyerStartSampleCount"));
  [v3 setObject:v108 forKeyedSubscript:@"secondPassAnalyerStartSampleCount"];

  int v109 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v109 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v109 & 0x800) == 0)
  {
LABEL_73:
    if ((v25 & 0x400) == 0) {
      goto LABEL_74;
    }
    goto LABEL_171;
  }
LABEL_170:
  v110 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetLoadCompleteTimeInNs](self, "secondPassAssetLoadCompleteTimeInNs"));
  [v3 setObject:v110 forKeyedSubscript:@"secondPassAssetLoadCompleteTimeInNs"];

  int v111 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v111 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v111 & 0x400) == 0)
  {
LABEL_74:
    if ((v25 & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_172;
  }
LABEL_171:
  v112 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetLoadStartTimeInNs](self, "secondPassAssetLoadStartTimeInNs"));
  [v3 setObject:v112 forKeyedSubscript:@"secondPassAssetLoadStartTimeInNs"];

  int v113 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v113 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v113 & 0x200) == 0)
  {
LABEL_75:
    if ((v25 & 0x100) == 0) {
      goto LABEL_76;
    }
    goto LABEL_173;
  }
LABEL_172:
  v114 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetQueryCompleteTimeInNs](self, "secondPassAssetQueryCompleteTimeInNs"));
  [v3 setObject:v114 forKeyedSubscript:@"secondPassAssetQueryCompleteTimeInNs"];

  int v115 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v115 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v115 & 0x100) == 0)
  {
LABEL_76:
    if ((v25 & 0x2000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_174;
  }
LABEL_173:
  v116 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetQueryStartTimeInNs](self, "secondPassAssetQueryStartTimeInNs"));
  [v3 setObject:v116 forKeyedSubscript:@"secondPassAssetQueryStartTimeInNs"];

  int v117 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v117 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v117 & 0x2000) == 0)
  {
LABEL_77:
    if ((v25 & 0x1000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_175;
  }
LABEL_174:
  v118 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAudioStreamReadyTimeInNs](self, "secondPassAudioStreamReadyTimeInNs"));
  [v3 setObject:v118 forKeyedSubscript:@"secondPassAudioStreamReadyTimeInNs"];

  int v119 = *((unsigned __int16 *)&self->_has + 4);
  int v25 = v119 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v119 & 0x1000) == 0)
  {
LABEL_78:
    if ((v25 & 0x20000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_176;
  }
LABEL_175:
  v120 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAudioStreamStartTimeInNs](self, "secondPassAudioStreamStartTimeInNs"));
  [v3 setObject:v120 forKeyedSubscript:@"secondPassAudioStreamStartTimeInNs"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x20000) == 0)
  {
LABEL_79:
    if ((v25 & 0x10000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_177;
  }
LABEL_176:
  v121 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassCheckerModelKeywordDetectionEndTimeInNs](self, "secondPassCheckerModelKeywordDetectionEndTimeInNs"));
  [v3 setObject:v121 forKeyedSubscript:@"secondPassCheckerModelKeywordDetectionEndTimeInNs"];

  int v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x10000) == 0)
  {
LABEL_80:
    if ((v25 & 0x4000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_178;
  }
LABEL_177:
  v122 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassCheckerModelKeywordDetectionStartTimeInNs](self, "secondPassCheckerModelKeywordDetectionStartTimeInNs"));
  [v3 setObject:v122 forKeyedSubscript:@"secondPassCheckerModelKeywordDetectionStartTimeInNs"];

  LOWORD(v25) = *((_WORD *)&self->_has + 4);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v25 & 0x4000) == 0)
  {
LABEL_81:
    if ((v25 & 0x8000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_179;
  }
LABEL_178:
  v123 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassFirstAudioPacketReceptionTimeInNs](self, "secondPassFirstAudioPacketReceptionTimeInNs"));
  [v3 setObject:v123 forKeyedSubscript:@"secondPassFirstAudioPacketReceptionTimeInNs"];

  LOBYTE(v25) = *((_WORD *)&self->_has + 4);
  uint64_t v24 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x8000) == 0)
  {
LABEL_82:
    if ((v24 & 0x10000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_180;
  }
LABEL_179:
  v124 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassLastAudioPacketReceptionTimeInNs](self, "secondPassLastAudioPacketReceptionTimeInNs"));
  [v3 setObject:v124 forKeyedSubscript:@"secondPassLastAudioPacketReceptionTimeInNs"];

  LOWORD(v25) = *((_WORD *)&self->_has + 4);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000) == 0)
  {
LABEL_83:
    if ((v24 & 0x20000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_181;
  }
LABEL_180:
  v125 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self shadowMicScore];
  v126 = objc_msgSend(v125, "numberWithFloat:");
  [v3 setObject:v126 forKeyedSubscript:@"shadowMicScore"];

  LOWORD(v25) = *((_WORD *)&self->_has + 4);
  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000) == 0)
  {
LABEL_84:
    if ((v25 & 0x10) == 0) {
      goto LABEL_85;
    }
    goto LABEL_182;
  }
LABEL_181:
  v127 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self shadowMicScoreThresholdForVAD];
  v128 = objc_msgSend(v127, "numberWithFloat:");
  [v3 setObject:v128 forKeyedSubscript:@"shadowMicScoreThresholdForVAD"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x10) == 0)
  {
LABEL_85:
    if ((v24 & 0x200) == 0) {
      goto LABEL_86;
    }
    goto LABEL_183;
  }
LABEL_182:
  v129 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo siriIsActiveOrOtherAssertion](self, "siriIsActiveOrOtherAssertion"));
  [v3 setObject:v129 forKeyedSubscript:@"siriIsActiveOrOtherAssertion"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x200) == 0)
  {
LABEL_86:
    if ((v24 & 0x80) == 0) {
      goto LABEL_87;
    }
    goto LABEL_184;
  }
LABEL_183:
  v130 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self tdSpeakerRecognizerCombinationWeight];
  v131 = objc_msgSend(v130, "numberWithFloat:");
  [v3 setObject:v131 forKeyedSubscript:@"tdSpeakerRecognizerCombinationWeight"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x80) == 0)
  {
LABEL_87:
    if ((v24 & 0x100) == 0) {
      goto LABEL_88;
    }
    goto LABEL_185;
  }
LABEL_184:
  v132 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self tdSpeakerRecognizerCombinedScore];
  v133 = objc_msgSend(v132, "numberWithFloat:");
  [v3 setObject:v133 forKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x100) == 0)
  {
LABEL_88:
    if ((v24 & 0x40) == 0) {
      goto LABEL_89;
    }
    goto LABEL_186;
  }
LABEL_185:
  v134 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self tdSpeakerRecognizerCombinedThreshold];
  v135 = objc_msgSend(v134, "numberWithFloat:");
  [v3 setObject:v135 forKeyedSubscript:@"tdSpeakerRecognizerCombinedThreshold"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x40) == 0)
  {
LABEL_89:
    if ((v24 & 0x20000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_187;
  }
LABEL_186:
  v136 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self tdSpeakerRecognizerScore];
  v137 = objc_msgSend(v136, "numberWithFloat:");
  [v3 setObject:v137 forKeyedSubscript:@"tdSpeakerRecognizerScore"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000000000) == 0)
  {
LABEL_90:
    if ((v24 & 0x200000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_188;
  }
LABEL_187:
  v138 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self threshold];
  v139 = objc_msgSend(v138, "numberWithFloat:");
  [v3 setObject:v139 forKeyedSubscript:@"threshold"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x200000000) == 0)
  {
LABEL_91:
    if ((v24 & 0x20000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_189;
  }
LABEL_188:
  v140 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSampleCount](self, "totalSampleCount"));
  [v3 setObject:v140 forKeyedSubscript:@"totalSampleCount"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000000000000) == 0)
  {
LABEL_92:
    if ((v24 & 0x10000000000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_190;
  }
LABEL_189:
  v141 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSamplesAtEndOfCapture](self, "totalSamplesAtEndOfCapture"));
  [v3 setObject:v141 forKeyedSubscript:@"totalSamplesAtEndOfCapture"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000000000000) == 0)
  {
LABEL_93:
    if ((v24 & 0x8000000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_191;
  }
LABEL_190:
  v142 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSamplesAtTriggerEnd](self, "totalSamplesAtTriggerEnd"));
  [v3 setObject:v142 forKeyedSubscript:@"totalSamplesAtTriggerEnd"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000000000) == 0)
  {
LABEL_94:
    if ((v24 & 0x4000000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_192;
  }
LABEL_191:
  v143 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSamplesAtTriggerStart](self, "totalSamplesAtTriggerStart"));
  [v3 setObject:v143 forKeyedSubscript:@"totalSamplesAtTriggerStart"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000000000000) == 0)
  {
LABEL_95:
    if ((v24 & 0x8000000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_193;
  }
LABEL_192:
  v144 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self triggerDurationInNs];
  v145 = objc_msgSend(v144, "numberWithFloat:");
  [v3 setObject:v145 forKeyedSubscript:@"triggerDurationInNs"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000) == 0)
  {
LABEL_96:
    if ((v24 & 0x1000000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_194;
  }
LABEL_193:
  v146 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerEndNs](self, "triggerEndNs"));
  [v3 setObject:v146 forKeyedSubscript:@"triggerEndNs"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000) == 0)
  {
LABEL_97:
    if ((v24 & 0x400000000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_195;
  }
LABEL_194:
  v147 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerEndSampleCount](self, "triggerEndSampleCount"));
  [v3 setObject:v147 forKeyedSubscript:@"triggerEndSampleCount"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x400000000000) == 0)
  {
LABEL_98:
    if ((v24 & 0x80000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_196;
  }
LABEL_195:
  v148 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self triggerEndTime];
  v149 = objc_msgSend(v148, "numberWithDouble:");
  [v3 setObject:v149 forKeyedSubscript:@"triggerEndTime"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x80000000000) == 0)
  {
LABEL_99:
    if ((v24 & 0x4000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_197;
  }
LABEL_196:
  v150 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerEndTimeOffsetInNs](self, "triggerEndTimeOffsetInNs"));
  [v3 setObject:v150 forKeyedSubscript:@"triggerEndTimeOffsetInNs"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000) == 0)
  {
LABEL_100:
    if ((v24 & 0x8000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_198;
  }
LABEL_197:
  v151 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self triggerExplicitSatScore];
  v152 = objc_msgSend(v151, "numberWithFloat:");
  [v3 setObject:v152 forKeyedSubscript:@"triggerExplicitSatScore"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000) == 0)
  {
LABEL_101:
    if ((v24 & 0x10000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_199;
  }
LABEL_198:
  v153 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self triggerExplicitTDSRSatScore];
  v154 = objc_msgSend(v153, "numberWithFloat:");
  [v3 setObject:v154 forKeyedSubscript:@"triggerExplicitTDSRSatScore"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000000) == 0)
  {
LABEL_102:
    if ((v24 & 0x2000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_200;
  }
LABEL_199:
  v155 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerFireNs](self, "triggerFireNs"));
  [v3 setObject:v155 forKeyedSubscript:@"triggerFireNs"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000) == 0)
  {
LABEL_103:
    if ((v24 & 0x100000000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_201;
  }
LABEL_200:
  v156 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerFireSampleCount](self, "triggerFireSampleCount"));
  [v3 setObject:v156 forKeyedSubscript:@"triggerFireSampleCount"];

  uint64_t v24 = (uint64_t)self->_has;
  if ((v24 & 0x100000000000) == 0)
  {
LABEL_104:
    if ((v24 & 0x800000000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }
LABEL_201:
  v157 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerFireTimeOffsetInNs](self, "triggerFireTimeOffsetInNs"));
  [v3 setObject:v157 forKeyedSubscript:@"triggerFireTimeOffsetInNs"];

  if ((*(void *)&self->_has & 0x800000000000) != 0)
  {
LABEL_105:
    v30 = NSNumber;
    [(MHSchemaMHVoiceTriggerEventInfo *)self triggerFiredTime];
    v31 = objc_msgSend(v30, "numberWithDouble:");
    [v3 setObject:v31 forKeyedSubscript:@"triggerFiredTime"];
  }
LABEL_106:
  if (self->_triggerPhrase)
  {
    v32 = [(MHSchemaMHVoiceTriggerEventInfo *)self triggerPhrase];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"triggerPhrase"];
  }
  v34 = &self->_has;
  uint64_t v35 = (uint64_t)self->_has;
  if ((v35 & 0x400000000) != 0)
  {
    v51 = NSNumber;
    [(MHSchemaMHVoiceTriggerEventInfo *)self triggerScore];
    v52 = objc_msgSend(v51, "numberWithFloat:");
    [v3 setObject:v52 forKeyedSubscript:@"triggerScore"];

    __int16 v36 = *((_WORD *)&self->_has + 4);
    uint64_t v35 = *(void *)v34;
    if ((*(void *)v34 & 0x4000000) == 0) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
  __int16 v36 = *((_WORD *)&self->_has + 4);
  if ((v35 & 0x4000000) != 0)
  {
LABEL_121:
    uint64_t v53 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerStartNs](self, "triggerStartNs"));
    [v3 setObject:v53 forKeyedSubscript:@"triggerStartNs"];

    __int16 v36 = *((_WORD *)&self->_has + 4);
    uint64_t v35 = (uint64_t)self->_has;
  }
LABEL_122:
  if ((v35 & 0x400000) != 0)
  {
    v58 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerStartSampleCount](self, "triggerStartSampleCount"));
    [v3 setObject:v58 forKeyedSubscript:@"triggerStartSampleCount"];

    __int16 v36 = *((_WORD *)&self->_has + 4);
    uint64_t v35 = (uint64_t)self->_has;
    if ((v35 & 0x200000000000) == 0)
    {
LABEL_124:
      if ((v35 & 0x40000000000) == 0) {
        goto LABEL_125;
      }
      goto LABEL_131;
    }
  }
  else if ((v35 & 0x200000000000) == 0)
  {
    goto LABEL_124;
  }
  v59 = NSNumber;
  [(MHSchemaMHVoiceTriggerEventInfo *)self triggerStartTime];
  v60 = objc_msgSend(v59, "numberWithDouble:");
  [v3 setObject:v60 forKeyedSubscript:@"triggerStartTime"];

  __int16 v36 = *((_WORD *)&self->_has + 4);
  uint64_t v35 = (uint64_t)self->_has;
  if ((v35 & 0x40000000000) == 0)
  {
LABEL_125:
    if ((v35 & 0x200000000000000) == 0) {
      goto LABEL_126;
    }
LABEL_132:
    v62 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo twoShotAudibleFeedbackDelayInNs](self, "twoShotAudibleFeedbackDelayInNs"));
    [v3 setObject:v62 forKeyedSubscript:@"twoShotAudibleFeedbackDelayInNs"];

    if ((*((_WORD *)&self->_has + 4) & 2) == 0) {
      goto LABEL_128;
    }
    goto LABEL_127;
  }
LABEL_131:
  v61 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerStartTimeOffsetInNs](self, "triggerStartTimeOffsetInNs"));
  [v3 setObject:v61 forKeyedSubscript:@"triggerStartTimeOffsetInNs"];

  __int16 v36 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x200000000000000) != 0) {
    goto LABEL_132;
  }
LABEL_126:
  if ((v36 & 2) != 0)
  {
LABEL_127:
    v54 = NSNumber;
    [(MHSchemaMHVoiceTriggerEventInfo *)self uptimeInSec];
    v55 = objc_msgSend(v54, "numberWithFloat:");
    [v3 setObject:v55 forKeyedSubscript:@"uptimeInSec"];
  }
LABEL_128:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v56 = v3;

  return v56;
}

- (unint64_t)hash
{
  uint64_t has = (uint64_t)self->_has;
  if ((has & 1) == 0)
  {
    unint64_t v259 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v258 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  unint64_t v259 = 2654435761u * self->_secondPassAnalyerStartSampleCount;
  if ((has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v258 = 2654435761u * self->_secondPassAnalyerEndSampleCount;
  if ((has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float satScore = self->_satScore;
  double v5 = satScore;
  if (satScore < 0.0) {
    double v5 = -satScore;
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
LABEL_13:
  if ((has & 8) != 0)
  {
    uint64_t v257 = 2654435761 * self->_satNumTrainingUtterances;
    if ((has & 0x10) != 0) {
      goto LABEL_15;
    }
LABEL_20:
    unint64_t v13 = 0;
    goto LABEL_23;
  }
  uint64_t v257 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_15:
  float satThreshold = self->_satThreshold;
  double v10 = satThreshold;
  if (satThreshold < 0.0) {
    double v10 = -satThreshold;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_23:
  if ((has & 0x20) != 0)
  {
    uint64_t v256 = 2654435761 * self->_satTriggered;
    if ((has & 0x40) != 0) {
      goto LABEL_25;
    }
LABEL_30:
    unint64_t v18 = 0;
    goto LABEL_33;
  }
  uint64_t v256 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  float tdSpeakerRecognizerScore = self->_tdSpeakerRecognizerScore;
  double v15 = tdSpeakerRecognizerScore;
  if (tdSpeakerRecognizerScore < 0.0) {
    double v15 = -tdSpeakerRecognizerScore;
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
LABEL_33:
  if ((has & 0x80) != 0)
  {
    float tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    double v21 = tdSpeakerRecognizerCombinedScore;
    if (tdSpeakerRecognizerCombinedScore < 0.0) {
      double v21 = -tdSpeakerRecognizerCombinedScore;
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
  if ((has & 0x100) != 0)
  {
    float tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    double v26 = tdSpeakerRecognizerCombinedThreshold;
    if (tdSpeakerRecognizerCombinedThreshold < 0.0) {
      double v26 = -tdSpeakerRecognizerCombinedThreshold;
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
  if ((has & 0x200) != 0)
  {
    float tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
    double v31 = tdSpeakerRecognizerCombinationWeight;
    if (tdSpeakerRecognizerCombinationWeight < 0.0) {
      double v31 = -tdSpeakerRecognizerCombinationWeight;
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
  if ((has & 0x400) != 0)
  {
    uint64_t v254 = 2654435761 * self->_biometricClue;
    if ((has & 0x800) != 0)
    {
LABEL_59:
      uint64_t v253 = 2654435761 * self->_satBeingTrained;
      if ((has & 0x1000) != 0) {
        goto LABEL_60;
      }
      goto LABEL_68;
    }
  }
  else
  {
    uint64_t v254 = 0;
    if ((has & 0x800) != 0) {
      goto LABEL_59;
    }
  }
  uint64_t v253 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_60:
    uint64_t v252 = 2654435761 * self->_lastConsecutivePHSRejects;
    if ((has & 0x2000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v252 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_61:
    unint64_t v251 = 2654435761u * self->_deltaTimeInNsFromlastPHSReject;
    if ((has & 0x4000) != 0) {
      goto LABEL_62;
    }
LABEL_70:
    unint64_t v272 = 0;
    goto LABEL_74;
  }
LABEL_69:
  unint64_t v251 = 0;
  if ((has & 0x4000) == 0) {
    goto LABEL_70;
  }
LABEL_62:
  float triggerExplicitSatScore = self->_triggerExplicitSatScore;
  double v35 = triggerExplicitSatScore;
  if (triggerExplicitSatScore < 0.0) {
    double v35 = -triggerExplicitSatScore;
  }
  long double v36 = floor(v35 + 0.5);
  double v37 = (v35 - v36) * 1.84467441e19;
  double v38 = fmod(v36, 1.84467441e19);
  if (v37 >= 0.0)
  {
    unint64_t v272 = 2654435761u * (unint64_t)v38;
    if (v37 <= 0.0) {
      goto LABEL_74;
    }
    unint64_t v39 = v272 + (unint64_t)v37;
  }
  else
  {
    unint64_t v39 = 2654435761u * (unint64_t)v38 - (unint64_t)fabs(v37);
  }
  unint64_t v272 = v39;
LABEL_74:
  if ((has & 0x8000) == 0)
  {
    unint64_t v271 = 0;
    goto LABEL_83;
  }
  float triggerExplicitTDSRSatScore = self->_triggerExplicitTDSRSatScore;
  double v41 = triggerExplicitTDSRSatScore;
  if (triggerExplicitTDSRSatScore < 0.0) {
    double v41 = -triggerExplicitTDSRSatScore;
  }
  long double v42 = floor(v41 + 0.5);
  double v43 = (v41 - v42) * 1.84467441e19;
  double v44 = fmod(v42, 1.84467441e19);
  if (v43 >= 0.0)
  {
    unint64_t v271 = 2654435761u * (unint64_t)v44;
    if (v43 <= 0.0) {
      goto LABEL_83;
    }
    unint64_t v45 = v271 + (unint64_t)v43;
  }
  else
  {
    unint64_t v45 = 2654435761u * (unint64_t)v44 - (unint64_t)fabs(v43);
  }
  unint64_t v271 = v45;
LABEL_83:
  if ((has & 0x10000) == 0)
  {
    unint64_t v270 = 0;
    goto LABEL_92;
  }
  float shadowMicScore = self->_shadowMicScore;
  double v47 = shadowMicScore;
  if (shadowMicScore < 0.0) {
    double v47 = -shadowMicScore;
  }
  long double v48 = floor(v47 + 0.5);
  double v49 = (v47 - v48) * 1.84467441e19;
  double v50 = fmod(v48, 1.84467441e19);
  if (v49 >= 0.0)
  {
    unint64_t v270 = 2654435761u * (unint64_t)v50;
    if (v49 <= 0.0) {
      goto LABEL_92;
    }
    unint64_t v51 = v270 + (unint64_t)v49;
  }
  else
  {
    unint64_t v51 = 2654435761u * (unint64_t)v50 - (unint64_t)fabs(v49);
  }
  unint64_t v270 = v51;
LABEL_92:
  if ((has & 0x20000) == 0)
  {
    unint64_t v269 = 0;
    goto LABEL_101;
  }
  float shadowMicScoreThresholdForVAD = self->_shadowMicScoreThresholdForVAD;
  double v53 = shadowMicScoreThresholdForVAD;
  if (shadowMicScoreThresholdForVAD < 0.0) {
    double v53 = -shadowMicScoreThresholdForVAD;
  }
  long double v54 = floor(v53 + 0.5);
  double v55 = (v53 - v54) * 1.84467441e19;
  double v56 = fmod(v54, 1.84467441e19);
  if (v55 >= 0.0)
  {
    unint64_t v269 = 2654435761u * (unint64_t)v56;
    if (v55 <= 0.0) {
      goto LABEL_101;
    }
    unint64_t v57 = v269 + (unint64_t)v55;
  }
  else
  {
    unint64_t v57 = 2654435761u * (unint64_t)v56 - (unint64_t)fabs(v55);
  }
  unint64_t v269 = v57;
LABEL_101:
  if ((has & 0x40000) == 0)
  {
    unint64_t v268 = 0;
    goto LABEL_110;
  }
  float remoteMicVADScore = self->_remoteMicVADScore;
  double v59 = remoteMicVADScore;
  if (remoteMicVADScore < 0.0) {
    double v59 = -remoteMicVADScore;
  }
  long double v60 = floor(v59 + 0.5);
  double v61 = (v59 - v60) * 1.84467441e19;
  double v62 = fmod(v60, 1.84467441e19);
  if (v61 >= 0.0)
  {
    unint64_t v268 = 2654435761u * (unint64_t)v62;
    if (v61 <= 0.0) {
      goto LABEL_110;
    }
    unint64_t v63 = v268 + (unint64_t)v61;
  }
  else
  {
    unint64_t v63 = 2654435761u * (unint64_t)v62 - (unint64_t)fabs(v61);
  }
  unint64_t v268 = v63;
LABEL_110:
  if ((has & 0x80000) == 0)
  {
    unint64_t v267 = 0;
    goto LABEL_119;
  }
  float remoteMicVADThreshold = self->_remoteMicVADThreshold;
  double v65 = remoteMicVADThreshold;
  if (remoteMicVADThreshold < 0.0) {
    double v65 = -remoteMicVADThreshold;
  }
  long double v66 = floor(v65 + 0.5);
  double v67 = (v65 - v66) * 1.84467441e19;
  double v68 = fmod(v66, 1.84467441e19);
  if (v67 >= 0.0)
  {
    unint64_t v267 = 2654435761u * (unint64_t)v68;
    if (v67 <= 0.0) {
      goto LABEL_119;
    }
    unint64_t v69 = v267 + (unint64_t)v67;
  }
  else
  {
    unint64_t v69 = 2654435761u * (unint64_t)v68 - (unint64_t)fabs(v67);
  }
  unint64_t v267 = v69;
LABEL_119:
  if ((has & 0x100000) != 0)
  {
    float remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    double v72 = remoteMicVADMyriadThreshold;
    if (remoteMicVADMyriadThreshold < 0.0) {
      double v72 = -remoteMicVADMyriadThreshold;
    }
    long double v73 = floor(v72 + 0.5);
    double v74 = (v72 - v73) * 1.84467441e19;
    unint64_t v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0) {
        v70 += (unint64_t)v74;
      }
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    unint64_t v70 = 0;
  }
  unint64_t v250 = v70;
  if ((has & 0x200000) != 0)
  {
    uint64_t v249 = 2654435761 * self->_enhancedCarplayTriggerMode;
    if ((has & 0x400000) != 0)
    {
LABEL_129:
      unint64_t v248 = 2654435761u * self->_triggerStartSampleCount;
      if ((has & 0x800000) != 0) {
        goto LABEL_130;
      }
      goto LABEL_147;
    }
  }
  else
  {
    uint64_t v249 = 0;
    if ((has & 0x400000) != 0) {
      goto LABEL_129;
    }
  }
  unint64_t v248 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_130:
    unint64_t v247 = 2654435761u * self->_clientStartSampleCount;
    if ((has & 0x1000000) != 0) {
      goto LABEL_131;
    }
    goto LABEL_148;
  }
LABEL_147:
  unint64_t v247 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_131:
    unint64_t v246 = 2654435761u * self->_triggerEndSampleCount;
    if ((has & 0x2000000) != 0) {
      goto LABEL_132;
    }
    goto LABEL_149;
  }
LABEL_148:
  unint64_t v246 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_132:
    unint64_t v245 = 2654435761u * self->_triggerFireSampleCount;
    if ((has & 0x4000000) != 0) {
      goto LABEL_133;
    }
    goto LABEL_150;
  }
LABEL_149:
  unint64_t v245 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_133:
    unint64_t v244 = 2654435761u * self->_triggerStartNs;
    if ((has & 0x8000000) != 0) {
      goto LABEL_134;
    }
    goto LABEL_151;
  }
LABEL_150:
  unint64_t v244 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_134:
    unint64_t v243 = 2654435761u * self->_triggerEndNs;
    if ((has & 0x10000000) != 0) {
      goto LABEL_135;
    }
    goto LABEL_152;
  }
LABEL_151:
  unint64_t v243 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_135:
    unint64_t v242 = 2654435761u * self->_triggerFireNs;
    if ((has & 0x20000000) != 0) {
      goto LABEL_136;
    }
    goto LABEL_153;
  }
LABEL_152:
  unint64_t v242 = 0;
  if ((has & 0x20000000) != 0)
  {
LABEL_136:
    unint64_t v241 = 2654435761u * self->_extraSamplesAtStart;
    if ((has & 0x40000000) != 0) {
      goto LABEL_137;
    }
    goto LABEL_154;
  }
LABEL_153:
  unint64_t v241 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_137:
    unint64_t v240 = 2654435761u * self->_analyzerPrependingSamples;
    if ((has & 0x80000000) != 0) {
      goto LABEL_138;
    }
    goto LABEL_155;
  }
LABEL_154:
  unint64_t v240 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_138:
    unint64_t v239 = 2654435761u * self->_analyzerTrailingSamples;
    if ((has & 0x100000000) != 0) {
      goto LABEL_139;
    }
    goto LABEL_156;
  }
LABEL_155:
  unint64_t v239 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_139:
    uint64_t v238 = 2654435761 * self->_isTriggerEvent;
    if ((has & 0x200000000) != 0) {
      goto LABEL_140;
    }
LABEL_157:
    unint64_t v237 = 0;
    if ((has & 0x400000000) != 0) {
      goto LABEL_141;
    }
LABEL_158:
    unint64_t v79 = 0;
    goto LABEL_161;
  }
LABEL_156:
  uint64_t v238 = 0;
  if ((has & 0x200000000) == 0) {
    goto LABEL_157;
  }
LABEL_140:
  unint64_t v237 = 2654435761u * self->_totalSampleCount;
  if ((has & 0x400000000) == 0) {
    goto LABEL_158;
  }
LABEL_141:
  float triggerScore = self->_triggerScore;
  double v76 = triggerScore;
  if (triggerScore < 0.0) {
    double v76 = -triggerScore;
  }
  long double v77 = floor(v76 + 0.5);
  double v78 = (v76 - v77) * 1.84467441e19;
  unint64_t v79 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
  if (v78 >= 0.0)
  {
    if (v78 > 0.0) {
      v79 += (unint64_t)v78;
    }
  }
  else
  {
    v79 -= (unint64_t)fabs(v78);
  }
LABEL_161:
  unint64_t v236 = v79;
  if ((has & 0x800000000) == 0)
  {
    uint64_t v235 = 0;
    if ((has & 0x1000000000) != 0) {
      goto LABEL_163;
    }
LABEL_168:
    unint64_t v266 = 0;
    goto LABEL_172;
  }
  uint64_t v235 = 2654435761 * self->_isMaximized;
  if ((has & 0x1000000000) == 0) {
    goto LABEL_168;
  }
LABEL_163:
  float effectiveThreshold = self->_effectiveThreshold;
  double v81 = effectiveThreshold;
  if (effectiveThreshold < 0.0) {
    double v81 = -effectiveThreshold;
  }
  long double v82 = floor(v81 + 0.5);
  double v83 = (v81 - v82) * 1.84467441e19;
  double v84 = fmod(v82, 1.84467441e19);
  if (v83 >= 0.0)
  {
    unint64_t v266 = 2654435761u * (unint64_t)v84;
    if (v83 <= 0.0) {
      goto LABEL_172;
    }
    unint64_t v85 = v266 + (unint64_t)v83;
  }
  else
  {
    unint64_t v85 = 2654435761u * (unint64_t)v84 - (unint64_t)fabs(v83);
  }
  unint64_t v266 = v85;
LABEL_172:
  if ((has & 0x2000000000) == 0)
  {
    unint64_t v265 = 0;
    goto LABEL_181;
  }
  float recognizerScore = self->_recognizerScore;
  double v87 = recognizerScore;
  if (recognizerScore < 0.0) {
    double v87 = -recognizerScore;
  }
  long double v88 = floor(v87 + 0.5);
  double v89 = (v87 - v88) * 1.84467441e19;
  double v90 = fmod(v88, 1.84467441e19);
  if (v89 >= 0.0)
  {
    unint64_t v265 = 2654435761u * (unint64_t)v90;
    if (v89 <= 0.0) {
      goto LABEL_181;
    }
    unint64_t v91 = v265 + (unint64_t)v89;
  }
  else
  {
    unint64_t v91 = 2654435761u * (unint64_t)v90 - (unint64_t)fabs(v89);
  }
  unint64_t v265 = v91;
LABEL_181:
  if ((has & 0x4000000000) != 0)
  {
    float recognizerThresholdOffset = self->_recognizerThresholdOffset;
    double v94 = recognizerThresholdOffset;
    if (recognizerThresholdOffset < 0.0) {
      double v94 = -recognizerThresholdOffset;
    }
    long double v95 = floor(v94 + 0.5);
    double v96 = (v94 - v95) * 1.84467441e19;
    unint64_t v92 = 2654435761u * (unint64_t)fmod(v95, 1.84467441e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0) {
        v92 += (unint64_t)v96;
      }
    }
    else
    {
      v92 -= (unint64_t)fabs(v96);
    }
  }
  else
  {
    unint64_t v92 = 0;
  }
  unint64_t v234 = v92;
  if ((has & 0x8000000000) == 0)
  {
    unint64_t v233 = 0;
    if ((has & 0x10000000000) != 0) {
      goto LABEL_191;
    }
LABEL_196:
    unint64_t v264 = 0;
    goto LABEL_200;
  }
  unint64_t v233 = 2654435761u * self->_recognizerWaitTimeInNs;
  if ((has & 0x10000000000) == 0) {
    goto LABEL_196;
  }
LABEL_191:
  float recognizerScaleFactor = self->_recognizerScaleFactor;
  double v98 = recognizerScaleFactor;
  if (recognizerScaleFactor < 0.0) {
    double v98 = -recognizerScaleFactor;
  }
  long double v99 = floor(v98 + 0.5);
  double v100 = (v98 - v99) * 1.84467441e19;
  double v101 = fmod(v99, 1.84467441e19);
  if (v100 >= 0.0)
  {
    unint64_t v264 = 2654435761u * (unint64_t)v101;
    if (v100 <= 0.0) {
      goto LABEL_200;
    }
    unint64_t v102 = v264 + (unint64_t)v100;
  }
  else
  {
    unint64_t v102 = 2654435761u * (unint64_t)v101 - (unint64_t)fabs(v100);
  }
  unint64_t v264 = v102;
LABEL_200:
  if ((has & 0x20000000000) != 0)
  {
    float threshold = self->_threshold;
    double v105 = threshold;
    if (threshold < 0.0) {
      double v105 = -threshold;
    }
    long double v106 = floor(v105 + 0.5);
    double v107 = (v105 - v106) * 1.84467441e19;
    unint64_t v103 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
    if (v107 >= 0.0)
    {
      if (v107 > 0.0) {
        v103 += (unint64_t)v107;
      }
    }
    else
    {
      v103 -= (unint64_t)fabs(v107);
    }
  }
  else
  {
    unint64_t v103 = 0;
  }
  unint64_t v232 = v103;
  if ((has & 0x40000000000) != 0)
  {
    unint64_t v231 = 2654435761u * self->_triggerStartTimeOffsetInNs;
    if ((has & 0x80000000000) != 0)
    {
LABEL_210:
      unint64_t v230 = 2654435761u * self->_triggerEndTimeOffsetInNs;
      if ((has & 0x100000000000) != 0) {
        goto LABEL_211;
      }
      goto LABEL_218;
    }
  }
  else
  {
    unint64_t v231 = 0;
    if ((has & 0x80000000000) != 0) {
      goto LABEL_210;
    }
  }
  unint64_t v230 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_211:
    unint64_t v229 = 2654435761u * self->_triggerFireTimeOffsetInNs;
    if ((has & 0x200000000000) != 0) {
      goto LABEL_212;
    }
LABEL_219:
    unint64_t v263 = 0;
    goto LABEL_223;
  }
LABEL_218:
  unint64_t v229 = 0;
  if ((has & 0x200000000000) == 0) {
    goto LABEL_219;
  }
LABEL_212:
  double triggerStartTime = self->_triggerStartTime;
  double v109 = -triggerStartTime;
  if (triggerStartTime >= 0.0) {
    double v109 = self->_triggerStartTime;
  }
  long double v110 = floor(v109 + 0.5);
  double v111 = (v109 - v110) * 1.84467441e19;
  double v112 = fmod(v110, 1.84467441e19);
  if (v111 >= 0.0)
  {
    unint64_t v263 = 2654435761u * (unint64_t)v112;
    if (v111 <= 0.0) {
      goto LABEL_223;
    }
    unint64_t v113 = v263 + (unint64_t)v111;
  }
  else
  {
    unint64_t v113 = 2654435761u * (unint64_t)v112 - (unint64_t)fabs(v111);
  }
  unint64_t v263 = v113;
LABEL_223:
  if ((has & 0x400000000000) == 0)
  {
    unint64_t v262 = 0;
    goto LABEL_232;
  }
  double triggerEndTime = self->_triggerEndTime;
  double v115 = -triggerEndTime;
  if (triggerEndTime >= 0.0) {
    double v115 = self->_triggerEndTime;
  }
  long double v116 = floor(v115 + 0.5);
  double v117 = (v115 - v116) * 1.84467441e19;
  double v118 = fmod(v116, 1.84467441e19);
  if (v117 >= 0.0)
  {
    unint64_t v262 = 2654435761u * (unint64_t)v118;
    if (v117 <= 0.0) {
      goto LABEL_232;
    }
    unint64_t v119 = v262 + (unint64_t)v117;
  }
  else
  {
    unint64_t v119 = 2654435761u * (unint64_t)v118 - (unint64_t)fabs(v117);
  }
  unint64_t v262 = v119;
LABEL_232:
  if ((has & 0x800000000000) != 0)
  {
    double triggerFiredTime = self->_triggerFiredTime;
    double v122 = -triggerFiredTime;
    if (triggerFiredTime >= 0.0) {
      double v122 = self->_triggerFiredTime;
    }
    long double v123 = floor(v122 + 0.5);
    double v124 = (v122 - v123) * 1.84467441e19;
    unint64_t v120 = 2654435761u * (unint64_t)fmod(v123, 1.84467441e19);
    if (v124 >= 0.0)
    {
      if (v124 > 0.0) {
        v120 += (unint64_t)v124;
      }
    }
    else
    {
      v120 -= (unint64_t)fabs(v124);
    }
  }
  else
  {
    unint64_t v120 = 0;
  }
  unint64_t v228 = v120;
  if ((has & 0x1000000000000) == 0)
  {
    uint64_t v227 = 0;
    if ((has & 0x2000000000000) != 0) {
      goto LABEL_242;
    }
LABEL_248:
    uint64_t v226 = 0;
    if ((has & 0x4000000000000) != 0) {
      goto LABEL_243;
    }
LABEL_249:
    unint64_t v129 = 0;
    goto LABEL_252;
  }
  uint64_t v227 = 2654435761 * self->_hardwareSamplerate;
  if ((has & 0x2000000000000) == 0) {
    goto LABEL_248;
  }
LABEL_242:
  uint64_t v226 = 2654435761 * self->_isContinuous;
  if ((has & 0x4000000000000) == 0) {
    goto LABEL_249;
  }
LABEL_243:
  float triggerDurationInNs = self->_triggerDurationInNs;
  double v126 = triggerDurationInNs;
  if (triggerDurationInNs < 0.0) {
    double v126 = -triggerDurationInNs;
  }
  long double v127 = floor(v126 + 0.5);
  double v128 = (v126 - v127) * 1.84467441e19;
  unint64_t v129 = 2654435761u * (unint64_t)fmod(v127, 1.84467441e19);
  if (v128 >= 0.0)
  {
    if (v128 > 0.0) {
      v129 += (unint64_t)v128;
    }
  }
  else
  {
    v129 -= (unint64_t)fabs(v128);
  }
LABEL_252:
  if ((has & 0x8000000000000) != 0)
  {
    unint64_t v224 = 2654435761u * self->_totalSamplesAtTriggerStart;
    if ((has & 0x10000000000000) != 0) {
      goto LABEL_254;
    }
  }
  else
  {
    unint64_t v224 = 0;
    if ((has & 0x10000000000000) != 0)
    {
LABEL_254:
      unint64_t v223 = 2654435761u * self->_totalSamplesAtTriggerEnd;
      goto LABEL_257;
    }
  }
  unint64_t v223 = 0;
LABEL_257:
  unint64_t v225 = v129;
  if ((has & 0x20000000000000) != 0) {
    unint64_t v222 = 2654435761u * self->_totalSamplesAtEndOfCapture;
  }
  else {
    unint64_t v222 = 0;
  }
  NSUInteger v221 = [(NSString *)self->_configVersion hash];
  NSUInteger v220 = [(NSString *)self->_configPath hash];
  uint64_t v130 = (uint64_t)self->_has;
  if ((v130 & 0x40000000000000) != 0)
  {
    uint64_t v219 = 2654435761 * self->_isSecondChance;
    if ((v130 & 0x80000000000000) != 0)
    {
LABEL_262:
      uint64_t v218 = 2654435761 * self->_deviceHandheld;
      if ((v130 & 0x100000000000000) != 0) {
        goto LABEL_263;
      }
      goto LABEL_271;
    }
  }
  else
  {
    uint64_t v219 = 0;
    if ((v130 & 0x80000000000000) != 0) {
      goto LABEL_262;
    }
  }
  uint64_t v218 = 0;
  if ((v130 & 0x100000000000000) != 0)
  {
LABEL_263:
    uint64_t v217 = 2654435761 * self->_activeChannel;
    if ((v130 & 0x200000000000000) != 0) {
      goto LABEL_264;
    }
    goto LABEL_272;
  }
LABEL_271:
  uint64_t v217 = 0;
  if ((v130 & 0x200000000000000) != 0)
  {
LABEL_264:
    unint64_t v216 = 2654435761u * self->_twoShotAudibleFeedbackDelayInNs;
    if ((v130 & 0x400000000000000) != 0) {
      goto LABEL_265;
    }
LABEL_273:
    unint64_t v261 = 0;
    goto LABEL_277;
  }
LABEL_272:
  unint64_t v216 = 0;
  if ((v130 & 0x400000000000000) == 0) {
    goto LABEL_273;
  }
LABEL_265:
  float cumulativeUptimeInSec = self->_cumulativeUptimeInSec;
  double v132 = cumulativeUptimeInSec;
  if (cumulativeUptimeInSec < 0.0) {
    double v132 = -cumulativeUptimeInSec;
  }
  long double v133 = floor(v132 + 0.5);
  double v134 = (v132 - v133) * 1.84467441e19;
  double v135 = fmod(v133, 1.84467441e19);
  if (v134 >= 0.0)
  {
    unint64_t v261 = 2654435761u * (unint64_t)v135;
    if (v134 <= 0.0) {
      goto LABEL_277;
    }
    unint64_t v136 = v261 + (unint64_t)v134;
  }
  else
  {
    unint64_t v136 = 2654435761u * (unint64_t)v135 - (unint64_t)fabs(v134);
  }
  unint64_t v261 = v136;
LABEL_277:
  if ((v130 & 0x800000000000000) != 0)
  {
    float cumulativeDowntimeInSec = self->_cumulativeDowntimeInSec;
    double v139 = cumulativeDowntimeInSec;
    if (cumulativeDowntimeInSec < 0.0) {
      double v139 = -cumulativeDowntimeInSec;
    }
    long double v140 = floor(v139 + 0.5);
    double v141 = (v139 - v140) * 1.84467441e19;
    unint64_t v137 = 2654435761u * (unint64_t)fmod(v140, 1.84467441e19);
    if (v141 >= 0.0)
    {
      if (v141 > 0.0) {
        v137 += (unint64_t)v141;
      }
    }
    else
    {
      v137 -= (unint64_t)fabs(v141);
    }
  }
  else
  {
    unint64_t v137 = 0;
  }
  if ((v130 & 0x1000000000000000) != 0)
  {
    uint64_t v214 = 2654435761 * self->_hostPowerStateAtTrigger;
    if ((v130 & 0x2000000000000000) != 0) {
      goto LABEL_287;
    }
  }
  else
  {
    uint64_t v214 = 0;
    if ((v130 & 0x2000000000000000) != 0)
    {
LABEL_287:
      uint64_t v213 = 2654435761 * self->_isMediaPlaying;
      goto LABEL_290;
    }
  }
  uint64_t v213 = 0;
LABEL_290:
  unint64_t v215 = v137;
  if ((v130 & 0x4000000000000000) != 0)
  {
    float mediaVolume = self->_mediaVolume;
    double v144 = mediaVolume;
    if (mediaVolume < 0.0) {
      double v144 = -mediaVolume;
    }
    long double v145 = floor(v144 + 0.5);
    double v146 = (v144 - v145) * 1.84467441e19;
    unint64_t v142 = 2654435761u * (unint64_t)fmod(v145, 1.84467441e19);
    if (v146 >= 0.0)
    {
      if (v146 > 0.0) {
        v142 += (unint64_t)v146;
      }
    }
    else
    {
      v142 -= (unint64_t)fabs(v146);
    }
  }
  else
  {
    unint64_t v142 = 0;
  }
  unint64_t v212 = v142;
  unint64_t v211 = [(SISchemaUUID *)self->_audioProviderUUID hash];
  __int16 v147 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x8000000000000000) != 0)
  {
    uint64_t v210 = 2654435761 * self->_onBatteryPower;
    if (v147)
    {
LABEL_300:
      uint64_t v209 = 2654435761 * self->_didWakeAP;
      if ((v147 & 2) != 0) {
        goto LABEL_301;
      }
LABEL_307:
      unint64_t v260 = 0;
      goto LABEL_311;
    }
  }
  else
  {
    uint64_t v210 = 0;
    if (v147) {
      goto LABEL_300;
    }
  }
  uint64_t v209 = 0;
  if ((v147 & 2) == 0) {
    goto LABEL_307;
  }
LABEL_301:
  float uptimeInSec = self->_uptimeInSec;
  double v149 = uptimeInSec;
  if (uptimeInSec < 0.0) {
    double v149 = -uptimeInSec;
  }
  long double v150 = floor(v149 + 0.5);
  double v151 = (v149 - v150) * 1.84467441e19;
  double v152 = fmod(v150, 1.84467441e19);
  if (v151 >= 0.0)
  {
    unint64_t v260 = 2654435761u * (unint64_t)v152;
    if (v151 <= 0.0) {
      goto LABEL_311;
    }
    unint64_t v153 = v260 + (unint64_t)v151;
  }
  else
  {
    unint64_t v153 = 2654435761u * (unint64_t)v152 - (unint64_t)fabs(v151);
  }
  unint64_t v260 = v153;
LABEL_311:
  if ((v147 & 4) != 0)
  {
    float downtimeInSec = self->_downtimeInSec;
    double v156 = downtimeInSec;
    if (downtimeInSec < 0.0) {
      double v156 = -downtimeInSec;
    }
    long double v157 = floor(v156 + 0.5);
    double v158 = (v156 - v157) * 1.84467441e19;
    unint64_t v154 = 2654435761u * (unint64_t)fmod(v157, 1.84467441e19);
    if (v158 >= 0.0)
    {
      if (v158 > 0.0) {
        v154 += (unint64_t)v158;
      }
    }
    else
    {
      v154 -= (unint64_t)fabs(v158);
    }
  }
  else
  {
    unint64_t v154 = 0;
  }
  unint64_t v208 = v154;
  if ((v147 & 8) != 0) {
    uint64_t v207 = 2654435761 * self->_lastConsecutiveVTRejects;
  }
  else {
    uint64_t v207 = 0;
  }
  NSUInteger v206 = [(NSString *)self->_captureFilePath hash];
  NSUInteger v205 = [(NSString *)self->_configDataHash hash];
  int v159 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
    uint64_t v204 = 2654435761 * self->_siriIsActiveOrOtherAssertion;
    if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
    {
LABEL_324:
      uint64_t v203 = 2654435761 * self->_didAudioStall;
      if ((*((_WORD *)&self->_has + 4) & 0x40) != 0) {
        goto LABEL_325;
      }
      goto LABEL_338;
    }
  }
  else
  {
    uint64_t v204 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x20) != 0) {
      goto LABEL_324;
    }
  }
  uint64_t v203 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_325:
    uint64_t v202 = 2654435761 * self->_isBargeIn;
    if ((*((_WORD *)&self->_has + 4) & 0x80) != 0) {
      goto LABEL_326;
    }
    goto LABEL_339;
  }
LABEL_338:
  uint64_t v202 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
  {
LABEL_326:
    uint64_t v201 = 2654435761 * self->_isWakeFromSleep;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0) {
      goto LABEL_327;
    }
    goto LABEL_340;
  }
LABEL_339:
  uint64_t v201 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_327:
    unint64_t v200 = 2654435761u * self->_secondPassAssetQueryStartTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x200) != 0) {
      goto LABEL_328;
    }
    goto LABEL_341;
  }
LABEL_340:
  unint64_t v200 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_328:
    unint64_t v199 = 2654435761u * self->_secondPassAssetQueryCompleteTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x400) != 0) {
      goto LABEL_329;
    }
    goto LABEL_342;
  }
LABEL_341:
  unint64_t v199 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
LABEL_329:
    unint64_t v198 = 2654435761u * self->_secondPassAssetLoadStartTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x800) != 0) {
      goto LABEL_330;
    }
    goto LABEL_343;
  }
LABEL_342:
  unint64_t v198 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_330:
    unint64_t v197 = 2654435761u * self->_secondPassAssetLoadCompleteTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0) {
      goto LABEL_331;
    }
    goto LABEL_344;
  }
LABEL_343:
  unint64_t v197 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
  {
LABEL_331:
    unint64_t v196 = 2654435761u * self->_secondPassAudioStreamStartTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0) {
      goto LABEL_332;
    }
    goto LABEL_345;
  }
LABEL_344:
  unint64_t v196 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
  {
LABEL_332:
    unint64_t v195 = 2654435761u * self->_secondPassAudioStreamReadyTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0) {
      goto LABEL_333;
    }
    goto LABEL_346;
  }
LABEL_345:
  unint64_t v195 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
  {
LABEL_333:
    unint64_t v194 = 2654435761u * self->_secondPassFirstAudioPacketReceptionTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0) {
      goto LABEL_334;
    }
LABEL_347:
    unint64_t v193 = 0;
    if ((v159 & 0x10000) != 0) {
      goto LABEL_335;
    }
    goto LABEL_348;
  }
LABEL_346:
  unint64_t v194 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x8000) == 0) {
    goto LABEL_347;
  }
LABEL_334:
  unint64_t v193 = 2654435761u * self->_secondPassLastAudioPacketReceptionTimeInNs;
  if ((v159 & 0x10000) != 0)
  {
LABEL_335:
    unint64_t v192 = 2654435761u * self->_secondPassCheckerModelKeywordDetectionStartTimeInNs;
    goto LABEL_349;
  }
LABEL_348:
  unint64_t v192 = 0;
LABEL_349:
  unint64_t v255 = v19;
  unint64_t v160 = v18;
  if ((v159 & 0x20000) != 0) {
    unint64_t v191 = 2654435761u * self->_secondPassCheckerModelKeywordDetectionEndTimeInNs;
  }
  else {
    unint64_t v191 = 0;
  }
  unint64_t v161 = v29;
  NSUInteger v190 = [(NSString *)self->_triggerPhrase hash];
  int v162 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v162 & 0x40000) != 0)
  {
    double lastDisplayWakeTimeOffsetInNs = self->_lastDisplayWakeTimeOffsetInNs;
    double v165 = -lastDisplayWakeTimeOffsetInNs;
    if (lastDisplayWakeTimeOffsetInNs >= 0.0) {
      double v165 = self->_lastDisplayWakeTimeOffsetInNs;
    }
    long double v166 = floor(v165 + 0.5);
    double v167 = (v165 - v166) * 1.84467441e19;
    unint64_t v163 = 2654435761u * (unint64_t)fmod(v166, 1.84467441e19);
    if (v167 >= 0.0)
    {
      if (v167 > 0.0) {
        v163 += (unint64_t)v167;
      }
    }
    else
    {
      v163 -= (unint64_t)fabs(v167);
    }
  }
  else
  {
    unint64_t v163 = 0;
  }
  if ((v162 & 0x80000) == 0)
  {
    uint64_t v168 = 0;
    if ((v162 & 0x100000) != 0) {
      goto LABEL_362;
    }
LABEL_368:
    unint64_t v169 = 0;
    if ((v162 & 0x200000) != 0) {
      goto LABEL_363;
    }
LABEL_369:
    unint64_t v175 = 0;
    unint64_t v177 = v271;
    unint64_t v176 = v272;
    unint64_t v179 = v269;
    unint64_t v178 = v270;
    unint64_t v181 = v267;
    unint64_t v180 = v268;
    unint64_t v183 = v265;
    unint64_t v182 = v266;
    unint64_t v185 = v263;
    unint64_t v184 = v264;
    unint64_t v187 = v261;
    unint64_t v186 = v262;
    unint64_t v188 = v260;
    return v258 ^ v259 ^ v8 ^ v257 ^ v13 ^ v256 ^ v160 ^ v255 ^ v24 ^ v161 ^ v254 ^ v253 ^ v252 ^ v251 ^ v176 ^ v177 ^ v178 ^ v179 ^ v180 ^ v181 ^ v250 ^ v249 ^ v248 ^ v247 ^ v246 ^ v245 ^ v244 ^ v243 ^ v242 ^ v241 ^ v240 ^ v239 ^ v238 ^ v237 ^ v236 ^ v235 ^ v182 ^ v183 ^ v234 ^ v233 ^ v184 ^ v232 ^ v231 ^ v230 ^ v229 ^ v185 ^ v186 ^ v228 ^ v227 ^ v226 ^ v225 ^ v224 ^ v223 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v187 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v188 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v163 ^ v168 ^ v169 ^ v175;
  }
  uint64_t v168 = 2654435761 * self->_isHSJSTriggerFromAlwaysOnMicBuffer;
  if ((v162 & 0x100000) == 0) {
    goto LABEL_368;
  }
LABEL_362:
  unint64_t v169 = 2654435761u * self->_displayWakeTimeOffsetInNs;
  if ((v162 & 0x200000) == 0) {
    goto LABEL_369;
  }
LABEL_363:
  uint64_t v170 = v168;
  float neptuneDetectionApiScore = self->_neptuneDetectionApiScore;
  double v172 = neptuneDetectionApiScore;
  if (neptuneDetectionApiScore < 0.0) {
    double v172 = -neptuneDetectionApiScore;
  }
  long double v173 = floor(v172 + 0.5);
  double v174 = (v172 - v173) * 1.84467441e19;
  unint64_t v175 = 2654435761u * (unint64_t)fmod(v173, 1.84467441e19);
  if (v174 >= 0.0)
  {
    unint64_t v177 = v271;
    unint64_t v176 = v272;
    unint64_t v179 = v269;
    unint64_t v178 = v270;
    unint64_t v181 = v267;
    unint64_t v180 = v268;
    unint64_t v183 = v265;
    unint64_t v182 = v266;
    unint64_t v185 = v263;
    unint64_t v184 = v264;
    unint64_t v187 = v261;
    unint64_t v186 = v262;
    unint64_t v188 = v260;
    uint64_t v168 = v170;
    if (v174 > 0.0) {
      v175 += (unint64_t)v174;
    }
  }
  else
  {
    v175 -= (unint64_t)fabs(v174);
    unint64_t v177 = v271;
    unint64_t v176 = v272;
    unint64_t v179 = v269;
    unint64_t v178 = v270;
    unint64_t v181 = v267;
    unint64_t v180 = v268;
    unint64_t v183 = v265;
    unint64_t v182 = v266;
    unint64_t v185 = v263;
    unint64_t v184 = v264;
    unint64_t v187 = v261;
    unint64_t v186 = v262;
    unint64_t v188 = v260;
    uint64_t v168 = v170;
  }
  return v258 ^ v259 ^ v8 ^ v257 ^ v13 ^ v256 ^ v160 ^ v255 ^ v24 ^ v161 ^ v254 ^ v253 ^ v252 ^ v251 ^ v176 ^ v177 ^ v178 ^ v179 ^ v180 ^ v181 ^ v250 ^ v249 ^ v248 ^ v247 ^ v246 ^ v245 ^ v244 ^ v243 ^ v242 ^ v241 ^ v240 ^ v239 ^ v238 ^ v237 ^ v236 ^ v235 ^ v182 ^ v183 ^ v234 ^ v233 ^ v184 ^ v232 ^ v231 ^ v230 ^ v229 ^ v185 ^ v186 ^ v228 ^ v227 ^ v226 ^ v225 ^ v224 ^ v223 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v187 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v188 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v163 ^ v168 ^ v169 ^ v175;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_378;
  }
  unint64_t has = (unint64_t)self->_has;
  unint64_t v6 = *(void *)(v4 + 556);
  if ((has & 1) != (*((_DWORD *)v4 + 139) & 1)) {
    goto LABEL_378;
  }
  if (has)
  {
    unint64_t secondPassAnalyerStartSampleCount = self->_secondPassAnalyerStartSampleCount;
    if (secondPassAnalyerStartSampleCount != [v4 secondPassAnalyerStartSampleCount]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  else
  {
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
  }
  unsigned int v10 = (has >> 1) & 1;
  if (v10 != ((v6 >> 1) & 1)) {
    goto LABEL_378;
  }
  if (v10)
  {
    unint64_t secondPassAnalyerEndSampleCount = self->_secondPassAnalyerEndSampleCount;
    if (secondPassAnalyerEndSampleCount != [v4 secondPassAnalyerEndSampleCount]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v12 = (has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_378;
  }
  if (v12)
  {
    float satScore = self->_satScore;
    [v4 satScore];
    if (satScore != v14) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v15 = (has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1)) {
    goto LABEL_378;
  }
  if (v15)
  {
    unsigned int satNumTrainingUtterances = self->_satNumTrainingUtterances;
    if (satNumTrainingUtterances != [v4 satNumTrainingUtterances]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v17 = (has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1)) {
    goto LABEL_378;
  }
  if (v17)
  {
    float satThreshold = self->_satThreshold;
    [v4 satThreshold];
    if (satThreshold != v19) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v20 = (has >> 5) & 1;
  if (v20 != ((v6 >> 5) & 1)) {
    goto LABEL_378;
  }
  if (v20)
  {
    int satTriggered = self->_satTriggered;
    if (satTriggered != [v4 satTriggered]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v22 = (has >> 6) & 1;
  if (v22 != ((v6 >> 6) & 1)) {
    goto LABEL_378;
  }
  if (v22)
  {
    float tdSpeakerRecognizerScore = self->_tdSpeakerRecognizerScore;
    [v4 tdSpeakerRecognizerScore];
    if (tdSpeakerRecognizerScore != v24) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v25 = (has >> 7) & 1;
  if (v25 != ((v6 >> 7) & 1)) {
    goto LABEL_378;
  }
  if (v25)
  {
    float tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    [v4 tdSpeakerRecognizerCombinedScore];
    if (tdSpeakerRecognizerCombinedScore != v27) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v28 = (has >> 8) & 1;
  if (v28 != ((v6 >> 8) & 1)) {
    goto LABEL_378;
  }
  if (v28)
  {
    float tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    [v4 tdSpeakerRecognizerCombinedThreshold];
    if (tdSpeakerRecognizerCombinedThreshold != v30) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v31 = (has >> 9) & 1;
  if (v31 != ((v6 >> 9) & 1)) {
    goto LABEL_378;
  }
  if (v31)
  {
    float tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
    [v4 tdSpeakerRecognizerCombinationWeight];
    if (tdSpeakerRecognizerCombinationWeight != v33) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v34 = (has >> 10) & 1;
  if (v34 != ((v6 >> 10) & 1)) {
    goto LABEL_378;
  }
  if (v34)
  {
    int biometricClue = self->_biometricClue;
    if (biometricClue != [v4 biometricClue]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v36 = (has >> 11) & 1;
  if (v36 != ((v6 >> 11) & 1)) {
    goto LABEL_378;
  }
  if (v36)
  {
    int satBeingTrained = self->_satBeingTrained;
    if (satBeingTrained != [v4 satBeingTrained]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v38 = (has >> 12) & 1;
  if (v38 != ((v6 >> 12) & 1)) {
    goto LABEL_378;
  }
  if (v38)
  {
    unsigned int lastConsecutivePHSRejects = self->_lastConsecutivePHSRejects;
    if (lastConsecutivePHSRejects != [v4 lastConsecutivePHSRejects]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v40 = (has >> 13) & 1;
  if (v40 != ((v6 >> 13) & 1)) {
    goto LABEL_378;
  }
  if (v40)
  {
    unint64_t deltaTimeInNsFromlastPHSReject = self->_deltaTimeInNsFromlastPHSReject;
    if (deltaTimeInNsFromlastPHSReject != [v4 deltaTimeInNsFromlastPHSReject]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v42 = (has >> 14) & 1;
  if (v42 != ((v6 >> 14) & 1)) {
    goto LABEL_378;
  }
  if (v42)
  {
    float triggerExplicitSatScore = self->_triggerExplicitSatScore;
    [v4 triggerExplicitSatScore];
    if (triggerExplicitSatScore != v44) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v45 = (has >> 15) & 1;
  if (v45 != ((v6 >> 15) & 1)) {
    goto LABEL_378;
  }
  if (v45)
  {
    float triggerExplicitTDSRSatScore = self->_triggerExplicitTDSRSatScore;
    [v4 triggerExplicitTDSRSatScore];
    if (triggerExplicitTDSRSatScore != v47) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v48 = WORD1(has) & 1;
  if (v48 != (WORD1(v6) & 1)) {
    goto LABEL_378;
  }
  if (v48)
  {
    float shadowMicScore = self->_shadowMicScore;
    [v4 shadowMicScore];
    if (shadowMicScore != v50) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v51 = (has >> 17) & 1;
  if (v51 != ((v6 >> 17) & 1)) {
    goto LABEL_378;
  }
  if (v51)
  {
    float shadowMicScoreThresholdForVAD = self->_shadowMicScoreThresholdForVAD;
    [v4 shadowMicScoreThresholdForVAD];
    if (shadowMicScoreThresholdForVAD != v53) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v54 = (has >> 18) & 1;
  if (v54 != ((v6 >> 18) & 1)) {
    goto LABEL_378;
  }
  if (v54)
  {
    float remoteMicVADScore = self->_remoteMicVADScore;
    [v4 remoteMicVADScore];
    if (remoteMicVADScore != v56) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v57 = (has >> 19) & 1;
  if (v57 != ((v6 >> 19) & 1)) {
    goto LABEL_378;
  }
  if (v57)
  {
    float remoteMicVADThreshold = self->_remoteMicVADThreshold;
    [v4 remoteMicVADThreshold];
    if (remoteMicVADThreshold != v59) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v60 = (has >> 20) & 1;
  if (v60 != ((v6 >> 20) & 1)) {
    goto LABEL_378;
  }
  if (v60)
  {
    float remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    [v4 remoteMicVADMyriadThreshold];
    if (remoteMicVADMyriadThreshold != v62) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v63 = (has >> 21) & 1;
  if (v63 != ((v6 >> 21) & 1)) {
    goto LABEL_378;
  }
  if (v63)
  {
    int enhancedCarplayTriggerMode = self->_enhancedCarplayTriggerMode;
    if (enhancedCarplayTriggerMode != [v4 enhancedCarplayTriggerMode]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v65 = (has >> 22) & 1;
  if (v65 != ((v6 >> 22) & 1)) {
    goto LABEL_378;
  }
  if (v65)
  {
    unint64_t triggerStartSampleCount = self->_triggerStartSampleCount;
    if (triggerStartSampleCount != [v4 triggerStartSampleCount]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v67 = (has >> 23) & 1;
  if (v67 != ((v6 >> 23) & 1)) {
    goto LABEL_378;
  }
  if (v67)
  {
    unint64_t clientStartSampleCount = self->_clientStartSampleCount;
    if (clientStartSampleCount != [v4 clientStartSampleCount]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v69 = BYTE3(has) & 1;
  if (v69 != (BYTE3(v6) & 1)) {
    goto LABEL_378;
  }
  if (v69)
  {
    unint64_t triggerEndSampleCount = self->_triggerEndSampleCount;
    if (triggerEndSampleCount != [v4 triggerEndSampleCount]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v71 = (has >> 25) & 1;
  if (v71 != ((v6 >> 25) & 1)) {
    goto LABEL_378;
  }
  if (v71)
  {
    unint64_t triggerFireSampleCount = self->_triggerFireSampleCount;
    if (triggerFireSampleCount != [v4 triggerFireSampleCount]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v73 = (has >> 26) & 1;
  if (v73 != ((v6 >> 26) & 1)) {
    goto LABEL_378;
  }
  if (v73)
  {
    unint64_t triggerStartNs = self->_triggerStartNs;
    if (triggerStartNs != [v4 triggerStartNs]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v75 = (has >> 27) & 1;
  if (v75 != ((v6 >> 27) & 1)) {
    goto LABEL_378;
  }
  if (v75)
  {
    unint64_t triggerEndNs = self->_triggerEndNs;
    if (triggerEndNs != [v4 triggerEndNs]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v77 = (has >> 28) & 1;
  if (v77 != ((v6 >> 28) & 1)) {
    goto LABEL_378;
  }
  if (v77)
  {
    unint64_t triggerFireNs = self->_triggerFireNs;
    if (triggerFireNs != [v4 triggerFireNs]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v79 = (has >> 29) & 1;
  if (v79 != ((v6 >> 29) & 1)) {
    goto LABEL_378;
  }
  if (v79)
  {
    unint64_t extraSamplesAtStart = self->_extraSamplesAtStart;
    if (extraSamplesAtStart != [v4 extraSamplesAtStart]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  unsigned int v81 = (has >> 30) & 1;
  if (v81 != ((v6 >> 30) & 1)) {
    goto LABEL_378;
  }
  if (v81)
  {
    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    if (analyzerPrependingSamples != [v4 analyzerPrependingSamples]) {
      goto LABEL_378;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    unint64_t v6 = *(void *)(v4 + 556);
  }
  if (((v6 ^ has) & 0x80000000) != 0) {
    goto LABEL_378;
  }
  if ((has & 0x80000000) != 0)
  {
    unint64_t analyzerTrailingSamples = self->_analyzerTrailingSamples;
    if (analyzerTrailingSamples != [v4 analyzerTrailingSamples]) {
      goto LABEL_378;
    }
    int v108 = *((unsigned __int16 *)&self->_has + 4);
    int v109 = *((unsigned __int16 *)v4 + 282);
    unint64_t v110 = *(void *)(v4 + 556);
    unint64_t v111 = (unint64_t)self->_has;
    unint64_t v83 = (v110 >> 33) | (v109 << 31);
    unint64_t v84 = (v110 >> 34) | (v109 << 30);
    char v85 = v110 >> 35;
    char v86 = v110 >> 36;
    char v87 = v110 >> 37;
    char v395 = v110 >> 39;
    char v396 = v110 >> 38;
    char v394 = BYTE5(v110);
    char v378 = v110 >> 42;
    char v379 = v110 >> 43;
    char v380 = v110 >> 44;
    char v381 = v110 >> 45;
    char v383 = v110 >> 41;
    char v384 = v110 >> 46;
    char v386 = v110 >> 47;
    char v388 = BYTE6(v110);
    char v389 = v110 >> 49;
    char v390 = v110 >> 50;
    char v391 = v110 >> 51;
    char v392 = v110 >> 52;
    LOBYTE(v393) = v110 >> 53;
    uint64_t v88 = (v111 >> 33) | (v108 << 31);
    uint64_t v89 = (v111 >> 34) | (v108 << 30);
    uint64_t v90 = (v111 >> 35) | (v108 << 29);
    uint64_t v91 = (v111 >> 36) | (v108 << 28);
    char v92 = v111 >> 37;
    char v93 = v111 >> 38;
    char v94 = v111 >> 39;
    char v95 = BYTE5(v111);
    char v96 = v111 >> 41;
    char v97 = v111 >> 42;
    char v98 = v111 >> 43;
    char v99 = v111 >> 44;
    char v100 = v111 >> 45;
    char v382 = v111 >> 46;
    char v385 = v111 >> 47;
    char v387 = BYTE6(v111);
    char v101 = v111 >> 49;
    char v102 = v111 >> 50;
    char v103 = v111 >> 51;
    char v104 = v111 >> 52;
    LOBYTE(v7) = v111 >> 53;
    unint64_t v105 = HIDWORD(v110);
    unint64_t v106 = HIDWORD(v111);
  }
  else
  {
    unint64_t v83 = (v6 >> 33) | (v8 << 31);
    unint64_t v84 = (v6 >> 34) | (v8 << 30);
    char v85 = v6 >> 35;
    char v86 = v6 >> 36;
    char v87 = v6 >> 37;
    char v396 = v6 >> 38;
    char v395 = v6 >> 39;
    char v394 = BYTE5(v6);
    char v383 = v6 >> 41;
    char v378 = v6 >> 42;
    char v379 = v6 >> 43;
    char v380 = v6 >> 44;
    char v381 = v6 >> 45;
    char v384 = v6 >> 46;
    char v386 = v6 >> 47;
    char v388 = BYTE6(v6);
    char v389 = v6 >> 49;
    char v390 = v6 >> 50;
    char v391 = v6 >> 51;
    char v392 = v6 >> 52;
    LOBYTE(v393) = v6 >> 53;
    uint64_t v88 = (has >> 33) | (v7 << 31);
    uint64_t v89 = (has >> 34) | (v7 << 30);
    uint64_t v90 = (has >> 35) | (v7 << 29);
    uint64_t v91 = (has >> 36) | (v7 << 28);
    char v92 = has >> 37;
    char v93 = has >> 38;
    char v94 = has >> 39;
    char v95 = BYTE5(has);
    char v96 = has >> 41;
    char v97 = has >> 42;
    char v98 = has >> 43;
    char v99 = has >> 44;
    char v100 = has >> 45;
    char v382 = has >> 46;
    char v385 = has >> 47;
    char v387 = BYTE6(has);
    char v101 = has >> 49;
    char v102 = has >> 50;
    char v103 = has >> 51;
    char v104 = has >> 52;
    LOBYTE(v7) = has >> 53;
    unint64_t v105 = HIDWORD(v6);
    unint64_t v106 = HIDWORD(has);
  }
  int v112 = v106 & 1;
  if (v112 != (v105 & 1)) {
    goto LABEL_378;
  }
  if (v112)
  {
    int isTriggerEvent = self->_isTriggerEvent;
    if (isTriggerEvent != objc_msgSend(v4, "isTriggerEvent", v91, v84, v90, v83, v89, v88)) {
      goto LABEL_378;
    }
    int v114 = *((unsigned __int16 *)&self->_has + 4);
    unint64_t v115 = *(void *)(v4 + 556);
    unint64_t v116 = (unint64_t)self->_has;
    LOBYTE(v83) = v115 >> 33;
    unint64_t v84 = (v115 >> 34) | (*((unsigned __int16 *)v4 + 282) << 30);
    char v85 = v115 >> 35;
    char v86 = v115 >> 36;
    char v87 = v115 >> 37;
    char v396 = v115 >> 38;
    char v395 = v115 >> 39;
    char v394 = BYTE5(v115);
    char v383 = v115 >> 41;
    char v378 = v115 >> 42;
    char v379 = v115 >> 43;
    char v380 = v115 >> 44;
    char v381 = v115 >> 45;
    char v384 = v115 >> 46;
    char v386 = v115 >> 47;
    char v388 = BYTE6(v115);
    char v389 = v115 >> 49;
    char v390 = v115 >> 50;
    char v391 = v115 >> 51;
    char v392 = v115 >> 52;
    LOBYTE(v393) = v115 >> 53;
    LOBYTE(v88) = v116 >> 33;
    LOBYTE(v89) = v116 >> 34;
    uint64_t v90 = (v116 >> 35) | (v114 << 29);
    uint64_t v91 = (v116 >> 36) | (v114 << 28);
    char v92 = v116 >> 37;
    char v93 = v116 >> 38;
    char v94 = v116 >> 39;
    char v95 = BYTE5(v116);
    char v96 = v116 >> 41;
    char v97 = v116 >> 42;
    char v98 = v116 >> 43;
    char v99 = v116 >> 44;
    char v100 = v116 >> 45;
    char v382 = v116 >> 46;
    char v385 = v116 >> 47;
    char v387 = BYTE6(v116);
    char v101 = v116 >> 49;
    char v102 = v116 >> 50;
    char v103 = v116 >> 51;
    char v104 = v116 >> 52;
    LOBYTE(v7) = v116 >> 53;
  }
  if ((v88 & 1) != (v83 & 1)) {
    goto LABEL_378;
  }
  if (v88)
  {
    unint64_t totalSampleCount = self->_totalSampleCount;
    if (totalSampleCount != objc_msgSend(v4, "totalSampleCount", v91, v84, v90)) {
      goto LABEL_378;
    }
    int v118 = *((unsigned __int16 *)&self->_has + 4);
    unint64_t v119 = *(void *)(v4 + 556);
    unint64_t v120 = (unint64_t)self->_has;
    unint64_t v84 = (v119 >> 34) | (*((unsigned __int16 *)v4 + 282) << 30);
    char v85 = v119 >> 35;
    char v86 = v119 >> 36;
    char v87 = v119 >> 37;
    char v396 = v119 >> 38;
    char v395 = v119 >> 39;
    char v394 = BYTE5(v119);
    char v383 = v119 >> 41;
    char v378 = v119 >> 42;
    char v379 = v119 >> 43;
    char v380 = v119 >> 44;
    char v381 = v119 >> 45;
    char v384 = v119 >> 46;
    char v386 = v119 >> 47;
    char v388 = BYTE6(v119);
    char v389 = v119 >> 49;
    char v390 = v119 >> 50;
    char v391 = v119 >> 51;
    char v392 = v119 >> 52;
    LOBYTE(v393) = v119 >> 53;
    LOBYTE(v89) = v120 >> 34;
    uint64_t v90 = (v120 >> 35) | (v118 << 29);
    uint64_t v91 = (v120 >> 36) | (v118 << 28);
    char v92 = v120 >> 37;
    char v93 = v120 >> 38;
    char v94 = v120 >> 39;
    char v95 = BYTE5(v120);
    char v96 = v120 >> 41;
    char v97 = v120 >> 42;
    char v98 = v120 >> 43;
    char v99 = v120 >> 44;
    char v100 = v120 >> 45;
    char v382 = v120 >> 46;
    char v385 = v120 >> 47;
    char v387 = BYTE6(v120);
    char v101 = v120 >> 49;
    char v102 = v120 >> 50;
    char v103 = v120 >> 51;
    char v104 = v120 >> 52;
    LOBYTE(v7) = v120 >> 53;
  }
  if ((v89 & 1) != (v84 & 1)) {
    goto LABEL_378;
  }
  if (v89)
  {
    float triggerScore = self->_triggerScore;
    objc_msgSend(v4, "triggerScore", v91);
    if (triggerScore != v122) {
      goto LABEL_378;
    }
    int v123 = *((unsigned __int16 *)&self->_has + 4);
    unint64_t v124 = *(void *)(v4 + 556);
    unint64_t v125 = (unint64_t)self->_has;
    char v85 = v124 >> 35;
    char v86 = v124 >> 36;
    char v87 = v124 >> 37;
    char v396 = v124 >> 38;
    char v395 = v124 >> 39;
    char v394 = BYTE5(v124);
    char v383 = v124 >> 41;
    char v378 = v124 >> 42;
    char v379 = v124 >> 43;
    char v380 = v124 >> 44;
    char v381 = v124 >> 45;
    char v384 = v124 >> 46;
    char v386 = v124 >> 47;
    char v388 = BYTE6(v124);
    char v389 = v124 >> 49;
    char v390 = v124 >> 50;
    char v391 = v124 >> 51;
    char v392 = v124 >> 52;
    LOBYTE(v393) = v124 >> 53;
    uint64_t v90 = (v125 >> 35) | (v123 << 29);
    uint64_t v91 = (v125 >> 36) | (v123 << 28);
    char v92 = v125 >> 37;
    char v93 = v125 >> 38;
    char v94 = v125 >> 39;
    char v95 = BYTE5(v125);
    char v96 = v125 >> 41;
    char v97 = v125 >> 42;
    char v98 = v125 >> 43;
    char v99 = v125 >> 44;
    char v100 = v125 >> 45;
    char v382 = v125 >> 46;
    char v385 = v125 >> 47;
    unint64_t v84 = HIWORD(v125);
    char v387 = BYTE6(v125);
    char v101 = v125 >> 49;
    char v102 = v125 >> 50;
    char v103 = v125 >> 51;
    char v104 = v125 >> 52;
    LOBYTE(v7) = v125 >> 53;
  }
  if ((v90 & 1) != (v85 & 1)) {
    goto LABEL_378;
  }
  if (v90)
  {
    int isMaximized = self->_isMaximized;
    if (isMaximized != objc_msgSend(v4, "isMaximized", v91, v84, v90)) {
      goto LABEL_378;
    }
    unint64_t v127 = *(void *)(v4 + 556);
    unint64_t v128 = (unint64_t)self->_has;
    char v86 = v127 >> 36;
    char v87 = v127 >> 37;
    char v396 = v127 >> 38;
    char v395 = v127 >> 39;
    char v394 = BYTE5(v127);
    char v383 = v127 >> 41;
    char v378 = v127 >> 42;
    char v379 = v127 >> 43;
    char v380 = v127 >> 44;
    char v381 = v127 >> 45;
    char v384 = v127 >> 46;
    char v386 = v127 >> 47;
    char v388 = BYTE6(v127);
    char v389 = v127 >> 49;
    char v390 = v127 >> 50;
    char v391 = v127 >> 51;
    char v392 = v127 >> 52;
    LOBYTE(v393) = v127 >> 53;
    LOWORD(v91) = v128 >> 36;
    char v92 = v128 >> 37;
    char v93 = v128 >> 38;
    char v94 = v128 >> 39;
    char v95 = BYTE5(v128);
    char v96 = v128 >> 41;
    char v97 = v128 >> 42;
    char v98 = v128 >> 43;
    char v99 = v128 >> 44;
    char v100 = v128 >> 45;
    char v382 = v128 >> 46;
    char v385 = v128 >> 47;
    char v387 = BYTE6(v128);
    char v101 = v128 >> 49;
    char v102 = v128 >> 50;
    char v103 = v128 >> 51;
    char v104 = v128 >> 52;
    LOBYTE(v7) = v128 >> 53;
  }
  if ((v91 & 1) != (v86 & 1)) {
    goto LABEL_378;
  }
  if (v91)
  {
    float effectiveThreshold = self->_effectiveThreshold;
    [v4 effectiveThreshold];
    if (effectiveThreshold != v130) {
      goto LABEL_378;
    }
    unint64_t v131 = *(void *)(v4 + 556);
    unint64_t v132 = (unint64_t)self->_has;
    char v87 = v131 >> 37;
    char v396 = v131 >> 38;
    char v395 = v131 >> 39;
    char v394 = BYTE5(v131);
    char v383 = v131 >> 41;
    char v378 = v131 >> 42;
    char v379 = v131 >> 43;
    char v380 = v131 >> 44;
    char v381 = v131 >> 45;
    char v384 = v131 >> 46;
    char v386 = v131 >> 47;
    char v388 = BYTE6(v131);
    char v389 = v131 >> 49;
    char v390 = v131 >> 50;
    char v391 = v131 >> 51;
    char v392 = v131 >> 52;
    LOBYTE(v393) = v131 >> 53;
    char v92 = v132 >> 37;
    char v93 = v132 >> 38;
    char v94 = v132 >> 39;
    char v95 = BYTE5(v132);
    char v96 = v132 >> 41;
    char v97 = v132 >> 42;
    char v98 = v132 >> 43;
    char v99 = v132 >> 44;
    char v100 = v132 >> 45;
    char v382 = v132 >> 46;
    char v385 = v132 >> 47;
    char v387 = BYTE6(v132);
    char v101 = v132 >> 49;
    char v102 = v132 >> 50;
    char v103 = v132 >> 51;
    char v104 = v132 >> 52;
    LOBYTE(v7) = v132 >> 53;
  }
  if ((v92 & 1) != (v87 & 1)) {
    goto LABEL_378;
  }
  if (v92)
  {
    float recognizerScore = self->_recognizerScore;
    [v4 recognizerScore];
    if (recognizerScore != v134) {
      goto LABEL_378;
    }
    unint64_t v135 = *(void *)(v4 + 556);
    unint64_t v7 = (unint64_t)self->_has;
    char v395 = v135 >> 39;
    char v396 = v135 >> 38;
    char v394 = BYTE5(v135);
    char v378 = v135 >> 42;
    char v379 = v135 >> 43;
    char v380 = v135 >> 44;
    char v381 = v135 >> 45;
    char v383 = v135 >> 41;
    char v384 = v135 >> 46;
    char v386 = v135 >> 47;
    char v388 = BYTE6(v135);
    char v389 = v135 >> 49;
    char v390 = v135 >> 50;
    char v391 = v135 >> 51;
    char v392 = v135 >> 52;
    LOBYTE(v393) = v135 >> 53;
    char v93 = v7 >> 38;
    char v94 = v7 >> 39;
    char v95 = BYTE5(v7);
    char v96 = v7 >> 41;
    char v97 = v7 >> 42;
    char v98 = v7 >> 43;
    char v99 = v7 >> 44;
    char v100 = v7 >> 45;
    char v382 = v7 >> 46;
    char v385 = v7 >> 47;
    char v387 = BYTE6(v7);
    char v101 = v7 >> 49;
    char v102 = v7 >> 50;
    char v103 = v7 >> 51;
    char v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v93 & 1) != (v396 & 1)) {
    goto LABEL_378;
  }
  if (v93)
  {
    float recognizerThresholdOffset = self->_recognizerThresholdOffset;
    [v4 recognizerThresholdOffset];
    if (recognizerThresholdOffset != v137) {
      goto LABEL_378;
    }
    unint64_t v138 = *(void *)(v4 + 556);
    unint64_t v7 = (unint64_t)self->_has;
    char v394 = BYTE5(v138);
    char v395 = v138 >> 39;
    char v378 = v138 >> 42;
    char v379 = v138 >> 43;
    char v380 = v138 >> 44;
    char v381 = v138 >> 45;
    char v383 = v138 >> 41;
    char v384 = v138 >> 46;
    char v386 = v138 >> 47;
    char v388 = BYTE6(v138);
    char v389 = v138 >> 49;
    char v390 = v138 >> 50;
    char v391 = v138 >> 51;
    char v392 = v138 >> 52;
    LOBYTE(v393) = v138 >> 53;
    char v94 = v7 >> 39;
    char v95 = BYTE5(v7);
    char v96 = v7 >> 41;
    char v97 = v7 >> 42;
    char v98 = v7 >> 43;
    char v99 = v7 >> 44;
    char v100 = v7 >> 45;
    char v382 = v7 >> 46;
    char v385 = v7 >> 47;
    char v387 = BYTE6(v7);
    char v101 = v7 >> 49;
    char v102 = v7 >> 50;
    char v103 = v7 >> 51;
    char v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v94 & 1) != (v395 & 1)) {
    goto LABEL_378;
  }
  if (v94)
  {
    unint64_t recognizerWaitTimeInNs = self->_recognizerWaitTimeInNs;
    if (recognizerWaitTimeInNs != [v4 recognizerWaitTimeInNs]) {
      goto LABEL_378;
    }
    unint64_t v140 = *(void *)(v4 + 556);
    unint64_t v7 = (unint64_t)self->_has;
    char v394 = BYTE5(v140);
    char v378 = v140 >> 42;
    char v379 = v140 >> 43;
    char v380 = v140 >> 44;
    char v381 = v140 >> 45;
    char v383 = v140 >> 41;
    char v384 = v140 >> 46;
    char v386 = v140 >> 47;
    char v388 = BYTE6(v140);
    char v389 = v140 >> 49;
    char v390 = v140 >> 50;
    char v391 = v140 >> 51;
    char v392 = v140 >> 52;
    LOBYTE(v393) = v140 >> 53;
    char v95 = BYTE5(v7);
    char v96 = v7 >> 41;
    char v97 = v7 >> 42;
    char v98 = v7 >> 43;
    char v99 = v7 >> 44;
    char v100 = v7 >> 45;
    char v382 = v7 >> 46;
    char v385 = v7 >> 47;
    char v387 = BYTE6(v7);
    char v101 = v7 >> 49;
    char v102 = v7 >> 50;
    char v103 = v7 >> 51;
    char v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v95 & 1) != (v394 & 1)) {
    goto LABEL_378;
  }
  if (v95)
  {
    float recognizerScaleFactor = self->_recognizerScaleFactor;
    [v4 recognizerScaleFactor];
    if (recognizerScaleFactor != v142) {
      goto LABEL_378;
    }
    unint64_t v143 = *(void *)(v4 + 556);
    unint64_t v7 = (unint64_t)self->_has;
    char v378 = v143 >> 42;
    char v379 = v143 >> 43;
    char v380 = v143 >> 44;
    char v381 = v143 >> 45;
    char v383 = v143 >> 41;
    char v384 = v143 >> 46;
    char v386 = v143 >> 47;
    char v388 = BYTE6(v143);
    char v389 = v143 >> 49;
    char v390 = v143 >> 50;
    char v391 = v143 >> 51;
    char v392 = v143 >> 52;
    LOBYTE(v393) = v143 >> 53;
    char v96 = v7 >> 41;
    char v97 = v7 >> 42;
    char v98 = v7 >> 43;
    char v99 = v7 >> 44;
    char v100 = v7 >> 45;
    char v382 = v7 >> 46;
    char v385 = v7 >> 47;
    char v387 = BYTE6(v7);
    char v101 = v7 >> 49;
    char v102 = v7 >> 50;
    char v103 = v7 >> 51;
    char v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v96 & 1) != (v383 & 1)) {
    goto LABEL_378;
  }
  if (v96)
  {
    float threshold = self->_threshold;
    [v4 threshold];
    if (threshold != v145) {
      goto LABEL_378;
    }
    unint64_t v146 = *(void *)(v4 + 556);
    unint64_t v7 = (unint64_t)self->_has;
    char v378 = v146 >> 42;
    char v379 = v146 >> 43;
    char v380 = v146 >> 44;
    char v381 = v146 >> 45;
    char v384 = v146 >> 46;
    char v386 = v146 >> 47;
    char v388 = BYTE6(v146);
    char v389 = v146 >> 49;
    char v390 = v146 >> 50;
    char v391 = v146 >> 51;
    char v392 = v146 >> 52;
    LOBYTE(v393) = v146 >> 53;
    char v97 = v7 >> 42;
    char v98 = v7 >> 43;
    char v99 = v7 >> 44;
    char v100 = v7 >> 45;
    char v382 = v7 >> 46;
    char v385 = v7 >> 47;
    char v387 = BYTE6(v7);
    char v101 = v7 >> 49;
    char v102 = v7 >> 50;
    char v103 = v7 >> 51;
    char v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  int v147 = v97 & 1;
  if (v147 != (v378 & 1)) {
    goto LABEL_378;
  }
  if (v147)
  {
    unint64_t triggerStartTimeOffsetInNs = self->_triggerStartTimeOffsetInNs;
    if (triggerStartTimeOffsetInNs != [v4 triggerStartTimeOffsetInNs]) {
      goto LABEL_378;
    }
    unint64_t v149 = *(void *)(v4 + 556);
    unint64_t v150 = (unint64_t)self->_has;
    char v379 = v149 >> 43;
    char v380 = v149 >> 44;
    char v381 = v149 >> 45;
    char v384 = v149 >> 46;
    char v386 = v149 >> 47;
    char v388 = BYTE6(v149);
    char v389 = v149 >> 49;
    char v390 = v149 >> 50;
    char v391 = v149 >> 51;
    char v392 = v149 >> 52;
    LOBYTE(v393) = v149 >> 53;
    char v98 = v150 >> 43;
    char v99 = v150 >> 44;
    char v100 = v150 >> 45;
    char v382 = v150 >> 46;
    char v385 = v150 >> 47;
    char v387 = BYTE6(v150);
    char v101 = v150 >> 49;
    char v102 = v150 >> 50;
    char v103 = v150 >> 51;
    char v104 = v150 >> 52;
    LOBYTE(v7) = v150 >> 53;
  }
  if ((v98 & 1) != (v379 & 1)) {
    goto LABEL_378;
  }
  if (v98)
  {
    unint64_t triggerEndTimeOffsetInNs = self->_triggerEndTimeOffsetInNs;
    if (triggerEndTimeOffsetInNs != [v4 triggerEndTimeOffsetInNs]) {
      goto LABEL_378;
    }
    unint64_t v152 = *(void *)(v4 + 556);
    unint64_t v153 = (unint64_t)self->_has;
    char v380 = v152 >> 44;
    char v381 = v152 >> 45;
    char v384 = v152 >> 46;
    char v386 = v152 >> 47;
    char v388 = BYTE6(v152);
    char v389 = v152 >> 49;
    char v390 = v152 >> 50;
    char v391 = v152 >> 51;
    char v392 = v152 >> 52;
    LOBYTE(v393) = v152 >> 53;
    char v99 = v153 >> 44;
    char v100 = v153 >> 45;
    char v382 = v153 >> 46;
    char v385 = v153 >> 47;
    char v387 = BYTE6(v153);
    char v101 = v153 >> 49;
    char v102 = v153 >> 50;
    char v103 = v153 >> 51;
    char v104 = v153 >> 52;
    LOBYTE(v7) = v153 >> 53;
  }
  if ((v99 & 1) != (v380 & 1)) {
    goto LABEL_378;
  }
  if (v99)
  {
    unint64_t triggerFireTimeOffsetInNs = self->_triggerFireTimeOffsetInNs;
    if (triggerFireTimeOffsetInNs != [v4 triggerFireTimeOffsetInNs]) {
      goto LABEL_378;
    }
    unint64_t v155 = *(void *)(v4 + 556);
    unint64_t v156 = (unint64_t)self->_has;
    char v381 = v155 >> 45;
    char v384 = v155 >> 46;
    char v386 = v155 >> 47;
    char v388 = BYTE6(v155);
    char v389 = v155 >> 49;
    char v390 = v155 >> 50;
    char v391 = v155 >> 51;
    char v392 = v155 >> 52;
    LOBYTE(v393) = v155 >> 53;
    char v100 = v156 >> 45;
    char v382 = v156 >> 46;
    char v385 = v156 >> 47;
    char v387 = BYTE6(v156);
    char v101 = v156 >> 49;
    char v102 = v156 >> 50;
    char v103 = v156 >> 51;
    char v104 = v156 >> 52;
    LOBYTE(v7) = v156 >> 53;
  }
  if ((v100 & 1) != (v381 & 1)) {
    goto LABEL_378;
  }
  if (v100)
  {
    double triggerStartTime = self->_triggerStartTime;
    [v4 triggerStartTime];
    if (triggerStartTime != v158) {
      goto LABEL_378;
    }
    unint64_t v159 = *(void *)(v4 + 556);
    unint64_t v160 = (unint64_t)self->_has;
    char v384 = v159 >> 46;
    char v386 = v159 >> 47;
    char v388 = BYTE6(v159);
    char v389 = v159 >> 49;
    char v390 = v159 >> 50;
    char v391 = v159 >> 51;
    char v392 = v159 >> 52;
    LOBYTE(v393) = v159 >> 53;
    char v382 = v160 >> 46;
    char v385 = v160 >> 47;
    char v387 = BYTE6(v160);
    char v101 = v160 >> 49;
    char v102 = v160 >> 50;
    char v103 = v160 >> 51;
    char v104 = v160 >> 52;
    LOBYTE(v7) = v160 >> 53;
  }
  if ((v382 & 1) != (v384 & 1)) {
    goto LABEL_378;
  }
  if (v382)
  {
    double triggerEndTime = self->_triggerEndTime;
    [v4 triggerEndTime];
    if (triggerEndTime != v162) {
      goto LABEL_378;
    }
    unint64_t v163 = *(void *)(v4 + 556);
    unint64_t v7 = (unint64_t)self->_has;
    char v386 = v163 >> 47;
    char v388 = BYTE6(v163);
    char v389 = v163 >> 49;
    char v390 = v163 >> 50;
    char v391 = v163 >> 51;
    char v392 = v163 >> 52;
    LOBYTE(v393) = v163 >> 53;
    char v385 = v7 >> 47;
    char v387 = BYTE6(v7);
    char v101 = v7 >> 49;
    char v102 = v7 >> 50;
    char v103 = v7 >> 51;
    char v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v385 & 1) != (v386 & 1)) {
    goto LABEL_378;
  }
  if (v385)
  {
    double triggerFiredTime = self->_triggerFiredTime;
    [v4 triggerFiredTime];
    if (triggerFiredTime != v165) {
      goto LABEL_378;
    }
    unint64_t v166 = *(void *)(v4 + 556);
    unint64_t v167 = (unint64_t)self->_has;
    char v388 = BYTE6(v166);
    char v389 = v166 >> 49;
    char v390 = v166 >> 50;
    char v391 = v166 >> 51;
    char v392 = v166 >> 52;
    LOBYTE(v393) = v166 >> 53;
    char v387 = BYTE6(v167);
    char v101 = v167 >> 49;
    char v102 = v167 >> 50;
    char v103 = v167 >> 51;
    char v104 = v167 >> 52;
    LOBYTE(v7) = v167 >> 53;
  }
  if ((v387 & 1) != (v388 & 1)) {
    goto LABEL_378;
  }
  if (v387)
  {
    unsigned int hardwareSamplerate = self->_hardwareSamplerate;
    if (hardwareSamplerate != [v4 hardwareSamplerate]) {
      goto LABEL_378;
    }
    unint64_t v169 = *(void *)(v4 + 556);
    unint64_t v170 = (unint64_t)self->_has;
    char v389 = v169 >> 49;
    char v390 = v169 >> 50;
    char v391 = v169 >> 51;
    char v392 = v169 >> 52;
    LOBYTE(v393) = v169 >> 53;
    char v101 = v170 >> 49;
    char v102 = v170 >> 50;
    char v103 = v170 >> 51;
    char v104 = v170 >> 52;
    LOBYTE(v7) = v170 >> 53;
  }
  if ((v101 & 1) != (v389 & 1)) {
    goto LABEL_378;
  }
  if (v101)
  {
    int isContinuous = self->_isContinuous;
    if (isContinuous != [v4 isContinuous]) {
      goto LABEL_378;
    }
    unint64_t v172 = *(void *)(v4 + 556);
    unint64_t v173 = (unint64_t)self->_has;
    char v390 = v172 >> 50;
    char v391 = v172 >> 51;
    char v392 = v172 >> 52;
    LOBYTE(v393) = v172 >> 53;
    char v102 = v173 >> 50;
    char v103 = v173 >> 51;
    char v104 = v173 >> 52;
    LOBYTE(v7) = v173 >> 53;
  }
  if ((v102 & 1) != (v390 & 1)) {
    goto LABEL_378;
  }
  if (v102)
  {
    float triggerDurationInNs = self->_triggerDurationInNs;
    [v4 triggerDurationInNs];
    if (triggerDurationInNs != v175) {
      goto LABEL_378;
    }
    unint64_t v176 = *(void *)(v4 + 556);
    unint64_t v177 = (unint64_t)self->_has;
    char v391 = v176 >> 51;
    char v392 = v176 >> 52;
    LOBYTE(v393) = v176 >> 53;
    char v103 = v177 >> 51;
    char v104 = v177 >> 52;
    LOBYTE(v7) = v177 >> 53;
  }
  if ((v103 & 1) != (v391 & 1)) {
    goto LABEL_378;
  }
  if (v103)
  {
    unint64_t totalSamplesAtTriggerStart = self->_totalSamplesAtTriggerStart;
    if (totalSamplesAtTriggerStart != [v4 totalSamplesAtTriggerStart]) {
      goto LABEL_378;
    }
    unint64_t v179 = *(void *)(v4 + 556);
    unint64_t v180 = (unint64_t)self->_has;
    char v392 = v179 >> 52;
    LOBYTE(v393) = v179 >> 53;
    char v104 = v180 >> 52;
    LOBYTE(v7) = v180 >> 53;
  }
  if ((v104 & 1) != (v392 & 1)) {
    goto LABEL_378;
  }
  if (v104)
  {
    unint64_t totalSamplesAtTriggerEnd = self->_totalSamplesAtTriggerEnd;
    if (totalSamplesAtTriggerEnd != [v4 totalSamplesAtTriggerEnd]) {
      goto LABEL_378;
    }
    __int16 v393 = (*(void *)(v4 + 556) >> 53) | (*((_WORD *)v4 + 282) << 11);
    LOWORD(v7) = (*(void *)&self->_has >> 53) | (*((_WORD *)&self->_has + 4) << 11);
  }
  if ((v7 & 1) != (v393 & 1)) {
    goto LABEL_378;
  }
  if (v7)
  {
    unint64_t totalSamplesAtEndOfCapture = self->_totalSamplesAtEndOfCapture;
    if (totalSamplesAtEndOfCapture != [v4 totalSamplesAtEndOfCapture]) {
      goto LABEL_378;
    }
  }
  unint64_t v183 = [(MHSchemaMHVoiceTriggerEventInfo *)self configVersion];
  unint64_t v184 = [v4 configVersion];
  if ((v183 == 0) == (v184 != 0)) {
    goto LABEL_360;
  }
  uint64_t v185 = [(MHSchemaMHVoiceTriggerEventInfo *)self configVersion];
  if (v185)
  {
    unint64_t v186 = (void *)v185;
    unint64_t v187 = [(MHSchemaMHVoiceTriggerEventInfo *)self configVersion];
    unint64_t v188 = [v4 configVersion];
    int v189 = [v187 isEqual:v188];

    if (!v189) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v183 = [(MHSchemaMHVoiceTriggerEventInfo *)self configPath];
  unint64_t v184 = [v4 configPath];
  if ((v183 == 0) == (v184 != 0)) {
    goto LABEL_360;
  }
  uint64_t v190 = [(MHSchemaMHVoiceTriggerEventInfo *)self configPath];
  if (v190)
  {
    unint64_t v191 = (void *)v190;
    unint64_t v192 = [(MHSchemaMHVoiceTriggerEventInfo *)self configPath];
    unint64_t v193 = [v4 configPath];
    int v194 = [v192 isEqual:v193];

    if (!v194) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v195 = (unint64_t)self->_has;
  uint64_t v196 = (v195 >> 54) & 1;
  unint64_t v197 = *(void *)(v4 + 556);
  if (v196 != ((v197 >> 54) & 1)) {
    goto LABEL_378;
  }
  if (v196)
  {
    int isSecondChance = self->_isSecondChance;
    if (isSecondChance != [v4 isSecondChance]) {
      goto LABEL_378;
    }
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v215 = *(void *)(v4 + 556);
    unint64_t v216 = (unint64_t)self->_has;
    char v199 = v215 >> 55;
    char v200 = HIBYTE(v215);
    char v201 = (v215 >> 57) | ((_BYTE)v197 << 7);
    char v202 = (v215 >> 58) | ((_BYTE)v197 << 6);
    char v203 = (v215 >> 59) | (32 * v197);
    char v204 = (v215 >> 60) | (16 * v197);
    char v205 = (v215 >> 61) | (8 * v197);
    LOBYTE(v197) = (v215 >> 62) | (4 * v197);
    char v206 = v216 >> 55;
    char v213 = HIBYTE(v216);
    unint64_t v208 = (v216 >> 57) | ((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) << 7);
    LOBYTE(v209) = (v216 >> 58) | (*((_WORD *)&self->_has + 4) << 6);
    char v210 = (v216 >> 59) | (32 * *((_WORD *)&self->_has + 4));
    char v211 = (v216 >> 60) | (16 * *((_WORD *)&self->_has + 4));
    char v212 = (v216 >> 61) | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v216 >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  else
  {
    __int16 v198 = *((_WORD *)v4 + 282);
    char v199 = v197 >> 55;
    char v200 = HIBYTE(*(void *)(v4 + 556));
    char v201 = (v197 >> 57) & 0x7F | ((_BYTE)v198 << 7);
    char v202 = (v197 >> 58) & 0x3F | ((_BYTE)v198 << 6);
    char v203 = (v197 >> 59) & 0x1F | (32 * v198);
    char v204 = (v197 >> 60) & 0xF | (16 * v198);
    char v205 = (v197 >> 61) & 7 | (8 * v198);
    LOBYTE(v197) = (v197 >> 62) & 3 | (4 * v198);
    char v206 = v195 >> 55;
    unint64_t v207 = HIBYTE(v195);
    unint64_t v208 = (v195 >> 57) & 0x7F | (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFFFFu) << 7);
    LOBYTE(v209) = (v195 >> 58) & 0x3F | (*((_WORD *)&self->_has + 4) << 6);
    char v210 = (v195 >> 59) & 0x1F | (32 * *((_WORD *)&self->_has + 4));
    char v211 = (v195 >> 60) & 0xF | (16 * *((_WORD *)&self->_has + 4));
    char v212 = (v195 >> 61) & 7 | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v195 >> 62) & 3 | (4 * *((_WORD *)&self->_has + 4));
    char v213 = v207;
  }
  int v217 = v206 & 1;
  if (v217 != (v199 & 1)) {
    goto LABEL_378;
  }
  if (v217)
  {
    int deviceHandheld = self->_deviceHandheld;
    if (deviceHandheld != objc_msgSend(v4, "deviceHandheld", v208)) {
      goto LABEL_378;
    }
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v219 = *(void *)(v4 + 556);
    unint64_t v220 = (unint64_t)self->_has;
    char v200 = HIBYTE(v219);
    char v201 = (v219 >> 57) | ((_BYTE)v197 << 7);
    char v202 = (v219 >> 58) | ((_BYTE)v197 << 6);
    char v203 = (v219 >> 59) | (32 * v197);
    char v204 = (v219 >> 60) | (16 * v197);
    char v205 = (v219 >> 61) | (8 * v197);
    LOBYTE(v197) = (v219 >> 62) | (4 * v197);
    char v213 = HIBYTE(v220);
    unint64_t v208 = (v220 >> 57) | ((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) << 7);
    LOBYTE(v209) = (v220 >> 58) | (*((_WORD *)&self->_has + 4) << 6);
    char v210 = (v220 >> 59) | (32 * *((_WORD *)&self->_has + 4));
    char v211 = (v220 >> 60) | (16 * *((_WORD *)&self->_has + 4));
    char v212 = (v220 >> 61) | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v220 >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  if ((v213 & 1) != (v200 & 1)) {
    goto LABEL_378;
  }
  if (v213)
  {
    unsigned int activeChannel = self->_activeChannel;
    if (activeChannel != objc_msgSend(v4, "activeChannel", v208)) {
      goto LABEL_378;
    }
    LOWORD(v195) = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v222 = *(void *)(v4 + 556);
    unint64_t v223 = (unint64_t)self->_has;
    char v201 = (v222 >> 57) | ((_BYTE)v197 << 7);
    char v202 = (v222 >> 58) | ((_BYTE)v197 << 6);
    char v203 = (v222 >> 59) | (32 * v197);
    char v204 = (v222 >> 60) | (16 * v197);
    char v205 = (v222 >> 61) | (8 * v197);
    LOBYTE(v197) = (v222 >> 62) | (4 * v197);
    LOBYTE(v208) = (v223 >> 57) | ((_BYTE)v195 << 7);
    LOBYTE(v209) = (v223 >> 58) | ((_BYTE)v195 << 6);
    char v210 = (v223 >> 59) | (32 * v195);
    char v211 = (v223 >> 60) | (16 * v195);
    char v212 = (v223 >> 61) | (8 * v195);
    LOBYTE(v195) = (v223 >> 62) | (4 * v195);
  }
  if ((v208 & 1) != (v201 & 1)) {
    goto LABEL_378;
  }
  if (v208)
  {
    unint64_t twoShotAudibleFeedbackDelayInNs = self->_twoShotAudibleFeedbackDelayInNs;
    if (twoShotAudibleFeedbackDelayInNs != [v4 twoShotAudibleFeedbackDelayInNs]) {
      goto LABEL_378;
    }
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v225 = *(void *)(v4 + 556);
    unint64_t v195 = (unint64_t)self->_has;
    char v202 = (v225 >> 58) | ((_BYTE)v197 << 6);
    char v203 = (v225 >> 59) | (32 * v197);
    char v204 = (v225 >> 60) | (16 * v197);
    char v205 = (v225 >> 61) | (8 * v197);
    LOBYTE(v197) = (v225 >> 62) | (4 * v197);
    __int16 v209 = (v195 >> 58) | (*((_WORD *)&self->_has + 4) << 6);
    char v210 = (v195 >> 59) | (32 * *((_WORD *)&self->_has + 4));
    char v211 = (v195 >> 60) | (16 * *((_WORD *)&self->_has + 4));
    char v212 = (v195 >> 61) | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v195 >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  if ((v209 & 1) != (v202 & 1)) {
    goto LABEL_378;
  }
  if (v209)
  {
    float cumulativeUptimeInSec = self->_cumulativeUptimeInSec;
    [v4 cumulativeUptimeInSec];
    if (cumulativeUptimeInSec != v227) {
      goto LABEL_378;
    }
    __int16 v228 = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v229 = *(void *)(v4 + 556);
    unint64_t v195 = (unint64_t)self->_has;
    char v203 = (v229 >> 59) | (32 * v197);
    char v204 = (v229 >> 60) | (16 * v197);
    char v205 = (v229 >> 61) | (8 * v197);
    LOBYTE(v197) = (v229 >> 62) | (4 * v197);
    char v210 = (v195 >> 59) | (32 * v228);
    char v211 = (v195 >> 60) | (16 * v228);
    char v212 = (v195 >> 61) | (8 * v228);
    LOBYTE(v195) = (v195 >> 62) | (4 * v228);
  }
  if ((v210 & 1) != (v203 & 1)) {
    goto LABEL_378;
  }
  if (v210)
  {
    float cumulativeDowntimeInSec = self->_cumulativeDowntimeInSec;
    [v4 cumulativeDowntimeInSec];
    if (cumulativeDowntimeInSec != v231) {
      goto LABEL_378;
    }
    __int16 v232 = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v233 = *(void *)(v4 + 556);
    unint64_t v234 = (unint64_t)self->_has;
    char v204 = (v233 >> 60) | (16 * v197);
    char v205 = (v233 >> 61) | (8 * v197);
    LOBYTE(v197) = (v233 >> 62) | (4 * v197);
    char v211 = (v234 >> 60) | (16 * v232);
    char v212 = (v234 >> 61) | (8 * v232);
    LOBYTE(v195) = (v234 >> 62) | (4 * v232);
  }
  if ((v211 & 1) != (v204 & 1)) {
    goto LABEL_378;
  }
  if (v211)
  {
    int hostPowerStateAtTrigger = self->_hostPowerStateAtTrigger;
    if (hostPowerStateAtTrigger != [v4 hostPowerStateAtTrigger]) {
      goto LABEL_378;
    }
    __int16 v236 = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    unint64_t v237 = *(void *)(v4 + 556);
    unint64_t v238 = (unint64_t)self->_has;
    char v205 = (v237 >> 61) | (8 * v197);
    LOBYTE(v197) = (v237 >> 62) | (4 * v197);
    char v212 = (v238 >> 61) | (8 * v236);
    LOBYTE(v195) = (v238 >> 62) | (4 * v236);
  }
  if ((v212 & 1) != (v205 & 1)) {
    goto LABEL_378;
  }
  if (v212)
  {
    int isMediaPlaying = self->_isMediaPlaying;
    if (isMediaPlaying != [v4 isMediaPlaying]) {
      goto LABEL_378;
    }
    LOWORD(v197) = (*(void *)(v4 + 556) >> 62) | (4 * *((_WORD *)v4 + 282));
    LOWORD(v195) = (*(void *)&self->_has >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  if ((v195 & 1) != (v197 & 1)) {
    goto LABEL_378;
  }
  if (v195)
  {
    float mediaVolume = self->_mediaVolume;
    [v4 mediaVolume];
    if (mediaVolume != v241) {
      goto LABEL_378;
    }
  }
  unint64_t v183 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];
  unint64_t v184 = [v4 audioProviderUUID];
  if ((v183 == 0) == (v184 != 0)) {
    goto LABEL_360;
  }
  uint64_t v242 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];
  if (v242)
  {
    unint64_t v243 = (void *)v242;
    unint64_t v244 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];
    unint64_t v245 = [v4 audioProviderUUID];
    int v246 = [v244 isEqual:v245];

    if (!v246) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  if (*(void *)&self->_has >> 63 != *(void *)(v4 + 556) >> 63) {
    goto LABEL_378;
  }
  if (*(void *)&self->_has < 0)
  {
    int onBatteryPower = self->_onBatteryPower;
    if (onBatteryPower != [v4 onBatteryPower]) {
      goto LABEL_378;
    }
    unint64_t v253 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t v249 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    unint64_t v250 = v249 >> 1;
    unint64_t v251 = v249 >> 2;
    unint64_t v252 = v249 >> 3;
    unint64_t v254 = v253 >> 1;
    unint64_t v255 = v253 >> 2;
    unint64_t v256 = v253 >> 3;
  }
  else
  {
    unint64_t v247 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t v248 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    LOBYTE(v249) = *((_WORD *)v4 + 282);
    unint64_t v250 = (v248 >> 1) & 0x7FFFFF;
    unint64_t v251 = (v248 >> 2) & 0x3FFFFF;
    unint64_t v252 = (v248 >> 3) & 0x1FFFFF;
    LOBYTE(v253) = *((_WORD *)&self->_has + 4);
    unint64_t v254 = (v247 >> 1) & 0x7FFFFF;
    unint64_t v255 = (v247 >> 2) & 0x3FFFFF;
    unint64_t v256 = (v247 >> 3) & 0x1FFFFF;
  }
  int v258 = v253 & 1;
  if (v258 != (v249 & 1)) {
    goto LABEL_378;
  }
  if (v258)
  {
    int didWakeAP = self->_didWakeAP;
    if (didWakeAP != [v4 didWakeAP]) {
      goto LABEL_378;
    }
    unint64_t v251 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t v260 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    unint64_t v250 = v260 >> 1;
    unint64_t v256 = v260 >> 2;
    unint64_t v252 = v260 >> 3;
    unint64_t v254 = v251 >> 1;
    unint64_t v255 = v251 >> 2;
    unint64_t v261 = v251 >> 3;
    LOBYTE(v251) = v256;
    LOBYTE(v256) = v261;
  }
  int v262 = v254 & 1;
  if (v262 != (v250 & 1)) {
    goto LABEL_378;
  }
  if (v262)
  {
    float uptimeInSec = self->_uptimeInSec;
    [v4 uptimeInSec];
    if (uptimeInSec != v264) {
      goto LABEL_378;
    }
    unint64_t v251 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t v265 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    unint64_t v256 = v265 >> 2;
    unint64_t v252 = v265 >> 3;
    unint64_t v255 = v251 >> 2;
    unint64_t v266 = v251 >> 3;
    LOBYTE(v251) = v256;
    LOBYTE(v256) = v266;
  }
  if ((v255 & 1) != (v251 & 1)) {
    goto LABEL_378;
  }
  if (v255)
  {
    float downtimeInSec = self->_downtimeInSec;
    [v4 downtimeInSec];
    if (downtimeInSec != v268) {
      goto LABEL_378;
    }
    unint64_t v252 = (*((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16)) >> 3;
    unint64_t v256 = (*((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16)) >> 3;
  }
  if ((v256 & 1) != (v252 & 1)) {
    goto LABEL_378;
  }
  if (v256)
  {
    unsigned int lastConsecutiveVTRejects = self->_lastConsecutiveVTRejects;
    if (lastConsecutiveVTRejects != [v4 lastConsecutiveVTRejects]) {
      goto LABEL_378;
    }
  }
  unint64_t v183 = [(MHSchemaMHVoiceTriggerEventInfo *)self captureFilePath];
  unint64_t v184 = [v4 captureFilePath];
  if ((v183 == 0) == (v184 != 0)) {
    goto LABEL_360;
  }
  uint64_t v270 = [(MHSchemaMHVoiceTriggerEventInfo *)self captureFilePath];
  if (v270)
  {
    unint64_t v271 = (void *)v270;
    unint64_t v272 = [(MHSchemaMHVoiceTriggerEventInfo *)self captureFilePath];
    v273 = [v4 captureFilePath];
    int v274 = [v272 isEqual:v273];

    if (!v274) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v183 = [(MHSchemaMHVoiceTriggerEventInfo *)self configDataHash];
  unint64_t v184 = [v4 configDataHash];
  if ((v183 == 0) == (v184 != 0)) {
    goto LABEL_360;
  }
  uint64_t v275 = [(MHSchemaMHVoiceTriggerEventInfo *)self configDataHash];
  if (v275)
  {
    v276 = (void *)v275;
    v277 = [(MHSchemaMHVoiceTriggerEventInfo *)self configDataHash];
    v278 = [v4 configDataHash];
    int v279 = [v277 isEqual:v278];

    if (!v279) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  uint64_t v280 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v281 = (v280 >> 4) & 1;
  uint64_t v282 = *((unsigned __int16 *)v4 + 282);
  if (v281 != ((v282 >> 4) & 1)) {
    goto LABEL_378;
  }
  if (v281)
  {
    int siriIsActiveOrOtherAssertion = self->_siriIsActiveOrOtherAssertion;
    if (siriIsActiveOrOtherAssertion != [v4 siriIsActiveOrOtherAssertion]) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v312 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v296 = v4[566];
    unint64_t v313 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    unint64_t v285 = v313 >> 5;
    unint64_t v286 = v313 >> 6;
    unint64_t v287 = v313 >> 7;
    unint64_t v288 = v313 >> 8;
    unint64_t v289 = v313 >> 9;
    unint64_t v290 = v313 >> 10;
    unint64_t v291 = v313 >> 11;
    unint64_t v292 = v313 >> 12;
    unint64_t v293 = v313 >> 13;
    unint64_t v294 = v313 >> 14;
    unint64_t v295 = v313 >> 15;
    unint64_t v297 = v296 >> 1;
    unint64_t v298 = v312 >> 5;
    unint64_t v299 = v312 >> 6;
    unint64_t v300 = v312 >> 7;
    unint64_t v301 = v312 >> 8;
    unint64_t v302 = v312 >> 9;
    unint64_t v303 = v312 >> 10;
    unint64_t v304 = v312 >> 11;
    unint64_t v305 = v312 >> 12;
    unint64_t v306 = v312 >> 13;
    unint64_t v307 = v312 >> 14;
    unint64_t v308 = v312 >> 15;
    unint64_t v310 = v309 >> 1;
  }
  else
  {
    unint64_t v283 = v280 | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    unint64_t v284 = v282 | ((unint64_t)v4[566] << 16);
    unint64_t v285 = v284 >> 5;
    unint64_t v286 = v284 >> 6;
    unint64_t v287 = v284 >> 7;
    unint64_t v288 = v284 >> 8;
    unint64_t v289 = v284 >> 9;
    unint64_t v290 = v284 >> 10;
    unint64_t v291 = v284 >> 11;
    unint64_t v292 = v284 >> 12;
    unint64_t v293 = v284 >> 13;
    unint64_t v294 = v284 >> 14;
    unint64_t v295 = v284 >> 15;
    unint64_t v296 = v284 >> 16;
    unint64_t v297 = v284 >> 17;
    unint64_t v298 = v283 >> 5;
    unint64_t v299 = v283 >> 6;
    unint64_t v300 = v283 >> 7;
    unint64_t v301 = v283 >> 8;
    unint64_t v302 = v283 >> 9;
    unint64_t v303 = v283 >> 10;
    unint64_t v304 = v283 >> 11;
    unint64_t v305 = v283 >> 12;
    unint64_t v306 = v283 >> 13;
    unint64_t v307 = v283 >> 14;
    unint64_t v308 = v283 >> 15;
    unint64_t v309 = v283 >> 16;
    unint64_t v310 = v283 >> 17;
  }
  int v314 = v298 & 1;
  if (v314 != (v285 & 1)) {
    goto LABEL_378;
  }
  if (v314)
  {
    int didAudioStall = self->_didAudioStall;
    if (didAudioStall != objc_msgSend(v4, "didAudioStall", v306, v305, v289, v304, v303, v288)) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v316 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v296 = v4[566];
    unint64_t v317 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    unint64_t v286 = v317 >> 6;
    unint64_t v287 = v317 >> 7;
    unint64_t v288 = v317 >> 8;
    unint64_t v289 = v317 >> 9;
    unint64_t v290 = v317 >> 10;
    unint64_t v291 = v317 >> 11;
    unint64_t v292 = v317 >> 12;
    unint64_t v293 = v317 >> 13;
    unint64_t v294 = v317 >> 14;
    unint64_t v295 = v317 >> 15;
    unint64_t v297 = v296 >> 1;
    unint64_t v299 = v316 >> 6;
    unint64_t v300 = v316 >> 7;
    unint64_t v301 = v316 >> 8;
    unint64_t v302 = v316 >> 9;
    unint64_t v303 = v316 >> 10;
    unint64_t v304 = v316 >> 11;
    unint64_t v305 = v316 >> 12;
    unint64_t v306 = v316 >> 13;
    unint64_t v307 = v316 >> 14;
    unint64_t v308 = v316 >> 15;
    unint64_t v310 = v309 >> 1;
  }
  int v318 = v299 & 1;
  if (v318 != (v286 & 1)) {
    goto LABEL_378;
  }
  if (v318)
  {
    int isBargeIn = self->_isBargeIn;
    if (isBargeIn != objc_msgSend(v4, "isBargeIn", v306, v305, v289, v304, v303, v288)) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v320 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v296 = v4[566];
    unint64_t v321 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    unint64_t v287 = v321 >> 7;
    unint64_t v288 = v321 >> 8;
    unint64_t v289 = v321 >> 9;
    unint64_t v290 = v321 >> 10;
    unint64_t v291 = v321 >> 11;
    unint64_t v292 = v321 >> 12;
    unint64_t v293 = v321 >> 13;
    unint64_t v294 = v321 >> 14;
    unint64_t v295 = v321 >> 15;
    unint64_t v297 = v296 >> 1;
    unint64_t v300 = v320 >> 7;
    unint64_t v301 = v320 >> 8;
    unint64_t v302 = v320 >> 9;
    unint64_t v303 = v320 >> 10;
    unint64_t v304 = v320 >> 11;
    unint64_t v305 = v320 >> 12;
    unint64_t v306 = v320 >> 13;
    unint64_t v307 = v320 >> 14;
    unint64_t v308 = v320 >> 15;
    unint64_t v310 = v309 >> 1;
  }
  int v322 = v300 & 1;
  if (v322 != (v287 & 1)) {
    goto LABEL_378;
  }
  if (v322)
  {
    int isWakeFromSleep = self->_isWakeFromSleep;
    if (isWakeFromSleep != objc_msgSend(v4, "isWakeFromSleep", v306, v305, v289, v304, v303, v288)) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v324 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v296 = v4[566];
    unint64_t v325 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    unint64_t v288 = v325 >> 8;
    unint64_t v289 = v325 >> 9;
    unint64_t v290 = v325 >> 10;
    unint64_t v291 = v325 >> 11;
    unint64_t v292 = v325 >> 12;
    unint64_t v293 = v325 >> 13;
    unint64_t v294 = v325 >> 14;
    unint64_t v295 = v325 >> 15;
    unint64_t v297 = v296 >> 1;
    unint64_t v301 = v324 >> 8;
    unint64_t v302 = v324 >> 9;
    unint64_t v303 = v324 >> 10;
    unint64_t v304 = v324 >> 11;
    unint64_t v305 = v324 >> 12;
    unint64_t v306 = v324 >> 13;
    unint64_t v307 = v324 >> 14;
    unint64_t v308 = v324 >> 15;
    unint64_t v310 = v309 >> 1;
  }
  if ((v301 & 1) != (v288 & 1)) {
    goto LABEL_378;
  }
  if (v301)
  {
    unint64_t secondPassAssetQueryStartTimeInNs = self->_secondPassAssetQueryStartTimeInNs;
    if (secondPassAssetQueryStartTimeInNs != objc_msgSend(v4, "secondPassAssetQueryStartTimeInNs", v306, v305, v289, v304, v303))goto LABEL_378; {
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    }
    unint64_t v327 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v296 = v4[566];
    unint64_t v328 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    unint64_t v289 = v328 >> 9;
    unint64_t v290 = v328 >> 10;
    unint64_t v291 = v328 >> 11;
    unint64_t v292 = v328 >> 12;
    unint64_t v293 = v328 >> 13;
    unint64_t v294 = v328 >> 14;
    unint64_t v295 = v328 >> 15;
    unint64_t v297 = v296 >> 1;
    unint64_t v302 = v327 >> 9;
    unint64_t v303 = v327 >> 10;
    unint64_t v304 = v327 >> 11;
    unint64_t v305 = v327 >> 12;
    unint64_t v306 = v327 >> 13;
    unint64_t v307 = v327 >> 14;
    unint64_t v308 = v327 >> 15;
    unint64_t v310 = v309 >> 1;
  }
  if ((v302 & 1) != (v289 & 1)) {
    goto LABEL_378;
  }
  if (v302)
  {
    unint64_t secondPassAssetQueryCompleteTimeInNs = self->_secondPassAssetQueryCompleteTimeInNs;
    if (secondPassAssetQueryCompleteTimeInNs != objc_msgSend(v4, "secondPassAssetQueryCompleteTimeInNs", v306, v305)) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v330 = v4[566];
    unint64_t v331 = *((unsigned __int16 *)v4 + 282) | (v330 << 16);
    unint64_t v290 = v331 >> 10;
    unint64_t v291 = v331 >> 11;
    unint64_t v292 = v331 >> 12;
    unint64_t v293 = v331 >> 13;
    unint64_t v294 = v331 >> 14;
    unint64_t v295 = v331 >> 15;
    unint64_t v297 = v330 >> 1;
    unint64_t v303 = v296 >> 10;
    unint64_t v304 = v296 >> 11;
    unint64_t v305 = v296 >> 12;
    unint64_t v306 = v296 >> 13;
    unint64_t v307 = v296 >> 14;
    unint64_t v308 = v296 >> 15;
    LOBYTE(v296) = v4[566];
    unint64_t v310 = v309 >> 1;
  }
  uint64_t v332 = v303 & 1;
  if (v332 != (v290 & 1)) {
    goto LABEL_378;
  }
  if (v303)
  {
    unint64_t secondPassAssetLoadStartTimeInNs = self->_secondPassAssetLoadStartTimeInNs;
    if (secondPassAssetLoadStartTimeInNs != objc_msgSend(v4, "secondPassAssetLoadStartTimeInNs", v306, v305, v332, v304))goto LABEL_378; {
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    }
    unint64_t v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v334 = v4[566];
    unint64_t v335 = *((unsigned __int16 *)v4 + 282) | (v334 << 16);
    unint64_t v291 = v335 >> 11;
    unint64_t v292 = v335 >> 12;
    unint64_t v293 = v335 >> 13;
    unint64_t v294 = v335 >> 14;
    unint64_t v295 = v335 >> 15;
    unint64_t v297 = v334 >> 1;
    unint64_t v304 = v296 >> 11;
    unint64_t v305 = v296 >> 12;
    unint64_t v306 = v296 >> 13;
    unint64_t v307 = v296 >> 14;
    unint64_t v308 = v296 >> 15;
    LOBYTE(v296) = v4[566];
    unint64_t v310 = v309 >> 1;
  }
  if ((v304 & 1) != (v291 & 1)) {
    goto LABEL_378;
  }
  if (v304)
  {
    unint64_t secondPassAssetLoadCompleteTimeInNs = self->_secondPassAssetLoadCompleteTimeInNs;
    if (secondPassAssetLoadCompleteTimeInNs != objc_msgSend(v4, "secondPassAssetLoadCompleteTimeInNs", v306, v305)) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v337 = v4[566];
    unint64_t v338 = *((unsigned __int16 *)v4 + 282) | (v337 << 16);
    unint64_t v292 = v338 >> 12;
    unint64_t v293 = v338 >> 13;
    unint64_t v294 = v338 >> 14;
    unint64_t v295 = v338 >> 15;
    unint64_t v297 = v337 >> 1;
    unint64_t v305 = v296 >> 12;
    unint64_t v306 = v296 >> 13;
    unint64_t v307 = v296 >> 14;
    unint64_t v308 = v296 >> 15;
    unint64_t v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v305 & 1) != (v292 & 1)) {
    goto LABEL_378;
  }
  if (v305)
  {
    unint64_t secondPassAudioStreamStartTimeInNs = self->_secondPassAudioStreamStartTimeInNs;
    if (secondPassAudioStreamStartTimeInNs != objc_msgSend(v4, "secondPassAudioStreamStartTimeInNs", v306)) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v340 = v4[566];
    unint64_t v341 = *((unsigned __int16 *)v4 + 282) | (v340 << 16);
    unint64_t v293 = v341 >> 13;
    unint64_t v294 = v341 >> 14;
    unint64_t v295 = v341 >> 15;
    unint64_t v297 = v340 >> 1;
    unint64_t v306 = v296 >> 13;
    unint64_t v307 = v296 >> 14;
    unint64_t v308 = v296 >> 15;
    unint64_t v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v306 & 1) != (v293 & 1)) {
    goto LABEL_378;
  }
  if (v306)
  {
    unint64_t secondPassAudioStreamReadyTimeInNs = self->_secondPassAudioStreamReadyTimeInNs;
    if (secondPassAudioStreamReadyTimeInNs != [v4 secondPassAudioStreamReadyTimeInNs]) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    unint64_t v343 = v4[566];
    unint64_t v344 = *((unsigned __int16 *)v4 + 282) | (v343 << 16);
    unint64_t v294 = v344 >> 14;
    unint64_t v295 = v344 >> 15;
    unint64_t v297 = v343 >> 1;
    unint64_t v307 = v296 >> 14;
    unint64_t v308 = v296 >> 15;
    unint64_t v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v307 & 1) != (v294 & 1)) {
    goto LABEL_378;
  }
  if (v307)
  {
    unint64_t secondPassFirstAudioPacketReceptionTimeInNs = self->_secondPassFirstAudioPacketReceptionTimeInNs;
    if (secondPassFirstAudioPacketReceptionTimeInNs != [v4 secondPassFirstAudioPacketReceptionTimeInNs]) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v346 = v4[566];
    unint64_t v295 = (*((unsigned __int16 *)v4 + 282) | (v346 << 16)) >> 15;
    unint64_t v297 = v346 >> 1;
    unint64_t v308 = (*((unsigned __int16 *)&self->_has + 4) | (v309 << 16)) >> 15;
    unint64_t v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v308 & 1) != (v295 & 1)) {
    goto LABEL_378;
  }
  if (v308)
  {
    unint64_t secondPassLastAudioPacketReceptionTimeInNs = self->_secondPassLastAudioPacketReceptionTimeInNs;
    if (secondPassLastAudioPacketReceptionTimeInNs != [v4 secondPassLastAudioPacketReceptionTimeInNs]) {
      goto LABEL_378;
    }
    unint64_t v309 = *((unsigned __int8 *)&self->_has + 10);
    unint64_t v296 = v4[566];
    unint64_t v297 = v296 >> 1;
    unint64_t v310 = v309 >> 1;
  }
  if ((v309 & 1) != (v296 & 1)) {
    goto LABEL_378;
  }
  if (v309)
  {
    unint64_t secondPassCheckerModelKeywordDetectionStartTimeInNs = self->_secondPassCheckerModelKeywordDetectionStartTimeInNs;
    if (secondPassCheckerModelKeywordDetectionStartTimeInNs != [v4 secondPassCheckerModelKeywordDetectionStartTimeInNs])goto LABEL_378; {
    unint64_t v297 = (unint64_t)v4[566] >> 1;
    }
    unint64_t v310 = (unint64_t)*((unsigned __int8 *)&self->_has + 10) >> 1;
  }
  if ((v310 & 1) != (v297 & 1)) {
    goto LABEL_378;
  }
  if (v310)
  {
    unint64_t secondPassCheckerModelKeywordDetectionEndTimeInNs = self->_secondPassCheckerModelKeywordDetectionEndTimeInNs;
    if (secondPassCheckerModelKeywordDetectionEndTimeInNs != [v4 secondPassCheckerModelKeywordDetectionEndTimeInNs])goto LABEL_378; {
  }
    }
  unint64_t v183 = [(MHSchemaMHVoiceTriggerEventInfo *)self triggerPhrase];
  unint64_t v184 = [v4 triggerPhrase];
  if ((v183 == 0) == (v184 != 0))
  {
LABEL_360:

    goto LABEL_378;
  }
  uint64_t v350 = [(MHSchemaMHVoiceTriggerEventInfo *)self triggerPhrase];
  if (v350)
  {
    v351 = (void *)v350;
    v352 = [(MHSchemaMHVoiceTriggerEventInfo *)self triggerPhrase];
    v353 = [v4 triggerPhrase];
    int v354 = [v352 isEqual:v353];

    if (!v354) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  int v355 = (*((unsigned __int8 *)&self->_has + 10) >> 2) & 1;
  if (v355 == ((v4[566] >> 2) & 1))
  {
    if (v355)
    {
      double lastDisplayWakeTimeOffsetInNs = self->_lastDisplayWakeTimeOffsetInNs;
      [v4 lastDisplayWakeTimeOffsetInNs];
      if (lastDisplayWakeTimeOffsetInNs != v365) {
        goto LABEL_378;
      }
      unint64_t v366 = v4[566];
      unint64_t v358 = v366 >> 3;
      unint64_t v363 = v366 >> 4;
      unint64_t v360 = v366 >> 5;
      unint64_t v359 = *((unsigned __int8 *)&self->_has + 10);
      unint64_t v361 = v359 >> 3;
      unint64_t v362 = v359 >> 4;
      unint64_t v367 = v359 >> 5;
      LOBYTE(v359) = v363;
      LOBYTE(v363) = v367;
    }
    else
    {
      unint64_t v356 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
      unint64_t v357 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
      unint64_t v358 = v357 >> 19;
      unint64_t v359 = v357 >> 20;
      unint64_t v360 = v357 >> 21;
      unint64_t v361 = v356 >> 19;
      unint64_t v362 = v356 >> 20;
      unint64_t v363 = v356 >> 21;
    }
    int v368 = v361 & 1;
    if (v368 == (v358 & 1))
    {
      if (v368)
      {
        int isHSJSTriggerFromAlwaysOnMicBuffer = self->_isHSJSTriggerFromAlwaysOnMicBuffer;
        if (isHSJSTriggerFromAlwaysOnMicBuffer != [v4 isHSJSTriggerFromAlwaysOnMicBuffer]) {
          goto LABEL_378;
        }
        unint64_t v359 = *((unsigned __int8 *)&self->_has + 10);
        unint64_t v370 = v4[566];
        unint64_t v363 = v370 >> 4;
        unint64_t v360 = v370 >> 5;
        unint64_t v362 = v359 >> 4;
        unint64_t v371 = v359 >> 5;
        LOBYTE(v359) = v363;
        LOBYTE(v363) = v371;
      }
      int v372 = v362 & 1;
      if (v372 == (v359 & 1))
      {
        if (v372)
        {
          unint64_t displayWakeTimeOffsetInNs = self->_displayWakeTimeOffsetInNs;
          if (displayWakeTimeOffsetInNs != [v4 displayWakeTimeOffsetInNs]) {
            goto LABEL_378;
          }
          unint64_t v363 = (unint64_t)*((unsigned __int8 *)&self->_has + 10) >> 5;
          unint64_t v360 = (unint64_t)v4[566] >> 5;
        }
        if ((v363 & 1) == (v360 & 1))
        {
          if ((v363 & 1) == 0
            || (float neptuneDetectionApiScore = self->_neptuneDetectionApiScore,
                [v4 neptuneDetectionApiScore],
                neptuneDetectionApiScore == v375))
          {
            BOOL v376 = 1;
            goto LABEL_379;
          }
        }
      }
    }
  }
LABEL_378:
  BOOL v376 = 0;
LABEL_379:

  return v376;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    uint64_t has = *(void *)p_has;
    if ((*(void *)p_has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_110;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_16:
    if ((has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_17:
    if ((has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_18:
    if ((has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_19:
    if ((has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_20:
    if ((has & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_21:
    if ((has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_22:
    if ((has & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_23:
    if ((has & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_24:
    if ((has & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000) == 0)
  {
LABEL_25:
    if ((has & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000) == 0)
  {
LABEL_27:
    if ((has & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000) == 0)
  {
LABEL_28:
    if ((has & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000) == 0)
  {
LABEL_29:
    if ((has & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000000) == 0)
  {
LABEL_30:
    if ((has & 0x20000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_31:
    if ((has & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000) == 0)
  {
LABEL_32:
    if ((has & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000000) == 0)
  {
LABEL_33:
    if ((has & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000) == 0)
  {
LABEL_35:
    if ((has & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_36:
    if ((has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000000) == 0)
  {
LABEL_37:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_41:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_44:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000) == 0)
  {
LABEL_46:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_47:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteDoubleField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000000000) == 0)
  {
LABEL_48:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteDoubleField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000000000) == 0)
  {
LABEL_49:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteDoubleField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteFloatField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_160:
  PBDataWriterWriteUint64Field();
  if ((*(void *)&self->_has & 0x20000000000000) != 0) {
LABEL_55:
  }
    PBDataWriterWriteUint64Field();
LABEL_56:
  unint64_t v6 = [(MHSchemaMHVoiceTriggerEventInfo *)self configVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  unint64_t v7 = [(MHSchemaMHVoiceTriggerEventInfo *)self configPath];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = &self->_has;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x40000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v9 = *(void *)v8;
    if ((*(void *)v8 & 0x80000000000000) == 0)
    {
LABEL_62:
      if ((v9 & 0x100000000000000) == 0) {
        goto LABEL_63;
      }
      goto LABEL_164;
    }
  }
  else if ((v9 & 0x80000000000000) == 0)
  {
    goto LABEL_62;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_63:
    if ((v9 & 0x200000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x200000000000000) == 0)
  {
LABEL_64:
    if ((v9 & 0x400000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteUint64Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x400000000000000) == 0)
  {
LABEL_65:
    if ((v9 & 0x800000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteFloatField();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x800000000000000) == 0)
  {
LABEL_66:
    if ((v9 & 0x1000000000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteFloatField();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000000000000) == 0)
  {
LABEL_67:
    if ((v9 & 0x2000000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteInt32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x2000000000000000) == 0)
  {
LABEL_68:
    if ((v9 & 0x4000000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x4000000000000000) != 0) {
LABEL_69:
  }
    PBDataWriterWriteFloatField();
LABEL_70:
  unsigned int v10 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];

  if (v10)
  {
    long double v11 = [(MHSchemaMHVoiceTriggerEventInfo *)self audioProviderUUID];
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_has & 0x8000000000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  LOBYTE(v12) = *((_WORD *)&self->_has + 4);
  if (*((_WORD *)&self->_has + 4))
  {
    PBDataWriterWriteBOOLField();
    __int16 v12 = *((_WORD *)&self->_has + 4);
    if ((v12 & 2) == 0)
    {
LABEL_76:
      if ((v12 & 4) == 0) {
        goto LABEL_77;
      }
      goto LABEL_173;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
    goto LABEL_76;
  }
  PBDataWriterWriteFloatField();
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 4) == 0)
  {
LABEL_77:
    if ((v12 & 8) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_173:
  PBDataWriterWriteFloatField();
  if ((*((_WORD *)&self->_has + 4) & 8) != 0) {
LABEL_78:
  }
    PBDataWriterWriteUint32Field();
LABEL_79:
  unint64_t v13 = [(MHSchemaMHVoiceTriggerEventInfo *)self captureFilePath];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  float v14 = [(MHSchemaMHVoiceTriggerEventInfo *)self configDataHash];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  int v15 = *((unsigned __int16 *)&self->_has + 4);
  int v16 = v15 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v15 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    int v19 = *((unsigned __int16 *)&self->_has + 4);
    int v16 = v19 | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v19 & 0x20) == 0)
    {
LABEL_85:
      if ((v16 & 0x40) == 0) {
        goto LABEL_86;
      }
      goto LABEL_177;
    }
  }
  else if ((v15 & 0x20) == 0)
  {
    goto LABEL_85;
  }
  PBDataWriterWriteBOOLField();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x40) == 0)
  {
LABEL_86:
    if ((v16 & 0x80) == 0) {
      goto LABEL_87;
    }
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteBOOLField();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
LABEL_87:
    if ((v16 & 0x100) == 0) {
      goto LABEL_88;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteBOOLField();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x100) == 0)
  {
LABEL_88:
    if ((v16 & 0x200) == 0) {
      goto LABEL_89;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x200) == 0)
  {
LABEL_89:
    if ((v16 & 0x400) == 0) {
      goto LABEL_90;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x400) == 0)
  {
LABEL_90:
    if ((v16 & 0x800) == 0) {
      goto LABEL_91;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
LABEL_91:
    if ((v16 & 0x1000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x1000) == 0)
  {
LABEL_92:
    if ((v16 & 0x2000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x2000) == 0)
  {
LABEL_93:
    if ((v16 & 0x4000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
  {
LABEL_94:
    if ((v16 & 0x8000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x8000) == 0)
  {
LABEL_95:
    if ((v16 & 0x10000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteUint64Field();
  int v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v16 & 0x10000) == 0)
  {
LABEL_96:
    if ((v16 & 0x20000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_187:
  PBDataWriterWriteUint64Field();
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x20000) != 0) {
LABEL_97:
  }
    PBDataWriterWriteUint64Field();
LABEL_98:
  unsigned int v17 = [(MHSchemaMHVoiceTriggerEventInfo *)self triggerPhrase];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  int v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v18 & 0x40000) != 0)
  {
    PBDataWriterWriteDoubleField();
    int v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v18 & 0x80000) == 0)
    {
LABEL_102:
      if ((v18 & 0x100000) == 0) {
        goto LABEL_103;
      }
      goto LABEL_191;
    }
  }
  else if ((v18 & 0x80000) == 0)
  {
    goto LABEL_102;
  }
  PBDataWriterWriteBOOLField();
  int v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v18 & 0x100000) == 0)
  {
LABEL_103:
    if ((v18 & 0x200000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
LABEL_191:
  PBDataWriterWriteUint64Field();
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x200000) != 0) {
LABEL_104:
  }
    PBDataWriterWriteFloatField();
LABEL_105:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerEventInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteNeptuneDetectionApiScore
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setNeptuneDetectionApiScore:0.0];
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFDFFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasNeptuneDetectionApiScore:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFDFFFFF;
  if (a3) {
    int v4 = 0x200000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasNeptuneDetectionApiScore
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 21) & 1;
}

- (void)setNeptuneDetectionApiScore:(float)a3
{
  int v3 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x200000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((unsigned char *)&self->_has + 10) = v4;
  self->_float neptuneDetectionApiScore = a3;
}

- (void)deleteDisplayWakeTimeOffsetInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setDisplayWakeTimeOffsetInNs:0];
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFEFFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasDisplayWakeTimeOffsetInNs:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFEFFFFF;
  if (a3) {
    int v4 = 0x100000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasDisplayWakeTimeOffsetInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 20) & 1;
}

- (void)setDisplayWakeTimeOffsetInNs:(unint64_t)a3
{
  int v3 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x100000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((unsigned char *)&self->_has + 10) = v4;
  self->_unint64_t displayWakeTimeOffsetInNs = a3;
}

- (void)deleteIsHSJSTriggerFromAlwaysOnMicBuffer
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setIsHSJSTriggerFromAlwaysOnMicBuffer:0];
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFF7FFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasIsHSJSTriggerFromAlwaysOnMicBuffer:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFF7FFFF;
  if (a3) {
    int v4 = 0x80000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsHSJSTriggerFromAlwaysOnMicBuffer
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 19) & 1;
}

- (void)setIsHSJSTriggerFromAlwaysOnMicBuffer:(BOOL)a3
{
  int v3 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x80000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((unsigned char *)&self->_has + 10) = v4;
  self->_int isHSJSTriggerFromAlwaysOnMicBuffer = a3;
}

- (void)deleteLastDisplayWakeTimeOffsetInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setLastDisplayWakeTimeOffsetInNs:0.0];
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFBFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasLastDisplayWakeTimeOffsetInNs:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFBFFFF;
  if (a3) {
    int v4 = 0x40000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasLastDisplayWakeTimeOffsetInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 18) & 1;
}

- (void)setLastDisplayWakeTimeOffsetInNs:(double)a3
{
  int v3 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((unsigned char *)&self->_has + 10) = v4;
  self->_double lastDisplayWakeTimeOffsetInNs = a3;
}

- (void)deleteTriggerPhrase
{
}

- (BOOL)hasTriggerPhrase
{
  return self->_triggerPhrase != 0;
}

- (void)deleteSecondPassCheckerModelKeywordDetectionEndTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassCheckerModelKeywordDetectionEndTimeInNs:0];
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFDFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassCheckerModelKeywordDetectionEndTimeInNs:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFDFFFF;
  if (a3) {
    int v4 = 0x20000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasSecondPassCheckerModelKeywordDetectionEndTimeInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 17) & 1;
}

- (void)setSecondPassCheckerModelKeywordDetectionEndTimeInNs:(unint64_t)a3
{
  int v3 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((unsigned char *)&self->_has + 10) = v4;
  self->_unint64_t secondPassCheckerModelKeywordDetectionEndTimeInNs = a3;
}

- (void)deleteSecondPassCheckerModelKeywordDetectionStartTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassCheckerModelKeywordDetectionStartTimeInNs:0];
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFEFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassCheckerModelKeywordDetectionStartTimeInNs:(BOOL)a3
{
  unsigned int v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFEFFFF;
  if (a3) {
    int v4 = 0x10000;
  }
  else {
    int v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((unsigned char *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasSecondPassCheckerModelKeywordDetectionStartTimeInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 16) & 1;
}

- (void)setSecondPassCheckerModelKeywordDetectionStartTimeInNs:(unint64_t)a3
{
  int v3 = *((unsigned __int16 *)&self->_has + 4);
  unsigned int v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x10000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((unsigned char *)&self->_has + 10) = v4;
  self->_unint64_t secondPassCheckerModelKeywordDetectionStartTimeInNs = a3;
}

- (void)deleteSecondPassLastAudioPacketReceptionTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassLastAudioPacketReceptionTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x8000u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassLastAudioPacketReceptionTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 0x8000;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0x7FFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassLastAudioPacketReceptionTimeInNs
{
  return (unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 15;
}

- (void)setSecondPassLastAudioPacketReceptionTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x8000u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassLastAudioPacketReceptionTimeInNs = a3;
}

- (void)deleteSecondPassFirstAudioPacketReceptionTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassFirstAudioPacketReceptionTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x4000u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassFirstAudioPacketReceptionTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 0x4000;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xBFFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassFirstAudioPacketReceptionTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 14) & 1;
}

- (void)setSecondPassFirstAudioPacketReceptionTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x4000u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassFirstAudioPacketReceptionTimeInNs = a3;
}

- (void)deleteSecondPassAudioStreamReadyTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassAudioStreamReadyTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x2000u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassAudioStreamReadyTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 0x2000;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xDFFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassAudioStreamReadyTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 13) & 1;
}

- (void)setSecondPassAudioStreamReadyTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x2000u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassAudioStreamReadyTimeInNs = a3;
}

- (void)deleteSecondPassAudioStreamStartTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassAudioStreamStartTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x1000u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassAudioStreamStartTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 4096;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xEFFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassAudioStreamStartTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 12) & 1;
}

- (void)setSecondPassAudioStreamStartTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassAudioStreamStartTimeInNs = a3;
}

- (void)deleteSecondPassAssetLoadCompleteTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassAssetLoadCompleteTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x800u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassAssetLoadCompleteTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 2048;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xF7FF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassAssetLoadCompleteTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 11) & 1;
}

- (void)setSecondPassAssetLoadCompleteTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x800u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassAssetLoadCompleteTimeInNs = a3;
}

- (void)deleteSecondPassAssetLoadStartTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassAssetLoadStartTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x400u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassAssetLoadStartTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 1024;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassAssetLoadStartTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (void)setSecondPassAssetLoadStartTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x400u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassAssetLoadStartTimeInNs = a3;
}

- (void)deleteSecondPassAssetQueryCompleteTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassAssetQueryCompleteTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x200u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassAssetQueryCompleteTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 512;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassAssetQueryCompleteTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (void)setSecondPassAssetQueryCompleteTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x200u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassAssetQueryCompleteTimeInNs = a3;
}

- (void)deleteSecondPassAssetQueryStartTimeInNs
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSecondPassAssetQueryStartTimeInNs:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x100u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSecondPassAssetQueryStartTimeInNs:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 256;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSecondPassAssetQueryStartTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (void)setSecondPassAssetQueryStartTimeInNs:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x100u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unint64_t secondPassAssetQueryStartTimeInNs = a3;
}

- (void)deleteIsWakeFromSleep
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setIsWakeFromSleep:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x80u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasIsWakeFromSleep:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 128;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsWakeFromSleep
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setIsWakeFromSleep:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x80u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_int isWakeFromSleep = a3;
}

- (void)deleteIsBargeIn
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setIsBargeIn:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x40u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasIsBargeIn:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 64;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsBargeIn
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setIsBargeIn:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x40u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_int isBargeIn = a3;
}

- (void)deleteDidAudioStall
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setDidAudioStall:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x20u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasDidAudioStall:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 32;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasDidAudioStall
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setDidAudioStall:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x20u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_int didAudioStall = a3;
}

- (void)deleteSiriIsActiveOrOtherAssertion
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setSiriIsActiveOrOtherAssertion:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x10u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasSiriIsActiveOrOtherAssertion:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 16;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasSiriIsActiveOrOtherAssertion
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSiriIsActiveOrOtherAssertion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x10u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_int siriIsActiveOrOtherAssertion = a3;
}

- (void)deleteConfigDataHash
{
}

- (BOOL)hasConfigDataHash
{
  return self->_configDataHash != 0;
}

- (void)deleteCaptureFilePath
{
}

- (BOOL)hasCaptureFilePath
{
  return self->_captureFilePath != 0;
}

- (void)deleteLastConsecutiveVTRejects
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setLastConsecutiveVTRejects:0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~8u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasLastConsecutiveVTRejects:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 8;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasLastConsecutiveVTRejects
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setLastConsecutiveVTRejects:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 8u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_unsigned int lastConsecutiveVTRejects = a3;
}

- (void)deleteDowntimeInSec
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setDowntimeInSec:0.0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~4u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasDowntimeInSec:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 4;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasDowntimeInSec
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setDowntimeInSec:(float)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 4u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_float downtimeInSec = a3;
}

- (void)deleteUptimeInSec
{
  [(MHSchemaMHVoiceTriggerEventInfo *)self setUptimeInSec:0.0];
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~2u;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (void)setHasUptimeInSec:(BOOL)a3
{
  int v3 = *((_WORD *)&self->_has + 4) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3) {
    __int16 v4 = 2;
  }
  else {
    __int16 v4 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v4;
  *((unsigned char *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasUptimeInSec
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setUptimeInSec:(float)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 2u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_float uptimeInSec = a3;
}

- (void)deleteDidWakeAP
{
  *((_WORD *)&self->_has + 4) &= ~1u;
}

- (void)setHasDidWakeAP:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasDidWakeAP
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setDidWakeAP:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 1u;
  *((unsigned char *)&self->_has + 10) = v3;
  self->_int didWakeAP = a3;
}

- (void)deleteOnBatteryPower
{
  *(void *)&self->_has &= ~0x8000000000000000;
}

- (void)setHasOnBatteryPower:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasOnBatteryPower
{
  return *(void *)&self->_has >> 63;
}

- (void)setOnBatteryPower:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_int onBatteryPower = a3;
}

- (void)deleteAudioProviderUUID
{
}

- (BOOL)hasAudioProviderUUID
{
  return self->_audioProviderUUID != 0;
}

- (void)deleteMediaVolume
{
  *(void *)&self->_has &= ~0x4000000000000000uLL;
}

- (void)setHasMediaVolume:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMediaVolume
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setMediaVolume:(float)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_float mediaVolume = a3;
}

- (void)deleteIsMediaPlaying
{
  *(void *)&self->_has &= ~0x2000000000000000uLL;
}

- (void)setHasIsMediaPlaying:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsMediaPlaying
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_int isMediaPlaying = a3;
}

- (void)deleteHostPowerStateAtTrigger
{
  *(void *)&self->_has &= ~0x1000000000000000uLL;
}

- (void)setHasHostPowerStateAtTrigger:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasHostPowerStateAtTrigger
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setHostPowerStateAtTrigger:(int)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_int hostPowerStateAtTrigger = a3;
}

- (void)deleteCumulativeDowntimeInSec
{
  *(void *)&self->_has &= ~0x800000000000000uLL;
}

- (void)setHasCumulativeDowntimeInSec:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCumulativeDowntimeInSec
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setCumulativeDowntimeInSec:(float)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_float cumulativeDowntimeInSec = a3;
}

- (void)deleteCumulativeUptimeInSec
{
  *(void *)&self->_has &= ~0x400000000000000uLL;
}

- (void)setHasCumulativeUptimeInSec:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCumulativeUptimeInSec
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (void)setCumulativeUptimeInSec:(float)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_float cumulativeUptimeInSec = a3;
}

- (void)deleteTwoShotAudibleFeedbackDelayInNs
{
  *(void *)&self->_has &= ~0x200000000000000uLL;
}

- (void)setHasTwoShotAudibleFeedbackDelayInNs:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTwoShotAudibleFeedbackDelayInNs
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (void)setTwoShotAudibleFeedbackDelayInNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_unint64_t twoShotAudibleFeedbackDelayInNs = a3;
}

- (void)deleteActiveChannel
{
  *(void *)&self->_has &= ~0x100000000000000uLL;
}

- (void)setHasActiveChannel:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasActiveChannel
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setActiveChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_unsigned int activeChannel = a3;
}

- (void)deleteDeviceHandheld
{
  *(void *)&self->_has &= ~0x80000000000000uLL;
}

- (void)setHasDeviceHandheld:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDeviceHandheld
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setDeviceHandheld:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_int deviceHandheld = a3;
}

- (void)deleteIsSecondChance
{
  *(void *)&self->_has &= ~0x40000000000000uLL;
}

- (void)setHasIsSecondChance:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsSecondChance
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (void)setIsSecondChance:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_int isSecondChance = a3;
}

- (void)deleteConfigPath
{
}

- (BOOL)hasConfigPath
{
  return self->_configPath != 0;
}

- (void)deleteConfigVersion
{
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (void)deleteTotalSamplesAtEndOfCapture
{
  *(void *)&self->_has &= ~0x20000000000000uLL;
}

- (void)setHasTotalSamplesAtEndOfCapture:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTotalSamplesAtEndOfCapture
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (void)setTotalSamplesAtEndOfCapture:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_unint64_t totalSamplesAtEndOfCapture = a3;
}

- (void)deleteTotalSamplesAtTriggerEnd
{
  *(void *)&self->_has &= ~0x10000000000000uLL;
}

- (void)setHasTotalSamplesAtTriggerEnd:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTotalSamplesAtTriggerEnd
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setTotalSamplesAtTriggerEnd:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_unint64_t totalSamplesAtTriggerEnd = a3;
}

- (void)deleteTotalSamplesAtTriggerStart
{
  *(void *)&self->_has &= ~0x8000000000000uLL;
}

- (void)setHasTotalSamplesAtTriggerStart:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTotalSamplesAtTriggerStart
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setTotalSamplesAtTriggerStart:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_unint64_t totalSamplesAtTriggerStart = a3;
}

- (void)deleteTriggerDurationInNs
{
  *(void *)&self->_has &= ~0x4000000000000uLL;
}

- (void)setHasTriggerDurationInNs:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerDurationInNs
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setTriggerDurationInNs:(float)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_float triggerDurationInNs = a3;
}

- (void)deleteIsContinuous
{
  *(void *)&self->_has &= ~0x2000000000000uLL;
}

- (void)setHasIsContinuous:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsContinuous
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setIsContinuous:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_int isContinuous = a3;
}

- (void)deleteHardwareSamplerate
{
  *(void *)&self->_has &= ~0x1000000000000uLL;
}

- (void)setHasHardwareSamplerate:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasHardwareSamplerate
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setHardwareSamplerate:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_unsigned int hardwareSamplerate = a3;
}

- (void)deleteTriggerFiredTime
{
  *(void *)&self->_has &= ~0x800000000000uLL;
}

- (void)setHasTriggerFiredTime:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerFiredTime
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setTriggerFiredTime:(double)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_double triggerFiredTime = a3;
}

- (void)deleteTriggerEndTime
{
  *(void *)&self->_has &= ~0x400000000000uLL;
}

- (void)setHasTriggerEndTime:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerEndTime
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (void)setTriggerEndTime:(double)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_double triggerEndTime = a3;
}

- (void)deleteTriggerStartTime
{
  *(void *)&self->_has &= ~0x200000000000uLL;
}

- (void)setHasTriggerStartTime:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerStartTime
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setTriggerStartTime:(double)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_double triggerStartTime = a3;
}

- (void)deleteTriggerFireTimeOffsetInNs
{
  *(void *)&self->_has &= ~0x100000000000uLL;
}

- (void)setHasTriggerFireTimeOffsetInNs:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerFireTimeOffsetInNs
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setTriggerFireTimeOffsetInNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_unint64_t triggerFireTimeOffsetInNs = a3;
}

- (void)deleteTriggerEndTimeOffsetInNs
{
  *(void *)&self->_has &= ~0x80000000000uLL;
}

- (void)setHasTriggerEndTimeOffsetInNs:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerEndTimeOffsetInNs
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (void)setTriggerEndTimeOffsetInNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_unint64_t triggerEndTimeOffsetInNs = a3;
}

- (void)deleteTriggerStartTimeOffsetInNs
{
  *(void *)&self->_has &= ~0x40000000000uLL;
}

- (void)setHasTriggerStartTimeOffsetInNs:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerStartTimeOffsetInNs
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (void)setTriggerStartTimeOffsetInNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_unint64_t triggerStartTimeOffsetInNs = a3;
}

- (void)deleteThreshold
{
  *(void *)&self->_has &= ~0x20000000000uLL;
}

- (void)setHasThreshold:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasThreshold
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (void)setThreshold:(float)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_float threshold = a3;
}

- (void)deleteRecognizerScaleFactor
{
  *(void *)&self->_has &= ~0x10000000000uLL;
}

- (void)setHasRecognizerScaleFactor:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasRecognizerScaleFactor
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (void)setRecognizerScaleFactor:(float)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_float recognizerScaleFactor = a3;
}

- (void)deleteRecognizerWaitTimeInNs
{
  *(void *)&self->_has &= ~0x8000000000uLL;
}

- (void)setHasRecognizerWaitTimeInNs:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasRecognizerWaitTimeInNs
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (void)setRecognizerWaitTimeInNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_unint64_t recognizerWaitTimeInNs = a3;
}

- (void)deleteRecognizerThresholdOffset
{
  *(void *)&self->_has &= ~0x4000000000uLL;
}

- (void)setHasRecognizerThresholdOffset:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasRecognizerThresholdOffset
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (void)setRecognizerThresholdOffset:(float)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_float recognizerThresholdOffset = a3;
}

- (void)deleteRecognizerScore
{
  *(void *)&self->_has &= ~0x2000000000uLL;
}

- (void)setHasRecognizerScore:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasRecognizerScore
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)setRecognizerScore:(float)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_float recognizerScore = a3;
}

- (void)deleteEffectiveThreshold
{
  *(void *)&self->_has &= ~0x1000000000uLL;
}

- (void)setHasEffectiveThreshold:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasEffectiveThreshold
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (void)setEffectiveThreshold:(float)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_float effectiveThreshold = a3;
}

- (void)deleteIsMaximized
{
  *(void *)&self->_has &= ~0x800000000uLL;
}

- (void)setHasIsMaximized:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasIsMaximized
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (void)setIsMaximized:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_int isMaximized = a3;
}

- (void)deleteTriggerScore
{
  *(void *)&self->_has &= ~0x400000000uLL;
}

- (void)setHasTriggerScore:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasTriggerScore
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (void)setTriggerScore:(float)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_float triggerScore = a3;
}

- (void)deleteTotalSampleCount
{
  *(void *)&self->_has &= ~0x200000000uLL;
}

- (void)setHasTotalSampleCount:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasTotalSampleCount
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setTotalSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_unint64_t totalSampleCount = a3;
}

- (void)deleteIsTriggerEvent
{
  *(void *)&self->_has &= ~0x100000000uLL;
}

- (void)setHasIsTriggerEvent:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasIsTriggerEvent
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setIsTriggerEvent:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_int isTriggerEvent = a3;
}

- (void)deleteAnalyzerTrailingSamples
{
  *(void *)&self->_has &= ~0x80000000uLL;
}

- (void)setHasAnalyzerTrailingSamples:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasAnalyzerTrailingSamples
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setAnalyzerTrailingSamples:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_unint64_t analyzerTrailingSamples = a3;
}

- (void)deleteAnalyzerPrependingSamples
{
  *(void *)&self->_has &= ~0x40000000uLL;
}

- (void)setHasAnalyzerPrependingSamples:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasAnalyzerPrependingSamples
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (void)setAnalyzerPrependingSamples:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_unint64_t analyzerPrependingSamples = a3;
}

- (void)deleteExtraSamplesAtStart
{
  *(void *)&self->_has &= ~0x20000000uLL;
}

- (void)setHasExtraSamplesAtStart:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasExtraSamplesAtStart
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_unint64_t extraSamplesAtStart = a3;
}

- (void)deleteTriggerFireNs
{
  *(void *)&self->_has &= ~0x10000000uLL;
}

- (void)setHasTriggerFireNs:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasTriggerFireNs
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setTriggerFireNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_unint64_t triggerFireNs = a3;
}

- (void)deleteTriggerEndNs
{
  *(void *)&self->_has &= ~0x8000000uLL;
}

- (void)setHasTriggerEndNs:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasTriggerEndNs
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setTriggerEndNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_unint64_t triggerEndNs = a3;
}

- (void)deleteTriggerStartNs
{
  *(void *)&self->_has &= ~0x4000000uLL;
}

- (void)setHasTriggerStartNs:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasTriggerStartNs
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setTriggerStartNs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_unint64_t triggerStartNs = a3;
}

- (void)deleteTriggerFireSampleCount
{
  *(void *)&self->_has &= ~0x2000000uLL;
}

- (void)setHasTriggerFireSampleCount:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasTriggerFireSampleCount
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setTriggerFireSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_unint64_t triggerFireSampleCount = a3;
}

- (void)deleteTriggerEndSampleCount
{
  *(void *)&self->_has &= ~0x1000000uLL;
}

- (void)setHasTriggerEndSampleCount:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasTriggerEndSampleCount
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setTriggerEndSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_unint64_t triggerEndSampleCount = a3;
}

- (void)deleteClientStartSampleCount
{
  *(void *)&self->_has &= ~0x800000uLL;
}

- (void)setHasClientStartSampleCount:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasClientStartSampleCount
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setClientStartSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_unint64_t clientStartSampleCount = a3;
}

- (void)deleteTriggerStartSampleCount
{
  *(void *)&self->_has &= ~0x400000uLL;
}

- (void)setHasTriggerStartSampleCount:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasTriggerStartSampleCount
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setTriggerStartSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_unint64_t triggerStartSampleCount = a3;
}

- (void)deleteEnhancedCarplayTriggerMode
{
  *(void *)&self->_has &= ~0x200000uLL;
}

- (void)setHasEnhancedCarplayTriggerMode:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasEnhancedCarplayTriggerMode
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setEnhancedCarplayTriggerMode:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_int enhancedCarplayTriggerMode = a3;
}

- (void)deleteRemoteMicVADMyriadThreshold
{
  *(void *)&self->_has &= ~0x100000uLL;
}

- (void)setHasRemoteMicVADMyriadThreshold:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasRemoteMicVADMyriadThreshold
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (void)setRemoteMicVADMyriadThreshold:(float)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_float remoteMicVADMyriadThreshold = a3;
}

- (void)deleteRemoteMicVADThreshold
{
  *(void *)&self->_has &= ~0x80000uLL;
}

- (void)setHasRemoteMicVADThreshold:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasRemoteMicVADThreshold
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setRemoteMicVADThreshold:(float)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_float remoteMicVADThreshold = a3;
}

- (void)deleteRemoteMicVADScore
{
  *(void *)&self->_has &= ~0x40000uLL;
}

- (void)setHasRemoteMicVADScore:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasRemoteMicVADScore
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setRemoteMicVADScore:(float)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_float remoteMicVADScore = a3;
}

- (void)deleteShadowMicScoreThresholdForVAD
{
  *(void *)&self->_has &= ~0x20000uLL;
}

- (void)setHasShadowMicScoreThresholdForVAD:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasShadowMicScoreThresholdForVAD
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setShadowMicScoreThresholdForVAD:(float)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_float shadowMicScoreThresholdForVAD = a3;
}

- (void)deleteShadowMicScore
{
  *(void *)&self->_has &= ~0x10000uLL;
}

- (void)setHasShadowMicScore:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasShadowMicScore
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setShadowMicScore:(float)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_float shadowMicScore = a3;
}

- (void)deleteTriggerExplicitTDSRSatScore
{
  *(void *)&self->_has &= ~0x8000uLL;
}

- (void)setHasTriggerExplicitTDSRSatScore:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasTriggerExplicitTDSRSatScore
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setTriggerExplicitTDSRSatScore:(float)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_float triggerExplicitTDSRSatScore = a3;
}

- (void)deleteTriggerExplicitSatScore
{
  *(void *)&self->_has &= ~0x4000uLL;
}

- (void)setHasTriggerExplicitSatScore:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasTriggerExplicitSatScore
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (void)setTriggerExplicitSatScore:(float)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_float triggerExplicitSatScore = a3;
}

- (void)deleteDeltaTimeInNsFromlastPHSReject
{
  *(void *)&self->_has &= ~0x2000uLL;
}

- (void)setHasDeltaTimeInNsFromlastPHSReject:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasDeltaTimeInNsFromlastPHSReject
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (void)setDeltaTimeInNsFromlastPHSReject:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_unint64_t deltaTimeInNsFromlastPHSReject = a3;
}

- (void)deleteLastConsecutivePHSRejects
{
  *(void *)&self->_has &= ~0x1000uLL;
}

- (void)setHasLastConsecutivePHSRejects:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasLastConsecutivePHSRejects
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setLastConsecutivePHSRejects:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_unsigned int lastConsecutivePHSRejects = a3;
}

- (void)deleteSatBeingTrained
{
  *(void *)&self->_has &= ~0x800uLL;
}

- (void)setHasSatBeingTrained:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasSatBeingTrained
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setSatBeingTrained:(BOOL)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_int satBeingTrained = a3;
}

- (void)deleteBiometricClue
{
  *(void *)&self->_has &= ~0x400uLL;
}

- (void)setHasBiometricClue:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasBiometricClue
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setBiometricClue:(int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_int biometricClue = a3;
}

- (void)deleteTdSpeakerRecognizerCombinationWeight
{
  *(void *)&self->_has &= ~0x200uLL;
}

- (void)setHasTdSpeakerRecognizerCombinationWeight:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasTdSpeakerRecognizerCombinationWeight
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (void)setTdSpeakerRecognizerCombinationWeight:(float)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_float tdSpeakerRecognizerCombinationWeight = a3;
}

- (void)deleteTdSpeakerRecognizerCombinedThreshold
{
  *(void *)&self->_has &= ~0x100uLL;
}

- (void)setHasTdSpeakerRecognizerCombinedThreshold:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThreshold
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setTdSpeakerRecognizerCombinedThreshold:(float)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_float tdSpeakerRecognizerCombinedThreshold = a3;
}

- (void)deleteTdSpeakerRecognizerCombinedScore
{
  *(void *)&self->_has &= ~0x80uLL;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setTdSpeakerRecognizerCombinedScore:(float)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_float tdSpeakerRecognizerCombinedScore = a3;
}

- (void)deleteTdSpeakerRecognizerScore
{
  *(void *)&self->_has &= ~0x40uLL;
}

- (void)setHasTdSpeakerRecognizerScore:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasTdSpeakerRecognizerScore
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (void)setTdSpeakerRecognizerScore:(float)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_float tdSpeakerRecognizerScore = a3;
}

- (void)deleteSatTriggered
{
  *(void *)&self->_has &= ~0x20uLL;
}

- (void)setHasSatTriggered:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasSatTriggered
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (void)setSatTriggered:(BOOL)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_int satTriggered = a3;
}

- (void)deleteSatThreshold
{
  *(void *)&self->_has &= ~0x10uLL;
}

- (void)setHasSatThreshold:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasSatThreshold
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setSatThreshold:(float)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_float satThreshold = a3;
}

- (void)deleteSatNumTrainingUtterances
{
  *(void *)&self->_has &= ~8uLL;
}

- (void)setHasSatNumTrainingUtterances:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasSatNumTrainingUtterances
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (void)setSatNumTrainingUtterances:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_unsigned int satNumTrainingUtterances = a3;
}

- (void)deleteSatScore
{
  *(void *)&self->_has &= ~4uLL;
}

- (void)setHasSatScore:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasSatScore
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (void)setSatScore:(float)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_float satScore = a3;
}

- (void)deleteSecondPassAnalyerEndSampleCount
{
  *(void *)&self->_has &= ~2uLL;
}

- (void)setHasSecondPassAnalyerEndSampleCount:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasSecondPassAnalyerEndSampleCount
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setSecondPassAnalyerEndSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_unint64_t secondPassAnalyerEndSampleCount = a3;
}

- (void)deleteSecondPassAnalyerStartSampleCount
{
  *(void *)&self->_has &= ~1uLL;
}

- (void)setHasSecondPassAnalyerStartSampleCount:(BOOL)a3
{
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasSecondPassAnalyerStartSampleCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSecondPassAnalyerStartSampleCount:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_unint64_t secondPassAnalyerStartSampleCount = a3;
}

@end