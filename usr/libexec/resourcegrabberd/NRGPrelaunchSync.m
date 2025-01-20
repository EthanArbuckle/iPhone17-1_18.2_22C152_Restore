@interface NRGPrelaunchSync
- (NRGPrelaunchSync)init;
- (void)_prelaunchCompleted;
- (void)_progressChanged;
- (void)dealloc;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation NRGPrelaunchSync

- (NRGPrelaunchSync)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRGPrelaunchSync;
  v2 = [(NRGPrelaunchSync *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanoresourcegrabber.prelaunch"];
    pairedSyncCoordinator = v2->_pairedSyncCoordinator;
    v2->_pairedSyncCoordinator = (PSYSyncCoordinator *)v3;

    [(PSYSyncCoordinator *)v2->_pairedSyncCoordinator setDelegate:v2];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100009854, @"com.apple.Carousel.Prelaunch.ProgressChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_10000985C, @"com.apple.Carousel.Prelaunch.EndDateChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.Carousel.Prelaunch.ProgressChanged", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.Carousel.Prelaunch.EndDateChanged", 0);
  v5.receiver = self;
  v5.super_class = (Class)NRGPrelaunchSync;
  [(NRGPrelaunchSync *)&v5 dealloc];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a3;
  [@"com.apple.nanoresourcegrabber.pairedsync" UTF8String];
  v6 = (OS_os_transaction *)os_transaction_create();
  syncTransaction = self->_syncTransaction;
  self->_syncTransaction = v6;

  self->_syncSessionActive = 1;
  id v15 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel.Prelaunch"];
  +[NSDate timeIntervalSinceReferenceDate];
  [v15 setDouble:forKey:@"StartDate"];
  id v8 = [v15 synchronize];
  id v9 = objc_alloc_init((Class)NPSManager);
  v10 = +[NSSet setWithObjects:@"StartDate", 0];
  [v9 synchronizeNanoDomain:@"com.apple.Carousel.Prelaunch" keys:v10];

  v11 = [v5 activeSyncSession];

  v12 = [v11 pairedDevice];
  id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"15874345-3594-4D3F-9A28-BA2AEA650A0D"];
  unsigned int v14 = [v12 supportsCapability:v13];

  if (v14) {
    [(NRGPrelaunchSync *)self _prelaunchCompleted];
  }
}

- (void)_progressChanged
{
  if (self->_syncSessionActive)
  {
    id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel.Prelaunch"];
    [v6 doubleForKey:@"Progress"];
    double v4 = v3;
    id v5 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator activeSyncSession];
    [v5 reportProgress:v4];
  }
}

- (void)_prelaunchCompleted
{
  if (self->_syncSessionActive)
  {
    self->_syncSessionActive = 0;
    double v3 = [(PSYSyncCoordinator *)self->_pairedSyncCoordinator activeSyncSession];
    [v3 syncDidComplete];

    syncTransaction = self->_syncTransaction;
    self->_syncTransaction = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);

  objc_storeStrong((id *)&self->_syncTransaction, 0);
}

@end