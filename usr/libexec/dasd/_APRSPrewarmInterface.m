@interface _APRSPrewarmInterface
+ (id)sharedInstance;
- (BOOL)hasPrewarmAssertionForApplication:(id)a3;
- (NSMutableDictionary)prewarmedAssertions;
- (OS_os_log)log;
- (_APRSPrewarmInterface)init;
- (id)closureBuildLaunchAppFromBundleID:(id)a3;
- (id)prelaunchAppFromBundleID:(id)a3 isClosure:(BOOL)a4;
- (id)prewarmLaunchAppFromBundleID:(id)a3;
- (int64_t)userDrainBehavior;
- (os_unfair_lock_s)lock;
- (void)appendPrewarmAssertion:(id)a3 withAssertion:(id)a4;
- (void)invalidatePrewarmAssertionForApplication:(id)a3;
- (void)invalidatePrewarmAssertionForApplication:(id)a3 onInvalidation:(id)a4;
- (void)prewarmRecommendations:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setPrewarmedAssertions:(id)a3;
- (void)setUserDrainBehavior:(int64_t)a3;
@end

@implementation _APRSPrewarmInterface

- (_APRSPrewarmInterface)init
{
  v15.receiver = self;
  v15.super_class = (Class)_APRSPrewarmInterface;
  v2 = [(_APRSPrewarmInterface *)&v15 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.prewarmInterface");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = +[NSMutableDictionary dictionary];
    prewarmedAssertions = v2->_prewarmedAssertions;
    v2->_prewarmedAssertions = (NSMutableDictionary *)v5;

    id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.aprs"];
    v2->_userDrainBehavior = (int64_t)[v7 integerForKey:@"drainBehavior"];
    dispatch_time_t v8 = dispatch_time(0, 300000000000);
    v9 = dispatch_get_global_queue(-32768, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005BC38;
    v12[3] = &unk_100175570;
    v13 = v2;
    id v14 = v7;
    id v10 = v7;
    dispatch_after(v8, v9, v12);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001C3F30 != -1) {
    dispatch_once(&qword_1001C3F30, &stru_1001765B0);
  }
  v2 = (void *)qword_1001C3F28;

  return v2;
}

- (void)prewarmRecommendations:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Prewarm recommendations: %@", buf, 0xCu);
  }
  int v6 = 3;
  if (_os_feature_enabled_impl())
  {
    id v7 = +[_DASLowPowerModePolicy policyInstance];
    unsigned int v8 = [v7 isChallengedForBatteryLife];

    if (v8) {
      int v6 = 1;
    }
    else {
      int v6 = 3;
    }
  }
  char v9 = self->_userDrainBehavior == 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v13 = v11;
    int v14 = 0;
    int v15 = v6 << v9;
    uint64_t v16 = *(void *)v23;
    *(void *)&long long v12 = 138412290;
    long long v21 = v12;
LABEL_9:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v10);
      }
      if (v14 >= v15) {
        break;
      }
      v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
      v19 = self->_log;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v21;
        id v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "Attempting prewarm for %@", buf, 0xCu);
      }
      v20 = -[_APRSPrewarmInterface prewarmLaunchAppFromBundleID:](self, "prewarmLaunchAppFromBundleID:", v18, v21, (void)v22);
      if (!v20) {
        ++v14;
      }

      if (v13 == (id)++v17)
      {
        id v13 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
}

- (void)appendPrewarmAssertion:(id)a3 withAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = [(NSMutableDictionary *)self->_prewarmedAssertions objectForKeyedSubscript:v6];

  if (v8)
  {
    char v9 = [(NSMutableDictionary *)self->_prewarmedAssertions objectForKeyedSubscript:v6];
    [v9 invalidate];
  }
  [(NSMutableDictionary *)self->_prewarmedAssertions setObject:v7 forKey:v6];
  os_unfair_lock_unlock(&self->_lock);
  dispatch_time_t v10 = dispatch_time(0, 500000000);
  id v11 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005C134;
  v13[3] = &unk_100175570;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  dispatch_after(v10, v11, v13);
}

- (BOOL)hasPrewarmAssertionForApplication:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_prewarmedAssertions objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  return v6 != 0;
}

- (void)invalidatePrewarmAssertionForApplication:(id)a3
{
}

- (void)invalidatePrewarmAssertionForApplication:(id)a3 onInvalidation:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Requesting prewarm termination for %@", (uint8_t *)&v13, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  char v9 = [(NSMutableDictionary *)self->_prewarmedAssertions objectForKeyedSubscript:v6];
  dispatch_time_t v10 = v9;
  if (v9)
  {
    [v9 invalidateSyncWithError:0];
    [(NSMutableDictionary *)self->_prewarmedAssertions removeObjectForKey:v6];
    os_unfair_lock_unlock(&self->_lock);
    id v11 = self->_log;
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v13 = 138412290;
    id v14 = v6;
    id v12 = "Prewarm terminated for %@";
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v11 = self->_log;
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v13 = 138412290;
    id v14 = v6;
    id v12 = "Prewarm assertion lost for %@";
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
LABEL_9:
  if (v7) {
    v7[2](v7, v10 != 0);
  }
}

- (id)prelaunchAppFromBundleID:(id)a3 isClosure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)RBSLaunchContext);
  unsigned int v8 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:v6];
  [v7 setIdentity:v8];

  char v9 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"DYLDLaunch"];
  v35 = v9;
  dispatch_time_t v10 = +[NSArray arrayWithObjects:&v35 count:1];
  [v7 setAttributes:v10];

  if (v4) {
    CFStringRef v11 = @"DAS DYLD3 Closure Generation";
  }
  else {
    CFStringRef v11 = @"DAS Prewarm launch";
  }
  if (v4) {
    id v12 = &off_100187AF0;
  }
  else {
    id v12 = &off_100187B18;
  }
  [v7 setExplanation:v11];
  [v7 _setAdditionalEnvironment:v12];
  id v13 = [objc_alloc((Class)RBSLaunchRequest) initWithContext:v7];
  id v29 = 0;
  id v30 = 0;
  id v28 = 0;
  unsigned __int8 v14 = [v13 execute:&v30 assertion:&v29 error:&v28];
  id v15 = v30;
  id v16 = v29;
  id v17 = v28;
  log = self->_log;
  BOOL v19 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v32 = v6;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Prelaunched app: %@ (%u)", buf, 0x12u);
    }
    if (v16)
    {
      long long v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      long long v25 = sub_10005C684;
      v26 = &unk_1001765D8;
      id v27 = v15;
      [v27 monitorForDeath:&v23];
      -[_APRSPrewarmInterface appendPrewarmAssertion:withAssertion:](self, "appendPrewarmAssertion:withAssertion:", v6, v16, v23, v24, v25, v26);
    }
    v20 = +[_APRSMetricRecorder sharedInstance];
    [v20 startLoggingForApp:v6 pid:[v15 pid] forEvent:0];
  }
  else if (v19)
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v32 = v4;
    *(_WORD *)&v32[4] = 2112;
    *(void *)&v32[6] = v6;
    __int16 v33 = 2112;
    id v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Encountered error with prelaunch (%u) of %@: %@", buf, 0x1Cu);
  }
  id v21 = v17;

  return v21;
}

- (id)closureBuildLaunchAppFromBundleID:(id)a3
{
  return [(_APRSPrewarmInterface *)self prelaunchAppFromBundleID:a3 isClosure:1];
}

- (id)prewarmLaunchAppFromBundleID:(id)a3
{
  return [(_APRSPrewarmInterface *)self prelaunchAppFromBundleID:a3 isClosure:0];
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)prewarmedAssertions
{
  return self->_prewarmedAssertions;
}

- (void)setPrewarmedAssertions:(id)a3
{
}

- (int64_t)userDrainBehavior
{
  return self->_userDrainBehavior;
}

- (void)setUserDrainBehavior:(int64_t)a3
{
  self->_userDrainBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmedAssertions, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end