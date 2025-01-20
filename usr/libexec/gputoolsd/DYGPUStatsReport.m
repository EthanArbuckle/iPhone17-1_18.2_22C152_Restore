@interface DYGPUStatsReport
- (DYGPUStatsReport)init;
- (NSDictionary)lastStatsReport;
- (void)dealloc;
- (void)setup;
- (void)startCollectingStats;
- (void)stopCollectingStats;
@end

@implementation DYGPUStatsReport

- (DYGPUStatsReport)init
{
  v3.receiver = self;
  v3.super_class = (Class)DYGPUStatsReport;
  return [(DYGPUStatsReport *)&v3 init];
}

- (void)dealloc
{
  [(DYGPUStatsReport *)self stopCollectingStats];
  powerSubscription = self->_powerSubscription;
  if (powerSubscription)
  {
    CFRelease(powerSubscription);
    self->_powerSubscription = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DYGPUStatsReport;
  [(DYGPUStatsReport *)&v4 dealloc];
}

- (void)setup
{
  objc_super v3 = (NSMutableDictionary *)IOReportCopyChannelsInCategories();
  powerAllChannels = self->_powerAllChannels;
  self->_powerAllChannels = v3;

  if ((IOReportPrune() & 1) == 0)
  {
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription();
    powerSubbedChannels = self->_powerSubbedChannels;
    self->_powerSubbedChannels = 0;
    self->_powerSubscription = Subscription;
  }
}

- (void)startCollectingStats
{
  objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  objc_super v4 = dispatch_queue_create("reporting_queue", v3);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005F68;
  v7[3] = &unk_10000C698;
  v7[4] = self;
  sub_100005BE8(1, v4, v7);
  v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v5;
}

- (void)stopCollectingStats
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel((dispatch_source_t)timer);
    objc_super v4 = self->_timer;
    self->_timer = 0;
  }
}

- (NSDictionary)lastStatsReport
{
  return (NSDictionary *)self->_lastStatsReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_lastStatsReport, 0);
  objc_storeStrong((id *)&self->_lastPowerSamples, 0);
  objc_storeStrong((id *)&self->_powerSubbedChannels, 0);

  objc_storeStrong((id *)&self->_powerAllChannels, 0);
}

@end