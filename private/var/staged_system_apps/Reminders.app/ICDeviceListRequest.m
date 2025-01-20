@interface ICDeviceListRequest
+ (id)combineICloudDevices:(id)a3 withCloudKitDevices:(id)a4;
+ (id)filteredDevices:(id)a3;
+ (id)setOfDeviceNamesFromDevices:(id)a3;
- (ACAccount)account;
- (BOOL)anyDeviceNeedsUpgrade;
- (BOOL)anyDeviceNotUpgradable;
- (BOOL)anyOSXDeviceNotUpgraded;
- (BOOL)didGetICloudDeviceList;
- (BOOL)waitForFetchWithTimeout:(double)a3;
- (ICDeviceListRequest)initWithAccount:(id)a3;
- (NSArray)devices;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)name;
- (NSString)softwareVersion;
- (OS_dispatch_semaphore)workSemaphore;
- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3;
- (void)fetchICloudDevicesWithCompletionBlock:(id)a3;
- (void)fetchWithCompletionBlock:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDidGetICloudDeviceList:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setModelDisplayName:(id)a3;
- (void)setName:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setWorkSemaphore:(id)a3;
@end

@implementation ICDeviceListRequest

- (ICDeviceListRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDeviceListRequest;
  v6 = [(ICDeviceListRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    workSemaphore = v7->_workSemaphore;
    v7->_workSemaphore = (OS_dispatch_semaphore *)v8;
  }
  return v7;
}

- (BOOL)anyDeviceNeedsUpgrade
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ICDeviceListRequest *)self devices];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) upgraded])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)anyDeviceNotUpgradable
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ICDeviceListRequest *)self devices];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) upgradable])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)anyOSXDeviceNotUpgraded
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(ICDeviceListRequest *)self devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isOSXDevice] && !objc_msgSend(v6, "upgraded"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)waitForFetchWithTimeout:(double)a3
{
  uint64_t v4 = self;
  id v5 = [(ICDeviceListRequest *)self workSemaphore];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_semaphore_wait(v5, v6);

  long long v7 = [(ICDeviceListRequest *)v4 devices];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AACloudKitDevicesListRequest);
  dispatch_time_t v6 = [(ICDeviceListRequest *)self account];
  id v7 = [v5 initWithAccount:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100043698;
  v9[3] = &unk_100734950;
  id v10 = v4;
  id v8 = v4;
  [v7 performRequestWithHandler:v9];
}

- (void)fetchICloudDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[UIDevice currentDevice];
  dispatch_time_t v6 = [v5 name];
  id v7 = [v5 systemName];
  id v8 = [v5 systemVersion];
  long long v9 = +[NSString stringWithFormat:@"%@;%@", v7, v8];

  id v10 = objc_alloc((Class)AADeviceListRequest);
  long long v11 = [(ICDeviceListRequest *)self account];
  id v12 = [v10 initWithAccount:v11];

  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100043A28;
  v16[3] = &unk_100734978;
  objc_copyWeak(&v20, &location);
  id v13 = v6;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v4;
  id v19 = v15;
  [v12 performRequestWithHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)fetchWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = dispatch_get_global_queue(2, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043E54;
  v7[3] = &unk_100734A40;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (id)filteredDevices:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "shouldBeHidden", (void)v13) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

+ (id)setOfDeviceNamesFromDevices:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 name];

        if (v11)
        {
          id v12 = [v10 name];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)combineICloudDevices:(id)a3 withCloudKitDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 setOfDeviceNamesFromDevices:v6];
  id v9 = +[NSMutableArray arrayWithArray:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = [v15 name:v20];

        if (v16)
        {
          long long v17 = [v15 name];
          unsigned __int8 v18 = [v8 containsObject:v17];

          if ((v18 & 1) == 0) {
            [v9 addObject:v15];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v9;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevices:(id)a3
{
}

- (BOOL)didGetICloudDeviceList
{
  return self->_didGetICloudDeviceList;
}

- (void)setDidGetICloudDeviceList:(BOOL)a3
{
  self->_didGetICloudDeviceList = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (OS_dispatch_semaphore)workSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkSemaphore:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void)setModelDisplayName:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_workSemaphore, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end