@interface CLVO2MaxService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isEligibleForPreProcessing:(VO2MaxRetrocomputeHistory *)a3;
- (BOOL)updateRetrocomputeLastTimestampToHealthKit:(double)a3;
- (BOOL)validateBodyMetrics;
- (CLVO2MaxService)init;
- (NSMutableSet)retrocomputeStatusClients;
- (id).cxx_construct;
- (int)getIndexInHealthKitSamples:(const void *)a3 forSessionAttributes:(const VO2MaxSessionAttributes *)a4 withStartIndex:(int)a5;
- (unsigned)retrocomputeForSamples:(const void *)a3 withRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a4;
- (unsigned)retrocomputeSession:(const VO2MaxSessionAttributes *)a3 withHealthKitSample:(VO2MaxHealthKitSample *)a4 withRetrocomputeHistory:;
- (unsigned)updateRetrocomputeHistoryPostProcessing:(VO2MaxRetrocomputeHistory *)a3;
- (void)beginService;
- (void)deleteHealthKitSamples:(BOOL)a3;
- (void)deleteSessionsFromHealthKit:()vector<VO2MaxStagingLostEstimate withRetry:(std:(BOOL)a4 :allocator<VO2MaxStagingLostEstimate>> *)a3;
- (void)endService;
- (void)executeRetrocomputePreprocessing:(id)a3;
- (void)forceClearHistoryDatabase;
- (void)handleRetryHealthKitDeleteSamples:(id)a3;
- (void)handleRetryTriggerRetrocompute:(id)a3;
- (void)markXpcActivityDone:(id)a3;
- (void)onRetrocomputeHealthKitSampleFailed:(id)a3;
- (void)onRetrocomputeHealthKitSampleSavedWithStartTime:(double)a3 activity:(id)a4;
- (void)onRetrocomputePreprocessingActivity:(id)a3;
- (void)onRetryHealthKitDeleteSamples:(id)a3;
- (void)onRetryTriggerRetrocompute:(id)a3;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)persistLostEstimateToStagingTables:(const void *)a3;
- (void)persistRetrocomputeResultsToStagingTables:(VO2MaxRetrocomputeSessionResult *)a3;
- (void)promoteStagingData:(id)a3;
- (void)queryVO2MaxRetrocomputeStatusWithReply:(id)a3;
- (void)registerForRetrocomputeStatusUpdates:(id)a3;
- (void)resetRetrocomputePreProcessingActivity:(id)a3 withDelay:(int64_t)a4;
- (void)retryHealthKitDeleteSamples;
- (void)retryTriggerRetrocompute;
- (void)runAggregationForStagingTables;
- (void)saveStagingOutputToHealthKit:(VO2MaxStagingOutput *)a3 activity:;
- (void)scheduleRetrocomputePreprocessing;
- (void)sendRetroComputeAnalytics;
- (void)setRetrocomputeStatusClients:(id)a3;
- (void)triggerRetrocomputeWithReply:(id)a3;
- (void)unregisterForRetrocomputeStatusUpdates:(id)a3;
- (void)updateBypassParameters;
- (void)updateRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a3 withResult:(VO2MaxRetrocomputeSessionResult *)a4;
- (void)updateRetrocomputeStatus:(int)a3 unavailableReasons:(unsigned int)a4;
@end

@implementation CLVO2MaxService

- (void)registerForRetrocomputeStatusUpdates:(id)a3
{
  [(NSMutableSet *)[(CLVO2MaxService *)self retrocomputeStatusClients] addObject:a3];
  sub_1000E1294((uint64_t *)v11, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
  v12[0] = 0;
  v12[1] = 0;
  int v13 = 3;
  uint64_t v19 = 0;
  long long v14 = 0u;
  memset(v15, 0, sizeof(v15));
  long long v16 = 0u;
  long long v17 = 0u;
  memset(v18, 0, sizeof(v18));
  if (sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v12) == 100)
  {
    id v5 = objc_alloc((Class)NSDate);
    id v6 = [v5 initWithTimeIntervalSinceReferenceDate:*(double *)((char *)&v14 + 4)];
    id v7 = objc_alloc((Class)NSDate);
    id v8 = [v7 initWithTimeIntervalSinceReferenceDate:*(double *)&v15[1]];
    id v9 = objc_alloc((Class)NSNumber);
    id v10 = [v9 initWithDouble:*(double *)&v16];
    [a3 onRetrocomputeStatusUpdate:[objc_alloc((Class)CMVO2MaxRetrocomputeState) initWithStatus:v14 startDate:v6 endDate:v8 meanDelta:v10]];
  }
  sub_1000E1098(v11);
}

- (void)queryVO2MaxRetrocomputeStatusWithReply:(id)a3
{
  v21[0] = 0;
  v21[1] = 0;
  int v22 = 3;
  uint64_t v28 = 0;
  long long v23 = 0u;
  memset(v24, 0, sizeof(v24));
  long long v25 = 0u;
  long long v26 = 0u;
  memset(v27, 0, sizeof(v27));
  uint64_t v4 = sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v21);
  if (v4 == 100)
  {
    id v5 = objc_alloc((Class)NSDate);
    id v6 = [v5 initWithTimeIntervalSinceReferenceDate:*(double *)((char *)&v23 + 4)];
    id v7 = objc_alloc((Class)NSDate);
    id v8 = [v7 initWithTimeIntervalSinceReferenceDate:*(double *)&v24[1]];
    id v9 = objc_alloc((Class)NSNumber);
    id v10 = [v9 initWithDouble:*(double *)&v25];
    id v11 = [objc_alloc((Class)CMVO2MaxRetrocomputeState) initWithStatus:(int)v23 startDate:v6 endDate:v8 meanDelta:v10];
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    v12 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      int v18 = 3;
      __int16 v19 = 2080;
      id v20 = [[[v11 description] UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Queried VO2MaxRetrocomputeHistory for algVersion = %d and received %s", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      [objc_msgSend(v11, "description") UTF8String];
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService queryVO2MaxRetrocomputeStatusWithReply:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v11, 100);
  }
  else
  {
    uint64_t v13 = v4;
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v14 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error querying VO2MaxRetrocomputeHistory: %u", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      long long v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService queryVO2MaxRetrocomputeStatusWithReply:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v13);
  }
}

- (NSMutableSet)retrocomputeStatusClients
{
  return self->_retrocomputeStatusClients;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247B2C8 != -1) {
    dispatch_once(&qword_10247B2C8, &stru_1022B9BD0);
  }
  return (id)qword_10247B2C0;
}

- (void)updateBypassParameters
{
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, buf);
  sub_1000D2988(*(uint64_t *)buf, "VO2MaxRetrocomputeMinMeanDelta_Bypass", &self->fShouldBypassMinDelta);
  if (v17) {
    sub_1000DB0A0(v17);
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v4 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    BOOL fShouldBypassMinDelta = self->fShouldBypassMinDelta;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = fShouldBypassMinDelta;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updated fShouldBypassMinDelta to %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  uint64_t v6 = sub_1000D3E78();
  sub_10006B564(v6, buf);
  sub_1000D2988(*(uint64_t *)buf, "VO2MaxRetrocomputeMinPrevAlgSampleInterval_Bypass", &self->fShouldBypassPreviousSampleInternal);
  if (v17) {
    sub_1000DB0A0(v17);
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  id v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    BOOL fShouldBypassPreviousSampleInternal = self->fShouldBypassPreviousSampleInternal;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = fShouldBypassPreviousSampleInternal;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updated fShouldBypassPreviousSampleInternal to %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  uint64_t v9 = sub_1000D3E78();
  sub_10006B564(v9, buf);
  p_fShouldBypassMinEstimatesUpdatedRatio = &self->fShouldBypassMinEstimatesUpdatedRatio;
  sub_1000D2988(*(uint64_t *)buf, "VO2MaxRetrocomputeMinEstimatesUpdatedRatio_Bypass", p_fShouldBypassMinEstimatesUpdatedRatio);
  if (v17) {
    sub_1000DB0A0(v17);
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  id v11 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = *p_fShouldBypassMinEstimatesUpdatedRatio;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updated fShouldBypassMinEstimatesUpdatedRatio to %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateBypassParameters]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
}

- (void)forceClearHistoryDatabase
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Force clearing history database", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService forceClearHistoryDatabase]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_1011F9E28((void *)self->fRetrocomputeDb.__ptr_.__value_ + 9);
}

- (CLVO2MaxService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLVO2MaxService;
  return [(CLVO2MaxService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLVO2MaxServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLVO2MaxServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_10247B2D8 != -1) {
    dispatch_once(&qword_10247B2D8, &stru_1022B9BF0);
  }
  return byte_10247B2D0;
}

- (void)beginService
{
  if (_os_feature_enabled_impl())
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    objc_super v3 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLVO2MaxService", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      __int16 v12 = 0;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService beginService]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    unsigned __int8 v11 = 0;
    sub_1004B3AD0(&v11, buf);
    shared_ptr<CLVO2MaxInputCache> v4 = *(shared_ptr<CLVO2MaxInputCache> *)buf;
    memset(buf, 0, sizeof(buf));
    cntrl = self->fInputCache.__cntrl_;
    self->fInputCache = v4;
    if (cntrl)
    {
      sub_1000DB0A0((std::__shared_weak_count *)cntrl);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    sub_1004B3C28((uint64_t *)&self->fInputCache, buf);
    shared_ptr<CLVO2MaxInputStore> v6 = *(shared_ptr<CLVO2MaxInputStore> *)buf;
    memset(buf, 0, sizeof(buf));
    id v7 = self->fInputStore.__cntrl_;
    self->fInputStore = v6;
    if (v7)
    {
      sub_1000DB0A0((std::__shared_weak_count *)v7);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    operator new();
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  id v8 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not starting up CLVO2MaxService because it is not enabled", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    __int16 v12 = 0;
    id v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService beginService]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)endService
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  objc_super v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLVO2MaxService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    shared_ptr<CLVO2MaxInputCache> v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService endService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }

  self->fHkHealthStore = 0;
}

- (void)unregisterForRetrocomputeStatusUpdates:(id)a3
{
  shared_ptr<CLVO2MaxInputCache> v4 = [(CLVO2MaxService *)self retrocomputeStatusClients];

  [(NSMutableSet *)v4 removeObject:a3];
}

- (void)sendRetroComputeAnalytics
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10247B2F8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_10247B2F8))
    {
      long long v16 = xmmword_101D22C14;
      v17[0] = unk_101D22C24;
      *(_OWORD *)((char *)v17 + 12) = unk_101D22C30;
      *(_OWORD *)buf = xmmword_101D22BF4;
      long long v15 = unk_101D22C04;
      sub_1003B17B4(&qword_10247B2E0, buf, 0x13uLL);
      __cxa_atexit((void (*)(void *))sub_1003B1838, &qword_10247B2E0, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_10247B2F8);
    }
    long long v6 = 0uLL;
    int v7 = 3;
    uint64_t v13 = 0;
    long long v8 = 0u;
    memset(v9, 0, sizeof(v9));
    long long v10 = 0u;
    long long v11 = 0u;
    memset(v12, 0, 28);
    if (sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)&v6) != 109)
    {
      AnalyticsSendEventLazy();
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      objc_super v3 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Succesfully accessed history table, sent Core Analytics event", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        shared_ptr<CLVO2MaxInputCache> v4 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService sendRetroComputeAnalytics]", "%s\n", v4);
LABEL_22:
        if (v4 != (char *)buf) {
          free(v4);
        }
      }
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    unint64_t v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Retro-compute, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v6) = 0;
      shared_ptr<CLVO2MaxInputCache> v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService sendRetroComputeAnalytics]", "%s\n", v4);
      goto LABEL_22;
    }
  }
}

- (void)scheduleRetrocomputePreprocessing
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = sub_1000D3E78();
  sub_10006B564(v4, &v14);
  double v13 = 0.0;
  sub_1000A699C(v14, "VO2MaxRetrocomputeNextPreprocessingTime", &v13);
  double v5 = v13;
  if (v13 > Current + (double)XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      long long v23 = "VO2MaxRetrocomputeNextPreprocessingTime";
      __int16 v24 = 2050;
      double v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      int v16 = 136446466;
      long long v17 = "VO2MaxRetrocomputeNextPreprocessingTime";
      __int16 v18 = 2050;
      double v19 = v13;
      long long v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService scheduleRetrocomputePreprocessing]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    sub_1004CF7DC(v14, "VO2MaxRetrocomputeNextPreprocessingTime", 0xFFFFFFFFLL);
    double v13 = 0.0;
    double v5 = 0.0;
  }
  double v7 = v5 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v7) {
    int64_t v8 = (uint64_t)v7;
  }
  else {
    int64_t v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v9 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    long long v23 = "com.apple.locationd.VO2Max.RetrocomputePreprocessing";
    __int16 v24 = 2050;
    double v25 = v13;
    __int16 v26 = 2050;
    int64_t v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v16 = 136446722;
    long long v17 = "com.apple.locationd.VO2Max.RetrocomputePreprocessing";
    __int16 v18 = 2050;
    double v19 = v13;
    __int16 v20 = 2050;
    int64_t v21 = v8;
    long long v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService scheduleRetrocomputePreprocessing]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputePreprocessing");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10052B8FC;
  handler[3] = &unk_1022AD1E8;
  handler[4] = [[-[CLVO2MaxService universe](self, "universe") vendor] proxyForService:@"CLVO2MaxService"];
  handler[5] = v8;
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputePreprocessing", XPC_ACTIVITY_CHECK_IN, handler);
  if (v15) {
    sub_1000DB0A0(v15);
  }
}

- (void)resetRetrocomputePreProcessingActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  double v10 = v6;
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  double v7 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "VO2MaxRetrocomputeNextPreprocessingTime";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Resetting next activity time to: %{public}.1f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v11 = 136446466;
    __int16 v12 = "VO2MaxRetrocomputeNextPreprocessingTime";
    __int16 v13 = 2050;
    double v14 = v6;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService resetRetrocomputePreProcessingActivity:withDelay:]", "%s\n", v9);
    if (v9 != buf) {
      free(v9);
    }
  }
  uint64_t v8 = sub_1000D3E78();
  sub_10006B564(v8, buf);
  sub_10016332C(*(uint64_t *)buf, "VO2MaxRetrocomputeNextPreprocessingTime", &v10);
  if (*(void *)&buf[8]) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
  }
  [(CLVO2MaxService *)self markXpcActivityDone:a3];
  [(CLVO2MaxService *)self scheduleRetrocomputePreprocessing];
}

- (void)onRetrocomputePreprocessingActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    uint64_t v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1)
    {
LABEL_28:
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService onRetrocomputePreprocessingActivity:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
      return;
    }
LABEL_30:
    dispatch_once(&qword_102419220, &stru_1022B9D18);
    goto LABEL_28;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    double v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to execute VO2MaxRetrocomputePreProcessing", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      double v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService onRetrocomputePreprocessingActivity:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLVO2MaxService *)self executeRetrocomputePreprocessing:a3];
    return;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v9 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected VO2MaxRetrocomputePreProcessing activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }
}

- (void)executeRetrocomputePreprocessing:(id)a3
{
  if (objc_opt_class())
  {
    sub_100536E44((uint64_t *)&off_1022B9C38, &v65);
    [(CLVO2MaxService *)self runAggregationForStagingTables];
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0xC812000000;
    v85 = sub_1001778F8;
    v86 = nullsub_51;
    v87 = "";
    v88[1] = 0;
    v88[0] = 0;
    int v89 = 3;
    uint64_t v92 = 0;
    long long v90 = 0u;
    memset(v91, 0, 28);
    memset(&v91[44], 0, 60);
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    if (sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v88) == 109)
    {
      double v5 = v62;
LABEL_4:
      *((unsigned char *)v5 + 24) = 1;
      goto LABEL_12;
    }
    if (v83[6])
    {
      if (![(CLVO2MaxService *)self isEligibleForPreProcessing:v83 + 6])
      {
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        int v11 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = *((_DWORD *)v83 + 17);
          int v13 = *((_DWORD *)v83 + 46);
          *(_DWORD *)buf = 67240704;
          *(_DWORD *)&uint8_t buf[4] = v12;
          LOWORD(v76) = 1026;
          *(_DWORD *)((char *)&v76 + 2) = v13;
          HIWORD(v76) = 1026;
          LODWORD(v77) = 3;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, status: %{public}d, unavailableReasons: %{public}d, algVersion: %{public}d", buf, 0x14u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          int v43 = *((_DWORD *)v83 + 17);
          int v44 = *((_DWORD *)v83 + 46);
          LODWORD(v70) = 67240704;
          HIDWORD(v70) = v43;
          LOWORD(v71) = 1026;
          *(_DWORD *)((char *)&v71 + 2) = v44;
          HIWORD(v71) = 1026;
          int v72 = 3;
          v45 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v45);
          if (v45 != (char *)buf) {
            free(v45);
          }
        }
        [(CLVO2MaxService *)self resetRetrocomputePreProcessingActivity:a3 withDelay:XPC_ACTIVITY_INTERVAL_1_DAY];
        if (*((_DWORD *)v83 + 17) == 2 && !self->fTriggerRetrocomputeInProgress) {
          [(CLVO2MaxService *)self retryTriggerRetrocompute];
        }
        [(CLVO2MaxService *)self sendRetroComputeAnalytics];
        goto LABEL_22;
      }
      xpc_activity_state_t v6 = v83;
      *((_DWORD *)v83 + 39) = 0;
      *((_DWORD *)v6 + 46) = 0;
      double v5 = v62;
    }
    else
    {
      sub_1012C9450(self->fStagingOutputStore.__ptr_.__value_);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v8 = (unsigned __int8 *)v83;
      *((CFAbsoluteTime *)v83 + 7) = Current;
      uuid_clear(v8 + 112);
      sub_1007F1A68((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)(v83 + 6));
      int v9 = sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)(v83 + 6));
      double v5 = v62;
      if (v9 == 109) {
        goto LABEL_4;
      }
    }
LABEL_12:
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    int v72 = 3;
    uint64_t v74 = 0;
    uint64_t v73 = 0;
    if (!*((unsigned char *)v5 + 24))
    {
      if (sub_1003B9B10((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_) == 109)
      {
        *((unsigned char *)v62 + 24) = 1;
      }
      else if (!*((unsigned char *)v62 + 24))
      {
        double v60 = 47304000.0;
        uint64_t v14 = sub_1000D3E78();
        sub_10006B564(v14, buf);
        sub_1000A699C(*(uint64_t *)buf, "VO2MaxRetrocomputeAlgVersionEligibilityDuration", &v60);
        if (v76) {
          sub_1000DB0A0(v76);
        }
        if (CFAbsoluteTimeGetCurrent() - v60 > *((double *)v83 + 7))
        {
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          long long v15 = qword_102419228;
          if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, algVersion aged out for retrocompute", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419220 != -1) {
              dispatch_once(&qword_102419220, &stru_1022B9D18);
            }
            LOWORD(v67) = 0;
            v46 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v46);
            if (v46 != (char *)buf) {
              free(v46);
            }
          }
          *((_DWORD *)v83 + 46) |= 0x100u;
        }
        double v59 = 15552000.0;
        uint64_t v16 = sub_1000D3E78();
        sub_10006B564(v16, buf);
        sub_1000A699C(*(uint64_t *)buf, "VO2MaxRetrocomputeMaxAvailabilityDuration", &v59);
        if (v76) {
          sub_1000DB0A0(v76);
        }
        if (*((_DWORD *)v83 + 17) == 1
          && *((double *)v83 + 24) > 0.0
          && CFAbsoluteTimeGetCurrent() - v59 > *((double *)v83 + 24))
        {
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          long long v17 = qword_102419228;
          if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, availability has expired", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419220 != -1) {
              dispatch_once(&qword_102419220, &stru_1022B9D18);
            }
            LOWORD(v67) = 0;
            v50 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v50);
            if (v50 != (char *)buf) {
              free(v50);
            }
          }
          *((_DWORD *)v83 + 46) |= 0x80u;
        }
        if ([[(objc_class *)off_10241C338() sharedInstance] isPaired])
        {
          id v18 = [[(objc_class *)off_10241C338() sharedInstance] getPairedDevices];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v19 = [v18 countByEnumeratingWithState:&v55 objects:v69 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v56;
            while (2)
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v56 != v20) {
                  objc_enumerationMutation(v18);
                }
                if ((objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "supportsCapability:", objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", @"3C190EF7-40E9-47BF-9B87-3408FD90B9E6")) & 1) == 0)
                {
                  if (qword_102419220 != -1) {
                    dispatch_once(&qword_102419220, &stru_1022B9D18);
                  }
                  __int16 v24 = qword_102419228;
                  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, paired watch found with incompatible algorithm version", buf, 2u);
                  }
                  if (sub_10013D1A0(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_102419220 != -1) {
                      dispatch_once(&qword_102419220, &stru_1022B9D18);
                    }
                    LOWORD(v67) = 0;
                    v49 = (char *)_os_log_send_and_compose_impl();
                    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v49);
                    if (v49 != (char *)buf) {
                      free(v49);
                    }
                    int v23 = 1;
                  }
                  else
                  {
                    int v23 = 1;
                  }
                  goto LABEL_76;
                }
              }
              id v19 = [v18 countByEnumeratingWithState:&v55 objects:v69 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          int v22 = qword_102419228;
          if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, no paired watch found", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419220 != -1) {
              dispatch_once(&qword_102419220, &stru_1022B9D18);
            }
            LOWORD(v67) = 0;
            v47 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v47);
            if (v47 != (char *)buf) {
              free(v47);
            }
            int v23 = 2;
          }
          else
          {
            int v23 = 2;
          }
LABEL_76:
          *((_DWORD *)v83 + 46) |= v23;
        }
        if (self->fUserInfo._isAgeSet)
        {
          if (!*((_DWORD *)v83 + 46))
          {
            if (v70)
            {
              self->fOriginalBodyMetrics.age = *((float *)&v73 + 1);
              self->fOriginalBodyMetrics.biologicalSex = v73;
              *(void *)&self->fOriginalBodyMetrics.heightM = v74;
              if (![(CLVO2MaxService *)self validateBodyMetrics])
              {
                if (qword_102419220 != -1) {
                  dispatch_once(&qword_102419220, &stru_1022B9D18);
                }
                double v25 = qword_102419228;
                if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, body metrics changed significantly", buf, 2u);
                }
                if (sub_10013D1A0(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_102419220 != -1) {
                    dispatch_once(&qword_102419220, &stru_1022B9D18);
                  }
                  LOWORD(v67) = 0;
                  v51 = (char *)_os_log_send_and_compose_impl();
                  sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v51);
                  if (v51 != (char *)buf) {
                    free(v51);
                  }
                }
                *((_DWORD *)v83 + 46) |= 0x200u;
                -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 0);
                [(CLVO2MaxService *)self sendRetroComputeAnalytics];
                sub_1003B9898((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
                goto LABEL_22;
              }
            }
            else
            {
              HIDWORD(v73) = LODWORD(self->fUserInfo.age);
              LODWORD(v73) = self->fUserInfo.biologicalSex;
              uint64_t v74 = *(void *)&self->fUserInfo.heightM;
              sub_1003B9870((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_, (uint64_t)&v70);
              long long v28 = *(_OWORD *)&self->fUserInfo.vo2max;
              long long v27 = *(_OWORD *)&self->fUserInfo.hronset;
              long long v29 = *(_OWORD *)&self->fUserInfo.gender;
              *(_OWORD *)&self->fOriginalBodyMetrics.runVo2max = *(_OWORD *)&self->fUserInfo.runVo2max;
              *(_OWORD *)&self->fOriginalBodyMetrics.vo2max = v28;
              *(_OWORD *)&self->fOriginalBodyMetrics.hronset = v27;
              *(_OWORD *)&self->fOriginalBodyMetrics.gender = v29;
            }
            v30 = dispatch_group_create();
            *(void *)buf = 0;
            v76 = (std::__shared_weak_count *)buf;
            uint64_t v77 = 0x4812000000;
            v78 = sub_10052D870;
            v79 = sub_10052D894;
            v80 = "";
            memset(v81, 0, 24);
            double v31 = CFAbsoluteTimeGetCurrent();
            double v32 = *((double *)v83 + 13);
            id v33 = objc_alloc((Class)NSDate);
            double v34 = v31 + -63072000.0;
            if (v31 + -63072000.0 < v32 + 1.0) {
              double v34 = v32 + 1.0;
            }
            id v35 = [v33 initWithTimeIntervalSinceReferenceDate:v34];
            v36 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v35, +[NSDate date], 3);
            v37 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:1];
            dispatch_group_enter(v30);
            id v38 = objc_alloc((Class)HKSampleQuery);
            v39 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierVO2Max];
            v68 = v37;
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_10052D8C0;
            v54[3] = &unk_1022B9C48;
            v54[5] = &v61;
            v54[6] = buf;
            v54[4] = v30;
            id v40 = [v38 initWithSampleType:v39 predicate:v36 limit:0 sortDescriptors:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1) resultsHandler:v54];
            [(HKHealthStore *)self->fHkHealthStore executeQuery:v40];

            v41 = [[-[CLVO2MaxService universe](self, "universe") silo] queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3321888768;
            block[2] = sub_10052E1C8;
            block[3] = &unk_1022B9C70;
            block[4] = v30;
            block[10] = v65;
            v53 = v66;
            if (v66) {
              atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            block[5] = a3;
            block[6] = self;
            block[7] = &v61;
            block[8] = buf;
            block[9] = &v82;
            dispatch_group_notify(v30, v41, block);
            if (v53) {
              sub_1000DB0A0(v53);
            }
            _Block_object_dispose(buf, 8);
            v67 = (void **)v81;
            sub_100536F84(&v67);
            goto LABEL_22;
          }
        }
        else
        {
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          __int16 v26 = qword_102419228;
          if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, no age set", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419220 != -1) {
              dispatch_once(&qword_102419220, &stru_1022B9D18);
            }
            LOWORD(v67) = 0;
            v48 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v48);
            if (v48 != (char *)buf) {
              free(v48);
            }
          }
          *((_DWORD *)v83 + 46) |= 4u;
        }
        -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 0);
        [(CLVO2MaxService *)self resetRetrocomputePreProcessingActivity:a3 withDelay:XPC_ACTIVITY_INTERVAL_1_DAY];
        [(CLVO2MaxService *)self sendRetroComputeAnalytics];
LABEL_22:
        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(&v82, 8);
        if (v66) {
          sub_1000DB0A0(v66);
        }
        return;
      }
    }
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    double v10 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "VO2MaxRetrocomputeHistory query failed due to device lock", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v67) = 0;
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService executeRetrocomputePreprocessing:]", "%s\n", v42);
      if (v42 != (char *)buf) {
        free(v42);
      }
    }
    [(CLVO2MaxService *)self resetRetrocomputePreProcessingActivity:a3 withDelay:XPC_ACTIVITY_INTERVAL_30_MIN];
    goto LABEL_22;
  }
  [(CLVO2MaxService *)self markXpcActivityDone:a3];

  [(CLVO2MaxService *)self sendRetroComputeAnalytics];
}

- (void)markXpcActivityDone:(id)a3
{
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    uint64_t v4 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to mark activity as done. Current state is %{public}ld", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      xpc_activity_get_state((xpc_activity_t)a3);
      double v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService markXpcActivityDone:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)runAggregationForStagingTables
{
}

- (BOOL)isEligibleForPreProcessing:(VO2MaxRetrocomputeHistory *)a3
{
  return (a3->var19 & 0x340) == 0 && (a3->var3 & 0xFFFFFFFE) != 2;
}

- (unsigned)retrocomputeForSamples:(const void *)a3 withRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a4
{
  if (*(void *)a3 == *((void *)a3 + 1))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    double v32 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "There are no VO2Max HealthKit samples to retrocompute", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v59[0]) = 0;
      id v40 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]", "%s\n", v40);
      if (v40 != (char *)buf) {
        free(v40);
      }
    }
    return 0;
  }
  else
  {
    int v44 = 0;
    v45 = 0;
    uint64_t v46 = 0;
    uint64_t v6 = sub_1011E124C();
    sub_1011E1DF0(v6, &v44);
    unint64_t v7 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((char *)v45 - (unsigned char *)v44) >> 4));
    if (v45 == v44) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    sub_10053742C((unint64_t)v44, v45, v8, 1);
    double v10 = (double *)v44;
    int v9 = v45;
    if (v44 == v45)
    {
      LODWORD(v11) = 0;
LABEL_44:
      if (0x8E38E38E38E38E39 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > (int)v11)
      {
        unint64_t v11 = (int)v11;
        uint64_t v33 = 72 * (int)v11 + 24;
        do
        {
          id v34 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:*(void *)a3 + v33];
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          id v35 = qword_102419228;
          if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
          {
            id v36 = [v34 UUIDString];
            *(_DWORD *)buf = 138477827;
            id v61 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419220 != -1) {
              dispatch_once(&qword_102419220, &stru_1022B9D18);
            }
            id v37 = [v34 UUIDString];
            LODWORD(v59[0]) = 138477827;
            *(void *)((char *)v59 + 4) = v37;
            id v38 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]", "%s\n", v38);
            if (v38 != (char *)buf) {
              free(v38);
            }
          }
          ++a4->var15;
          ++v11;
          v33 += 72;
        }
        while (0x8E38E38E38E38E39 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v11);
      }
      unsigned int v31 = [(CLVO2MaxService *)self updateRetrocomputeHistoryPostProcessing:a4];
    }
    else
    {
      unint64_t v11 = 0;
      v41 = v45;
      while (1)
      {
        v59[0] = *(_OWORD *)v10;
        long long v12 = *((_OWORD *)v10 + 1);
        long long v13 = *((_OWORD *)v10 + 2);
        long long v14 = *((_OWORD *)v10 + 4);
        v59[3] = *((_OWORD *)v10 + 3);
        v59[4] = v14;
        v59[1] = v12;
        v59[2] = v13;
        long long v56 = 0uLL;
        *(void *)long long v57 = 0xBFF0000000000000;
        *(_DWORD *)&v57[24] = 0;
        sub_100134750(&v58, "");
        int v15 = [(CLVO2MaxService *)self getIndexInHealthKitSamples:a3 forSessionAttributes:v59 withStartIndex:v11];
        int v16 = v15;
        if ((v15 & 0x80000000) == 0)
        {
          unsigned int v42 = v15;
          if ((int)v11 < v15)
          {
            uint64_t v17 = 72 * (int)v11;
            uint64_t v18 = v15 - (uint64_t)(int)v11;
            do
            {
              id v19 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:*(void *)a3 + v17 + 24];
              double var4 = a4->var4;
              BOOL v21 = var4 > 0.0 && *(double *)(*(void *)a3 + v17) > var4;
              if (qword_102419220 != -1) {
                dispatch_once(&qword_102419220, &stru_1022B9D18);
              }
              int v22 = qword_102419228;
              if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
              {
                id v23 = [v19 UUIDString];
                uint64_t v24 = *(void *)(*(void *)a3 + v17);
                *(_DWORD *)buf = 138478339;
                id v61 = v23;
                __int16 v62 = 2049;
                uint64_t v63 = v24;
                __int16 v64 = 1026;
                BOOL v65 = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Retrocompute encountered HealthKit sample with no SessionAttributes for sessionId %{private}@, startTime:%{private}f, isLostEstimate:%{public}d", buf, 0x1Cu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419220 != -1) {
                  dispatch_once(&qword_102419220, &stru_1022B9D18);
                }
                id v25 = [v19 UUIDString];
                uint64_t v26 = *(void *)(*(void *)a3 + v17);
                int v50 = 138478339;
                id v51 = v25;
                __int16 v52 = 2049;
                uint64_t v53 = v26;
                __int16 v54 = 1026;
                BOOL v55 = v21;
                long long v27 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeForSamples:withRetrocomputeHistory:]", "%s\n", v27);
                if (v27 != (char *)buf) {
                  free(v27);
                }
              }
              if (v21)
              {
                ++a4->var14;
                [(CLVO2MaxService *)self persistLostEstimateToStagingTables:*(void *)a3 + v17];
              }
              v17 += 72;
              --v18;
            }
            while (v18);
            LODWORD(v11) = v16;
            int v9 = v41;
          }
          uint64_t v28 = *(void *)a3 + 72 * v42;
          long long v29 = *(_OWORD *)(v28 + 28);
          long long v30 = *(_OWORD *)(v28 + 16);
          long long v56 = *(_OWORD *)v28;
          *(_OWORD *)long long v57 = v30;
          *(_OWORD *)&v57[12] = v29;
          std::string::operator=(&v58, (const std::string *)(v28 + 48));
          unint64_t v11 = (v11 + 1);
        }
        long long v47 = v56;
        v48[0] = *(_OWORD *)v57;
        *(_OWORD *)((char *)v48 + 12) = *(_OWORD *)&v57[12];
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
          sub_1000DC48C(&__p, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v58;
        }
        unsigned int v31 = [(CLVO2MaxService *)self retrocomputeSession:v59 withHealthKitSample:&v47 withRetrocomputeHistory:a4];
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v58.__r_.__value_.__l.__data_);
        }
        if (v31) {
          break;
        }
        v10 += 10;
        if (v10 == v9) {
          goto LABEL_44;
        }
      }
    }
    if (v44)
    {
      v45 = (double *)v44;
      operator delete(v44);
    }
  }
  return v31;
}

- (int)getIndexInHealthKitSamples:(const void *)a3 forSessionAttributes:(const VO2MaxSessionAttributes *)a4 withStartIndex:(int)a5
{
  uint64_t v7 = *((void *)a3 + 1);
  uint64_t v8 = *(void *)a3 + 72 * a5;
  var2 = a4->var2;
  if (v8 != v7)
  {
    while (uuid_compare(var2, (const unsigned __int8 *)(v8 + 24)))
    {
      v8 += 72;
      if (v8 == v7)
      {
        uint64_t v8 = v7;
        break;
      }
    }
  }
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:var2];
  if (v8 == *((void *)a3 + 1))
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v15 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      id v19 = [v10 UUIDString];
      __int16 v20 = 1026;
      int v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLVO2MaxService::getIndexInHealthKitSamples - index not found for sessionId: %{private}@, startIndex: %{public}d", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      [v10 UUIDString];
      uint64_t v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    LODWORD(v12) = -1;
  }
  else
  {
    uint64_t v11 = (v8 - *(void *)a3) >> 3;
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    unint64_t v12 = 0x8E38E38E38E38E39 * v11;
    long long v13 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      id v19 = [v10 UUIDString];
      __int16 v20 = 1026;
      int v21 = a5;
      __int16 v22 = 2050;
      unint64_t v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CLVO2MaxService::getIndexInHealthKitSamples - sessionId: %{private}@, startIndex: %{public}d, index: %{public}zu", buf, 0x1Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      [v10 UUIDString];
      long long v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService getIndexInHealthKitSamples:forSessionAttributes:withStartIndex:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
  return v12;
}

- (unsigned)retrocomputeSession:(const VO2MaxSessionAttributes *)a3 withHealthKitSample:(VO2MaxHealthKitSample *)a4 withRetrocomputeHistory:
{
  uint64_t v5 = v4;
  if ([(CLVO2MaxService *)self validateBodyMetrics])
  {
    *(void *)&dst[8] = 0;
    *(void *)dst = 0;
    *(double *)&dst[16] = a3->var1;
    dst[24] = a3->var6;
    long long v101 = 0u;
    memset(v102, 0, sizeof(v102));
    long long v9 = *(_OWORD *)&a4->var0;
    long long v10 = *(_OWORD *)&a4->var2;
    *(_OWORD *)((char *)v104 + 12) = *(_OWORD *)&a4->var3[4];
    v104[0] = v10;
    long long v103 = v9;
    if (*((char *)&a4->var5.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1000DC48C(&__src, a4->var5.__r_.__value_.var0.var1.__data_, a4->var5.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      long long __src = *(_OWORD *)a4->var5.__r_.__value_.var0.var0.__data_;
      uint64_t v106 = *((void *)&a4->var5.__r_.__value_.var0.var1 + 2);
    }
    int var7 = a3->var7;
    uuid_copy(dst, a3->var2);
    memset(uu, 0, sizeof(uu));
    uuid_copy(uu, a3->var2);
    sub_1012C9124((uint64_t)self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_1012C9034(self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_1012C9580((uint64_t)self->fStagingOutputStore.__ptr_.__value_, uu);
    sub_1011C47FC(uu, (uint64_t *)self->fInputStore.__ptr_, &v76);
    std::string __p = 0;
    __dst = 0;
    unint64_t v75 = 0;
    double v13 = *(double *)&dst[16] + -18144000.0;
    if (*(double *)(v5 + 32) == 0.0)
    {
      uint64_t v14 = sub_1011E124C();
      if (!sub_1011E1F30(v14, &__p))
      {
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        int v15 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Query for historical summaries failed due to device lock", (uint8_t *)&buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          LOWORD(v96) = 0;
          int v16 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v16);
          if (v16 != (char *)&buf) {
            free(v16);
          }
        }
LABEL_71:
        unsigned int v12 = 2;
LABEL_88:
        if (__p)
        {
          __dst = __p;
          operator delete(__p);
        }
        if (v76)
        {
          uint64_t v77 = v76;
          operator delete(v76);
        }
        if (SHIBYTE(v106) < 0) {
          operator delete((void *)__src);
        }
        if ((void)v101)
        {
          *((void *)&v101 + 1) = v101;
          operator delete((void *)v101);
        }
        return v12;
      }
LABEL_65:
      uint64_t v70 = 0;
      uint64_t v71 = 0;
      uint64_t v72 = 0;
      uint64_t v63 = sub_1011E124C();
      if (sub_1011E1EF4(v63, uu, &v70))
      {
        if (v76 != v77 && v70 != v71)
        {
          float v64 = *((double *)v70 + 8);
          self->fUserInfo.hrmax = v64;
          self->fUserInfo.betaBlockerUse = a3->var6;
          operator new();
        }
        v78[0] = *(_OWORD *)dst;
        *(_OWORD *)((char *)v78 + 9) = *(_OWORD *)&dst[9];
        v80 = 0;
        uint64_t v81 = 0;
        v79 = 0;
        sub_1000E39FC(&v79, (const void *)v101, *((uint64_t *)&v101 + 1), 0xD37A6F4DE9BD37A7 * ((uint64_t)(*((void *)&v101 + 1) - v101) >> 3));
        long long v87 = *(_OWORD *)&v102[11];
        long long v88 = *(_OWORD *)&v102[13];
        long long v89 = *(_OWORD *)&v102[15];
        long long v90 = *(_OWORD *)&v102[17];
        long long v83 = *(_OWORD *)&v102[3];
        long long v84 = *(_OWORD *)&v102[5];
        long long v85 = *(_OWORD *)&v102[7];
        long long v86 = *(_OWORD *)&v102[9];
        long long v82 = *(_OWORD *)&v102[1];
        long long v91 = v103;
        v92[0] = v104[0];
        *(_OWORD *)((char *)v92 + 12) = *(_OWORD *)((char *)v104 + 12);
        if (SHIBYTE(v106) < 0)
        {
          sub_1000DC48C(&v93, (void *)__src, *((unint64_t *)&__src + 1));
        }
        else
        {
          long long v93 = __src;
          uint64_t v94 = v106;
        }
        int v95 = var7;
        [(CLVO2MaxService *)self updateRetrocomputeHistory:v5 withResult:v78];
        if (SHIBYTE(v94) < 0) {
          operator delete((void *)v93);
        }
        if (v79)
        {
          v80 = v79;
          operator delete(v79);
        }
        unsigned int v12 = 0;
      }
      else
      {
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        BOOL v65 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Query for pre-existing summaries for current session failed due to device lock", (uint8_t *)&buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          LOWORD(v96) = 0;
          v68 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v68);
          if (v68 != (char *)&buf) {
            free(v68);
          }
        }
        unsigned int v12 = 2;
      }
      if (v70)
      {
        uint64_t v71 = (char *)v70;
        operator delete(v70);
      }
      goto LABEL_88;
    }
    v97 = 0;
    v96 = 0;
    uint64_t v98 = 0;
    if (sub_1012C9174((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v96) == 109)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      uint64_t v17 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Query for staged summaries failed due to device lock", (uint8_t *)&buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        LOWORD(v70) = 0;
        uint64_t v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v18);
        if (v18 != (char *)&buf) {
          free(v18);
        }
      }
    }
    else
    {
      id v19 = (char *)v96;
      if (v96 != v97)
      {
        do
        {
          *(void *)&long long buf = 0;
          uint64_t v20 = *((void *)v19 + 1);
          *(void *)&long long v110 = 0;
          long long v109 = 0uLL;
          uint64_t v21 = *((void *)v19 + 5);
          *((void *)&buf + 1) = v20;
          *((void *)&v110 + 1) = v21;
          *(void *)v111 = *((void *)v19 + 6);
          *(_OWORD *)&v111[8] = *(_OWORD *)(v19 + 56);
          *(_OWORD *)&v111[24] = *(_OWORD *)(v19 + 72);
          *(_OWORD *)&v111[40] = *(_OWORD *)(v19 + 88);
          *(_OWORD *)&v111[56] = *(_OWORD *)(v19 + 104);
          *(_OWORD *)&v111[72] = *(_OWORD *)(v19 + 120);
          *(void *)&v111[88] = *((void *)v19 + 17);
          *(void *)v112 = 0;
          *(_OWORD *)&v112[8] = *(_OWORD *)(v19 + 152);
          uint64_t v22 = *((void *)v19 + 22);
          *(void *)&v112[24] = *((void *)v19 + 21);
          uint64_t v113 = v22;
          uuid_copy((unsigned __int8 *)&v109 + 8, (const unsigned __int8 *)v19 + 24);
          unint64_t v23 = (char *)__dst;
          if ((unint64_t)__dst >= v75)
          {
            id v34 = (char *)__p;
            unint64_t v35 = 0xD37A6F4DE9BD37A7 * (((unsigned char *)__dst - (unsigned char *)__p) >> 3);
            unint64_t v36 = v35 + 1;
            if (v35 + 1 > 0x1642C8590B21642) {
              sub_1001D7FD4();
            }
            if (0xA6F4DE9BD37A6F4ELL * ((uint64_t)(v75 - (void)__p) >> 3) > v36) {
              unint64_t v36 = 0xA6F4DE9BD37A6F4ELL * ((uint64_t)(v75 - (void)__p) >> 3);
            }
            if (0xD37A6F4DE9BD37A7 * ((uint64_t)(v75 - (void)__p) >> 3) >= 0xB21642C8590B21) {
              unint64_t v37 = 0x1642C8590B21642;
            }
            else {
              unint64_t v37 = v36;
            }
            if (v37)
            {
              id v38 = (char *)sub_10050F820((uint64_t)&v75, v37);
              id v34 = (char *)__p;
              unint64_t v23 = (char *)__dst;
            }
            else
            {
              id v38 = 0;
            }
            v39 = &v38[8 * (((unsigned char *)__dst - (unsigned char *)__p) >> 3)];
            long long v40 = buf;
            long long v41 = v109;
            long long v42 = *(_OWORD *)v111;
            *((_OWORD *)v39 + 2) = v110;
            *((_OWORD *)v39 + 3) = v42;
            *(_OWORD *)v39 = v40;
            *((_OWORD *)v39 + 1) = v41;
            long long v43 = *(_OWORD *)&v111[16];
            long long v44 = *(_OWORD *)&v111[32];
            long long v45 = *(_OWORD *)&v111[64];
            *((_OWORD *)v39 + 6) = *(_OWORD *)&v111[48];
            *((_OWORD *)v39 + 7) = v45;
            *((_OWORD *)v39 + 4) = v43;
            *((_OWORD *)v39 + 5) = v44;
            long long v46 = *(_OWORD *)&v111[80];
            long long v47 = *(_OWORD *)v112;
            long long v48 = *(_OWORD *)&v112[16];
            *((void *)v39 + 22) = v113;
            *((_OWORD *)v39 + 9) = v47;
            *((_OWORD *)v39 + 10) = v48;
            *((_OWORD *)v39 + 8) = v46;
            if (v23 == v34)
            {
              double v59 = &v38[184 * v35];
            }
            else
            {
              v49 = &v38[184 * v35];
              do
              {
                long long v50 = *(_OWORD *)(v23 - 184);
                long long v51 = *(_OWORD *)(v23 - 168);
                long long v52 = *(_OWORD *)(v23 - 152);
                *(_OWORD *)(v49 - 136) = *(_OWORD *)(v23 - 136);
                *(_OWORD *)(v49 - 152) = v52;
                *(_OWORD *)(v49 - 168) = v51;
                *(_OWORD *)(v49 - 184) = v50;
                long long v53 = *(_OWORD *)(v23 - 120);
                long long v54 = *(_OWORD *)(v23 - 104);
                long long v55 = *(_OWORD *)(v23 - 88);
                *(_OWORD *)(v49 - 72) = *(_OWORD *)(v23 - 72);
                *(_OWORD *)(v49 - 88) = v55;
                *(_OWORD *)(v49 - 104) = v54;
                *(_OWORD *)(v49 - 120) = v53;
                long long v56 = *(_OWORD *)(v23 - 56);
                long long v57 = *(_OWORD *)(v23 - 40);
                long long v58 = *(_OWORD *)(v23 - 24);
                double v59 = v49 - 184;
                *((void *)v49 - 1) = *((void *)v23 - 1);
                *(_OWORD *)(v49 - 24) = v58;
                *(_OWORD *)(v49 - 40) = v57;
                *(_OWORD *)(v49 - 56) = v56;
                v23 -= 184;
                v49 -= 184;
              }
              while (v23 != v34);
            }
            uint64_t v33 = v39 + 184;
            std::string __p = v59;
            __dst = v39 + 184;
            unint64_t v75 = (unint64_t)&v38[184 * v37];
            if (v34) {
              operator delete(v34);
            }
          }
          else
          {
            long long v24 = buf;
            long long v25 = v109;
            long long v26 = *(_OWORD *)v111;
            *((_OWORD *)__dst + 2) = v110;
            *((_OWORD *)v23 + 3) = v26;
            *(_OWORD *)unint64_t v23 = v24;
            *((_OWORD *)v23 + 1) = v25;
            long long v27 = *(_OWORD *)&v111[16];
            long long v28 = *(_OWORD *)&v111[32];
            long long v29 = *(_OWORD *)&v111[64];
            *((_OWORD *)v23 + 6) = *(_OWORD *)&v111[48];
            *((_OWORD *)v23 + 7) = v29;
            *((_OWORD *)v23 + 4) = v27;
            *((_OWORD *)v23 + 5) = v28;
            long long v30 = *(_OWORD *)&v111[80];
            long long v31 = *(_OWORD *)v112;
            long long v32 = *(_OWORD *)&v112[16];
            *((void *)v23 + 22) = v113;
            *((_OWORD *)v23 + 9) = v31;
            *((_OWORD *)v23 + 10) = v32;
            *((_OWORD *)v23 + 8) = v30;
            uint64_t v33 = v23 + 184;
          }
          __dst = v33;
          v19 += 184;
        }
        while (v19 != v97);
      }
      if (v13 >= *(double *)(v5 + 32)) {
        goto LABEL_63;
      }
      uint64_t v70 = 0;
      uint64_t v71 = 0;
      uint64_t v72 = 0;
      uint64_t v60 = sub_1011E124C();
      BOOL v61 = sub_1011E1F30(v60, &v70);
      if (v61)
      {
        sub_100538668((uint64_t)&__p, (uint64_t)__dst, (char *)v70, v71, 0xD37A6F4DE9BD37A7 * ((v71 - (unsigned char *)v70) >> 3));
      }
      else
      {
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        __int16 v62 = qword_102419228;
        if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Query for historical summaries failed due to device lock", (uint8_t *)&buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_102419220 != -1) {
            dispatch_once(&qword_102419220, &stru_1022B9D18);
          }
          v69 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v69);
          if (v69 != (char *)&buf) {
            free(v69);
          }
        }
      }
      if (v70)
      {
        uint64_t v71 = (char *)v70;
        operator delete(v70);
      }
      if (v61)
      {
LABEL_63:
        if (v96)
        {
          v97 = (char *)v96;
          operator delete(v96);
        }
        goto LABEL_65;
      }
    }
    if (v96)
    {
      v97 = (char *)v96;
      operator delete(v96);
    }
    goto LABEL_71;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v11 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will not attempt retrocompute pre-processing, body metrics changed significantly.", (uint8_t *)&buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    *(_WORD *)dst = 0;
    v67 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retrocomputeSession:withHealthKitSample:withRetrocomputeHistory:]", "%s\n", v67);
    if (v67 != (char *)&buf) {
      free(v67);
    }
  }
  *(_DWORD *)(v5 + 136) |= 0x200u;
  -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 0);
  [(CLVO2MaxService *)self sendRetroComputeAnalytics];
  sub_1003B9898((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
  return 4;
}

- (void)persistRetrocomputeResultsToStagingTables:(VO2MaxRetrocomputeSessionResult *)a3
{
  var0 = a3->var3.var0;
  var1 = a3->var3.var1;
  if (var0 != var1)
  {
    uint64_t v7 = (char *)var0 + 88;
    do
    {
      v11[0] = 0;
      uint64_t v12 = 0;
      int64_t var4 = 0x7FEFFFFFFFFFFFFFLL;
      memset(v15, 0, sizeof(v15));
      LODWORD(v16) = 1;
      v11[1] = *((void *)v7 - 10);
      uuid_copy((unsigned __int8 *)v13, (const unsigned __int8 *)v7 - 64);
      uint64_t v12 = *((void *)v7 - 9);
      int64_t var4 = *((void *)v7 - 6);
      *(void *)&v15[0] = *((void *)v7 - 5);
      *(_OWORD *)((char *)v15 + 8) = *((_OWORD *)v7 - 2);
      *(_OWORD *)((char *)&v15[1] + 8) = *((_OWORD *)v7 - 1);
      *(_OWORD *)((char *)&v15[2] + 8) = *(_OWORD *)v7;
      *(_OWORD *)((char *)&v15[3] + 8) = *((_OWORD *)v7 + 1);
      *(_OWORD *)((char *)&v15[4] + 8) = *((_OWORD *)v7 + 2);
      *(_OWORD *)((char *)&v15[5] + 8) = *((_OWORD *)v7 + 3);
      *(_OWORD *)((char *)&v15[6] + 8) = *((_OWORD *)v7 + 4);
      *((void *)&v15[7] + 1) = *((void *)v7 + 10);
      uint64_t v16 = *((void *)v7 + 11);
      sub_1012C9038((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v11);
      uint64_t v8 = (VO2MaxSummary *)(v7 + 96);
      v7 += 184;
    }
    while (v8 != var1);
  }
  if (a3->var4.var2 > 0.0)
  {
    v13[0] = 0;
    memset((char *)&v15[4] + 8, 0, 24);
    *(void *)&v15[6] = 3;
    BYTE8(v15[6]) = 0;
    sub_100134750(&v15[7], "");
    double var2 = -1.0;
    v13[0] = *(void *)&a3->var4.var2;
    uuid_copy((unsigned __int8 *)&v15[1] + 8, a3->var4.var8);
    v13[1] = *(void *)&a3->var4.var3;
    int64_t var4 = a3->var4.var4;
    v15[0] = *(_OWORD *)&a3->var4.var5;
    *(double *)&v15[1] = a3->var4.var7;
    *(_OWORD *)((char *)&v15[2] + 8) = *(_OWORD *)&a3->var4.var9;
    DWORD2(v15[3]) = a3->var4.var11;
    WORD6(v15[3]) = *(_WORD *)&a3->var4.var12;
    LODWORD(v15[4]) = a3->var4.var14;
    long long v9 = *(_OWORD *)&a3->var4.var15;
    unsigned int v10 = a3->var5.var4 + 1;
    LODWORD(v15[6]) = 3;
    DWORD1(v15[6]) = v10;
    BYTE8(v15[6]) = a3->var2;
    *(_OWORD *)((char *)&v15[4] + 8) = v9;
    std::string::operator=((std::string *)&v15[7], (const std::string *)&a3->var5.var5);
    double var2 = a3->var5.var2;
    sub_1012C8F4C(self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v11);
    if (SHIBYTE(v16) < 0) {
      operator delete(*(void **)&v15[7]);
    }
  }
}

- (void)persistLostEstimateToStagingTables:(const void *)a3
{
  v4[0] = 0;
  v4[1] = *(void *)a3;
  uuid_copy(v5, (const unsigned __int8 *)a3 + 24);
  sub_1012C9494((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t)v4);
}

- (void)updateRetrocomputeHistory:(VO2MaxRetrocomputeHistory *)a3 withResult:(VO2MaxRetrocomputeSessionResult *)a4
{
  double var1 = a4->var1;
  a3->double var8 = var1;
  var9 = a3->var9;
  uuid_copy(a3->var9, a4->var0);
  if (a4->var4.var2 <= 0.0)
  {
    if (a3->var4 > 0.0 && a4->var5.var2 > -1.0)
    {
      ++a3->var14;
      [(CLVO2MaxService *)self persistLostEstimateToStagingTables:&a4->var5];
    }
  }
  else
  {
    if (a4->var5.var5.__r_.var0 <= 2)
    {
      if (a3->var4 == 0.0) {
        a3->double var4 = var1;
      }
      a3->double var7 = var1;
    }
    a3->double var6 = var1;
    double var2 = a4->var5.var2;
    if (var2 == -1.0)
    {
      ++a3->var13;
    }
    else
    {
      double v10 = a4->var4.var3 - var2;
      unsigned int var12 = a3->var12;
      double v12 = v10 + a3->var10 * (double)var12;
      double v13 = v10 / var2 + a3->var11 * (double)var12++;
      a3->unsigned int var12 = var12;
      a3->double var10 = v12 / (double)var12;
      a3->double var11 = v13 / (double)var12;
    }
  }
  if (a3->var5 == 0.0)
  {
    var0 = a4->var3.var0;
    if (var0 != a4->var3.var1) {
      a3->var5 = *((double *)var0 + 1);
    }
  }
  id v31 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:var9];
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  int v15 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = self;
    double v17 = a3->var1;
    int v18 = a3->var2;
    int var3 = a3->var3;
    double var8 = a3->var8;
    id v21 = [v31 UUIDString];
    double var4 = a3->var4;
    double var6 = a3->var6;
    double var7 = a3->var7;
    double var10 = a3->var10;
    double var11 = a3->var11;
    unsigned int v27 = a3->var12;
    unsigned int var13 = a3->var13;
    unsigned int var14 = a3->var14;
    *(_DWORD *)long long buf = 134286595;
    double v33 = v17;
    self = v16;
    __int16 v34 = 1025;
    int v35 = v18;
    __int16 v36 = 1025;
    int v37 = var3;
    __int16 v38 = 2049;
    double v39 = var8;
    __int16 v40 = 2113;
    id v41 = v21;
    __int16 v42 = 2049;
    double v43 = var4;
    __int16 v44 = 2049;
    double v45 = var6;
    __int16 v46 = 2049;
    double v47 = var7;
    __int16 v48 = 2049;
    double v49 = var10;
    __int16 v50 = 2049;
    double v51 = var11;
    __int16 v52 = 1025;
    unsigned int v53 = v27;
    __int16 v54 = 1025;
    unsigned int v55 = var13;
    __int16 v56 = 1025;
    unsigned int v57 = var14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating VO2MaxRetrocomputeHistory: startTime,%{private}f,algVersion,%{private}d,status,%{private}d,lastSessionTimestamp,%{private}f,lastSessionId,%{private}@,firstSampleDate,%{private}f,lastSampleDate,%{private}f,lastSampleDatePrevAlg,%{private}f,meanDelta,%{private}f,meanPercentileDelta,%{private}f,numUpdatedEstimates,%{private}d,numNewEstimates,%{private}d,numLostEstimates,%{private}d", buf, 0x70u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    [v31 UUIDString];
    long long v30 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistory:withResult:]", "%s\n", v30);
    if (v30 != (char *)buf) {
      free(v30);
    }
  }
  sub_1007F1A90((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)a3, a3->var0);
}

- (unsigned)updateRetrocomputeHistoryPostProcessing:(VO2MaxRetrocomputeHistory *)a3
{
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  if (sub_1012C9180((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v74) == 100)
  {
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    if (sub_1012C91EC(self->fStagingOutputStore.__ptr_.__value_, &v71) == 100)
    {
      std::string __p = 0;
      v69 = 0;
      uint64_t v70 = 0;
      uint64_t v5 = v74;
      uint64_t v6 = v75;
      if (v74 == v75)
      {
        a3->var17 = 0.0;
        double v41 = 0.0;
        double v40 = 0.0;
      }
      else
      {
        int v7 = 0;
        int v8 = 0;
        double v9 = 0.0;
        double v10 = 0.0;
        double v63 = 0.0;
        double v64 = 0.0;
        double v11 = 0.0;
        double v12 = 0.0;
        do
        {
          *(_OWORD *)long long buf = *(_OWORD *)v5;
          long long v13 = *(_OWORD *)(v5 + 16);
          long long v14 = *(_OWORD *)(v5 + 32);
          long long v15 = *(_OWORD *)(v5 + 64);
          *(_OWORD *)&v98[16] = *(_OWORD *)(v5 + 48);
          long long v99 = v15;
          *(_OWORD *)&uint8_t buf[16] = v13;
          *(_OWORD *)uint64_t v98 = v14;
          long long v16 = *(_OWORD *)(v5 + 80);
          long long v17 = *(_OWORD *)(v5 + 96);
          long long v18 = *(_OWORD *)(v5 + 128);
          long long v102 = *(_OWORD *)(v5 + 112);
          long long v103 = v18;
          long long v100 = v16;
          long long v101 = v17;
          uint64_t v19 = *(void *)(v5 + 144);
          char v105 = *(unsigned char *)(v5 + 152);
          uint64_t v104 = v19;
          if (*(char *)(v5 + 183) < 0)
          {
            sub_1000DC48C(&v106, *(void **)(v5 + 160), *(void *)(v5 + 168));
          }
          else
          {
            long long v20 = *(_OWORD *)(v5 + 160);
            uint64_t v107 = *(void *)(v5 + 176);
            long long v106 = v20;
          }
          double v21 = *(double *)(v5 + 184);
          double v108 = v21;
          if (v21 <= 0.0)
          {
            double v26 = v12;
            double v22 = v11;
            double v23 = v10;
            double v24 = v9;
          }
          else
          {
            double v22 = 0.0;
            double v23 = 0.0;
            double v24 = v21;
            if (v8)
            {
              double v24 = v9 + (v21 - v9) / (double)(v8 + 1);
              double v23 = v10 + (v21 - v9) * (v21 - v24);
              double v64 = v23;
            }
            int v25 = v7 + 1;
            double v26 = *(double *)v98;
            if (v7)
            {
              double v26 = v12 + (*(double *)v98 - v12) / (double)v25;
              double v22 = v11 + (*(double *)v98 - v12) * (*(double *)v98 - v26);
              double v63 = v22;
            }
            double v27 = *(double *)v98 - v21;
            long long v28 = v69;
            if (v69 >= v70)
            {
              long long v30 = (double *)__p;
              uint64_t v31 = ((char *)v69 - (unsigned char *)__p) >> 3;
              unint64_t v32 = v31 + 1;
              if ((unint64_t)(v31 + 1) >> 61) {
                sub_1001D7FD4();
              }
              uint64_t v33 = (char *)v70 - (unsigned char *)__p;
              if (((char *)v70 - (unsigned char *)__p) >> 2 > v32) {
                unint64_t v32 = v33 >> 2;
              }
              if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v34 = v32;
              }
              if (v34)
              {
                int v35 = (char *)sub_1000DA54C((uint64_t)&v70, v34);
                long long v30 = (double *)__p;
                long long v28 = v69;
              }
              else
              {
                int v35 = 0;
              }
              __int16 v36 = (double *)&v35[8 * v31];
              double *v36 = v27;
              long long v29 = v36 + 1;
              while (v28 != v30)
              {
                uint64_t v37 = *((void *)v28-- - 1);
                *((void *)v36-- - 1) = v37;
              }
              std::string __p = v36;
              v69 = v29;
              uint64_t v70 = (double *)&v35[8 * v34];
              if (v30) {
                operator delete(v30);
              }
            }
            else
            {
              double *v69 = v27;
              long long v29 = v28 + 1;
            }
            v69 = v29;
            ++v8;
            int v7 = v25;
          }
          if (SHIBYTE(v107) < 0) {
            operator delete((void *)v106);
          }
          v5 += 192;
          double v9 = v24;
          double v10 = v23;
          double v11 = v22;
          double v12 = v26;
        }
        while (v5 != v6);
        double v38 = 0.0;
        double v39 = 0.0;
        if (__p != v69) {
          double v39 = sub_10126DA1C((uint64_t)&__p, 90);
        }
        a3->var17 = v39;
        if (v7 >= 2) {
          double v38 = v63 / (double)(v7 - 1);
        }
        double v40 = 0.0;
        double v41 = sqrt(v38);
        if (v8 >= 2) {
          double v40 = v64 / (double)(v8 - 1);
        }
      }
      a3->var18 = v41 - sqrt(v40);
      double v67 = 15552000.0;
      uint64_t v45 = sub_1000D3E78();
      sub_10006B564(v45, buf);
      sub_1000A699C(*(uint64_t *)buf, "VO2MaxRetrocomputeMinPrevAlgSampleInterval", &v67);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      double v46 = a3->var7 - a3->var4;
      if (v46 >= v67 || self->fShouldBypassPreviousSampleInternal)
      {
        int v47 = 0;
      }
      else
      {
        a3->var19 |= 8u;
        int v47 = 1;
      }
      double v66 = 0.9;
      uint64_t v48 = sub_1000D3E78();
      sub_10006B564(v48, buf);
      sub_1000A699C(*(uint64_t *)buf, "VO2MaxRetrocomputeMinEstimatesUpdatedRatio", &v66);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      double v49 = (double)a3->var12 / (double)(a3->var14 + a3->var12 + a3->var15);
      if (!a3->var3 && v49 < v66 && !self->fShouldBypassMinEstimatesUpdatedRatio)
      {
        a3->var19 |= 0x10u;
        int v47 = 1;
      }
      double v65 = 1.0;
      uint64_t v50 = sub_1000D3E78();
      sub_10006B564(v50, buf);
      sub_1000A699C(*(uint64_t *)buf, "VO2MaxRetrocomputeMinMeanDelta", &v65);
      if (*(void *)&buf[8]) {
        sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
      }
      if (!a3->var3 && fabs(a3->var10) < v65 && !self->fShouldBypassMinDelta)
      {
        a3->var19 |= 0x20u;
        int v47 = 1;
      }
      uint64_t v51 = v71;
      uint64_t v52 = v72;
      if (v71 != v72)
      {
        a3->var19 |= 0x40u;
        int v47 = 1;
      }
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      unsigned int v53 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        double var10 = a3->var10;
        int var3 = a3->var3;
        *(_DWORD *)long long buf = 134285825;
        *(double *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2049;
        *(double *)&buf[14] = v67;
        *(_WORD *)&buf[22] = 2049;
        *(double *)&buf[24] = v49;
        *(_WORD *)uint64_t v98 = 2049;
        *(double *)&v98[2] = v66;
        *(_WORD *)&v98[10] = 2049;
        *(double *)&v98[12] = var10;
        *(_WORD *)&v98[20] = 2049;
        *(double *)&v98[22] = v65;
        *(_WORD *)&v98[30] = 1026;
        LODWORD(v99) = v51 != v52;
        WORD2(v99) = 1025;
        *(_DWORD *)((char *)&v99 + 6) = v47;
        WORD5(v99) = 1026;
        HIDWORD(v99) = var3;
        LOWORD(v100) = 1026;
        *(_DWORD *)((char *)&v100 + 2) = v47 ^ 1;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "VO2MaxRetrocomputeHistory data checks: prevAlgSampleInterval,%{private}f,minPrevAlgSampleInterval,%{private}f,estimatesUpdatedRatio,%{private}f,minEstimatesUpdatedRatio,%{private}f,meanDelta,%{private}f,minMeanDelta,%{private}f,badStagingDataExists,%{public}d,failedDataCheck,%{private}d,oldRetrocomputeStatus,%{public}d,newRetrocomputeStatus,%{public}d", buf, 0x56u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        double v60 = a3->var10;
        int v61 = a3->var3;
        int v77 = 134285825;
        double v78 = v46;
        __int16 v79 = 2049;
        double v80 = v67;
        __int16 v81 = 2049;
        double v82 = v49;
        __int16 v83 = 2049;
        double v84 = v66;
        __int16 v85 = 2049;
        double v86 = v60;
        __int16 v87 = 2049;
        double v88 = v65;
        __int16 v89 = 1026;
        BOOL v90 = v51 != v52;
        __int16 v91 = 1025;
        int v92 = v47;
        __int16 v93 = 1026;
        int v94 = v61;
        __int16 v95 = 1026;
        int v96 = v47 ^ 1;
        __int16 v62 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v62);
        if (v62 != buf) {
          free(v62);
        }
      }
      if (a3->var3 == 1) {
        char v56 = 1;
      }
      else {
        char v56 = v47;
      }
      if ((v56 & 1) == 0) {
        a3->var20 = CFAbsoluteTimeGetCurrent();
      }
      a3->int var3 = v47 ^ 1;
      sub_1007F1A90((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)a3, a3->var0);
      if (__p)
      {
        v69 = (double *)__p;
        operator delete(__p);
      }
      unsigned int v43 = 0;
    }
    else
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      __int16 v44 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Unable to check for bad staging data due to device lock", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        LOWORD(v77) = 0;
        double v59 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v59);
        if (v59 != buf) {
          free(v59);
        }
      }
      unsigned int v43 = 2;
    }
    *(void *)long long buf = &v71;
    sub_100538BA4((void ***)buf);
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    __int16 v42 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Unable to query for staging output due to device lock", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v77) = 0;
      long long v58 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService updateRetrocomputeHistoryPostProcessing:]", "%s\n", v58);
      if (v58 != buf) {
        free(v58);
      }
    }
    unsigned int v43 = 2;
  }
  *(void *)long long buf = &v74;
  sub_100538BA4((void ***)buf);
  return v43;
}

- (void)triggerRetrocomputeWithReply:(id)a3
{
  sub_1000E1294((uint64_t *)v21, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
  self->fTriggerRetrocomputeInProgress = 1;
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrocompute triggered", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    LOWORD(v28) = 0;
    long long v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
  [(CLVO2MaxService *)self updateRetrocomputeStatus:2 unavailableReasons:0];
  self->fUpdateRetrocomputedDataSuccess = 0;
  self->fUpdateRetrocomputedDataAttempts = 0;
  self->fDeleteHealthKitSamplesSuccess = 0;
  self->fDeleteHealthKitSamplesAttempts = 0;
  sub_100538BF8((uint64_t *)&self->fPendingHealthKitWrites);
  uint64_t v6 = sub_1012C9180((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t *)&self->fPendingHealthKitWrites);
  if (v6 != 100)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v16 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to query for staging output: %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      int v28 = 67109120;
      int v29 = v6;
      uint64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    [(CLVO2MaxService *)self updateRetrocomputeStatus:1 unavailableReasons:0];
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
    goto LABEL_22;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 100);
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ == end)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v17 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No staging data found", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v28) = 0;
      long long v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService triggerRetrocomputeWithReply:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    [(CLVO2MaxService *)self updateRetrocomputeStatus:3 unavailableReasons:0];
    sub_1003B9898((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
LABEL_22:
    self->fTriggerRetrocomputeInProgress = 0;
    goto LABEL_26;
  }
  v22[0] = *(_OWORD *)end[-1].var1;
  long long v8 = *(_OWORD *)&end[-1].var2;
  long long v9 = *(_OWORD *)&end[-1].var4;
  long long v10 = *(_OWORD *)end[-1].var8;
  v22[3] = *(_OWORD *)&end[-1].var6;
  v22[4] = v10;
  v22[1] = v8;
  v22[2] = v9;
  long long v11 = *(_OWORD *)&end[-1].var9;
  long long v12 = *(_OWORD *)&end[-1].var11;
  long long v13 = *(_OWORD *)&end[-1].var17;
  v22[7] = *(_OWORD *)&end[-1].var15;
  v22[8] = v13;
  v22[5] = v11;
  v22[6] = v12;
  uint64_t v14 = *(void *)&end[-1].var20;
  char v24 = end[-1].var21.__r_.__value_.var0.var0.__data_[0];
  uint64_t v23 = v14;
  if (*((char *)&end[-1].var21.__r_.var1 + 3) < 0)
  {
    sub_1000DC48C(&__p, (void *)end[-1].var21.__r_.__value_.var0.var1.__size_, *((void *)&end[-1].var21.__r_.__value_.var0.var1 + 2));
  }
  else
  {
    long long v15 = *(_OWORD *)&end[-1].var21.__r_.__value_.var0.var1.__size_;
    uint64_t v26 = *(void *)&end[-1].var21.__r_.var0;
    long long __p = v15;
  }
  int64_t var0 = end[-1].var21.var0;
  [(CLVO2MaxService *)self saveStagingOutputToHealthKit:v22 activity:0];
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)__p);
  }
LABEL_26:
  sub_1000E1098(v21);
}

- (void)saveStagingOutputToHealthKit:(VO2MaxStagingOutput *)a3 activity:
{
  uint64_t v4 = v3;
  id v7 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierVO2Max];
  double var2 = a3->var2;
  long long v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:var2];
  long long v10 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:@"ml/(kg*min)"], round(a3->var3 * 100.0) / 100.0);
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a3->var8];
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v12 setObject:&off_102392648 forKeyedSubscript:HKMetadataKeyVO2MaxTestType];
  if (a3->var20) {
    long long v13 = &__kCFBooleanTrue;
  }
  else {
    long long v13 = &__kCFBooleanFalse;
  }
  [v12 setObject:v13 forKeyedSubscript:_HKPrivateMetadataKeyUserOnBetaBlocker];
  [v12 setObject:[v11 UUIDString] forKeyedSubscript:HKMetadataKeySyncIdentifier];
  [v12 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var19) forKeyedSubscript:HKMetadataKeySyncVersion];
  uint64_t v14 = +[HKQuantitySample quantitySampleWithType:v7 quantity:v10 startDate:v9 endDate:v9 metadata:v12];
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  long long v15 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v31 = [v11 UUIDString];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Adding retrocomputed sample to HKHealthStore: %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v28 = 138543362;
    id v29 = [v11 UUIDString];
    uint64_t v23 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService saveStagingOutputToHealthKit:activity:]", "%s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  id v16 = [[objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor") proxyForService:@"CLVO2MaxService"];
  if (*((char *)&a3->var21.__r_.__value_.var0.var1 + 23) < 0)
  {
    if (a3->var21.__r_.__value_.var0.var1.__size_) {
      goto LABEL_11;
    }
LABEL_15:
    fHkHealthStore = self->fHkHealthStore;
    double v27 = v14;
    uint64_t v19 = +[NSArray arrayWithObjects:&v27 count:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100532684;
    v25[3] = &unk_1022B9CA8;
    v25[4] = v16;
    v25[5] = v4;
    *(double *)&v25[6] = var2;
    long long v20 = v25;
    double v21 = fHkHealthStore;
    goto LABEL_16;
  }
  if (!*((unsigned char *)&a3->var21.__r_.__value_.var0.var1 + 23)) {
    goto LABEL_15;
  }
LABEL_11:
  p_var21 = &a3->var21;
  long long v18 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
  if (*((char *)&a3->var21.__r_.__value_.var0.var1 + 23) < 0) {
    p_var21 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_var21->__r_.__value_.var0.var1.__data_;
  }
  [(HKHealthStore *)v18 setSourceBundleIdentifier:+[NSString stringWithUTF8String:p_var21]];
  [(HKHealthStore *)v18 resume];
  uint64_t v26 = v14;
  uint64_t v19 = +[NSArray arrayWithObjects:&v26 count:1];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100532978;
  v24[3] = &unk_1022B9CA8;
  v24[4] = v16;
  v24[5] = v4;
  *(double *)&v24[6] = var2;
  long long v20 = v24;
  double v21 = v18;
LABEL_16:
  [(HKHealthStore *)v21 saveObjects:v19 withCompletion:v20];
}

- (void)onRetrocomputeHealthKitSampleSavedWithStartTime:(double)a3 activity:(id)a4
{
  p_fPendingHealthKitWrites = &self->fPendingHealthKitWrites;
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ != end && end[-1].var3 == a3)
  {
    if (![(CLVO2MaxService *)self updateRetrocomputeLastTimestampToHealthKit:a3])
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      long long v13 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134283521;
        double v41 = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to update retrocompute history record with lastTimestampToHealthKit (%{private}f). Will attempt to proceed with remaining HealthKit writes.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        int v34 = 134283521;
        double v35 = a3;
        double v27 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService onRetrocomputeHealthKitSampleSavedWithStartTime:activity:]", "%s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
    }
    self->fUpdateRetrocomputedDataAttempts = 0;
    uint64_t v14 = p_fPendingHealthKitWrites->__end_;
    if (*((char *)&v14[-1].var21.__r_.var1 + 3) < 0) {
      operator delete((void *)v14[-1].var21.__r_.__value_.var0.var1.__size_);
    }
    p_fPendingHealthKitWrites->__end_ = (VO2MaxStagingOutput *)((char *)v14 - 192);
    if (p_fPendingHealthKitWrites->__begin_ == (VO2MaxStagingOutput *)v14[-1].var1)
    {
      [(CLVO2MaxService *)self promoteStagingData:a4];
    }
    else
    {
      v28[0] = *(_OWORD *)&v14[-2].var1[8];
      long long v15 = *(_OWORD *)&v14[-2].var3;
      long long v16 = *(_OWORD *)&v14[-2].var5;
      long long v17 = *(_OWORD *)&v14[-2].var8[8];
      v28[3] = *(_OWORD *)&v14[-2].var7;
      v28[4] = v17;
      v28[1] = v15;
      v28[2] = v16;
      long long v18 = *(_OWORD *)&v14[-2].var10;
      long long v19 = *(_OWORD *)&v14[-2].var14;
      long long v20 = *(_OWORD *)&v14[-2].var18;
      v28[7] = *(_OWORD *)&v14[-2].var16;
      v28[8] = v20;
      v28[5] = v18;
      v28[6] = v19;
      data = v14[-2].var21.__r_.__value_.var0.var1.__data_;
      char v30 = v14[-2].var21.__r_.__value_.var0.var0.__data_[8];
      id v29 = data;
      if (SHIBYTE(v14[-2].var21.var0) < 0)
      {
        sub_1000DC48C(&__p, *((void **)&v14[-2].var21.__r_.__value_.var0.var1 + 2), *(void *)&v14[-2].var21.__r_.var0);
      }
      else
      {
        long long v22 = *((_OWORD *)&v14[-2].var21.__r_.__value_.var0.var1 + 1);
        int64_t var0 = v14[-2].var21.var0;
        long long __p = v22;
      }
      unint64_t v33 = v14[-1].var0;
      [(CLVO2MaxService *)self saveStagingOutputToHealthKit:v28 activity:a4];
      if (SHIBYTE(var0) < 0) {
        operator delete((void *)__p);
      }
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v9 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      long long v10 = p_fPendingHealthKitWrites->__end_;
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)p_fPendingHealthKitWrites->__begin_) >> 6);
      if (v10 == p_fPendingHealthKitWrites->__begin_) {
        double var3 = 0.0;
      }
      else {
        double var3 = v10[-1].var3;
      }
      *(_DWORD *)long long buf = 134349569;
      double v41 = *(double *)&v11;
      __int16 v42 = 2049;
      double v43 = a3;
      __int16 v44 = 2049;
      double v45 = var3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Will retry retrocompute trigger due to unexpected state. fPendingHealthKitWrites count: %{public}lu, expected sample startTime: %{private}f, actual sample startTime: %{private}f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      uint64_t v23 = p_fPendingHealthKitWrites->__end_;
      unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)p_fPendingHealthKitWrites->__begin_) >> 6);
      if (v23 == p_fPendingHealthKitWrites->__begin_) {
        double v25 = 0.0;
      }
      else {
        double v25 = v23[-1].var3;
      }
      int v34 = 134349569;
      double v35 = *(double *)&v24;
      __int16 v36 = 2049;
      double v37 = a3;
      __int16 v38 = 2049;
      double v39 = v25;
      uint64_t v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService onRetrocomputeHealthKitSampleSavedWithStartTime:activity:]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }
    if (a4) {
      [(CLVO2MaxService *)self markXpcActivityDone:a4];
    }
    else {
      [(CLVO2MaxService *)self retryTriggerRetrocompute];
    }
  }
}

- (void)onRetrocomputeHealthKitSampleFailed:(id)a3
{
  if (a3) {
    -[CLVO2MaxService markXpcActivityDone:](self, "markXpcActivityDone:");
  }
  else {
    [(CLVO2MaxService *)self retryTriggerRetrocompute];
  }
}

- (void)promoteStagingData:(id)a3
{
  int v5 = sub_1012C917C(self->fStagingOutputStore.__ptr_.__value_, a2);
  if (v5 != 100)
  {
    int v6 = v5;
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    id v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not promote staging data: %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      long long v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService promoteStagingData:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    if (!a3)
    {
      [(CLVO2MaxService *)self retryTriggerRetrocompute];
      return;
    }
LABEL_10:
    [(CLVO2MaxService *)self markXpcActivityDone:a3];
    return;
  }
  [(CLVO2MaxService *)self updateRetrocomputeStatus:3 unavailableReasons:0];
  self->fUpdateRetrocomputedDataSuccess = 1;
  sub_1003B9898((uint64_t)self->fRetrocomputeBodyMetricsDb.__ptr_.__value_);
  [(CLVO2MaxService *)self deleteHealthKitSamples:1];
  self->fTriggerRetrocomputeInProgress = 0;
  if (a3) {
    goto LABEL_10;
  }
}

- (void)retryTriggerRetrocompute
{
  self->fTriggerRetrocomputeInProgress = 1;
  self->fUpdateRetrocomputedDataSuccess = 0;
  self->fUpdateRetrocomputedDataAttempts = 0;
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  uint64_t v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    int v10 = "com.apple.locationd.VO2Max.RetrocomputeRetryTrigger";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up %{public}s activity", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v7 = 136446210;
    long long v8 = "com.apple.locationd.VO2Max.RetrocomputeRetryTrigger";
    int v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retryTriggerRetrocompute]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1005336B4;
  handler[3] = &unk_1022B9CD0;
  handler[4] = [objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor") proxyForService:@"CLVO2MaxService"];
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger", v4, handler);
  xpc_release(v4);
}

- (void)onRetryTriggerRetrocompute:(id)a3
{
  if (!a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1)
    {
LABEL_21:
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService onRetryTriggerRetrocompute:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
      return;
    }
LABEL_23:
    dispatch_once(&qword_102419220, &stru_1022B9D18);
    goto LABEL_21;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    [(CLVO2MaxService *)self handleRetryTriggerRetrocompute:a3];
    return;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  long long v8 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 134217984;
    xpc_activity_state_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
}

- (void)handleRetryTriggerRetrocompute:(id)a3
{
  sub_1000E1294((uint64_t *)v17, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
  v29[0] = 0;
  v29[1] = 0;
  int v30 = 3;
  v35[4] = 0.0;
  long long v31 = 0u;
  memset(v32, 0, sizeof(v32));
  long long v33 = 0u;
  long long v34 = 0u;
  memset(v35, 0, 28);
  if (self->fUpdateRetrocomputedDataSuccess)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrying retrocompute trigger already succeeded, cancelling activity", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_7;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    LOWORD(v21) = 0;
    long long v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v13);
    if (v13 == (char *)buf) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
  if (sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v29) == 109)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    xpc_activity_state_t v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to query for retrocompute history due to device lock", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_16;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    LOWORD(v21) = 0;
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v14);
    if (v14 == (char *)buf) {
      goto LABEL_16;
    }
    goto LABEL_55;
  }
  if (v31 != 2)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v8 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67240448;
      int v26 = v31;
      __int16 v27 = 1026;
      int v28 = v30;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will not attempt to retry retrocompute trigger, status: %{public}d, algVersion: %{public}d", buf, 0xEu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_7;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v21 = 67240448;
    int v22 = v31;
    __int16 v23 = 1026;
    int v24 = v30;
    long long v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v13);
    if (v13 == (char *)buf) {
      goto LABEL_7;
    }
LABEL_51:
    free(v13);
LABEL_7:
    [(CLVO2MaxService *)self markXpcActivityDone:a3];
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryTrigger");
LABEL_8:
    self->fTriggerRetrocomputeInProgress = 0;
    goto LABEL_9;
  }
  if (self->fUpdateRetrocomputedDataAttempts >= 3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Giving up attempting to retry retrocompute trigger", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v21) = 0;
      long long v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    [(CLVO2MaxService *)self markXpcActivityDone:a3];
    xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete");
    if (v35[0] == 0.0) {
      -[CLVO2MaxService updateRetrocomputeStatus:unavailableReasons:](self, "updateRetrocomputeStatus:unavailableReasons:", 1, 0, v35[0]);
    }
    goto LABEL_8;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  long long v9 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrying retrocompute trigger", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    LOWORD(v21) = 0;
    long long v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  ++self->fUpdateRetrocomputedDataAttempts;
  self->fDeleteHealthKitSamplesSuccess = 0;
  self->fDeleteHealthKitSamplesAttempts = 0;
  sub_100538BF8((uint64_t *)&self->fPendingHealthKitWrites);
  int v10 = sub_1012C9180((uint64_t)self->fStagingOutputStore.__ptr_.__value_, (uint64_t *)&self->fPendingHealthKitWrites);
  if (v10 != 100)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    id v12 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to query for staging output: %d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_16;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v21 = 67109120;
    int v22 = v10;
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService handleRetryTriggerRetrocompute:]", "%s\n", v14);
    if (v14 == (char *)buf) {
      goto LABEL_16;
    }
LABEL_55:
    free(v14);
LABEL_16:
    [(CLVO2MaxService *)self markXpcActivityDone:a3];
    goto LABEL_9;
  }
  end = self->fPendingHealthKitWrites.__end_;
  if (self->fPendingHealthKitWrites.__begin_ == end)
  {
    [(CLVO2MaxService *)self promoteStagingData:a3];
  }
  else
  {
    sub_100531B4C((uint64_t)v18, (uint64_t)end[-1].var1);
    [(CLVO2MaxService *)self saveStagingOutputToHealthKit:v18 activity:a3];
    if (v20 < 0) {
      operator delete(__p);
    }
  }
LABEL_9:
  sub_1000E1098(v17);
}

- (void)deleteHealthKitSamples:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  int v5 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Attempting to delete samples without estimates in HKHealthStore", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    LOWORD(v15) = 0;
    long long v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  long long v15 = 0;
  long long v16 = 0;
  uint64_t v17 = 0;
  if (sub_1012C9588((uint64_t)self->fStagingOutputStore.__ptr_.__value_, &v15) == 100)
  {
    if (v15 == v16)
    {
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      int v7 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No sessions to delete from HKHealthStore", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        __int16 v14 = 0;
        int v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
    else
    {
      long long __p = 0;
      id v12 = 0;
      uint64_t v13 = 0;
      sub_1004EC468(&__p, v15, (uint64_t)v16, (v16 - (unsigned char *)v15) >> 5);
      [(CLVO2MaxService *)self deleteSessionsFromHealthKit:&__p withRetry:v3];
      if (__p)
      {
        id v12 = __p;
        operator delete(__p);
      }
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    xpc_activity_state_t v6 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to fetch sessions without estimates", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      __int16 v14 = 0;
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService deleteHealthKitSamples:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    if (v3) {
      [(CLVO2MaxService *)self retryHealthKitDeleteSamples];
    }
  }
  if (v15)
  {
    long long v16 = v15;
    operator delete(v15);
  }
}

- (void)retryHealthKitDeleteSamples
{
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  BOOL v3 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setting up activity to attempt deleting sessions without estimates from HKHealthStore", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    __int16 v7 = 0;
    int v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService retryHealthKitDeleteSamples]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 30);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100534D14;
  handler[3] = &unk_1022B9CD0;
  handler[4] = [objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor") proxyForService:@"CLVO2MaxService"];
  xpc_activity_register("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete", v4, handler);
  xpc_release(v4);
}

- (void)onRetryHealthKitDeleteSamples:(id)a3
{
  if (!a3)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    __int16 v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1)
    {
LABEL_19:
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxService onRetryHealthKitDeleteSamples:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
      return;
    }
LABEL_21:
    dispatch_once(&qword_102419220, &stru_1022B9D18);
    goto LABEL_19;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    sub_1000E1294((uint64_t *)buf, (uint64_t)"com.apple.locationd.VO2MaxService.Retrocompute", 0);
    [(CLVO2MaxService *)self handleRetryHealthKitDeleteSamples:a3];
    sub_1000E1098((id *)buf);
    return;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  long long v8 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 134217984;
    xpc_activity_state_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
}

- (void)handleRetryHealthKitDeleteSamples:(id)a3
{
  if (self->fDeleteHealthKitSamplesSuccess)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    int v5 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HealthKit samples without an estimate have been deleted, cancelling activity", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1)
    {
LABEL_27:
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryHealthKitDeleteSamples:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
LABEL_21:
      [(CLVO2MaxService *)self markXpcActivityDone:a3];
      xpc_activity_unregister("com.apple.locationd.VO2Max.RetrocomputeRetryHealthKitDelete");
      return;
    }
LABEL_29:
    dispatch_once(&qword_102419220, &stru_1022B9D18);
    goto LABEL_27;
  }
  if (self->fDeleteHealthKitSamplesAttempts > 2)
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    __int16 v7 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Giving up attempting to delete HealthKit samples without an estimate", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419220 == -1) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  if (qword_102419220 != -1) {
    dispatch_once(&qword_102419220, &stru_1022B9D18);
  }
  xpc_activity_state_t v6 = qword_102419228;
  if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to retry deleting HealthKit samples without an estimate", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    long long v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService handleRetryHealthKitDeleteSamples:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  ++self->fDeleteHealthKitSamplesAttempts;
  [(CLVO2MaxService *)self deleteHealthKitSamples:0];
  [(CLVO2MaxService *)self markXpcActivityDone:a3];
}

- (void)deleteSessionsFromHealthKit:()vector<VO2MaxStagingLostEstimate withRetry:(std:(BOOL)a4 :allocator<VO2MaxStagingLostEstimate>> *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  int64_t var0 = a3->var0;
  double var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      long long v8 = *((_OWORD *)var0 + 1);
      long long v27 = *(_OWORD *)var0;
      long long v28 = v8;
      id v9 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v28];
      [v5 addObject:[v9 UUIDString]];
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      int v10 = qword_102419228;
      if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [v9 UUIDString];
        *(_DWORD *)long long buf = 138412290;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Deleting session %@ from HKHealthStore", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419220 != -1) {
          dispatch_once(&qword_102419220, &stru_1022B9D18);
        }
        int v23 = 138412290;
        id v24 = [v9 UUIDString];
        id v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService deleteSessionsFromHealthKit:withRetry:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }

      int64_t var0 = (VO2MaxStagingLostEstimate *)((char *)var0 + 32);
    }
    while (var0 != var1);
  }
  if ([v5 count])
  {
    id v13 = [[objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor") proxyForService:@"CLVO2MaxService"];
    id v14 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierVO2Max];
    id v15 = +[HKSampleQuery predicateForObjectsWithMetadataKey:HKMetadataKeySyncIdentifier allowedValues:v5];
    fHkHealthStore = self->fHkHealthStore;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    id v21[2] = sub_100535A7C;
    v21[3] = &unk_1022B9CF8;
    BOOL v22 = a4;
    v21[4] = self;
    v21[5] = v13;
    [(HKHealthStore *)fHkHealthStore deleteObjectsOfType:v14 predicate:v15 withCompletion:v21];
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    uint64_t v17 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No sessions found without estimates to delete from HKHealthStore", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      LOWORD(v27) = 0;
      long long v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService deleteSessionsFromHealthKit:withRetry:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
}

- (void)updateRetrocomputeStatus:(int)a3 unavailableReasons:(unsigned int)a4
{
  v25[0] = 0;
  v25[1] = 0;
  int v26 = 3;
  uint64_t v32 = 0;
  long long v27 = 0u;
  memset(v28, 0, sizeof(v28));
  long long v29 = 0u;
  long long v30 = 0u;
  memset(v31, 0, 28);
  if (sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v25) == 100)
  {
    int v7 = v27;
    LODWORD(v27) = a3;
    DWORD2(v31[1]) = a4;
    sub_1007F1A90((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)v25, v25[0]);
    if (v7 != a3)
    {
      id v8 = objc_alloc((Class)NSDate);
      id v9 = [v8 initWithTimeIntervalSinceReferenceDate:*(double *)((char *)&v27 + 4)];
      id v10 = objc_alloc((Class)NSDate);
      id v11 = [v10 initWithTimeIntervalSinceReferenceDate:*(double *)&v28[1]];
      id v12 = objc_alloc((Class)NSNumber);
      id v13 = [v12 initWithDouble:*(double *)&v29];
      id v14 = [objc_alloc((Class)CMVO2MaxRetrocomputeState) initWithStatus:(int)v27 startDate:v9 endDate:v11 meanDelta:v13];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = [(CLVO2MaxService *)self retrocomputeStatusClients];
      id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          long long v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) onRetrocomputeStatusUpdate:v14];
            long long v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v17);
      }
      if (a3 == 3) {
        [objc_msgSend(-[CLVO2MaxService universe](self, "universe"), "vendor").proxyForService:@"CLVO2MaxCloudKitManager"].saveRetrocomputedOutputs;
      }
    }
  }
}

- (BOOL)updateRetrocomputeLastTimestampToHealthKit:(double)a3
{
  v6[0] = 0;
  v6[1] = 0;
  int v7 = 3;
  uint64_t v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, 28);
  memset(&v9[44], 0, 60);
  if (sub_100081B10((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, 3, (uint64_t)v6) != 100) {
    return 0;
  }
  *(double *)&v9[76] = a3;
  return sub_1007F1A90((uint64_t)self->fRetrocomputeDb.__ptr_.__value_, (uint64_t)v6, v6[0]);
}

- (BOOL)validateBodyMetrics
{
  p_fOriginalBodyMetrics = &self->fOriginalBodyMetrics;
  p_fUserInfo = &self->fUserInfo;
  if (self->fOriginalBodyMetrics.biologicalSex == self->fUserInfo.biologicalSex
    && vabds_f32(self->fOriginalBodyMetrics.age, self->fUserInfo.age) <= 3.0
    && vabds_f32(self->fOriginalBodyMetrics.heightM, self->fUserInfo.heightM) <= 0.0254
    && vabds_f32(self->fOriginalBodyMetrics.weightKG, self->fUserInfo.weightKG) <= 9.08)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    xpc_object_t v4 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      int biologicalSex = p_fUserInfo->biologicalSex;
      double age = p_fUserInfo->age;
      double heightM = p_fUserInfo->heightM;
      double weightKG = p_fUserInfo->weightKG;
      int v9 = p_fOriginalBodyMetrics->biologicalSex;
      double v10 = p_fOriginalBodyMetrics->age;
      double v11 = p_fOriginalBodyMetrics->heightM;
      double v12 = p_fOriginalBodyMetrics->weightKG;
      *(_DWORD *)long long buf = 67176449;
      int v17 = biologicalSex;
      __int16 v18 = 2049;
      double v19 = age;
      __int16 v20 = 2049;
      double v21 = heightM;
      __int16 v22 = 2049;
      double v23 = weightKG;
      __int16 v24 = 1025;
      int v25 = v9;
      __int16 v26 = 2049;
      double v27 = v10;
      __int16 v28 = 2049;
      double v29 = v11;
      __int16 v30 = 2049;
      double v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Significant change in BodyMetrics during pre-processing. Original values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f\n\nCurrent values -- biologicalSex: %{private}d, age: %{private}f, height: %{private}f, weight: %{private}f", buf, 0x4Au);
    }
    BOOL v13 = sub_10013D1A0(115, 2);
    if (v13)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_1022B9D18);
      }
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService validateBodyMetrics]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe].silo
  if (*a3 == 2)
  {
    p_fUserInfo = &self->fUserInfo;
    long long v9 = *((_OWORD *)a4 + 1);
    long long v8 = *((_OWORD *)a4 + 2);
    long long v10 = *(_OWORD *)a4;
    *(_OWORD *)&p_fUserInfo->runVo2max = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)&p_fUserInfo->vo2max = v9;
    *(_OWORD *)&p_fUserInfo->hronset = v8;
    *(_OWORD *)&p_fUserInfo->gender = v10;
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    double v11 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isAgeSet = p_fUserInfo->_isAgeSet;
      double age = p_fUserInfo->age;
      int biologicalSex = p_fUserInfo->biologicalSex;
      BOOL isHeightSet = p_fUserInfo->_isHeightSet;
      double heightM = p_fUserInfo->heightM;
      BOOL isWeightSet = p_fUserInfo->_isWeightSet;
      double weightKG = p_fUserInfo->weightKG;
      *(_DWORD *)long long buf = 67241729;
      int v23 = isAgeSet;
      __int16 v24 = 2049;
      double v25 = age;
      __int16 v26 = 1025;
      int v27 = biologicalSex;
      __int16 v28 = 1026;
      BOOL v29 = isHeightSet;
      __int16 v30 = 2049;
      double v31 = heightM;
      __int16 v32 = 1026;
      BOOL v33 = isWeightSet;
      __int16 v34 = 2049;
      double v35 = weightKG;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLVO2MaxService: Received user info update. IsAgeSet,%{public}d,Age,%{private}f,BiologicalSex,%{private}d,IsHeightSet,%{public}d,Height,%{private}f,IsWeightSet,%{public}d,Weight,%{private}f", buf, 0x38u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 == -1)
      {
LABEL_16:
        double v21 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVO2MaxService onUserInfoUpdate:data:]", "%s\n", v21);
        if (v21 != (char *)buf) {
          free(v21);
        }
        return;
      }
LABEL_18:
      dispatch_once(&qword_102419220, &stru_1022B9D18);
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_1022B9D18);
    }
    double v19 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *a3;
      *(_DWORD *)long long buf = 67109120;
      int v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 == -1) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
  }
}

- (void)setRetrocomputeStatusClients:(id)a3
{
}

- (void).cxx_destruct
{
  p_fPendingHealthKitWrites = &self->fPendingHealthKitWrites;
  sub_100538BA4((void ***)&p_fPendingHealthKitWrites);
  value = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  cntrl = self->fVO2MaxSummaryRecorderDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  id v5 = self->fVO2MaxOutputRecorderDb.__cntrl_;
  if (v5) {
    sub_1000DB0A0((std::__shared_weak_count *)v5);
  }
  xpc_activity_state_t v6 = self->fVO2MaxSessionAttributesDb.__cntrl_;
  if (v6) {
    sub_1000DB0A0((std::__shared_weak_count *)v6);
  }
  int v7 = self->fRetrocomputeBodyMetricsDb.__ptr_.__value_;
  self->fRetrocomputeBodyMetricsDb.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(CLVO2MaxRetrocomputeBodyMetricsDb *))(*(void *)v7 + 24))(v7);
  }
  long long v8 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *))(*(void *)v8 + 24))(v8);
  }
  long long v9 = self->fStagingOutputStore.__ptr_.__value_;
  self->fStagingOutputStore.__ptr_.__value_ = 0;
  if (v9) {
    sub_1004B3ED0((uint64_t)&self->fStagingOutputStore, (uint64_t)v9);
  }
  long long v10 = self->fInputStore.__cntrl_;
  if (v10) {
    sub_1000DB0A0((std::__shared_weak_count *)v10);
  }
  double v11 = self->fInputCache.__cntrl_;
  if (v11) {
    sub_1000DB0A0((std::__shared_weak_count *)v11);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  *((void *)self + 34) = 0;
  return self;
}

@end