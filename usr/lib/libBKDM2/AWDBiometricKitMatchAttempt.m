@interface AWDBiometricKitMatchAttempt
- (BOOL)asDepthFailure;
- (BOOL)asFailure;
- (BOOL)asFloodFailure;
- (BOOL)autoRetry;
- (BOOL)autoRetryAllowed;
- (BOOL)autoRetryEnabled;
- (BOOL)bioLockout;
- (BOOL)combinedSequenceEnabled;
- (BOOL)engagementInfoFeedbackCameraObstructed;
- (BOOL)engagementInfoFeedbackFaceOccluded;
- (BOOL)engagementInfoFeedbackFaceTooClose;
- (BOOL)engagementInfoFeedbackFaceTooFar;
- (BOOL)engagementInfoFeedbackNoAttention;
- (BOOL)engagementInfoFeedbackNoFaceDetected;
- (BOOL)engagementInfoFeedbackNoseAndMouthOccluded;
- (BOOL)engagementInfoFeedbackPartialOutOfFOV;
- (BOOL)engagementInfoFeedbackPoseMarginal;
- (BOOL)engagementInfoFeedbackPoseOutOfRange;
- (BOOL)hasAmbientLux;
- (BOOL)hasAsDepthFailure;
- (BOOL)hasAsFailure;
- (BOOL)hasAsFloodFailure;
- (BOOL)hasAutoRetry;
- (BOOL)hasAutoRetryAllowed;
- (BOOL)hasAutoRetryEnabled;
- (BOOL)hasBioCheckCamRectH;
- (BOOL)hasBioCheckCamRectW;
- (BOOL)hasBioCheckCamRectX;
- (BOOL)hasBioCheckCamRectY;
- (BOOL)hasBioCheckEndTime;
- (BOOL)hasBioCheckFaceDistance;
- (BOOL)hasBioCheckFrameCount;
- (BOOL)hasBioCheckFrameDenseCount;
- (BOOL)hasBioCheckFrameFloodCount;
- (BOOL)hasBioCheckFrameSparseCount;
- (BOOL)hasBioCheckPPMAllocatedBudget;
- (BOOL)hasBioCheckPPMRequestedBudget;
- (BOOL)hasBioCheckResult;
- (BOOL)hasBioLockout;
- (BOOL)hasBioLockoutReason;
- (BOOL)hasCamRectH;
- (BOOL)hasCamRectW;
- (BOOL)hasCamRectX;
- (BOOL)hasCamRectY;
- (BOOL)hasCameraErr;
- (BOOL)hasCameraHWParameters;
- (BOOL)hasCaptureMethod;
- (BOOL)hasCombinedSequenceEnabled;
- (BOOL)hasDeviceOrientation;
- (BOOL)hasEngagementInfoFeedbackCameraObstructed;
- (BOOL)hasEngagementInfoFeedbackFaceOccluded;
- (BOOL)hasEngagementInfoFeedbackFaceTooClose;
- (BOOL)hasEngagementInfoFeedbackFaceTooFar;
- (BOOL)hasEngagementInfoFeedbackNoAttention;
- (BOOL)hasEngagementInfoFeedbackNoFaceDetected;
- (BOOL)hasEngagementInfoFeedbackNoseAndMouthOccluded;
- (BOOL)hasEngagementInfoFeedbackPartialOutOfFOV;
- (BOOL)hasEngagementInfoFeedbackPoseMarginal;
- (BOOL)hasEngagementInfoFeedbackPoseOutOfRange;
- (BOOL)hasFaceDetectCamRectH;
- (BOOL)hasFaceDetectCamRectW;
- (BOOL)hasFaceDetectCamRectX;
- (BOOL)hasFaceDetectCamRectY;
- (BOOL)hasFaceDetectEndTime;
- (BOOL)hasFaceDetectFaceDistance;
- (BOOL)hasFaceDetectFrameCount;
- (BOOL)hasFaceDetectFrameDenseCount;
- (BOOL)hasFaceDetectFrameFloodCount;
- (BOOL)hasFaceDetectFrameSparseCount;
- (BOOL)hasFaceDetectPPMAllocatedBudget;
- (BOOL)hasFaceDetectPPMRequestedBudget;
- (BOOL)hasFaceDetectResult;
- (BOOL)hasFaceDistance;
- (BOOL)hasFaceOrientation;
- (BOOL)hasFacePitch;
- (BOOL)hasFaceRoll;
- (BOOL)hasFaceYaw;
- (BOOL)hasFailedMatchAttemptsFromBiocheck;
- (BOOL)hasFailedMatchAttemptsFromFD;
- (BOOL)hasFailedUnlockAttemptsFromBiocheck;
- (BOOL)hasFailedUnlockAttemptsFromFD;
- (BOOL)hasFeatureGenerationError;
- (BOOL)hasHasOcclusion;
- (BOOL)hasMatchCancelled;
- (BOOL)hasMatchDepthFailure;
- (BOOL)hasMatchFeatureVectorError;
- (BOOL)hasMatchFloodFailure;
- (BOOL)hasMatchForUnlock;
- (BOOL)hasMatchIdentityCount;
- (BOOL)hasMatchType;
- (BOOL)hasMatcherFailure;
- (BOOL)hasOcclusion;
- (BOOL)hasOnlineTemplateAge;
- (BOOL)hasOnlineTemplateUpdated;
- (BOOL)hasOverallResult;
- (BOOL)hasOverallTime;
- (BOOL)hasOverallTimeWithRetries;
- (BOOL)hasPasscodeChallengeAllowed;
- (BOOL)hasProbingPatternCamRectH;
- (BOOL)hasProbingPatternCamRectW;
- (BOOL)hasProbingPatternCamRectX;
- (BOOL)hasProbingPatternCamRectY;
- (BOOL)hasProbingPatternEndTime;
- (BOOL)hasProbingPatternFaceDistance;
- (BOOL)hasProbingPatternFailure;
- (BOOL)hasProbingPatternFrameCount;
- (BOOL)hasProbingPatternFrameDenseCount;
- (BOOL)hasProbingPatternFrameFloodCount;
- (BOOL)hasProbingPatternFrameSparseCount;
- (BOOL)hasProbingPatternResult;
- (BOOL)hasRfcFrameIndex;
- (BOOL)hasRfcSetIndex;
- (BOOL)hasSensorTemperature;
- (BOOL)hasShortTermTemplateAge;
- (BOOL)hasTimeSinceSleep;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchCancelled;
- (BOOL)matchDepthFailure;
- (BOOL)matchFloodFailure;
- (BOOL)matchForUnlock;
- (BOOL)matcherFailure;
- (BOOL)onlineTemplateUpdated;
- (BOOL)overallResult;
- (BOOL)passcodeChallengeAllowed;
- (BOOL)probingPatternFailure;
- (BOOL)readFrom:(id)a3;
- (NSString)cameraHWParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ambientLux;
- (int)bioCheckResult;
- (int)cameraErr;
- (int)facePitch;
- (int)faceRoll;
- (int)faceYaw;
- (int)onlineTemplateAge;
- (int)probingPatternResult;
- (int)sensorTemperature;
- (int)shortTermTemplateAge;
- (int64_t)rfcFrameIndex;
- (int64_t)rfcSetIndex;
- (unint64_t)bioCheckEndTime;
- (unint64_t)faceDetectEndTime;
- (unint64_t)hash;
- (unint64_t)identityCreationTimeAtIndex:(unint64_t)a3;
- (unint64_t)identityCreationTimes;
- (unint64_t)identityCreationTimesCount;
- (unint64_t)overallTime;
- (unint64_t)overallTimeWithRetries;
- (unint64_t)probingPatternEndTime;
- (unint64_t)timeSinceSleep;
- (unint64_t)timestamp;
- (unsigned)bioCheckCamRectH;
- (unsigned)bioCheckCamRectW;
- (unsigned)bioCheckCamRectX;
- (unsigned)bioCheckCamRectY;
- (unsigned)bioCheckFaceDistance;
- (unsigned)bioCheckFrameCount;
- (unsigned)bioCheckFrameDenseCount;
- (unsigned)bioCheckFrameFloodCount;
- (unsigned)bioCheckFrameSparseCount;
- (unsigned)bioCheckPPMAllocatedBudget;
- (unsigned)bioCheckPPMRequestedBudget;
- (unsigned)bioLockoutReason;
- (unsigned)camRectH;
- (unsigned)camRectW;
- (unsigned)camRectX;
- (unsigned)camRectY;
- (unsigned)captureMethod;
- (unsigned)deviceOrientation;
- (unsigned)faceDetectCamRectH;
- (unsigned)faceDetectCamRectW;
- (unsigned)faceDetectCamRectX;
- (unsigned)faceDetectCamRectY;
- (unsigned)faceDetectFaceDistance;
- (unsigned)faceDetectFrameCount;
- (unsigned)faceDetectFrameDenseCount;
- (unsigned)faceDetectFrameFloodCount;
- (unsigned)faceDetectFrameSparseCount;
- (unsigned)faceDetectPPMAllocatedBudget;
- (unsigned)faceDetectPPMRequestedBudget;
- (unsigned)faceDetectResult;
- (unsigned)faceDistance;
- (unsigned)faceOrientation;
- (unsigned)failedMatchAttemptsFromBiocheck;
- (unsigned)failedMatchAttemptsFromFD;
- (unsigned)failedUnlockAttemptsFromBiocheck;
- (unsigned)failedUnlockAttemptsFromFD;
- (unsigned)featureGenerationError;
- (unsigned)matchFeatureVectorError;
- (unsigned)matchIdentityCount;
- (unsigned)matchType;
- (unsigned)probingPatternCamRectH;
- (unsigned)probingPatternCamRectW;
- (unsigned)probingPatternCamRectX;
- (unsigned)probingPatternCamRectY;
- (unsigned)probingPatternFaceDistance;
- (unsigned)probingPatternFrameCount;
- (unsigned)probingPatternFrameDenseCount;
- (unsigned)probingPatternFrameFloodCount;
- (unsigned)probingPatternFrameSparseCount;
- (void)addIdentityCreationTime:(unint64_t)a3;
- (void)clearIdentityCreationTimes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAmbientLux:(int)a3;
- (void)setAsDepthFailure:(BOOL)a3;
- (void)setAsFailure:(BOOL)a3;
- (void)setAsFloodFailure:(BOOL)a3;
- (void)setAutoRetry:(BOOL)a3;
- (void)setAutoRetryAllowed:(BOOL)a3;
- (void)setAutoRetryEnabled:(BOOL)a3;
- (void)setBioCheckCamRectH:(unsigned int)a3;
- (void)setBioCheckCamRectW:(unsigned int)a3;
- (void)setBioCheckCamRectX:(unsigned int)a3;
- (void)setBioCheckCamRectY:(unsigned int)a3;
- (void)setBioCheckEndTime:(unint64_t)a3;
- (void)setBioCheckFaceDistance:(unsigned int)a3;
- (void)setBioCheckFrameCount:(unsigned int)a3;
- (void)setBioCheckFrameDenseCount:(unsigned int)a3;
- (void)setBioCheckFrameFloodCount:(unsigned int)a3;
- (void)setBioCheckFrameSparseCount:(unsigned int)a3;
- (void)setBioCheckPPMAllocatedBudget:(unsigned int)a3;
- (void)setBioCheckPPMRequestedBudget:(unsigned int)a3;
- (void)setBioCheckResult:(int)a3;
- (void)setBioLockout:(BOOL)a3;
- (void)setBioLockoutReason:(unsigned int)a3;
- (void)setCamRectH:(unsigned int)a3;
- (void)setCamRectW:(unsigned int)a3;
- (void)setCamRectX:(unsigned int)a3;
- (void)setCamRectY:(unsigned int)a3;
- (void)setCameraErr:(int)a3;
- (void)setCameraHWParameters:(id)a3;
- (void)setCaptureMethod:(unsigned int)a3;
- (void)setCombinedSequenceEnabled:(BOOL)a3;
- (void)setDeviceOrientation:(unsigned int)a3;
- (void)setEngagementInfoFeedbackCameraObstructed:(BOOL)a3;
- (void)setEngagementInfoFeedbackFaceOccluded:(BOOL)a3;
- (void)setEngagementInfoFeedbackFaceTooClose:(BOOL)a3;
- (void)setEngagementInfoFeedbackFaceTooFar:(BOOL)a3;
- (void)setEngagementInfoFeedbackNoAttention:(BOOL)a3;
- (void)setEngagementInfoFeedbackNoFaceDetected:(BOOL)a3;
- (void)setEngagementInfoFeedbackNoseAndMouthOccluded:(BOOL)a3;
- (void)setEngagementInfoFeedbackPartialOutOfFOV:(BOOL)a3;
- (void)setEngagementInfoFeedbackPoseMarginal:(BOOL)a3;
- (void)setEngagementInfoFeedbackPoseOutOfRange:(BOOL)a3;
- (void)setFaceDetectCamRectH:(unsigned int)a3;
- (void)setFaceDetectCamRectW:(unsigned int)a3;
- (void)setFaceDetectCamRectX:(unsigned int)a3;
- (void)setFaceDetectCamRectY:(unsigned int)a3;
- (void)setFaceDetectEndTime:(unint64_t)a3;
- (void)setFaceDetectFaceDistance:(unsigned int)a3;
- (void)setFaceDetectFrameCount:(unsigned int)a3;
- (void)setFaceDetectFrameDenseCount:(unsigned int)a3;
- (void)setFaceDetectFrameFloodCount:(unsigned int)a3;
- (void)setFaceDetectFrameSparseCount:(unsigned int)a3;
- (void)setFaceDetectPPMAllocatedBudget:(unsigned int)a3;
- (void)setFaceDetectPPMRequestedBudget:(unsigned int)a3;
- (void)setFaceDetectResult:(unsigned int)a3;
- (void)setFaceDistance:(unsigned int)a3;
- (void)setFaceOrientation:(unsigned int)a3;
- (void)setFacePitch:(int)a3;
- (void)setFaceRoll:(int)a3;
- (void)setFaceYaw:(int)a3;
- (void)setFailedMatchAttemptsFromBiocheck:(unsigned int)a3;
- (void)setFailedMatchAttemptsFromFD:(unsigned int)a3;
- (void)setFailedUnlockAttemptsFromBiocheck:(unsigned int)a3;
- (void)setFailedUnlockAttemptsFromFD:(unsigned int)a3;
- (void)setFeatureGenerationError:(unsigned int)a3;
- (void)setHasAmbientLux:(BOOL)a3;
- (void)setHasAsDepthFailure:(BOOL)a3;
- (void)setHasAsFailure:(BOOL)a3;
- (void)setHasAsFloodFailure:(BOOL)a3;
- (void)setHasAutoRetry:(BOOL)a3;
- (void)setHasAutoRetryAllowed:(BOOL)a3;
- (void)setHasAutoRetryEnabled:(BOOL)a3;
- (void)setHasBioCheckCamRectH:(BOOL)a3;
- (void)setHasBioCheckCamRectW:(BOOL)a3;
- (void)setHasBioCheckCamRectX:(BOOL)a3;
- (void)setHasBioCheckCamRectY:(BOOL)a3;
- (void)setHasBioCheckEndTime:(BOOL)a3;
- (void)setHasBioCheckFaceDistance:(BOOL)a3;
- (void)setHasBioCheckFrameCount:(BOOL)a3;
- (void)setHasBioCheckFrameDenseCount:(BOOL)a3;
- (void)setHasBioCheckFrameFloodCount:(BOOL)a3;
- (void)setHasBioCheckFrameSparseCount:(BOOL)a3;
- (void)setHasBioCheckPPMAllocatedBudget:(BOOL)a3;
- (void)setHasBioCheckPPMRequestedBudget:(BOOL)a3;
- (void)setHasBioCheckResult:(BOOL)a3;
- (void)setHasBioLockout:(BOOL)a3;
- (void)setHasBioLockoutReason:(BOOL)a3;
- (void)setHasCamRectH:(BOOL)a3;
- (void)setHasCamRectW:(BOOL)a3;
- (void)setHasCamRectX:(BOOL)a3;
- (void)setHasCamRectY:(BOOL)a3;
- (void)setHasCameraErr:(BOOL)a3;
- (void)setHasCaptureMethod:(BOOL)a3;
- (void)setHasCombinedSequenceEnabled:(BOOL)a3;
- (void)setHasDeviceOrientation:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackCameraObstructed:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackFaceOccluded:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackFaceTooClose:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackFaceTooFar:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackNoAttention:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackNoFaceDetected:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackNoseAndMouthOccluded:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackPartialOutOfFOV:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackPoseMarginal:(BOOL)a3;
- (void)setHasEngagementInfoFeedbackPoseOutOfRange:(BOOL)a3;
- (void)setHasFaceDetectCamRectH:(BOOL)a3;
- (void)setHasFaceDetectCamRectW:(BOOL)a3;
- (void)setHasFaceDetectCamRectX:(BOOL)a3;
- (void)setHasFaceDetectCamRectY:(BOOL)a3;
- (void)setHasFaceDetectEndTime:(BOOL)a3;
- (void)setHasFaceDetectFaceDistance:(BOOL)a3;
- (void)setHasFaceDetectFrameCount:(BOOL)a3;
- (void)setHasFaceDetectFrameDenseCount:(BOOL)a3;
- (void)setHasFaceDetectFrameFloodCount:(BOOL)a3;
- (void)setHasFaceDetectFrameSparseCount:(BOOL)a3;
- (void)setHasFaceDetectPPMAllocatedBudget:(BOOL)a3;
- (void)setHasFaceDetectPPMRequestedBudget:(BOOL)a3;
- (void)setHasFaceDetectResult:(BOOL)a3;
- (void)setHasFaceDistance:(BOOL)a3;
- (void)setHasFaceOrientation:(BOOL)a3;
- (void)setHasFacePitch:(BOOL)a3;
- (void)setHasFaceRoll:(BOOL)a3;
- (void)setHasFaceYaw:(BOOL)a3;
- (void)setHasFailedMatchAttemptsFromBiocheck:(BOOL)a3;
- (void)setHasFailedMatchAttemptsFromFD:(BOOL)a3;
- (void)setHasFailedUnlockAttemptsFromBiocheck:(BOOL)a3;
- (void)setHasFailedUnlockAttemptsFromFD:(BOOL)a3;
- (void)setHasFeatureGenerationError:(BOOL)a3;
- (void)setHasHasOcclusion:(BOOL)a3;
- (void)setHasMatchCancelled:(BOOL)a3;
- (void)setHasMatchDepthFailure:(BOOL)a3;
- (void)setHasMatchFeatureVectorError:(BOOL)a3;
- (void)setHasMatchFloodFailure:(BOOL)a3;
- (void)setHasMatchForUnlock:(BOOL)a3;
- (void)setHasMatchIdentityCount:(BOOL)a3;
- (void)setHasMatchType:(BOOL)a3;
- (void)setHasMatcherFailure:(BOOL)a3;
- (void)setHasOcclusion:(BOOL)a3;
- (void)setHasOnlineTemplateAge:(BOOL)a3;
- (void)setHasOnlineTemplateUpdated:(BOOL)a3;
- (void)setHasOverallResult:(BOOL)a3;
- (void)setHasOverallTime:(BOOL)a3;
- (void)setHasOverallTimeWithRetries:(BOOL)a3;
- (void)setHasPasscodeChallengeAllowed:(BOOL)a3;
- (void)setHasProbingPatternCamRectH:(BOOL)a3;
- (void)setHasProbingPatternCamRectW:(BOOL)a3;
- (void)setHasProbingPatternCamRectX:(BOOL)a3;
- (void)setHasProbingPatternCamRectY:(BOOL)a3;
- (void)setHasProbingPatternEndTime:(BOOL)a3;
- (void)setHasProbingPatternFaceDistance:(BOOL)a3;
- (void)setHasProbingPatternFailure:(BOOL)a3;
- (void)setHasProbingPatternFrameCount:(BOOL)a3;
- (void)setHasProbingPatternFrameDenseCount:(BOOL)a3;
- (void)setHasProbingPatternFrameFloodCount:(BOOL)a3;
- (void)setHasProbingPatternFrameSparseCount:(BOOL)a3;
- (void)setHasProbingPatternResult:(BOOL)a3;
- (void)setHasRfcFrameIndex:(BOOL)a3;
- (void)setHasRfcSetIndex:(BOOL)a3;
- (void)setHasSensorTemperature:(BOOL)a3;
- (void)setHasShortTermTemplateAge:(BOOL)a3;
- (void)setHasTimeSinceSleep:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIdentityCreationTimes:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setMatchCancelled:(BOOL)a3;
- (void)setMatchDepthFailure:(BOOL)a3;
- (void)setMatchFeatureVectorError:(unsigned int)a3;
- (void)setMatchFloodFailure:(BOOL)a3;
- (void)setMatchForUnlock:(BOOL)a3;
- (void)setMatchIdentityCount:(unsigned int)a3;
- (void)setMatchType:(unsigned int)a3;
- (void)setMatcherFailure:(BOOL)a3;
- (void)setOnlineTemplateAge:(int)a3;
- (void)setOnlineTemplateUpdated:(BOOL)a3;
- (void)setOverallResult:(BOOL)a3;
- (void)setOverallTime:(unint64_t)a3;
- (void)setOverallTimeWithRetries:(unint64_t)a3;
- (void)setPasscodeChallengeAllowed:(BOOL)a3;
- (void)setProbingPatternCamRectH:(unsigned int)a3;
- (void)setProbingPatternCamRectW:(unsigned int)a3;
- (void)setProbingPatternCamRectX:(unsigned int)a3;
- (void)setProbingPatternCamRectY:(unsigned int)a3;
- (void)setProbingPatternEndTime:(unint64_t)a3;
- (void)setProbingPatternFaceDistance:(unsigned int)a3;
- (void)setProbingPatternFailure:(BOOL)a3;
- (void)setProbingPatternFrameCount:(unsigned int)a3;
- (void)setProbingPatternFrameDenseCount:(unsigned int)a3;
- (void)setProbingPatternFrameFloodCount:(unsigned int)a3;
- (void)setProbingPatternFrameSparseCount:(unsigned int)a3;
- (void)setProbingPatternResult:(int)a3;
- (void)setRfcFrameIndex:(int64_t)a3;
- (void)setRfcSetIndex:(int64_t)a3;
- (void)setSensorTemperature:(int)a3;
- (void)setShortTermTemplateAge:(int)a3;
- (void)setTimeSinceSleep:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBiometricKitMatchAttempt

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDBiometricKitMatchAttempt;
  [(AWDBiometricKitMatchAttempt *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasTimestamp
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setOverallResult:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x20000000u;
  self->_overallResult = a3;
}

- (void)setHasOverallResult:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xDFFFFFFF | v3;
}

- (BOOL)hasOverallResult
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 29) & 1;
}

- (void)setOverallTime:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_overallTime = a3;
}

- (void)setHasOverallTime:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasOverallTime
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (void)setFaceDetectEndTime:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_faceDetectEndTime = a3;
}

- (void)setHasFaceDetectEndTime:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasFaceDetectEndTime
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setFaceDetectResult:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_faceDetectResult = a3;
}

- (void)setHasFaceDetectResult:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectResult
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (void)setFaceDetectFrameCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_faceDetectFrameCount = a3;
}

- (void)setHasFaceDetectFrameCount:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectFrameCount
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (void)setFaceDetectFrameFloodCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_faceDetectFrameFloodCount = a3;
}

- (void)setHasFaceDetectFrameFloodCount:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectFrameFloodCount
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)setFaceDetectFrameSparseCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_faceDetectFrameSparseCount = a3;
}

- (void)setHasFaceDetectFrameSparseCount:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectFrameSparseCount
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (void)setFaceDetectFrameDenseCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_faceDetectFrameDenseCount = a3;
}

- (void)setHasFaceDetectFrameDenseCount:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectFrameDenseCount
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (void)setBioCheckEndTime:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_bioCheckEndTime = a3;
}

- (void)setHasBioCheckEndTime:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasBioCheckEndTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBioCheckResult:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_bioCheckResult = a3;
}

- (void)setHasBioCheckResult:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasBioCheckResult
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setBioCheckFrameCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_bioCheckFrameCount = a3;
}

- (void)setHasBioCheckFrameCount:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasBioCheckFrameCount
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setBioCheckFrameFloodCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_bioCheckFrameFloodCount = a3;
}

- (void)setHasBioCheckFrameFloodCount:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasBioCheckFrameFloodCount
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setBioCheckFrameSparseCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_bioCheckFrameSparseCount = a3;
}

- (void)setHasBioCheckFrameSparseCount:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasBioCheckFrameSparseCount
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setBioCheckFrameDenseCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_bioCheckFrameDenseCount = a3;
}

- (void)setHasBioCheckFrameDenseCount:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasBioCheckFrameDenseCount
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setProbingPatternEndTime:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_probingPatternEndTime = a3;
}

- (void)setHasProbingPatternEndTime:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasProbingPatternEndTime
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setProbingPatternResult:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 2u;
  self->_probingPatternResult = a3;
}

- (void)setHasProbingPatternResult:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFFD | v3;
}

- (BOOL)hasProbingPatternResult
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 1) & 1;
}

- (void)setProbingPatternFrameCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_probingPatternFrameCount = a3;
}

- (void)setHasProbingPatternFrameCount:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternFrameCount
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (void)setProbingPatternFrameFloodCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_probingPatternFrameFloodCount = a3;
}

- (void)setHasProbingPatternFrameFloodCount:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasProbingPatternFrameFloodCount
{
  return *(void *)&self->_has >> 63;
}

- (void)setProbingPatternFrameSparseCount:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 1u;
  self->_probingPatternFrameSparseCount = a3;
}

- (void)setHasProbingPatternFrameSparseCount:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFFE | a3;
}

- (BOOL)hasProbingPatternFrameSparseCount
{
  return *((_DWORD *)&self->_has + 2) & 1;
}

- (void)setProbingPatternFrameDenseCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_probingPatternFrameDenseCount = a3;
}

- (void)setHasProbingPatternFrameDenseCount:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternFrameDenseCount
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setAmbientLux:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_ambientLux = a3;
}

- (void)setHasAmbientLux:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasAmbientLux
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (void)setProbingPatternFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x80000000;
  self->_probingPatternFailure = a3;
}

- (void)setHasProbingPatternFailure:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = v3 & 0x80000000 | *((_DWORD *)&self->_has + 2) & 0x7FFFFFFF;
}

- (BOOL)hasProbingPatternFailure
{
  return (unint64_t)*((unsigned int *)&self->_has + 2) >> 31;
}

- (void)setMatcherFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x8000000u;
  self->_matcherFailure = a3;
}

- (void)setHasMatcherFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xF7FFFFFF | v3;
}

- (BOOL)hasMatcherFailure
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 27) & 1;
}

- (void)setMatchDepthFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x1000000u;
  self->_matchDepthFailure = a3;
}

- (void)setHasMatchDepthFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFEFFFFFF | v3;
}

- (BOOL)hasMatchDepthFailure
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 24) & 1;
}

- (void)setMatchFloodFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x2000000u;
  self->_matchFloodFailure = a3;
}

- (void)setHasMatchFloodFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFDFFFFFF | v3;
}

- (BOOL)hasMatchFloodFailure
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 25) & 1;
}

- (void)setAsFloodFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x40u;
  self->_asFloodFailure = a3;
}

- (void)setHasAsFloodFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFBF | v3;
}

- (BOOL)hasAsFloodFailure
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 6) & 1;
}

- (void)setAsDepthFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x10u;
  self->_asDepthFailure = a3;
}

- (void)setHasAsDepthFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFEF | v3;
}

- (BOOL)hasAsDepthFailure
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 4) & 1;
}

- (void)setOnlineTemplateUpdated:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x10000000u;
  self->_onlineTemplateUpdated = a3;
}

- (void)setHasOnlineTemplateUpdated:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xEFFFFFFF | v3;
}

- (BOOL)hasOnlineTemplateUpdated
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 28) & 1;
}

- (void)setPasscodeChallengeAllowed:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x40000000u;
  self->_passcodeChallengeAllowed = a3;
}

- (void)setHasPasscodeChallengeAllowed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xBFFFFFFF | v3;
}

- (BOOL)hasPasscodeChallengeAllowed
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 30) & 1;
}

- (void)setFeatureGenerationError:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_featureGenerationError = a3;
}

- (void)setHasFeatureGenerationError:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFeatureGenerationError
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setSensorTemperature:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 4u;
  self->_sensorTemperature = a3;
}

- (void)setHasSensorTemperature:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFFB | v3;
}

- (BOOL)hasSensorTemperature
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 2) & 1;
}

- (void)setFaceDistance:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_faceDistance = a3;
}

- (void)setHasFaceDistance:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDistance
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (void)setHasOcclusion:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x400000u;
  self->_hasOcclusion = a3;
}

- (void)setHasHasOcclusion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFBFFFFF | v3;
}

- (BOOL)hasHasOcclusion
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 22) & 1;
}

- (void)setCamRectX:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_camRectX = a3;
}

- (void)setHasCamRectX:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasCamRectX
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setCamRectY:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_camRectY = a3;
}

- (void)setHasCamRectY:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasCamRectY
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setCamRectW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_camRectW = a3;
}

- (void)setHasCamRectW:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasCamRectW
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setCamRectH:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_camRectH = a3;
}

- (void)setHasCamRectH:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasCamRectH
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setFaceDetectPPMRequestedBudget:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_faceDetectPPMRequestedBudget = a3;
}

- (void)setHasFaceDetectPPMRequestedBudget:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectPPMRequestedBudget
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (void)setFaceDetectPPMAllocatedBudget:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_faceDetectPPMAllocatedBudget = a3;
}

- (void)setHasFaceDetectPPMAllocatedBudget:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectPPMAllocatedBudget
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (void)setBioCheckPPMRequestedBudget:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_bioCheckPPMRequestedBudget = a3;
}

- (void)setHasBioCheckPPMRequestedBudget:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasBioCheckPPMRequestedBudget
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (void)setBioCheckPPMAllocatedBudget:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_bioCheckPPMAllocatedBudget = a3;
}

- (void)setHasBioCheckPPMAllocatedBudget:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasBioCheckPPMAllocatedBudget
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setRfcSetIndex:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_rfcSetIndex = a3;
}

- (void)setHasRfcSetIndex:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasRfcSetIndex
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (void)setRfcFrameIndex:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_rfcFrameIndex = a3;
}

- (void)setHasRfcFrameIndex:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasRfcFrameIndex
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (void)setBioLockout:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x400u;
  self->_bioLockout = a3;
}

- (void)setHasBioLockout:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFBFF | v3;
}

- (BOOL)hasBioLockout
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 10) & 1;
}

- (void)setCameraErr:(int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_cameraErr = a3;
}

- (void)setHasCameraErr:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasCameraErr
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setMatchForUnlock:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x4000000u;
  self->_matchForUnlock = a3;
}

- (void)setHasMatchForUnlock:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFBFFFFFF | v3;
}

- (BOOL)hasMatchForUnlock
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 26) & 1;
}

- (void)setFailedUnlockAttemptsFromFD:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_failedUnlockAttemptsFromFD = a3;
}

- (void)setHasFailedUnlockAttemptsFromFD:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFailedUnlockAttemptsFromFD
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setFailedUnlockAttemptsFromBiocheck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_failedUnlockAttemptsFromBiocheck = a3;
}

- (void)setHasFailedUnlockAttemptsFromBiocheck:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFailedUnlockAttemptsFromBiocheck
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setFailedMatchAttemptsFromFD:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_failedMatchAttemptsFromFD = a3;
}

- (void)setHasFailedMatchAttemptsFromFD:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFailedMatchAttemptsFromFD
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setFailedMatchAttemptsFromBiocheck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_failedMatchAttemptsFromBiocheck = a3;
}

- (void)setHasFailedMatchAttemptsFromBiocheck:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasFailedMatchAttemptsFromBiocheck
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setBioLockoutReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_bioLockoutReason = a3;
}

- (void)setHasBioLockoutReason:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasBioLockoutReason
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setMatchFeatureVectorError:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_matchFeatureVectorError = a3;
}

- (void)setHasMatchFeatureVectorError:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMatchFeatureVectorError
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setOnlineTemplateAge:(int)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_onlineTemplateAge = a3;
}

- (void)setHasOnlineTemplateAge:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOnlineTemplateAge
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setShortTermTemplateAge:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 8u;
  self->_shortTermTemplateAge = a3;
}

- (void)setHasShortTermTemplateAge:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFF7 | v3;
}

- (BOOL)hasShortTermTemplateAge
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 3) & 1;
}

- (void)setFaceDetectFaceDistance:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_faceDetectFaceDistance = a3;
}

- (void)setHasFaceDetectFaceDistance:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectFaceDistance
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (void)setFaceDetectCamRectX:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_faceDetectCamRectX = a3;
}

- (void)setHasFaceDetectCamRectX:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectCamRectX
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setFaceDetectCamRectY:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_faceDetectCamRectY = a3;
}

- (void)setHasFaceDetectCamRectY:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectCamRectY
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setFaceDetectCamRectW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_faceDetectCamRectW = a3;
}

- (void)setHasFaceDetectCamRectW:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectCamRectW
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setFaceDetectCamRectH:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_faceDetectCamRectH = a3;
}

- (void)setHasFaceDetectCamRectH:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasFaceDetectCamRectH
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (void)setBioCheckFaceDistance:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_bioCheckFaceDistance = a3;
}

- (void)setHasBioCheckFaceDistance:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasBioCheckFaceDistance
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (void)setBioCheckCamRectX:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_bioCheckCamRectX = a3;
}

- (void)setHasBioCheckCamRectX:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasBioCheckCamRectX
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setBioCheckCamRectY:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_bioCheckCamRectY = a3;
}

- (void)setHasBioCheckCamRectY:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasBioCheckCamRectY
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (void)setBioCheckCamRectW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_bioCheckCamRectW = a3;
}

- (void)setHasBioCheckCamRectW:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasBioCheckCamRectW
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setBioCheckCamRectH:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_bioCheckCamRectH = a3;
}

- (void)setHasBioCheckCamRectH:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasBioCheckCamRectH
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setProbingPatternFaceDistance:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_probingPatternFaceDistance = a3;
}

- (void)setHasProbingPatternFaceDistance:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternFaceDistance
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setProbingPatternCamRectX:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_probingPatternCamRectX = a3;
}

- (void)setHasProbingPatternCamRectX:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternCamRectX
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (void)setProbingPatternCamRectY:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_probingPatternCamRectY = a3;
}

- (void)setHasProbingPatternCamRectY:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternCamRectY
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setProbingPatternCamRectW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_probingPatternCamRectW = a3;
}

- (void)setHasProbingPatternCamRectW:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternCamRectW
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (void)setProbingPatternCamRectH:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_probingPatternCamRectH = a3;
}

- (void)setHasProbingPatternCamRectH:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProbingPatternCamRectH
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setAsFailure:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x20u;
  self->_asFailure = a3;
}

- (void)setHasAsFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFDF | v3;
}

- (BOOL)hasAsFailure
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 5) & 1;
}

- (void)setAutoRetry:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x80u;
  self->_autoRetry = a3;
}

- (void)setHasAutoRetry:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFF7F | v3;
}

- (BOOL)hasAutoRetry
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 7) & 1;
}

- (void)setAutoRetryAllowed:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x100u;
  self->_autoRetryAllowed = a3;
}

- (void)setHasAutoRetryAllowed:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFEFF | v3;
}

- (BOOL)hasAutoRetryAllowed
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 8) & 1;
}

- (void)setDeviceOrientation:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasDeviceOrientation
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setMatchIdentityCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_matchIdentityCount = a3;
}

- (void)setHasMatchIdentityCount:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMatchIdentityCount
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (BOOL)hasCameraHWParameters
{
  return self->_cameraHWParameters != 0;
}

- (void)setCaptureMethod:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_captureMethod = a3;
}

- (void)setHasCaptureMethod:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasCaptureMethod
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setEngagementInfoFeedbackNoFaceDetected:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x20000u;
  self->_engagementInfoFeedbackNoFaceDetected = a3;
}

- (void)setHasEngagementInfoFeedbackNoFaceDetected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFDFFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackNoFaceDetected
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 17) & 1;
}

- (void)setEngagementInfoFeedbackFaceTooClose:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x4000u;
  self->_engagementInfoFeedbackFaceTooClose = a3;
}

- (void)setHasEngagementInfoFeedbackFaceTooClose:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFBFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackFaceTooClose
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 14) & 1;
}

- (void)setEngagementInfoFeedbackFaceTooFar:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x8000u;
  self->_engagementInfoFeedbackFaceTooFar = a3;
}

- (void)setHasEngagementInfoFeedbackFaceTooFar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFF7FFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackFaceTooFar
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 15) & 1;
}

- (void)setEngagementInfoFeedbackPoseOutOfRange:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x200000u;
  self->_engagementInfoFeedbackPoseOutOfRange = a3;
}

- (void)setHasEngagementInfoFeedbackPoseOutOfRange:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFDFFFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackPoseOutOfRange
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 21) & 1;
}

- (void)setEngagementInfoFeedbackNoAttention:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x10000u;
  self->_engagementInfoFeedbackNoAttention = a3;
}

- (void)setHasEngagementInfoFeedbackNoAttention:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFEFFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackNoAttention
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 16) & 1;
}

- (void)setEngagementInfoFeedbackFaceOccluded:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x2000u;
  self->_engagementInfoFeedbackFaceOccluded = a3;
}

- (void)setHasEngagementInfoFeedbackFaceOccluded:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFDFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackFaceOccluded
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 13) & 1;
}

- (void)setEngagementInfoFeedbackCameraObstructed:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x1000u;
  self->_engagementInfoFeedbackCameraObstructed = a3;
}

- (void)setHasEngagementInfoFeedbackCameraObstructed:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFEFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackCameraObstructed
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 12) & 1;
}

- (void)setEngagementInfoFeedbackPartialOutOfFOV:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x80000u;
  self->_engagementInfoFeedbackPartialOutOfFOV = a3;
}

- (void)setHasEngagementInfoFeedbackPartialOutOfFOV:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFF7FFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackPartialOutOfFOV
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 19) & 1;
}

- (void)setCombinedSequenceEnabled:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x800u;
  self->_combinedSequenceEnabled = a3;
}

- (void)setHasCombinedSequenceEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFF7FF | v3;
}

- (BOOL)hasCombinedSequenceEnabled
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 11) & 1;
}

- (void)setOverallTimeWithRetries:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_overallTimeWithRetries = a3;
}

- (void)setHasOverallTimeWithRetries:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasOverallTimeWithRetries
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (void)setAutoRetryEnabled:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x200u;
  self->_autoRetryEnabled = a3;
}

- (void)setHasAutoRetryEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFDFF | v3;
}

- (BOOL)hasAutoRetryEnabled
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 9) & 1;
}

- (unint64_t)identityCreationTimesCount
{
  return self->_identityCreationTimes.count;
}

- (unint64_t)identityCreationTimes
{
  return self->_identityCreationTimes.list;
}

- (void)clearIdentityCreationTimes
{
}

- (void)addIdentityCreationTime:(unint64_t)a3
{
}

- (unint64_t)identityCreationTimeAtIndex:(unint64_t)a3
{
  p_identityCreationTimes = &self->_identityCreationTimes;
  unint64_t count = self->_identityCreationTimes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_identityCreationTimes->list[a3];
}

- (void)setIdentityCreationTimes:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)setMatchCancelled:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x800000u;
  self->_matchCancelled = a3;
}

- (void)setHasMatchCancelled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFF7FFFFF | v3;
}

- (BOOL)hasMatchCancelled
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 23) & 1;
}

- (void)setEngagementInfoFeedbackPoseMarginal:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x100000u;
  self->_engagementInfoFeedbackPoseMarginal = a3;
}

- (void)setHasEngagementInfoFeedbackPoseMarginal:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFEFFFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackPoseMarginal
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 20) & 1;
}

- (void)setFaceOrientation:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_faceOrientation = a3;
}

- (void)setHasFaceOrientation:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceOrientation
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (void)setFacePitch:(int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_facePitch = a3;
}

- (void)setHasFacePitch:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFacePitch
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setFaceYaw:(int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_faceYaw = a3;
}

- (void)setHasFaceYaw:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceYaw
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (void)setFaceRoll:(int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_faceRoll = a3;
}

- (void)setHasFaceRoll:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFaceRoll
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setTimeSinceSleep:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_timeSinceSleep = a3;
}

- (void)setHasTimeSinceSleep:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasTimeSinceSleep
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setEngagementInfoFeedbackNoseAndMouthOccluded:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x40000u;
  self->_engagementInfoFeedbackNoseAndMouthOccluded = a3;
}

- (void)setHasEngagementInfoFeedbackNoseAndMouthOccluded:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFBFFFF | v3;
}

- (BOOL)hasEngagementInfoFeedbackNoseAndMouthOccluded
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 18) & 1;
}

- (void)setMatchType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_matchType = a3;
}

- (void)setHasMatchType:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMatchType
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDBiometricKitMatchAttempt;
  v4 = [(AWDBiometricKitMatchAttempt *)&v8 description];
  v5 = [(AWDBiometricKitMatchAttempt *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    uint64_t has = (uint64_t)self->_has;
  }
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x20000000) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_overallResult];
    [v3 setObject:v17 forKey:@"overallResult"];

    uint64_t has = (uint64_t)self->_has;
    int v6 = *((_DWORD *)&self->_has + 2);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_99;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v18 = [NSNumber numberWithUnsignedLongLong:self->_overallTime];
  [v3 setObject:v18 forKey:@"overallTime"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_100;
  }
LABEL_99:
  v19 = [NSNumber numberWithUnsignedLongLong:self->_faceDetectEndTime];
  [v3 setObject:v19 forKey:@"faceDetectEndTime"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((has & 0x800000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_101;
  }
LABEL_100:
  v20 = [NSNumber numberWithUnsignedInt:self->_faceDetectResult];
  [v3 setObject:v20 forKey:@"faceDetectResult"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_8:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_102;
  }
LABEL_101:
  v21 = [NSNumber numberWithUnsignedInt:self->_faceDetectFrameCount];
  [v3 setObject:v21 forKey:@"faceDetectFrameCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_103;
  }
LABEL_102:
  v22 = [NSNumber numberWithUnsignedInt:self->_faceDetectFrameFloodCount];
  [v3 setObject:v22 forKey:@"faceDetectFrameFloodCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000) == 0)
  {
LABEL_10:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_104;
  }
LABEL_103:
  v23 = [NSNumber numberWithUnsignedInt:self->_faceDetectFrameSparseCount];
  [v3 setObject:v23 forKey:@"faceDetectFrameSparseCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_105;
  }
LABEL_104:
  v24 = [NSNumber numberWithUnsignedInt:self->_faceDetectFrameDenseCount];
  [v3 setObject:v24 forKey:@"faceDetectFrameDenseCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_106;
  }
LABEL_105:
  v25 = [NSNumber numberWithUnsignedLongLong:self->_bioCheckEndTime];
  [v3 setObject:v25 forKey:@"bioCheckEndTime"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000) == 0)
  {
LABEL_13:
    if ((has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_107;
  }
LABEL_106:
  v26 = [NSNumber numberWithInt:self->_bioCheckResult];
  [v3 setObject:v26 forKey:@"bioCheckResult"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000) == 0)
  {
LABEL_14:
    if ((has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_108;
  }
LABEL_107:
  v27 = [NSNumber numberWithUnsignedInt:self->_bioCheckFrameCount];
  [v3 setObject:v27 forKey:@"bioCheckFrameCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000) == 0)
  {
LABEL_15:
    if ((has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_109;
  }
LABEL_108:
  v28 = [NSNumber numberWithUnsignedInt:self->_bioCheckFrameFloodCount];
  [v3 setObject:v28 forKey:@"bioCheckFrameFloodCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000) == 0)
  {
LABEL_16:
    if ((has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_110;
  }
LABEL_109:
  v29 = [NSNumber numberWithUnsignedInt:self->_bioCheckFrameSparseCount];
  [v3 setObject:v29 forKey:@"bioCheckFrameSparseCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_111;
  }
LABEL_110:
  v30 = [NSNumber numberWithUnsignedInt:self->_bioCheckFrameDenseCount];
  [v3 setObject:v30 forKey:@"bioCheckFrameDenseCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_112;
  }
LABEL_111:
  v31 = [NSNumber numberWithUnsignedLongLong:self->_probingPatternEndTime];
  [v3 setObject:v31 forKey:@"probingPatternEndTime"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_113;
  }
LABEL_112:
  v32 = [NSNumber numberWithInt:self->_probingPatternResult];
  [v3 setObject:v32 forKey:@"probingPatternResult"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_20:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_114;
  }
LABEL_113:
  v33 = [NSNumber numberWithUnsignedInt:self->_probingPatternFrameCount];
  [v3 setObject:v33 forKey:@"probingPatternFrameCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_115;
  }
LABEL_114:
  v34 = [NSNumber numberWithUnsignedInt:self->_probingPatternFrameFloodCount];
  [v3 setObject:v34 forKey:@"probingPatternFrameFloodCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_116;
  }
LABEL_115:
  v35 = [NSNumber numberWithUnsignedInt:self->_probingPatternFrameSparseCount];
  [v3 setObject:v35 forKey:@"probingPatternFrameSparseCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_117;
  }
LABEL_116:
  v36 = [NSNumber numberWithUnsignedInt:self->_probingPatternFrameDenseCount];
  [v3 setObject:v36 forKey:@"probingPatternFrameDenseCount"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_118;
  }
LABEL_117:
  v37 = [NSNumber numberWithInt:self->_ambientLux];
  [v3 setObject:v37 forKey:@"ambientLux"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_119;
  }
LABEL_118:
  v38 = [NSNumber numberWithBool:self->_probingPatternFailure];
  [v3 setObject:v38 forKey:@"probingPatternFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_120;
  }
LABEL_119:
  v39 = [NSNumber numberWithBool:self->_matcherFailure];
  [v3 setObject:v39 forKey:@"matcherFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_121;
  }
LABEL_120:
  v40 = [NSNumber numberWithBool:self->_matchDepthFailure];
  [v3 setObject:v40 forKey:@"matchDepthFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_122;
  }
LABEL_121:
  v41 = [NSNumber numberWithBool:self->_matchFloodFailure];
  [v3 setObject:v41 forKey:@"matchFloodFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x40) == 0)
  {
LABEL_29:
    if ((v6 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_123;
  }
LABEL_122:
  v42 = [NSNumber numberWithBool:self->_asFloodFailure];
  [v3 setObject:v42 forKey:@"asFloodFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x10) == 0)
  {
LABEL_30:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_124;
  }
LABEL_123:
  v43 = [NSNumber numberWithBool:self->_asDepthFailure];
  [v3 setObject:v43 forKey:@"asDepthFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_125;
  }
LABEL_124:
  v44 = [NSNumber numberWithBool:self->_onlineTemplateUpdated];
  [v3 setObject:v44 forKey:@"onlineTemplateUpdated"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_32:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_126;
  }
LABEL_125:
  v45 = [NSNumber numberWithBool:self->_passcodeChallengeAllowed];
  [v3 setObject:v45 forKey:@"passcodeChallengeAllowed"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_33:
    if ((v6 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_127;
  }
LABEL_126:
  v46 = [NSNumber numberWithUnsignedInt:self->_featureGenerationError];
  [v3 setObject:v46 forKey:@"featureGenerationError"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 4) == 0)
  {
LABEL_34:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_128;
  }
LABEL_127:
  v47 = [NSNumber numberWithInt:self->_sensorTemperature];
  [v3 setObject:v47 forKey:@"sensorTemperature"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_129;
  }
LABEL_128:
  v48 = [NSNumber numberWithUnsignedInt:self->_faceDistance];
  [v3 setObject:v48 forKey:@"faceDistance"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x400000) == 0)
  {
LABEL_36:
    if ((has & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_130;
  }
LABEL_129:
  v49 = [NSNumber numberWithBool:self->_hasOcclusion];
  [v3 setObject:v49 forKey:@"hasOcclusion"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000) == 0)
  {
LABEL_37:
    if ((has & 0x4000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_131;
  }
LABEL_130:
  v50 = [NSNumber numberWithUnsignedInt:self->_camRectX];
  [v3 setObject:v50 forKey:@"camRectX"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000) == 0)
  {
LABEL_38:
    if ((has & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_132;
  }
LABEL_131:
  v51 = [NSNumber numberWithUnsignedInt:self->_camRectY];
  [v3 setObject:v51 forKey:@"camRectY"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000) == 0)
  {
LABEL_39:
    if ((has & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_133;
  }
LABEL_132:
  v52 = [NSNumber numberWithUnsignedInt:self->_camRectW];
  [v3 setObject:v52 forKey:@"camRectW"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_134;
  }
LABEL_133:
  v53 = [NSNumber numberWithUnsignedInt:self->_camRectH];
  [v3 setObject:v53 forKey:@"camRectH"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_135;
  }
LABEL_134:
  v54 = [NSNumber numberWithUnsignedInt:self->_faceDetectPPMRequestedBudget];
  [v3 setObject:v54 forKey:@"faceDetectPPMRequestedBudget"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_136;
  }
LABEL_135:
  v55 = [NSNumber numberWithUnsignedInt:self->_faceDetectPPMAllocatedBudget];
  [v3 setObject:v55 forKey:@"faceDetectPPMAllocatedBudget"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000) == 0)
  {
LABEL_43:
    if ((has & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_137;
  }
LABEL_136:
  v56 = [NSNumber numberWithUnsignedInt:self->_bioCheckPPMRequestedBudget];
  [v3 setObject:v56 forKey:@"bioCheckPPMRequestedBudget"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000) == 0)
  {
LABEL_44:
    if ((has & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_138;
  }
LABEL_137:
  v57 = [NSNumber numberWithUnsignedInt:self->_bioCheckPPMAllocatedBudget];
  [v3 setObject:v57 forKey:@"bioCheckPPMAllocatedBudget"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40) == 0)
  {
LABEL_45:
    if ((has & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_139;
  }
LABEL_138:
  v58 = [NSNumber numberWithLongLong:self->_rfcSetIndex];
  [v3 setObject:v58 forKey:@"rfcSetIndex"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_46:
    if ((v6 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_140;
  }
LABEL_139:
  v59 = [NSNumber numberWithLongLong:self->_rfcFrameIndex];
  [v3 setObject:v59 forKey:@"rfcFrameIndex"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x400) == 0)
  {
LABEL_47:
    if ((has & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_141;
  }
LABEL_140:
  v60 = [NSNumber numberWithBool:self->_bioLockout];
  [v3 setObject:v60 forKey:@"bioLockout"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_142;
  }
LABEL_141:
  v61 = [NSNumber numberWithInt:self->_cameraErr];
  [v3 setObject:v61 forKey:@"cameraErr"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_49:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_143;
  }
LABEL_142:
  v62 = [NSNumber numberWithBool:self->_matchForUnlock];
  [v3 setObject:v62 forKey:@"matchForUnlock"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_144;
  }
LABEL_143:
  v63 = [NSNumber numberWithUnsignedInt:self->_failedUnlockAttemptsFromFD];
  [v3 setObject:v63 forKey:@"failedUnlockAttemptsFromFD"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_145;
  }
LABEL_144:
  v64 = [NSNumber numberWithUnsignedInt:self->_failedUnlockAttemptsFromBiocheck];
  [v3 setObject:v64 forKey:@"failedUnlockAttemptsFromBiocheck"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_146;
  }
LABEL_145:
  v65 = [NSNumber numberWithUnsignedInt:self->_failedMatchAttemptsFromFD];
  [v3 setObject:v65 forKey:@"failedMatchAttemptsFromFD"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000) == 0)
  {
LABEL_53:
    if ((has & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_147;
  }
LABEL_146:
  v66 = [NSNumber numberWithUnsignedInt:self->_failedMatchAttemptsFromBiocheck];
  [v3 setObject:v66 forKey:@"failedMatchAttemptsFromBiocheck"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000) == 0)
  {
LABEL_54:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_148;
  }
LABEL_147:
  v67 = [NSNumber numberWithUnsignedInt:self->_bioLockoutReason];
  [v3 setObject:v67 forKey:@"bioLockoutReason"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_149;
  }
LABEL_148:
  v68 = [NSNumber numberWithUnsignedInt:self->_matchFeatureVectorError];
  [v3 setObject:v68 forKey:@"matchFeatureVectorError"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_56:
    if ((v6 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_150;
  }
LABEL_149:
  v69 = [NSNumber numberWithInt:self->_onlineTemplateAge];
  [v3 setObject:v69 forKey:@"onlineTemplateAge"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 8) == 0)
  {
LABEL_57:
    if ((has & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_151;
  }
LABEL_150:
  v70 = [NSNumber numberWithInt:self->_shortTermTemplateAge];
  [v3 setObject:v70 forKey:@"shortTermTemplateAge"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000) == 0)
  {
LABEL_58:
    if ((has & 0x100000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_152;
  }
LABEL_151:
  v71 = [NSNumber numberWithUnsignedInt:self->_faceDetectFaceDistance];
  [v3 setObject:v71 forKey:@"faceDetectFaceDistance"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_153;
  }
LABEL_152:
  v72 = [NSNumber numberWithUnsignedInt:self->_faceDetectCamRectX];
  [v3 setObject:v72 forKey:@"faceDetectCamRectX"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000) == 0)
  {
LABEL_60:
    if ((has & 0x80000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_154;
  }
LABEL_153:
  v73 = [NSNumber numberWithUnsignedInt:self->_faceDetectCamRectY];
  [v3 setObject:v73 forKey:@"faceDetectCamRectY"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000) == 0)
  {
LABEL_61:
    if ((has & 0x40000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_155;
  }
LABEL_154:
  v74 = [NSNumber numberWithUnsignedInt:self->_faceDetectCamRectW];
  [v3 setObject:v74 forKey:@"faceDetectCamRectW"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000) == 0)
  {
LABEL_62:
    if ((has & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_156;
  }
LABEL_155:
  v75 = [NSNumber numberWithUnsignedInt:self->_faceDetectCamRectH];
  [v3 setObject:v75 forKey:@"faceDetectCamRectH"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000) == 0)
  {
LABEL_63:
    if ((has & 0x1000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_157;
  }
LABEL_156:
  v76 = [NSNumber numberWithUnsignedInt:self->_bioCheckFaceDistance];
  [v3 setObject:v76 forKey:@"bioCheckFaceDistance"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000) == 0)
  {
LABEL_64:
    if ((has & 0x2000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_158;
  }
LABEL_157:
  v77 = [NSNumber numberWithUnsignedInt:self->_bioCheckCamRectX];
  [v3 setObject:v77 forKey:@"bioCheckCamRectX"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000) == 0)
  {
LABEL_65:
    if ((has & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_159;
  }
LABEL_158:
  v78 = [NSNumber numberWithUnsignedInt:self->_bioCheckCamRectY];
  [v3 setObject:v78 forKey:@"bioCheckCamRectY"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800) == 0)
  {
LABEL_66:
    if ((has & 0x400) == 0) {
      goto LABEL_67;
    }
    goto LABEL_160;
  }
LABEL_159:
  v79 = [NSNumber numberWithUnsignedInt:self->_bioCheckCamRectW];
  [v3 setObject:v79 forKey:@"bioCheckCamRectW"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400) == 0)
  {
LABEL_67:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_161;
  }
LABEL_160:
  v80 = [NSNumber numberWithUnsignedInt:self->_bioCheckCamRectH];
  [v3 setObject:v80 forKey:@"bioCheckCamRectH"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_68:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_162;
  }
LABEL_161:
  v81 = [NSNumber numberWithUnsignedInt:self->_probingPatternFaceDistance];
  [v3 setObject:v81 forKey:@"probingPatternFaceDistance"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_69:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_163;
  }
LABEL_162:
  v82 = [NSNumber numberWithUnsignedInt:self->_probingPatternCamRectX];
  [v3 setObject:v82 forKey:@"probingPatternCamRectX"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_70:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_164;
  }
LABEL_163:
  v83 = [NSNumber numberWithUnsignedInt:self->_probingPatternCamRectY];
  [v3 setObject:v83 forKey:@"probingPatternCamRectY"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_71:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_165;
  }
LABEL_164:
  v84 = [NSNumber numberWithUnsignedInt:self->_probingPatternCamRectW];
  [v3 setObject:v84 forKey:@"probingPatternCamRectW"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_72:
    if ((v6 & 0x20) == 0) {
      goto LABEL_73;
    }
    goto LABEL_166;
  }
LABEL_165:
  v85 = [NSNumber numberWithUnsignedInt:self->_probingPatternCamRectH];
  [v3 setObject:v85 forKey:@"probingPatternCamRectH"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x20) == 0)
  {
LABEL_73:
    if ((v6 & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_167;
  }
LABEL_166:
  v86 = [NSNumber numberWithBool:self->_asFailure];
  [v3 setObject:v86 forKey:@"asFailure"];

  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x80) == 0)
  {
LABEL_74:
    if ((v6 & 0x100) == 0) {
      goto LABEL_75;
    }
    goto LABEL_168;
  }
LABEL_167:
  v87 = [NSNumber numberWithBool:self->_autoRetry];
  [v3 setObject:v87 forKey:@"autoRetry"];

  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_75:
    if ((has & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_169;
  }
LABEL_168:
  v88 = [NSNumber numberWithBool:self->_autoRetryAllowed];
  [v3 setObject:v88 forKey:@"autoRetryAllowed"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_76:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_169:
  v89 = [NSNumber numberWithUnsignedInt:self->_deviceOrientation];
  [v3 setObject:v89 forKey:@"deviceOrientation"];

  if ((*(void *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_77:
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_matchIdentityCount];
    [v3 setObject:v7 forKey:@"matchIdentityCount"];
  }
LABEL_78:
  cameraHWParameters = self->_cameraHWParameters;
  if (cameraHWParameters) {
    [v3 setObject:cameraHWParameters forKey:@"cameraHWParameters"];
  }
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x10000000) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_captureMethod];
    [v3 setObject:v10 forKey:@"captureMethod"];

    uint64_t v9 = (uint64_t)self->_has;
  }
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x20000) != 0)
  {
    v90 = [NSNumber numberWithBool:self->_engagementInfoFeedbackNoFaceDetected];
    [v3 setObject:v90 forKey:@"engagementInfoFeedbackNoFaceDetected"];

    uint64_t v9 = (uint64_t)self->_has;
    int v11 = *((_DWORD *)&self->_has + 2);
    if ((v11 & 0x4000) == 0)
    {
LABEL_84:
      if ((v11 & 0x8000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_173;
    }
  }
  else if ((v11 & 0x4000) == 0)
  {
    goto LABEL_84;
  }
  v91 = [NSNumber numberWithBool:self->_engagementInfoFeedbackFaceTooClose];
  [v3 setObject:v91 forKey:@"engagementInfoFeedbackFaceTooClose"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x8000) == 0)
  {
LABEL_85:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_174;
  }
LABEL_173:
  v92 = [NSNumber numberWithBool:self->_engagementInfoFeedbackFaceTooFar];
  [v3 setObject:v92 forKey:@"engagementInfoFeedbackFaceTooFar"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x200000) == 0)
  {
LABEL_86:
    if ((v11 & 0x10000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_175;
  }
LABEL_174:
  v93 = [NSNumber numberWithBool:self->_engagementInfoFeedbackPoseOutOfRange];
  [v3 setObject:v93 forKey:@"engagementInfoFeedbackPoseOutOfRange"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000) == 0)
  {
LABEL_87:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_176;
  }
LABEL_175:
  v94 = [NSNumber numberWithBool:self->_engagementInfoFeedbackNoAttention];
  [v3 setObject:v94 forKey:@"engagementInfoFeedbackNoAttention"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x2000) == 0)
  {
LABEL_88:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_177;
  }
LABEL_176:
  v95 = [NSNumber numberWithBool:self->_engagementInfoFeedbackFaceOccluded];
  [v3 setObject:v95 forKey:@"engagementInfoFeedbackFaceOccluded"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x1000) == 0)
  {
LABEL_89:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_178;
  }
LABEL_177:
  v96 = [NSNumber numberWithBool:self->_engagementInfoFeedbackCameraObstructed];
  [v3 setObject:v96 forKey:@"engagementInfoFeedbackCameraObstructed"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80000) == 0)
  {
LABEL_90:
    if ((v11 & 0x800) == 0) {
      goto LABEL_91;
    }
    goto LABEL_179;
  }
LABEL_178:
  v97 = [NSNumber numberWithBool:self->_engagementInfoFeedbackPartialOutOfFOV];
  [v3 setObject:v97 forKey:@"engagementInfoFeedbackPartialOutOfFOV"];

  uint64_t v9 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800) == 0)
  {
LABEL_91:
    if ((v9 & 8) == 0) {
      goto LABEL_92;
    }
    goto LABEL_180;
  }
LABEL_179:
  v98 = [NSNumber numberWithBool:self->_combinedSequenceEnabled];
  [v3 setObject:v98 forKey:@"combinedSequenceEnabled"];

  int v11 = *((_DWORD *)&self->_has + 2);
  if ((*(void *)&self->_has & 8) == 0)
  {
LABEL_92:
    if ((v11 & 0x200) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_180:
  v99 = [NSNumber numberWithUnsignedLongLong:self->_overallTimeWithRetries];
  [v3 setObject:v99 forKey:@"overallTimeWithRetries"];

  if ((*((_DWORD *)&self->_has + 2) & 0x200) != 0)
  {
LABEL_93:
    v12 = [NSNumber numberWithBool:self->_autoRetryEnabled];
    [v3 setObject:v12 forKey:@"autoRetryEnabled"];
  }
LABEL_94:
  v13 = PBRepeatedUInt64NSArray();
  [v3 setObject:v13 forKey:@"identityCreationTime"];

  p_uint64_t has = &self->_has;
  int v15 = *((_DWORD *)&self->_has + 2);
  if ((v15 & 0x800000) != 0)
  {
    v100 = [NSNumber numberWithBool:self->_matchCancelled];
    [v3 setObject:v100 forKey:@"matchCancelled"];

    uint64_t v16 = *(void *)p_has;
    int v15 = *((_DWORD *)&self->_has + 2);
    if ((v15 & 0x100000) == 0) {
      goto LABEL_184;
    }
    goto LABEL_183;
  }
  uint64_t v16 = *(void *)p_has;
  if ((v15 & 0x100000) != 0)
  {
LABEL_183:
    v101 = [NSNumber numberWithBool:self->_engagementInfoFeedbackPoseMarginal];
    [v3 setObject:v101 forKey:@"engagementInfoFeedbackPoseMarginal"];

    uint64_t v16 = (uint64_t)self->_has;
    int v15 = *((_DWORD *)&self->_has + 2);
  }
LABEL_184:
  if ((v16 & 0x80000000000) != 0)
  {
    v105 = [NSNumber numberWithUnsignedInt:self->_faceOrientation];
    [v3 setObject:v105 forKey:@"faceOrientation"];

    uint64_t v16 = (uint64_t)self->_has;
    int v15 = *((_DWORD *)&self->_has + 2);
    if ((v16 & 0x100000000000) == 0)
    {
LABEL_186:
      if ((v16 & 0x400000000000) == 0) {
        goto LABEL_187;
      }
      goto LABEL_195;
    }
  }
  else if ((v16 & 0x100000000000) == 0)
  {
    goto LABEL_186;
  }
  v106 = [NSNumber numberWithInt:self->_facePitch];
  [v3 setObject:v106 forKey:@"facePitch"];

  uint64_t v16 = (uint64_t)self->_has;
  int v15 = *((_DWORD *)&self->_has + 2);
  if ((v16 & 0x400000000000) == 0)
  {
LABEL_187:
    if ((v16 & 0x200000000000) == 0) {
      goto LABEL_188;
    }
    goto LABEL_196;
  }
LABEL_195:
  v107 = [NSNumber numberWithInt:self->_faceYaw];
  [v3 setObject:v107 forKey:@"faceYaw"];

  uint64_t v16 = (uint64_t)self->_has;
  int v15 = *((_DWORD *)&self->_has + 2);
  if ((v16 & 0x200000000000) == 0)
  {
LABEL_188:
    if ((v16 & 0x80) == 0) {
      goto LABEL_189;
    }
    goto LABEL_197;
  }
LABEL_196:
  v108 = [NSNumber numberWithInt:self->_faceRoll];
  [v3 setObject:v108 forKey:@"faceRoll"];

  uint64_t v16 = (uint64_t)self->_has;
  int v15 = *((_DWORD *)&self->_has + 2);
  if ((v16 & 0x80) == 0)
  {
LABEL_189:
    if ((v15 & 0x40000) == 0) {
      goto LABEL_190;
    }
LABEL_198:
    v110 = [NSNumber numberWithBool:self->_engagementInfoFeedbackNoseAndMouthOccluded];
    [v3 setObject:v110 forKey:@"engagementInfoFeedbackNoseAndMouthOccluded"];

    if ((*(void *)&self->_has & 0x40000000000000) == 0) {
      goto LABEL_192;
    }
    goto LABEL_191;
  }
LABEL_197:
  v109 = [NSNumber numberWithUnsignedLongLong:self->_timeSinceSleep];
  [v3 setObject:v109 forKey:@"timeSinceSleep"];

  uint64_t v16 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x40000) != 0) {
    goto LABEL_198;
  }
LABEL_190:
  if ((v16 & 0x40000000000000) != 0)
  {
LABEL_191:
    v102 = [NSNumber numberWithUnsignedInt:self->_matchType];
    [v3 setObject:v102 forKey:@"matchType"];
  }
LABEL_192:
  id v103 = v3;

  return v103;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBiometricKitMatchAttemptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  uint64_t has = (uint64_t)self->_has;
  id v13 = v4;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v13;
    uint64_t has = (uint64_t)self->_has;
  }
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v13;
    uint64_t has = (uint64_t)self->_has;
    int v6 = *((_DWORD *)&self->_has + 2);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_102;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint64Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((has & 0x800000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_8:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000) == 0)
  {
LABEL_10:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint64Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000) == 0)
  {
LABEL_13:
    if ((has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000) == 0)
  {
LABEL_14:
    if ((has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000) == 0)
  {
LABEL_15:
    if ((has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000) == 0)
  {
LABEL_16:
    if ((has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint64Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_20:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x40) == 0)
  {
LABEL_29:
    if ((v6 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x10) == 0)
  {
LABEL_30:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_32:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_33:
    if ((v6 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 4) == 0)
  {
LABEL_34:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x400000) == 0)
  {
LABEL_36:
    if ((has & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000) == 0)
  {
LABEL_37:
    if ((has & 0x4000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000) == 0)
  {
LABEL_38:
    if ((has & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000) == 0)
  {
LABEL_39:
    if ((has & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000) == 0)
  {
LABEL_43:
    if ((has & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000) == 0)
  {
LABEL_44:
    if ((has & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40) == 0)
  {
LABEL_45:
    if ((has & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteInt64Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_46:
    if ((v6 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteInt64Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x400) == 0)
  {
LABEL_47:
    if ((has & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_49:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000) == 0)
  {
LABEL_53:
    if ((has & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000) == 0)
  {
LABEL_54:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_56:
    if ((v6 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 8) == 0)
  {
LABEL_57:
    if ((has & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000) == 0)
  {
LABEL_58:
    if ((has & 0x100000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000) == 0)
  {
LABEL_60:
    if ((has & 0x80000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000) == 0)
  {
LABEL_61:
    if ((has & 0x40000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000) == 0)
  {
LABEL_62:
    if ((has & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000) == 0)
  {
LABEL_63:
    if ((has & 0x1000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000) == 0)
  {
LABEL_64:
    if ((has & 0x2000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000) == 0)
  {
LABEL_65:
    if ((has & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800) == 0)
  {
LABEL_66:
    if ((has & 0x400) == 0) {
      goto LABEL_67;
    }
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400) == 0)
  {
LABEL_67:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_68:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_69:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_70:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_71:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_72:
    if ((v6 & 0x20) == 0) {
      goto LABEL_73;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x20) == 0)
  {
LABEL_73:
    if ((v6 & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x80) == 0)
  {
LABEL_74:
    if ((v6 & 0x100) == 0) {
      goto LABEL_75;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_75:
    if ((has & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_76:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_172:
  PBDataWriterWriteUint32Field();
  id v4 = v13;
  if ((*(void *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_77:
    PBDataWriterWriteUint32Field();
    id v4 = v13;
  }
LABEL_78:
  if (self->_cameraHWParameters)
  {
    PBDataWriterWriteStringField();
    id v4 = v13;
  }
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v13;
    uint64_t v7 = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v13;
    uint64_t v7 = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((v8 & 0x4000) == 0)
    {
LABEL_84:
      if ((v8 & 0x8000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_176;
    }
  }
  else if ((v8 & 0x4000) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000) == 0)
  {
LABEL_85:
    if ((v8 & 0x200000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x200000) == 0)
  {
LABEL_86:
    if ((v8 & 0x10000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x10000) == 0)
  {
LABEL_87:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x2000) == 0)
  {
LABEL_88:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x1000) == 0)
  {
LABEL_89:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x80000) == 0)
  {
LABEL_90:
    if ((v8 & 0x800) == 0) {
      goto LABEL_91;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x800) == 0)
  {
LABEL_91:
    if ((v7 & 8) == 0) {
      goto LABEL_92;
    }
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((*(void *)&self->_has & 8) == 0)
  {
LABEL_92:
    if ((v8 & 0x200) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_183:
  PBDataWriterWriteUint64Field();
  id v4 = v13;
  if ((*((_DWORD *)&self->_has + 2) & 0x200) != 0)
  {
LABEL_93:
    PBDataWriterWriteBOOLField();
    id v4 = v13;
  }
LABEL_94:
  if (self->_identityCreationTimes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v13;
      ++v9;
    }
    while (v9 < self->_identityCreationTimes.count);
  }
  p_uint64_t has = &self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v13;
    uint64_t v12 = *(void *)p_has;
    int v11 = *((_DWORD *)&self->_has + 2);
    if ((v11 & 0x100000) == 0) {
      goto LABEL_187;
    }
    goto LABEL_186;
  }
  uint64_t v12 = *(void *)p_has;
  if ((v11 & 0x100000) != 0)
  {
LABEL_186:
    PBDataWriterWriteBOOLField();
    id v4 = v13;
    uint64_t v12 = (uint64_t)self->_has;
    int v11 = *((_DWORD *)&self->_has + 2);
  }
LABEL_187:
  if ((v12 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v13;
    uint64_t v12 = (uint64_t)self->_has;
    int v11 = *((_DWORD *)&self->_has + 2);
    if ((v12 & 0x100000000000) == 0)
    {
LABEL_189:
      if ((v12 & 0x400000000000) == 0) {
        goto LABEL_190;
      }
      goto LABEL_200;
    }
  }
  else if ((v12 & 0x100000000000) == 0)
  {
    goto LABEL_189;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x400000000000) == 0)
  {
LABEL_190:
    if ((v12 & 0x200000000000) == 0) {
      goto LABEL_191;
    }
    goto LABEL_201;
  }
LABEL_200:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x200000000000) == 0)
  {
LABEL_191:
    if ((v12 & 0x80) == 0) {
      goto LABEL_192;
    }
    goto LABEL_202;
  }
LABEL_201:
  PBDataWriterWriteInt32Field();
  id v4 = v13;
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x80) == 0)
  {
LABEL_192:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_193;
    }
    goto LABEL_203;
  }
LABEL_202:
  PBDataWriterWriteUint64Field();
  id v4 = v13;
  uint64_t v12 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x40000) == 0)
  {
LABEL_193:
    if ((v12 & 0x40000000000000) == 0) {
      goto LABEL_195;
    }
    goto LABEL_194;
  }
LABEL_203:
  PBDataWriterWriteBOOLField();
  id v4 = v13;
  if ((*(void *)&self->_has & 0x40000000000000) != 0)
  {
LABEL_194:
    PBDataWriterWriteUint32Field();
    id v4 = v13;
  }
LABEL_195:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[12] = self->_timestamp;
    *(void *)((char *)v4 + 380) |= 0x100uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x20000000) != 0)
  {
    *((unsigned char *)v4 + 377) = self->_overallResult;
    *((_DWORD *)v4 + 97) |= 0x20000000u;
    uint64_t has = (uint64_t)self->_has;
    int v6 = *((_DWORD *)&self->_has + 2);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_103;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v4[6] = self->_overallTime;
  *(void *)((char *)v4 + 380) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_104;
  }
LABEL_103:
  v4[5] = self->_faceDetectEndTime;
  *(void *)((char *)v4 + 380) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((has & 0x800000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v4 + 61) = self->_faceDetectResult;
  *(void *)((char *)v4 + 380) |= 0x20000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_8:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v4 + 55) = self->_faceDetectFrameCount;
  *(void *)((char *)v4 + 380) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)v4 + 57) = self->_faceDetectFrameFloodCount;
  *(void *)((char *)v4 + 380) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000) == 0)
  {
LABEL_10:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v4 + 58) = self->_faceDetectFrameSparseCount;
  *(void *)((char *)v4 + 380) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v4 + 56) = self->_faceDetectFrameDenseCount;
  *(void *)((char *)v4 + 380) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_110;
  }
LABEL_109:
  v4[4] = self->_bioCheckEndTime;
  *(void *)((char *)v4 + 380) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000) == 0)
  {
LABEL_13:
    if ((has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v4 + 38) = self->_bioCheckResult;
  *(void *)((char *)v4 + 380) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000) == 0)
  {
LABEL_14:
    if ((has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)v4 + 32) = self->_bioCheckFrameCount;
  *(void *)((char *)v4 + 380) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000) == 0)
  {
LABEL_15:
    if ((has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)v4 + 34) = self->_bioCheckFrameFloodCount;
  *(void *)((char *)v4 + 380) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000) == 0)
  {
LABEL_16:
    if ((has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)v4 + 35) = self->_bioCheckFrameSparseCount;
  *(void *)((char *)v4 + 380) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)v4 + 33) = self->_bioCheckFrameDenseCount;
  *(void *)((char *)v4 + 380) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_116;
  }
LABEL_115:
  v4[8] = self->_probingPatternEndTime;
  *(void *)((char *)v4 + 380) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v4 + 85) = self->_probingPatternResult;
  *((_DWORD *)v4 + 97) |= 2u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_20:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v4 + 81) = self->_probingPatternFrameCount;
  *(void *)((char *)v4 + 380) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v4 + 83) = self->_probingPatternFrameFloodCount;
  *(void *)((char *)v4 + 380) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v4 + 84) = self->_probingPatternFrameSparseCount;
  *((_DWORD *)v4 + 97) |= 1u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v4 + 82) = self->_probingPatternFrameDenseCount;
  *(void *)((char *)v4 + 380) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v4 + 26) = self->_ambientLux;
  *(void *)((char *)v4 + 380) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((unsigned char *)v4 + 379) = self->_probingPatternFailure;
  *((_DWORD *)v4 + 97) |= 0x80000000;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((unsigned char *)v4 + 375) = self->_matcherFailure;
  *((_DWORD *)v4 + 97) |= 0x8000000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((unsigned char *)v4 + 372) = self->_matchDepthFailure;
  *((_DWORD *)v4 + 97) |= 0x1000000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((unsigned char *)v4 + 373) = self->_matchFloodFailure;
  *((_DWORD *)v4 + 97) |= 0x2000000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x40) == 0)
  {
LABEL_29:
    if ((v6 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((unsigned char *)v4 + 354) = self->_asFloodFailure;
  *((_DWORD *)v4 + 97) |= 0x40u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x10) == 0)
  {
LABEL_30:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((unsigned char *)v4 + 352) = self->_asDepthFailure;
  *((_DWORD *)v4 + 97) |= 0x10u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((unsigned char *)v4 + 376) = self->_onlineTemplateUpdated;
  *((_DWORD *)v4 + 97) |= 0x10000000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_32:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((unsigned char *)v4 + 378) = self->_passcodeChallengeAllowed;
  *((_DWORD *)v4 + 97) |= 0x40000000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_33:
    if ((v6 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((_DWORD *)v4 + 71) = self->_featureGenerationError;
  *(void *)((char *)v4 + 380) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 4) == 0)
  {
LABEL_34:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((_DWORD *)v4 + 86) = self->_sensorTemperature;
  *((_DWORD *)v4 + 97) |= 4u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v4 + 62) = self->_faceDistance;
  *(void *)((char *)v4 + 380) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x400000) == 0)
  {
LABEL_36:
    if ((has & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((unsigned char *)v4 + 370) = self->_hasOcclusion;
  *((_DWORD *)v4 + 97) |= 0x400000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000) == 0)
  {
LABEL_37:
    if ((has & 0x4000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((_DWORD *)v4 + 42) = self->_camRectX;
  *(void *)((char *)v4 + 380) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000) == 0)
  {
LABEL_38:
    if ((has & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((_DWORD *)v4 + 43) = self->_camRectY;
  *(void *)((char *)v4 + 380) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000) == 0)
  {
LABEL_39:
    if ((has & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((_DWORD *)v4 + 41) = self->_camRectW;
  *(void *)((char *)v4 + 380) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((_DWORD *)v4 + 40) = self->_camRectH;
  *(void *)((char *)v4 + 380) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v4 + 60) = self->_faceDetectPPMRequestedBudget;
  *(void *)((char *)v4 + 380) |= 0x10000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((_DWORD *)v4 + 59) = self->_faceDetectPPMAllocatedBudget;
  *(void *)((char *)v4 + 380) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000) == 0)
  {
LABEL_43:
    if ((has & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v4 + 37) = self->_bioCheckPPMRequestedBudget;
  *(void *)((char *)v4 + 380) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000) == 0)
  {
LABEL_44:
    if ((has & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((_DWORD *)v4 + 36) = self->_bioCheckPPMAllocatedBudget;
  *(void *)((char *)v4 + 380) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40) == 0)
  {
LABEL_45:
    if ((has & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_143;
  }
LABEL_142:
  v4[10] = self->_rfcSetIndex;
  *(void *)((char *)v4 + 380) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_46:
    if ((v6 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_144;
  }
LABEL_143:
  v4[9] = self->_rfcFrameIndex;
  *(void *)((char *)v4 + 380) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x400) == 0)
  {
LABEL_47:
    if ((has & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((unsigned char *)v4 + 358) = self->_bioLockout;
  *((_DWORD *)v4 + 97) |= 0x400u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v4 + 44) = self->_cameraErr;
  *(void *)((char *)v4 + 380) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_49:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((unsigned char *)v4 + 374) = self->_matchForUnlock;
  *((_DWORD *)v4 + 97) |= 0x4000000u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v4 + 70) = self->_failedUnlockAttemptsFromFD;
  *(void *)((char *)v4 + 380) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v4 + 69) = self->_failedUnlockAttemptsFromBiocheck;
  *(void *)((char *)v4 + 380) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v4 + 68) = self->_failedMatchAttemptsFromFD;
  *(void *)((char *)v4 + 380) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000) == 0)
  {
LABEL_53:
    if ((has & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((_DWORD *)v4 + 67) = self->_failedMatchAttemptsFromBiocheck;
  *(void *)((char *)v4 + 380) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000) == 0)
  {
LABEL_54:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((_DWORD *)v4 + 39) = self->_bioLockoutReason;
  *(void *)((char *)v4 + 380) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_153;
  }
LABEL_152:
  *((_DWORD *)v4 + 72) = self->_matchFeatureVectorError;
  *(void *)((char *)v4 + 380) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_56:
    if ((v6 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_154;
  }
LABEL_153:
  *((_DWORD *)v4 + 75) = self->_onlineTemplateAge;
  *(void *)((char *)v4 + 380) |= 0x80000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 8) == 0)
  {
LABEL_57:
    if ((has & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_155;
  }
LABEL_154:
  *((_DWORD *)v4 + 87) = self->_shortTermTemplateAge;
  *((_DWORD *)v4 + 97) |= 8u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000) == 0)
  {
LABEL_58:
    if ((has & 0x100000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_156;
  }
LABEL_155:
  *((_DWORD *)v4 + 54) = self->_faceDetectFaceDistance;
  *(void *)((char *)v4 + 380) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_157;
  }
LABEL_156:
  *((_DWORD *)v4 + 52) = self->_faceDetectCamRectX;
  *(void *)((char *)v4 + 380) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000) == 0)
  {
LABEL_60:
    if ((has & 0x80000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_158;
  }
LABEL_157:
  *((_DWORD *)v4 + 53) = self->_faceDetectCamRectY;
  *(void *)((char *)v4 + 380) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000) == 0)
  {
LABEL_61:
    if ((has & 0x40000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_159;
  }
LABEL_158:
  *((_DWORD *)v4 + 51) = self->_faceDetectCamRectW;
  *(void *)((char *)v4 + 380) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000) == 0)
  {
LABEL_62:
    if ((has & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_160;
  }
LABEL_159:
  *((_DWORD *)v4 + 50) = self->_faceDetectCamRectH;
  *(void *)((char *)v4 + 380) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000) == 0)
  {
LABEL_63:
    if ((has & 0x1000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_161;
  }
LABEL_160:
  *((_DWORD *)v4 + 31) = self->_bioCheckFaceDistance;
  *(void *)((char *)v4 + 380) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000) == 0)
  {
LABEL_64:
    if ((has & 0x2000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_162;
  }
LABEL_161:
  *((_DWORD *)v4 + 29) = self->_bioCheckCamRectX;
  *(void *)((char *)v4 + 380) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000) == 0)
  {
LABEL_65:
    if ((has & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_163;
  }
LABEL_162:
  *((_DWORD *)v4 + 30) = self->_bioCheckCamRectY;
  *(void *)((char *)v4 + 380) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800) == 0)
  {
LABEL_66:
    if ((has & 0x400) == 0) {
      goto LABEL_67;
    }
    goto LABEL_164;
  }
LABEL_163:
  *((_DWORD *)v4 + 28) = self->_bioCheckCamRectW;
  *(void *)((char *)v4 + 380) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400) == 0)
  {
LABEL_67:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_165;
  }
LABEL_164:
  *((_DWORD *)v4 + 27) = self->_bioCheckCamRectH;
  *(void *)((char *)v4 + 380) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_68:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_166;
  }
LABEL_165:
  *((_DWORD *)v4 + 80) = self->_probingPatternFaceDistance;
  *(void *)((char *)v4 + 380) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_69:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_167;
  }
LABEL_166:
  *((_DWORD *)v4 + 78) = self->_probingPatternCamRectX;
  *(void *)((char *)v4 + 380) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_70:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_168;
  }
LABEL_167:
  *((_DWORD *)v4 + 79) = self->_probingPatternCamRectY;
  *(void *)((char *)v4 + 380) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_71:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_169;
  }
LABEL_168:
  *((_DWORD *)v4 + 77) = self->_probingPatternCamRectW;
  *(void *)((char *)v4 + 380) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_72:
    if ((v6 & 0x20) == 0) {
      goto LABEL_73;
    }
    goto LABEL_170;
  }
LABEL_169:
  *((_DWORD *)v4 + 76) = self->_probingPatternCamRectH;
  *(void *)((char *)v4 + 380) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x20) == 0)
  {
LABEL_73:
    if ((v6 & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((unsigned char *)v4 + 353) = self->_asFailure;
  *((_DWORD *)v4 + 97) |= 0x20u;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((v6 & 0x80) == 0)
  {
LABEL_74:
    if ((v6 & 0x100) == 0) {
      goto LABEL_75;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((unsigned char *)v4 + 355) = self->_autoRetry;
  *((_DWORD *)v4 + 97) |= 0x80u;
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_75:
    if ((has & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_173;
  }
LABEL_172:
  *((unsigned char *)v4 + 356) = self->_autoRetryAllowed;
  *((_DWORD *)v4 + 97) |= 0x100u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_76:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_173:
  *((_DWORD *)v4 + 49) = self->_deviceOrientation;
  *(void *)((char *)v4 + 380) |= 0x20000000uLL;
  if ((*(void *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_77:
    *((_DWORD *)v4 + 73) = self->_matchIdentityCount;
    *(void *)((char *)v4 + 380) |= 0x20000000000000uLL;
  }
LABEL_78:
  uint64_t v16 = v4;
  if (self->_cameraHWParameters)
  {
    [v4 setCameraHWParameters:];
    id v4 = v16;
  }
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000000) != 0)
  {
    *((_DWORD *)v4 + 48) = self->_captureMethod;
    *(void *)((char *)v4 + 380) |= 0x10000000uLL;
    uint64_t v7 = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x20000) != 0)
  {
    *((unsigned char *)v4 + 365) = self->_engagementInfoFeedbackNoFaceDetected;
    *((_DWORD *)v4 + 97) |= 0x20000u;
    uint64_t v7 = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((v8 & 0x4000) == 0)
    {
LABEL_84:
      if ((v8 & 0x8000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_177;
    }
  }
  else if ((v8 & 0x4000) == 0)
  {
    goto LABEL_84;
  }
  *((unsigned char *)v4 + 362) = self->_engagementInfoFeedbackFaceTooClose;
  *((_DWORD *)v4 + 97) |= 0x4000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000) == 0)
  {
LABEL_85:
    if ((v8 & 0x200000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_178;
  }
LABEL_177:
  *((unsigned char *)v4 + 363) = self->_engagementInfoFeedbackFaceTooFar;
  *((_DWORD *)v4 + 97) |= 0x8000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x200000) == 0)
  {
LABEL_86:
    if ((v8 & 0x10000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_179;
  }
LABEL_178:
  *((unsigned char *)v4 + 369) = self->_engagementInfoFeedbackPoseOutOfRange;
  *((_DWORD *)v4 + 97) |= 0x200000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x10000) == 0)
  {
LABEL_87:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_180;
  }
LABEL_179:
  *((unsigned char *)v4 + 364) = self->_engagementInfoFeedbackNoAttention;
  *((_DWORD *)v4 + 97) |= 0x10000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x2000) == 0)
  {
LABEL_88:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_181;
  }
LABEL_180:
  *((unsigned char *)v4 + 361) = self->_engagementInfoFeedbackFaceOccluded;
  *((_DWORD *)v4 + 97) |= 0x2000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x1000) == 0)
  {
LABEL_89:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_182;
  }
LABEL_181:
  *((unsigned char *)v4 + 360) = self->_engagementInfoFeedbackCameraObstructed;
  *((_DWORD *)v4 + 97) |= 0x1000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x80000) == 0)
  {
LABEL_90:
    if ((v8 & 0x800) == 0) {
      goto LABEL_91;
    }
    goto LABEL_183;
  }
LABEL_182:
  *((unsigned char *)v4 + 367) = self->_engagementInfoFeedbackPartialOutOfFOV;
  *((_DWORD *)v4 + 97) |= 0x80000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x800) == 0)
  {
LABEL_91:
    if ((v7 & 8) == 0) {
      goto LABEL_92;
    }
LABEL_184:
    v4[7] = self->_overallTimeWithRetries;
    *(void *)((char *)v4 + 380) |= 8uLL;
    if ((*((_DWORD *)&self->_has + 2) & 0x200) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_183:
  *((unsigned char *)v4 + 359) = self->_combinedSequenceEnabled;
  *((_DWORD *)v4 + 97) |= 0x800u;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((*(void *)&self->_has & 8) != 0) {
    goto LABEL_184;
  }
LABEL_92:
  if ((v8 & 0x200) != 0)
  {
LABEL_93:
    *((unsigned char *)v4 + 357) = self->_autoRetryEnabled;
    *((_DWORD *)v4 + 97) |= 0x200u;
  }
LABEL_94:
  if ([(AWDBiometricKitMatchAttempt *)self identityCreationTimesCount])
  {
    [v16 clearIdentityCreationTimes];
    unint64_t v9 = [(AWDBiometricKitMatchAttempt *)self identityCreationTimesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
        [v16 addIdentityCreationTime:-[AWDBiometricKitMatchAttempt identityCreationTimeAtIndex:](self, "identityCreationTimeAtIndex:", i)];
    }
  }
  p_uint64_t has = &self->_has;
  int v13 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x800000) != 0)
  {
    int v15 = (char *)v16;
    *((unsigned char *)v16 + 371) = self->_matchCancelled;
    *((_DWORD *)v16 + 97) |= 0x800000u;
    uint64_t v14 = *(void *)p_has;
    int v13 = *((_DWORD *)&self->_has + 2);
    if ((v13 & 0x100000) == 0) {
      goto LABEL_188;
    }
    goto LABEL_187;
  }
  uint64_t v14 = *(void *)p_has;
  int v15 = (char *)v16;
  if ((v13 & 0x100000) != 0)
  {
LABEL_187:
    v15[368] = self->_engagementInfoFeedbackPoseMarginal;
    *((_DWORD *)v15 + 97) |= 0x100000u;
    uint64_t v14 = (uint64_t)self->_has;
    int v13 = *((_DWORD *)&self->_has + 2);
  }
LABEL_188:
  if ((v14 & 0x80000000000) != 0)
  {
    *((_DWORD *)v15 + 63) = self->_faceOrientation;
    *(void *)(v15 + 380) |= 0x80000000000uLL;
    uint64_t v14 = (uint64_t)self->_has;
    int v13 = *((_DWORD *)&self->_has + 2);
    if ((v14 & 0x100000000000) == 0)
    {
LABEL_190:
      if ((v14 & 0x400000000000) == 0) {
        goto LABEL_191;
      }
      goto LABEL_201;
    }
  }
  else if ((v14 & 0x100000000000) == 0)
  {
    goto LABEL_190;
  }
  *((_DWORD *)v15 + 64) = self->_facePitch;
  *(void *)(v15 + 380) |= 0x100000000000uLL;
  uint64_t v14 = (uint64_t)self->_has;
  int v13 = *((_DWORD *)&self->_has + 2);
  if ((v14 & 0x400000000000) == 0)
  {
LABEL_191:
    if ((v14 & 0x200000000000) == 0) {
      goto LABEL_192;
    }
    goto LABEL_202;
  }
LABEL_201:
  *((_DWORD *)v15 + 66) = self->_faceYaw;
  *(void *)(v15 + 380) |= 0x400000000000uLL;
  uint64_t v14 = (uint64_t)self->_has;
  int v13 = *((_DWORD *)&self->_has + 2);
  if ((v14 & 0x200000000000) == 0)
  {
LABEL_192:
    if ((v14 & 0x80) == 0) {
      goto LABEL_193;
    }
    goto LABEL_203;
  }
LABEL_202:
  *((_DWORD *)v15 + 65) = self->_faceRoll;
  *(void *)(v15 + 380) |= 0x200000000000uLL;
  uint64_t v14 = (uint64_t)self->_has;
  int v13 = *((_DWORD *)&self->_has + 2);
  if ((v14 & 0x80) == 0)
  {
LABEL_193:
    if ((v13 & 0x40000) == 0) {
      goto LABEL_194;
    }
    goto LABEL_204;
  }
LABEL_203:
  *((void *)v15 + 11) = self->_timeSinceSleep;
  *(void *)(v15 + 380) |= 0x80uLL;
  uint64_t v14 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x40000) == 0)
  {
LABEL_194:
    if ((v14 & 0x40000000000000) == 0) {
      goto LABEL_196;
    }
    goto LABEL_195;
  }
LABEL_204:
  v15[366] = self->_engagementInfoFeedbackNoseAndMouthOccluded;
  *((_DWORD *)v15 + 97) |= 0x40000u;
  if ((*(void *)&self->_has & 0x40000000000000) != 0)
  {
LABEL_195:
    *((_DWORD *)v15 + 74) = self->_matchType;
    *(void *)(v15 + 380) |= 0x40000000000000uLL;
  }
LABEL_196:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) != 0)
  {
    *(void *)(v5 + 96) = self->_timestamp;
    *(void *)(v5 + 380) |= 0x100uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x20000000) != 0)
  {
    *(unsigned char *)(v5 + 377) = self->_overallResult;
    *(_DWORD *)(v5 + 388) |= 0x20000000u;
    uint64_t has = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_97;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v5 + 48) = self->_overallTime;
  *(void *)(v5 + 380) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(void *)(v5 + 40) = self->_faceDetectEndTime;
  *(void *)(v5 + 380) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((has & 0x800000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v5 + 244) = self->_faceDetectResult;
  *(void *)(v5 + 380) |= 0x20000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_8:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v5 + 220) = self->_faceDetectFrameCount;
  *(void *)(v5 + 380) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v5 + 228) = self->_faceDetectFrameFloodCount;
  *(void *)(v5 + 380) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000) == 0)
  {
LABEL_10:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v5 + 232) = self->_faceDetectFrameSparseCount;
  *(void *)(v5 + 380) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v5 + 224) = self->_faceDetectFrameDenseCount;
  *(void *)(v5 + 380) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(void *)(v5 + 32) = self->_bioCheckEndTime;
  *(void *)(v5 + 380) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000) == 0)
  {
LABEL_13:
    if ((has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(_DWORD *)(v5 + 152) = self->_bioCheckResult;
  *(void *)(v5 + 380) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000) == 0)
  {
LABEL_14:
    if ((has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(_DWORD *)(v5 + 128) = self->_bioCheckFrameCount;
  *(void *)(v5 + 380) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20000) == 0)
  {
LABEL_15:
    if ((has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(_DWORD *)(v5 + 136) = self->_bioCheckFrameFloodCount;
  *(void *)(v5 + 380) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000) == 0)
  {
LABEL_16:
    if ((has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v5 + 140) = self->_bioCheckFrameSparseCount;
  *(void *)(v5 + 380) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v5 + 132) = self->_bioCheckFrameDenseCount;
  *(void *)(v5 + 380) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((v8 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(void *)(v5 + 64) = self->_probingPatternEndTime;
  *(void *)(v5 + 380) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 2) == 0)
  {
LABEL_19:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v5 + 340) = self->_probingPatternResult;
  *(_DWORD *)(v5 + 388) |= 2u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_20:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(_DWORD *)(v5 + 324) = self->_probingPatternFrameCount;
  *(void *)(v5 + 380) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_21:
    if ((v8 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(_DWORD *)(v5 + 332) = self->_probingPatternFrameFloodCount;
  *(void *)(v5 + 380) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 1) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(_DWORD *)(v5 + 336) = self->_probingPatternFrameSparseCount;
  *(_DWORD *)(v5 + 388) |= 1u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v5 + 328) = self->_probingPatternFrameDenseCount;
  *(void *)(v5 + 380) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((v8 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(_DWORD *)(v5 + 104) = self->_ambientLux;
  *(void *)(v5 + 380) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(unsigned char *)(v5 + 379) = self->_probingPatternFailure;
  *(_DWORD *)(v5 + 388) |= 0x80000000;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(unsigned char *)(v5 + 375) = self->_matcherFailure;
  *(_DWORD *)(v5 + 388) |= 0x8000000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v8 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(unsigned char *)(v5 + 372) = self->_matchDepthFailure;
  *(_DWORD *)(v5 + 388) |= 0x1000000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(unsigned char *)(v5 + 373) = self->_matchFloodFailure;
  *(_DWORD *)(v5 + 388) |= 0x2000000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x40) == 0)
  {
LABEL_29:
    if ((v8 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(unsigned char *)(v5 + 354) = self->_asFloodFailure;
  *(_DWORD *)(v5 + 388) |= 0x40u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x10) == 0)
  {
LABEL_30:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(unsigned char *)(v5 + 352) = self->_asDepthFailure;
  *(_DWORD *)(v5 + 388) |= 0x10u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(unsigned char *)(v5 + 376) = self->_onlineTemplateUpdated;
  *(_DWORD *)(v5 + 388) |= 0x10000000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x40000000) == 0)
  {
LABEL_32:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(unsigned char *)(v5 + 378) = self->_passcodeChallengeAllowed;
  *(_DWORD *)(v5 + 388) |= 0x40000000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_33:
    if ((v8 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_125;
  }
LABEL_124:
  *(_DWORD *)(v5 + 284) = self->_featureGenerationError;
  *(void *)(v5 + 380) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 4) == 0)
  {
LABEL_34:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_126;
  }
LABEL_125:
  *(_DWORD *)(v5 + 344) = self->_sensorTemperature;
  *(_DWORD *)(v5 + 388) |= 4u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_127;
  }
LABEL_126:
  *(_DWORD *)(v5 + 248) = self->_faceDistance;
  *(void *)(v5 + 380) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x400000) == 0)
  {
LABEL_36:
    if ((has & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_128;
  }
LABEL_127:
  *(unsigned char *)(v5 + 370) = self->_hasOcclusion;
  *(_DWORD *)(v5 + 388) |= 0x400000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000) == 0)
  {
LABEL_37:
    if ((has & 0x4000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_129;
  }
LABEL_128:
  *(_DWORD *)(v5 + 168) = self->_camRectX;
  *(void *)(v5 + 380) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000) == 0)
  {
LABEL_38:
    if ((has & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_130;
  }
LABEL_129:
  *(_DWORD *)(v5 + 172) = self->_camRectY;
  *(void *)(v5 + 380) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000) == 0)
  {
LABEL_39:
    if ((has & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_131;
  }
LABEL_130:
  *(_DWORD *)(v5 + 164) = self->_camRectW;
  *(void *)(v5 + 380) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_132;
  }
LABEL_131:
  *(_DWORD *)(v5 + 160) = self->_camRectH;
  *(void *)(v5 + 380) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_133;
  }
LABEL_132:
  *(_DWORD *)(v5 + 240) = self->_faceDetectPPMRequestedBudget;
  *(void *)(v5 + 380) |= 0x10000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_134;
  }
LABEL_133:
  *(_DWORD *)(v5 + 236) = self->_faceDetectPPMAllocatedBudget;
  *(void *)(v5 + 380) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000) == 0)
  {
LABEL_43:
    if ((has & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_135;
  }
LABEL_134:
  *(_DWORD *)(v5 + 148) = self->_bioCheckPPMRequestedBudget;
  *(void *)(v5 + 380) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000) == 0)
  {
LABEL_44:
    if ((has & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_136;
  }
LABEL_135:
  *(_DWORD *)(v5 + 144) = self->_bioCheckPPMAllocatedBudget;
  *(void *)(v5 + 380) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40) == 0)
  {
LABEL_45:
    if ((has & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_137;
  }
LABEL_136:
  *(void *)(v5 + 80) = self->_rfcSetIndex;
  *(void *)(v5 + 380) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_46:
    if ((v8 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_138;
  }
LABEL_137:
  *(void *)(v5 + 72) = self->_rfcFrameIndex;
  *(void *)(v5 + 380) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x400) == 0)
  {
LABEL_47:
    if ((has & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_139;
  }
LABEL_138:
  *(unsigned char *)(v5 + 358) = self->_bioLockout;
  *(_DWORD *)(v5 + 388) |= 0x400u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x8000000) == 0)
  {
LABEL_48:
    if ((v8 & 0x4000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_140;
  }
LABEL_139:
  *(_DWORD *)(v5 + 176) = self->_cameraErr;
  *(void *)(v5 + 380) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_49:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_141;
  }
LABEL_140:
  *(unsigned char *)(v5 + 374) = self->_matchForUnlock;
  *(_DWORD *)(v5 + 388) |= 0x4000000u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_142;
  }
LABEL_141:
  *(_DWORD *)(v5 + 280) = self->_failedUnlockAttemptsFromFD;
  *(void *)(v5 + 380) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_143;
  }
LABEL_142:
  *(_DWORD *)(v5 + 276) = self->_failedUnlockAttemptsFromBiocheck;
  *(void *)(v5 + 380) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_144;
  }
LABEL_143:
  *(_DWORD *)(v5 + 272) = self->_failedMatchAttemptsFromFD;
  *(void *)(v5 + 380) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000) == 0)
  {
LABEL_53:
    if ((has & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_145;
  }
LABEL_144:
  *(_DWORD *)(v5 + 268) = self->_failedMatchAttemptsFromBiocheck;
  *(void *)(v5 + 380) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000) == 0)
  {
LABEL_54:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_146;
  }
LABEL_145:
  *(_DWORD *)(v5 + 156) = self->_bioLockoutReason;
  *(void *)(v5 + 380) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_147;
  }
LABEL_146:
  *(_DWORD *)(v5 + 288) = self->_matchFeatureVectorError;
  *(void *)(v5 + 380) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_56:
    if ((v8 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_148;
  }
LABEL_147:
  *(_DWORD *)(v5 + 300) = self->_onlineTemplateAge;
  *(void *)(v5 + 380) |= 0x80000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 8) == 0)
  {
LABEL_57:
    if ((has & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_149;
  }
LABEL_148:
  *(_DWORD *)(v5 + 348) = self->_shortTermTemplateAge;
  *(_DWORD *)(v5 + 388) |= 8u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000) == 0)
  {
LABEL_58:
    if ((has & 0x100000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_150;
  }
LABEL_149:
  *(_DWORD *)(v5 + 216) = self->_faceDetectFaceDistance;
  *(void *)(v5 + 380) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_151;
  }
LABEL_150:
  *(_DWORD *)(v5 + 208) = self->_faceDetectCamRectX;
  *(void *)(v5 + 380) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000) == 0)
  {
LABEL_60:
    if ((has & 0x80000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_152;
  }
LABEL_151:
  *(_DWORD *)(v5 + 212) = self->_faceDetectCamRectY;
  *(void *)(v5 + 380) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x80000000) == 0)
  {
LABEL_61:
    if ((has & 0x40000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_153;
  }
LABEL_152:
  *(_DWORD *)(v5 + 204) = self->_faceDetectCamRectW;
  *(void *)(v5 + 380) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x40000000) == 0)
  {
LABEL_62:
    if ((has & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_154;
  }
LABEL_153:
  *(_DWORD *)(v5 + 200) = self->_faceDetectCamRectH;
  *(void *)(v5 + 380) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000) == 0)
  {
LABEL_63:
    if ((has & 0x1000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_155;
  }
LABEL_154:
  *(_DWORD *)(v5 + 124) = self->_bioCheckFaceDistance;
  *(void *)(v5 + 380) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000) == 0)
  {
LABEL_64:
    if ((has & 0x2000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_156;
  }
LABEL_155:
  *(_DWORD *)(v5 + 116) = self->_bioCheckCamRectX;
  *(void *)(v5 + 380) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x2000) == 0)
  {
LABEL_65:
    if ((has & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_157;
  }
LABEL_156:
  *(_DWORD *)(v5 + 120) = self->_bioCheckCamRectY;
  *(void *)(v5 + 380) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800) == 0)
  {
LABEL_66:
    if ((has & 0x400) == 0) {
      goto LABEL_67;
    }
    goto LABEL_158;
  }
LABEL_157:
  *(_DWORD *)(v5 + 112) = self->_bioCheckCamRectW;
  *(void *)(v5 + 380) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400) == 0)
  {
LABEL_67:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_159;
  }
LABEL_158:
  *(_DWORD *)(v5 + 108) = self->_bioCheckCamRectH;
  *(void *)(v5 + 380) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_68:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_160;
  }
LABEL_159:
  *(_DWORD *)(v5 + 320) = self->_probingPatternFaceDistance;
  *(void *)(v5 + 380) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_69:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_161;
  }
LABEL_160:
  *(_DWORD *)(v5 + 312) = self->_probingPatternCamRectX;
  *(void *)(v5 + 380) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_70:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_162;
  }
LABEL_161:
  *(_DWORD *)(v5 + 316) = self->_probingPatternCamRectY;
  *(void *)(v5 + 380) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_71:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_163;
  }
LABEL_162:
  *(_DWORD *)(v5 + 308) = self->_probingPatternCamRectW;
  *(void *)(v5 + 380) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_72:
    if ((v8 & 0x20) == 0) {
      goto LABEL_73;
    }
    goto LABEL_164;
  }
LABEL_163:
  *(_DWORD *)(v5 + 304) = self->_probingPatternCamRectH;
  *(void *)(v5 + 380) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x20) == 0)
  {
LABEL_73:
    if ((v8 & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_165;
  }
LABEL_164:
  *(unsigned char *)(v5 + 353) = self->_asFailure;
  *(_DWORD *)(v5 + 388) |= 0x20u;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x80) == 0)
  {
LABEL_74:
    if ((v8 & 0x100) == 0) {
      goto LABEL_75;
    }
    goto LABEL_166;
  }
LABEL_165:
  *(unsigned char *)(v5 + 355) = self->_autoRetry;
  *(_DWORD *)(v5 + 388) |= 0x80u;
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_75:
    if ((has & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_167;
  }
LABEL_166:
  *(unsigned char *)(v5 + 356) = self->_autoRetryAllowed;
  *(_DWORD *)(v5 + 388) |= 0x100u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_76:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_167:
  *(_DWORD *)(v5 + 196) = self->_deviceOrientation;
  *(void *)(v5 + 380) |= 0x20000000uLL;
  if ((*(void *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_77:
    *(_DWORD *)(v5 + 292) = self->_matchIdentityCount;
    *(void *)(v5 + 380) |= 0x20000000000000uLL;
  }
LABEL_78:
  uint64_t v9 = [(NSString *)self->_cameraHWParameters copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v9;

  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x10000000) != 0)
  {
    *(_DWORD *)(v6 + 192) = self->_captureMethod;
    *(void *)(v6 + 380) |= 0x10000000uLL;
    uint64_t v11 = (uint64_t)self->_has;
  }
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x20000) != 0)
  {
    *(unsigned char *)(v6 + 365) = self->_engagementInfoFeedbackNoFaceDetected;
    *(_DWORD *)(v6 + 388) |= 0x20000u;
    uint64_t v11 = (uint64_t)self->_has;
    int v12 = *((_DWORD *)&self->_has + 2);
    if ((v12 & 0x4000) == 0)
    {
LABEL_82:
      if ((v12 & 0x8000) == 0) {
        goto LABEL_83;
      }
      goto LABEL_171;
    }
  }
  else if ((v12 & 0x4000) == 0)
  {
    goto LABEL_82;
  }
  *(unsigned char *)(v6 + 362) = self->_engagementInfoFeedbackFaceTooClose;
  *(_DWORD *)(v6 + 388) |= 0x4000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x8000) == 0)
  {
LABEL_83:
    if ((v12 & 0x200000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_172;
  }
LABEL_171:
  *(unsigned char *)(v6 + 363) = self->_engagementInfoFeedbackFaceTooFar;
  *(_DWORD *)(v6 + 388) |= 0x8000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x200000) == 0)
  {
LABEL_84:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_173;
  }
LABEL_172:
  *(unsigned char *)(v6 + 369) = self->_engagementInfoFeedbackPoseOutOfRange;
  *(_DWORD *)(v6 + 388) |= 0x200000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x10000) == 0)
  {
LABEL_85:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_174;
  }
LABEL_173:
  *(unsigned char *)(v6 + 364) = self->_engagementInfoFeedbackNoAttention;
  *(_DWORD *)(v6 + 388) |= 0x10000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x2000) == 0)
  {
LABEL_86:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_175;
  }
LABEL_174:
  *(unsigned char *)(v6 + 361) = self->_engagementInfoFeedbackFaceOccluded;
  *(_DWORD *)(v6 + 388) |= 0x2000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x1000) == 0)
  {
LABEL_87:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_176;
  }
LABEL_175:
  *(unsigned char *)(v6 + 360) = self->_engagementInfoFeedbackCameraObstructed;
  *(_DWORD *)(v6 + 388) |= 0x1000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x80000) == 0)
  {
LABEL_88:
    if ((v12 & 0x800) == 0) {
      goto LABEL_89;
    }
    goto LABEL_177;
  }
LABEL_176:
  *(unsigned char *)(v6 + 367) = self->_engagementInfoFeedbackPartialOutOfFOV;
  *(_DWORD *)(v6 + 388) |= 0x80000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x800) == 0)
  {
LABEL_89:
    if ((v11 & 8) == 0) {
      goto LABEL_90;
    }
    goto LABEL_178;
  }
LABEL_177:
  *(unsigned char *)(v6 + 359) = self->_combinedSequenceEnabled;
  *(_DWORD *)(v6 + 388) |= 0x800u;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((*(void *)&self->_has & 8) == 0)
  {
LABEL_90:
    if ((v12 & 0x200) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_178:
  *(void *)(v6 + 56) = self->_overallTimeWithRetries;
  *(void *)(v6 + 380) |= 8uLL;
  if ((*((_DWORD *)&self->_has + 2) & 0x200) != 0)
  {
LABEL_91:
    *(unsigned char *)(v6 + 357) = self->_autoRetryEnabled;
    *(_DWORD *)(v6 + 388) |= 0x200u;
  }
LABEL_92:
  PBRepeatedUInt64Copy();
  p_uint64_t has = &self->_has;
  int v14 = *((_DWORD *)&self->_has + 2);
  if ((v14 & 0x800000) != 0)
  {
    *(unsigned char *)(v6 + 371) = self->_matchCancelled;
    *(_DWORD *)(v6 + 388) |= 0x800000u;
    uint64_t v15 = *(void *)p_has;
    int v14 = *((_DWORD *)&self->_has + 2);
    if ((v14 & 0x100000) == 0) {
      goto LABEL_182;
    }
    goto LABEL_181;
  }
  uint64_t v15 = *(void *)p_has;
  if ((v14 & 0x100000) != 0)
  {
LABEL_181:
    *(unsigned char *)(v6 + 368) = self->_engagementInfoFeedbackPoseMarginal;
    *(_DWORD *)(v6 + 388) |= 0x100000u;
    uint64_t v15 = (uint64_t)self->_has;
    int v14 = *((_DWORD *)&self->_has + 2);
  }
LABEL_182:
  if ((v15 & 0x80000000000) != 0)
  {
    *(_DWORD *)(v6 + 252) = self->_faceOrientation;
    *(void *)(v6 + 380) |= 0x80000000000uLL;
    uint64_t v15 = (uint64_t)self->_has;
    int v14 = *((_DWORD *)&self->_has + 2);
    if ((v15 & 0x100000000000) == 0)
    {
LABEL_184:
      if ((v15 & 0x400000000000) == 0) {
        goto LABEL_185;
      }
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x100000000000) == 0)
  {
    goto LABEL_184;
  }
  *(_DWORD *)(v6 + 256) = self->_facePitch;
  *(void *)(v6 + 380) |= 0x100000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  int v14 = *((_DWORD *)&self->_has + 2);
  if ((v15 & 0x400000000000) == 0)
  {
LABEL_185:
    if ((v15 & 0x200000000000) == 0) {
      goto LABEL_186;
    }
    goto LABEL_194;
  }
LABEL_193:
  *(_DWORD *)(v6 + 264) = self->_faceYaw;
  *(void *)(v6 + 380) |= 0x400000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  int v14 = *((_DWORD *)&self->_has + 2);
  if ((v15 & 0x200000000000) == 0)
  {
LABEL_186:
    if ((v15 & 0x80) == 0) {
      goto LABEL_187;
    }
    goto LABEL_195;
  }
LABEL_194:
  *(_DWORD *)(v6 + 260) = self->_faceRoll;
  *(void *)(v6 + 380) |= 0x200000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  int v14 = *((_DWORD *)&self->_has + 2);
  if ((v15 & 0x80) == 0)
  {
LABEL_187:
    if ((v14 & 0x40000) == 0) {
      goto LABEL_188;
    }
LABEL_196:
    *(unsigned char *)(v6 + 366) = self->_engagementInfoFeedbackNoseAndMouthOccluded;
    *(_DWORD *)(v6 + 388) |= 0x40000u;
    if ((*(void *)&self->_has & 0x40000000000000) == 0) {
      goto LABEL_190;
    }
    goto LABEL_189;
  }
LABEL_195:
  *(void *)(v6 + 88) = self->_timeSinceSleep;
  *(void *)(v6 + 380) |= 0x80uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x40000) != 0) {
    goto LABEL_196;
  }
LABEL_188:
  if ((v15 & 0x40000000000000) != 0)
  {
LABEL_189:
    *(_DWORD *)(v6 + 296) = self->_matchType;
    *(void *)(v6 + 380) |= 0x40000000000000uLL;
  }
LABEL_190:
  id v16 = (id)v6;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_569;
  }
  uint64_t v5 = *((int *)&self->_has + 2);
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = v4[97];
  uint64_t v8 = *(void *)(v4 + 95);
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_timestamp != *((void *)v4 + 12)) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_569;
    }
    if (self->_overallResult)
    {
      if (!*((unsigned char *)v4 + 377)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 377))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_overallTime != *((void *)v4 + 6)) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_faceDetectEndTime != *((void *)v4 + 5)) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v8 & 0x20000000000) == 0 || self->_faceDetectResult != v4[61]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x20000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v8 & 0x800000000) == 0 || self->_faceDetectFrameCount != v4[55]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x800000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_faceDetectFrameFloodCount != v4[57]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v8 & 0x4000000000) == 0 || self->_faceDetectFrameSparseCount != v4[58]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x4000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v8 & 0x1000000000) == 0 || self->_faceDetectFrameDenseCount != v4[56]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x1000000000) != 0)
  {
    goto LABEL_569;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_bioCheckEndTime != *((void *)v4 + 4)) {
      goto LABEL_569;
    }
  }
  else if (v8)
  {
    goto LABEL_569;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_bioCheckResult != v4[38]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_bioCheckFrameCount != v4[32]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_bioCheckFrameFloodCount != v4[34]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_bioCheckFrameSparseCount != v4[35]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_bioCheckFrameDenseCount != v4[33]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_probingPatternEndTime != *((void *)v4 + 8)) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_probingPatternResult != v4[85]) {
      goto LABEL_569;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v8 & 0x2000000000000000) == 0 || self->_probingPatternFrameCount != v4[81]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x2000000000000000) != 0)
  {
    goto LABEL_569;
  }
  if (has < 0)
  {
    if ((v8 & 0x8000000000000000) == 0 || self->_probingPatternFrameFloodCount != v4[83]) {
      goto LABEL_569;
    }
  }
  else if (v8 < 0)
  {
    goto LABEL_569;
  }
  if (v5)
  {
    if ((v7 & 1) == 0 || self->_probingPatternFrameSparseCount != v4[84]) {
      goto LABEL_569;
    }
  }
  else if (v7)
  {
    goto LABEL_569;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v8 & 0x4000000000000000) == 0 || self->_probingPatternFrameDenseCount != v4[82]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x4000000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_ambientLux != v4[26]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_569;
  }
  if (v5 < 0)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_569;
    }
    if (self->_probingPatternFailure)
    {
      if (!*((unsigned char *)v4 + 379)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 379))
    {
      goto LABEL_569;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_569;
    }
    if (self->_matcherFailure)
    {
      if (!*((unsigned char *)v4 + 375)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 375))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_569;
    }
    if (self->_matchDepthFailure)
    {
      if (!*((unsigned char *)v4 + 372)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 372))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_569;
    }
    if (self->_matchFloodFailure)
    {
      if (!*((unsigned char *)v4 + 373)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 373))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_569;
    }
    if (self->_asFloodFailure)
    {
      if (!*((unsigned char *)v4 + 354)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 354))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_569;
    }
    if (self->_asDepthFailure)
    {
      if (!*((unsigned char *)v4 + 352)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 352))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_569;
    }
    if (self->_onlineTemplateUpdated)
    {
      if (!*((unsigned char *)v4 + 376)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 376))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_569;
    }
    if (self->_passcodeChallengeAllowed)
    {
      if (!*((unsigned char *)v4 + 378)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 378))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v8 & 0x8000000000000) == 0 || self->_featureGenerationError != v4[71]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x8000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_sensorTemperature != v4[86]) {
      goto LABEL_569;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_faceDistance != v4[62]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0) {
      goto LABEL_569;
    }
    if (self->_hasOcclusion)
    {
      if (!*((unsigned char *)v4 + 370)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 370))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_camRectX != v4[42]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_camRectY != v4[43]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_camRectW != v4[41]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_camRectH != v4[40]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x10000000000) != 0)
  {
    if ((v8 & 0x10000000000) == 0 || self->_faceDetectPPMRequestedBudget != v4[60]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x10000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0 || self->_faceDetectPPMAllocatedBudget != v4[59]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_bioCheckPPMRequestedBudget != v4[37]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_bioCheckPPMAllocatedBudget != v4[36]) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_rfcSetIndex != *((void *)v4 + 10)) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_rfcFrameIndex != *((void *)v4 + 9)) {
      goto LABEL_569;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0) {
      goto LABEL_569;
    }
    if (self->_bioLockout)
    {
      if (!*((unsigned char *)v4 + 358)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 358))
    {
      goto LABEL_569;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_569;
  }
  uint64_t v9 = *(void *)(v4 + 95);
  int v10 = v4[97];
  if ((has & 0x8000000) != 0)
  {
    if ((v9 & 0x8000000) == 0 || self->_cameraErr != v4[44]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x8000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0) {
      goto LABEL_569;
    }
    if (self->_matchForUnlock)
    {
      if (!*((unsigned char *)v4 + 374)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 374))
    {
      goto LABEL_569;
    }
  }
  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v9 & 0x4000000000000) == 0 || self->_failedUnlockAttemptsFromFD != v4[70]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x4000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v9 & 0x2000000000000) == 0 || self->_failedUnlockAttemptsFromBiocheck != v4[69]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x2000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v9 & 0x1000000000000) == 0 || self->_failedMatchAttemptsFromFD != v4[68]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x1000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v9 & 0x800000000000) == 0 || self->_failedMatchAttemptsFromBiocheck != v4[67]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x800000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v9 & 0x400000) == 0 || self->_bioLockoutReason != v4[39]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x400000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v9 & 0x10000000000000) == 0 || self->_matchFeatureVectorError != v4[72]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x10000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v9 & 0x80000000000000) == 0 || self->_onlineTemplateAge != v4[75]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x80000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_shortTermTemplateAge != v4[87]) {
      goto LABEL_569;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v9 & 0x400000000) == 0 || self->_faceDetectFaceDistance != v4[54]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x400000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v9 & 0x100000000) == 0 || self->_faceDetectCamRectX != v4[52]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x100000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v9 & 0x200000000) == 0 || self->_faceDetectCamRectY != v4[53]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x200000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v9 & 0x80000000) == 0 || self->_faceDetectCamRectW != v4[51]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x80000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v9 & 0x40000000) == 0 || self->_faceDetectCamRectH != v4[50]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x40000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_bioCheckFaceDistance != v4[31]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_bioCheckCamRectX != v4[29]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_bioCheckCamRectY != v4[30]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_bioCheckCamRectW != v4[28]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_bioCheckCamRectH != v4[27]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v9 & 0x1000000000000000) == 0 || self->_probingPatternFaceDistance != v4[80]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x1000000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v9 & 0x400000000000000) == 0 || self->_probingPatternCamRectX != v4[78]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x400000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v9 & 0x800000000000000) == 0 || self->_probingPatternCamRectY != v4[79]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x800000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v9 & 0x200000000000000) == 0 || self->_probingPatternCamRectW != v4[77]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x200000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v9 & 0x100000000000000) == 0 || self->_probingPatternCamRectH != v4[76]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x100000000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_569;
    }
    if (self->_asFailure)
    {
      if (!*((unsigned char *)v4 + 353)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 353))
    {
      goto LABEL_569;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0) {
      goto LABEL_569;
    }
    if (self->_autoRetry)
    {
      if (!*((unsigned char *)v4 + 355)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 355))
    {
      goto LABEL_569;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_569;
  }
  if ((v5 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0) {
      goto LABEL_569;
    }
    if (self->_autoRetryAllowed)
    {
      if (!*((unsigned char *)v4 + 356)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 356))
    {
      goto LABEL_569;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0 || self->_deviceOrientation != v4[49]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_569;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v9 & 0x20000000000000) == 0 || self->_matchIdentityCount != v4[73]) {
      goto LABEL_569;
    }
  }
  else if ((v9 & 0x20000000000000) != 0)
  {
    goto LABEL_569;
  }
  cameraHWParameters = self->_cameraHWParameters;
  if ((unint64_t)cameraHWParameters | *((void *)v4 + 23)
    && !-[NSString isEqual:](cameraHWParameters, "isEqual:"))
  {
    goto LABEL_569;
  }
  int v12 = *((_DWORD *)&self->_has + 2);
  uint64_t v13 = (uint64_t)self->_has;
  uint64_t v14 = *(void *)(v4 + 95);
  int v15 = v4[97];
  if ((v13 & 0x10000000) != 0)
  {
    if ((v14 & 0x10000000) == 0 || self->_captureMethod != v4[48]) {
      goto LABEL_569;
    }
  }
  else if ((v14 & 0x10000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackNoFaceDetected)
    {
      if (!*((unsigned char *)v4 + 365)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 365))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackFaceTooClose)
    {
      if (!*((unsigned char *)v4 + 362)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 362))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackFaceTooFar)
    {
      if (!*((unsigned char *)v4 + 363)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 363))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x200000) != 0)
  {
    if ((v15 & 0x200000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackPoseOutOfRange)
    {
      if (!*((unsigned char *)v4 + 369)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 369))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x200000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackNoAttention)
    {
      if (!*((unsigned char *)v4 + 364)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 364))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackFaceOccluded)
    {
      if (!*((unsigned char *)v4 + 361)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 361))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackCameraObstructed)
    {
      if (!*((unsigned char *)v4 + 360)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 360))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackPartialOutOfFOV)
    {
      if (!*((unsigned char *)v4 + 367)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 367))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x800) != 0)
  {
    if ((v15 & 0x800) == 0) {
      goto LABEL_569;
    }
    if (self->_combinedSequenceEnabled)
    {
      if (!*((unsigned char *)v4 + 359)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 359))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x800) != 0)
  {
    goto LABEL_569;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_overallTimeWithRetries != *((void *)v4 + 7)) {
      goto LABEL_569;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_569;
  }
  if ((v12 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0) {
      goto LABEL_569;
    }
    if (self->_autoRetryEnabled)
    {
      if (!*((unsigned char *)v4 + 357)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 357))
    {
      goto LABEL_569;
    }
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_569;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_569;
  }
  uint64_t v16 = (uint64_t)self->_has;
  int v17 = *((_DWORD *)&self->_has + 2);
  uint64_t v18 = *(void *)(v4 + 95);
  int v19 = v4[97];
  if ((v17 & 0x800000) != 0)
  {
    if ((v19 & 0x800000) == 0) {
      goto LABEL_569;
    }
    if (self->_matchCancelled)
    {
      if (!*((unsigned char *)v4 + 371)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 371))
    {
      goto LABEL_569;
    }
  }
  else if ((v19 & 0x800000) != 0)
  {
    goto LABEL_569;
  }
  if ((v17 & 0x100000) != 0)
  {
    if ((v19 & 0x100000) == 0) {
      goto LABEL_569;
    }
    if (self->_engagementInfoFeedbackPoseMarginal)
    {
      if (!*((unsigned char *)v4 + 368)) {
        goto LABEL_569;
      }
    }
    else if (*((unsigned char *)v4 + 368))
    {
      goto LABEL_569;
    }
  }
  else if ((v19 & 0x100000) != 0)
  {
    goto LABEL_569;
  }
  if ((v16 & 0x80000000000) != 0)
  {
    if ((v18 & 0x80000000000) == 0 || self->_faceOrientation != v4[63]) {
      goto LABEL_569;
    }
  }
  else if ((v18 & 0x80000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v16 & 0x100000000000) != 0)
  {
    if ((v18 & 0x100000000000) == 0 || self->_facePitch != v4[64]) {
      goto LABEL_569;
    }
  }
  else if ((v18 & 0x100000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v16 & 0x400000000000) != 0)
  {
    if ((v18 & 0x400000000000) == 0 || self->_faceYaw != v4[66]) {
      goto LABEL_569;
    }
  }
  else if ((v18 & 0x400000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v16 & 0x200000000000) != 0)
  {
    if ((v18 & 0x200000000000) == 0 || self->_faceRoll != v4[65]) {
      goto LABEL_569;
    }
  }
  else if ((v18 & 0x200000000000) != 0)
  {
    goto LABEL_569;
  }
  if ((v16 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_timeSinceSleep != *((void *)v4 + 11)) {
      goto LABEL_569;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_569;
  }
  if ((v17 & 0x40000) != 0)
  {
    if ((v19 & 0x40000) != 0)
    {
      if (self->_engagementInfoFeedbackNoseAndMouthOccluded)
      {
        if (!*((unsigned char *)v4 + 366)) {
          goto LABEL_569;
        }
        goto LABEL_564;
      }
      if (!*((unsigned char *)v4 + 366)) {
        goto LABEL_564;
      }
    }
LABEL_569:
    BOOL v20 = 0;
    goto LABEL_570;
  }
  if ((v19 & 0x40000) != 0) {
    goto LABEL_569;
  }
LABEL_564:
  if ((v16 & 0x40000000000000) != 0)
  {
    if ((v18 & 0x40000000000000) == 0 || self->_matchType != v4[74]) {
      goto LABEL_569;
    }
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = (v18 & 0x40000000000000) == 0;
  }
LABEL_570:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3 = *((int *)&self->_has + 2);
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100) != 0)
  {
    unint64_t v5 = 2654435761u * self->_timestamp;
    if ((v3 & 0x20000000) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_overallResult;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((v3 & 0x20000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v7 = 2654435761u * self->_overallTime;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    unint64_t v8 = 2654435761u * self->_faceDetectEndTime;
    if ((has & 0x20000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v8 = 0;
  if ((has & 0x20000000000) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_faceDetectResult;
    if ((has & 0x800000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v9 = 0;
  if ((has & 0x800000000) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_faceDetectFrameCount;
    if ((has & 0x2000000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v10 = 0;
  if ((has & 0x2000000000) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_faceDetectFrameFloodCount;
    if ((has & 0x4000000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v11 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_faceDetectFrameSparseCount;
    if ((has & 0x1000000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v12 = 0;
  if ((has & 0x1000000000) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_faceDetectFrameDenseCount;
    if (has) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v13 = 0;
  if (has)
  {
LABEL_11:
    unint64_t v14 = 2654435761u * self->_bioCheckEndTime;
    if ((has & 0x200000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v14 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_12:
    uint64_t v15 = 2654435761 * self->_bioCheckResult;
    if ((has & 0x8000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v15 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_13:
    uint64_t v16 = 2654435761 * self->_bioCheckFrameCount;
    if ((has & 0x20000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v16 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_14:
    uint64_t v39 = 2654435761 * self->_bioCheckFrameFloodCount;
    if ((has & 0x40000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v39 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_15:
    uint64_t v38 = 2654435761 * self->_bioCheckFrameSparseCount;
    if ((has & 0x10000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v38 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_16:
    uint64_t v36 = 2654435761 * self->_bioCheckFrameDenseCount;
    if ((has & 0x10) != 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v36 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_17:
    unint64_t v17 = 2654435761u * self->_probingPatternEndTime;
    if ((v3 & 2) != 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v17 = 0;
  if ((v3 & 2) != 0)
  {
LABEL_18:
    uint64_t v109 = 2654435761 * self->_probingPatternResult;
    if ((has & 0x2000000000000000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v109 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_19:
    uint64_t v108 = 2654435761 * self->_probingPatternFrameCount;
    if (has < 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v108 = 0;
  if (has < 0)
  {
LABEL_20:
    uint64_t v107 = 2654435761 * self->_probingPatternFrameFloodCount;
    if (v3) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v107 = 0;
  if (v3)
  {
LABEL_21:
    uint64_t v106 = 2654435761 * self->_probingPatternFrameSparseCount;
    if ((has & 0x4000000000000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v106 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_22:
    uint64_t v105 = 2654435761 * self->_probingPatternFrameDenseCount;
    if ((has & 0x200) != 0) {
      goto LABEL_23;
    }
LABEL_46:
    uint64_t v104 = 0;
    if (v3 < 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_45:
  uint64_t v105 = 0;
  if ((has & 0x200) == 0) {
    goto LABEL_46;
  }
LABEL_23:
  uint64_t v104 = 2654435761 * self->_ambientLux;
  if (v3 < 0)
  {
LABEL_24:
    uint64_t v18 = 2654435761 * self->_probingPatternFailure;
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v18 = 0;
LABEL_48:
  uint64_t v117 = v18;
  if ((v3 & 0x8000000) != 0)
  {
    uint64_t v103 = 2654435761 * self->_matcherFailure;
    if ((v3 & 0x1000000) != 0)
    {
LABEL_50:
      uint64_t v102 = 2654435761 * self->_matchDepthFailure;
      if ((v3 & 0x2000000) != 0) {
        goto LABEL_51;
      }
      goto LABEL_102;
    }
  }
  else
  {
    uint64_t v103 = 0;
    if ((v3 & 0x1000000) != 0) {
      goto LABEL_50;
    }
  }
  uint64_t v102 = 0;
  if ((v3 & 0x2000000) != 0)
  {
LABEL_51:
    uint64_t v101 = 2654435761 * self->_matchFloodFailure;
    if ((v3 & 0x40) != 0) {
      goto LABEL_52;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v101 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_52:
    uint64_t v100 = 2654435761 * self->_asFloodFailure;
    if ((v3 & 0x10) != 0) {
      goto LABEL_53;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v100 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_53:
    uint64_t v99 = 2654435761 * self->_asDepthFailure;
    if ((v3 & 0x10000000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v99 = 0;
  if ((v3 & 0x10000000) != 0)
  {
LABEL_54:
    uint64_t v98 = 2654435761 * self->_onlineTemplateUpdated;
    if ((v3 & 0x40000000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v98 = 0;
  if ((v3 & 0x40000000) != 0)
  {
LABEL_55:
    uint64_t v97 = 2654435761 * self->_passcodeChallengeAllowed;
    if ((has & 0x8000000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v97 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_56:
    uint64_t v96 = 2654435761 * self->_featureGenerationError;
    if ((v3 & 4) != 0) {
      goto LABEL_57;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v96 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_57:
    uint64_t v95 = 2654435761 * self->_sensorTemperature;
    if ((has & 0x40000000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_109;
  }
LABEL_108:
  uint64_t v95 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_58:
    uint64_t v94 = 2654435761 * self->_faceDistance;
    if ((v3 & 0x400000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_110;
  }
LABEL_109:
  uint64_t v94 = 0;
  if ((v3 & 0x400000) != 0)
  {
LABEL_59:
    uint64_t v93 = 2654435761 * self->_hasOcclusion;
    if ((has & 0x2000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v93 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_60:
    uint64_t v92 = 2654435761 * self->_camRectX;
    if ((has & 0x4000000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v92 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_61:
    uint64_t v91 = 2654435761 * self->_camRectY;
    if ((has & 0x1000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_113;
  }
LABEL_112:
  uint64_t v91 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_62:
    uint64_t v90 = 2654435761 * self->_camRectW;
    if ((has & 0x800000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_114;
  }
LABEL_113:
  uint64_t v90 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_63:
    uint64_t v89 = 2654435761 * self->_camRectH;
    if ((has & 0x10000000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_115;
  }
LABEL_114:
  uint64_t v89 = 0;
  if ((has & 0x10000000000) != 0)
  {
LABEL_64:
    uint64_t v88 = 2654435761 * self->_faceDetectPPMRequestedBudget;
    if ((has & 0x8000000000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_116;
  }
LABEL_115:
  uint64_t v88 = 0;
  if ((has & 0x8000000000) != 0)
  {
LABEL_65:
    uint64_t v87 = 2654435761 * self->_faceDetectPPMAllocatedBudget;
    if ((has & 0x100000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_117;
  }
LABEL_116:
  uint64_t v87 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_66:
    uint64_t v86 = 2654435761 * self->_bioCheckPPMRequestedBudget;
    if ((has & 0x80000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_118;
  }
LABEL_117:
  uint64_t v86 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_67:
    uint64_t v85 = 2654435761 * self->_bioCheckPPMAllocatedBudget;
    if ((has & 0x40) != 0) {
      goto LABEL_68;
    }
    goto LABEL_119;
  }
LABEL_118:
  uint64_t v85 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_68:
    uint64_t v84 = 2654435761 * self->_rfcSetIndex;
    if ((has & 0x20) != 0) {
      goto LABEL_69;
    }
    goto LABEL_120;
  }
LABEL_119:
  uint64_t v84 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_69:
    uint64_t v83 = 2654435761 * self->_rfcFrameIndex;
    if ((v3 & 0x400) != 0) {
      goto LABEL_70;
    }
    goto LABEL_121;
  }
LABEL_120:
  uint64_t v83 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_70:
    uint64_t v82 = 2654435761 * self->_bioLockout;
    if ((has & 0x8000000) != 0) {
      goto LABEL_71;
    }
    goto LABEL_122;
  }
LABEL_121:
  uint64_t v82 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_71:
    uint64_t v81 = 2654435761 * self->_cameraErr;
    if ((v3 & 0x4000000) != 0) {
      goto LABEL_72;
    }
    goto LABEL_123;
  }
LABEL_122:
  uint64_t v81 = 0;
  if ((v3 & 0x4000000) != 0)
  {
LABEL_72:
    uint64_t v80 = 2654435761 * self->_matchForUnlock;
    if ((has & 0x4000000000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_124;
  }
LABEL_123:
  uint64_t v80 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_73:
    uint64_t v79 = 2654435761 * self->_failedUnlockAttemptsFromFD;
    if ((has & 0x2000000000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_125;
  }
LABEL_124:
  uint64_t v79 = 0;
  if ((has & 0x2000000000000) != 0)
  {
LABEL_74:
    uint64_t v78 = 2654435761 * self->_failedUnlockAttemptsFromBiocheck;
    if ((has & 0x1000000000000) != 0) {
      goto LABEL_75;
    }
    goto LABEL_126;
  }
LABEL_125:
  uint64_t v78 = 0;
  if ((has & 0x1000000000000) != 0)
  {
LABEL_75:
    uint64_t v77 = 2654435761 * self->_failedMatchAttemptsFromFD;
    if ((has & 0x800000000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_127;
  }
LABEL_126:
  uint64_t v77 = 0;
  if ((has & 0x800000000000) != 0)
  {
LABEL_76:
    uint64_t v76 = 2654435761 * self->_failedMatchAttemptsFromBiocheck;
    if ((has & 0x400000) != 0) {
      goto LABEL_77;
    }
    goto LABEL_128;
  }
LABEL_127:
  uint64_t v76 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_77:
    uint64_t v75 = 2654435761 * self->_bioLockoutReason;
    if ((has & 0x10000000000000) != 0) {
      goto LABEL_78;
    }
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v75 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_78:
    uint64_t v74 = 2654435761 * self->_matchFeatureVectorError;
    if ((has & 0x80000000000000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_130;
  }
LABEL_129:
  uint64_t v74 = 0;
  if ((has & 0x80000000000000) != 0)
  {
LABEL_79:
    uint64_t v73 = 2654435761 * self->_onlineTemplateAge;
    if ((v3 & 8) != 0) {
      goto LABEL_80;
    }
    goto LABEL_131;
  }
LABEL_130:
  uint64_t v73 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_80:
    uint64_t v72 = 2654435761 * self->_shortTermTemplateAge;
    if ((has & 0x400000000) != 0) {
      goto LABEL_81;
    }
    goto LABEL_132;
  }
LABEL_131:
  uint64_t v72 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_81:
    uint64_t v71 = 2654435761 * self->_faceDetectFaceDistance;
    if ((has & 0x100000000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_133;
  }
LABEL_132:
  uint64_t v71 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_82:
    uint64_t v70 = 2654435761 * self->_faceDetectCamRectX;
    if ((has & 0x200000000) != 0) {
      goto LABEL_83;
    }
    goto LABEL_134;
  }
LABEL_133:
  uint64_t v70 = 0;
  if ((has & 0x200000000) != 0)
  {
LABEL_83:
    uint64_t v69 = 2654435761 * self->_faceDetectCamRectY;
    if ((has & 0x80000000) != 0) {
      goto LABEL_84;
    }
    goto LABEL_135;
  }
LABEL_134:
  uint64_t v69 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_84:
    uint64_t v68 = 2654435761 * self->_faceDetectCamRectW;
    if ((has & 0x40000000) != 0) {
      goto LABEL_85;
    }
    goto LABEL_136;
  }
LABEL_135:
  uint64_t v68 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_85:
    uint64_t v67 = 2654435761 * self->_faceDetectCamRectH;
    if ((has & 0x4000) != 0) {
      goto LABEL_86;
    }
    goto LABEL_137;
  }
LABEL_136:
  uint64_t v67 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_86:
    uint64_t v66 = 2654435761 * self->_bioCheckFaceDistance;
    if ((has & 0x1000) != 0) {
      goto LABEL_87;
    }
    goto LABEL_138;
  }
LABEL_137:
  uint64_t v66 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_87:
    uint64_t v65 = 2654435761 * self->_bioCheckCamRectX;
    if ((has & 0x2000) != 0) {
      goto LABEL_88;
    }
    goto LABEL_139;
  }
LABEL_138:
  uint64_t v65 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_88:
    uint64_t v64 = 2654435761 * self->_bioCheckCamRectY;
    if ((has & 0x800) != 0) {
      goto LABEL_89;
    }
    goto LABEL_140;
  }
LABEL_139:
  uint64_t v64 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_89:
    uint64_t v63 = 2654435761 * self->_bioCheckCamRectW;
    if ((has & 0x400) != 0) {
      goto LABEL_90;
    }
    goto LABEL_141;
  }
LABEL_140:
  uint64_t v63 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_90:
    uint64_t v62 = 2654435761 * self->_bioCheckCamRectH;
    if ((has & 0x1000000000000000) != 0) {
      goto LABEL_91;
    }
    goto LABEL_142;
  }
LABEL_141:
  uint64_t v62 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_91:
    uint64_t v61 = 2654435761 * self->_probingPatternFaceDistance;
    if ((has & 0x400000000000000) != 0) {
      goto LABEL_92;
    }
    goto LABEL_143;
  }
LABEL_142:
  uint64_t v61 = 0;
  if ((has & 0x400000000000000) != 0)
  {
LABEL_92:
    uint64_t v60 = 2654435761 * self->_probingPatternCamRectX;
    if ((has & 0x800000000000000) != 0) {
      goto LABEL_93;
    }
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v60 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_93:
    uint64_t v59 = 2654435761 * self->_probingPatternCamRectY;
    if ((has & 0x200000000000000) != 0) {
      goto LABEL_94;
    }
    goto LABEL_145;
  }
LABEL_144:
  uint64_t v59 = 0;
  if ((has & 0x200000000000000) != 0)
  {
LABEL_94:
    uint64_t v58 = 2654435761 * self->_probingPatternCamRectW;
    if ((has & 0x100000000000000) != 0) {
      goto LABEL_95;
    }
    goto LABEL_146;
  }
LABEL_145:
  uint64_t v58 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_95:
    uint64_t v57 = 2654435761 * self->_probingPatternCamRectH;
    if ((v3 & 0x20) != 0) {
      goto LABEL_96;
    }
    goto LABEL_147;
  }
LABEL_146:
  uint64_t v57 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_96:
    uint64_t v56 = 2654435761 * self->_asFailure;
    if ((v3 & 0x80) != 0) {
      goto LABEL_97;
    }
    goto LABEL_148;
  }
LABEL_147:
  uint64_t v56 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_97:
    uint64_t v55 = 2654435761 * self->_autoRetry;
    if ((v3 & 0x100) != 0) {
      goto LABEL_98;
    }
LABEL_149:
    uint64_t v54 = 0;
    if ((has & 0x20000000) != 0) {
      goto LABEL_99;
    }
    goto LABEL_150;
  }
LABEL_148:
  uint64_t v55 = 0;
  if ((v3 & 0x100) == 0) {
    goto LABEL_149;
  }
LABEL_98:
  uint64_t v54 = 2654435761 * self->_autoRetryAllowed;
  if ((has & 0x20000000) != 0)
  {
LABEL_99:
    uint64_t v53 = 2654435761 * self->_deviceOrientation;
    goto LABEL_151;
  }
LABEL_150:
  uint64_t v53 = 0;
LABEL_151:
  uint64_t v115 = v12;
  uint64_t v116 = v11;
  unint64_t v113 = v14;
  uint64_t v114 = v13;
  uint64_t v111 = v16;
  uint64_t v112 = v15;
  unint64_t v110 = v17;
  if ((has & 0x20000000000000) != 0) {
    uint64_t v52 = 2654435761 * self->_matchIdentityCount;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_cameraHWParameters hash];
  int v20 = *((_DWORD *)&self->_has + 2);
  uint64_t v21 = (uint64_t)self->_has;
  if ((v21 & 0x10000000) != 0)
  {
    uint64_t v51 = 2654435761 * self->_captureMethod;
    if ((v20 & 0x20000) != 0)
    {
LABEL_156:
      uint64_t v50 = 2654435761 * self->_engagementInfoFeedbackNoFaceDetected;
      if ((v20 & 0x4000) != 0) {
        goto LABEL_157;
      }
      goto LABEL_168;
    }
  }
  else
  {
    uint64_t v51 = 0;
    if ((v20 & 0x20000) != 0) {
      goto LABEL_156;
    }
  }
  uint64_t v50 = 0;
  if ((v20 & 0x4000) != 0)
  {
LABEL_157:
    uint64_t v49 = 2654435761 * self->_engagementInfoFeedbackFaceTooClose;
    if ((v20 & 0x8000) != 0) {
      goto LABEL_158;
    }
    goto LABEL_169;
  }
LABEL_168:
  uint64_t v49 = 0;
  if ((v20 & 0x8000) != 0)
  {
LABEL_158:
    uint64_t v48 = 2654435761 * self->_engagementInfoFeedbackFaceTooFar;
    if ((v20 & 0x200000) != 0) {
      goto LABEL_159;
    }
    goto LABEL_170;
  }
LABEL_169:
  uint64_t v48 = 0;
  if ((v20 & 0x200000) != 0)
  {
LABEL_159:
    uint64_t v47 = 2654435761 * self->_engagementInfoFeedbackPoseOutOfRange;
    if ((v20 & 0x10000) != 0) {
      goto LABEL_160;
    }
    goto LABEL_171;
  }
LABEL_170:
  uint64_t v47 = 0;
  if ((v20 & 0x10000) != 0)
  {
LABEL_160:
    uint64_t v46 = 2654435761 * self->_engagementInfoFeedbackNoAttention;
    if ((v20 & 0x2000) != 0) {
      goto LABEL_161;
    }
    goto LABEL_172;
  }
LABEL_171:
  uint64_t v46 = 0;
  if ((v20 & 0x2000) != 0)
  {
LABEL_161:
    uint64_t v45 = 2654435761 * self->_engagementInfoFeedbackFaceOccluded;
    if ((v20 & 0x1000) != 0) {
      goto LABEL_162;
    }
    goto LABEL_173;
  }
LABEL_172:
  uint64_t v45 = 0;
  if ((v20 & 0x1000) != 0)
  {
LABEL_162:
    uint64_t v44 = 2654435761 * self->_engagementInfoFeedbackCameraObstructed;
    if ((v20 & 0x80000) != 0) {
      goto LABEL_163;
    }
    goto LABEL_174;
  }
LABEL_173:
  uint64_t v44 = 0;
  if ((v20 & 0x80000) != 0)
  {
LABEL_163:
    uint64_t v43 = 2654435761 * self->_engagementInfoFeedbackPartialOutOfFOV;
    if ((v20 & 0x800) != 0) {
      goto LABEL_164;
    }
LABEL_175:
    uint64_t v42 = 0;
    if ((v21 & 8) != 0) {
      goto LABEL_165;
    }
    goto LABEL_176;
  }
LABEL_174:
  uint64_t v43 = 0;
  if ((v20 & 0x800) == 0) {
    goto LABEL_175;
  }
LABEL_164:
  uint64_t v42 = 2654435761 * self->_combinedSequenceEnabled;
  if ((v21 & 8) != 0)
  {
LABEL_165:
    unint64_t v41 = 2654435761u * self->_overallTimeWithRetries;
    goto LABEL_177;
  }
LABEL_176:
  unint64_t v41 = 0;
LABEL_177:
  NSUInteger v22 = v19;
  if ((v20 & 0x200) != 0) {
    uint64_t v40 = 2654435761 * self->_autoRetryEnabled;
  }
  else {
    uint64_t v40 = 0;
  }
  uint64_t v23 = PBRepeatedUInt64Hash();
  int v24 = *((_DWORD *)&self->_has + 2);
  if ((v24 & 0x800000) != 0) {
    uint64_t v25 = 2654435761 * self->_matchCancelled;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t)self->_has;
  if ((v24 & 0x100000) != 0)
  {
    uint64_t v27 = 2654435761 * self->_engagementInfoFeedbackPoseMarginal;
    if ((v26 & 0x80000000000) != 0)
    {
LABEL_185:
      uint64_t v28 = 2654435761 * self->_faceOrientation;
      if ((v26 & 0x100000000000) != 0) {
        goto LABEL_186;
      }
      goto LABEL_194;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if ((v26 & 0x80000000000) != 0) {
      goto LABEL_185;
    }
  }
  uint64_t v28 = 0;
  if ((v26 & 0x100000000000) != 0)
  {
LABEL_186:
    uint64_t v29 = 2654435761 * self->_facePitch;
    if ((v26 & 0x400000000000) != 0) {
      goto LABEL_187;
    }
    goto LABEL_195;
  }
LABEL_194:
  uint64_t v29 = 0;
  if ((v26 & 0x400000000000) != 0)
  {
LABEL_187:
    uint64_t v30 = 2654435761 * self->_faceYaw;
    if ((v26 & 0x200000000000) != 0) {
      goto LABEL_188;
    }
    goto LABEL_196;
  }
LABEL_195:
  uint64_t v30 = 0;
  if ((v26 & 0x200000000000) != 0)
  {
LABEL_188:
    uint64_t v31 = 2654435761 * self->_faceRoll;
    if ((v26 & 0x80) != 0) {
      goto LABEL_189;
    }
    goto LABEL_197;
  }
LABEL_196:
  uint64_t v31 = 0;
  if ((v26 & 0x80) != 0)
  {
LABEL_189:
    unint64_t v32 = 2654435761u * self->_timeSinceSleep;
    if ((v24 & 0x40000) != 0) {
      goto LABEL_190;
    }
LABEL_198:
    uint64_t v33 = 0;
    if ((v26 & 0x40000000000000) != 0) {
      goto LABEL_191;
    }
LABEL_199:
    uint64_t v34 = 0;
    return v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v39 ^ v38 ^ v37 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v117 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v22 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v23 ^ v25 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  }
LABEL_197:
  unint64_t v32 = 0;
  if ((v24 & 0x40000) == 0) {
    goto LABEL_198;
  }
LABEL_190:
  uint64_t v33 = 2654435761 * self->_engagementInfoFeedbackNoseAndMouthOccluded;
  if ((v26 & 0x40000000000000) == 0) {
    goto LABEL_199;
  }
LABEL_191:
  uint64_t v34 = 2654435761 * self->_matchType;
  return v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v39 ^ v38 ^ v37 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v117 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v22 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v23 ^ v25 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = *(void *)(v4 + 380);
  if ((v5 & 0x100) != 0)
  {
    self->_timestamp = *((void *)v4 + 12);
    *(void *)&self->_has |= 0x100uLL;
    uint64_t v5 = *(void *)(v4 + 380);
  }
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x20000000) != 0)
  {
    self->_overallResult = v4[377];
    *((_DWORD *)&self->_has + 2) |= 0x20000000u;
    uint64_t v5 = *(void *)(v4 + 380);
    int v6 = *((_DWORD *)v4 + 97);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_102;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_overallTime = *((void *)v4 + 6);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_faceDetectEndTime = *((void *)v4 + 5);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_faceDetectResult = *((_DWORD *)v4 + 61);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_faceDetectFrameCount = *((_DWORD *)v4 + 55);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_faceDetectFrameFloodCount = *((_DWORD *)v4 + 57);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_faceDetectFrameSparseCount = *((_DWORD *)v4 + 58);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_faceDetectFrameDenseCount = *((_DWORD *)v4 + 56);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 1) == 0)
  {
LABEL_12:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_bioCheckEndTime = *((void *)v4 + 4);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x200000) == 0)
  {
LABEL_13:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_bioCheckResult = *((_DWORD *)v4 + 38);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x8000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_bioCheckFrameCount = *((_DWORD *)v4 + 32);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x20000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_bioCheckFrameFloodCount = *((_DWORD *)v4 + 34);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x40000) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_bioCheckFrameSparseCount = *((_DWORD *)v4 + 35);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_bioCheckFrameDenseCount = *((_DWORD *)v4 + 33);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_probingPatternEndTime = *((void *)v4 + 8);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_probingPatternResult = *((_DWORD *)v4 + 85);
  *((_DWORD *)&self->_has + 2) |= 2u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x2000000000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x8000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_probingPatternFrameCount = *((_DWORD *)v4 + 81);
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x8000000000000000) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_probingPatternFrameFloodCount = *((_DWORD *)v4 + 83);
  *(void *)&self->_has |= 0x8000000000000000;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_probingPatternFrameSparseCount = *((_DWORD *)v4 + 84);
  *((_DWORD *)&self->_has + 2) |= 1u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x4000000000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_probingPatternFrameDenseCount = *((_DWORD *)v4 + 82);
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_ambientLux = *((_DWORD *)v4 + 26);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_probingPatternFailure = v4[379];
  *((_DWORD *)&self->_has + 2) |= 0x80000000;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_matcherFailure = v4[375];
  *((_DWORD *)&self->_has + 2) |= 0x8000000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_matchDepthFailure = v4[372];
  *((_DWORD *)&self->_has + 2) |= 0x1000000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_matchFloodFailure = v4[373];
  *((_DWORD *)&self->_has + 2) |= 0x2000000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x40) == 0)
  {
LABEL_29:
    if ((v6 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_asFloodFailure = v4[354];
  *((_DWORD *)&self->_has + 2) |= 0x40u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x10) == 0)
  {
LABEL_30:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_asDepthFailure = v4[352];
  *((_DWORD *)&self->_has + 2) |= 0x10u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_onlineTemplateUpdated = v4[376];
  *((_DWORD *)&self->_has + 2) |= 0x10000000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x8000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_passcodeChallengeAllowed = v4[378];
  *((_DWORD *)&self->_has + 2) |= 0x40000000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x8000000000000) == 0)
  {
LABEL_33:
    if ((v6 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_featureGenerationError = *((_DWORD *)v4 + 71);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 4) == 0)
  {
LABEL_34:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_sensorTemperature = *((_DWORD *)v4 + 86);
  *((_DWORD *)&self->_has + 2) |= 4u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_faceDistance = *((_DWORD *)v4 + 62);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x400000) == 0)
  {
LABEL_36:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_hasOcclusion = v4[370];
  *((_DWORD *)&self->_has + 2) |= 0x400000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_camRectX = *((_DWORD *)v4 + 42);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_camRectY = *((_DWORD *)v4 + 43);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_camRectW = *((_DWORD *)v4 + 41);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x800000) == 0)
  {
LABEL_40:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_camRectH = *((_DWORD *)v4 + 40);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_faceDetectPPMRequestedBudget = *((_DWORD *)v4 + 60);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_faceDetectPPMAllocatedBudget = *((_DWORD *)v4 + 59);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x100000) == 0)
  {
LABEL_43:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_bioCheckPPMRequestedBudget = *((_DWORD *)v4 + 37);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x80000) == 0)
  {
LABEL_44:
    if ((v5 & 0x40) == 0) {
      goto LABEL_45;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_bioCheckPPMAllocatedBudget = *((_DWORD *)v4 + 36);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x40) == 0)
  {
LABEL_45:
    if ((v5 & 0x20) == 0) {
      goto LABEL_46;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_rfcSetIndex = *((void *)v4 + 10);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x20) == 0)
  {
LABEL_46:
    if ((v6 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_rfcFrameIndex = *((void *)v4 + 9);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x400) == 0)
  {
LABEL_47:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_bioLockout = v4[358];
  *((_DWORD *)&self->_has + 2) |= 0x400u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_cameraErr = *((_DWORD *)v4 + 44);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_49:
    if ((v5 & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_matchForUnlock = v4[374];
  *((_DWORD *)&self->_has + 2) |= 0x4000000u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((v5 & 0x2000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_failedUnlockAttemptsFromFD = *((_DWORD *)v4 + 70);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((v5 & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_failedUnlockAttemptsFromBiocheck = *((_DWORD *)v4 + 69);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((v5 & 0x800000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_failedMatchAttemptsFromFD = *((_DWORD *)v4 + 68);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_53:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_failedMatchAttemptsFromBiocheck = *((_DWORD *)v4 + 67);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x400000) == 0)
  {
LABEL_54:
    if ((v5 & 0x10000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_bioLockoutReason = *((_DWORD *)v4 + 39);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x80000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_152;
  }
LABEL_151:
  self->_matchFeatureVectorError = *((_DWORD *)v4 + 72);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x80000000000000) == 0)
  {
LABEL_56:
    if ((v6 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_153;
  }
LABEL_152:
  self->_onlineTemplateAge = *((_DWORD *)v4 + 75);
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 8) == 0)
  {
LABEL_57:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_shortTermTemplateAge = *((_DWORD *)v4 + 87);
  *((_DWORD *)&self->_has + 2) |= 8u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_58:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_faceDetectFaceDistance = *((_DWORD *)v4 + 54);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_156;
  }
LABEL_155:
  self->_faceDetectCamRectX = *((_DWORD *)v4 + 52);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_157;
  }
LABEL_156:
  self->_faceDetectCamRectY = *((_DWORD *)v4 + 53);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_61:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_158;
  }
LABEL_157:
  self->_faceDetectCamRectW = *((_DWORD *)v4 + 51);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_62:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_159;
  }
LABEL_158:
  self->_faceDetectCamRectH = *((_DWORD *)v4 + 50);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x4000) == 0)
  {
LABEL_63:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_160;
  }
LABEL_159:
  self->_bioCheckFaceDistance = *((_DWORD *)v4 + 31);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x1000) == 0)
  {
LABEL_64:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_161;
  }
LABEL_160:
  self->_bioCheckCamRectX = *((_DWORD *)v4 + 29);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x2000) == 0)
  {
LABEL_65:
    if ((v5 & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_162;
  }
LABEL_161:
  self->_bioCheckCamRectY = *((_DWORD *)v4 + 30);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x800) == 0)
  {
LABEL_66:
    if ((v5 & 0x400) == 0) {
      goto LABEL_67;
    }
    goto LABEL_163;
  }
LABEL_162:
  self->_bioCheckCamRectW = *((_DWORD *)v4 + 28);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x400) == 0)
  {
LABEL_67:
    if ((v5 & 0x1000000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_bioCheckCamRectH = *((_DWORD *)v4 + 27);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x1000000000000000) == 0)
  {
LABEL_68:
    if ((v5 & 0x400000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_165;
  }
LABEL_164:
  self->_probingPatternFaceDistance = *((_DWORD *)v4 + 80);
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x400000000000000) == 0)
  {
LABEL_69:
    if ((v5 & 0x800000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_166;
  }
LABEL_165:
  self->_probingPatternCamRectX = *((_DWORD *)v4 + 78);
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x800000000000000) == 0)
  {
LABEL_70:
    if ((v5 & 0x200000000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_167;
  }
LABEL_166:
  self->_probingPatternCamRectY = *((_DWORD *)v4 + 79);
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x200000000000000) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_168;
  }
LABEL_167:
  self->_probingPatternCamRectW = *((_DWORD *)v4 + 77);
  *(void *)&self->_has |= 0x200000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v5 & 0x100000000000000) == 0)
  {
LABEL_72:
    if ((v6 & 0x20) == 0) {
      goto LABEL_73;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_probingPatternCamRectH = *((_DWORD *)v4 + 76);
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x20) == 0)
  {
LABEL_73:
    if ((v6 & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_asFailure = v4[353];
  *((_DWORD *)&self->_has + 2) |= 0x20u;
  uint64_t v5 = *(void *)(v4 + 380);
  int v6 = *((_DWORD *)v4 + 97);
  if ((v6 & 0x80) == 0)
  {
LABEL_74:
    if ((v6 & 0x100) == 0) {
      goto LABEL_75;
    }
    goto LABEL_171;
  }
LABEL_170:
  self->_autoRetry = v4[355];
  *((_DWORD *)&self->_has + 2) |= 0x80u;
  uint64_t v5 = *(void *)(v4 + 380);
  if ((*((_DWORD *)v4 + 97) & 0x100) == 0)
  {
LABEL_75:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_172;
  }
LABEL_171:
  self->_autoRetryAllowed = v4[356];
  *((_DWORD *)&self->_has + 2) |= 0x100u;
  uint64_t v5 = *(void *)(v4 + 380);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_172:
  self->_deviceOrientation = *((_DWORD *)v4 + 49);
  *(void *)&self->_has |= 0x20000000uLL;
  if ((*(void *)(v4 + 380) & 0x20000000000000) != 0)
  {
LABEL_77:
    self->_matchIdentityCount = *((_DWORD *)v4 + 73);
    *(void *)&self->_has |= 0x20000000000000uLL;
  }
LABEL_78:
  uint64_t v15 = v4;
  if (*((void *)v4 + 23))
  {
    -[AWDBiometricKitMatchAttempt setCameraHWParameters:](self, "setCameraHWParameters:");
    id v4 = v15;
  }
  uint64_t v7 = *(void *)(v4 + 380);
  if ((v7 & 0x10000000) != 0)
  {
    self->_captureMethod = *((_DWORD *)v4 + 48);
    *(void *)&self->_has |= 0x10000000uLL;
    uint64_t v7 = *(void *)(v4 + 380);
  }
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x20000) != 0)
  {
    self->_engagementInfoFeedbackNoFaceDetected = v4[365];
    *((_DWORD *)&self->_has + 2) |= 0x20000u;
    uint64_t v7 = *(void *)(v4 + 380);
    int v8 = *((_DWORD *)v4 + 97);
    if ((v8 & 0x4000) == 0)
    {
LABEL_84:
      if ((v8 & 0x8000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_176;
    }
  }
  else if ((v8 & 0x4000) == 0)
  {
    goto LABEL_84;
  }
  self->_engagementInfoFeedbackFaceTooClose = v4[362];
  *((_DWORD *)&self->_has + 2) |= 0x4000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x8000) == 0)
  {
LABEL_85:
    if ((v8 & 0x200000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_177;
  }
LABEL_176:
  self->_engagementInfoFeedbackFaceTooFar = v4[363];
  *((_DWORD *)&self->_has + 2) |= 0x8000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x200000) == 0)
  {
LABEL_86:
    if ((v8 & 0x10000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_178;
  }
LABEL_177:
  self->_engagementInfoFeedbackPoseOutOfRange = v4[369];
  *((_DWORD *)&self->_has + 2) |= 0x200000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x10000) == 0)
  {
LABEL_87:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_179;
  }
LABEL_178:
  self->_engagementInfoFeedbackNoAttention = v4[364];
  *((_DWORD *)&self->_has + 2) |= 0x10000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x2000) == 0)
  {
LABEL_88:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_180;
  }
LABEL_179:
  self->_engagementInfoFeedbackFaceOccluded = v4[361];
  *((_DWORD *)&self->_has + 2) |= 0x2000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x1000) == 0)
  {
LABEL_89:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_181;
  }
LABEL_180:
  self->_engagementInfoFeedbackCameraObstructed = v4[360];
  *((_DWORD *)&self->_has + 2) |= 0x1000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x80000) == 0)
  {
LABEL_90:
    if ((v8 & 0x800) == 0) {
      goto LABEL_91;
    }
    goto LABEL_182;
  }
LABEL_181:
  self->_engagementInfoFeedbackPartialOutOfFOV = v4[367];
  *((_DWORD *)&self->_has + 2) |= 0x80000u;
  uint64_t v7 = *(void *)(v4 + 380);
  int v8 = *((_DWORD *)v4 + 97);
  if ((v8 & 0x800) == 0)
  {
LABEL_91:
    if ((v7 & 8) == 0) {
      goto LABEL_92;
    }
    goto LABEL_183;
  }
LABEL_182:
  self->_combinedSequenceEnabled = v4[359];
  *((_DWORD *)&self->_has + 2) |= 0x800u;
  int v8 = *((_DWORD *)v4 + 97);
  if ((*(void *)(v4 + 380) & 8) == 0)
  {
LABEL_92:
    if ((v8 & 0x200) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_183:
  self->_overallTimeWithRetries = *((void *)v4 + 7);
  *(void *)&self->_has |= 8uLL;
  if ((*((_DWORD *)v4 + 97) & 0x200) != 0)
  {
LABEL_93:
    self->_autoRetryEnabled = v4[357];
    *((_DWORD *)&self->_has + 2) |= 0x200u;
  }
LABEL_94:
  uint64_t v9 = [v4 identityCreationTimesCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[AWDBiometricKitMatchAttempt addIdentityCreationTime:](self, "addIdentityCreationTime:", [v15 identityCreationTimeAtIndex:i]);
  }
  uint64_t v12 = (uint64_t *)(v15 + 380);
  int v13 = *((_DWORD *)v15 + 97);
  if ((v13 & 0x800000) != 0)
  {
    self->_matchCancelled = v15[371];
    *((_DWORD *)&self->_has + 2) |= 0x800000u;
    uint64_t v14 = *v12;
    int v13 = *((_DWORD *)v15 + 97);
    if ((v13 & 0x100000) == 0) {
      goto LABEL_187;
    }
    goto LABEL_186;
  }
  uint64_t v14 = *v12;
  if ((v13 & 0x100000) != 0)
  {
LABEL_186:
    self->_engagementInfoFeedbackPoseMarginal = v15[368];
    *((_DWORD *)&self->_has + 2) |= 0x100000u;
    uint64_t v14 = *(void *)(v15 + 380);
    int v13 = *((_DWORD *)v15 + 97);
  }
LABEL_187:
  if ((v14 & 0x80000000000) != 0)
  {
    self->_faceOrientation = *((_DWORD *)v15 + 63);
    *(void *)&self->_has |= 0x80000000000uLL;
    uint64_t v14 = *(void *)(v15 + 380);
    int v13 = *((_DWORD *)v15 + 97);
    if ((v14 & 0x100000000000) == 0)
    {
LABEL_189:
      if ((v14 & 0x400000000000) == 0) {
        goto LABEL_190;
      }
      goto LABEL_200;
    }
  }
  else if ((v14 & 0x100000000000) == 0)
  {
    goto LABEL_189;
  }
  self->_facePitch = *((_DWORD *)v15 + 64);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v14 = *(void *)(v15 + 380);
  int v13 = *((_DWORD *)v15 + 97);
  if ((v14 & 0x400000000000) == 0)
  {
LABEL_190:
    if ((v14 & 0x200000000000) == 0) {
      goto LABEL_191;
    }
    goto LABEL_201;
  }
LABEL_200:
  self->_faceYaw = *((_DWORD *)v15 + 66);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v14 = *(void *)(v15 + 380);
  int v13 = *((_DWORD *)v15 + 97);
  if ((v14 & 0x200000000000) == 0)
  {
LABEL_191:
    if ((v14 & 0x80) == 0) {
      goto LABEL_192;
    }
    goto LABEL_202;
  }
LABEL_201:
  self->_faceRoll = *((_DWORD *)v15 + 65);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v14 = *(void *)(v15 + 380);
  int v13 = *((_DWORD *)v15 + 97);
  if ((v14 & 0x80) == 0)
  {
LABEL_192:
    if ((v13 & 0x40000) == 0) {
      goto LABEL_193;
    }
    goto LABEL_203;
  }
LABEL_202:
  self->_timeSinceSleep = *((void *)v15 + 11);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v14 = *(void *)(v15 + 380);
  if ((*((_DWORD *)v15 + 97) & 0x40000) == 0)
  {
LABEL_193:
    if ((v14 & 0x40000000000000) == 0) {
      goto LABEL_195;
    }
    goto LABEL_194;
  }
LABEL_203:
  self->_engagementInfoFeedbackNoseAndMouthOccluded = v15[366];
  *((_DWORD *)&self->_has + 2) |= 0x40000u;
  if ((*(void *)(v15 + 380) & 0x40000000000000) != 0)
  {
LABEL_194:
    self->_matchType = *((_DWORD *)v15 + 74);
    *(void *)&self->_has |= 0x40000000000000uLL;
  }
LABEL_195:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)overallResult
{
  return self->_overallResult;
}

- (unint64_t)overallTime
{
  return self->_overallTime;
}

- (unint64_t)faceDetectEndTime
{
  return self->_faceDetectEndTime;
}

- (unsigned)faceDetectResult
{
  return self->_faceDetectResult;
}

- (unsigned)faceDetectFrameCount
{
  return self->_faceDetectFrameCount;
}

- (unsigned)faceDetectFrameFloodCount
{
  return self->_faceDetectFrameFloodCount;
}

- (unsigned)faceDetectFrameSparseCount
{
  return self->_faceDetectFrameSparseCount;
}

- (unsigned)faceDetectFrameDenseCount
{
  return self->_faceDetectFrameDenseCount;
}

- (unint64_t)bioCheckEndTime
{
  return self->_bioCheckEndTime;
}

- (int)bioCheckResult
{
  return self->_bioCheckResult;
}

- (unsigned)bioCheckFrameCount
{
  return self->_bioCheckFrameCount;
}

- (unsigned)bioCheckFrameFloodCount
{
  return self->_bioCheckFrameFloodCount;
}

- (unsigned)bioCheckFrameSparseCount
{
  return self->_bioCheckFrameSparseCount;
}

- (unsigned)bioCheckFrameDenseCount
{
  return self->_bioCheckFrameDenseCount;
}

- (unint64_t)probingPatternEndTime
{
  return self->_probingPatternEndTime;
}

- (int)probingPatternResult
{
  return self->_probingPatternResult;
}

- (unsigned)probingPatternFrameCount
{
  return self->_probingPatternFrameCount;
}

- (unsigned)probingPatternFrameFloodCount
{
  return self->_probingPatternFrameFloodCount;
}

- (unsigned)probingPatternFrameSparseCount
{
  return self->_probingPatternFrameSparseCount;
}

- (unsigned)probingPatternFrameDenseCount
{
  return self->_probingPatternFrameDenseCount;
}

- (int)ambientLux
{
  return self->_ambientLux;
}

- (BOOL)probingPatternFailure
{
  return self->_probingPatternFailure;
}

- (BOOL)matcherFailure
{
  return self->_matcherFailure;
}

- (BOOL)matchDepthFailure
{
  return self->_matchDepthFailure;
}

- (BOOL)matchFloodFailure
{
  return self->_matchFloodFailure;
}

- (BOOL)asFloodFailure
{
  return self->_asFloodFailure;
}

- (BOOL)asDepthFailure
{
  return self->_asDepthFailure;
}

- (BOOL)onlineTemplateUpdated
{
  return self->_onlineTemplateUpdated;
}

- (BOOL)passcodeChallengeAllowed
{
  return self->_passcodeChallengeAllowed;
}

- (unsigned)featureGenerationError
{
  return self->_featureGenerationError;
}

- (int)sensorTemperature
{
  return self->_sensorTemperature;
}

- (unsigned)faceDistance
{
  return self->_faceDistance;
}

- (BOOL)hasOcclusion
{
  return self->_hasOcclusion;
}

- (unsigned)camRectX
{
  return self->_camRectX;
}

- (unsigned)camRectY
{
  return self->_camRectY;
}

- (unsigned)camRectW
{
  return self->_camRectW;
}

- (unsigned)camRectH
{
  return self->_camRectH;
}

- (unsigned)faceDetectPPMRequestedBudget
{
  return self->_faceDetectPPMRequestedBudget;
}

- (unsigned)faceDetectPPMAllocatedBudget
{
  return self->_faceDetectPPMAllocatedBudget;
}

- (unsigned)bioCheckPPMRequestedBudget
{
  return self->_bioCheckPPMRequestedBudget;
}

- (unsigned)bioCheckPPMAllocatedBudget
{
  return self->_bioCheckPPMAllocatedBudget;
}

- (int64_t)rfcSetIndex
{
  return self->_rfcSetIndex;
}

- (int64_t)rfcFrameIndex
{
  return self->_rfcFrameIndex;
}

- (BOOL)bioLockout
{
  return self->_bioLockout;
}

- (int)cameraErr
{
  return self->_cameraErr;
}

- (BOOL)matchForUnlock
{
  return self->_matchForUnlock;
}

- (unsigned)failedUnlockAttemptsFromFD
{
  return self->_failedUnlockAttemptsFromFD;
}

- (unsigned)failedUnlockAttemptsFromBiocheck
{
  return self->_failedUnlockAttemptsFromBiocheck;
}

- (unsigned)failedMatchAttemptsFromFD
{
  return self->_failedMatchAttemptsFromFD;
}

- (unsigned)failedMatchAttemptsFromBiocheck
{
  return self->_failedMatchAttemptsFromBiocheck;
}

- (unsigned)bioLockoutReason
{
  return self->_bioLockoutReason;
}

- (unsigned)matchFeatureVectorError
{
  return self->_matchFeatureVectorError;
}

- (int)onlineTemplateAge
{
  return self->_onlineTemplateAge;
}

- (int)shortTermTemplateAge
{
  return self->_shortTermTemplateAge;
}

- (unsigned)faceDetectFaceDistance
{
  return self->_faceDetectFaceDistance;
}

- (unsigned)faceDetectCamRectX
{
  return self->_faceDetectCamRectX;
}

- (unsigned)faceDetectCamRectY
{
  return self->_faceDetectCamRectY;
}

- (unsigned)faceDetectCamRectW
{
  return self->_faceDetectCamRectW;
}

- (unsigned)faceDetectCamRectH
{
  return self->_faceDetectCamRectH;
}

- (unsigned)bioCheckFaceDistance
{
  return self->_bioCheckFaceDistance;
}

- (unsigned)bioCheckCamRectX
{
  return self->_bioCheckCamRectX;
}

- (unsigned)bioCheckCamRectY
{
  return self->_bioCheckCamRectY;
}

- (unsigned)bioCheckCamRectW
{
  return self->_bioCheckCamRectW;
}

- (unsigned)bioCheckCamRectH
{
  return self->_bioCheckCamRectH;
}

- (unsigned)probingPatternFaceDistance
{
  return self->_probingPatternFaceDistance;
}

- (unsigned)probingPatternCamRectX
{
  return self->_probingPatternCamRectX;
}

- (unsigned)probingPatternCamRectY
{
  return self->_probingPatternCamRectY;
}

- (unsigned)probingPatternCamRectW
{
  return self->_probingPatternCamRectW;
}

- (unsigned)probingPatternCamRectH
{
  return self->_probingPatternCamRectH;
}

- (BOOL)asFailure
{
  return self->_asFailure;
}

- (BOOL)autoRetry
{
  return self->_autoRetry;
}

- (BOOL)autoRetryAllowed
{
  return self->_autoRetryAllowed;
}

- (unsigned)deviceOrientation
{
  return self->_deviceOrientation;
}

- (unsigned)matchIdentityCount
{
  return self->_matchIdentityCount;
}

- (NSString)cameraHWParameters
{
  return self->_cameraHWParameters;
}

- (void)setCameraHWParameters:(id)a3
{
}

- (unsigned)captureMethod
{
  return self->_captureMethod;
}

- (BOOL)engagementInfoFeedbackNoFaceDetected
{
  return self->_engagementInfoFeedbackNoFaceDetected;
}

- (BOOL)engagementInfoFeedbackFaceTooClose
{
  return self->_engagementInfoFeedbackFaceTooClose;
}

- (BOOL)engagementInfoFeedbackFaceTooFar
{
  return self->_engagementInfoFeedbackFaceTooFar;
}

- (BOOL)engagementInfoFeedbackPoseOutOfRange
{
  return self->_engagementInfoFeedbackPoseOutOfRange;
}

- (BOOL)engagementInfoFeedbackNoAttention
{
  return self->_engagementInfoFeedbackNoAttention;
}

- (BOOL)engagementInfoFeedbackFaceOccluded
{
  return self->_engagementInfoFeedbackFaceOccluded;
}

- (BOOL)engagementInfoFeedbackCameraObstructed
{
  return self->_engagementInfoFeedbackCameraObstructed;
}

- (BOOL)engagementInfoFeedbackPartialOutOfFOV
{
  return self->_engagementInfoFeedbackPartialOutOfFOV;
}

- (BOOL)combinedSequenceEnabled
{
  return self->_combinedSequenceEnabled;
}

- (unint64_t)overallTimeWithRetries
{
  return self->_overallTimeWithRetries;
}

- (BOOL)autoRetryEnabled
{
  return self->_autoRetryEnabled;
}

- (BOOL)matchCancelled
{
  return self->_matchCancelled;
}

- (BOOL)engagementInfoFeedbackPoseMarginal
{
  return self->_engagementInfoFeedbackPoseMarginal;
}

- (unsigned)faceOrientation
{
  return self->_faceOrientation;
}

- (int)facePitch
{
  return self->_facePitch;
}

- (int)faceYaw
{
  return self->_faceYaw;
}

- (int)faceRoll
{
  return self->_faceRoll;
}

- (unint64_t)timeSinceSleep
{
  return self->_timeSinceSleep;
}

- (BOOL)engagementInfoFeedbackNoseAndMouthOccluded
{
  return self->_engagementInfoFeedbackNoseAndMouthOccluded;
}

- (unsigned)matchType
{
  return self->_matchType;
}

- (void).cxx_destruct
{
}

@end