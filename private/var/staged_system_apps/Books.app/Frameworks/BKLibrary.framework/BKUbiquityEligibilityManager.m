@interface BKUbiquityEligibilityManager
- (BKUbiquityEligibilityManager)initWithQuotaFetcher:(id)a3 eligibleBooksProvider:(id)a4 ubiquityStatusMonitor:(id)a5;
- (BKUbiquityEligibleBooksProviding)eligibleBooksProvider;
- (IMUbiquityQuotaFetcher)quotaFetcher;
- (IMUbiquityStatusMonitor)ubiquityStatusMonitor;
- (OS_dispatch_group)documentsURLBecomesAvailable;
- (id)mq_setupAndStartQueryWithGroup:(id)a3;
- (unint64_t)numberOfItemsIniCloud;
- (void)determineCloudEligibility:(id)a3;
- (void)mq_queryDidFinish:(id)a3;
- (void)mq_tearDownQuery:(id)a3;
- (void)setDocumentsURLBecomesAvailable:(id)a3;
- (void)setEligibleBooksProvider:(id)a3;
- (void)setNumberOfItemsIniCloud:(unint64_t)a3;
- (void)setQuotaFetcher:(id)a3;
- (void)setUbiquityStatusMonitor:(id)a3;
- (void)ubiquityDocumentsURLChanged:(id)a3;
@end

@implementation BKUbiquityEligibilityManager

- (BKUbiquityEligibilityManager)initWithQuotaFetcher:(id)a3 eligibleBooksProvider:(id)a4 ubiquityStatusMonitor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKUbiquityEligibilityManager;
  v12 = [(BKUbiquityEligibilityManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_quotaFetcher, a3);
    objc_storeStrong((id *)&v13->_eligibleBooksProvider, a4);
    objc_storeStrong((id *)&v13->_ubiquityStatusMonitor, a5);
    [(IMUbiquityStatusMonitor *)v13->_ubiquityStatusMonitor addObserver:v13];
  }

  return v13;
}

- (void)determineCloudEligibility:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  uint64_t v5 = [(BKUbiquityEligibilityManager *)self eligibleBooksProvider];
  if (v5
    && (v6 = (void *)v5,
        [(BKUbiquityEligibilityManager *)self quotaFetcher],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    kdebug_trace();
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    id v9 = [(BKUbiquityEligibilityManager *)self mq_setupAndStartQueryWithGroup:v8];
    id v10 = [(BKUbiquityEligibilityManager *)self eligibleBooksProvider];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6CAC;
    v13[3] = &unk_D1490;
    v13[4] = self;
    v14 = v8;
    id v15 = v9;
    id v16 = v4;
    id v11 = v9;
    v12 = v8;
    [v10 fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion:v13];
  }
  else
  {
    (*((void (**)(id, void, void, void, void, void))v4 + 2))(v4, 0, 0, 0, 0, 0);
  }
}

- (id)mq_setupAndStartQueryWithGroup:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  uint64_t v5 = objc_opt_new();
  dispatch_group_enter(v4);
  if (v4) {
    objc_setAssociatedObject(v5, off_ECD30, v4, (char *)&dword_0 + 1);
  }
  v6 = (OS_dispatch_group *)dispatch_group_create();
  documentsURLBecomesAvailable = self->_documentsURLBecomesAvailable;
  self->_documentsURLBecomesAvailable = v6;

  v8 = [(BKUbiquityEligibilityManager *)self ubiquityStatusMonitor];
  id v9 = [v8 documentsURL];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = @"nil";
    if (v9) {
      CFStringRef v10 = v9;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v19 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Current documentsURL = %@", buf, 0xCu);
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "documentsURL is nil. Waiting for ubiquityStatusMonitor to notify us when it comes back.", buf, 2u);
    }
    dispatch_group_enter((dispatch_group_t)self->_documentsURLBecomesAvailable);
  }
  id v11 = self->_documentsURLBecomesAvailable;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_76E0;
  v16[3] = &unk_D1418;
  v16[4] = self;
  id v12 = v5;
  id v17 = v12;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v16);
  v13 = v17;
  id v14 = v12;

  return v14;
}

- (void)mq_tearDownQuery:(id)a3
{
  id object = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v4 = object;
  if (object)
  {
    objc_setAssociatedObject(object, off_ECD30, 0, (char *)&dword_0 + 1);
    [object stopQuery];
    uint64_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:NSMetadataQueryDidFinishGatheringNotification object:object];

    id v4 = object;
  }
}

- (void)mq_queryDidFinish:(id)a3
{
  id object = [a3 object];
  [object disableUpdates];
  -[BKUbiquityEligibilityManager setNumberOfItemsIniCloud:](self, "setNumberOfItemsIniCloud:", [object resultCount]);
  [object enableUpdates];
  id v4 = objc_getAssociatedObject(object, off_ECD30);
  uint64_t v5 = v4;
  if (v4) {
    dispatch_group_leave(v4);
  }
}

- (void)ubiquityDocumentsURLChanged:(id)a3
{
  id v4 = (__CFString *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"nil";
    if (v4) {
      CFStringRef v5 = v4;
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ubiquityDocumentsURLChanged to %@", (uint8_t *)&v7, 0xCu);
  }
  documentsURLBecomesAvailable = self->_documentsURLBecomesAvailable;
  if (documentsURLBecomesAvailable) {
    dispatch_group_leave(documentsURLBecomesAvailable);
  }
}

- (IMUbiquityQuotaFetcher)quotaFetcher
{
  return self->_quotaFetcher;
}

- (void)setQuotaFetcher:(id)a3
{
}

- (BKUbiquityEligibleBooksProviding)eligibleBooksProvider
{
  return self->_eligibleBooksProvider;
}

- (void)setEligibleBooksProvider:(id)a3
{
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
}

- (unint64_t)numberOfItemsIniCloud
{
  return self->_numberOfItemsIniCloud;
}

- (void)setNumberOfItemsIniCloud:(unint64_t)a3
{
  self->_numberOfItemsIniCloud = a3;
}

- (OS_dispatch_group)documentsURLBecomesAvailable
{
  return self->_documentsURLBecomesAvailable;
}

- (void)setDocumentsURLBecomesAvailable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentsURLBecomesAvailable, 0);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_eligibleBooksProvider, 0);

  objc_storeStrong((id *)&self->_quotaFetcher, 0);
}

@end