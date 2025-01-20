@interface BKUbiquityOptInController
- (BDSLiverpoolStatusMonitor)liverpoolStatusMonitor;
- (BKUbiquityEligibilityManager)cloudEligibilityManager;
- (BKUbiquityOptInController)initWithStatusMonitor:(id)a3 liverpoolStatusMonitor:(id)a4;
- (BOOL)iBooksForiCloudIsEnabled;
- (IMUbiquityStatusMonitor)statusMonitor;
- (NSMutableArray)completionBlocks;
- (void)_cleanupUserDefaults;
- (void)_updateStatusMonitorsWithOptedIn:(BOOL)a3;
- (void)finalizeSetup;
- (void)setCloudEligibilityManager:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setLiverpoolStatusMonitor:(id)a3;
- (void)setStatusMonitor:(id)a3;
@end

@implementation BKUbiquityOptInController

- (void)_cleanupUserDefaults
{
  v2 = sub_10000DFF0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Cleaning up NSUserDefaults", v9, 2u);
  }

  id v3 = objc_alloc((Class)NSUserDefaults);
  id v4 = [v3 initWithSuiteName:BUBooksGroupContainerIdentifier];
  [v4 setInteger:4 forKey:@"BKUbiquitousLastAppVersion"];

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"BKUbiquitousOptedInToken"];

  v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"BKUbiquitousWelcomeReminderTrigger"];

  v7 = +[NSUserDefaults standardUserDefaults];
  [v7 removeObjectForKey:@"BKCumulusEnabled.Collections"];

  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 removeObjectForKey:@"BKCumulusEnabled"];
}

- (IMUbiquityStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (BDSLiverpoolStatusMonitor)liverpoolStatusMonitor
{
  return self->_liverpoolStatusMonitor;
}

- (BKUbiquityOptInController)initWithStatusMonitor:(id)a3 liverpoolStatusMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  v14.receiver = self;
  v14.super_class = (Class)BKUbiquityOptInController;
  v9 = [(BKUbiquityOptInController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statusMonitor, a3);
    objc_storeStrong((id *)&v10->_liverpoolStatusMonitor, a4);
    uint64_t v11 = objc_opt_new();
    completionBlocks = v10->_completionBlocks;
    v10->_completionBlocks = (NSMutableArray *)v11;

    [(BKUbiquityOptInController *)v10 _updateStatusMonitorsWithOptedIn:1];
    [(BKUbiquityOptInController *)v10 _cleanupUserDefaults];
  }

  return v10;
}

- (void)finalizeSetup
{
  id v10 = (id)objc_opt_new();
  id v3 = +[BKLibraryManager defaultManager];
  id v4 = [v3 dataSourceConformingToProtocol:&OBJC_PROTOCOL___BKUbiquityEligibleBooksProviding];

  v5 = BUProtocolCast();
  id v6 = objc_alloc((Class)BKUbiquityEligibilityManager);
  id v7 = [(BKUbiquityOptInController *)self statusMonitor];
  id v8 = (BKUbiquityEligibilityManager *)[v6 initWithQuotaFetcher:v10 eligibleBooksProvider:v5 ubiquityStatusMonitor:v7];
  cloudEligibilityManager = self->_cloudEligibilityManager;
  self->_cloudEligibilityManager = v8;
}

- (void)_updateStatusMonitorsWithOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_10000DFF0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1007ED7C4(v3, v5);
  }

  id v6 = [(BKUbiquityOptInController *)self liverpoolStatusMonitor];
  [v6 updateWithOptedIn:v3];
}

- (void)setStatusMonitor:(id)a3
{
}

- (void)setLiverpoolStatusMonitor:(id)a3
{
}

- (BOOL)iBooksForiCloudIsEnabled
{
  return self->_iBooksForiCloudIsEnabled;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (BKUbiquityEligibilityManager)cloudEligibilityManager
{
  return self->_cloudEligibilityManager;
}

- (void)setCloudEligibilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudEligibilityManager, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_liverpoolStatusMonitor, 0);

  objc_storeStrong((id *)&self->_statusMonitor, 0);
}

@end