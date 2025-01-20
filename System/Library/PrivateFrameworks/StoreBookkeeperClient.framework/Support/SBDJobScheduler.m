@interface SBDJobScheduler
+ (id)jobSchedulerForAccount:(id)a3 withDomain:(id)a4;
+ (void)__initializeBackgroundTaskAgentWithJobRunner:(id)a3;
+ (void)addBackgroundJob:(id)a3 nextJobTimeInterval:(double)a4;
+ (void)initializeBackgroundTaskAgentWithJobRunner:(id)a3;
- (BOOL)hasScheduledJob:(double *)a3;
- (NSNumber)accountIdentifier;
- (NSString)domain;
- (void)removeScheduledJobs;
- (void)scheduleUpdateJobWithTimeInterval:(double)a3 replaceExisting:(BOOL)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setDomain:(id)a3;
@end

@implementation SBDJobScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)removeScheduledJobs
{
  id v7 = [(SBDJobScheduler *)self accountIdentifier];
  v3 = [(SBDJobScheduler *)self domain];
  v4 = [v7 stringValue];
  v5 = +[NSString stringWithFormat:@"%@ %@ %@", @"com.apple.storebookkeeperd.updateJob", v4, v3];

  id v6 = v5;
  [v6 UTF8String];
  BackgroundTaskAgentRemoveJob();
}

- (BOOL)hasScheduledJob:(double *)a3
{
  v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  v8 = [(SBDJobScheduler *)self accountIdentifier];
  v9 = [(SBDJobScheduler *)self domain];
  v10 = [v8 stringValue];
  v11 = +[NSString stringWithFormat:@"%@ %@ %@", @"com.apple.storebookkeeperd.updateJob", v10, v9];

  id v12 = v11;
  [v12 UTF8String];
  v13 = (void *)BackgroundTaskAgentCopyJob();

  BOOL v14 = v13 != 0;
  if (a3 && v13)
  {
    double v15 = xpc_dictionary_get_double(v13, kBackgroundTaskAgentJobWindowStartTime);
    *a3 = v15;
    if (v15 >= v7)
    {
      BOOL v14 = 1;
    }
    else
    {
      v16 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SBDJobScheduler: Scheduled job time passed. Removing scheduled jobs.", buf, 2u);
      }

      [(SBDJobScheduler *)self removeScheduledJobs];
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (void)scheduleUpdateJobWithTimeInterval:(double)a3 replaceExisting:(BOOL)a4
{
  BOOL v4 = a4;
  double v14 = 0.0;
  unsigned __int8 v7 = [(SBDJobScheduler *)self hasScheduledJob:&v14];
  if (v4)
  {
    [(SBDJobScheduler *)self removeScheduledJobs];
LABEL_6:
    v8 = [(SBDJobScheduler *)self accountIdentifier];
    v10 = [(SBDJobScheduler *)self domain];
    id v12 = [v8 stringValue];
    v13 = +[NSString stringWithFormat:@"%@ %@ %@", @"com.apple.storebookkeeperd.updateJob", v12, v10];

    +[SBDJobScheduler addBackgroundJob:v13 nextJobTimeInterval:a3];
    goto LABEL_7;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_6;
  }
  v8 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    double v9 = v14;
    v10 = +[NSDate date];
    [v10 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    double v16 = v9 - v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SBDJobScheduler: Skipping scheduling job - there is a job already scheduled in %.2f seconds and this request did not request replacing existing jobs", buf, 0xCu);
LABEL_7:
  }
}

+ (void)addBackgroundJob:(id)a3 nextJobTimeInterval:(double)a4
{
  v5 = (__CFString *)a3;
  double v6 = +[XPCTransactionController sharedInstance];
  unsigned __int8 v7 = [v6 beginTransactionWithIdentifier:@"AddBackgroundJob-ShortKeepAlive"];

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  double v9 = +[NSDate date];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = fmax(a4, 0.1) + v10;

  id v12 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v13 = v5;
    }
    else {
      CFStringRef v13 = @"no-name";
    }
    double v14 = +[NSDate date];
    [v14 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138412802;
    CFStringRef v24 = v13;
    __int16 v25 = 2048;
    double v26 = v11;
    __int16 v27 = 2048;
    double v28 = v11 - v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SBDJobScheduler: Add Job: %@ -- Next: %0.2f (delta from current = %.2f)", buf, 0x20u);
  }
  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowStartTime, v11);
  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowEndTime, v11 + 604800.0);
  xpc_dictionary_set_BOOL(v8, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v8, kBackgroundTaskAgentCellularAllowed, 1);
  xpc_dictionary_set_BOOL(v8, kBackgroundTaskAgentJobWindowAdjustTime, 1);
  xpc_dictionary_set_int64(v8, kBackgroundTaskAgentPowerPluggedinTime, 0);
  double v16 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138412546;
    CFStringRef v24 = v5;
    __int16 v25 = 2048;
    double v26 = v11 - Current;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "SBDJobScheduler: Adding job %@ (%.2f seconds from now)", buf, 0x16u);
  }

  v18 = v5;
  [(__CFString *)v18 UTF8String];
  BackgroundTaskAgentAddJob();
  dispatch_time_t v19 = dispatch_time(0, (uint64_t)dbl_100018970[a4 < 2.0]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014660;
  block[3] = &unk_1000212C0;
  id v22 = v7;
  id v20 = v7;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);
}

+ (void)initializeBackgroundTaskAgentWithJobRunner:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001476C;
  block[3] = &unk_100021298;
  SEL v7 = a2;
  id v8 = a1;
  id v6 = a3;
  uint64_t v3 = qword_1000278E0;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_1000278E0, block);
  }
}

+ (void)__initializeBackgroundTaskAgentWithJobRunner:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SBDJobScheduler: Initializing BackgroundTaskAgentInit", buf, 2u);
  }

  id v6 = v3;
  id v5 = v3;
  BackgroundTaskAgentInit();
}

+ (id)jobSchedulerForAccount:(id)a3 withDomain:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  SEL v7 = objc_alloc_init(SBDJobScheduler);
  id v8 = v7;
  if (v7)
  {
    [(SBDJobScheduler *)v7 setDomain:v6];
    [(SBDJobScheduler *)v8 setAccountIdentifier:v5];
  }

  return v8;
}

@end