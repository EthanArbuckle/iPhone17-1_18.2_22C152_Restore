@interface MLRSchedulerRecord
- (MLRSchedulerRecord)init;
- (id)description;
- (id)fetchAllPluginIDs;
- (int64_t)wakeUpPeriodInSeconds;
- (void)updateWakeUpPeriodInSeconds;
@end

@implementation MLRSchedulerRecord

- (MLRSchedulerRecord)init
{
  v7.receiver = self;
  v7.super_class = (Class)MLRSchedulerRecord;
  v2 = [(MLRSchedulerRecord *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_wakeUpPeriodInSeconds = 86400;
    if (allowCustomWakeUpPeriod())
    {
      v4 = +[DESUserDefaultsStoreRecord schedulerWakeupPeriodInSeconds];
      v5 = v4;
      if (v4) {
        v3->_wakeUpPeriodInSeconds = (uint64_t)fmax((double)(unint64_t)[v4 unsignedIntegerValue], 1800.0);
      }
    }
  }
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@(%lu)", v4, self->_wakeUpPeriodInSeconds];

  return v5;
}

- (id)fetchAllPluginIDs
{
  v2 = +[DESBundleRegistry sharedInstance];
  v3 = [v2 allUnrestrictedBundleIds];

  return v3;
}

- (void)updateWakeUpPeriodInSeconds
{
  if (allowCustomWakeUpPeriod())
  {
    v3 = [(MLRSchedulerRecord *)self fetchAllPluginIDs];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = [[MLRPluginSchedulingRecord alloc] initWithPluginID:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          [(MLRPluginSchedulingRecord *)v8 periodInSeconds];
          uint64_t v9 = binaryGCD();
        }
        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
      unint64_t v10 = (unint64_t)((double)(unint64_t)v9 * 1800.0);
      if (v10) {
        BOOL v11 = v10 == 86400;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
        +[DESUserDefaultsStoreRecord setSchedulerWakeupPeriodInSeconds:v12];
      }
    }
  }
}

- (int64_t)wakeUpPeriodInSeconds
{
  return self->_wakeUpPeriodInSeconds;
}

@end