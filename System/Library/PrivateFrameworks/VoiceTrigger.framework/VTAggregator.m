@interface VTAggregator
+ (id)sharedAggregator;
- (VTAggregator)init;
- (id)_makeKey:(id)a3;
- (id)_makeKeyWithLanguageAndAssetString:(id)a3;
- (id)_makeKeyWithLanguageCode:(id)a3;
- (void)_addValueForScalarKey:(id)a3 withValue:(int64_t)a4;
- (void)_logUptime;
- (void)_pushValueForDistributionKey:(id)a3 withValue:(double)a4;
- (void)cumulativeUptime:(id *)a3 cumulativeDowntime:(id *)a4 reset:(BOOL)a5;
- (void)logActivation;
- (void)logFalseWakeUp:(BOOL)a3;
- (void)logProfileUpdateNumDeletedUttsStrategy:(int)a3;
- (void)logProfileUpdateNumDiscardedUttsPHS:(int)a3;
- (void)logProfileUpdateNumPrunedUttsPHS:(int)a3;
- (void)logProfileUpdateNumRetainedUttsPHS:(int)a3;
- (void)logProfileUpdateScoreMSE:(double)a3;
- (void)logProfileUpdateUtt:(id)a3 withScore:(double)a4;
- (void)logRecognizerTimedOut;
- (void)logSecondPassResult:(BOOL)a3;
- (void)logTdPsrExtraAudioSamplesProcessed:(unint64_t)a3;
- (void)logTdPsrFailedDuringSATDetection;
- (void)logTdPsrFailedDuringSATRetraining;
- (void)logTdPsrSATDetectionTimedOut;
- (void)logTdPsrSATDetectionWaitTimeMs:(double)a3;
- (void)logTdPsrSATRetrainingTimedOut;
- (void)logTdPsrSATRetrainingWaitTimeMs:(double)a3;
- (void)logTimeVoiceTriggerTransitionsToState:(unint64_t)a3;
- (void)logVoiceProfilePruningFailureWithReasonCode:(unint64_t)a3;
- (void)logZeroRunAudio:(int)a3;
- (void)setAssetString:(id)a3;
- (void)setLanguageCode:(id)a3;
@end

@implementation VTAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetString, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_pushValueForDistributionKey:(id)a3 withValue:(double)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v5;
    __int16 v13 = 2050;
    double v14 = a4;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Pushing value for distribution key %{public}@ : %{public}lf", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__VTAggregator__pushValueForDistributionKey_withValue___block_invoke;
  v8[3] = &unk_264325BA8;
  id v9 = v5;
  double v10 = a4;
  id v7 = v5;
  softLink_AnalyticsSendEventLazy(v8);
}

id __55__VTAggregator__pushValueForDistributionKey_withValue___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)_addValueForScalarKey:(id)a3 withValue:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v5;
    __int16 v13 = 2050;
    int64_t v14 = a4;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Adding value for scalar key %{public}@ : %{public}lld", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__VTAggregator__addValueForScalarKey_withValue___block_invoke;
  v8[3] = &unk_264325BA8;
  id v9 = v5;
  int64_t v10 = a4;
  id v7 = v5;
  softLink_AnalyticsSendEventLazy(v8);
}

id __48__VTAggregator__addValueForScalarKey_withValue___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  v2 = [NSNumber numberWithLongLong:v1];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)_makeKeyWithLanguageAndAssetString:(id)a3
{
  uint64_t v4 = NSString;
  uint64_t v5 = [(VTAggregator *)self _makeKey:a3];
  v6 = [v4 stringWithFormat:@"%@.%@.%@", v5, self->_languageCode, self->_assetString];

  return v6;
}

- (id)_makeKeyWithLanguageCode:(id)a3
{
  uint64_t v4 = NSString;
  uint64_t v5 = [(VTAggregator *)self _makeKey:a3];
  v6 = [v4 stringWithFormat:@"%@.%@", v5, self->_languageCode];

  return v6;
}

- (id)_makeKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.voicetrigger", a3];
}

- (void)logVoiceProfilePruningFailureWithReasonCode:(unint64_t)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"profileUpdateFailCode"];
  [(VTAggregator *)self _addValueForScalarKey:v5 withValue:a3];
}

- (void)logTdPsrExtraAudioSamplesProcessed:(unint64_t)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrExtraAudioSamplesProcessed"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:(double)a3];
}

- (void)logTdPsrSATRetrainingTimedOut
{
  id v3 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrSATRetrainingTimedOut"];
  [(VTAggregator *)self _addValueForScalarKey:v3 withValue:1];
}

- (void)logTdPsrFailedDuringSATRetraining
{
  id v3 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrFailedDuringSATRetraining"];
  [(VTAggregator *)self _addValueForScalarKey:v3 withValue:1];
}

- (void)logTdPsrSATRetrainingWaitTimeMs:(double)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrSATRetrainingWaitTimeMs"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:a3];
}

- (void)logTdPsrSATDetectionTimedOut
{
  id v3 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrSATDetectionTimedOut"];
  [(VTAggregator *)self _addValueForScalarKey:v3 withValue:1];
}

- (void)logTdPsrFailedDuringSATDetection
{
  id v3 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrFailedDuringSATDetection"];
  [(VTAggregator *)self _addValueForScalarKey:v3 withValue:1];
}

- (void)logTdPsrSATDetectionWaitTimeMs:(double)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"TdPsrSATDetectionTimeMs"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:a3];
}

- (void)logProfileUpdateScoreMSE:(double)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"profileUpdateScoreMSE"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:a3];
}

- (void)logProfileUpdateNumRetainedUttsPHS:(int)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"profileUpdateNumRetainedUttsPHS"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:(double)a3];
}

- (void)logProfileUpdateNumDiscardedUttsPHS:(int)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"profileUpdateNumDiscardedUttsPHS"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:(double)a3];
}

- (void)logProfileUpdateNumPrunedUttsPHS:(int)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"profileUpdateNumPrunedUttsPHS"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:(double)a3];
}

- (void)logProfileUpdateNumDeletedUttsStrategy:(int)a3
{
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"profileUpdateNumDeletedUttsStrategy"];
  [(VTAggregator *)self _pushValueForDistributionKey:v5 withValue:(double)a3];
}

- (void)logProfileUpdateUtt:(id)a3 withScore:(double)a4
{
  id v6 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:a3];
  [(VTAggregator *)self _pushValueForDistributionKey:v6 withValue:a4];
}

- (void)logRecognizerTimedOut
{
  id v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "::: logging recognizer timeout in aggd", v5, 2u);
  }
  uint64_t v4 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"recognizerTimeOut"];
  [(VTAggregator *)self _addValueForScalarKey:v4 withValue:1];
}

- (void)logZeroRunAudio:(int)a3
{
  uint64_t v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "::: logging corrupt audio length in aggd", v6, 2u);
  }
  id v5 = [(VTAggregator *)self _makeKeyWithLanguageCode:@"zeroRunAudio"];
  [(VTAggregator *)self _addValueForScalarKey:v5 withValue:1];
}

- (void)logTimeVoiceTriggerTransitionsToState:(unint64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __54__VTAggregator_logTimeVoiceTriggerTransitionsToState___block_invoke;
  v6[3] = &unk_264325B80;
  v7[1] = (id)a3;
  v6[4] = self;
  objc_copyWeak(v7, &location);
  dispatch_async(queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __54__VTAggregator_logTimeVoiceTriggerTransitionsToState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(void *)(v2 + 8))
  {
    if (v1)
    {
      if (v1 == 1)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained _logUptime];

        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64));
      }
    }
    else
    {
      dispatch_suspend(*(dispatch_object_t *)(v2 + 64));
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 _logUptime];
    }
    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 48);
  }
}

- (void)_logUptime
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  +[VTUtilities systemUpTime];
  double v4 = v3;
  double lastAggTime = self->_lastAggTime;
  if (lastAggTime > 0.0)
  {
    double v6 = v4 - lastAggTime;
    if (self->_currentState == 1)
    {
      self->_cumulativeUptime = v6 + self->_cumulativeUptime;
      id v7 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"uptimeSeconds"];
      [(VTAggregator *)self _pushValueForDistributionKey:v7 withValue:v6];

      v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134349056;
        double v12 = v6;
        id v9 = "::: VoiceTrigger has been ACTIVE for an interval of %{public}5.3f seconds.";
LABEL_7:
        _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      self->_cumulativeDowntime = v6 + self->_cumulativeDowntime;
      int64_t v10 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"downtimeSeconds"];
      [(VTAggregator *)self _pushValueForDistributionKey:v10 withValue:v6];

      v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134349056;
        double v12 = v6;
        id v9 = "::: VoiceTrigger has been INACTIVE for an interval of %{public}5.3f seconds.";
        goto LABEL_7;
      }
    }
  }
  self->_double lastAggTime = v4;
}

- (void)logFalseWakeUp:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unint64_t v4 = self->_numFalseWakeUp + 1;
    self->_unint64_t numFalseWakeUp = v4;
    id v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v19 = v4;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "::: incrementing false wakeup to %{public}llu", buf, 0xCu);
    }
  }
  +[VTUtilities systemUpTime];
  double v7 = v6;
  double lastAggTimeFalseWakeUp = self->_lastAggTimeFalseWakeUp;
  if (lastAggTimeFalseWakeUp <= 0.0)
  {
    self->_double lastAggTimeFalseWakeUp = v7;
  }
  else
  {
    unint64_t numFalseWakeUp = self->_numFalseWakeUp;
    if (numFalseWakeUp)
    {
      double v10 = v7 - lastAggTimeFalseWakeUp;
      int v11 = VTLogContextFacilityVoiceTrigger;
      BOOL v12 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
      if (v10 <= 0.0)
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349312;
          unint64_t v19 = numFalseWakeUp;
          __int16 v20 = 2050;
          double v21 = v10;
          _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "::: accumulated false wakeup count is %{public}llu so far, not reporting yet because it has been only %{public}.2f seconds since last report", buf, 0x16u);
        }
      }
      else
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349312;
          unint64_t v19 = numFalseWakeUp;
          __int16 v20 = 2050;
          double v21 = v10;
          _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "::: logging %{public}llu false wakeup during %{public}.2f seconds", buf, 0x16u);
        }
        uint64_t v13 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"falseWakeUp"];
        [(VTAggregator *)self _addValueForScalarKey:v13 withValue:self->_numFalseWakeUp];

        int64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numFalseWakeUp, @"numFalseWakeUp");
        v16[1] = @"secondsSinceLastReport";
        v17[0] = v14;
        uint64_t v15 = [NSNumber numberWithDouble:v10];
        v17[1] = v15;
        [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
        PLLogRegisteredEvent();

        self->_double lastAggTimeFalseWakeUp = v7;
        self->_unint64_t numFalseWakeUp = 0;
      }
    }
  }
}

- (void)logSecondPassResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = VTLogContextFacilityVoiceTrigger;
  BOOL v6 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "::: incrementing 2nd-pass accept in aggd", buf, 2u);
    }
    double v7 = @"secondPassAccepted";
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21844F000, v5, OS_LOG_TYPE_DEFAULT, "::: incrementing 2nd-pass reject in aggd", v9, 2u);
    }
    double v7 = @"secondPassRejected";
  }
  v8 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:v7];
  [(VTAggregator *)self _addValueForScalarKey:v8 withValue:1];
}

- (void)logActivation
{
  BOOL v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "::: logging VT activation in aggd", v5, 2u);
  }
  unint64_t v4 = [(VTAggregator *)self _makeKeyWithLanguageAndAssetString:@"activation"];
  [(VTAggregator *)self _addValueForScalarKey:v4 withValue:1];
}

- (void)setAssetString:(id)a3
{
  id v5 = a3;
  assetString = self->_assetString;
  p_assetString = &self->_assetString;
  id v8 = v5;
  if (!-[NSString isEqualToString:](assetString, "isEqualToString:")) {
    objc_storeStrong((id *)p_assetString, a3);
  }
}

- (void)setLanguageCode:(id)a3
{
  id v5 = a3;
  languageCode = self->_languageCode;
  p_languageCode = &self->_languageCode;
  id v8 = v5;
  if (!-[NSString isEqualToString:](languageCode, "isEqualToString:")) {
    objc_storeStrong((id *)p_languageCode, a3);
  }
}

- (void)cumulativeUptime:(id *)a3 cumulativeDowntime:(id *)a4 reset:(BOOL)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __58__VTAggregator_cumulativeUptime_cumulativeDowntime_reset___block_invoke;
  v6[3] = &unk_264325B58;
  v6[4] = self;
  void v6[5] = a4;
  v6[6] = a3;
  BOOL v7 = a5;
  dispatch_sync(queue, v6);
}

id __58__VTAggregator_cumulativeUptime_cumulativeDowntime_reset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _logUptime];
  **(void **)(a1 + 40) = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 32)];
  id result = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 24)];
  **(void **)(a1 + 48) = result;
  if (*(unsigned char *)(a1 + 56))
  {
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
  return result;
}

- (VTAggregator)init
{
  v18.receiver = self;
  v18.super_class = (Class)VTAggregator;
  uint64_t v2 = [(VTAggregator *)&v18 init];
  BOOL v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    unint64_t v4 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = @"xx_XX";

    id v5 = (void *)*((void *)v3 + 10);
    *((void *)v3 + 10) = @"unknown";

    BOOL v6 = AFPreferencesMobileUserSessionLanguage();
    [v3 setLanguageCode:v6];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.voicetrigger.aggregator", 0);
    id v8 = (void *)*((void *)v3 + 7);
    *((void *)v3 + 7) = v7;

    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v3 + 7));
    double v10 = (void *)*((void *)v3 + 8);
    *((void *)v3 + 8) = v9;

    int v11 = *((void *)v3 + 8);
    dispatch_time_t v12 = dispatch_time(0, 900000000000);
    dispatch_source_set_timer(v11, v12, 0xD18C2E2800uLL, 0);
    objc_initWeak(&location, v3);
    uint64_t v13 = *((void *)v3 + 8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __20__VTAggregator_init__block_invoke;
    v15[3] = &unk_264325CD0;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (VTAggregator *)v3;
}

void __20__VTAggregator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _logUptime];
}

+ (id)sharedAggregator
{
  if (sharedAggregator_onceToken != -1) {
    dispatch_once(&sharedAggregator_onceToken, &__block_literal_global_5763);
  }
  uint64_t v2 = (void *)sharedAggregator_sSharedAggregator;

  return v2;
}

uint64_t __32__VTAggregator_sharedAggregator__block_invoke()
{
  sharedAggregator_sSharedAggregator = objc_alloc_init(VTAggregator);

  return MEMORY[0x270F9A758]();
}

@end