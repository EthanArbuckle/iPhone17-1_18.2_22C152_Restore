@interface ICCloudThrottlingPolicy
+ (void)resetSavedPolicyState;
- (ICCloudThrottlingLevel)currentLevel;
- (ICCloudThrottlingPolicy)initWithThrottlingLevels:(id)a3 resetInterval:(double)a4;
- (ICUserDefaults)icUserDefaults;
- (NSArray)throttlingLevels;
- (NSDate)policyStartDate;
- (NSTimer)policyResetTimer;
- (double)batchInterval;
- (double)resetInterval;
- (unint64_t)currentBatchCount;
- (unint64_t)currentLevelIndex;
- (void)changeLevelIfNecessary;
- (void)dealloc;
- (void)incrementBatchCount;
- (void)loadSavedPolicyState;
- (void)resetPolicy;
- (void)savePolicyState;
- (void)setCurrentBatchCount:(unint64_t)a3;
- (void)setCurrentLevelIndex:(unint64_t)a3;
- (void)setIcUserDefaults:(id)a3;
- (void)setPolicyResetTimer:(id)a3;
- (void)setPolicyStartDate:(id)a3;
- (void)setResetInterval:(double)a3;
- (void)setThrottlingLevels:(id)a3;
- (void)startPolicyResetTimer;
@end

@implementation ICCloudThrottlingPolicy

- (ICCloudThrottlingPolicy)initWithThrottlingLevels:(id)a3 resetInterval:(double)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICCloudThrottlingPolicy;
  v7 = [(ICCloudThrottlingPolicy *)&v17 init];
  if (v7)
  {
    v8 = objc_opt_new();
    [(ICCloudThrottlingPolicy *)v7 setIcUserDefaults:v8];

    [(ICCloudThrottlingPolicy *)v7 setThrottlingLevels:v6];
    [(ICCloudThrottlingPolicy *)v7 setResetInterval:a4];
    [(ICCloudThrottlingPolicy *)v7 loadSavedPolicyState];
    v9 = [(ICCloudThrottlingPolicy *)v7 policyStartDate];
    [v9 timeIntervalSinceNow];
    double v11 = -v10;
    [(ICCloudThrottlingPolicy *)v7 resetInterval];
    double v13 = v12;

    if (v13 < v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005F30;
      block[3] = &unk_1008ADA80;
      v16 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    [(ICCloudThrottlingPolicy *)v7 startPolicyResetTimer];
  }

  return v7;
}

- (void)dealloc
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005FEC;
  v5[3] = &unk_1008ADA80;
  v5[4] = self;
  performBlockOnMainThread(v5);
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICCloudThrottlingPolicy;
  [(ICCloudThrottlingPolicy *)&v4 dealloc];
}

- (void)incrementBatchCount
{
  [(ICCloudThrottlingPolicy *)self setCurrentBatchCount:(char *)[(ICCloudThrottlingPolicy *)self currentBatchCount] + 1];
  v3 = [(ICCloudThrottlingPolicy *)self currentLevel];
  if ([v3 numberOfBatches])
  {
    objc_super v4 = [(ICCloudThrottlingPolicy *)self currentLevel];
    v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 numberOfBatches]);
    id v6 = [v5 stringValue];
  }
  else
  {
    id v6 = @"unlimited";
  }

  v7 = +[REMLog cloudkit];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = [(ICCloudThrottlingPolicy *)self currentBatchCount];
    unsigned int v9 = [(ICCloudThrottlingPolicy *)self currentLevelIndex] + 1;
    double v10 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
    unsigned int v11 = [v10 count];
    double v12 = [(ICCloudThrottlingPolicy *)self currentLevel];
    *(_DWORD *)buf = 67110146;
    unsigned int v16 = v8;
    __int16 v17 = 2112;
    v18 = v6;
    __int16 v19 = 1024;
    unsigned int v20 = v9;
    __int16 v21 = 1024;
    unsigned int v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Processing cloud batch (%d of %@) in throttling level (%d of %d): %@", buf, 0x28u);
  }
  [(ICCloudThrottlingPolicy *)self changeLevelIfNecessary];
  double v13 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006260;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v13, block);
}

- (void)changeLevelIfNecessary
{
  id v15 = [(ICCloudThrottlingPolicy *)self currentLevel];
  if ([v15 numberOfBatches])
  {
    unint64_t v3 = [(ICCloudThrottlingPolicy *)self currentLevelIndex];
    objc_super v4 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
    v5 = (char *)[v4 count] - 1;

    if (v3 < (unint64_t)v5)
    {
      unint64_t v6 = [(ICCloudThrottlingPolicy *)self currentBatchCount];
      v7 = [(ICCloudThrottlingPolicy *)self currentLevel];
      id v8 = [v7 numberOfBatches];

      if (v6 >= (unint64_t)v8)
      {
        [(ICCloudThrottlingPolicy *)self setCurrentLevelIndex:(char *)[(ICCloudThrottlingPolicy *)self currentLevelIndex] + 1];
        [(ICCloudThrottlingPolicy *)self setCurrentBatchCount:0];
        unsigned int v9 = +[REMLog cloudkit];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v10 = [(ICCloudThrottlingPolicy *)self currentLevelIndex] + 1;
          unsigned int v11 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
          unsigned int v12 = [v11 count];
          double v13 = [(ICCloudThrottlingPolicy *)self currentLevel];
          *(_DWORD *)buf = 67109634;
          unsigned int v17 = v10;
          __int16 v18 = 1024;
          unsigned int v19 = v12;
          __int16 v20 = 2112;
          __int16 v21 = v13;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Switching to cloud throttling level (%d of %d): %@", buf, 0x18u);
        }
        v14 = +[NSNotificationCenter defaultCenter];
        [v14 postNotificationName:@"ICCloudBatchIntervalDidChangeNotification" object:self];
      }
    }
  }
  else
  {
  }
}

- (double)batchInterval
{
  v2 = [(ICCloudThrottlingPolicy *)self currentLevel];
  [v2 batchInterval];
  double v4 = v3;

  return v4;
}

- (ICCloudThrottlingLevel)currentLevel
{
  unint64_t v3 = [(ICCloudThrottlingPolicy *)self currentLevelIndex];
  double v4 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
  v5 = (char *)[v4 count] - 1;

  if (v3 >= (unint64_t)v5) {
    unint64_t v3 = (unint64_t)v5;
  }
  unint64_t v6 = [(ICCloudThrottlingPolicy *)self throttlingLevels];
  v7 = [v6 objectAtIndexedSubscript:v3];

  return (ICCloudThrottlingLevel *)v7;
}

- (void)resetPolicy
{
  unint64_t v3 = [(ICCloudThrottlingPolicy *)self policyResetTimer];
  [v3 invalidate];

  [(ICCloudThrottlingPolicy *)self setPolicyResetTimer:0];
  [(ICCloudThrottlingPolicy *)self setCurrentLevelIndex:0];
  [(ICCloudThrottlingPolicy *)self setCurrentBatchCount:0];
  double v4 = +[NSDate date];
  [(ICCloudThrottlingPolicy *)self setPolicyStartDate:v4];

  [(ICCloudThrottlingPolicy *)self startPolicyResetTimer];
  v5 = +[REMLog cloudkit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(ICCloudThrottlingPolicy *)self currentLevel];
    *(_DWORD *)buf = 138412290;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting cloud throttling policy to the first level: %@", buf, 0xCu);
  }
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"ICCloudBatchIntervalDidChangeNotification" object:self];

  id v8 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006718;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)startPolicyResetTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006794;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (void)resetSavedPolicyState
{
  id v3 = (id)objc_opt_new();
  v2 = [v3 userDefaults];
  [v2 removeObjectForKey:@"ThrottlingPolicyCurrentBatchCount"];
  [v2 removeObjectForKey:@"ThrottlingPolicyCurrentLevelIndex"];
  [v2 removeObjectForKey:@"ThrottlingPolicyStartTime"];
}

- (void)loadSavedPolicyState
{
  id v3 = [(ICCloudThrottlingPolicy *)self icUserDefaults];
  id v8 = [v3 userDefaults];

  double v4 = [v8 objectForKey:@"ThrottlingPolicyCurrentBatchCount"];
  -[ICCloudThrottlingPolicy setCurrentBatchCount:](self, "setCurrentBatchCount:", [v4 unsignedIntegerValue]);

  v5 = [v8 objectForKey:@"ThrottlingPolicyCurrentLevelIndex"];
  -[ICCloudThrottlingPolicy setCurrentLevelIndex:](self, "setCurrentLevelIndex:", [v5 unsignedIntegerValue]);

  [v8 doubleForKey:@"ThrottlingPolicyStartTime"];
  if (v6 == 0.0) {
    +[NSDate date];
  }
  else {
  v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  [(ICCloudThrottlingPolicy *)self setPolicyStartDate:v7];
}

- (void)savePolicyState
{
  id v3 = [(ICCloudThrottlingPolicy *)self icUserDefaults];
  id v7 = [v3 userDefaults];

  double v4 = +[NSNumber numberWithUnsignedInteger:[(ICCloudThrottlingPolicy *)self currentBatchCount]];
  [v7 setObject:v4 forKey:@"ThrottlingPolicyCurrentBatchCount"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(ICCloudThrottlingPolicy *)self currentLevelIndex]];
  [v7 setObject:v5 forKey:@"ThrottlingPolicyCurrentLevelIndex"];

  double v6 = [(ICCloudThrottlingPolicy *)self policyStartDate];
  [v6 timeIntervalSinceReferenceDate];
  [v7 setDouble:@"ThrottlingPolicyStartTime" forKey:];
}

- (NSArray)throttlingLevels
{
  return self->_throttlingLevels;
}

- (void)setThrottlingLevels:(id)a3
{
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (ICUserDefaults)icUserDefaults
{
  return self->_icUserDefaults;
}

- (void)setIcUserDefaults:(id)a3
{
}

- (unint64_t)currentBatchCount
{
  return self->_currentBatchCount;
}

- (void)setCurrentBatchCount:(unint64_t)a3
{
  self->_currentBatchCount = a3;
}

- (unint64_t)currentLevelIndex
{
  return self->_currentLevelIndex;
}

- (void)setCurrentLevelIndex:(unint64_t)a3
{
  self->_currentLevelIndex = a3;
}

- (NSDate)policyStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPolicyStartDate:(id)a3
{
}

- (NSTimer)policyResetTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPolicyResetTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyResetTimer, 0);
  objc_storeStrong((id *)&self->_policyStartDate, 0);
  objc_storeStrong((id *)&self->_icUserDefaults, 0);

  objc_storeStrong((id *)&self->_throttlingLevels, 0);
}

@end