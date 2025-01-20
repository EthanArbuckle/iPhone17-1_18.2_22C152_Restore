@interface WISPowerUsageMetricController
- (BOOL)isCurrentlyCharging;
- (BOOL)isInitialized;
- (BOOL)wasChargedSinceLastSubmission;
- (WISPowerUsageMetricController)init;
- (dispatch_queue_s)queue;
- (id).cxx_construct;
- (id)powerIOPropertyForKey:(id)a3 ofExpectedClass:(Class)a4;
- (int)notificationToken;
- (int64_t)lastMaxPercent;
- (int64_t)lastPackCurrentAccumulator;
- (int64_t)lastRawMaxCharge;
- (int64_t)lastRawRemainingCharge;
- (int64_t)lastRemainingPercent;
- (int64_t)lastVoltage;
- (shared_ptr<TelemetryObserver>)observer;
- (unint64_t)lastPackCurrentAccumulatorCount;
- (unint64_t)lastSubmissionTimestamp;
- (void)dealloc;
- (void)handleBasebandPowerMetricWithPayload:(id)a3;
- (void)handleChargingStateUpdate;
- (void)setIsCurrentlyCharging:(BOOL)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setLastMaxPercent:(int64_t)a3;
- (void)setLastPackCurrentAccumulator:(int64_t)a3;
- (void)setLastPackCurrentAccumulatorCount:(unint64_t)a3;
- (void)setLastRawMaxCharge:(int64_t)a3;
- (void)setLastRawRemainingCharge:(int64_t)a3;
- (void)setLastRemainingPercent:(int64_t)a3;
- (void)setLastSubmissionTimestamp:(unint64_t)a3;
- (void)setLastVoltage:(int64_t)a3;
- (void)setNotificationToken:(int)a3;
- (void)setObserver:(shared_ptr<TelemetryObserver>)a3;
- (void)setWasChargedSinceLastSubmission:(BOOL)a3;
@end

@implementation WISPowerUsageMetricController

- (WISPowerUsageMetricController)init
{
  v14.receiver = self;
  v14.super_class = (Class)WISPowerUsageMetricController;
  v2 = [(WISPowerUsageMetricController *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("com.apple.wirelessinsightsd.PowerUsageMetric", v3);
    [(WISPowerUsageMetricController *)v2 setIsInitialized:0];
    [(WISPowerUsageMetricController *)v2 setLastRemainingPercent:0];
    [(WISPowerUsageMetricController *)v2 setLastMaxPercent:0];
    [(WISPowerUsageMetricController *)v2 setLastRawRemainingCharge:0];
    [(WISPowerUsageMetricController *)v2 setLastRawMaxCharge:0];
    [(WISPowerUsageMetricController *)v2 setLastVoltage:0];
    [(WISPowerUsageMetricController *)v2 setLastPackCurrentAccumulator:0];
    [(WISPowerUsageMetricController *)v2 setLastPackCurrentAccumulatorCount:0];
    [(WISPowerUsageMetricController *)v2 setLastSubmissionTimestamp:0];
    [(WISPowerUsageMetricController *)v2 setIsCurrentlyCharging:0];
    [(WISPowerUsageMetricController *)v2 setWasChargedSinceLastSubmission:0];
    [(WISPowerUsageMetricController *)v2 setNotificationToken:0xFFFFFFFFLL];
    int out_token = -1;
    objc_initWeak(&location, v2);
    v4 = [(WISPowerUsageMetricController *)v2 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000F0680;
    handler[3] = &unk_1001B5D80;
    objc_copyWeak(&v11, &location);
    if (!notify_register_dispatch("com.apple.system.powersources.source", &out_token, v4, handler))
    {
      [(WISPowerUsageMetricController *)v2 setNotificationToken:out_token];
      sub_1000F1960(&location, &v8);
      [(WISPowerUsageMetricController *)v2 setObserver:&v8];
      if (v9) {
        sub_10000B678(v9);
      }
      pthread_mutex_lock(&stru_1001D66E0);
      v5 = (void *)xmmword_1001D6720;
      if (!(void)xmmword_1001D6720) {
        sub_100070FD4();
      }
      if (*((void *)&xmmword_1001D6720 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1001D6720 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&stru_1001D66E0);
      [(WISPowerUsageMetricController *)v2 observer];
      long long v7 = v15;
      long long v15 = 0uLL;
      sub_100071A34(v5, &v7);
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
      sub_10014A974();
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 0;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_10014A9E8();
  }
  if ([(WISPowerUsageMetricController *)self queue]) {
    dispatch_release((dispatch_object_t)[(WISPowerUsageMetricController *)self queue]);
  }
  if ([(WISPowerUsageMetricController *)self notificationToken] != -1) {
    notify_cancel([(WISPowerUsageMetricController *)self notificationToken]);
  }
  v3.receiver = self;
  v3.super_class = (Class)WISPowerUsageMetricController;
  [(WISPowerUsageMetricController *)&v3 dealloc];
}

- (void)handleChargingStateUpdate
{
  if (IOPSGetTimeRemainingEstimate() == -2.0)
  {
    [(WISPowerUsageMetricController *)self setIsCurrentlyCharging:1];
    [(WISPowerUsageMetricController *)self setWasChargedSinceLastSubmission:1];
  }
  else
  {
    [(WISPowerUsageMetricController *)self setIsCurrentlyCharging:0];
  }
}

- (void)handleBasebandPowerMetricWithPayload:(id)a3
{
  id v72 = a3;
  v4 = +[NSString stringWithUTF8String:"CurrentCapacity"];
  v75 = [(WISPowerUsageMetricController *)self powerIOPropertyForKey:v4 ofExpectedClass:objc_opt_class()];

  v5 = +[NSString stringWithUTF8String:"MaxCapacity"];
  v74 = [(WISPowerUsageMetricController *)self powerIOPropertyForKey:v5 ofExpectedClass:objc_opt_class()];

  v6 = +[NSString stringWithUTF8String:"AppleRawCurrentCapacity"];
  v73 = [(WISPowerUsageMetricController *)self powerIOPropertyForKey:v6 ofExpectedClass:objc_opt_class()];

  long long v7 = +[NSString stringWithUTF8String:"AppleRawMaxCapacity"];
  uint64_t v8 = [(WISPowerUsageMetricController *)self powerIOPropertyForKey:v7 ofExpectedClass:objc_opt_class()];

  v9 = +[NSString stringWithUTF8String:"BatteryData"];
  v10 = [(WISPowerUsageMetricController *)self powerIOPropertyForKey:v9 ofExpectedClass:objc_opt_class()];

  id v11 = +[NSString stringWithUTF8String:"Voltage"];
  v12 = [v10 valueForKey:v11];

  v13 = +[NSString stringWithUTF8String:"PackCurrentAccumulator"];
  objc_super v14 = [v10 valueForKey:v13];

  long long v15 = +[NSString stringWithUTF8String:"PackCurrentAccumulatorCount"];
  v16 = [v10 valueForKey:v15];

  v17 = *(NSObject **)(qword_1001D8080 + 48);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413826;
    v81 = v75;
    __int16 v82 = 2112;
    v83 = v74;
    __int16 v84 = 2112;
    v85 = v73;
    __int16 v86 = 2112;
    v87 = v8;
    __int16 v88 = 2112;
    v89 = v12;
    __int16 v90 = 2112;
    v91 = v14;
    __int16 v92 = 2112;
    v93 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "PowerUsageMetric:#I Retrieved value(s): remainingPercent %@, maxPercent %@, rawRemainingChargemAh %@, rawMaxChargemAh %@, voltagemV %@, packCurrentAccumulator %@, packCurrentAccumulatorCount %@", buf, 0x48u);
  }
  if (v75 && v74 && v73 && v8 && v12 && v14 && v16)
  {
    id v67 = [v75 longLongValue];
    id v65 = [v74 longLongValue];
    id v68 = [v73 longLongValue];
    id v63 = [v8 longLongValue];
    id v18 = [v12 longLongValue];
    id v61 = [v14 longLongValue];
    id v70 = [v16 unsignedLongLongValue];
    __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    unsigned int v20 = [(WISPowerUsageMetricController *)self isInitialized];
    if ((v20 & 1) == 0)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
        sub_10014AA94();
      }
      [(WISPowerUsageMetricController *)self setLastRemainingPercent:v67];
      [(WISPowerUsageMetricController *)self setLastMaxPercent:v65];
      [(WISPowerUsageMetricController *)self setLastRawRemainingCharge:v68];
      [(WISPowerUsageMetricController *)self setLastRawMaxCharge:v63];
      [(WISPowerUsageMetricController *)self setLastVoltage:v18];
      [(WISPowerUsageMetricController *)self setLastPackCurrentAccumulator:v61];
      [(WISPowerUsageMetricController *)self setLastPackCurrentAccumulatorCount:v70];
      [(WISPowerUsageMetricController *)self setLastSubmissionTimestamp:v19];
      [(WISPowerUsageMetricController *)self setWasChargedSinceLastSubmission:[(WISPowerUsageMetricController *)self isCurrentlyCharging]];
      goto LABEL_19;
    }
    if (v19 < [(WISPowerUsageMetricController *)self lastSubmissionTimestamp]
      || v70 < (id)[(WISPowerUsageMetricController *)self lastPackCurrentAccumulatorCount])
    {
      v21 = *(NSObject **)(qword_1001D8080 + 48);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PowerUsageMetric:#N Time or accumulator count moved backwards, aborting", buf, 2u);
      }
LABEL_19:
      [(WISPowerUsageMetricController *)self setIsInitialized:v20 ^ 1];
      goto LABEL_20;
    }
    uint64_t v59 = [(WISPowerUsageMetricController *)self lastRemainingPercent];
    uint64_t v57 = [(WISPowerUsageMetricController *)self lastMaxPercent];
    uint64_t v55 = [(WISPowerUsageMetricController *)self lastRawRemainingCharge];
    uint64_t v53 = [(WISPowerUsageMetricController *)self lastRawMaxCharge];
    int64_t v22 = [(WISPowerUsageMetricController *)self lastRawRemainingCharge];
    unsigned int v51 = [(WISPowerUsageMetricController *)self wasChargedSinceLastSubmission];
    [(WISPowerUsageMetricController *)self setWasChargedSinceLastSubmission:[(WISPowerUsageMetricController *)self isCurrentlyCharging]];
    unint64_t v49 = [(WISPowerUsageMetricController *)self lastSubmissionTimestamp];
    int64_t v48 = v22;
    int64_t v47 = [(WISPowerUsageMetricController *)self lastPackCurrentAccumulator];
    unint64_t v46 = [(WISPowerUsageMetricController *)self lastPackCurrentAccumulatorCount];
    int64_t v23 = [(WISPowerUsageMetricController *)self lastVoltage];
    if ((uint64_t)v18 + v23 < 0 != __OFADD__(v23, v18)) {
      uint64_t v24 = (uint64_t)v18 + v23 + 1;
    }
    else {
      uint64_t v24 = (uint64_t)v18 + v23;
    }
    [(WISPowerUsageMetricController *)self setLastRemainingPercent:v67];
    [(WISPowerUsageMetricController *)self setLastMaxPercent:v65];
    [(WISPowerUsageMetricController *)self setLastRawRemainingCharge:v68];
    [(WISPowerUsageMetricController *)self setLastRawMaxCharge:v63];
    [(WISPowerUsageMetricController *)self setLastVoltage:v18];
    [(WISPowerUsageMetricController *)self setLastPackCurrentAccumulator:v61];
    [(WISPowerUsageMetricController *)self setLastPackCurrentAccumulatorCount:v70];
    [(WISPowerUsageMetricController *)self setLastSubmissionTimestamp:v19];
    v25 = [v72 valueForKey:@"duration_ms"];
    uint64_t v26 = (uint64_t)[v25 longLongValue];

    v27 = [v72 valueForKey:@"power_stats_cumulated_energy_mj"];
    id v45 = [v27 longLongValue];

    v28 = [v72 valueForKey:@"power_stats_avg_power_mw"];
    id v44 = [v28 longLongValue];

    unint64_t v29 = llround((double)(uint64_t)v67 * 100.0 / (double)(uint64_t)v65);
    v78[0] = @"remaining_percent";
    +[NSNumber numberWithLongLong:v29];
    v79[0] = uint64_t v30 = llround((double)v59 * 100.0 / (double)v57) - v29;
    v78[1] = @"total_used_percent";
    v66 = +[NSNumber numberWithLongLong:v30];
    v79[1] = v66;
    v78[2] = @"raw_remaining_percent";
    +[NSNumber numberWithDouble:(double)(uint64_t)v68 * 100.0 / (double)(uint64_t)v63];
    v64 = double v31 = (double)v55 * 100.0 / (double)v53 - (double)(uint64_t)v68 * 100.0 / (double)(uint64_t)v63;
    v79[2] = v64;
    v78[3] = @"total_raw_used_percent";
    v60 = +[NSNumber numberWithDouble:v31];
    v79[3] = v60;
    v78[4] = @"was_charged";
    +[NSNumber numberWithBool:v51];
    v58 = unint64_t v32 = (v19 - v49) / 0x3B9ACA00;
    v79[4] = v58;
    v78[5] = @"duration_s";
    uint64_t v33 = +[NSNumber numberWithUnsignedLongLong:v32];
    int64_t v34 = v48 - (void)v68;
    v69 = (void *)v33;
    v79[5] = v33;
    v78[6] = @"raw_charge_used_mAh";
    +[NSNumber numberWithLongLong:v34];
    v71 = double v35 = (double)(v47 - (uint64_t)v61) / (double)((unint64_t)v70 - v46) * (double)(v24 >> 1) / 1000.0;
    v79[6] = v71;
    v78[7] = @"energy_used_mWh";
    v62 = +[NSNumber numberWithDouble:(double)v32 / 3600.0 * v35];
    v79[7] = v62;
    v78[8] = @"average_power_used_mW";
    v56 = +[NSNumber numberWithDouble:v35];
    v79[8] = v56;
    v78[9] = @"baseband_duration_s";
    v54 = +[NSNumber numberWithLongLong:v26 / 1000];
    v79[9] = v54;
    v78[10] = @"baseband_energy_used_mWh";
    v52 = +[NSNumber numberWithDouble:(double)(uint64_t)v45 / 3600.0];
    v79[10] = v52;
    v78[11] = @"baseband_average_power_used_mW";
    +[NSNumber numberWithLongLong:v44];
    v50 = double v36 = (double)(uint64_t)v45 / 3600.0 / ((double)v32 / 3600.0 * v35);
    v79[11] = v50;
    v78[12] = @"baseband_to_total_energy_ratio_percent";
    v37 = +[NSNumber numberWithDouble:v36 * 100.0];
    v79[12] = v37;
    v78[13] = @"baseband_used_percent";
    v38 = +[NSNumber numberWithDouble:v36 * (double)v30];
    v79[13] = v38;
    v78[14] = @"baseband_raw_used_percent";
    v39 = +[NSNumber numberWithDouble:v31 * v36];
    v79[14] = v39;
    v40 = (void *)v79[0];
    v41 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:15];

    v42 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_10014AA1C((uint64_t)v41, v42);
    }
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000F154C;
    v76[3] = &unk_1001B5EB8;
    id v77 = v41;
    id v43 = v41;
    sub_100005B9C(@"com.apple.Telephony.APBBPowerUsage", v76);
  }
  else
  {
    [(WISPowerUsageMetricController *)self setIsInitialized:0];
  }
LABEL_20:
}

- (id)powerIOPropertyForKey:(id)a3 ofExpectedClass:(Class)a4
{
  v4 = (__CFString *)a3;
  CFDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  io_object_t v7 = MatchingService;
  if (MatchingService)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, v4, kCFAllocatorDefault, 0);
    IOObjectRelease(v7);
    if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = CFProperty;
    }
    else
    {
      v10 = *(NSObject **)(qword_1001D8080 + 48);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        sub_10014AB08(v12, v14, (uint64_t)CFProperty, v10);
      }
      id v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
      sub_10014AAC8();
    }
    id v9 = 0;
  }

  return v9;
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (shared_ptr<TelemetryObserver>)observer
{
  objc_copyCppObjectAtomic(v2, &self->_observer, (void (__cdecl *)(void *, const void *))sub_1000F16EC);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setObserver:(shared_ptr<TelemetryObserver>)a3
{
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (int64_t)lastRemainingPercent
{
  return self->_lastRemainingPercent;
}

- (void)setLastRemainingPercent:(int64_t)a3
{
  self->_lastRemainingPercent = a3;
}

- (int64_t)lastMaxPercent
{
  return self->_lastMaxPercent;
}

- (void)setLastMaxPercent:(int64_t)a3
{
  self->_lastMaxPercent = a3;
}

- (int64_t)lastRawRemainingCharge
{
  return self->_lastRawRemainingCharge;
}

- (void)setLastRawRemainingCharge:(int64_t)a3
{
  self->_lastRawRemainingCharge = a3;
}

- (int64_t)lastRawMaxCharge
{
  return self->_lastRawMaxCharge;
}

- (void)setLastRawMaxCharge:(int64_t)a3
{
  self->_lastRawMaxCharge = a3;
}

- (int64_t)lastVoltage
{
  return self->_lastVoltage;
}

- (void)setLastVoltage:(int64_t)a3
{
  self->_lastVoltage = a3;
}

- (int64_t)lastPackCurrentAccumulator
{
  return self->_lastPackCurrentAccumulator;
}

- (void)setLastPackCurrentAccumulator:(int64_t)a3
{
  self->_lastPackCurrentAccumulator = a3;
}

- (unint64_t)lastPackCurrentAccumulatorCount
{
  return self->_lastPackCurrentAccumulatorCount;
}

- (void)setLastPackCurrentAccumulatorCount:(unint64_t)a3
{
  self->_lastPackCurrentAccumulatorCount = a3;
}

- (BOOL)isCurrentlyCharging
{
  return self->_isCurrentlyCharging;
}

- (void)setIsCurrentlyCharging:(BOOL)a3
{
  self->_isCurrentlyCharging = a3;
}

- (BOOL)wasChargedSinceLastSubmission
{
  return self->_wasChargedSinceLastSubmission;
}

- (void)setWasChargedSinceLastSubmission:(BOOL)a3
{
  self->_wasChargedSinceLastSubmission = a3;
}

- (unint64_t)lastSubmissionTimestamp
{
  return self->_lastSubmissionTimestamp;
}

- (void)setLastSubmissionTimestamp:(unint64_t)a3
{
  self->_lastSubmissionTimestamp = a3;
}

- (void).cxx_destruct
{
  cntrl = self->_observer.__cntrl_;
  if (cntrl) {
    sub_10000B678((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

@end