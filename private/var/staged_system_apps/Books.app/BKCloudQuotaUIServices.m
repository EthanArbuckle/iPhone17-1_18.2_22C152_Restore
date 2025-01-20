@interface BKCloudQuotaUIServices
+ (id)sharedInstance;
- (BCMutableFutureValue)upgradeFlowManagerFuture;
- (BKCloudQuotaUIServices)init;
- (ICQUICloudStorageOffersManager)offersManager;
- (ICQUpgradeFlowManager)upgradeFlowManager;
- (NSHashTable)observers;
- (OS_dispatch_queue)serialQueue;
- (id)getUpgradeStorageFlowManager;
- (void)_updateWithNewOffer;
- (void)_upgradeOfferReceived:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)goToSettingsManagePane;
- (void)goToSettingsUpgradePane;
- (void)managerDidCancel:(id)a3;
- (void)presentUpgradeOfferWithNavigationController:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOffersManager:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setUpgradeFlowManager:(id)a3;
- (void)setUpgradeFlowManagerFuture:(id)a3;
@end

@implementation BKCloudQuotaUIServices

- (NSHashTable)observers
{
  return self->_observers;
}

- (BKCloudQuotaUIServices)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKCloudQuotaUIServices;
  v2 = [(BKCloudQuotaUIServices *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iBooks.BKCloudQuotaUIServices.SerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    offersManager = v2->_offersManager;
    v2->_offersManager = (ICQUICloudStorageOffersManager *)v7;

    [(ICQUICloudStorageOffersManager *)v2->_offersManager setDelegate:v2];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_upgradeOfferReceived:" name:ICQCurrentOfferChangedNotification object:0];
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000656C8;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

+ (id)sharedInstance
{
  if (qword_100B4A588 != -1) {
    dispatch_once(&qword_100B4A588, &stru_100A49CC8);
  }
  v2 = (void *)qword_100B4A590;

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKCloudQuotaUIServices;
  [(BKCloudQuotaUIServices *)&v4 dealloc];
}

- (void)_upgradeOfferReceived:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A69FC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateWithNewOffer
{
  uint64_t v3 = +[ICQOfferManager sharedOfferManager];
  unsigned __int8 v4 = [v3 fetchOfferIfNeeded];

  if ((v4 & 1) == 0)
  {
    dispatch_queue_t v5 = +[ICQOfferManager sharedOfferManager];
    id v10 = [v5 currentOffer];

    if (v10)
    {
      if (+[ICQUpgradeFlowManager shouldShowForOffer:v10])
      {
        v6 = [(BKCloudQuotaUIServices *)self upgradeFlowManager];

        if (!v6)
        {
          id v7 = [objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:v10];
          [(BKCloudQuotaUIServices *)self setUpgradeFlowManager:v7];
        }
      }
    }
    id v8 = [(BKCloudQuotaUIServices *)self upgradeFlowManagerFuture];
    v9 = [(BKCloudQuotaUIServices *)self upgradeFlowManager];
    [v8 set:v9 error:0];
  }
}

- (id)getUpgradeStorageFlowManager
{
  uint64_t v3 = [(BKCloudQuotaUIServices *)self upgradeFlowManagerFuture];
  [v3 cancel];

  [(BKCloudQuotaUIServices *)self setUpgradeFlowManagerFuture:0];
  unsigned __int8 v4 = objc_opt_new();
  [(BKCloudQuotaUIServices *)self setUpgradeFlowManagerFuture:v4];

  [(BKCloudQuotaUIServices *)self _updateWithNewOffer];

  return [(BKCloudQuotaUIServices *)self upgradeFlowManagerFuture];
}

- (void)goToSettingsUpgradePane
{
  v2 = +[NSURL URLWithString:@"prefs:root=CASTLE&path=STORAGE_AND_BACKUP/CHANGE_STORAGE_PLAN"];
  uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v4 = 0;
  [v3 openSensitiveURL:v2 withOptions:0 error:&v4];
}

- (void)goToSettingsManagePane
{
  v2 = +[NSURL URLWithString:@"prefs:root=CASTLE&path=STORAGE_AND_BACKUP/MANAGE_STORAGE"];
  uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v4 = 0;
  [v3 openSensitiveURL:v2 withOptions:0 error:&v4];
}

- (void)presentUpgradeOfferWithNavigationController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKCloudQuotaUIServices *)self offersManager];
  [v5 beginFlowWithNavigationController:v4 modally:1];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001A6DF8;
    v7[3] = &unk_100A43DD8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)managerDidCancel:(id)a3
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A6F08;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (ICQUpgradeFlowManager)upgradeFlowManager
{
  return self->_upgradeFlowManager;
}

- (void)setUpgradeFlowManager:(id)a3
{
}

- (BCMutableFutureValue)upgradeFlowManagerFuture
{
  return self->_upgradeFlowManagerFuture;
}

- (void)setUpgradeFlowManagerFuture:(id)a3
{
}

- (ICQUICloudStorageOffersManager)offersManager
{
  return self->_offersManager;
}

- (void)setOffersManager:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_offersManager, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManagerFuture, 0);

  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
}

@end