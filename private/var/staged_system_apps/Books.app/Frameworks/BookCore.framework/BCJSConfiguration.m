@interface BCJSConfiguration
+ (BCJSConfiguration)sharedInstance;
+ (id)getInstance;
- (BOOL)overrideAlgorithm;
- (BOOL)overridePercentage;
- (NSDate)dateRequiredForActiveBook;
- (NSDate)dateSinceLastActiveOverride;
- (NSDate)oldestDateForUpgrade;
- (NSDate)oldestDateToAvoidPurgeOfBooks;
- (NSDate)oldestDateToAvoidPurgeOfSamples;
- (NSDate)oldestDateToKeepFinished;
- (NSDictionary)overrides;
- (NSHashTable)observers;
- (NSNumber)launchesRequiredToPurge;
- (NSNumber)markFinishedPercentageOverride;
- (NSNumber)numberOfBooksAllowedInRecentsList;
- (NSNumber)timeThresholdForOpenEvent;
- (NSNumber)timeThresholdForPromotion;
- (NSNumber)timeThresholdForSamplePromotion;
- (NSNumber)validCollectionPeriod;
- (double)expectedResultForJSOverride:(id)a3 andDefaultsOverride:(id)a4 defaultValue:(int64_t)a5 forBehavior:(id)a6;
- (double)openBookClosedSpreadBehaviorOverride;
- (double)openBookDefaultBehaviorOverride;
- (double)openBookOpenBehaviorOverride;
- (id)_init;
- (void)_notifyObservers:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOverrides:(id)a3;
- (void)updateConfiguration:(id)a3;
@end

@implementation BCJSConfiguration

+ (id)getInstance
{
  return +[BCJSConfiguration sharedInstance];
}

+ (BCJSConfiguration)sharedInstance
{
  if (qword_345BB8 != -1) {
    dispatch_once(&qword_345BB8, &stru_2C73A0);
  }
  v2 = (void *)qword_345BB0;

  return (BCJSConfiguration *)v2;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)BCJSConfiguration;
  v2 = [(BCJSConfiguration *)&v11 init];
  v3 = v2;
  if (v2)
  {
    overrides = v2->_overrides;
    v2->_overrides = 0;

    v3->_accessLock._os_unfair_lock_opaque = 0;
    v5 = +[NSUserDefaults standardUserDefaults];
    v3->_overrideAlgorithm = [v5 BOOLForKey:@"BCOverrideRecentBookAlgorithm"];

    v6 = +[NSUserDefaults standardUserDefaults];
    v3->_overridePercentage = [v6 BOOLForKey:@"BCOverrideMarkFinishedPercentage"];

    if (v3->_overrideAlgorithm)
    {
      v7 = BCJSConfigurationLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "Using overridden values for recent book algorithm.", v10, 2u);
      }
    }
    if (v3->_overridePercentage)
    {
      v8 = BCJSConfigurationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "Using overridden values for mark finished percentage.", v10, 2u);
      }
    }
  }
  return v3;
}

- (void)updateConfiguration:(id)a3
{
  id v4 = a3;
  v5 = BCJSConfigurationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "Updating configuration with %{public}@.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  v16 = sub_86CC8;
  v17 = sub_86CD8;
  id v18 = +[NSMutableArray array];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_86CE0;
  v10 = &unk_2C4720;
  objc_super v11 = self;
  id v6 = v4;
  id v12 = v6;
  p_long long buf = &buf;
  v7 = v8;
  os_unfair_lock_lock(&self->_accessLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(&self->_accessLock);

  [(BCJSConfiguration *)self _notifyObservers:*(void *)(*((void *)&buf + 1) + 40)];
  _Block_object_dispose(&buf, 8);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = BCJSConfigurationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1EB6A4();
  }

  id v6 = [(BCJSConfiguration *)self observers];

  if (!v6)
  {
    v7 = +[NSHashTable weakObjectsHashTable];
    [(BCJSConfiguration *)self setObservers:v7];
  }
  v8 = [(BCJSConfiguration *)self observers];
  [v8 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = BCJSConfigurationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1EB70C();
  }

  id v6 = [(BCJSConfiguration *)self observers];
  [v6 removeObject:v4];
}

- (void)_notifyObservers:(id)a3
{
  id v4 = a3;
  v5 = BCJSConfigurationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1EB774(v5);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(BCJSConfiguration *)self observers];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) javascriptConfiguration:self updatedKeys:v4];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSNumber)markFinishedPercentageOverride
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 stringForKey:@"BCMarkFinishedPercentage"];

  unsigned int v5 = [(BCJSConfiguration *)self overridePercentage];
  id v6 = 0;
  if (v5 && v4)
  {
    if ([v4 length])
    {
      [v4 doubleValue];
      id v6 = +[NSNumber numberWithDouble:v7 / 100.0];
      id v8 = BCJSConfigurationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1EB7B8();
      }
    }
    else
    {
      id v6 = 0;
    }
  }

  return (NSNumber *)v6;
}

- (NSDate)oldestDateToAvoidPurgeOfBooks
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_86CC8;
  v26 = sub_86CD8;
  id v27 = 0;
  p_accessLock = &self->_accessLock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  id v18 = sub_87410;
  v19 = &unk_2C39F0;
  v20 = self;
  v21 = &v22;
  id v4 = v17;
  os_unfair_lock_lock(p_accessLock);
  v18((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCInvalidationWindowOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v23[5];
    v23[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EB820();
    }
  }
  long long v12 = +[NSDate distantPast];
  long long v13 = (void *)v23[5];
  if (v13)
  {
    [v13 doubleValue];
    uint64_t v15 = +[NSDate dateWithTimeIntervalSinceNow:v14 * 60.0 * -60.0];

    long long v12 = (void *)v15;
  }

  _Block_object_dispose(&v22, 8);

  return (NSDate *)v12;
}

- (NSDate)oldestDateToAvoidPurgeOfSamples
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_86CC8;
  v26 = sub_86CD8;
  id v27 = 0;
  p_accessLock = &self->_accessLock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  id v18 = sub_876E4;
  v19 = &unk_2C39F0;
  v20 = self;
  v21 = &v22;
  id v4 = v17;
  os_unfair_lock_lock(p_accessLock);
  v18((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  unsigned int v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCInvalidationWindowForSamplesOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v23[5];
    v23[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EB820();
    }
  }
  long long v12 = +[NSDate distantPast];
  long long v13 = (void *)v23[5];
  if (v13)
  {
    [v13 doubleValue];
    uint64_t v15 = +[NSDate dateWithTimeIntervalSinceNow:v14 * 60.0 * -60.0];

    long long v12 = (void *)v15;
  }

  _Block_object_dispose(&v22, 8);

  return (NSDate *)v12;
}

- (NSNumber)launchesRequiredToPurge
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_86CC8;
  v16 = sub_86CD8;
  id v17 = 0;
  p_accessLock = &self->_accessLock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  unsigned int v8 = sub_878CC;
  uint64_t v9 = &unk_2C39F0;
  v10 = self;
  long long v11 = &v12;
  v3 = v7;
  os_unfair_lock_lock(p_accessLock);
  v8((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  id v4 = (void *)v13[5];
  if (!v4)
  {
    v13[5] = (uint64_t)&off_2E1530;

    id v4 = (void *)v13[5];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);

  return (NSNumber *)v5;
}

- (NSDate)oldestDateToKeepFinished
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_86CC8;
  v26 = sub_86CD8;
  id v27 = 0;
  p_accessLock = &self->_accessLock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  id v18 = sub_87BA0;
  v19 = &unk_2C39F0;
  v20 = self;
  v21 = &v22;
  id v4 = v17;
  os_unfair_lock_lock(p_accessLock);
  v18((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCFinishedWindowOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v23[5];
    v23[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EB888();
    }
  }
  uint64_t v12 = +[NSDate distantPast];
  long long v13 = (void *)v23[5];
  if (v13)
  {
    [v13 doubleValue];
    uint64_t v15 = +[NSDate dateWithTimeIntervalSinceNow:v14 * 60.0 * -60.0];

    uint64_t v12 = (void *)v15;
  }

  _Block_object_dispose(&v22, 8);

  return (NSDate *)v12;
}

- (NSDate)oldestDateForUpgrade
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_86CC8;
  v26 = sub_86CD8;
  id v27 = 0;
  p_accessLock = &self->_accessLock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  id v18 = sub_87E74;
  v19 = &unk_2C39F0;
  v20 = self;
  v21 = &v22;
  id v4 = v17;
  os_unfair_lock_lock(p_accessLock);
  v18((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCUpgradeWindowOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v23[5];
    v23[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EB8F0();
    }
  }
  uint64_t v12 = +[NSDate distantPast];
  long long v13 = (void *)v23[5];
  if (v13)
  {
    [v13 doubleValue];
    uint64_t v15 = +[NSDate dateWithTimeIntervalSinceNow:v14 * 60.0 * -60.0];

    uint64_t v12 = (void *)v15;
  }

  _Block_object_dispose(&v22, 8);

  return (NSDate *)v12;
}

- (NSNumber)timeThresholdForPromotion
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_86CC8;
  v25 = sub_86CD8;
  id v26 = 0;
  p_accessLock = &self->_accessLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v17 = sub_8811C;
  id v18 = &unk_2C39F0;
  v19 = self;
  v20 = &v21;
  id v4 = v16;
  os_unfair_lock_lock(p_accessLock);
  v17((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCTimeThresholdPromotionOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v22[5];
    v22[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EB958();
    }
  }
  uint64_t v12 = (void *)v22[5];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = +[NSNumber numberWithDouble:30.0];
  }
  double v14 = v13;

  _Block_object_dispose(&v21, 8);

  return (NSNumber *)v14;
}

- (NSNumber)timeThresholdForSamplePromotion
{
  return (NSNumber *)&off_2EAFF8;
}

- (NSNumber)validCollectionPeriod
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_86CC8;
  uint64_t v24 = sub_86CD8;
  id v25 = 0;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_883C0;
  id v17 = &unk_2C39F0;
  id v18 = self;
  v19 = &v20;
  id v4 = v15;
  os_unfair_lock_lock(p_accessLock);
  v16((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCValidCollectionPeriodOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v21[5];
    v21[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EB9C0();
    }
  }
  uint64_t v12 = (_UNKNOWN **)v21[5];
  if (!v12) {
    uint64_t v12 = &off_2EB008;
  }
  id v13 = v12;

  _Block_object_dispose(&v20, 8);

  return (NSNumber *)v13;
}

- (NSNumber)timeThresholdForOpenEvent
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_86CC8;
  uint64_t v24 = sub_86CD8;
  id v25 = 0;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_88658;
  id v17 = &unk_2C39F0;
  id v18 = self;
  v19 = &v20;
  id v4 = v15;
  os_unfair_lock_lock(p_accessLock);
  v16((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCTimeThresholdForOpenEvent"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v10 = (void *)v21[5];
    v21[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EBA28();
    }
  }
  uint64_t v12 = (_UNKNOWN **)v21[5];
  if (!v12) {
    uint64_t v12 = &off_2EB018;
  }
  id v13 = v12;

  _Block_object_dispose(&v20, 8);

  return (NSNumber *)v13;
}

- (NSNumber)numberOfBooksAllowedInRecentsList
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_86CC8;
  uint64_t v24 = sub_86CD8;
  id v25 = 0;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_888F4;
  id v17 = &unk_2C39F0;
  id v18 = self;
  v19 = &v20;
  id v4 = v15;
  os_unfair_lock_lock(p_accessLock);
  v16((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCNumberOfBooksAllowedInRecentsList"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 integerValue]);
    v10 = (void *)v21[5];
    v21[5] = v9;

    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EBA90();
    }
  }
  uint64_t v12 = (_UNKNOWN **)v21[5];
  if (!v12) {
    uint64_t v12 = &off_2E1548;
  }
  id v13 = v12;

  _Block_object_dispose(&v20, 8);

  return (NSNumber *)v13;
}

- (NSDate)dateRequiredForActiveBook
{
  v2 = [(BCJSConfiguration *)self dateSinceLastActiveOverride];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
  }
  id v5 = v4;

  return (NSDate *)v5;
}

- (NSDate)dateSinceLastActiveOverride
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_86CC8;
  id v25 = sub_86CD8;
  id v26 = 0;
  p_accessLock = &self->_accessLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v17 = sub_88C2C;
  id v18 = &unk_2C39F0;
  v19 = self;
  uint64_t v20 = &v21;
  id v4 = v16;
  os_unfair_lock_lock(p_accessLock);
  v17((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"BCWindowForActiveBookOverride"];

  unsigned int v7 = [(BCJSConfiguration *)self overrideAlgorithm];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1 && [v6 length])
  {
    [v6 doubleValue];
    v10 = +[NSDate dateWithTimeIntervalSinceNow:-v9];
    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EBB60();
    }
LABEL_11:

    goto LABEL_13;
  }
  uint64_t v12 = (void *)v22[5];
  if (v12)
  {
    [v12 doubleValue];
    v10 = +[NSDate dateWithTimeIntervalSinceNow:-v13];
    long long v11 = BCJSConfigurationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1EBAF8();
    }
    goto LABEL_11;
  }
  v10 = 0;
LABEL_13:
  id v14 = v10;

  _Block_object_dispose(&v21, 8);

  return (NSDate *)v14;
}

- (double)openBookDefaultBehaviorOverride
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_86CC8;
  uint64_t v20 = sub_86CD8;
  id v21 = 0;
  p_accessLock = &self->_accessLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  uint64_t v12 = sub_88E3C;
  double v13 = &unk_2C39F0;
  id v14 = self;
  uint64_t v15 = &v16;
  id v4 = v11;
  os_unfair_lock_lock(p_accessLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  uint64_t v5 = v17[5];
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 stringForKey:@"BCOpenBookDefaultBehaviorOverride"];
  [(BCJSConfiguration *)self expectedResultForJSOverride:v5 andDefaultsOverride:v7 defaultValue:1 forBehavior:@"default behavior"];
  double v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (double)openBookOpenBehaviorOverride
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_86CC8;
  uint64_t v20 = sub_86CD8;
  id v21 = 0;
  p_accessLock = &self->_accessLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  uint64_t v12 = sub_8904C;
  double v13 = &unk_2C39F0;
  id v14 = self;
  uint64_t v15 = &v16;
  id v4 = v11;
  os_unfair_lock_lock(p_accessLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  uint64_t v5 = v17[5];
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 stringForKey:@"BCOpenBookOpenBehaviorOverride"];
  [(BCJSConfiguration *)self expectedResultForJSOverride:v5 andDefaultsOverride:v7 defaultValue:7 forBehavior:@"open book behavior"];
  double v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (double)openBookClosedSpreadBehaviorOverride
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_86CC8;
  uint64_t v20 = sub_86CD8;
  id v21 = 0;
  p_accessLock = &self->_accessLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  uint64_t v12 = sub_8925C;
  double v13 = &unk_2C39F0;
  id v14 = self;
  uint64_t v15 = &v16;
  id v4 = v11;
  os_unfair_lock_lock(p_accessLock);
  v12((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  uint64_t v5 = v17[5];
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 stringForKey:@"BCOpenBookClosedSpreadBehaviorOverride"];
  [(BCJSConfiguration *)self expectedResultForJSOverride:v5 andDefaultsOverride:v7 defaultValue:90 forBehavior:@"closed spread open book behavior"];
  double v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (double)expectedResultForJSOverride:(id)a3 andDefaultsOverride:(id)a4 defaultValue:(int64_t)a5 forBehavior:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v10 && [v10 length])
  {
    [v10 doubleValue];
    double v13 = v12;
    id v14 = BCJSConfigurationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1EBC3C();
    }
  }
  else
  {
    if (!v9)
    {
      double v13 = (double)a5;
      goto LABEL_10;
    }
    [v9 doubleValue];
    double v13 = v15;
    id v14 = BCJSConfigurationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1EBBC8();
    }
  }

LABEL_10:
  return v13;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)overrideAlgorithm
{
  return self->_overrideAlgorithm;
}

- (BOOL)overridePercentage
{
  return self->_overridePercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_overrides, 0);
}

@end