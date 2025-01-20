@interface PearlCoreAnalytics
+ (void)sendDisplayPearlGlassesBannerNotificationEvent;
+ (void)sendEnrollPearlGlassesBannerNotificationEvent;
- (BOOL)postSimpleCoreAnalyticsEvent:(id)a3 fromAWDMetric:(id)a4;
- (BiometricAutoBugCapture)pearlAbc;
- (PearlCoreAnalytics)init;
- (id)analyticsPerformCommandBlock;
- (int)sequenceTypeToCaptureMethod:(unsigned __int8)a3 forSequence:(unsigned __int8)a4;
- (void)checkDailyUpdate;
- (void)checkYogiError:(int)a3;
- (void)getDailyUpdateAnalytics;
- (void)sendBioLockoutEventAnalytics:(id)a3;
- (void)sendEnrollEventAnalytics:(id)a3 orientation:(unint64_t)a4;
- (void)sendFaceDetectEventAnalytics:(id)a3 fromMatch:(BOOL)a4 orientation:(unint64_t)a5;
- (void)sendMatchEventAnalytics:(id)a3 orientation:(unint64_t)a4 identities:(id)a5;
- (void)sendPasscodeChallengeEventAnalytics:(id)a3 orientation:(unint64_t)a4;
- (void)sendPearlAbcEvent:(unint64_t)a3;
- (void)setAnalyticsPerformCommandBlock:(id)a3;
- (void)setPearlAbc:(id)a3;
- (void)setupDailyUpdateTimer;
@end

@implementation PearlCoreAnalytics

- (PearlCoreAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)PearlCoreAnalytics;
  v2 = [(PearlCoreAnalytics *)&v6 init];
  if (v2)
  {
    v2->_isInternalBuild = isInternalBuild();
    v3 = [[PearlCoreAnalyticsDailyUpdateEvent alloc] initWithPersistedData];
    dailyEvent = v2->_dailyEvent;
    v2->_dailyEvent = v3;

    [(PearlCoreAnalytics *)v2 setupDailyUpdateTimer];
  }
  return v2;
}

- (void)checkDailyUpdate
{
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [(BiometricKitCoreAnalyticsEvent *)self->_dailyEvent previousEventDate];
  char v5 = [v3 isDateInToday:v4];

  if ((v5 & 1) == 0)
  {
    [(PearlCoreAnalytics *)self getDailyUpdateAnalytics];
  }
}

- (void)setupDailyUpdateTimer
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = dispatch_get_global_queue(-2, 0);
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
  dailyUpdateTimer = self->_dailyUpdateTimer;
  self->_dailyUpdateTimer = v4;

  objc_super v6 = self->_dailyUpdateTimer;
  if (v6) {
    goto LABEL_2;
  }
  v9 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v12 = "_dailyUpdateTimer";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    v16 = &unk_222DFB9BF;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v19 = 1024;
    int v20 = 75;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  objc_super v6 = self->_dailyUpdateTimer;
  if (v6)
  {
LABEL_2:
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __43__PearlCoreAnalytics_setupDailyUpdateTimer__block_invoke;
    handler[3] = &unk_26466F610;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    v7 = self->_dailyUpdateTimer;
    dispatch_time_t v8 = dispatch_walltime(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0x4E94914F0000uLL, 0xDF8475800uLL);
    dispatch_resume((dispatch_object_t)self->_dailyUpdateTimer);
  }
}

uint64_t __43__PearlCoreAnalytics_setupDailyUpdateTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkDailyUpdate];
}

- (void)sendMatchEventAnalytics:(id)a3 orientation:(unint64_t)a4 identities:(id)a5
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v93 = a5;
  dispatch_time_t v8 = (void *)__osLog;
  v9 = MEMORY[0x263EF8438];
  if (!__osLog) {
    dispatch_time_t v8 = (void *)MEMORY[0x263EF8438];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v7 != 0;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendMatchEventAnalytics: matchMessage: %d\n", buf, 8u);
  }

  v95 = objc_alloc_init(PearlCoreAnalyticsMatchEvent);
  v11 = [(PearlCoreAnalyticsEvent *)v95 getAWDMetric];
  long long v112 = 0u;
  memset(v113, 0, 63);
  *(_OWORD *)buf = 0u;
  if (!v7)
  {
    if (__osLog) {
      v86 = __osLog;
    }
    else {
      v86 = v9;
    }
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      goto LABEL_108;
    }
    *(_DWORD *)v101 = 136316162;
    v102 = "matchMessage";
    __int16 v103 = 2048;
    uint64_t v104 = 0;
    __int16 v105 = 2080;
    v106 = &unk_222DFB9BF;
    __int16 v107 = 2080;
    v108 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v109 = 1024;
    int v110 = 118;
LABEL_123:
    _os_log_impl(&dword_222D7E000, v86, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v101, 0x30u);
    goto LABEL_108;
  }
  if ((unint64_t)[v7 length] <= 0x156)
  {
    if (__osLog) {
      v86 = __osLog;
    }
    else {
      v86 = v9;
    }
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      goto LABEL_108;
    }
    *(_DWORD *)v101 = 136316162;
    v102 = "[matchMessage length] >= sizeof(analytics_match_message_t)";
    __int16 v103 = 2048;
    uint64_t v104 = 0;
    __int16 v105 = 2080;
    v106 = &unk_222DFB9BF;
    __int16 v107 = 2080;
    v108 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v109 = 1024;
    int v110 = 119;
    goto LABEL_123;
  }
  id v89 = v7;
  v12 = (unsigned int *)[v7 bytes];
  [v11 setCaptureMethod:-[PearlCoreAnalytics sequenceTypeToCaptureMethod:forSequence:](self, "sequenceTypeToCaptureMethod:forSequence:", *((unsigned __int8 *)v12 + 314), *((unsigned __int8 *)v12 + 15))];
  v94 = self;
  if (self->_isInternalBuild) {
    [v11 setCombinedSequenceEnabled:*((unsigned __int8 *)v12 + 264)];
  }
  [v11 setMatchType:*((unsigned __int8 *)v12 + 323)];
  int v13 = *(unsigned int *)((char *)v12 + 59);
  int v14 = *(unsigned int *)((char *)v12 + 55) + *(unsigned int *)((char *)v12 + 51);
  int v15 = *(unsigned int *)((char *)v12 + 93);
  int v16 = *(unsigned int *)((char *)v12 + 97);
  int v17 = *(unsigned int *)((char *)v12 + 101);
  int v87 = *(unsigned int *)((char *)v12 + 133);
  int v18 = *(unsigned int *)((char *)v12 + 137);
  int v90 = *(unsigned int *)((char *)v12 + 141);
  [v11 setOverallResult:*((unsigned __int8 *)v12 + 13)];
  [v11 setOverallTime:absoluteToMiliseconds()];
  [v11 setOverallTimeWithRetries:absoluteToMiliseconds()];
  [v11 setMatchCancelled:*((unsigned __int8 *)v12 + 296)];
  if (*(void *)((char *)v12 + 315)) {
    [v11 setTimeSinceSleep:absoluteToMiliseconds()];
  }
  int v19 = v16 + v15;
  uint64_t v20 = absoluteToMiliseconds();
  if (v20) {
    [v11 setFaceDetectEndTime:v20];
  }
  uint64_t v21 = (v19 + v17);
  [v11 setFaceDetectResult:*((unsigned __int8 *)v12 + 49)];
  [v11 setFaceDetectFrameCount:(v14 + v13)];
  [v11 setFaceDetectFrameFloodCount:*(unsigned int *)((char *)v12 + 51)];
  [v11 setFaceDetectFrameSparseCount:*(unsigned int *)((char *)v12 + 55)];
  [v11 setFaceDetectFrameDenseCount:*(unsigned int *)((char *)v12 + 59)];
  uint64_t v22 = absoluteToMiliseconds();
  if (v22) {
    [v11 setBioCheckEndTime:v22];
  }
  [v11 setBioCheckResult:*((__int16 *)v12 + 45)];
  if (*((__int16 *)v12 + 45) == -1) {
    [v11 setHasBioCheckResult:0];
  }
  [v11 setBioCheckFrameCount:v21];
  [v11 setBioCheckFrameFloodCount:*(unsigned int *)((char *)v12 + 93)];
  [v11 setBioCheckFrameSparseCount:*(unsigned int *)((char *)v12 + 97)];
  [v11 setBioCheckFrameDenseCount:*(unsigned int *)((char *)v12 + 101)];
  uint64_t v23 = absoluteToMiliseconds();
  if (v23) {
    [v11 setProbingPatternEndTime:v23];
  }
  [v11 setProbingPatternResult:*(__int16 *)((char *)v12 + 131)];
  if (*(__int16 *)((char *)v12 + 131) == -1) {
    [v11 setHasProbingPatternResult:0];
  }
  [v11 setProbingPatternFrameCount:(v18 + v87 + v90)];
  [v11 setProbingPatternFrameFloodCount:*(unsigned int *)((char *)v12 + 133)];
  [v11 setProbingPatternFrameSparseCount:*(unsigned int *)((char *)v12 + 137)];
  [v11 setProbingPatternFrameDenseCount:*(unsigned int *)((char *)v12 + 141)];
  [v11 setAmbientLux:*v12];
  [v11 setMatchForUnlock:*(unsigned int *)((char *)v12 + 241) & 1];
  [v11 setFailedUnlockAttemptsFromFD:*(unsigned int *)((char *)v12 + 245)];
  [v11 setFailedUnlockAttemptsFromBiocheck:*(unsigned int *)((char *)v12 + 249)];
  [v11 setFailedMatchAttemptsFromFD:*(unsigned int *)((char *)v12 + 253)];
  [v11 setFailedMatchAttemptsFromBiocheck:*(unsigned int *)((char *)v12 + 257)];
  int v88 = v14 + v13;
  if (*((unsigned char *)v12 + 196) != 2)
  {
    uint64_t v26 = 0;
    BOOL v91 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    goto LABEL_25;
  }
  uint64_t v24 = *((unsigned __int8 *)v12 + 197);
  uint64_t v25 = *((unsigned __int8 *)v12 + 198);
  uint64_t v26 = *((unsigned char *)v12 + 189) == 0;
  if (*((unsigned char *)v12 + 198))
  {
    BOOL v91 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
LABEL_25:
    uint64_t v30 = 0;
    goto LABEL_26;
  }
  BOOL v91 = *((unsigned char *)v12 + 190) == 0;
  uint64_t v27 = *((unsigned char *)v12 + 191) == 0;
  uint64_t v28 = *((unsigned char *)v12 + 200) == 0;
  uint64_t v29 = *((unsigned char *)v12 + 201) == 0;
  uint64_t v30 = *((unsigned char *)v12 + 199) == 0;
LABEL_26:
  if (*((unsigned char *)v12 + 216) != 3) {
    goto LABEL_59;
  }
  if (*(__int16 *)((char *)v12 + 131) >= 1) {
    [v11 setProbingPatternFailure:1];
  }
  if (*((unsigned char *)v12 + 217) && ([v11 captureMethod] != 3 || !v24)) {
    uint64_t v24 = *((unsigned __int8 *)v12 + 217);
  }
  if (!*((unsigned char *)v12 + 218))
  {
LABEL_41:
    if (*((unsigned char *)v12 + 209)) {
      uint64_t v26 = v26;
    }
    else {
      uint64_t v26 = 1;
    }
    if (!v25)
    {
      int v32 = v91;
      if (!*((unsigned char *)v12 + 210)) {
        int v32 = 1;
      }
      BOOL v91 = v32;
      if (*((unsigned char *)v12 + 211)) {
        uint64_t v27 = v27;
      }
      else {
        uint64_t v27 = 1;
      }
      if (*((unsigned char *)v12 + 220)) {
        uint64_t v28 = v28;
      }
      else {
        uint64_t v28 = 1;
      }
      if (*((unsigned char *)v12 + 221)) {
        uint64_t v29 = v29;
      }
      else {
        uint64_t v29 = 1;
      }
      if (*((unsigned char *)v12 + 219)) {
        uint64_t v30 = v30;
      }
      else {
        uint64_t v30 = 1;
      }
    }
    goto LABEL_59;
  }
  int v31 = [v11 captureMethod];
  if (!v25 || v31 != 3)
  {
    uint64_t v25 = *((unsigned __int8 *)v12 + 218);
    goto LABEL_41;
  }
  if (*((unsigned char *)v12 + 209)) {
    uint64_t v26 = v26;
  }
  else {
    uint64_t v26 = 1;
  }
LABEL_59:
  [v11 setMatcherFailure:v26];
  [v11 setMatchDepthFailure:v27];
  [v11 setMatchFloodFailure:v91];
  [v11 setAsFloodFailure:v28];
  [v11 setAsDepthFailure:v29];
  [v11 setFeatureGenerationError:v24];
  [v11 setMatchFeatureVectorError:v25];
  [v11 setAsFailure:v30];
  [v11 setOnlineTemplateUpdated:*((unsigned char *)v12 + 163) != 0];
  [v11 setPasscodeChallengeAllowed:*((unsigned char *)v12 + 164) != 0];
  if (*((unsigned char *)v12 + 63))
  {
    [v11 setFaceDetectFaceDistance:*(unsigned __int16 *)((char *)v12 + 69)];
    [v11 setFaceDetectCamRectX:*(unsigned __int16 *)((char *)v12 + 71)];
    [v11 setFaceDetectCamRectY:*(unsigned __int16 *)((char *)v12 + 73)];
    [v11 setFaceDetectCamRectW:*(unsigned __int16 *)((char *)v12 + 75)];
    [v11 setFaceDetectCamRectH:*(unsigned __int16 *)((char *)v12 + 77)];
    [v11 setFaceDetectPPMRequestedBudget:*((unsigned __int8 *)v12 + 79)];
    [v11 setFaceDetectPPMAllocatedBudget:*((unsigned __int8 *)v12 + 80)];
    v33 = (char *)v12 + 63;
  }
  else
  {
    v33 = 0;
  }
  v34 = (char *)v12 + 105;
  if (*((unsigned char *)v12 + 105))
  {
    [v11 setBioCheckFaceDistance:*(unsigned __int16 *)((char *)v12 + 111)];
    [v11 setBioCheckCamRectX:*(unsigned __int16 *)((char *)v12 + 113)];
    [v11 setBioCheckCamRectY:*(unsigned __int16 *)((char *)v12 + 115)];
    [v11 setBioCheckCamRectW:*(unsigned __int16 *)((char *)v12 + 117)];
    [v11 setBioCheckCamRectH:*(unsigned __int16 *)((char *)v12 + 119)];
    [v11 setBioCheckPPMRequestedBudget:*((unsigned __int8 *)v12 + 121)];
    [v11 setBioCheckPPMAllocatedBudget:*((unsigned __int8 *)v12 + 122)];
    v33 = (char *)v12 + 105;
  }
  if (*((unsigned char *)v12 + 145)
    && ([v11 setProbingPatternFaceDistance:*(unsigned __int16 *)((char *)v12 + 151)],
        [v11 setProbingPatternCamRectX:*(unsigned __int16 *)((char *)v12 + 153)],
        [v11 setProbingPatternCamRectY:*(unsigned __int16 *)((char *)v12 + 155)],
        [v11 setProbingPatternCamRectW:*(unsigned __int16 *)((char *)v12 + 157)],
        [v11 setProbingPatternCamRectH:*(unsigned __int16 *)((char *)v12 + 159)],
        [v11 captureMethod] != 3)
    || (v34 = v33) != 0)
  {
    [v11 setSensorTemperature:*(unsigned int *)(v34 + 2)];
    [v11 setFaceDistance:*((unsigned __int16 *)v34 + 3)];
    [v11 setHasOcclusion:v34[1]];
    [v11 setCamRectX:*((unsigned __int16 *)v34 + 4)];
    [v11 setCamRectY:*((unsigned __int16 *)v34 + 5)];
    [v11 setCamRectW:*((unsigned __int16 *)v34 + 6)];
    [v11 setCamRectH:*((unsigned __int16 *)v34 + 7)];
  }
  if (*((unsigned char *)v12 + 168))
  {
    uint64_t v35 = *(void *)((char *)v12 + 177);
    uint64_t v36 = *(void *)((char *)v12 + 169);
  }
  else
  {
    uint64_t v35 = -1;
    uint64_t v36 = -1;
  }
  [v11 setRfcSetIndex:v36];
  [v11 setRfcFrameIndex:v35];
  if (v36 == -1) {
    [v11 setHasRfcSetIndex:0];
  }
  if (v35 == -1) {
    [v11 setHasRfcFrameIndex:0];
  }
  if (*((unsigned char *)v12 + 166) && *((unsigned char *)v12 + 229))
  {
    uint64_t v37 = *((unsigned __int8 *)v12 + 230);
    uint64_t v38 = 1;
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v37 = 0;
  }
  [v11 setBioLockout:v38];
  [v11 setBioLockoutReason:v37];
  [v11 setCameraErr:*((char *)v12 + 4)];
  if (*((unsigned char *)v12 + 166))
  {
    if ((v12[58] & 0x80000000) == 0) {
      [v11 setOnlineTemplateAge:];
    }
    if ((v12[59] & 0x80000000) == 0) {
      [v11 setShortTermTemplateAge:];
    }
  }
  [v11 setAutoRetry:*((unsigned __int8 *)v12 + 261)];
  [v11 setAutoRetryAllowed:*((unsigned __int8 *)v12 + 262)];
  if (v94->_isInternalBuild) {
    [v11 setAutoRetryEnabled:*((unsigned __int8 *)v12 + 265)];
  }
  [v11 setMatchIdentityCount:*((unsigned __int8 *)v12 + 263)];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v39 = v93;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v96 objects:v100 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v97 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = [*(id *)(*((void *)&v96 + 1) + 8 * i) creationTime];
        [v44 timeIntervalSince1970];
        [v11 addIdentityCreationTime:(unint64_t)(v45 * 1000.0)];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v96 objects:v100 count:16];
    }
    while (v41);
  }

  v46 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 266)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackNoFaceDetected:v46];

  v47 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 267)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackFaceTooClose:v47];

  v48 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 268)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackFaceTooFar:v48];

  v49 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 269)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackPoseOutOfRange:v49];

  v50 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 270)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackNoAttention:v50];

  v51 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 271)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackFaceOccluded:v51];

  v52 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 272)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackCameraObstructed:v52];

  v53 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 273)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackPartialOutOfFOV:v53];

  v54 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 274)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackPoseMarginal:v54];

  v55 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 275)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackNoseAndMouthOccluded:v55];

  v56 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 276)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementInfoFeedbackDepthCameraObstructed:v56];

  v57 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 331)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusNoFaceDetected:v57];

  v58 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 332)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusFaceTooClose:v58];

  v59 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 333)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusFaceTooFar:v59];

  v60 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 334)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusPoseOutOfRange:v60];

  v61 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 335)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusNoAttention:v61];

  v62 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 336)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusFaceOccluded:v62];

  v63 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 337)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusCameraObstructed:v63];

  v64 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 338)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusPartialOutOfFOV:v64];

  v65 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 339)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusPoseMarginal:v65];

  v66 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 340)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusNoseAndMouthOccluded:v66];

  v67 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 341)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusDepthCameraObstructed:v67];

  v68 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 342)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEngagementStatusFPDFailure:v68];

  if (*((unsigned char *)v12 + 278))
  {
    v69 = [NSString stringWithCString:(char *)v12 + 279 encoding:1];
    [v11 setCameraHWParameters:v69];
  }
  [v11 setDeviceOrientation:a4];
  if (*((unsigned char *)v12 + 313))
  {
    [v11 setFaceOrientation:*(unsigned int *)((char *)v12 + 297)];
    [v11 setFacePitch:*(unsigned int *)((char *)v12 + 301)];
    [v11 setFaceYaw:*(unsigned int *)((char *)v12 + 305)];
    [v11 setFaceRoll:*(unsigned int *)((char *)v12 + 309)];
    BKLogCode();
  }
  if (*(unsigned int *)((char *)v12 + 185)) {
    -[PearlCoreAnalytics sendPearlAbcEvent:](v94, "sendPearlAbcEvent:");
  }
  if (v88 || *((unsigned char *)v12 + 4)) {
    [(PearlCoreAnalytics *)v94 checkYogiError:*((char *)v12 + 4)];
  }
  v70 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 324)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setGlassesDetected:v70];

  LODWORD(v70) = *((unsigned __int8 *)v12 + 326) + *((unsigned __int8 *)v12 + 325) + *((unsigned __int8 *)v12 + 327);
  v71 = [NSNumber numberWithUnsignedInt:v70];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType0:v71];

  v72 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v12 + 325)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType0NoGlasses:v72];

  v73 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v12 + 326)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType0WithGlasses:v73];

  v74 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v12 + 327)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType0Unknown:v74];

  LODWORD(v74) = *((unsigned __int8 *)v12 + 329) + *((unsigned __int8 *)v12 + 328) + *((unsigned __int8 *)v12 + 330);
  v75 = [NSNumber numberWithUnsignedInt:v74];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType1:v75];

  v76 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v12 + 328)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType1NoGlasses:v76];

  v77 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v12 + 329)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType1WithGlasses:v77];

  v78 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v12 + 330)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountType1Unknown:v78];

  v79 = [NSNumber numberWithUnsignedInt:(v74 + v70)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setEnrolledTemplateCountTotal:v79];

  v80 = [NSNumber numberWithBool:*((unsigned __int8 *)v12 + 81)];
  [(PearlCoreAnalyticsMatchEvent *)v95 setGmcRun:v80];

  [(PearlCoreAnalyticsEvent *)v95 postEvent];
  unint64_t v81 = *(void *)((char *)v12 + 41);
  *(void *)buf = *((void *)v12 + 4);
  *(void *)&buf[8] = v81;
  BYTE1(v112) = *((unsigned char *)v12 + 49);
  unsigned int v82 = *v12;
  HIDWORD(v112) = *(unsigned int *)((char *)v12 + 59);
  LODWORD(v113[0]) = v82;
  *(void *)((char *)&v112 + 4) = *(void *)((char *)v12 + 51);
  *(_OWORD *)((char *)v113 + 4) = *(_OWORD *)((char *)v12 + 63);
  WORD2(v113[1]) = *(_WORD *)((char *)v12 + 79);
  *(_DWORD *)((char *)&v113[1] + 14) = *(unsigned int *)((char *)v12 + 274);
  *(void *)((char *)&v113[1] + 6) = *(void *)((char *)v12 + 266);
  *(void *)((char *)&v113[3] + 3) = *(void *)((char *)v12 + 331);
  *(_DWORD *)((char *)&v113[3] + 11) = *(unsigned int *)((char *)v12 + 339);
  LOBYTE(v82) = *((unsigned char *)v12 + 313);
  *(_OWORD *)((char *)&v113[2] + 2) = *(_OWORD *)((char *)v12 + 297);
  BYTE2(v113[3]) = v82;
  if (*((unsigned char *)v12 + 4) && v81 >= *(void *)((char *)v12 + 5)) {
    BYTE2(v112) = *((unsigned char *)v12 + 4);
  }
  v83 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:95];
  [(PearlCoreAnalytics *)v94 sendFaceDetectEventAnalytics:v83 fromMatch:1 orientation:a4];
  BKLogCode();
  BKLogCode();
  BKLogCode();
  BKLogEvent();
  id v7 = v89;
  v9 = MEMORY[0x263EF8438];
  if ((*v12 & 0x80000000) == 0) {
    BKLogCode();
  }
  [(PearlCoreAnalyticsDailyUpdateEvent *)v94->_dailyEvent updateDailyMatchValues:v12];

LABEL_108:
  v84 = __osLog;
  if (!__osLog) {
    v84 = v9;
  }
  v85 = v84;
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v101 = 0;
    _os_log_impl(&dword_222D7E000, v85, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendMatchEventAnalytics: -> void\n", v101, 2u);
  }
}

- (void)sendFaceDetectEventAnalytics:(id)a3 fromMatch:(BOOL)a4 orientation:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = MEMORY[0x263EF8438];
  if (__osLog) {
    v10 = __osLog;
  }
  else {
    v10 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 67109120;
    LODWORD(v17) = v8 != 0;
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendFaceDetectEventAnalytics: fdMessage: %d\n", (uint8_t *)&v16, 8u);
  }
  v11 = objc_alloc_init(AWDBiometricKitFaceDetectAttempt);
  if (!v8)
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = v9;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136316162;
    int v17 = "fdMessage";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = &unk_222DFB9BF;
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v24 = 1024;
    int v25 = 512;
LABEL_28:
    _os_log_impl(&dword_222D7E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    goto LABEL_12;
  }
  if ((unint64_t)[v8 length] <= 0x5E)
  {
    if (__osLog) {
      int v15 = __osLog;
    }
    else {
      int v15 = v9;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v16 = 136316162;
    int v17 = "[fdMessage length] >= sizeof(analytics_facedetect_message_t)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = &unk_222DFB9BF;
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v24 = 1024;
    int v25 = 513;
    goto LABEL_28;
  }
  uint64_t v12 = [v8 bytes];
  uint64_t v13 = (*(_DWORD *)(v12 + 24) + *(_DWORD *)(v12 + 20) + *(_DWORD *)(v12 + 28));
  [(AWDBiometricKitFaceDetectAttempt *)v11 setOverallTime:absoluteToMiliseconds()];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDetectResult:*(unsigned __int8 *)(v12 + 17)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDetectFrameCount:v13];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDetectFrameFloodCount:*(unsigned int *)(v12 + 20)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDetectFrameSparseCount:*(unsigned int *)(v12 + 24)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDetectFrameDenseCount:*(unsigned int *)(v12 + 28)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setAmbientLux:*(unsigned int *)(v12 + 32)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setCameraErr:*(char *)(v12 + 18)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setSensorTemperature:*(unsigned int *)(v12 + 38)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDistance:*(unsigned __int16 *)(v12 + 42)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setHasOcclusion:*(unsigned __int8 *)(v12 + 37)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setCamRectX:*(unsigned __int16 *)(v12 + 44)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setCamRectY:*(unsigned __int16 *)(v12 + 46)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setCamRectW:*(unsigned __int16 *)(v12 + 48)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setCamRectH:*(unsigned __int16 *)(v12 + 50)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setPpmRequestedBudget:*(unsigned __int8 *)(v12 + 52)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setPpmAllocatedBudget:*(unsigned __int8 *)(v12 + 53)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackNoFaceDetected:*(unsigned __int8 *)(v12 + 54)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackFaceTooClose:*(unsigned __int8 *)(v12 + 55)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackFaceTooFar:*(unsigned __int8 *)(v12 + 56)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackPoseOutOfRange:*(unsigned __int8 *)(v12 + 57)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackNoAttention:*(unsigned __int8 *)(v12 + 58)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackFaceOccluded:*(unsigned __int8 *)(v12 + 59)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackCameraObstructed:*(unsigned __int8 *)(v12 + 60)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackPartialOutOfFOV:*(unsigned __int8 *)(v12 + 61)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackPoseMarginal:*(unsigned __int8 *)(v12 + 62)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setEngagementInfoFeedbackNoseAndMouthOccluded:*(unsigned __int8 *)(v12 + 63)];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceDetectFailed:*(unsigned __int8 *)(v12 + 17) > 1u];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setAttentionDetectFailed:(*(unsigned __int8 *)(v12 + 17) < 0x13uLL) & (0x41040u >> *(unsigned char *)(v12 + 17))];
  [(AWDBiometricKitFaceDetectAttempt *)v11 setDeviceOrientation:a5];
  if (*(unsigned char *)(v12 + 82))
  {
    [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceOrientation:*(unsigned int *)(v12 + 66)];
    [(AWDBiometricKitFaceDetectAttempt *)v11 setFacePitch:*(unsigned int *)(v12 + 70)];
    [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceYaw:*(unsigned int *)(v12 + 74)];
    [(AWDBiometricKitFaceDetectAttempt *)v11 setFaceRoll:*(unsigned int *)(v12 + 78)];
  }
  [(PearlCoreAnalytics *)self postSimpleCoreAnalyticsEvent:@"com.apple.biometrickit.pearl.faceDetectAttempt" fromAWDMetric:v11];
  if (!a4) {
    [(PearlCoreAnalytics *)self postSimpleCoreAnalyticsEvent:@"com.apple.biometrickit.pearl.attentionCheck" fromAWDMetric:v11];
  }
LABEL_12:
  if (__osLog) {
    int v14 = __osLog;
  }
  else {
    int v14 = v9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_222D7E000, v14, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendFaceDetectEventAnalytics: -> void\n", (uint8_t *)&v16, 2u);
  }
}

- (void)sendEnrollEventAnalytics:(id)a3 orientation:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = MEMORY[0x263EF8438];
  if (__osLog) {
    id v8 = __osLog;
  }
  else {
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 67109120;
    LODWORD(v26) = v6 != 0;
    _os_log_impl(&dword_222D7E000, v8, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendEnrollEventAnalytics: enrollMessage: %d\n", (uint8_t *)&v25, 8u);
  }
  v9 = objc_alloc_init(PearlCoreAnalyticsEnrollEvent);
  v10 = [(PearlCoreAnalyticsEvent *)v9 getAWDMetric];
  if (!v6)
  {
    if (__osLog) {
      uint64_t v23 = __osLog;
    }
    else {
      uint64_t v23 = v7;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    int v25 = 136316162;
    uint64_t v26 = "enrollMessage";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    uint64_t v30 = &unk_222DFB9BF;
    __int16 v31 = 2080;
    int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v33 = 1024;
    int v34 = 594;
LABEL_39:
    _os_log_impl(&dword_222D7E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    goto LABEL_23;
  }
  if ((unint64_t)[v6 length] <= 0xED)
  {
    if (__osLog) {
      uint64_t v23 = __osLog;
    }
    else {
      uint64_t v23 = v7;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    int v25 = 136316162;
    uint64_t v26 = "[enrollMessage length] >= sizeof(analytics_enroll_message_t)";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    uint64_t v30 = &unk_222DFB9BF;
    __int16 v31 = 2080;
    int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v33 = 1024;
    int v34 = 595;
    goto LABEL_39;
  }
  v11 = (unsigned __int8 *)[v6 bytes];
  [v10 setOverallResult:*v11];
  [v10 setOverallTime:absoluteToMiliseconds()];
  [v10 setDoubleErrorCountsOK:*((unsigned int *)v11 + 5)];
  [v10 setDoubleErrorCountsMoreFrames:*((unsigned int *)v11 + 6)];
  [v10 setDoubleErrorCountsNoFace:*((unsigned int *)v11 + 7)];
  [v10 setDoubleErrorCountsFaceOutOfFOV:*((unsigned int *)v11 + 9)];
  [v10 setDoubleErrorCountsMultipleFaces:*((unsigned int *)v11 + 8)];
  [v10 setDoubleErrorCountsFaceTooClose:*((unsigned int *)v11 + 10)];
  [v10 setDoubleErrorCountsFaceTooFar:*((unsigned int *)v11 + 11)];
  [v10 setDoubleErrorCountsPoseOutRange:*((unsigned int *)v11 + 12)];
  [v10 setDoubleErrorCountsBinCovered:*((unsigned int *)v11 + 13)];
  [v10 setDoubleErrorCountsOccluded:*((unsigned int *)v11 + 14)];
  [v10 setDoubleErrorCountsUpperFaceOccluded:*((unsigned int *)v11 + 15)];
  [v10 setDoubleErrorCountsLowerFaceOccluded:*((unsigned int *)v11 + 16)];
  [v10 setFrameErrorCountsOK:*((unsigned int *)v11 + 17)];
  [v10 setFrameErrorCountsMoreFrames:*((unsigned int *)v11 + 18)];
  [v10 setFrameErrorCountsNoFace:*((unsigned int *)v11 + 19)];
  [v10 setFrameErrorCountsFaceOutOfFOV:*((unsigned int *)v11 + 21)];
  [v10 setFrameErrorCountsMultipleFaces:*((unsigned int *)v11 + 20)];
  [v10 setFrameErrorCountsFaceTooClose:*((unsigned int *)v11 + 22)];
  [v10 setFrameErrorCountsFaceTooFar:*((unsigned int *)v11 + 23)];
  [v10 setFrameErrorCountsPoseOutRange:*((unsigned int *)v11 + 24)];
  [v10 setFrameErrorCountsBinCovered:*((unsigned int *)v11 + 25)];
  [v10 setFrameErrorCountsOccluded:*((unsigned int *)v11 + 26)];
  [v10 setFrameErrorCountsUpperFaceOccluded:*((unsigned int *)v11 + 27)];
  [v10 setFrameErrorCountsLowerFaceOccluded:*((unsigned int *)v11 + 28)];
  [v10 setFrameCountBin00:*((unsigned int *)v11 + 37)];
  [v10 setFrameCountBin01:*((unsigned int *)v11 + 38)];
  [v10 setFrameCountBin02:*((unsigned int *)v11 + 39)];
  [v10 setFrameCountBin10:*((unsigned int *)v11 + 40)];
  [v10 setFrameCountBin11:*((unsigned int *)v11 + 41)];
  [v10 setFrameCountBin12:*((unsigned int *)v11 + 42)];
  [v10 setFrameCountBin20:*((unsigned int *)v11 + 43)];
  [v10 setFrameCountBin21:*((unsigned int *)v11 + 44)];
  [v10 setFrameCountBin22:*((unsigned int *)v11 + 45)];
  [v10 setBioCaptureSequenceCount:*((unsigned int *)v11 + 29)];
  [v10 setAmbientLux:*((unsigned int *)v11 + 30)];
  [v10 setFeatureGenerationError:v11[184]];
  [v10 setEnrollFeatureVectorError:v11[185]];
  [v10 setCameraErr:(char)v11[19]];
  [v10 setEnrollResult:v11[1]];
  [v10 setFaceDistance:*((unsigned __int16 *)v11 + 103)];
  [v10 setSensorTemperature:*(unsigned int *)(v11 + 202)];
  [v10 setEnrollType:v11[236]];
  [v10 setNoseAndMouthOccluded:v11[227]];
  [v10 setEnrolledTemplateCountType0:0];
  [v10 setEnrolledTemplateCountType0:[v10 enrolledTemplateCountType0] + v11[230]];
  [v10 setEnrolledTemplateCountType0:[v10 enrolledTemplateCountType0] + v11[231]];
  [v10 setEnrolledTemplateCountType0:[v10 enrolledTemplateCountType0] + v11[232]];
  uint64_t v12 = [NSNumber numberWithUnsignedChar:v11[230]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setEnrolledTemplateCountType0NoGlasses:v12];

  uint64_t v13 = [NSNumber numberWithUnsignedChar:v11[231]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setEnrolledTemplateCountType0WithGlasses:v13];

  int v14 = [NSNumber numberWithUnsignedChar:v11[232]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setEnrolledTemplateCountType0Unknown:v14];

  [v10 setEnrolledTemplateCountType1:0];
  [v10 setEnrolledTemplateCountType1:[v10 enrolledTemplateCountType1] + v11[233]];
  [v10 setEnrolledTemplateCountType1:[v10 enrolledTemplateCountType1] + v11[234]];
  [v10 setEnrolledTemplateCountType1:[v10 enrolledTemplateCountType1] + v11[235]];
  int v15 = [NSNumber numberWithUnsignedChar:v11[233]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setEnrolledTemplateCountType1NoGlasses:v15];

  int v16 = [NSNumber numberWithUnsignedChar:v11[234]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setEnrolledTemplateCountType1WithGlasses:v16];

  int v17 = [NSNumber numberWithUnsignedChar:v11[235]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setEnrolledTemplateCountType1Unknown:v17];

  [v10 setEnrolledTemplateCountTotal:[v10 enrolledTemplateCountType1] + [v10 enrolledTemplateCountType0]];
  [v10 setEnrolledIdentityCount:[v10 enrolledTemplateCountType0]];
  if (v11[127])
  {
    uint64_t v19 = *((void *)v11 + 16);
    uint64_t v18 = *((void *)v11 + 17);
  }
  else
  {
    uint64_t v19 = -1;
    uint64_t v18 = -1;
  }
  [v10 setRfcSetIndex:v19];
  [v10 setRfcFrameIndex:v18];
  if (v19 == -1) {
    [v10 setHasRfcSetIndex:0];
  }
  if (v18 == -1) {
    [v10 setHasRfcFrameIndex:0];
  }
  BOOL v20 = !*((_DWORD *)v11 + 17) && *((_DWORD *)v11 + 19) && *((_WORD *)v11 + 103) == 0;
  [v10 setFailedNoFace:v20];
  [v10 setDeviceOrientation:a4];
  if (*((_DWORD *)v11 + 36)) {
    -[PearlCoreAnalytics sendPearlAbcEvent:](self, "sendPearlAbcEvent:");
  }
  [(PearlCoreAnalytics *)self checkYogiError:(char)v11[19]];
  uint64_t v21 = [NSNumber numberWithBool:v11[237]];
  [(PearlCoreAnalyticsEnrollEvent *)v9 setGlassesDetected:v21];

  if (![(PearlCoreAnalyticsEvent *)v9 postEvent])
  {
    __int16 v24 = (__osLog ? __osLog : v7);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      uint64_t v26 = "[enrollCAEvent postEvent]";
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2080;
      uint64_t v30 = &unk_222DFB9BF;
      __int16 v31 = 2080;
      int v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v33 = 1024;
      int v34 = 699;
      _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
  }
  [(BiometricKitCoreAnalyticsEvent *)self->_dailyEvent persistData];
LABEL_23:
  if (__osLog) {
    __int16 v22 = __osLog;
  }
  else {
    __int16 v22 = v7;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_222D7E000, v22, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendEnrollEventAnalytics: -> void\n", (uint8_t *)&v25, 2u);
  }
}

- (void)sendPasscodeChallengeEventAnalytics:(id)a3 orientation:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = MEMORY[0x263EF8438];
  if (__osLog) {
    uint64_t v7 = __osLog;
  }
  else {
    uint64_t v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 67109120;
    LODWORD(v15) = v5 != 0;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendPasscodeChallengeEventAnalytics: passChallengeMessage: %d\n", (uint8_t *)&v14, 8u);
  }
  id v8 = objc_alloc_init(PearlCoreAnalyticsPasscodeChallengeEvent);
  v9 = [(PearlCoreAnalyticsEvent *)v8 getAWDMetric];
  if (!v5)
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v6;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v14 = 136316162;
    int v15 = "passChallengeMessage";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    uint64_t v19 = &unk_222DFB9BF;
    __int16 v20 = 2080;
    uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v22 = 1024;
    int v23 = 715;
LABEL_30:
    _os_log_impl(&dword_222D7E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    goto LABEL_9;
  }
  if ((unint64_t)[v5 length] <= 0x31)
  {
    if (__osLog) {
      uint64_t v13 = __osLog;
    }
    else {
      uint64_t v13 = v6;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v14 = 136316162;
    int v15 = "[passChallengeMessage length] >= sizeof(analytics_passchallenge_message_t)";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    uint64_t v19 = &unk_222DFB9BF;
    __int16 v20 = 2080;
    uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v22 = 1024;
    int v23 = 716;
    goto LABEL_30;
  }
  v10 = (unsigned int *)[v5 bytes];
  [v9 setOverallTime:absoluteToMiliseconds()];
  [v9 setPasscodeChallengeResult:*((unsigned __int8 *)v10 + 26)];
  [v9 setPasscodeChallengeTemplateUpdated:*((unsigned char *)v10 + 28) != 0];
  [v9 setAmbientLux:*v10];
  [v9 setSensorTemperature:v10[8]];
  [v9 setFaceDistance:*((unsigned __int16 *)v10 + 18)];
  [v9 setAttentionScore:v10[1]];
  [v9 setHasOcclusion:*((unsigned __int8 *)v10 + 31)];
  [v9 setPpmRequestedBudget:*((unsigned __int8 *)v10 + 46)];
  [v9 setPpmAllocatedBudget:*((unsigned __int8 *)v10 + 47)];
  [v9 setMatchIdentityCount:*((unsigned __int8 *)v10 + 29)];
  [v9 setDeviceOrientation:a4];
  [v9 setMatchType:*((unsigned __int8 *)v10 + 48)];
  v11 = [NSNumber numberWithBool:*((unsigned __int8 *)v10 + 49)];
  [(PearlCoreAnalyticsPasscodeChallengeEvent *)v8 setGlassesDetected:v11];

  if (![(PearlCoreAnalyticsEvent *)v8 postEvent])
  {
    uint64_t v13 = (__osLog ? __osLog : v6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      int v15 = "[passChallengeCAEvent postEvent]";
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      uint64_t v19 = &unk_222DFB9BF;
      __int16 v20 = 2080;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v22 = 1024;
      int v23 = 741;
      goto LABEL_30;
    }
  }
LABEL_9:
  if (__osLog) {
    uint64_t v12 = __osLog;
  }
  else {
    uint64_t v12 = v6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_222D7E000, v12, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendPasscodeChallengeEventAnalytics: -> void\n", (uint8_t *)&v14, 2u);
  }
}

- (void)sendBioLockoutEventAnalytics:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263EF8438];
  if (__osLog) {
    uint64_t v6 = __osLog;
  }
  else {
    uint64_t v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 67109120;
    LODWORD(v12) = v4 != 0;
    _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendPasscodeChallengeEventAnalytics: sendBioLockoutEventAnalytics: %d\n", (uint8_t *)&v11, 8u);
  }
  uint64_t v7 = objc_alloc_init(AWDBiometricKitBioLockoutEvent);
  if (!v4)
  {
    if (__osLog) {
      v10 = __osLog;
    }
    else {
      v10 = v5;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v11 = 136316162;
    uint64_t v12 = "bioLockoutMessage";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_222DFB9BF;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v19 = 1024;
    int v20 = 754;
LABEL_36:
    _os_log_impl(&dword_222D7E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    goto LABEL_10;
  }
  if (![v4 length])
  {
    if (__osLog) {
      v10 = __osLog;
    }
    else {
      v10 = v5;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v11 = 136316162;
    uint64_t v12 = "[bioLockoutMessage length] >= sizeof(analytics_biolockout_message_t)";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_222DFB9BF;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v19 = 1024;
    int v20 = 755;
    goto LABEL_36;
  }
  id v8 = (unsigned __int8 *)[v4 bytes];
  if (!v8)
  {
    if (__osLog) {
      v10 = __osLog;
    }
    else {
      v10 = v5;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v11 = 136316162;
    uint64_t v12 = "bioLockoutEvent";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_222DFB9BF;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v19 = 1024;
    int v20 = 757;
    goto LABEL_36;
  }
  [(AWDBiometricKitBioLockoutEvent *)v7 setBioLockoutReason:*v8];
  if (![(PearlCoreAnalytics *)self postSimpleCoreAnalyticsEvent:@"com.apple.biometrickit.pearl.bioLockoutEvent" fromAWDMetric:v7])
  {
    v10 = (__osLog ? __osLog : v5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136316162;
      uint64_t v12 = "[self postSimpleCoreAnalyticsEvent:pearlCABioLockoutEventName fromAWDMetric:bioLockoutMetric]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = &unk_222DFB9BF;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v19 = 1024;
      int v20 = 761;
      goto LABEL_36;
    }
  }
LABEL_10:
  if (__osLog) {
    v9 = __osLog;
  }
  else {
    v9 = v5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_222D7E000, v9, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendBioLockoutEventAnalytics: -> void\n", (uint8_t *)&v11, 2u);
  }
}

- (void)getDailyUpdateAnalytics
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  if (__osLog) {
    v3 = __osLog;
  }
  else {
    v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics getDailyUpdateAnalytics\n", buf, 2u);
  }
  unint64_t v4 = 0x263EFF000uLL;
  long long v112 = [MEMORY[0x263EFF9A0] dictionary];
  v111 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [(PearlCoreAnalyticsEvent *)self->_dailyEvent getAWDMetric];
  unint64_t v118 = 3667;
  uint64_t v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0xE53uLL, 0xB5DA44E8uLL);
  if (!v6)
  {
    if (__osLog) {
      __int16 v107 = __osLog;
    }
    else {
      __int16 v107 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v121 = "dailyData";
      __int16 v122 = 2048;
      v123 = 0;
      __int16 v124 = 2080;
      v125 = &unk_222DFB9BF;
      __int16 v126 = 2080;
      v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v128 = 1024;
      int v129 = 781;
      _os_log_impl(&dword_222D7E000, v107, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_91;
  }
  uint64_t v7 = v6;
  id analyticsPerformCommandBlock = self->_analyticsPerformCommandBlock;
  if (!analyticsPerformCommandBlock)
  {
    if (__osLog) {
      v102 = __osLog;
    }
    else {
      v102 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_DWORD *)buf = 136316162;
    v121 = "_analyticsPerformCommandBlock";
    __int16 v122 = 2048;
    v123 = 0;
    __int16 v124 = 2080;
    v125 = &unk_222DFB9BF;
    __int16 v126 = 2080;
    v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v128 = 1024;
    int v129 = 783;
    goto LABEL_97;
  }
  int v9 = (*((uint64_t (**)(id, uint64_t, void, void, void, unsigned __int8 *, unint64_t *))analyticsPerformCommandBlock
        + 2))(analyticsPerformCommandBlock, 51, 0, 0, 0, v7, &v118);
  if (v9)
  {
    int v108 = v9;
    if (__osLog) {
      v102 = __osLog;
    }
    else {
      v102 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_DWORD *)buf = 136316162;
    v121 = "err == 0 ";
    __int16 v122 = 2048;
    v123 = (void *)v108;
    __int16 v124 = 2080;
    v125 = &unk_222DFB9BF;
    __int16 v126 = 2080;
    v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v128 = 1024;
    int v129 = 786;
    goto LABEL_97;
  }
  if (v118 <= 0xD9A)
  {
    if (__osLog) {
      v102 = __osLog;
    }
    else {
      v102 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_DWORD *)buf = 136316162;
    v121 = "dailyDataSize >= sizeof(analytics_daily_update_t) + 2 * kAnalyticsMatchTypeCount * sizeof(analytics_template_info_t)";
    __int16 v122 = 2048;
    v123 = 0;
    __int16 v124 = 2080;
    v125 = &unk_222DFB9BF;
    __int16 v126 = 2080;
    v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v128 = 1024;
    int v129 = 787;
    goto LABEL_97;
  }
  [v5 setEnrolledTemplateCountType0:0];
  [v5 setEnrolledTemplateCountType0:[v5 enrolledTemplateCountType0] + v7[3293]];
  [v5 setEnrolledTemplateCountType0:[v5 enrolledTemplateCountType0] + v7[3294]];
  [v5 setEnrolledTemplateCountType0:[v5 enrolledTemplateCountType0] + v7[3295]];
  v10 = [NSNumber numberWithUnsignedChar:v7[3293]];
  [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setEnrolledTemplateCountType0NoGlasses:v10];

  int v11 = [NSNumber numberWithUnsignedChar:v7[3294]];
  [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setEnrolledTemplateCountType0WithGlasses:v11];

  uint64_t v12 = [NSNumber numberWithUnsignedChar:v7[3295]];
  [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setEnrolledTemplateCountType0Unknown:v12];

  [v5 setEnrolledTemplateCountType1:0];
  [v5 setEnrolledTemplateCountType1:[v5 enrolledTemplateCountType1] + v7[3296]];
  [v5 setEnrolledTemplateCountType1:[v5 enrolledTemplateCountType1] + v7[3297]];
  [v5 setEnrolledTemplateCountType1:[v5 enrolledTemplateCountType1] + v7[3298]];
  __int16 v13 = [NSNumber numberWithUnsignedChar:v7[3296]];
  [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setEnrolledTemplateCountType1NoGlasses:v13];

  uint64_t v14 = [NSNumber numberWithUnsignedChar:v7[3297]];
  [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setEnrolledTemplateCountType1WithGlasses:v14];

  int v110 = v7;
  __int16 v15 = [NSNumber numberWithUnsignedChar:v7[3298]];
  __int16 v109 = self;
  [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setEnrolledTemplateCountType1Unknown:v15];

  [v5 setEnrolledTemplateCountTotal:[v5 enrolledTemplateCountType1]+[v5 enrolledTemplateCountType0]];
  [v5 setEnrolledIdentityCount:0];
  if ([v5 enrolledTemplateCountTotal])
  {
    unint64_t v16 = 0;
    __int16 v17 = v7 + 3299;
    while (*v17)
    {
      __int16 v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v17 + 1)];
      __int16 v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v17 + 5];
      [v5 addBaseTemplateFeatureCount:*(unsigned int *)(v17 + 21)];
      [v5 addOnlineUpdateTemplateFeatureCount:*(unsigned int *)(v17 + 25)];
      [v5 addPasscodeUpdateTemplateFeatureCount:*(unsigned int *)(v17 + 29)];
      int v20 = [v111 objectForKey:v18];
      uint64_t v21 = [v112 objectForKey:v18];
      __int16 v22 = (void *)v21;
      if (v20) {
        BOOL v23 = v21 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23)
      {
        if (__osLog) {
          uint64_t v24 = __osLog;
        }
        else {
          uint64_t v24 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v121 = v18;
          _os_log_impl(&dword_222D7E000, v24, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics getDailyUpdateAnalytics: templateInfo: new userID: %@\n", buf, 0xCu);
        }
        uint64_t v25 = [*(id *)(v4 + 2464) dictionary];

        [v111 setObject:v25 forKey:v18];
        uint64_t v26 = [MEMORY[0x263EFF980] array];

        [v112 setObject:v26 forKey:v18];
        __int16 v22 = (void *)v26;
        int v20 = (void *)v25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          uint64_t v104 = __osLog;
        }
        else {
          uint64_t v104 = MEMORY[0x263EF8438];
        }
        uint64_t v7 = v110;
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v121 = "[userIdentityIDInfoDict isKindOfClass:[NSMutableDictionary class]]";
          __int16 v122 = 2048;
          v123 = 0;
          __int16 v124 = 2080;
          v125 = &unk_222DFB9BF;
          __int16 v126 = 2080;
          v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
          __int16 v128 = 1024;
          int v129 = 836;
          goto LABEL_108;
        }
LABEL_122:

        goto LABEL_90;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          uint64_t v104 = __osLog;
        }
        else {
          uint64_t v104 = MEMORY[0x263EF8438];
        }
        uint64_t v7 = v110;
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v121 = "[userIdentityInfoArray isKindOfClass:[NSMutableArray class]]";
          __int16 v122 = 2048;
          v123 = 0;
          __int16 v124 = 2080;
          v125 = &unk_222DFB9BF;
          __int16 v126 = 2080;
          v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
          __int16 v128 = 1024;
          int v129 = 837;
LABEL_108:
          _os_log_impl(&dword_222D7E000, v104, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_122;
      }
      __int16 v27 = [v20 objectForKey:v19];
      if (!v27) {
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          v106 = __osLog;
        }
        else {
          v106 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v121 = "!identityUUIDIndex || [identityUUIDIndex isKindOfClass:[NSNumber class]]";
          __int16 v122 = 2048;
          v123 = 0;
          __int16 v124 = 2080;
          v125 = &unk_222DFB9BF;
          __int16 v126 = 2080;
          v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
          __int16 v128 = 1024;
          int v129 = 841;
          _os_log_impl(&dword_222D7E000, v106, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        goto LABEL_121;
      }
      uint64_t v28 = [v22 objectAtIndex:[v27 unsignedIntValue]];
      if (v28)
      {
        __int16 v29 = (void *)v28;
        uint64_t v30 = v27;
      }
      else
      {
LABEL_30:
        [v5 setEnrolledIdentityCount:[v5 enrolledIdentityCount] + 1];
        uint64_t v30 = [NSNumber numberWithUnsignedInteger:[v22 count]];

        __int16 v29 = [MEMORY[0x263EFF980] array];
        [v22 addObject:v29];
        [v20 setObject:v30 forKey:v19];
        if (__osLog) {
          __int16 v31 = __osLog;
        }
        else {
          __int16 v31 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v121 = (const char *)v19;
          __int16 v122 = 2112;
          v123 = v30;
          _os_log_impl(&dword_222D7E000, v31, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics getDailyUpdateAnalytics: templateInfo: new identityUUID: %@ identityUUIDIndex: %@\n", buf, 0x16u);
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          __int16 v105 = __osLog;
        }
        else {
          __int16 v105 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v121 = "[identityTemplateArray isKindOfClass:[NSMutableArray class]]";
          __int16 v122 = 2048;
          v123 = 0;
          __int16 v124 = 2080;
          v125 = &unk_222DFB9BF;
          __int16 v126 = 2080;
          v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
          __int16 v128 = 1024;
          int v129 = 856;
          _os_log_impl(&dword_222D7E000, v105, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

LABEL_121:
        uint64_t v7 = v110;
        goto LABEL_122;
      }
      int v32 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 length:46];
      [v29 addObject:v32];

      ++v16;
      v17 += 46;
      unint64_t v4 = 0x263EFF000;
      if (v16 >= [v5 enrolledTemplateCountTotal]) {
        goto LABEL_37;
      }
    }
    if (__osLog) {
      v102 = __osLog;
    }
    else {
      v102 = MEMORY[0x263EF8438];
    }
    uint64_t v7 = v110;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_DWORD *)buf = 136316162;
    v121 = "dailyData->templateInfo[i].valid";
    __int16 v122 = 2048;
    v123 = 0;
    __int16 v124 = 2080;
    v125 = &unk_222DFB9BF;
    __int16 v126 = 2080;
    v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
    __int16 v128 = 1024;
    int v129 = 812;
LABEL_97:
    _os_log_impl(&dword_222D7E000, v102, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_90;
  }
LABEL_37:
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v33 = v112;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v114 objects:v119 count:16];
  if (!v34) {
    goto LABEL_48;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)v115;
  char v37 = 1;
  id v113 = v33;
  while (2)
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      if (*(void *)v115 != v36) {
        objc_enumerationMutation(v33);
      }
      id v39 = [v33 objectForKey:*(void *)(*((void *)&v114 + 1) + 8 * i)];
      if (!v39)
      {
        if (__osLog) {
          __int16 v103 = __osLog;
        }
        else {
          __int16 v103 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_DWORD *)buf = 136316162;
        v121 = "userIdentityInfoArray";
        __int16 v122 = 2048;
        v123 = 0;
        __int16 v124 = 2080;
        v125 = &unk_222DFB9BF;
        __int16 v126 = 2080;
        v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
        __int16 v128 = 1024;
        int v129 = 866;
        goto LABEL_88;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog) {
          __int16 v103 = __osLog;
        }
        else {
          __int16 v103 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_DWORD *)buf = 136316162;
        v121 = "[userIdentityInfoArray isKindOfClass:[NSMutableArray class]]";
        __int16 v122 = 2048;
        v123 = 0;
        __int16 v124 = 2080;
        v125 = &unk_222DFB9BF;
        __int16 v126 = 2080;
        v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
        __int16 v128 = 1024;
        int v129 = 867;
LABEL_88:
        _os_log_impl(&dword_222D7E000, v103, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_89:

        uint64_t v7 = v110;
        goto LABEL_90;
      }
      uint64_t v40 = [[PearlCoreAnalyticsDailyTemplateMatchCountsEvent alloc] initWithTemplateInfo:v39];
      uint64_t v41 = v40;
      if (v37)
      {
        uint64_t v42 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v40 identity0MatchingTemplateCountType0];
        [v5 setMatchingTemplateCountType0Identity0:[v42 unsignedIntValue]];

        v43 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0BaseTemplateFeatureCountType0];
        [v5 setBaseTemplateFeatureCountType0Identity0:[v43 unsignedIntValue]];

        v44 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0OnlineUpdateTemplateFeatureCountType0];
        [v5 setOnlineUpdateTemplateFeatureCountType0Identity0:[v44 unsignedIntValue]];

        double v45 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0PasscodeUpdateTemplateFeatureCountType0];
        [v5 setPasscodeUpdateTemplateFeatureCountType0Identity0:[v45 unsignedIntValue]];

        v46 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0MatchingTemplateCountType1];
        [v5 setMatchingTemplateCountType1Identity0:[v46 unsignedIntValue]];

        v47 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0BaseTemplateFeatureCountType1];
        [v5 setBaseTemplateFeatureCountType1Identity0:[v47 unsignedIntValue]];

        v48 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0OnlineUpdateTemplateFeatureCountType1];
        [v5 setOnlineUpdateTemplateFeatureCountType1Identity0:[v48 unsignedIntValue]];

        v49 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0PasscodeUpdateTemplateFeatureCountType1];
        [v5 setPasscodeUpdateTemplateFeatureCountType1Identity0:[v49 unsignedIntValue]];

        v50 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0MatchingTemplateCountType0];
        int v51 = [v50 unsignedIntValue];
        [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity0MatchingTemplateCountType1];
        uint64_t v52 = v35;
        v54 = uint64_t v53 = v36;
        [v5 addMatchingIdentityCounts:[v54 unsignedIntValue] + v51];

        v55 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1MatchingTemplateCountType0];
        [v5 setMatchingTemplateCountType0Identity1:[v55 unsignedIntValue]];

        v56 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1BaseTemplateFeatureCountType0];
        [v5 setBaseTemplateFeatureCountType0Identity1:[v56 unsignedIntValue]];

        v57 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1OnlineUpdateTemplateFeatureCountType0];
        [v5 setOnlineUpdateTemplateFeatureCountType0Identity1:[v57 unsignedIntValue]];

        v58 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1PasscodeUpdateTemplateFeatureCountType0];
        [v5 setPasscodeUpdateTemplateFeatureCountType0Identity1:[v58 unsignedIntValue]];

        v59 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1MatchingTemplateCountType1];
        [v5 setMatchingTemplateCountType1Identity1:[v59 unsignedIntValue]];

        v60 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1BaseTemplateFeatureCountType1];
        [v5 setBaseTemplateFeatureCountType1Identity1:[v60 unsignedIntValue]];

        v61 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1OnlineUpdateTemplateFeatureCountType1];
        [v5 setOnlineUpdateTemplateFeatureCountType1Identity1:[v61 unsignedIntValue]];

        v62 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1PasscodeUpdateTemplateFeatureCountType1];
        [v5 setPasscodeUpdateTemplateFeatureCountType1Identity1:[v62 unsignedIntValue]];

        v63 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1MatchingTemplateCountType0];
        int v64 = [v63 unsignedIntValue];
        v65 = [(PearlCoreAnalyticsDailyTemplateMatchCountsEvent *)v41 identity1MatchingTemplateCountType1];
        [v5 addMatchingIdentityCounts:objc_msgSend(v65, "unsignedIntValue") + v64];

        uint64_t v36 = v53;
        uint64_t v35 = v52;
        id v33 = v113;
      }
      [(PearlCoreAnalyticsEvent *)v41 postEvent];

      char v37 = 0;
    }
    uint64_t v35 = [v33 countByEnumeratingWithState:&v114 objects:v119 count:16];
    char v37 = 0;
    if (v35) {
      continue;
    }
    break;
  }
LABEL_48:
  v66 = v110;

  [v5 setUnlockEnabled:*v110 != 0];
  [v5 setApplePayEnabled:v110[4] != 0];
  [v5 setAttentionDetectionEnabled:v110[3] != 0];
  [v5 setCameraInterlock:v110[6]];
  [v5 setType1MatchEnabled:v110[5] != 0];
  [v5 setMatchingCountDouble01:*((unsigned int *)v110 + 2)];
  [v5 setMatchingCountDouble02:*((unsigned int *)v110 + 3)];
  [v5 setMatchingCountDouble03:*((unsigned int *)v110 + 4)];
  [v5 setMatchingCountDouble04:*((unsigned int *)v110 + 5)];
  [v5 setStaticUnlockCount:(*((_DWORD *)v66 + 9) + *((_DWORD *)v66 + 6))];
  [v5 setOnlineUnlockCount:(*((_DWORD *)v66 + 10) + *((_DWORD *)v66 + 7))];
  [v5 setShortTermUnlockCount:(*((_DWORD *)v66 + 11) + *((_DWORD *)v66 + 8))];
  [v5 setStaticUnlockCountType0:*((unsigned int *)v110 + 6)];
  [v5 setOnlineUnlockCountType0:*((unsigned int *)v110 + 7)];
  [v5 setShortTermUnlockCountType0:*((unsigned int *)v110 + 8)];
  [v5 setStaticUnlockCountType1:*((unsigned int *)v110 + 9)];
  [v5 setOnlineUnlockCountType1:*((unsigned int *)v110 + 10)];
  [v5 setShortTermUnlockCountType1:*((unsigned int *)v110 + 11)];
  for (uint64_t j = 0; j != 32; j += 4)
    [v5 addMatchingTemplateTypeCounts:*(unsigned int *)&v110[j + 3120]];
  uint64_t v68 = 0;
  char v69 = 1;
  do
  {
    uint64_t v70 = 0;
    char v71 = v69;
    char v72 = 1;
    uint64_t v73 = (uint64_t)&v110[4 * v68 + 48];
    do
    {
      uint64_t v74 = 0;
      char v75 = v72;
      uint64_t v76 = v73 + 8 * v70;
      do
      {
        uint64_t v77 = 0;
        uint64_t v78 = v76;
        do
        {
          for (uint64_t k = 0; k != 3072; k += 384)
            [v5 addMatchingBinCounts:*(unsigned int *)(v78 + k)];
          ++v77;
          v78 += 64;
        }
        while (v77 != 6);
        ++v74;
        v76 += 16;
      }
      while (v74 != 4);
      char v72 = 0;
      uint64_t v70 = 1;
    }
    while ((v75 & 1) != 0);
    char v69 = 0;
    uint64_t v68 = 1;
  }
  while ((v71 & 1) != 0);
  uint64_t v80 = 0;
  uint64_t v7 = v110;
  do
  {
    [v5 addBioCheckInfo:*(unsigned int *)&v110[v80 + 3152]];
    v80 += 4;
  }
  while (v80 != 64);
  for (uint64_t m = 0; m != 48; m += 4)
    [v5 addBioCheckResult:*(unsigned int *)&v110[m + 3216]];
  for (uint64_t n = 0; n != 16; n += 4)
    [v5 addPasscodeUpdate:*(unsigned int *)&v110[n + 3264]];
  if (v109->_isInternalBuild) {
    [v5 setCombinedSequenceEnabled:v110[3280]];
  }
  [v5 setBioLockoutTime:*(void *)(v110 + 3281)];
  [v5 setBioLockoutCount:*(unsigned int *)(v110 + 3289)];
  if (v109->_isInternalBuild) {
    [v5 setAutoRetryEnabled:v110[7]];
  }
  uint64_t v83 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent yogiErrorDate];

  if (v83)
  {
    id v84 = objc_alloc(MEMORY[0x263EFF8F0]);
    v85 = (void *)[v84 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    v86 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent yogiErrorDate];
    int v87 = [MEMORY[0x263EFF910] date];
    int v88 = [v85 components:16 fromDate:v86 toDate:v87 options:0];

    uint64_t v89 = [v88 day];
    uint64_t v83 = (v89 + 1) & ~(v89 >> 63);
  }
  [v5 setYogiErrorDays:v83];
  int v90 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent totalMatchAttempts];
  [v5 setTotalMatchAttempts:[v90 unsignedIntValue]];

  BOOL v91 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent totalMatchAttemptsFailed];
  [v5 setTotalMatchAttemptsFailed:[v91 unsignedIntValue]];

  v92 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent totalMatchAttemptsSuccessful];
  [v5 setTotalMatchAttemptsSuccessful:[v92 unsignedIntValue]];

  id v93 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent totalMatchAttemptsFaceDetected];
  [v5 setTotalMatchAttemptsFaceDetected:[v93 unsignedIntValue]];

  v94 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsType0];
  [v5 setMatchAttemptsType0:[v94 unsignedIntValue]];

  v95 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsFailedType0];
  [v5 setMatchAttemptsFailedType0:[v95 unsignedIntValue]];

  long long v96 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsSuccessfulType0];
  [v5 setMatchAttemptsSuccessfulType0:[v96 unsignedIntValue]];

  long long v97 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsFaceDetectedType0];
  [v5 setMatchAttemptsFaceDetectedType0:[v97 unsignedIntValue]];

  long long v98 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsType1];
  [v5 setMatchAttemptsType1:[v98 unsignedIntValue]];

  long long v99 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsFailedType1];
  [v5 setMatchAttemptsFailedType1:[v99 unsignedIntValue]];

  v100 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsSuccessfulType1];
  [v5 setMatchAttemptsSuccessfulType1:[v100 unsignedIntValue]];

  v101 = [(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent matchAttemptsFaceDetectedType1];
  [v5 setMatchAttemptsFaceDetectedType1:[v101 unsignedIntValue]];

  if (![(PearlCoreAnalyticsDailyUpdateEvent *)v109->_dailyEvent postEvent])
  {
    v102 = (__osLog ? __osLog : MEMORY[0x263EF8438]);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v121 = "[_dailyEvent postEvent]";
      __int16 v122 = 2048;
      v123 = 0;
      __int16 v124 = 2080;
      v125 = &unk_222DFB9BF;
      __int16 v126 = 2080;
      v127 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v128 = 1024;
      int v129 = 1010;
      goto LABEL_97;
    }
  }
LABEL_90:
  free(v7);
LABEL_91:
}

- (void)sendPearlAbcEvent:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!-[BiometricAutoBugCapture sendAutoBugCaptureEvent:](self->_pearlAbc, "sendAutoBugCaptureEvent:"))
  {
    if (__osLog) {
      unint64_t v4 = __osLog;
    }
    else {
      unint64_t v4 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      unint64_t v6 = a3;
      _os_log_impl(&dword_222D7E000, v4, OS_LOG_TYPE_ERROR, "Failed to send auto bug capture event: %llu\n", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (int)sequenceTypeToCaptureMethod:(unsigned __int8)a3 forSequence:(unsigned __int8)a4
{
  if (a4 == 2) {
    int v4 = 3;
  }
  else {
    int v4 = 2;
  }
  if (a3 == 3) {
    return v4;
  }
  else {
    return a3 == 2;
  }
}

- (void)checkYogiError:(int)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (__osLog) {
    int v5 = __osLog;
  }
  else {
    int v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    dailyEvent = self->_dailyEvent;
    uint64_t v7 = v5;
    id v8 = [(PearlCoreAnalyticsDailyUpdateEvent *)dailyEvent yogiErrorDate];
    v11[0] = 67109378;
    v11[1] = a3;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics checkYogiError cameraErr: %d _yogiErrorDate: %@\n", (uint8_t *)v11, 0x12u);
  }
  int v9 = [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent yogiErrorDate];

  if (a3 == 1)
  {
    if (!v9)
    {
      v10 = [MEMORY[0x263EFF910] date];
      [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setYogiErrorDate:v10];

      [(BiometricKitCoreAnalyticsEvent *)self->_dailyEvent persistData];
    }
  }
  else if (v9)
  {
    [(PearlCoreAnalyticsDailyUpdateEvent *)self->_dailyEvent setYogiErrorDate:0];
  }
}

- (BOOL)postSimpleCoreAnalyticsEvent:(id)a3 fromAWDMetric:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (__osLog) {
    uint64_t v7 = __osLog;
  }
  else {
    uint64_t v7 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2048;
    id v14 = v6;
    _os_log_impl(&dword_222D7E000, v7, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics postSimpleCoreAnalyticsEvent eventName: %@ awdMetric: %p\n", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [[PearlCoreAnalyticsEvent alloc] initWithName:v5 awdMetric:v6];
  BOOL v9 = [(PearlCoreAnalyticsEvent *)v8 postEvent];

  return v9;
}

+ (void)sendDisplayPearlGlassesBannerNotificationEvent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = MEMORY[0x263EF8438];
  if (__osLog) {
    v3 = __osLog;
  }
  else {
    v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendDisplayPearlGlassesBannerNotificationEvent\n", (uint8_t *)&v7, 2u);
  }
  int v4 = [[PearlCoreAnalyticsGlassesBannerEvent alloc] initWithNotification];
  BOOL v5 = [(PearlCoreAnalyticsEvent *)v4 postEvent];

  if (!v5)
  {
    if (__osLog) {
      id v6 = __osLog;
    }
    else {
      id v6 = v2;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      id v8 = "[[[PearlCoreAnalyticsGlassesBannerEvent alloc] initWithNotification] postEvent]";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      id v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v15 = 1024;
      int v16 = 1081;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
}

+ (void)sendEnrollPearlGlassesBannerNotificationEvent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = MEMORY[0x263EF8438];
  if (__osLog) {
    v3 = __osLog;
  }
  else {
    v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "PearlCoreAnalytics sendEnrollPearlGlassesBannerNotificationEvent\n", (uint8_t *)&v7, 2u);
  }
  int v4 = [[PearlCoreAnalyticsGlassesBannerEvent alloc] initWithEnrollment];
  BOOL v5 = [(PearlCoreAnalyticsEvent *)v4 postEvent];

  if (!v5)
  {
    if (__osLog) {
      id v6 = __osLog;
    }
    else {
      id v6 = v2;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      id v8 = "[[[PearlCoreAnalyticsGlassesBannerEvent alloc] initWithEnrollment] postEvent]";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      id v12 = &unk_222DFB9BF;
      __int16 v13 = 2080;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl/PearlCoreAnalytics/PearlCoreAnalytics.m";
      __int16 v15 = 1024;
      int v16 = 1088;
      _os_log_impl(&dword_222D7E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
}

- (id)analyticsPerformCommandBlock
{
  return self->_analyticsPerformCommandBlock;
}

- (void)setAnalyticsPerformCommandBlock:(id)a3
{
}

- (BiometricAutoBugCapture)pearlAbc
{
  return self->_pearlAbc;
}

- (void)setPearlAbc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlAbc, 0);
  objc_storeStrong(&self->_analyticsPerformCommandBlock, 0);
  objc_storeStrong((id *)&self->_dailyUpdateTimer, 0);

  objc_storeStrong((id *)&self->_dailyEvent, 0);
}

@end