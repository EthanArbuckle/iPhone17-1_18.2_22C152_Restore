@interface HKSPAnalyticsSleepScheduleChangeInfo
- (BOOL)isSleepTrackingEnabled;
- (HKSPAnalyticsSleepScheduleChangeInfo)initWithApplication:(unint64_t)a3 activePairedWatchProductType:(id)a4 isSleepTrackingEnabled:(BOOL)a5;
- (NSString)activePairedWatchProductType;
- (id)applicationPayloadValue;
- (unint64_t)application;
@end

@implementation HKSPAnalyticsSleepScheduleChangeInfo

- (HKSPAnalyticsSleepScheduleChangeInfo)initWithApplication:(unint64_t)a3 activePairedWatchProductType:(id)a4 isSleepTrackingEnabled:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSPAnalyticsSleepScheduleChangeInfo;
  v10 = [(HKSPAnalyticsSleepScheduleChangeInfo *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_application = a3;
    objc_storeStrong((id *)&v10->_activePairedWatchProductType, a4);
    v11->_isSleepTrackingEnabled = a5;
    v12 = v11;
  }

  return v11;
}

- (id)applicationPayloadValue
{
  unint64_t v2 = [(HKSPAnalyticsSleepScheduleChangeInfo *)self application];
  if (v2 - 1 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5D31FF0[v2 - 1];
  }
}

- (unint64_t)application
{
  return self->_application;
}

- (NSString)activePairedWatchProductType
{
  return self->_activePairedWatchProductType;
}

- (BOOL)isSleepTrackingEnabled
{
  return self->_isSleepTrackingEnabled;
}

- (void).cxx_destruct
{
}

@end