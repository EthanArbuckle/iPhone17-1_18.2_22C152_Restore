@interface PKiCloudDataController
- (NSUbiquitousKeyValueStore)ubiquitousKeyValueStore;
- (PKiCloudDataController)init;
- (id)createiCloudPrinterInfo:(id)a3 newPrinterInfo:(id)a4;
- (id)getiCloudPrintersList;
- (id)log_iCloudPrinters;
- (void)addPrinterToiCloudWithInfo:(id)a3;
- (void)removePrinterFromiCloudWithInfo:(id)a3;
- (void)resetiCloudData;
- (void)setUbiquitousKeyValueStore:(id)a3;
- (void)setiCloudPrintersList:(id)a3;
- (void)synchronizeiCloudData;
- (void)ubiquitousKeyValueStoreDidChange:(id)a3;
- (void)updateiCloudPrinter:(id)a3 newDisplayName:(id)a4;
- (void)updateiCloudPrinter:(id)a3 newLocation:(id)a4;
@end

@implementation PKiCloudDataController

- (PKiCloudDataController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKiCloudDataController;
  v2 = [(PKiCloudDataController *)&v7 init];
  if (v2)
  {
    v3 = +[NSUbiquitousKeyValueStore defaultStore];
    [(PKiCloudDataController *)v2 setUbiquitousKeyValueStore:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    v5 = [(PKiCloudDataController *)v2 ubiquitousKeyValueStore];
    [v4 addObserver:v2 selector:"ubiquitousKeyValueStoreDidChange:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v5];

    [(PKiCloudDataController *)v2 synchronizeiCloudData];
  }
  return v2;
}

- (void)synchronizeiCloudData
{
  v3 = [(PKiCloudDataController *)self ubiquitousKeyValueStore];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046DB8;
  v4[3] = &unk_1000A21F8;
  v4[4] = self;
  [v3 synchronizeWithCompletionHandler:v4];
}

- (id)getiCloudPrintersList
{
  v2 = [(PKiCloudDataController *)self ubiquitousKeyValueStore];
  v3 = [v2 objectForKey:@"com.apple.printing.iCloudPrinters"];

  return v3;
}

- (void)setiCloudPrintersList:(id)a3
{
  id v6 = a3;
  v4 = [(PKiCloudDataController *)self ubiquitousKeyValueStore];
  [v4 setArray:v6 forKey:@"com.apple.printing.iCloudPrinters"];

  [(PKiCloudDataController *)self synchronizeiCloudData];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.printerTool.iCloud-printers-changed", 0, 0, 1u);
}

- (void)addPrinterToiCloudWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v6 = [(PKiCloudDataController *)self getiCloudPrintersList];
  id v7 = [v6 mutableCopy];

  if (!v7)
  {
    id v7 = +[NSMutableArray array];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100047110;
  v12[3] = &unk_1000A3270;
  id v8 = v5;
  id v13 = v8;
  id v9 = [v7 indexOfObjectPassingTest:v12];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v10 = [v7 objectAtIndex:v9];
    [v7 removeObjectAtIndex:v9];
  }
  v11 = [(PKiCloudDataController *)self createiCloudPrinterInfo:v10 newPrinterInfo:v4];
  if (v11) {
    [v7 insertObject:v11 atIndex:0];
  }
  [(PKiCloudDataController *)self setiCloudPrintersList:v7];
}

- (void)removePrinterFromiCloudWithInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v6 = [(PKiCloudDataController *)self getiCloudPrintersList];
  id v7 = [v6 mutableCopy];

  if (!v7)
  {
    id v7 = +[NSMutableArray array];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000472D8;
  v10[3] = &unk_1000A3270;
  id v8 = v5;
  id v11 = v8;
  id v9 = [v7 indexOfObjectPassingTest:v10];
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v7 removeObjectAtIndex:v9];
    [(PKiCloudDataController *)self setiCloudPrintersList:v7];
  }
}

- (void)updateiCloudPrinter:(id)a3 newDisplayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v9 = [(PKiCloudDataController *)self getiCloudPrintersList];
  id v10 = [v9 mutableCopy];

  if (!v10)
  {
    id v10 = +[NSMutableArray array];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100047530;
  v15[3] = &unk_1000A3270;
  id v11 = v8;
  id v16 = v11;
  id v12 = [v10 indexOfObjectPassingTest:v15];
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [v10 objectAtIndex:v12];
    id v14 = [v13 mutableCopy];

    [v10 removeObjectAtIndex:v12];
    [v14 setObject:v7 forKeyedSubscript:PKPrinterDisplayNameKey];
    [v10 insertObject:v14 atIndex:0];
    [(PKiCloudDataController *)self setiCloudPrintersList:v10];
  }
}

- (void)updateiCloudPrinter:(id)a3 newLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:PKPrinterUUIDKey];
  id v9 = [(PKiCloudDataController *)self getiCloudPrintersList];
  id v10 = [v9 mutableCopy];

  if (!v10)
  {
    id v10 = +[NSMutableArray array];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100047788;
  v15[3] = &unk_1000A3270;
  id v11 = v8;
  id v16 = v11;
  id v12 = [v10 indexOfObjectPassingTest:v15];
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [v10 objectAtIndex:v12];
    id v14 = [v13 mutableCopy];

    [v10 removeObjectAtIndex:v12];
    [v14 setObject:v7 forKeyedSubscript:PKPrinterLocationKey];
    [v10 insertObject:v14 atIndex:0];
    [(PKiCloudDataController *)self setiCloudPrintersList:v10];
  }
}

- (void)resetiCloudData
{
  v3 = [(PKiCloudDataController *)self ubiquitousKeyValueStore];
  [v3 removeObjectForKey:@"com.apple.printing.iCloudPrinters"];

  [(PKiCloudDataController *)self synchronizeiCloudData];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.printerTool.iCloud-printers-changed", 0, 0, 1u);
}

- (void)ubiquitousKeyValueStoreDidChange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:NSUbiquitousKeyValueStoreChangeReasonKey];
  id v6 = [v5 unsignedIntegerValue];

  if ((unint64_t)v6 >= 4)
  {
    id v7 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NSUbiquitousKeyValueStoreDidChangeExternallyNotification ignoring unknown notification: %ld", (uint8_t *)&v9, 0xCu);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.printerTool.iCloud-printers-changed", 0, 0, 0);
}

- (id)createiCloudPrinterInfo:(id)a3 newPrinterInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v47 = v6;
  v48 = v5;
  if (v5)
  {
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:v5];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
    uint64_t v8 = PKPrinterUUIDKey;
    int v9 = [v6 objectForKeyedSubscript:PKPrinterUUIDKey];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
  uint64_t v10 = PKPrinterNameKey;
  id v49 = v7;
  uint64_t v11 = [v6 objectForKeyedSubscript:PKPrinterNameKey];
  v46 = (void *)v11;
  if (v11) {
    [v7 setObject:v11 forKeyedSubscript:v10];
  }
  uint64_t v12 = PKPrinterDisplayNameKey;
  uint64_t v13 = [v6 objectForKeyedSubscript:PKPrinterDisplayNameKey];
  v45 = (void *)v13;
  if (v13) {
    [v7 setObject:v13 forKeyedSubscript:v12];
  }
  uint64_t v14 = PKPrinterLocationKey;
  uint64_t v15 = [v6 objectForKeyedSubscript:PKPrinterLocationKey];
  v44 = (void *)v15;
  if (v15) {
    [v7 setObject:v15 forKeyedSubscript:v14];
  }
  uint64_t v16 = PKPrinterImageDataKey;
  uint64_t v17 = [v6 objectForKeyedSubscript:PKPrinterImageDataKey];
  v43 = (void *)v17;
  if (v17) {
    [v7 setObject:v17 forKeyedSubscript:v16];
  }
  v18 = +[NSDate date];
  [v7 setObject:v18 forKeyedSubscript:PKPrinterLastUsedDateKey];

  v19 = [v6 objectForKeyedSubscript:PKPrinterEndpointKey];
  uint64_t v20 = PKPrinterEndPointsKey;
  v21 = [v5 objectForKeyedSubscript:PKPrinterEndPointsKey];
  v22 = v21;
  v42 = v21;
  if (v21)
  {
    id v50 = [v21 mutableCopy];
  }
  else
  {
    id v50 = +[NSMutableArray array];
  }
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100048074;
  v55[3] = &unk_1000A3298;
  id v23 = v19;
  id v56 = v23;
  v24 = [v22 indexesOfObjectsPassingTest:v55];
  if (v24) {
    [v50 removeObjectsAtIndexes:v24];
  }
  if (v23) {
    [v50 insertObject:v23 atIndex:0];
  }
  [v7 setObject:v50 forKeyedSubscript:v20];
  v25 = [v6 objectForKeyedSubscript:PKPrinterURLKey];
  uint64_t v26 = PKPrinterURLsKey;
  v27 = [v5 objectForKeyedSubscript:PKPrinterURLsKey];
  v28 = v27;
  if (v27)
  {
    id v29 = [v27 mutableCopy];
  }
  else
  {
    id v29 = +[NSMutableArray array];
  }
  v30 = v29;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100048080;
  v53[3] = &unk_1000A32C0;
  id v31 = v25;
  id v54 = v31;
  v32 = [v28 indexesOfObjectsPassingTest:v53];

  if (v32) {
    [v30 removeObjectsAtIndexes:v32];
  }
  if (v31) {
    [v30 insertObject:v31 atIndex:0];
  }
  [v49 setObject:v30 forKeyedSubscript:v26];
  v33 = liteGetCurrentNetwork();
  uint64_t v34 = PKPrinterNetworksKey;
  v35 = objc_msgSend(v5, "objectForKeyedSubscript:", PKPrinterNetworksKey, v33);
  v36 = v35;
  if (v35)
  {
    id v37 = [v35 mutableCopy];
  }
  else
  {
    id v37 = +[NSMutableArray array];
  }
  v38 = v37;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10004819C;
  v51[3] = &unk_1000A32C0;
  id v39 = v33;
  id v52 = v39;
  v40 = [v36 indexesOfObjectsPassingTest:v51];

  if (v40) {
    [v38 removeObjectsAtIndexes:v40];
  }
  if (v39) {
    [v38 insertObject:v39 atIndex:0];
  }
  [v49 setObject:v38 forKeyedSubscript:v34];

  return v49;
}

- (id)log_iCloudPrinters
{
  id v20 = (id)objc_opt_new();
  v21 = liteGetPrintersForCurrentNetwork();
  uint64_t v17 = [(PKiCloudDataController *)self getiCloudPrintersList];
  id v3 = [v17 count];
  id v4 = [v21 networkName];
  NSLog(@"************************** log_iCloudPrinters numPrinters:%ld, Network '%@'", v3, v4);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v17;
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v19 = *(void *)v30;
    uint64_t v6 = PKPrinterDisplayNameKey;
    uint64_t v7 = PKPrinterUUIDKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x3032000000;
        uint64_t v26 = sub_100048664;
        v27 = sub_100048674;
        id v28 = 0;
        uint64_t v10 = [v21 printers];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10004867C;
        v22[3] = &unk_1000A32E8;
        v22[4] = v9;
        v22[5] = &v23;
        [v10 enumerateObjectsUsingBlock:v22];

        if (v24[5])
        {
          uint64_t v11 = [v21 networkName];
          uint64_t v12 = +[NSString stringWithFormat:@" (on '%@')", v11];
        }
        else
        {
          uint64_t v12 = &stru_1000A4B68;
        }
        uint64_t v13 = [v9 objectForKeyedSubscript:v6];
        uint64_t v14 = [v9 objectForKeyedSubscript:v7];
        uint64_t v15 = +[NSString stringWithFormat:@"%@ UUID:%@%@", v13, v14, v12];

        [v20 addObject:v15];
        NSLog(@"**************************      %@", v15);

        _Block_object_dispose(&v23, 8);
      }
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  return v20;
}

- (NSUbiquitousKeyValueStore)ubiquitousKeyValueStore
{
  return self->_ubiquitousKeyValueStore;
}

- (void)setUbiquitousKeyValueStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end