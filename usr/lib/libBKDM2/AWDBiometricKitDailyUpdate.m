@interface AWDBiometricKitDailyUpdate
- (BOOL)applePayEnabled;
- (BOOL)attentionDetectionEnabled;
- (BOOL)autoRetryEnabled;
- (BOOL)cameraInterlock;
- (BOOL)combinedSequenceEnabled;
- (BOOL)hasApplePayEnabled;
- (BOOL)hasAttentionDetectionEnabled;
- (BOOL)hasAutoRetryEnabled;
- (BOOL)hasBaseTemplateFeatureCountType0Identity0;
- (BOOL)hasBaseTemplateFeatureCountType0Identity1;
- (BOOL)hasBaseTemplateFeatureCountType1Identity0;
- (BOOL)hasBaseTemplateFeatureCountType1Identity1;
- (BOOL)hasBioLockoutCount;
- (BOOL)hasBioLockoutTime;
- (BOOL)hasCameraInterlock;
- (BOOL)hasCombinedSequenceEnabled;
- (BOOL)hasEnrolledIdentityCount;
- (BOOL)hasEnrolledTemplateCountTotal;
- (BOOL)hasEnrolledTemplateCountType0;
- (BOOL)hasEnrolledTemplateCountType1;
- (BOOL)hasMatchAttemptsFaceDetectedType0;
- (BOOL)hasMatchAttemptsFaceDetectedType1;
- (BOOL)hasMatchAttemptsFailedType0;
- (BOOL)hasMatchAttemptsFailedType1;
- (BOOL)hasMatchAttemptsSuccessfulType0;
- (BOOL)hasMatchAttemptsSuccessfulType1;
- (BOOL)hasMatchAttemptsType0;
- (BOOL)hasMatchAttemptsType1;
- (BOOL)hasMatchingCountDouble01;
- (BOOL)hasMatchingCountDouble02;
- (BOOL)hasMatchingCountDouble03;
- (BOOL)hasMatchingCountDouble04;
- (BOOL)hasMatchingTemplateCountType0Identity0;
- (BOOL)hasMatchingTemplateCountType0Identity1;
- (BOOL)hasMatchingTemplateCountType1Identity0;
- (BOOL)hasMatchingTemplateCountType1Identity1;
- (BOOL)hasOnlineUnlockCount;
- (BOOL)hasOnlineUnlockCountType0;
- (BOOL)hasOnlineUnlockCountType1;
- (BOOL)hasOnlineUpdateTemplateFeatureCountType0Identity0;
- (BOOL)hasOnlineUpdateTemplateFeatureCountType0Identity1;
- (BOOL)hasOnlineUpdateTemplateFeatureCountType1Identity0;
- (BOOL)hasOnlineUpdateTemplateFeatureCountType1Identity1;
- (BOOL)hasPasscodeUpdateTemplateFeatureCountType0Identity0;
- (BOOL)hasPasscodeUpdateTemplateFeatureCountType0Identity1;
- (BOOL)hasPasscodeUpdateTemplateFeatureCountType1Identity0;
- (BOOL)hasPasscodeUpdateTemplateFeatureCountType1Identity1;
- (BOOL)hasShortTermUnlockCount;
- (BOOL)hasShortTermUnlockCountType0;
- (BOOL)hasShortTermUnlockCountType1;
- (BOOL)hasStaticUnlockCount;
- (BOOL)hasStaticUnlockCountType0;
- (BOOL)hasStaticUnlockCountType1;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalMatchAttempts;
- (BOOL)hasTotalMatchAttemptsFaceDetected;
- (BOOL)hasTotalMatchAttemptsFailed;
- (BOOL)hasTotalMatchAttemptsSuccessful;
- (BOOL)hasType1MatchEnabled;
- (BOOL)hasUnlockEnabled;
- (BOOL)hasYogiErrorDays;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)type1MatchEnabled;
- (BOOL)unlockEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)baseTemplateFeatureCountsCount;
- (unint64_t)bioCheckInfosCount;
- (unint64_t)bioCheckResultsCount;
- (unint64_t)bioLockoutTime;
- (unint64_t)hash;
- (unint64_t)matchingBinCountsCount;
- (unint64_t)matchingIdentityCountsCount;
- (unint64_t)matchingTemplateTypeCountsCount;
- (unint64_t)onlineUpdateTemplateFeatureCountsCount;
- (unint64_t)passcodeUpdateTemplateFeatureCountsCount;
- (unint64_t)passcodeUpdatesCount;
- (unint64_t)timestamp;
- (unsigned)baseTemplateFeatureCountAtIndex:(unint64_t)a3;
- (unsigned)baseTemplateFeatureCountType0Identity0;
- (unsigned)baseTemplateFeatureCountType0Identity1;
- (unsigned)baseTemplateFeatureCountType1Identity0;
- (unsigned)baseTemplateFeatureCountType1Identity1;
- (unsigned)baseTemplateFeatureCounts;
- (unsigned)bioCheckInfoAtIndex:(unint64_t)a3;
- (unsigned)bioCheckInfos;
- (unsigned)bioCheckResultAtIndex:(unint64_t)a3;
- (unsigned)bioCheckResults;
- (unsigned)bioLockoutCount;
- (unsigned)enrolledIdentityCount;
- (unsigned)enrolledTemplateCountTotal;
- (unsigned)enrolledTemplateCountType0;
- (unsigned)enrolledTemplateCountType1;
- (unsigned)matchAttemptsFaceDetectedType0;
- (unsigned)matchAttemptsFaceDetectedType1;
- (unsigned)matchAttemptsFailedType0;
- (unsigned)matchAttemptsFailedType1;
- (unsigned)matchAttemptsSuccessfulType0;
- (unsigned)matchAttemptsSuccessfulType1;
- (unsigned)matchAttemptsType0;
- (unsigned)matchAttemptsType1;
- (unsigned)matchingBinCounts;
- (unsigned)matchingBinCountsAtIndex:(unint64_t)a3;
- (unsigned)matchingCountDouble01;
- (unsigned)matchingCountDouble02;
- (unsigned)matchingCountDouble03;
- (unsigned)matchingCountDouble04;
- (unsigned)matchingIdentityCounts;
- (unsigned)matchingIdentityCountsAtIndex:(unint64_t)a3;
- (unsigned)matchingTemplateCountType0Identity0;
- (unsigned)matchingTemplateCountType0Identity1;
- (unsigned)matchingTemplateCountType1Identity0;
- (unsigned)matchingTemplateCountType1Identity1;
- (unsigned)matchingTemplateTypeCounts;
- (unsigned)matchingTemplateTypeCountsAtIndex:(unint64_t)a3;
- (unsigned)onlineUnlockCount;
- (unsigned)onlineUnlockCountType0;
- (unsigned)onlineUnlockCountType1;
- (unsigned)onlineUpdateTemplateFeatureCountAtIndex:(unint64_t)a3;
- (unsigned)onlineUpdateTemplateFeatureCountType0Identity0;
- (unsigned)onlineUpdateTemplateFeatureCountType0Identity1;
- (unsigned)onlineUpdateTemplateFeatureCountType1Identity0;
- (unsigned)onlineUpdateTemplateFeatureCountType1Identity1;
- (unsigned)onlineUpdateTemplateFeatureCounts;
- (unsigned)passcodeUpdateAtIndex:(unint64_t)a3;
- (unsigned)passcodeUpdateTemplateFeatureCountAtIndex:(unint64_t)a3;
- (unsigned)passcodeUpdateTemplateFeatureCountType0Identity0;
- (unsigned)passcodeUpdateTemplateFeatureCountType0Identity1;
- (unsigned)passcodeUpdateTemplateFeatureCountType1Identity0;
- (unsigned)passcodeUpdateTemplateFeatureCountType1Identity1;
- (unsigned)passcodeUpdateTemplateFeatureCounts;
- (unsigned)passcodeUpdates;
- (unsigned)shortTermUnlockCount;
- (unsigned)shortTermUnlockCountType0;
- (unsigned)shortTermUnlockCountType1;
- (unsigned)staticUnlockCount;
- (unsigned)staticUnlockCountType0;
- (unsigned)staticUnlockCountType1;
- (unsigned)totalMatchAttempts;
- (unsigned)totalMatchAttemptsFaceDetected;
- (unsigned)totalMatchAttemptsFailed;
- (unsigned)totalMatchAttemptsSuccessful;
- (unsigned)yogiErrorDays;
- (void)addBaseTemplateFeatureCount:(unsigned int)a3;
- (void)addBioCheckInfo:(unsigned int)a3;
- (void)addBioCheckResult:(unsigned int)a3;
- (void)addMatchingBinCounts:(unsigned int)a3;
- (void)addMatchingIdentityCounts:(unsigned int)a3;
- (void)addMatchingTemplateTypeCounts:(unsigned int)a3;
- (void)addOnlineUpdateTemplateFeatureCount:(unsigned int)a3;
- (void)addPasscodeUpdate:(unsigned int)a3;
- (void)addPasscodeUpdateTemplateFeatureCount:(unsigned int)a3;
- (void)clearBaseTemplateFeatureCounts;
- (void)clearBioCheckInfos;
- (void)clearBioCheckResults;
- (void)clearMatchingBinCounts;
- (void)clearMatchingIdentityCounts;
- (void)clearMatchingTemplateTypeCounts;
- (void)clearOnlineUpdateTemplateFeatureCounts;
- (void)clearPasscodeUpdateTemplateFeatureCounts;
- (void)clearPasscodeUpdates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApplePayEnabled:(BOOL)a3;
- (void)setAttentionDetectionEnabled:(BOOL)a3;
- (void)setAutoRetryEnabled:(BOOL)a3;
- (void)setBaseTemplateFeatureCountType0Identity0:(unsigned int)a3;
- (void)setBaseTemplateFeatureCountType0Identity1:(unsigned int)a3;
- (void)setBaseTemplateFeatureCountType1Identity0:(unsigned int)a3;
- (void)setBaseTemplateFeatureCountType1Identity1:(unsigned int)a3;
- (void)setBaseTemplateFeatureCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setBioCheckInfos:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setBioCheckResults:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setBioLockoutCount:(unsigned int)a3;
- (void)setBioLockoutTime:(unint64_t)a3;
- (void)setCameraInterlock:(BOOL)a3;
- (void)setCombinedSequenceEnabled:(BOOL)a3;
- (void)setEnrolledIdentityCount:(unsigned int)a3;
- (void)setEnrolledTemplateCountTotal:(unsigned int)a3;
- (void)setEnrolledTemplateCountType0:(unsigned int)a3;
- (void)setEnrolledTemplateCountType1:(unsigned int)a3;
- (void)setHasApplePayEnabled:(BOOL)a3;
- (void)setHasAttentionDetectionEnabled:(BOOL)a3;
- (void)setHasAutoRetryEnabled:(BOOL)a3;
- (void)setHasBaseTemplateFeatureCountType0Identity0:(BOOL)a3;
- (void)setHasBaseTemplateFeatureCountType0Identity1:(BOOL)a3;
- (void)setHasBaseTemplateFeatureCountType1Identity0:(BOOL)a3;
- (void)setHasBaseTemplateFeatureCountType1Identity1:(BOOL)a3;
- (void)setHasBioLockoutCount:(BOOL)a3;
- (void)setHasBioLockoutTime:(BOOL)a3;
- (void)setHasCameraInterlock:(BOOL)a3;
- (void)setHasCombinedSequenceEnabled:(BOOL)a3;
- (void)setHasEnrolledIdentityCount:(BOOL)a3;
- (void)setHasEnrolledTemplateCountTotal:(BOOL)a3;
- (void)setHasEnrolledTemplateCountType0:(BOOL)a3;
- (void)setHasEnrolledTemplateCountType1:(BOOL)a3;
- (void)setHasMatchAttemptsFaceDetectedType0:(BOOL)a3;
- (void)setHasMatchAttemptsFaceDetectedType1:(BOOL)a3;
- (void)setHasMatchAttemptsFailedType0:(BOOL)a3;
- (void)setHasMatchAttemptsFailedType1:(BOOL)a3;
- (void)setHasMatchAttemptsSuccessfulType0:(BOOL)a3;
- (void)setHasMatchAttemptsSuccessfulType1:(BOOL)a3;
- (void)setHasMatchAttemptsType0:(BOOL)a3;
- (void)setHasMatchAttemptsType1:(BOOL)a3;
- (void)setHasMatchingCountDouble01:(BOOL)a3;
- (void)setHasMatchingCountDouble02:(BOOL)a3;
- (void)setHasMatchingCountDouble03:(BOOL)a3;
- (void)setHasMatchingCountDouble04:(BOOL)a3;
- (void)setHasMatchingTemplateCountType0Identity0:(BOOL)a3;
- (void)setHasMatchingTemplateCountType0Identity1:(BOOL)a3;
- (void)setHasMatchingTemplateCountType1Identity0:(BOOL)a3;
- (void)setHasMatchingTemplateCountType1Identity1:(BOOL)a3;
- (void)setHasOnlineUnlockCount:(BOOL)a3;
- (void)setHasOnlineUnlockCountType0:(BOOL)a3;
- (void)setHasOnlineUnlockCountType1:(BOOL)a3;
- (void)setHasOnlineUpdateTemplateFeatureCountType0Identity0:(BOOL)a3;
- (void)setHasOnlineUpdateTemplateFeatureCountType0Identity1:(BOOL)a3;
- (void)setHasOnlineUpdateTemplateFeatureCountType1Identity0:(BOOL)a3;
- (void)setHasOnlineUpdateTemplateFeatureCountType1Identity1:(BOOL)a3;
- (void)setHasPasscodeUpdateTemplateFeatureCountType0Identity0:(BOOL)a3;
- (void)setHasPasscodeUpdateTemplateFeatureCountType0Identity1:(BOOL)a3;
- (void)setHasPasscodeUpdateTemplateFeatureCountType1Identity0:(BOOL)a3;
- (void)setHasPasscodeUpdateTemplateFeatureCountType1Identity1:(BOOL)a3;
- (void)setHasShortTermUnlockCount:(BOOL)a3;
- (void)setHasShortTermUnlockCountType0:(BOOL)a3;
- (void)setHasShortTermUnlockCountType1:(BOOL)a3;
- (void)setHasStaticUnlockCount:(BOOL)a3;
- (void)setHasStaticUnlockCountType0:(BOOL)a3;
- (void)setHasStaticUnlockCountType1:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalMatchAttempts:(BOOL)a3;
- (void)setHasTotalMatchAttemptsFaceDetected:(BOOL)a3;
- (void)setHasTotalMatchAttemptsFailed:(BOOL)a3;
- (void)setHasTotalMatchAttemptsSuccessful:(BOOL)a3;
- (void)setHasType1MatchEnabled:(BOOL)a3;
- (void)setHasUnlockEnabled:(BOOL)a3;
- (void)setHasYogiErrorDays:(BOOL)a3;
- (void)setMatchAttemptsFaceDetectedType0:(unsigned int)a3;
- (void)setMatchAttemptsFaceDetectedType1:(unsigned int)a3;
- (void)setMatchAttemptsFailedType0:(unsigned int)a3;
- (void)setMatchAttemptsFailedType1:(unsigned int)a3;
- (void)setMatchAttemptsSuccessfulType0:(unsigned int)a3;
- (void)setMatchAttemptsSuccessfulType1:(unsigned int)a3;
- (void)setMatchAttemptsType0:(unsigned int)a3;
- (void)setMatchAttemptsType1:(unsigned int)a3;
- (void)setMatchingBinCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setMatchingCountDouble01:(unsigned int)a3;
- (void)setMatchingCountDouble02:(unsigned int)a3;
- (void)setMatchingCountDouble03:(unsigned int)a3;
- (void)setMatchingCountDouble04:(unsigned int)a3;
- (void)setMatchingIdentityCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setMatchingTemplateCountType0Identity0:(unsigned int)a3;
- (void)setMatchingTemplateCountType0Identity1:(unsigned int)a3;
- (void)setMatchingTemplateCountType1Identity0:(unsigned int)a3;
- (void)setMatchingTemplateCountType1Identity1:(unsigned int)a3;
- (void)setMatchingTemplateTypeCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setOnlineUnlockCount:(unsigned int)a3;
- (void)setOnlineUnlockCountType0:(unsigned int)a3;
- (void)setOnlineUnlockCountType1:(unsigned int)a3;
- (void)setOnlineUpdateTemplateFeatureCountType0Identity0:(unsigned int)a3;
- (void)setOnlineUpdateTemplateFeatureCountType0Identity1:(unsigned int)a3;
- (void)setOnlineUpdateTemplateFeatureCountType1Identity0:(unsigned int)a3;
- (void)setOnlineUpdateTemplateFeatureCountType1Identity1:(unsigned int)a3;
- (void)setOnlineUpdateTemplateFeatureCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPasscodeUpdateTemplateFeatureCountType0Identity0:(unsigned int)a3;
- (void)setPasscodeUpdateTemplateFeatureCountType0Identity1:(unsigned int)a3;
- (void)setPasscodeUpdateTemplateFeatureCountType1Identity0:(unsigned int)a3;
- (void)setPasscodeUpdateTemplateFeatureCountType1Identity1:(unsigned int)a3;
- (void)setPasscodeUpdateTemplateFeatureCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPasscodeUpdates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setShortTermUnlockCount:(unsigned int)a3;
- (void)setShortTermUnlockCountType0:(unsigned int)a3;
- (void)setShortTermUnlockCountType1:(unsigned int)a3;
- (void)setStaticUnlockCount:(unsigned int)a3;
- (void)setStaticUnlockCountType0:(unsigned int)a3;
- (void)setStaticUnlockCountType1:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalMatchAttempts:(unsigned int)a3;
- (void)setTotalMatchAttemptsFaceDetected:(unsigned int)a3;
- (void)setTotalMatchAttemptsFailed:(unsigned int)a3;
- (void)setTotalMatchAttemptsSuccessful:(unsigned int)a3;
- (void)setType1MatchEnabled:(BOOL)a3;
- (void)setUnlockEnabled:(BOOL)a3;
- (void)setYogiErrorDays:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBiometricKitDailyUpdate

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDBiometricKitDailyUpdate;
  [(AWDBiometricKitDailyUpdate *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)baseTemplateFeatureCountsCount
{
  return self->_baseTemplateFeatureCounts.count;
}

- (unsigned)baseTemplateFeatureCounts
{
  return self->_baseTemplateFeatureCounts.list;
}

- (void)clearBaseTemplateFeatureCounts
{
}

- (void)addBaseTemplateFeatureCount:(unsigned int)a3
{
}

- (unsigned)baseTemplateFeatureCountAtIndex:(unint64_t)a3
{
  p_baseTemplateFeatureCounts = &self->_baseTemplateFeatureCounts;
  unint64_t count = self->_baseTemplateFeatureCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_baseTemplateFeatureCounts->list[a3];
}

- (void)setBaseTemplateFeatureCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)onlineUpdateTemplateFeatureCountsCount
{
  return self->_onlineUpdateTemplateFeatureCounts.count;
}

- (unsigned)onlineUpdateTemplateFeatureCounts
{
  return self->_onlineUpdateTemplateFeatureCounts.list;
}

- (void)clearOnlineUpdateTemplateFeatureCounts
{
}

- (void)addOnlineUpdateTemplateFeatureCount:(unsigned int)a3
{
}

- (unsigned)onlineUpdateTemplateFeatureCountAtIndex:(unint64_t)a3
{
  p_onlineUpdateTemplateFeatureCounts = &self->_onlineUpdateTemplateFeatureCounts;
  unint64_t count = self->_onlineUpdateTemplateFeatureCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_onlineUpdateTemplateFeatureCounts->list[a3];
}

- (void)setOnlineUpdateTemplateFeatureCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)passcodeUpdateTemplateFeatureCountsCount
{
  return self->_passcodeUpdateTemplateFeatureCounts.count;
}

- (unsigned)passcodeUpdateTemplateFeatureCounts
{
  return self->_passcodeUpdateTemplateFeatureCounts.list;
}

- (void)clearPasscodeUpdateTemplateFeatureCounts
{
}

- (void)addPasscodeUpdateTemplateFeatureCount:(unsigned int)a3
{
}

- (unsigned)passcodeUpdateTemplateFeatureCountAtIndex:(unint64_t)a3
{
  p_passcodeUpdateTemplateFeatureCounts = &self->_passcodeUpdateTemplateFeatureCounts;
  unint64_t count = self->_passcodeUpdateTemplateFeatureCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_passcodeUpdateTemplateFeatureCounts->list[a3];
}

- (void)setPasscodeUpdateTemplateFeatureCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setUnlockEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_unlockEnabled = a3;
}

- (void)setHasUnlockEnabled:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUnlockEnabled
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setApplePayEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_applePayEnabled = a3;
}

- (void)setHasApplePayEnabled:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasApplePayEnabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_attentionDetectionEnabled = a3;
}

- (void)setHasAttentionDetectionEnabled:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasAttentionDetectionEnabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setMatchingCountDouble01:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_matchingCountDouble01 = a3;
}

- (void)setHasMatchingCountDouble01:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMatchingCountDouble01
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMatchingCountDouble02:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_matchingCountDouble02 = a3;
}

- (void)setHasMatchingCountDouble02:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMatchingCountDouble02
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMatchingCountDouble03:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_matchingCountDouble03 = a3;
}

- (void)setHasMatchingCountDouble03:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMatchingCountDouble03
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMatchingCountDouble04:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_matchingCountDouble04 = a3;
}

- (void)setHasMatchingCountDouble04:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMatchingCountDouble04
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setStaticUnlockCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_staticUnlockCount = a3;
}

- (void)setHasStaticUnlockCount:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasStaticUnlockCount
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setOnlineUnlockCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_onlineUnlockCount = a3;
}

- (void)setHasOnlineUnlockCount:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasOnlineUnlockCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setShortTermUnlockCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_shortTermUnlockCount = a3;
}

- (void)setHasShortTermUnlockCount:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasShortTermUnlockCount
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (unint64_t)matchingBinCountsCount
{
  return self->_matchingBinCounts.count;
}

- (unsigned)matchingBinCounts
{
  return self->_matchingBinCounts.list;
}

- (void)clearMatchingBinCounts
{
}

- (void)addMatchingBinCounts:(unsigned int)a3
{
}

- (unsigned)matchingBinCountsAtIndex:(unint64_t)a3
{
  p_matchingBinCounts = &self->_matchingBinCounts;
  unint64_t count = self->_matchingBinCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_matchingBinCounts->list[a3];
}

- (void)setMatchingBinCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)matchingTemplateTypeCountsCount
{
  return self->_matchingTemplateTypeCounts.count;
}

- (unsigned)matchingTemplateTypeCounts
{
  return self->_matchingTemplateTypeCounts.list;
}

- (void)clearMatchingTemplateTypeCounts
{
}

- (void)addMatchingTemplateTypeCounts:(unsigned int)a3
{
}

- (unsigned)matchingTemplateTypeCountsAtIndex:(unint64_t)a3
{
  p_matchingTemplateTypeCounts = &self->_matchingTemplateTypeCounts;
  unint64_t count = self->_matchingTemplateTypeCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_matchingTemplateTypeCounts->list[a3];
}

- (void)setMatchingTemplateTypeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setCameraInterlock:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_cameraInterlock = a3;
}

- (void)setHasCameraInterlock:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasCameraInterlock
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (unint64_t)bioCheckInfosCount
{
  return self->_bioCheckInfos.count;
}

- (unsigned)bioCheckInfos
{
  return self->_bioCheckInfos.list;
}

- (void)clearBioCheckInfos
{
}

- (void)addBioCheckInfo:(unsigned int)a3
{
}

- (unsigned)bioCheckInfoAtIndex:(unint64_t)a3
{
  p_bioCheckInfos = &self->_bioCheckInfos;
  unint64_t count = self->_bioCheckInfos.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_bioCheckInfos->list[a3];
}

- (void)setBioCheckInfos:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bioCheckResultsCount
{
  return self->_bioCheckResults.count;
}

- (unsigned)bioCheckResults
{
  return self->_bioCheckResults.list;
}

- (void)clearBioCheckResults
{
}

- (void)addBioCheckResult:(unsigned int)a3
{
}

- (unsigned)bioCheckResultAtIndex:(unint64_t)a3
{
  p_bioCheckResults = &self->_bioCheckResults;
  unint64_t count = self->_bioCheckResults.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_bioCheckResults->list[a3];
}

- (void)setBioCheckResults:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)passcodeUpdatesCount
{
  return self->_passcodeUpdates.count;
}

- (unsigned)passcodeUpdates
{
  return self->_passcodeUpdates.list;
}

- (void)clearPasscodeUpdates
{
}

- (void)addPasscodeUpdate:(unsigned int)a3
{
}

- (unsigned)passcodeUpdateAtIndex:(unint64_t)a3
{
  p_passcodeUpdates = &self->_passcodeUpdates;
  unint64_t count = self->_passcodeUpdates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_passcodeUpdates->list[a3];
}

- (void)setPasscodeUpdates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setEnrolledIdentityCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_enrolledIdentityCount = a3;
}

- (void)setHasEnrolledIdentityCount:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasEnrolledIdentityCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (unint64_t)matchingIdentityCountsCount
{
  return self->_matchingIdentityCounts.count;
}

- (unsigned)matchingIdentityCounts
{
  return self->_matchingIdentityCounts.list;
}

- (void)clearMatchingIdentityCounts
{
}

- (void)addMatchingIdentityCounts:(unsigned int)a3
{
}

- (unsigned)matchingIdentityCountsAtIndex:(unint64_t)a3
{
  p_matchingIdentityCounts = &self->_matchingIdentityCounts;
  unint64_t count = self->_matchingIdentityCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = [NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_matchingIdentityCounts->list[a3];
}

- (void)setMatchingIdentityCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setCombinedSequenceEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_combinedSequenceEnabled = a3;
}

- (void)setHasCombinedSequenceEnabled:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasCombinedSequenceEnabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setBioLockoutTime:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_bioLockoutTime = a3;
}

- (void)setHasBioLockoutTime:(BOOL)a3
{
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasBioLockoutTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBioLockoutCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_bioLockoutCount = a3;
}

- (void)setHasBioLockoutCount:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBioLockoutCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAutoRetryEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_autoRetryEnabled = a3;
}

- (void)setHasAutoRetryEnabled:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasAutoRetryEnabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setYogiErrorDays:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_yogiErrorDays = a3;
}

- (void)setHasYogiErrorDays:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasYogiErrorDays
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setTotalMatchAttempts:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_totalMatchAttempts = a3;
}

- (void)setHasTotalMatchAttempts:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalMatchAttempts
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTotalMatchAttemptsSuccessful:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_totalMatchAttemptsSuccessful = a3;
}

- (void)setHasTotalMatchAttemptsSuccessful:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalMatchAttemptsSuccessful
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setTotalMatchAttemptsFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_totalMatchAttemptsFailed = a3;
}

- (void)setHasTotalMatchAttemptsFailed:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalMatchAttemptsFailed
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setTotalMatchAttemptsFaceDetected:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_totalMatchAttemptsFaceDetected = a3;
}

- (void)setHasTotalMatchAttemptsFaceDetected:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalMatchAttemptsFaceDetected
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setMatchAttemptsType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_matchAttemptsType0 = a3;
}

- (void)setHasMatchAttemptsType0:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMatchAttemptsType0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMatchAttemptsSuccessfulType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_matchAttemptsSuccessfulType0 = a3;
}

- (void)setHasMatchAttemptsSuccessfulType0:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMatchAttemptsSuccessfulType0
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMatchAttemptsFailedType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_matchAttemptsFailedType0 = a3;
}

- (void)setHasMatchAttemptsFailedType0:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasMatchAttemptsFailedType0
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMatchAttemptsFaceDetectedType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_matchAttemptsFaceDetectedType0 = a3;
}

- (void)setHasMatchAttemptsFaceDetectedType0:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasMatchAttemptsFaceDetectedType0
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMatchAttemptsType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_matchAttemptsType1 = a3;
}

- (void)setHasMatchAttemptsType1:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMatchAttemptsType1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMatchAttemptsSuccessfulType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_matchAttemptsSuccessfulType1 = a3;
}

- (void)setHasMatchAttemptsSuccessfulType1:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMatchAttemptsSuccessfulType1
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMatchAttemptsFailedType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_matchAttemptsFailedType1 = a3;
}

- (void)setHasMatchAttemptsFailedType1:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasMatchAttemptsFailedType1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMatchAttemptsFaceDetectedType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_matchAttemptsFaceDetectedType1 = a3;
}

- (void)setHasMatchAttemptsFaceDetectedType1:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasMatchAttemptsFaceDetectedType1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setStaticUnlockCountType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_staticUnlockCountType0 = a3;
}

- (void)setHasStaticUnlockCountType0:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasStaticUnlockCountType0
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setOnlineUnlockCountType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_onlineUnlockCountType0 = a3;
}

- (void)setHasOnlineUnlockCountType0:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasOnlineUnlockCountType0
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setShortTermUnlockCountType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_shortTermUnlockCountType0 = a3;
}

- (void)setHasShortTermUnlockCountType0:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasShortTermUnlockCountType0
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setStaticUnlockCountType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_staticUnlockCountType1 = a3;
}

- (void)setHasStaticUnlockCountType1:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasStaticUnlockCountType1
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setOnlineUnlockCountType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_onlineUnlockCountType1 = a3;
}

- (void)setHasOnlineUnlockCountType1:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasOnlineUnlockCountType1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setShortTermUnlockCountType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_shortTermUnlockCountType1 = a3;
}

- (void)setHasShortTermUnlockCountType1:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasShortTermUnlockCountType1
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setBaseTemplateFeatureCountType0Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_baseTemplateFeatureCountType0Identity0 = a3;
}

- (void)setHasBaseTemplateFeatureCountType0Identity0:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBaseTemplateFeatureCountType0Identity0
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOnlineUpdateTemplateFeatureCountType0Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_onlineUpdateTemplateFeatureCountType0Identity0 = a3;
}

- (void)setHasOnlineUpdateTemplateFeatureCountType0Identity0:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasOnlineUpdateTemplateFeatureCountType0Identity0
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPasscodeUpdateTemplateFeatureCountType0Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_passcodeUpdateTemplateFeatureCountType0Identity0 = a3;
}

- (void)setHasPasscodeUpdateTemplateFeatureCountType0Identity0:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasPasscodeUpdateTemplateFeatureCountType0Identity0
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setBaseTemplateFeatureCountType0Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_baseTemplateFeatureCountType0Identity1 = a3;
}

- (void)setHasBaseTemplateFeatureCountType0Identity1:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBaseTemplateFeatureCountType0Identity1
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOnlineUpdateTemplateFeatureCountType0Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_onlineUpdateTemplateFeatureCountType0Identity1 = a3;
}

- (void)setHasOnlineUpdateTemplateFeatureCountType0Identity1:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOnlineUpdateTemplateFeatureCountType0Identity1
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setPasscodeUpdateTemplateFeatureCountType0Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_passcodeUpdateTemplateFeatureCountType0Identity1 = a3;
}

- (void)setHasPasscodeUpdateTemplateFeatureCountType0Identity1:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPasscodeUpdateTemplateFeatureCountType0Identity1
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setBaseTemplateFeatureCountType1Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_baseTemplateFeatureCountType1Identity0 = a3;
}

- (void)setHasBaseTemplateFeatureCountType1Identity0:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBaseTemplateFeatureCountType1Identity0
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setOnlineUpdateTemplateFeatureCountType1Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_onlineUpdateTemplateFeatureCountType1Identity0 = a3;
}

- (void)setHasOnlineUpdateTemplateFeatureCountType1Identity0:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasOnlineUpdateTemplateFeatureCountType1Identity0
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setPasscodeUpdateTemplateFeatureCountType1Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_passcodeUpdateTemplateFeatureCountType1Identity0 = a3;
}

- (void)setHasPasscodeUpdateTemplateFeatureCountType1Identity0:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasPasscodeUpdateTemplateFeatureCountType1Identity0
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setBaseTemplateFeatureCountType1Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_baseTemplateFeatureCountType1Identity1 = a3;
}

- (void)setHasBaseTemplateFeatureCountType1Identity1:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBaseTemplateFeatureCountType1Identity1
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setOnlineUpdateTemplateFeatureCountType1Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_onlineUpdateTemplateFeatureCountType1Identity1 = a3;
}

- (void)setHasOnlineUpdateTemplateFeatureCountType1Identity1:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasOnlineUpdateTemplateFeatureCountType1Identity1
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setPasscodeUpdateTemplateFeatureCountType1Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_passcodeUpdateTemplateFeatureCountType1Identity1 = a3;
}

- (void)setHasPasscodeUpdateTemplateFeatureCountType1Identity1:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasPasscodeUpdateTemplateFeatureCountType1Identity1
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setType1MatchEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_type1MatchEnabled = a3;
}

- (void)setHasType1MatchEnabled:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasType1MatchEnabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setEnrolledTemplateCountType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_enrolledTemplateCountType0 = a3;
}

- (void)setHasEnrolledTemplateCountType0:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasEnrolledTemplateCountType0
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setEnrolledTemplateCountType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_enrolledTemplateCountType1 = a3;
}

- (void)setHasEnrolledTemplateCountType1:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasEnrolledTemplateCountType1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setEnrolledTemplateCountTotal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_enrolledTemplateCountTotal = a3;
}

- (void)setHasEnrolledTemplateCountTotal:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasEnrolledTemplateCountTotal
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setMatchingTemplateCountType0Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_matchingTemplateCountType0Identity0 = a3;
}

- (void)setHasMatchingTemplateCountType0Identity0:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMatchingTemplateCountType0Identity0
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setMatchingTemplateCountType0Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_matchingTemplateCountType0Identity1 = a3;
}

- (void)setHasMatchingTemplateCountType0Identity1:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMatchingTemplateCountType0Identity1
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setMatchingTemplateCountType1Identity0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_matchingTemplateCountType1Identity0 = a3;
}

- (void)setHasMatchingTemplateCountType1Identity0:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasMatchingTemplateCountType1Identity0
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setMatchingTemplateCountType1Identity1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_matchingTemplateCountType1Identity1 = a3;
}

- (void)setHasMatchingTemplateCountType1Identity1:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A65F620BC397D00BFD1B4A2C8FC4C07C)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMatchingTemplateCountType1Identity1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDBiometricKitDailyUpdate;
  v4 = [(AWDBiometricKitDailyUpdate *)&v8 description];
  v5 = [(AWDBiometricKitDailyUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"baseTemplateFeatureCount"];

  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"onlineUpdateTemplateFeatureCount"];

  uint64_t v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"passcodeUpdateTemplateFeatureCount"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_unlockEnabled];
    [v3 setObject:v22 forKey:@"unlockEnabled"];

    $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
    if ((*(void *)&has & 0x2000000000000) == 0)
    {
LABEL_5:
      if ((*(void *)&has & 0x4000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_65;
    }
  }
  else if ((*(void *)&has & 0x2000000000000) == 0)
  {
    goto LABEL_5;
  }
  v23 = [NSNumber numberWithBool:self->_applePayEnabled];
  [v3 setObject:v23 forKey:@"applePayEnabled"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_66;
  }
LABEL_65:
  v24 = [NSNumber numberWithBool:self->_attentionDetectionEnabled];
  [v3 setObject:v24 forKey:@"attentionDetectionEnabled"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_67;
  }
LABEL_66:
  v25 = [NSNumber numberWithUnsignedInt:self->_matchingCountDouble01];
  [v3 setObject:v25 forKey:@"matchingCountDouble01"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_68;
  }
LABEL_67:
  v26 = [NSNumber numberWithUnsignedInt:self->_matchingCountDouble02];
  [v3 setObject:v26 forKey:@"matchingCountDouble02"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_69;
  }
LABEL_68:
  v27 = [NSNumber numberWithUnsignedInt:self->_matchingCountDouble03];
  [v3 setObject:v27 forKey:@"matchingCountDouble03"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_70;
  }
LABEL_69:
  v28 = [NSNumber numberWithUnsignedInt:self->_matchingCountDouble04];
  [v3 setObject:v28 forKey:@"matchingCountDouble04"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_71;
  }
LABEL_70:
  v29 = [NSNumber numberWithUnsignedInt:self->_staticUnlockCount];
  [v3 setObject:v29 forKey:@"staticUnlockCount"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_71:
  v30 = [NSNumber numberWithUnsignedInt:self->_onlineUnlockCount];
  [v3 setObject:v30 forKey:@"onlineUnlockCount"];

  if ((*(void *)&self->_has & 0x4000000000) != 0)
  {
LABEL_13:
    v9 = [NSNumber numberWithUnsignedInt:self->_shortTermUnlockCount];
    [v3 setObject:v9 forKey:@"shortTermUnlockCount"];
  }
LABEL_14:
  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"matchingBinCounts"];

  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"matchingTemplateTypeCounts"];

  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_cameraInterlock];
    [v3 setObject:v12 forKey:@"cameraInterlock"];
  }
  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"bioCheckInfo"];

  v14 = PBRepeatedUInt32NSArray();
  [v3 setObject:v14 forKey:@"bioCheckResult"];

  v15 = PBRepeatedUInt32NSArray();
  [v3 setObject:v15 forKey:@"passcodeUpdate"];

  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    v16 = [NSNumber numberWithUnsignedInt:self->_enrolledIdentityCount];
    [v3 setObject:v16 forKey:@"enrolledIdentityCount"];
  }
  v17 = PBRepeatedUInt32NSArray();
  [v3 setObject:v17 forKey:@"matchingIdentityCounts"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x20000000000000) != 0)
  {
    v31 = [NSNumber numberWithBool:self->_combinedSequenceEnabled];
    [v3 setObject:v31 forKey:@"combinedSequenceEnabled"];

    $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
    if ((*(unsigned char *)&v18 & 1) == 0)
    {
LABEL_20:
      if ((*(unsigned char *)&v18 & 0x40) == 0) {
        goto LABEL_21;
      }
      goto LABEL_75;
    }
  }
  else if ((*(unsigned char *)&v18 & 1) == 0)
  {
    goto LABEL_20;
  }
  v32 = [NSNumber numberWithUnsignedLongLong:self->_bioLockoutTime];
  [v3 setObject:v32 forKey:@"bioLockoutTime"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x40) == 0)
  {
LABEL_21:
    if ((*(void *)&v18 & 0x8000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  v33 = [NSNumber numberWithUnsignedInt:self->_bioLockoutCount];
  [v3 setObject:v33 forKey:@"bioLockoutCount"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x8000000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v18 & 0x1000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  v34 = [NSNumber numberWithBool:self->_autoRetryEnabled];
  [v3 setObject:v34 forKey:@"autoRetryEnabled"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x1000000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v18 & 0x100000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  v35 = [NSNumber numberWithUnsignedInt:self->_yogiErrorDays];
  [v3 setObject:v35 forKey:@"yogiErrorDays"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x100000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v18 & 0x800000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  v36 = [NSNumber numberWithUnsignedInt:self->_totalMatchAttempts];
  [v3 setObject:v36 forKey:@"totalMatchAttempts"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x800000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v18 & 0x400000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  v37 = [NSNumber numberWithUnsignedInt:self->_totalMatchAttemptsSuccessful];
  [v3 setObject:v37 forKey:@"totalMatchAttemptsSuccessful"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x400000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v18 & 0x200000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  v38 = [NSNumber numberWithUnsignedInt:self->_totalMatchAttemptsFailed];
  [v3 setObject:v38 forKey:@"totalMatchAttemptsFailed"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x200000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v18 & 0x20000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  v39 = [NSNumber numberWithUnsignedInt:self->_totalMatchAttemptsFaceDetected];
  [v3 setObject:v39 forKey:@"totalMatchAttemptsFaceDetected"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v18 & 0x8000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  v40 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsType0];
  [v3 setObject:v40 forKey:@"matchAttemptsType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v18 & 0x2000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  v41 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsSuccessfulType0];
  [v3 setObject:v41 forKey:@"matchAttemptsSuccessfulType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v18 & 0x800) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  v42 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsFailedType0];
  [v3 setObject:v42 forKey:@"matchAttemptsFailedType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v18 & 0x40000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  v43 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsFaceDetectedType0];
  [v3 setObject:v43 forKey:@"matchAttemptsFaceDetectedType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x40000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v18 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  v44 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsType1];
  [v3 setObject:v44 forKey:@"matchAttemptsType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v18 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  v45 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsSuccessfulType1];
  [v3 setObject:v45 forKey:@"matchAttemptsSuccessfulType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v18 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  v46 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsFailedType1];
  [v3 setObject:v46 forKey:@"matchAttemptsFailedType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(void *)&v18 & 0x40000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  v47 = [NSNumber numberWithUnsignedInt:self->_matchAttemptsFaceDetectedType1];
  [v3 setObject:v47 forKey:@"matchAttemptsFaceDetectedType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x40000000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v18 & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  v48 = [NSNumber numberWithUnsignedInt:self->_staticUnlockCountType0];
  [v3 setObject:v48 forKey:@"staticUnlockCountType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v18 & 0x8000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  v49 = [NSNumber numberWithUnsignedInt:self->_onlineUnlockCountType0];
  [v3 setObject:v49 forKey:@"onlineUnlockCountType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x8000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v18 & 0x80000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  v50 = [NSNumber numberWithUnsignedInt:self->_shortTermUnlockCountType0];
  [v3 setObject:v50 forKey:@"shortTermUnlockCountType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x80000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v18 & 0x20000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  v51 = [NSNumber numberWithUnsignedInt:self->_staticUnlockCountType1];
  [v3 setObject:v51 forKey:@"staticUnlockCountType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000000) == 0)
  {
LABEL_40:
    if ((*(void *)&v18 & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  v52 = [NSNumber numberWithUnsignedInt:self->_onlineUnlockCountType1];
  [v3 setObject:v52 forKey:@"onlineUnlockCountType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v18 & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  v53 = [NSNumber numberWithUnsignedInt:self->_shortTermUnlockCountType1];
  [v3 setObject:v53 forKey:@"shortTermUnlockCountType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(unsigned char *)&v18 & 4) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v18 & 0x40000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  v54 = [NSNumber numberWithUnsignedInt:self->_baseTemplateFeatureCountType0Identity0];
  [v3 setObject:v54 forKey:@"baseTemplateFeatureCountType0Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x40000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v18 & 0x400000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  v55 = [NSNumber numberWithUnsignedInt:self->_onlineUpdateTemplateFeatureCountType0Identity0];
  [v3 setObject:v55 forKey:@"onlineUpdateTemplateFeatureCountType0Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x400000000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v18 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  v56 = [NSNumber numberWithUnsignedInt:self->_passcodeUpdateTemplateFeatureCountType0Identity0];
  [v3 setObject:v56 forKey:@"passcodeUpdateTemplateFeatureCountType0Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(unsigned char *)&v18 & 8) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v18 & 0x80000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  v57 = [NSNumber numberWithUnsignedInt:self->_baseTemplateFeatureCountType0Identity1];
  [v3 setObject:v57 forKey:@"baseTemplateFeatureCountType0Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x80000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v18 & 0x800000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  v58 = [NSNumber numberWithUnsignedInt:self->_onlineUpdateTemplateFeatureCountType0Identity1];
  [v3 setObject:v58 forKey:@"onlineUpdateTemplateFeatureCountType0Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x800000000) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v18 & 0x10) == 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  v59 = [NSNumber numberWithUnsignedInt:self->_passcodeUpdateTemplateFeatureCountType0Identity1];
  [v3 setObject:v59 forKey:@"passcodeUpdateTemplateFeatureCountType0Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x10) == 0)
  {
LABEL_48:
    if ((*(void *)&v18 & 0x100000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  v60 = [NSNumber numberWithUnsignedInt:self->_baseTemplateFeatureCountType1Identity0];
  [v3 setObject:v60 forKey:@"baseTemplateFeatureCountType1Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x100000000) == 0)
  {
LABEL_49:
    if ((*(void *)&v18 & 0x1000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  v61 = [NSNumber numberWithUnsignedInt:self->_onlineUpdateTemplateFeatureCountType1Identity0];
  [v3 setObject:v61 forKey:@"onlineUpdateTemplateFeatureCountType1Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x1000000000) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v18 & 0x20) == 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  v62 = [NSNumber numberWithUnsignedInt:self->_passcodeUpdateTemplateFeatureCountType1Identity0];
  [v3 setObject:v62 forKey:@"passcodeUpdateTemplateFeatureCountType1Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x20) == 0)
  {
LABEL_51:
    if ((*(void *)&v18 & 0x200000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  v63 = [NSNumber numberWithUnsignedInt:self->_baseTemplateFeatureCountType1Identity1];
  [v3 setObject:v63 forKey:@"baseTemplateFeatureCountType1Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x200000000) == 0)
  {
LABEL_52:
    if ((*(void *)&v18 & 0x2000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  v64 = [NSNumber numberWithUnsignedInt:self->_onlineUpdateTemplateFeatureCountType1Identity1];
  [v3 setObject:v64 forKey:@"onlineUpdateTemplateFeatureCountType1Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x2000000000) == 0)
  {
LABEL_53:
    if ((*(void *)&v18 & 0x40000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_108;
  }
LABEL_107:
  v65 = [NSNumber numberWithUnsignedInt:self->_passcodeUpdateTemplateFeatureCountType1Identity1];
  [v3 setObject:v65 forKey:@"passcodeUpdateTemplateFeatureCountType1Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(void *)&v18 & 0x40000000000000) == 0)
  {
LABEL_54:
    if ((*(_WORD *)&v18 & 0x200) == 0) {
      goto LABEL_55;
    }
    goto LABEL_109;
  }
LABEL_108:
  v66 = [NSNumber numberWithBool:self->_type1MatchEnabled];
  [v3 setObject:v66 forKey:@"type1MatchEnabled"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x200) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v18 & 0x400) == 0) {
      goto LABEL_56;
    }
    goto LABEL_110;
  }
LABEL_109:
  v67 = [NSNumber numberWithUnsignedInt:self->_enrolledTemplateCountType0];
  [v3 setObject:v67 forKey:@"enrolledTemplateCountType0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x400) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v18 & 0x100) == 0) {
      goto LABEL_57;
    }
    goto LABEL_111;
  }
LABEL_110:
  v68 = [NSNumber numberWithUnsignedInt:self->_enrolledTemplateCountType1];
  [v3 setObject:v68 forKey:@"enrolledTemplateCountType1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v18 & 0x800000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_112;
  }
LABEL_111:
  v69 = [NSNumber numberWithUnsignedInt:self->_enrolledTemplateCountTotal];
  [v3 setObject:v69 forKey:@"enrolledTemplateCountTotal"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_113;
  }
LABEL_112:
  v70 = [NSNumber numberWithUnsignedInt:self->_matchingTemplateCountType0Identity0];
  [v3 setObject:v70 forKey:@"matchingTemplateCountType0Identity0"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v18 & 0x2000000) == 0) {
      goto LABEL_60;
    }
LABEL_114:
    v72 = [NSNumber numberWithUnsignedInt:self->_matchingTemplateCountType1Identity0];
    [v3 setObject:v72 forKey:@"matchingTemplateCountType1Identity0"];

    if ((*(void *)&self->_has & 0x4000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_113:
  v71 = [NSNumber numberWithUnsignedInt:self->_matchingTemplateCountType0Identity1];
  [v3 setObject:v71 forKey:@"matchingTemplateCountType0Identity1"];

  $A65F620BC397D00BFD1B4A2C8FC4C07C v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) != 0) {
    goto LABEL_114;
  }
LABEL_60:
  if ((*(_DWORD *)&v18 & 0x4000000) != 0)
  {
LABEL_61:
    v19 = [NSNumber numberWithUnsignedInt:self->_matchingTemplateCountType1Identity1];
    [v3 setObject:v19 forKey:@"matchingTemplateCountType1Identity1"];
  }
LABEL_62:
  id v20 = v3;

  return v20;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBiometricKitDailyUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v16;
  }
  if (self->_baseTemplateFeatureCounts.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v5;
    }
    while (v5 < self->_baseTemplateFeatureCounts.count);
  }
  if (self->_onlineUpdateTemplateFeatureCounts.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v6;
    }
    while (v6 < self->_onlineUpdateTemplateFeatureCounts.count);
  }
  if (self->_passcodeUpdateTemplateFeatureCounts.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v7;
    }
    while (v7 < self->_passcodeUpdateTemplateFeatureCounts.count);
  }
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v16;
    $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
    if ((*(void *)&has & 0x2000000000000) == 0)
    {
LABEL_14:
      if ((*(void *)&has & 0x4000000000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_94;
    }
  }
  else if ((*(void *)&has & 0x2000000000000) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  if ((*(void *)&self->_has & 0x4000000000) != 0)
  {
LABEL_22:
    PBDataWriterWriteUint32Field();
    id v4 = v16;
  }
LABEL_23:
  if (self->_matchingBinCounts.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v9;
    }
    while (v9 < self->_matchingBinCounts.count);
  }
  if (self->_matchingTemplateTypeCounts.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v10;
    }
    while (v10 < self->_matchingTemplateTypeCounts.count);
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v16;
  }
  if (self->_bioCheckInfos.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v11;
    }
    while (v11 < self->_bioCheckInfos.count);
  }
  if (self->_bioCheckResults.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v12;
    }
    while (v12 < self->_bioCheckResults.count);
  }
  if (self->_passcodeUpdates.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v13;
    }
    while (v13 < self->_passcodeUpdates.count);
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v16;
  }
  if (self->_matchingIdentityCounts.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v16;
      ++v14;
    }
    while (v14 < self->_matchingIdentityCounts.count);
  }
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x20000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v16;
    $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
    if ((*(unsigned char *)&v15 & 1) == 0)
    {
LABEL_47:
      if ((*(unsigned char *)&v15 & 0x40) == 0) {
        goto LABEL_48;
      }
      goto LABEL_104;
    }
  }
  else if ((*(unsigned char *)&v15 & 1) == 0)
  {
    goto LABEL_47;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x40) == 0)
  {
LABEL_48:
    if ((*(void *)&v15 & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&v15 & 0x1000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x1000000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&v15 & 0x100000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x100000000000) == 0)
  {
LABEL_51:
    if ((*(void *)&v15 & 0x800000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((*(void *)&v15 & 0x400000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x400000000000) == 0)
  {
LABEL_53:
    if ((*(void *)&v15 & 0x200000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x200000000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v15 & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x20000) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v15 & 0x8000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x8000) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v15 & 0x2000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x2000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v15 & 0x800) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x800) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v15 & 0x40000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v15 & 0x10000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_60:
    if ((*(_WORD *)&v15 & 0x4000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v15 & 0x1000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x1000) == 0)
  {
LABEL_62:
    if ((*(void *)&v15 & 0x40000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x40000000000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v15 & 0x10000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v15 & 0x8000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x8000000000) == 0)
  {
LABEL_65:
    if ((*(void *)&v15 & 0x80000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x80000000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v15 & 0x20000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x20000000) == 0)
  {
LABEL_67:
    if ((*(void *)&v15 & 0x10000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x10000000000) == 0)
  {
LABEL_68:
    if ((*(unsigned char *)&v15 & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v15 & 0x40000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000000) == 0)
  {
LABEL_70:
    if ((*(void *)&v15 & 0x400000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x400000000) == 0)
  {
LABEL_71:
    if ((*(unsigned char *)&v15 & 8) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(unsigned char *)&v15 & 8) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v15 & 0x80000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x80000000) == 0)
  {
LABEL_73:
    if ((*(void *)&v15 & 0x800000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x800000000) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v15 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x10) == 0)
  {
LABEL_75:
    if ((*(void *)&v15 & 0x100000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x100000000) == 0)
  {
LABEL_76:
    if ((*(void *)&v15 & 0x1000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x1000000000) == 0)
  {
LABEL_77:
    if ((*(unsigned char *)&v15 & 0x20) == 0) {
      goto LABEL_78;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x20) == 0)
  {
LABEL_78:
    if ((*(void *)&v15 & 0x200000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x200000000) == 0)
  {
LABEL_79:
    if ((*(void *)&v15 & 0x2000000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x2000000000) == 0)
  {
LABEL_80:
    if ((*(void *)&v15 & 0x40000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(void *)&v15 & 0x40000000000000) == 0)
  {
LABEL_81:
    if ((*(_WORD *)&v15 & 0x200) == 0) {
      goto LABEL_82;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteBOOLField();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_82:
    if ((*(_WORD *)&v15 & 0x400) == 0) {
      goto LABEL_83;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_83:
    if ((*(_WORD *)&v15 & 0x100) == 0) {
      goto LABEL_84;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x100) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v15 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(_DWORD *)&v15 & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
LABEL_86:
    if ((*(_DWORD *)&v15 & 0x2000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
LABEL_87:
    if ((*(_DWORD *)&v15 & 0x4000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
LABEL_143:
  PBDataWriterWriteUint32Field();
  id v4 = v16;
  if ((*(void *)&self->_has & 0x4000000) != 0)
  {
LABEL_88:
    PBDataWriterWriteUint32Field();
    id v4 = v16;
  }
LABEL_89:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[29] = self->_timestamp;
    *(void *)((char *)v4 + 436) |= 2uLL;
  }
  v34 = (char *)v4;
  if ([(AWDBiometricKitDailyUpdate *)self baseTemplateFeatureCountsCount])
  {
    [v34 clearBaseTemplateFeatureCounts];
    unint64_t v5 = [(AWDBiometricKitDailyUpdate *)self baseTemplateFeatureCountsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [v34 addBaseTemplateFeatureCount:-[AWDBiometricKitDailyUpdate baseTemplateFeatureCountAtIndex:](self, "baseTemplateFeatureCountAtIndex:", i)];
    }
  }
  if ([(AWDBiometricKitDailyUpdate *)self onlineUpdateTemplateFeatureCountsCount])
  {
    [v34 clearOnlineUpdateTemplateFeatureCounts];
    unint64_t v8 = [(AWDBiometricKitDailyUpdate *)self onlineUpdateTemplateFeatureCountsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [v34 addOnlineUpdateTemplateFeatureCount:-[AWDBiometricKitDailyUpdate onlineUpdateTemplateFeatureCountAtIndex:](self, "onlineUpdateTemplateFeatureCountAtIndex:", j)];
    }
  }
  if ([(AWDBiometricKitDailyUpdate *)self passcodeUpdateTemplateFeatureCountsCount])
  {
    [v34 clearPasscodeUpdateTemplateFeatureCounts];
    unint64_t v11 = [(AWDBiometricKitDailyUpdate *)self passcodeUpdateTemplateFeatureCountsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [v34 addPasscodeUpdateTemplateFeatureCount:-[AWDBiometricKitDailyUpdate passcodeUpdateTemplateFeatureCountAtIndex:](self, "passcodeUpdateTemplateFeatureCountAtIndex:", k)];
    }
  }
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    v34[434] = self->_unlockEnabled;
    *(void *)(v34 + 436) |= 0x80000000000000uLL;
    $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
    if ((*(void *)&has & 0x2000000000000) == 0)
    {
LABEL_17:
      if ((*(void *)&has & 0x4000000000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_103;
    }
  }
  else if ((*(void *)&has & 0x2000000000000) == 0)
  {
    goto LABEL_17;
  }
  v34[428] = self->_applePayEnabled;
  *(void *)(v34 + 436) |= 0x2000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_104;
  }
LABEL_103:
  v34[429] = self->_attentionDetectionEnabled;
  *(void *)(v34 + 436) |= 0x4000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v34 + 77) = self->_matchingCountDouble01;
  *(void *)(v34 + 436) |= 0x80000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v34 + 78) = self->_matchingCountDouble02;
  *(void *)(v34 + 436) |= 0x100000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)v34 + 79) = self->_matchingCountDouble03;
  *(void *)(v34 + 436) |= 0x200000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v34 + 80) = self->_matchingCountDouble04;
  *(void *)(v34 + 436) |= 0x400000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
LABEL_109:
    *((_DWORD *)v34 + 85) = self->_onlineUnlockCount;
    *(void *)(v34 + 436) |= 0x8000000uLL;
    if ((*(void *)&self->_has & 0x4000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_108:
  *((_DWORD *)v34 + 99) = self->_staticUnlockCount;
  *(void *)(v34 + 436) |= 0x20000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0) {
    goto LABEL_109;
  }
LABEL_24:
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_25:
    *((_DWORD *)v34 + 96) = self->_shortTermUnlockCount;
    *(void *)(v34 + 436) |= 0x4000000000uLL;
  }
LABEL_26:
  if ([(AWDBiometricKitDailyUpdate *)self matchingBinCountsCount])
  {
    [v34 clearMatchingBinCounts];
    unint64_t v15 = [(AWDBiometricKitDailyUpdate *)self matchingBinCountsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [v34 addMatchingBinCounts:-[AWDBiometricKitDailyUpdate matchingBinCountsAtIndex:](self, "matchingBinCountsAtIndex:", m)];
    }
  }
  if ([(AWDBiometricKitDailyUpdate *)self matchingTemplateTypeCountsCount])
  {
    [v34 clearMatchingTemplateTypeCounts];
    unint64_t v18 = [(AWDBiometricKitDailyUpdate *)self matchingTemplateTypeCountsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [v34 addMatchingTemplateTypeCounts:[[self matchingTemplateTypeCountsAtIndex:n]];
    }
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    v34[431] = self->_cameraInterlock;
    *(void *)(v34 + 436) |= 0x10000000000000uLL;
  }
  if ([(AWDBiometricKitDailyUpdate *)self bioCheckInfosCount])
  {
    [v34 clearBioCheckInfos];
    unint64_t v21 = [(AWDBiometricKitDailyUpdate *)self bioCheckInfosCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        [v34 addBioCheckInfo:-[AWDBiometricKitDailyUpdate bioCheckInfoAtIndex:](self, "bioCheckInfoAtIndex:", ii)];
    }
  }
  if ([(AWDBiometricKitDailyUpdate *)self bioCheckResultsCount])
  {
    [v34 clearBioCheckResults];
    unint64_t v24 = [(AWDBiometricKitDailyUpdate *)self bioCheckResultsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        [v34 addBioCheckResult:-[AWDBiometricKitDailyUpdate bioCheckResultAtIndex:](self, "bioCheckResultAtIndex:", jj)];
    }
  }
  if ([(AWDBiometricKitDailyUpdate *)self passcodeUpdatesCount])
  {
    [v34 clearPasscodeUpdates];
    unint64_t v27 = [(AWDBiometricKitDailyUpdate *)self passcodeUpdatesCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
        [v34 addPasscodeUpdate:-[AWDBiometricKitDailyUpdate passcodeUpdateAtIndex:](self, "passcodeUpdateAtIndex:", kk)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v34 + 65) = self->_enrolledIdentityCount;
    *(void *)(v34 + 436) |= 0x80uLL;
  }
  if ([(AWDBiometricKitDailyUpdate *)self matchingIdentityCountsCount])
  {
    [v34 clearMatchingIdentityCounts];
    unint64_t v30 = [(AWDBiometricKitDailyUpdate *)self matchingIdentityCountsCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (muint64_t m = 0; mm != v31; ++mm)
        [v34 addMatchingIdentityCounts:[[self matchingIdentityCountsAtIndex:mm]];
    }
  }
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x20000000000000) != 0)
  {
    v34[432] = self->_combinedSequenceEnabled;
    *(void *)(v34 + 436) |= 0x20000000000000uLL;
    $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
    if ((*(unsigned char *)&v33 & 1) == 0)
    {
LABEL_56:
      if ((*(unsigned char *)&v33 & 0x40) == 0) {
        goto LABEL_57;
      }
      goto LABEL_113;
    }
  }
  else if ((*(unsigned char *)&v33 & 1) == 0)
  {
    goto LABEL_56;
  }
  *((void *)v34 + 28) = self->_bioLockoutTime;
  *(void *)(v34 + 436) |= 1uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(unsigned char *)&v33 & 0x40) == 0)
  {
LABEL_57:
    if ((*(void *)&v33 & 0x8000000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)v34 + 64) = self->_bioLockoutCount;
  *(void *)(v34 + 436) |= 0x40uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x8000000000000) == 0)
  {
LABEL_58:
    if ((*(void *)&v33 & 0x1000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  v34[430] = self->_autoRetryEnabled;
  *(void *)(v34 + 436) |= 0x8000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x1000000000000) == 0)
  {
LABEL_59:
    if ((*(void *)&v33 & 0x100000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)v34 + 106) = self->_yogiErrorDays;
  *(void *)(v34 + 436) |= 0x1000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x100000000000) == 0)
  {
LABEL_60:
    if ((*(void *)&v33 & 0x800000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v34 + 102) = self->_totalMatchAttempts;
  *(void *)(v34 + 436) |= 0x100000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x800000000000) == 0)
  {
LABEL_61:
    if ((*(void *)&v33 & 0x400000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v34 + 105) = self->_totalMatchAttemptsSuccessful;
  *(void *)(v34 + 436) |= 0x800000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x400000000000) == 0)
  {
LABEL_62:
    if ((*(void *)&v33 & 0x200000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v34 + 104) = self->_totalMatchAttemptsFailed;
  *(void *)(v34 + 436) |= 0x400000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x200000000000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v33 & 0x20000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v34 + 103) = self->_totalMatchAttemptsFaceDetected;
  *(void *)(v34 + 436) |= 0x200000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x20000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v33 & 0x8000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v34 + 75) = self->_matchAttemptsType0;
  *(void *)(v34 + 436) |= 0x20000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x8000) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&v33 & 0x2000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v34 + 73) = self->_matchAttemptsSuccessfulType0;
  *(void *)(v34 + 436) |= 0x8000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&v33 & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v34 + 71) = self->_matchAttemptsFailedType0;
  *(void *)(v34 + 436) |= 0x2000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x800) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v33 & 0x40000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v34 + 69) = self->_matchAttemptsFaceDetectedType0;
  *(void *)(v34 + 436) |= 0x800uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v33 & 0x10000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v34 + 76) = self->_matchAttemptsType1;
  *(void *)(v34 + 436) |= 0x40000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x10000) == 0)
  {
LABEL_69:
    if ((*(_WORD *)&v33 & 0x4000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v34 + 74) = self->_matchAttemptsSuccessfulType1;
  *(void *)(v34 + 436) |= 0x10000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x4000) == 0)
  {
LABEL_70:
    if ((*(_WORD *)&v33 & 0x1000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v34 + 72) = self->_matchAttemptsFailedType1;
  *(void *)(v34 + 436) |= 0x4000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x1000) == 0)
  {
LABEL_71:
    if ((*(void *)&v33 & 0x40000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)v34 + 70) = self->_matchAttemptsFaceDetectedType1;
  *(void *)(v34 + 436) |= 0x1000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x40000000000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v33 & 0x10000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((_DWORD *)v34 + 100) = self->_staticUnlockCountType0;
  *(void *)(v34 + 436) |= 0x40000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x10000000) == 0)
  {
LABEL_73:
    if ((*(void *)&v33 & 0x8000000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((_DWORD *)v34 + 86) = self->_onlineUnlockCountType0;
  *(void *)(v34 + 436) |= 0x10000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x8000000000) == 0)
  {
LABEL_74:
    if ((*(void *)&v33 & 0x80000000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((_DWORD *)v34 + 97) = self->_shortTermUnlockCountType0;
  *(void *)(v34 + 436) |= 0x8000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x80000000000) == 0)
  {
LABEL_75:
    if ((*(_DWORD *)&v33 & 0x20000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((_DWORD *)v34 + 101) = self->_staticUnlockCountType1;
  *(void *)(v34 + 436) |= 0x80000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x20000000) == 0)
  {
LABEL_76:
    if ((*(void *)&v33 & 0x10000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v34 + 87) = self->_onlineUnlockCountType1;
  *(void *)(v34 + 436) |= 0x20000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x10000000000) == 0)
  {
LABEL_77:
    if ((*(unsigned char *)&v33 & 4) == 0) {
      goto LABEL_78;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((_DWORD *)v34 + 98) = self->_shortTermUnlockCountType1;
  *(void *)(v34 + 436) |= 0x10000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(unsigned char *)&v33 & 4) == 0)
  {
LABEL_78:
    if ((*(_DWORD *)&v33 & 0x40000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((_DWORD *)v34 + 60) = self->_baseTemplateFeatureCountType0Identity0;
  *(void *)(v34 + 436) |= 4uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x40000000) == 0)
  {
LABEL_79:
    if ((*(void *)&v33 & 0x400000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((_DWORD *)v34 + 88) = self->_onlineUpdateTemplateFeatureCountType0Identity0;
  *(void *)(v34 + 436) |= 0x40000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x400000000) == 0)
  {
LABEL_80:
    if ((*(unsigned char *)&v33 & 8) == 0) {
      goto LABEL_81;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((_DWORD *)v34 + 92) = self->_passcodeUpdateTemplateFeatureCountType0Identity0;
  *(void *)(v34 + 436) |= 0x400000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(unsigned char *)&v33 & 8) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v33 & 0x80000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((_DWORD *)v34 + 61) = self->_baseTemplateFeatureCountType0Identity1;
  *(void *)(v34 + 436) |= 8uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x80000000) == 0)
  {
LABEL_82:
    if ((*(void *)&v33 & 0x800000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v34 + 89) = self->_onlineUpdateTemplateFeatureCountType0Identity1;
  *(void *)(v34 + 436) |= 0x80000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x800000000) == 0)
  {
LABEL_83:
    if ((*(unsigned char *)&v33 & 0x10) == 0) {
      goto LABEL_84;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((_DWORD *)v34 + 93) = self->_passcodeUpdateTemplateFeatureCountType0Identity1;
  *(void *)(v34 + 436) |= 0x800000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(unsigned char *)&v33 & 0x10) == 0)
  {
LABEL_84:
    if ((*(void *)&v33 & 0x100000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v34 + 62) = self->_baseTemplateFeatureCountType1Identity0;
  *(void *)(v34 + 436) |= 0x10uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x100000000) == 0)
  {
LABEL_85:
    if ((*(void *)&v33 & 0x1000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((_DWORD *)v34 + 90) = self->_onlineUpdateTemplateFeatureCountType1Identity0;
  *(void *)(v34 + 436) |= 0x100000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x1000000000) == 0)
  {
LABEL_86:
    if ((*(unsigned char *)&v33 & 0x20) == 0) {
      goto LABEL_87;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((_DWORD *)v34 + 94) = self->_passcodeUpdateTemplateFeatureCountType1Identity0;
  *(void *)(v34 + 436) |= 0x1000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(unsigned char *)&v33 & 0x20) == 0)
  {
LABEL_87:
    if ((*(void *)&v33 & 0x200000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((_DWORD *)v34 + 63) = self->_baseTemplateFeatureCountType1Identity1;
  *(void *)(v34 + 436) |= 0x20uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x200000000) == 0)
  {
LABEL_88:
    if ((*(void *)&v33 & 0x2000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((_DWORD *)v34 + 91) = self->_onlineUpdateTemplateFeatureCountType1Identity1;
  *(void *)(v34 + 436) |= 0x200000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x2000000000) == 0)
  {
LABEL_89:
    if ((*(void *)&v33 & 0x40000000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v34 + 95) = self->_passcodeUpdateTemplateFeatureCountType1Identity1;
  *(void *)(v34 + 436) |= 0x2000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(void *)&v33 & 0x40000000000000) == 0)
  {
LABEL_90:
    if ((*(_WORD *)&v33 & 0x200) == 0) {
      goto LABEL_91;
    }
    goto LABEL_147;
  }
LABEL_146:
  v34[433] = self->_type1MatchEnabled;
  *(void *)(v34 + 436) |= 0x40000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x200) == 0)
  {
LABEL_91:
    if ((*(_WORD *)&v33 & 0x400) == 0) {
      goto LABEL_92;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v34 + 67) = self->_enrolledTemplateCountType0;
  *(void *)(v34 + 436) |= 0x200uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x400) == 0)
  {
LABEL_92:
    if ((*(_WORD *)&v33 & 0x100) == 0) {
      goto LABEL_93;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v34 + 68) = self->_enrolledTemplateCountType1;
  *(void *)(v34 + 436) |= 0x400uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x100) == 0)
  {
LABEL_93:
    if ((*(_DWORD *)&v33 & 0x800000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v34 + 66) = self->_enrolledTemplateCountTotal;
  *(void *)(v34 + 436) |= 0x100uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x800000) == 0)
  {
LABEL_94:
    if ((*(_DWORD *)&v33 & 0x1000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((_DWORD *)v34 + 81) = self->_matchingTemplateCountType0Identity0;
  *(void *)(v34 + 436) |= 0x800000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x1000000) == 0)
  {
LABEL_95:
    if ((*(_DWORD *)&v33 & 0x2000000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((_DWORD *)v34 + 82) = self->_matchingTemplateCountType0Identity1;
  *(void *)(v34 + 436) |= 0x1000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x2000000) == 0)
  {
LABEL_96:
    if ((*(_DWORD *)&v33 & 0x4000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_152:
  *((_DWORD *)v34 + 83) = self->_matchingTemplateCountType1Identity0;
  *(void *)(v34 + 436) |= 0x2000000uLL;
  if ((*(void *)&self->_has & 0x4000000) != 0)
  {
LABEL_97:
    *((_DWORD *)v34 + 84) = self->_matchingTemplateCountType1Identity1;
    *(void *)(v34 + 436) |= 0x4000000uLL;
  }
LABEL_98:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v4 + 232) = self->_timestamp;
    *(void *)(v4 + 436) |= 2uLL;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    *(unsigned char *)(v5 + 434) = self->_unlockEnabled;
    *(void *)(v5 + 436) |= 0x80000000000000uLL;
    $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
    if ((*(void *)&has & 0x2000000000000) == 0)
    {
LABEL_5:
      if ((*(void *)&has & 0x4000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_65;
    }
  }
  else if ((*(void *)&has & 0x2000000000000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 428) = self->_applePayEnabled;
  *(void *)(v5 + 436) |= 0x2000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v5 + 429) = self->_attentionDetectionEnabled;
  *(void *)(v5 + 436) |= 0x4000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 308) = self->_matchingCountDouble01;
  *(void *)(v5 + 436) |= 0x80000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v5 + 312) = self->_matchingCountDouble02;
  *(void *)(v5 + 436) |= 0x100000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v5 + 316) = self->_matchingCountDouble03;
  *(void *)(v5 + 436) |= 0x200000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v5 + 320) = self->_matchingCountDouble04;
  *(void *)(v5 + 436) |= 0x400000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 396) = self->_staticUnlockCount;
  *(void *)(v5 + 436) |= 0x20000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_71:
  *(_DWORD *)(v5 + 340) = self->_onlineUnlockCount;
  *(void *)(v5 + 436) |= 0x8000000uLL;
  if ((*(void *)&self->_has & 0x4000000000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 384) = self->_shortTermUnlockCount;
    *(void *)(v5 + 436) |= 0x4000000000uLL;
  }
LABEL_14:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 431) = self->_cameraInterlock;
    *(void *)(v5 + 436) |= 0x10000000000000uLL;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 260) = self->_enrolledIdentityCount;
    *(void *)(v5 + 436) |= 0x80uLL;
  }
  PBRepeatedUInt32Copy();
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x20000000000000) != 0)
  {
    *(unsigned char *)(v5 + 432) = self->_combinedSequenceEnabled;
    *(void *)(v5 + 436) |= 0x20000000000000uLL;
    $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
    if ((*(unsigned char *)&v7 & 1) == 0)
    {
LABEL_20:
      if ((*(unsigned char *)&v7 & 0x40) == 0) {
        goto LABEL_21;
      }
      goto LABEL_75;
    }
  }
  else if ((*(unsigned char *)&v7 & 1) == 0)
  {
    goto LABEL_20;
  }
  *(void *)(v5 + 224) = self->_bioLockoutTime;
  *(void *)(v5 + 436) |= 1uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(void *)&v7 & 0x8000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 256) = self->_bioLockoutCount;
  *(void *)(v5 + 436) |= 0x40uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x8000000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v7 & 0x1000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(unsigned char *)(v5 + 430) = self->_autoRetryEnabled;
  *(void *)(v5 + 436) |= 0x8000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v7 & 0x100000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 424) = self->_yogiErrorDays;
  *(void *)(v5 + 436) |= 0x1000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x100000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v7 & 0x800000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 408) = self->_totalMatchAttempts;
  *(void *)(v5 + 436) |= 0x100000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v7 & 0x400000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 420) = self->_totalMatchAttemptsSuccessful;
  *(void *)(v5 + 436) |= 0x800000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x400000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v7 & 0x200000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 416) = self->_totalMatchAttemptsFailed;
  *(void *)(v5 + 436) |= 0x400000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 412) = self->_totalMatchAttemptsFaceDetected;
  *(void *)(v5 + 436) |= 0x200000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 300) = self->_matchAttemptsType0;
  *(void *)(v5 + 436) |= 0x20000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 292) = self->_matchAttemptsSuccessfulType0;
  *(void *)(v5 + 436) |= 0x8000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 284) = self->_matchAttemptsFailedType0;
  *(void *)(v5 + 436) |= 0x2000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 276) = self->_matchAttemptsFaceDetectedType0;
  *(void *)(v5 + 436) |= 0x800uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 304) = self->_matchAttemptsType1;
  *(void *)(v5 + 436) |= 0x40000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v5 + 296) = self->_matchAttemptsSuccessfulType1;
  *(void *)(v5 + 436) |= 0x10000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 288) = self->_matchAttemptsFailedType1;
  *(void *)(v5 + 436) |= 0x4000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(void *)&v7 & 0x40000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v5 + 280) = self->_matchAttemptsFaceDetectedType1;
  *(void *)(v5 + 436) |= 0x1000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 400) = self->_staticUnlockCountType0;
  *(void *)(v5 + 436) |= 0x40000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v7 & 0x8000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 344) = self->_onlineUnlockCountType0;
  *(void *)(v5 + 436) |= 0x10000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x8000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v7 & 0x80000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v5 + 388) = self->_shortTermUnlockCountType0;
  *(void *)(v5 + 436) |= 0x8000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x80000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v7 & 0x20000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v5 + 404) = self->_staticUnlockCountType1;
  *(void *)(v5 + 436) |= 0x80000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_40:
    if ((*(void *)&v7 & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v5 + 348) = self->_onlineUnlockCountType1;
  *(void *)(v5 + 436) |= 0x20000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v5 + 392) = self->_shortTermUnlockCountType1;
  *(void *)(v5 + 436) |= 0x10000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v5 + 240) = self->_baseTemplateFeatureCountType0Identity0;
  *(void *)(v5 + 436) |= 4uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v7 & 0x400000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v5 + 352) = self->_onlineUpdateTemplateFeatureCountType0Identity0;
  *(void *)(v5 + 436) |= 0x40000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x400000000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v5 + 368) = self->_passcodeUpdateTemplateFeatureCountType0Identity0;
  *(void *)(v5 + 436) |= 0x400000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v5 + 244) = self->_baseTemplateFeatureCountType0Identity1;
  *(void *)(v5 + 436) |= 8uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v7 & 0x800000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v5 + 356) = self->_onlineUpdateTemplateFeatureCountType0Identity1;
  *(void *)(v5 + 436) |= 0x80000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v5 + 372) = self->_passcodeUpdateTemplateFeatureCountType0Identity1;
  *(void *)(v5 + 436) |= 0x800000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_48:
    if ((*(void *)&v7 & 0x100000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v5 + 248) = self->_baseTemplateFeatureCountType1Identity0;
  *(void *)(v5 + 436) |= 0x10uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x100000000) == 0)
  {
LABEL_49:
    if ((*(void *)&v7 & 0x1000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(_DWORD *)(v5 + 360) = self->_onlineUpdateTemplateFeatureCountType1Identity0;
  *(void *)(v5 + 436) |= 0x100000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(_DWORD *)(v5 + 376) = self->_passcodeUpdateTemplateFeatureCountType1Identity0;
  *(void *)(v5 + 436) |= 0x1000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_51:
    if ((*(void *)&v7 & 0x200000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(_DWORD *)(v5 + 252) = self->_baseTemplateFeatureCountType1Identity1;
  *(void *)(v5 + 436) |= 0x20uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000) == 0)
  {
LABEL_52:
    if ((*(void *)&v7 & 0x2000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(_DWORD *)(v5 + 364) = self->_onlineUpdateTemplateFeatureCountType1Identity1;
  *(void *)(v5 + 436) |= 0x200000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000) == 0)
  {
LABEL_53:
    if ((*(void *)&v7 & 0x40000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v5 + 380) = self->_passcodeUpdateTemplateFeatureCountType1Identity1;
  *(void *)(v5 + 436) |= 0x2000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000000) == 0)
  {
LABEL_54:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_55;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(unsigned char *)(v5 + 433) = self->_type1MatchEnabled;
  *(void *)(v5 + 436) |= 0x40000000000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_56;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(_DWORD *)(v5 + 268) = self->_enrolledTemplateCountType0;
  *(void *)(v5 + 436) |= 0x200uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_57;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v5 + 272) = self->_enrolledTemplateCountType1;
  *(void *)(v5 + 436) |= 0x400uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(_DWORD *)(v5 + 264) = self->_enrolledTemplateCountTotal;
  *(void *)(v5 + 436) |= 0x100uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(_DWORD *)(v5 + 324) = self->_matchingTemplateCountType0Identity0;
  *(void *)(v5 + 436) |= 0x800000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_60;
    }
LABEL_114:
    *(_DWORD *)(v5 + 332) = self->_matchingTemplateCountType1Identity0;
    *(void *)(v5 + 436) |= 0x2000000uLL;
    if ((*(void *)&self->_has & 0x4000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_113:
  *(_DWORD *)(v5 + 328) = self->_matchingTemplateCountType0Identity1;
  *(void *)(v5 + 436) |= 0x1000000uLL;
  $A65F620BC397D00BFD1B4A2C8FC4C07C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0) {
    goto LABEL_114;
  }
LABEL_60:
  if ((*(_DWORD *)&v7 & 0x4000000) != 0)
  {
LABEL_61:
    *(_DWORD *)(v5 + 336) = self->_matchingTemplateCountType1Identity1;
    *(void *)(v5 + 436) |= 0x4000000uLL;
  }
LABEL_62:
  id v8 = (id)v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_312;
  }
  uint64_t v5 = *(void *)(v4 + 436);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_timestamp != *((void *)v4 + 29)) {
      goto LABEL_312;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_312;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_312;
  }
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  uint64_t v7 = *(void *)(v4 + 436);
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    if ((v7 & 0x80000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_unlockEnabled)
    {
      if (!v4[434]) {
        goto LABEL_312;
      }
    }
    else if (v4[434])
    {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x80000000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_applePayEnabled)
    {
      if (!v4[428]) {
        goto LABEL_312;
      }
    }
    else if (v4[428])
    {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_attentionDetectionEnabled)
    {
      if (!v4[429]) {
        goto LABEL_312;
      }
    }
    else if (v4[429])
    {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x4000000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_matchingCountDouble01 != *((_DWORD *)v4 + 77)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_matchingCountDouble02 != *((_DWORD *)v4 + 78)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_matchingCountDouble03 != *((_DWORD *)v4 + 79)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_matchingCountDouble04 != *((_DWORD *)v4 + 80)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_staticUnlockCount != *((_DWORD *)v4 + 99)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_onlineUnlockCount != *((_DWORD *)v4 + 85)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_shortTermUnlockCount != *((_DWORD *)v4 + 96)) {
      goto LABEL_312;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_312;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_312;
  }
  uint64_t v8 = *(void *)(v4 + 436);
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    if ((v8 & 0x10000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_cameraInterlock)
    {
      if (!v4[431]) {
        goto LABEL_312;
      }
    }
    else if (v4[431])
    {
      goto LABEL_312;
    }
  }
  else if ((v8 & 0x10000000000000) != 0)
  {
    goto LABEL_312;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_312;
  }
  uint64_t v9 = *(void *)(v4 + 436);
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_enrolledIdentityCount != *((_DWORD *)v4 + 65)) {
      goto LABEL_312;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_312;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_312:
    BOOL v12 = 0;
    goto LABEL_313;
  }
  $A65F620BC397D00BFD1B4A2C8FC4C07C v10 = self->_has;
  uint64_t v11 = *(void *)(v4 + 436);
  if ((*(void *)&v10 & 0x20000000000000) != 0)
  {
    if ((v11 & 0x20000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_combinedSequenceEnabled)
    {
      if (!v4[432]) {
        goto LABEL_312;
      }
    }
    else if (v4[432])
    {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x20000000000000) != 0)
  {
    goto LABEL_312;
  }
  if (*(unsigned char *)&v10)
  {
    if ((v11 & 1) == 0 || self->_bioLockoutTime != *((void *)v4 + 28)) {
      goto LABEL_312;
    }
  }
  else if (v11)
  {
    goto LABEL_312;
  }
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_bioLockoutCount != *((_DWORD *)v4 + 64)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x8000000000000) != 0)
  {
    if ((v11 & 0x8000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_autoRetryEnabled)
    {
      if (!v4[430]) {
        goto LABEL_312;
      }
    }
    else if (v4[430])
    {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x8000000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x1000000000000) != 0)
  {
    if ((v11 & 0x1000000000000) == 0 || self->_yogiErrorDays != *((_DWORD *)v4 + 106)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x1000000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x100000000000) != 0)
  {
    if ((v11 & 0x100000000000) == 0 || self->_totalMatchAttempts != *((_DWORD *)v4 + 102)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x100000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x800000000000) != 0)
  {
    if ((v11 & 0x800000000000) == 0 || self->_totalMatchAttemptsSuccessful != *((_DWORD *)v4 + 105)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x800000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x400000000000) != 0)
  {
    if ((v11 & 0x400000000000) == 0 || self->_totalMatchAttemptsFailed != *((_DWORD *)v4 + 104)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x400000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x200000000000) != 0)
  {
    if ((v11 & 0x200000000000) == 0 || self->_totalMatchAttemptsFaceDetected != *((_DWORD *)v4 + 103)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x200000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_matchAttemptsType0 != *((_DWORD *)v4 + 75)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_matchAttemptsSuccessfulType0 != *((_DWORD *)v4 + 73)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_matchAttemptsFailedType0 != *((_DWORD *)v4 + 71)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_matchAttemptsFaceDetectedType0 != *((_DWORD *)v4 + 69)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_matchAttemptsType1 != *((_DWORD *)v4 + 76)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_matchAttemptsSuccessfulType1 != *((_DWORD *)v4 + 74)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_matchAttemptsFailedType1 != *((_DWORD *)v4 + 72)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0 || self->_matchAttemptsFaceDetectedType1 != *((_DWORD *)v4 + 70)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x40000000000) != 0)
  {
    if ((v11 & 0x40000000000) == 0 || self->_staticUnlockCountType0 != *((_DWORD *)v4 + 100)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x40000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x10000000) != 0)
  {
    if ((v11 & 0x10000000) == 0 || self->_onlineUnlockCountType0 != *((_DWORD *)v4 + 86)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x10000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x8000000000) != 0)
  {
    if ((v11 & 0x8000000000) == 0 || self->_shortTermUnlockCountType0 != *((_DWORD *)v4 + 97)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x8000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x80000000000) != 0)
  {
    if ((v11 & 0x80000000000) == 0 || self->_staticUnlockCountType1 != *((_DWORD *)v4 + 101)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x80000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x20000000) != 0)
  {
    if ((v11 & 0x20000000) == 0 || self->_onlineUnlockCountType1 != *((_DWORD *)v4 + 87)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x20000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x10000000000) != 0)
  {
    if ((v11 & 0x10000000000) == 0 || self->_shortTermUnlockCountType1 != *((_DWORD *)v4 + 98)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x10000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_baseTemplateFeatureCountType0Identity0 != *((_DWORD *)v4 + 60)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x40000000) != 0)
  {
    if ((v11 & 0x40000000) == 0 || self->_onlineUpdateTemplateFeatureCountType0Identity0 != *((_DWORD *)v4 + 88)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x40000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x400000000) != 0)
  {
    if ((v11 & 0x400000000) == 0 || self->_passcodeUpdateTemplateFeatureCountType0Identity0 != *((_DWORD *)v4 + 92)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x400000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_baseTemplateFeatureCountType0Identity1 != *((_DWORD *)v4 + 61)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x80000000) != 0)
  {
    if ((v11 & 0x80000000) == 0 || self->_onlineUpdateTemplateFeatureCountType0Identity1 != *((_DWORD *)v4 + 89)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x80000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x800000000) != 0)
  {
    if ((v11 & 0x800000000) == 0 || self->_passcodeUpdateTemplateFeatureCountType0Identity1 != *((_DWORD *)v4 + 93)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x800000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(unsigned char *)&v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_baseTemplateFeatureCountType1Identity0 != *((_DWORD *)v4 + 62)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0 || self->_onlineUpdateTemplateFeatureCountType1Identity0 != *((_DWORD *)v4 + 90)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x1000000000) != 0)
  {
    if ((v11 & 0x1000000000) == 0 || self->_passcodeUpdateTemplateFeatureCountType1Identity0 != *((_DWORD *)v4 + 94)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x1000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_baseTemplateFeatureCountType1Identity1 != *((_DWORD *)v4 + 63)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x200000000) != 0)
  {
    if ((v11 & 0x200000000) == 0 || self->_onlineUpdateTemplateFeatureCountType1Identity1 != *((_DWORD *)v4 + 91)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x200000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x2000000000) != 0)
  {
    if ((v11 & 0x2000000000) == 0 || self->_passcodeUpdateTemplateFeatureCountType1Identity1 != *((_DWORD *)v4 + 95)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x2000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(void *)&v10 & 0x40000000000000) != 0)
  {
    if ((v11 & 0x40000000000000) == 0) {
      goto LABEL_312;
    }
    if (self->_type1MatchEnabled)
    {
      if (!v4[433]) {
        goto LABEL_312;
      }
    }
    else if (v4[433])
    {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x40000000000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_enrolledTemplateCountType0 != *((_DWORD *)v4 + 67)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_enrolledTemplateCountType1 != *((_DWORD *)v4 + 68)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_enrolledTemplateCountTotal != *((_DWORD *)v4 + 66)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0 || self->_matchingTemplateCountType0Identity0 != *((_DWORD *)v4 + 81)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0 || self->_matchingTemplateCountType0Identity1 != *((_DWORD *)v4 + 82)) {
      goto LABEL_312;
    }
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_312;
  }
  if ((*(_DWORD *)&v10 & 0x2000000) == 0)
  {
    if ((v11 & 0x2000000) == 0) {
      goto LABEL_307;
    }
    goto LABEL_312;
  }
  if ((v11 & 0x2000000) == 0 || self->_matchingTemplateCountType1Identity0 != *((_DWORD *)v4 + 83)) {
    goto LABEL_312;
  }
LABEL_307:
  if ((*(_DWORD *)&v10 & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0 || self->_matchingTemplateCountType1Identity1 != *((_DWORD *)v4 + 84)) {
      goto LABEL_312;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = (*(void *)(v4 + 436) & 0x4000000) == 0;
  }
LABEL_313:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v70 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v70 = 0;
  }
  uint64_t v69 = PBRepeatedUInt32Hash();
  uint64_t v68 = PBRepeatedUInt32Hash();
  uint64_t v67 = PBRepeatedUInt32Hash();
  $A65F620BC397D00BFD1B4A2C8FC4C07C has = self->_has;
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    uint64_t v66 = 2654435761 * self->_unlockEnabled;
    if ((*(void *)&has & 0x2000000000000) != 0)
    {
LABEL_6:
      uint64_t v65 = 2654435761 * self->_applePayEnabled;
      if ((*(void *)&has & 0x4000000000000) != 0) {
        goto LABEL_7;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v66 = 0;
    if ((*(void *)&has & 0x2000000000000) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v65 = 0;
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
LABEL_7:
    uint64_t v64 = 2654435761 * self->_attentionDetectionEnabled;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v64 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_8:
    uint64_t v63 = 2654435761 * self->_matchingCountDouble01;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v63 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_9:
    uint64_t v62 = 2654435761 * self->_matchingCountDouble02;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v62 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_10:
    uint64_t v61 = 2654435761 * self->_matchingCountDouble03;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v61 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_11:
    uint64_t v60 = 2654435761 * self->_matchingCountDouble04;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v60 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_12:
    uint64_t v59 = 2654435761 * self->_staticUnlockCount;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v58 = 0;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v59 = 0;
  if ((*(_DWORD *)&has & 0x8000000) == 0) {
    goto LABEL_23;
  }
LABEL_13:
  uint64_t v58 = 2654435761 * self->_onlineUnlockCount;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_14:
    uint64_t v57 = 2654435761 * self->_shortTermUnlockCount;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v57 = 0;
LABEL_25:
  uint64_t v56 = PBRepeatedUInt32Hash();
  uint64_t v55 = PBRepeatedUInt32Hash();
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0) {
    uint64_t v54 = 2654435761 * self->_cameraInterlock;
  }
  else {
    uint64_t v54 = 0;
  }
  uint64_t v53 = PBRepeatedUInt32Hash();
  uint64_t v52 = PBRepeatedUInt32Hash();
  uint64_t v51 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v50 = 2654435761 * self->_enrolledIdentityCount;
  }
  else {
    uint64_t v50 = 0;
  }
  uint64_t v49 = PBRepeatedUInt32Hash();
  $A65F620BC397D00BFD1B4A2C8FC4C07C v4 = self->_has;
  if ((*(void *)&v4 & 0x20000000000000) != 0)
  {
    uint64_t v48 = 2654435761 * self->_combinedSequenceEnabled;
    if (*(unsigned char *)&v4)
    {
LABEL_33:
      unint64_t v47 = 2654435761u * self->_bioLockoutTime;
      if ((*(unsigned char *)&v4 & 0x40) != 0) {
        goto LABEL_34;
      }
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if (*(unsigned char *)&v4) {
      goto LABEL_33;
    }
  }
  unint64_t v47 = 0;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_34:
    uint64_t v46 = 2654435761 * self->_bioLockoutCount;
    if ((*(void *)&v4 & 0x8000000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v46 = 0;
  if ((*(void *)&v4 & 0x8000000000000) != 0)
  {
LABEL_35:
    uint64_t v45 = 2654435761 * self->_autoRetryEnabled;
    if ((*(void *)&v4 & 0x1000000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v45 = 0;
  if ((*(void *)&v4 & 0x1000000000000) != 0)
  {
LABEL_36:
    uint64_t v44 = 2654435761 * self->_yogiErrorDays;
    if ((*(void *)&v4 & 0x100000000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v44 = 0;
  if ((*(void *)&v4 & 0x100000000000) != 0)
  {
LABEL_37:
    uint64_t v43 = 2654435761 * self->_totalMatchAttempts;
    if ((*(void *)&v4 & 0x800000000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v43 = 0;
  if ((*(void *)&v4 & 0x800000000000) != 0)
  {
LABEL_38:
    uint64_t v42 = 2654435761 * self->_totalMatchAttemptsSuccessful;
    if ((*(void *)&v4 & 0x400000000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v42 = 0;
  if ((*(void *)&v4 & 0x400000000000) != 0)
  {
LABEL_39:
    uint64_t v41 = 2654435761 * self->_totalMatchAttemptsFailed;
    if ((*(void *)&v4 & 0x200000000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v41 = 0;
  if ((*(void *)&v4 & 0x200000000000) != 0)
  {
LABEL_40:
    uint64_t v40 = 2654435761 * self->_totalMatchAttemptsFaceDetected;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_41:
    uint64_t v39 = 2654435761 * self->_matchAttemptsType0;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v39 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_42:
    uint64_t v38 = 2654435761 * self->_matchAttemptsSuccessfulType0;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v38 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_43:
    uint64_t v37 = 2654435761 * self->_matchAttemptsFailedType0;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_44;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v37 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_44:
    uint64_t v36 = 2654435761 * self->_matchAttemptsFaceDetectedType0;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_45:
    uint64_t v35 = 2654435761 * self->_matchAttemptsType1;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_46:
    uint64_t v34 = 2654435761 * self->_matchAttemptsSuccessfulType1;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v34 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_47:
    uint64_t v33 = 2654435761 * self->_matchAttemptsFailedType1;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v33 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_48:
    uint64_t v32 = 2654435761 * self->_matchAttemptsFaceDetectedType1;
    if ((*(void *)&v4 & 0x40000000000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v32 = 0;
  if ((*(void *)&v4 & 0x40000000000) != 0)
  {
LABEL_49:
    uint64_t v5 = 2654435761 * self->_staticUnlockCountType0;
    if ((*(_DWORD *)&v4 & 0x10000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v4 & 0x10000000) != 0)
  {
LABEL_50:
    uint64_t v6 = 2654435761 * self->_onlineUnlockCountType0;
    if ((*(void *)&v4 & 0x8000000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v6 = 0;
  if ((*(void *)&v4 & 0x8000000000) != 0)
  {
LABEL_51:
    uint64_t v7 = 2654435761 * self->_shortTermUnlockCountType0;
    if ((*(void *)&v4 & 0x80000000000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v7 = 0;
  if ((*(void *)&v4 & 0x80000000000) != 0)
  {
LABEL_52:
    uint64_t v8 = 2654435761 * self->_staticUnlockCountType1;
    if ((*(_DWORD *)&v4 & 0x20000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v4 & 0x20000000) != 0)
  {
LABEL_53:
    uint64_t v9 = 2654435761 * self->_onlineUnlockCountType1;
    if ((*(void *)&v4 & 0x10000000000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v9 = 0;
  if ((*(void *)&v4 & 0x10000000000) != 0)
  {
LABEL_54:
    uint64_t v10 = 2654435761 * self->_shortTermUnlockCountType1;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_55;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_55:
    uint64_t v11 = 2654435761 * self->_baseTemplateFeatureCountType0Identity0;
    if ((*(_DWORD *)&v4 & 0x40000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&v4 & 0x40000000) != 0)
  {
LABEL_56:
    uint64_t v12 = 2654435761 * self->_onlineUpdateTemplateFeatureCountType0Identity0;
    if ((*(void *)&v4 & 0x400000000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v12 = 0;
  if ((*(void *)&v4 & 0x400000000) != 0)
  {
LABEL_57:
    uint64_t v13 = 2654435761 * self->_passcodeUpdateTemplateFeatureCountType0Identity0;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_58;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_58:
    uint64_t v14 = 2654435761 * self->_baseTemplateFeatureCountType0Identity1;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&v4 & 0x80000000) != 0)
  {
LABEL_59:
    uint64_t v15 = 2654435761 * self->_onlineUpdateTemplateFeatureCountType0Identity1;
    if ((*(void *)&v4 & 0x800000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v15 = 0;
  if ((*(void *)&v4 & 0x800000000) != 0)
  {
LABEL_60:
    uint64_t v16 = 2654435761 * self->_passcodeUpdateTemplateFeatureCountType0Identity1;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_61;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_61:
    uint64_t v17 = 2654435761 * self->_baseTemplateFeatureCountType1Identity0;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v17 = 0;
  if ((*(void *)&v4 & 0x100000000) != 0)
  {
LABEL_62:
    uint64_t v18 = 2654435761 * self->_onlineUpdateTemplateFeatureCountType1Identity0;
    if ((*(void *)&v4 & 0x1000000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v18 = 0;
  if ((*(void *)&v4 & 0x1000000000) != 0)
  {
LABEL_63:
    uint64_t v19 = 2654435761 * self->_passcodeUpdateTemplateFeatureCountType1Identity0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_64;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_64:
    uint64_t v20 = 2654435761 * self->_baseTemplateFeatureCountType1Identity1;
    if ((*(void *)&v4 & 0x200000000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v20 = 0;
  if ((*(void *)&v4 & 0x200000000) != 0)
  {
LABEL_65:
    uint64_t v21 = 2654435761 * self->_onlineUpdateTemplateFeatureCountType1Identity1;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_109;
  }
LABEL_108:
  uint64_t v21 = 0;
  if ((*(void *)&v4 & 0x2000000000) != 0)
  {
LABEL_66:
    uint64_t v22 = 2654435761 * self->_passcodeUpdateTemplateFeatureCountType1Identity1;
    if ((*(void *)&v4 & 0x40000000000000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_110;
  }
LABEL_109:
  uint64_t v22 = 0;
  if ((*(void *)&v4 & 0x40000000000000) != 0)
  {
LABEL_67:
    uint64_t v23 = 2654435761 * self->_type1MatchEnabled;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_68;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_68:
    uint64_t v24 = 2654435761 * self->_enrolledTemplateCountType0;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_69;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v24 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_69:
    uint64_t v25 = 2654435761 * self->_enrolledTemplateCountType1;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_70;
    }
    goto LABEL_113;
  }
LABEL_112:
  uint64_t v25 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_70:
    uint64_t v26 = 2654435761 * self->_enrolledTemplateCountTotal;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_71;
    }
    goto LABEL_114;
  }
LABEL_113:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_71:
    uint64_t v27 = 2654435761 * self->_matchingTemplateCountType0Identity0;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_72;
    }
    goto LABEL_115;
  }
LABEL_114:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_72:
    uint64_t v28 = 2654435761 * self->_matchingTemplateCountType0Identity1;
    if ((*(_DWORD *)&v4 & 0x2000000) != 0) {
      goto LABEL_73;
    }
LABEL_116:
    uint64_t v29 = 0;
    if ((*(_DWORD *)&v4 & 0x4000000) != 0) {
      goto LABEL_74;
    }
LABEL_117:
    uint64_t v30 = 0;
    return v69 ^ v70 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_115:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v4 & 0x2000000) == 0) {
    goto LABEL_116;
  }
LABEL_73:
  uint64_t v29 = 2654435761 * self->_matchingTemplateCountType1Identity0;
  if ((*(_DWORD *)&v4 & 0x4000000) == 0) {
    goto LABEL_117;
  }
LABEL_74:
  uint64_t v30 = 2654435761 * self->_matchingTemplateCountType1Identity1;
  return v69 ^ v70 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  $A65F620BC397D00BFD1B4A2C8FC4C07C v4 = a3;
  if ((*((unsigned char *)v4 + 436) & 2) != 0)
  {
    self->_timestamp = v4[29];
    *(void *)&self->_has |= 2uLL;
  }
  uint64_t v34 = (char *)v4;
  uint64_t v5 = [v4 baseTemplateFeatureCountsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDBiometricKitDailyUpdate addBaseTemplateFeatureCount:](self, "addBaseTemplateFeatureCount:", [v34 baseTemplateFeatureCountAtIndex:i]);
  }
  uint64_t v8 = [v34 onlineUpdateTemplateFeatureCountsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDBiometricKitDailyUpdate addOnlineUpdateTemplateFeatureCount:](self, "addOnlineUpdateTemplateFeatureCount:", [v34 onlineUpdateTemplateFeatureCountAtIndex:j]);
  }
  uint64_t v11 = [v34 passcodeUpdateTemplateFeatureCountsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDBiometricKitDailyUpdate addPasscodeUpdateTemplateFeatureCount:](self, "addPasscodeUpdateTemplateFeatureCount:", [v34 passcodeUpdateTemplateFeatureCountAtIndex:k]);
  }
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x80000000000000) != 0)
  {
    self->_unlockEnabled = v34[434];
    *(void *)&self->_has |= 0x80000000000000uLL;
    uint64_t v14 = *(void *)(v34 + 436);
    if ((v14 & 0x2000000000000) == 0)
    {
LABEL_14:
      if ((v14 & 0x4000000000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_94;
    }
  }
  else if ((v14 & 0x2000000000000) == 0)
  {
    goto LABEL_14;
  }
  self->_applePayEnabled = v34[428];
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((v14 & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_attentionDetectionEnabled = v34[429];
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x80000) == 0)
  {
LABEL_16:
    if ((v14 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_matchingCountDouble01 = *((_DWORD *)v34 + 77);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x100000) == 0)
  {
LABEL_17:
    if ((v14 & 0x200000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_matchingCountDouble02 = *((_DWORD *)v34 + 78);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x200000) == 0)
  {
LABEL_18:
    if ((v14 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_matchingCountDouble03 = *((_DWORD *)v34 + 79);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x400000) == 0)
  {
LABEL_19:
    if ((v14 & 0x20000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_matchingCountDouble04 = *((_DWORD *)v34 + 80);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x20000000000) == 0)
  {
LABEL_20:
    if ((v14 & 0x8000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_staticUnlockCount = *((_DWORD *)v34 + 99);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v14 = *(void *)(v34 + 436);
  if ((v14 & 0x8000000) == 0)
  {
LABEL_21:
    if ((v14 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_100:
  self->_onlineUnlockCount = *((_DWORD *)v34 + 85);
  *(void *)&self->_has |= 0x8000000uLL;
  if ((*(void *)(v34 + 436) & 0x4000000000) != 0)
  {
LABEL_22:
    self->_shortTermUnlockCount = *((_DWORD *)v34 + 96);
    *(void *)&self->_has |= 0x4000000000uLL;
  }
LABEL_23:
  uint64_t v15 = [v34 matchingBinCountsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[AWDBiometricKitDailyUpdate addMatchingBinCounts:](self, "addMatchingBinCounts:", [v34 matchingBinCountsAtIndex:m]);
  }
  uint64_t v18 = [v34 matchingTemplateTypeCountsCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[AWDBiometricKitDailyUpdate addMatchingTemplateTypeCounts:](self, "addMatchingTemplateTypeCounts:", [v34 matchingTemplateTypeCountsAtIndex:n]);
  }
  if ((v34[442] & 0x10) != 0)
  {
    self->_cameraInterlocuint64_t k = v34[431];
    *(void *)&self->_has |= 0x10000000000000uLL;
  }
  uint64_t v21 = [v34 bioCheckInfosCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[AWDBiometricKitDailyUpdate addBioCheckInfo:](self, "addBioCheckInfo:", [v34 bioCheckInfoAtIndex:ii]);
  }
  uint64_t v24 = [v34 bioCheckResultsCount];
  if (v24)
  {
    uint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
      -[AWDBiometricKitDailyUpdate addBioCheckResult:](self, "addBioCheckResult:", [v34 bioCheckResultAtIndex:jj]);
  }
  uint64_t v27 = [v34 passcodeUpdatesCount];
  if (v27)
  {
    uint64_t v28 = v27;
    for (kuint64_t k = 0; kk != v28; ++kk)
      -[AWDBiometricKitDailyUpdate addPasscodeUpdate:](self, "addPasscodeUpdate:", [v34 passcodeUpdateAtIndex:kk]);
  }
  if (v34[436] < 0)
  {
    self->_enrolledIdentityCount = *((_DWORD *)v34 + 65);
    *(void *)&self->_has |= 0x80uLL;
  }
  uint64_t v30 = [v34 matchingIdentityCountsCount];
  if (v30)
  {
    uint64_t v31 = v30;
    for (muint64_t m = 0; mm != v31; ++mm)
      -[AWDBiometricKitDailyUpdate addMatchingIdentityCounts:](self, "addMatchingIdentityCounts:", [v34 matchingIdentityCountsAtIndex:mm]);
  }
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x20000000000000) != 0)
  {
    self->_combinedSequenceEnabled = v34[432];
    *(void *)&self->_has |= 0x20000000000000uLL;
    uint64_t v33 = *(void *)(v34 + 436);
    if ((v33 & 1) == 0)
    {
LABEL_47:
      if ((v33 & 0x40) == 0) {
        goto LABEL_48;
      }
      goto LABEL_104;
    }
  }
  else if ((v33 & 1) == 0)
  {
    goto LABEL_47;
  }
  self->_bioLockoutTime = *((void *)v34 + 28);
  *(void *)&self->_has |= 1uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x40) == 0)
  {
LABEL_48:
    if ((v33 & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_bioLockoutCount = *((_DWORD *)v34 + 64);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((v33 & 0x1000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_autoRetryEnabled = v34[430];
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x1000000000000) == 0)
  {
LABEL_50:
    if ((v33 & 0x100000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_yogiErrorDays = *((_DWORD *)v34 + 106);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x100000000000) == 0)
  {
LABEL_51:
    if ((v33 & 0x800000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_totalMatchAttempts = *((_DWORD *)v34 + 102);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((v33 & 0x400000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_totalMatchAttemptsSuccessful = *((_DWORD *)v34 + 105);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x400000000000) == 0)
  {
LABEL_53:
    if ((v33 & 0x200000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_totalMatchAttemptsFailed = *((_DWORD *)v34 + 104);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x200000000000) == 0)
  {
LABEL_54:
    if ((v33 & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_totalMatchAttemptsFaceDetected = *((_DWORD *)v34 + 103);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x20000) == 0)
  {
LABEL_55:
    if ((v33 & 0x8000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_matchAttemptsType0 = *((_DWORD *)v34 + 75);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x8000) == 0)
  {
LABEL_56:
    if ((v33 & 0x2000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_matchAttemptsSuccessfulType0 = *((_DWORD *)v34 + 73);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x2000) == 0)
  {
LABEL_57:
    if ((v33 & 0x800) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_matchAttemptsFailedType0 = *((_DWORD *)v34 + 71);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x800) == 0)
  {
LABEL_58:
    if ((v33 & 0x40000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_matchAttemptsFaceDetectedType0 = *((_DWORD *)v34 + 69);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x40000) == 0)
  {
LABEL_59:
    if ((v33 & 0x10000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_matchAttemptsType1 = *((_DWORD *)v34 + 76);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x10000) == 0)
  {
LABEL_60:
    if ((v33 & 0x4000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_matchAttemptsSuccessfulType1 = *((_DWORD *)v34 + 74);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x4000) == 0)
  {
LABEL_61:
    if ((v33 & 0x1000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_matchAttemptsFailedType1 = *((_DWORD *)v34 + 72);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x1000) == 0)
  {
LABEL_62:
    if ((v33 & 0x40000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_matchAttemptsFaceDetectedType1 = *((_DWORD *)v34 + 70);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x40000000000) == 0)
  {
LABEL_63:
    if ((v33 & 0x10000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_staticUnlockCountType0 = *((_DWORD *)v34 + 100);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x10000000) == 0)
  {
LABEL_64:
    if ((v33 & 0x8000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_onlineUnlockCountType0 = *((_DWORD *)v34 + 86);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x8000000000) == 0)
  {
LABEL_65:
    if ((v33 & 0x80000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_shortTermUnlockCountType0 = *((_DWORD *)v34 + 97);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x80000000000) == 0)
  {
LABEL_66:
    if ((v33 & 0x20000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_staticUnlockCountType1 = *((_DWORD *)v34 + 101);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x20000000) == 0)
  {
LABEL_67:
    if ((v33 & 0x10000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_onlineUnlockCountType1 = *((_DWORD *)v34 + 87);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x10000000000) == 0)
  {
LABEL_68:
    if ((v33 & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_shortTermUnlockCountType1 = *((_DWORD *)v34 + 98);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 4) == 0)
  {
LABEL_69:
    if ((v33 & 0x40000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_baseTemplateFeatureCountType0Identity0 = *((_DWORD *)v34 + 60);
  *(void *)&self->_has |= 4uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x40000000) == 0)
  {
LABEL_70:
    if ((v33 & 0x400000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_onlineUpdateTemplateFeatureCountType0Identity0 = *((_DWORD *)v34 + 88);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x400000000) == 0)
  {
LABEL_71:
    if ((v33 & 8) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_passcodeUpdateTemplateFeatureCountType0Identity0 = *((_DWORD *)v34 + 92);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 8) == 0)
  {
LABEL_72:
    if ((v33 & 0x80000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_baseTemplateFeatureCountType0Identity1 = *((_DWORD *)v34 + 61);
  *(void *)&self->_has |= 8uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x80000000) == 0)
  {
LABEL_73:
    if ((v33 & 0x800000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_onlineUpdateTemplateFeatureCountType0Identity1 = *((_DWORD *)v34 + 89);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x800000000) == 0)
  {
LABEL_74:
    if ((v33 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_passcodeUpdateTemplateFeatureCountType0Identity1 = *((_DWORD *)v34 + 93);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x10) == 0)
  {
LABEL_75:
    if ((v33 & 0x100000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_baseTemplateFeatureCountType1Identity0 = *((_DWORD *)v34 + 62);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x100000000) == 0)
  {
LABEL_76:
    if ((v33 & 0x1000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_onlineUpdateTemplateFeatureCountType1Identity0 = *((_DWORD *)v34 + 90);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x1000000000) == 0)
  {
LABEL_77:
    if ((v33 & 0x20) == 0) {
      goto LABEL_78;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_passcodeUpdateTemplateFeatureCountType1Identity0 = *((_DWORD *)v34 + 94);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x20) == 0)
  {
LABEL_78:
    if ((v33 & 0x200000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_baseTemplateFeatureCountType1Identity1 = *((_DWORD *)v34 + 63);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x200000000) == 0)
  {
LABEL_79:
    if ((v33 & 0x2000000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_onlineUpdateTemplateFeatureCountType1Identity1 = *((_DWORD *)v34 + 91);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x2000000000) == 0)
  {
LABEL_80:
    if ((v33 & 0x40000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_passcodeUpdateTemplateFeatureCountType1Identity1 = *((_DWORD *)v34 + 95);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x40000000000000) == 0)
  {
LABEL_81:
    if ((v33 & 0x200) == 0) {
      goto LABEL_82;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_type1MatchEnabled = v34[433];
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x200) == 0)
  {
LABEL_82:
    if ((v33 & 0x400) == 0) {
      goto LABEL_83;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_enrolledTemplateCountType0 = *((_DWORD *)v34 + 67);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x400) == 0)
  {
LABEL_83:
    if ((v33 & 0x100) == 0) {
      goto LABEL_84;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_enrolledTemplateCountType1 = *((_DWORD *)v34 + 68);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x100) == 0)
  {
LABEL_84:
    if ((v33 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_enrolledTemplateCountTotal = *((_DWORD *)v34 + 66);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x800000) == 0)
  {
LABEL_85:
    if ((v33 & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_matchingTemplateCountType0Identity0 = *((_DWORD *)v34 + 81);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x1000000) == 0)
  {
LABEL_86:
    if ((v33 & 0x2000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_matchingTemplateCountType0Identity1 = *((_DWORD *)v34 + 82);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v33 = *(void *)(v34 + 436);
  if ((v33 & 0x2000000) == 0)
  {
LABEL_87:
    if ((v33 & 0x4000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
LABEL_143:
  self->_matchingTemplateCountType1Identity0 = *((_DWORD *)v34 + 83);
  *(void *)&self->_has |= 0x2000000uLL;
  if ((*(void *)(v34 + 436) & 0x4000000) != 0)
  {
LABEL_88:
    self->_matchingTemplateCountType1Identity1 = *((_DWORD *)v34 + 84);
    *(void *)&self->_has |= 0x4000000uLL;
  }
LABEL_89:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (BOOL)applePayEnabled
{
  return self->_applePayEnabled;
}

- (BOOL)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (unsigned)matchingCountDouble01
{
  return self->_matchingCountDouble01;
}

- (unsigned)matchingCountDouble02
{
  return self->_matchingCountDouble02;
}

- (unsigned)matchingCountDouble03
{
  return self->_matchingCountDouble03;
}

- (unsigned)matchingCountDouble04
{
  return self->_matchingCountDouble04;
}

- (unsigned)staticUnlockCount
{
  return self->_staticUnlockCount;
}

- (unsigned)onlineUnlockCount
{
  return self->_onlineUnlockCount;
}

- (unsigned)shortTermUnlockCount
{
  return self->_shortTermUnlockCount;
}

- (BOOL)cameraInterlock
{
  return self->_cameraInterlock;
}

- (unsigned)enrolledIdentityCount
{
  return self->_enrolledIdentityCount;
}

- (BOOL)combinedSequenceEnabled
{
  return self->_combinedSequenceEnabled;
}

- (unint64_t)bioLockoutTime
{
  return self->_bioLockoutTime;
}

- (unsigned)bioLockoutCount
{
  return self->_bioLockoutCount;
}

- (BOOL)autoRetryEnabled
{
  return self->_autoRetryEnabled;
}

- (unsigned)yogiErrorDays
{
  return self->_yogiErrorDays;
}

- (unsigned)totalMatchAttempts
{
  return self->_totalMatchAttempts;
}

- (unsigned)totalMatchAttemptsSuccessful
{
  return self->_totalMatchAttemptsSuccessful;
}

- (unsigned)totalMatchAttemptsFailed
{
  return self->_totalMatchAttemptsFailed;
}

- (unsigned)totalMatchAttemptsFaceDetected
{
  return self->_totalMatchAttemptsFaceDetected;
}

- (unsigned)matchAttemptsType0
{
  return self->_matchAttemptsType0;
}

- (unsigned)matchAttemptsSuccessfulType0
{
  return self->_matchAttemptsSuccessfulType0;
}

- (unsigned)matchAttemptsFailedType0
{
  return self->_matchAttemptsFailedType0;
}

- (unsigned)matchAttemptsFaceDetectedType0
{
  return self->_matchAttemptsFaceDetectedType0;
}

- (unsigned)matchAttemptsType1
{
  return self->_matchAttemptsType1;
}

- (unsigned)matchAttemptsSuccessfulType1
{
  return self->_matchAttemptsSuccessfulType1;
}

- (unsigned)matchAttemptsFailedType1
{
  return self->_matchAttemptsFailedType1;
}

- (unsigned)matchAttemptsFaceDetectedType1
{
  return self->_matchAttemptsFaceDetectedType1;
}

- (unsigned)staticUnlockCountType0
{
  return self->_staticUnlockCountType0;
}

- (unsigned)onlineUnlockCountType0
{
  return self->_onlineUnlockCountType0;
}

- (unsigned)shortTermUnlockCountType0
{
  return self->_shortTermUnlockCountType0;
}

- (unsigned)staticUnlockCountType1
{
  return self->_staticUnlockCountType1;
}

- (unsigned)onlineUnlockCountType1
{
  return self->_onlineUnlockCountType1;
}

- (unsigned)shortTermUnlockCountType1
{
  return self->_shortTermUnlockCountType1;
}

- (unsigned)baseTemplateFeatureCountType0Identity0
{
  return self->_baseTemplateFeatureCountType0Identity0;
}

- (unsigned)onlineUpdateTemplateFeatureCountType0Identity0
{
  return self->_onlineUpdateTemplateFeatureCountType0Identity0;
}

- (unsigned)passcodeUpdateTemplateFeatureCountType0Identity0
{
  return self->_passcodeUpdateTemplateFeatureCountType0Identity0;
}

- (unsigned)baseTemplateFeatureCountType0Identity1
{
  return self->_baseTemplateFeatureCountType0Identity1;
}

- (unsigned)onlineUpdateTemplateFeatureCountType0Identity1
{
  return self->_onlineUpdateTemplateFeatureCountType0Identity1;
}

- (unsigned)passcodeUpdateTemplateFeatureCountType0Identity1
{
  return self->_passcodeUpdateTemplateFeatureCountType0Identity1;
}

- (unsigned)baseTemplateFeatureCountType1Identity0
{
  return self->_baseTemplateFeatureCountType1Identity0;
}

- (unsigned)onlineUpdateTemplateFeatureCountType1Identity0
{
  return self->_onlineUpdateTemplateFeatureCountType1Identity0;
}

- (unsigned)passcodeUpdateTemplateFeatureCountType1Identity0
{
  return self->_passcodeUpdateTemplateFeatureCountType1Identity0;
}

- (unsigned)baseTemplateFeatureCountType1Identity1
{
  return self->_baseTemplateFeatureCountType1Identity1;
}

- (unsigned)onlineUpdateTemplateFeatureCountType1Identity1
{
  return self->_onlineUpdateTemplateFeatureCountType1Identity1;
}

- (unsigned)passcodeUpdateTemplateFeatureCountType1Identity1
{
  return self->_passcodeUpdateTemplateFeatureCountType1Identity1;
}

- (BOOL)type1MatchEnabled
{
  return self->_type1MatchEnabled;
}

- (unsigned)enrolledTemplateCountType0
{
  return self->_enrolledTemplateCountType0;
}

- (unsigned)enrolledTemplateCountType1
{
  return self->_enrolledTemplateCountType1;
}

- (unsigned)enrolledTemplateCountTotal
{
  return self->_enrolledTemplateCountTotal;
}

- (unsigned)matchingTemplateCountType0Identity0
{
  return self->_matchingTemplateCountType0Identity0;
}

- (unsigned)matchingTemplateCountType0Identity1
{
  return self->_matchingTemplateCountType0Identity1;
}

- (unsigned)matchingTemplateCountType1Identity0
{
  return self->_matchingTemplateCountType1Identity0;
}

- (unsigned)matchingTemplateCountType1Identity1
{
  return self->_matchingTemplateCountType1Identity1;
}

@end