@interface VUINetworkUtilities
+ (id)sharedInstance;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isNetworkReachable;
- (NSString)networkType;
- (OS_dispatch_queue)networkUtilityQueue;
- (VUINetworkUtilities)init;
- (void)_notifyObservers;
- (void)dealloc;
- (void)setNetworkUtilityQueue:(id)a3;
@end

@implementation VUINetworkUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21 != -1) {
    dispatch_once(&sharedInstance_onceToken_21, &__block_literal_global_99);
  }
  v2 = (void *)sharedInstance_sharedInstance_8;
  return v2;
}

void __37__VUINetworkUtilities_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_8;
  sharedInstance_sharedInstance_8 = v0;
}

- (VUINetworkUtilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)VUINetworkUtilities;
  v2 = [(VUINetworkUtilities *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VUINetworkUtility", 0);
    networkUtilityQueue = v2->_networkUtilityQueue;
    v2->_networkUtilityQueue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v5 registerObserver:v2];

    id v6 = objc_alloc(MEMORY[0x1E4F4BE78]);
    uint64_t v7 = [v6 initWithQueue:MEMORY[0x1E4F14428]];
    radioPrefs = v2->_radioPrefs;
    v2->_radioPrefs = (RadiosPreferences *)v7;

    [(RadiosPreferences *)v2->_radioPrefs setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  [v3 unregisterObserver:self];

  [(RadiosPreferences *)self->_radioPrefs setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)VUINetworkUtilities;
  [(VUINetworkUtilities *)&v4 dealloc];
}

- (BOOL)isNetworkReachable
{
  v2 = [MEMORY[0x1E4FB8618] sharedMonitor];
  char v3 = [v2 isRemoteServerLikelyReachable];

  return v3;
}

- (BOOL)isAirplaneModeEnabled
{
  return [(RadiosPreferences *)self->_radioPrefs airplaneMode];
}

- (NSString)networkType
{
  v2 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v3 = [v2 networkType];
  objc_super v4 = @"Unknown";
  if (v3 > 99)
  {
    if (v3 > 1000)
    {
      v5 = @"Bridged WiFi";
      id v6 = @"Wired Ethernet";
      v8 = @"Other";
      if (v3 != 3000) {
        v8 = @"Unknown";
      }
      if (v3 != 2000) {
        id v6 = v8;
      }
      BOOL v7 = v3 == 1001;
    }
    else
    {
      if (v3 == 100) {
        goto LABEL_3;
      }
      v5 = @"Bluetooth";
      id v6 = @"WiFi";
      if (v3 != 1000) {
        id v6 = @"Unknown";
      }
      BOOL v7 = v3 == 500;
    }
    if (v7) {
      objc_super v4 = v5;
    }
    else {
      objc_super v4 = v6;
    }
  }
  else if ((unint64_t)(v3 - 1) < 8)
  {
LABEL_3:
    objc_super v4 = @"Cellular";
  }

  return &v4->isa;
}

- (void)_notifyObservers
{
  objc_initWeak(&location, self);
  networkUtilityQueue = self->_networkUtilityQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__VUINetworkUtilities__notifyObservers__block_invoke;
  v4[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, &location);
  dispatch_async(networkUtilityQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__VUINetworkUtilities__notifyObservers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isNetworkReachable"));
  [v1 setObject:v2 forKey:@"isNetworkReachable"];

  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "isAirplaneModeEnabled"));
  [v1 setObject:v3 forKey:@"isInAirplaneMode"];

  objc_super v4 = [WeakRetained networkType];
  [v1 setObject:v4 forKey:@"NetworkType"];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"VUINetworkPropertiesChangedNotification" object:WeakRetained userInfo:v1];
}

- (OS_dispatch_queue)networkUtilityQueue
{
  return self->_networkUtilityQueue;
}

- (void)setNetworkUtilityQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkUtilityQueue, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

@end