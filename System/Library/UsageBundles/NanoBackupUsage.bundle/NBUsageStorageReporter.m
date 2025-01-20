@interface NBUsageStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4;
- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3;
- (NBManager)backupManager;
- (NBUsageStorageReporter)init;
- (NSArray)cachedBundleApps;
- (NSMutableDictionary)allBackups;
- (NSMutableDictionary)cachedCategorySizes;
- (OS_dispatch_queue)backupQueue;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
- (void)populateUsageBundleApps;
- (void)setAllBackups:(id)a3;
- (void)setBackupManager:(id)a3;
- (void)setBackupQueue:(id)a3;
- (void)setCachedBundleApps:(id)a3;
- (void)setCachedCategorySizes:(id)a3;
@end

@implementation NBUsageStorageReporter

- (NBUsageStorageReporter)init
{
  v12.receiver = self;
  v12.super_class = (Class)NBUsageStorageReporter;
  v2 = [(NBUsageStorageReporter *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanobackup.bridgeUsage", v3);
    backupQueue = v2->_backupQueue;
    v2->_backupQueue = (OS_dispatch_queue *)v4;

    v6 = (NBManager *)[objc_alloc((Class)NBManager) initWithQueue:v2->_backupQueue];
    backupManager = v2->_backupManager;
    v2->_backupManager = v6;

    v8 = v2->_backupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_363C;
    block[3] = &unk_82A8;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (void)populateUsageBundleApps
{
  v3 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.Bridge" withTotalSize:0.0];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  dispatch_queue_t v4 = objc_opt_new();
  v5 = (NSMutableDictionary *)objc_opt_new();
  cachedCategorySizes = self->_cachedCategorySizes;
  self->_cachedCategorySizes = v5;

  backupQueue = self->_backupQueue;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_39F4;
  v16 = &unk_82F8;
  v17 = self;
  id v8 = v3;
  id v18 = v8;
  id v9 = v4;
  id v19 = v9;
  v20 = &v21;
  dispatch_sync((dispatch_queue_t)backupQueue, &v13);
  objc_msgSend(v9, "sortUsingComparator:", &stru_8338, v13, v14, v15, v16, v17);
  *(float *)&double v10 = (float)(unint64_t)v22[3];
  [v8 setTotalSize:v10];
  [v8 setCategories:v9];
  id v25 = v8;
  v11 = +[NSArray arrayWithObjects:&v25 count:1];
  cachedBundleApps = self->_cachedBundleApps;
  self->_cachedBundleApps = v11;

  _Block_object_dispose(&v21, 8);
}

- (id)usageBundleApps
{
  cachedBundleApps = self->_cachedBundleApps;
  if (!cachedBundleApps)
  {
    [(NBUsageStorageReporter *)self populateUsageBundleApps];
    cachedBundleApps = self->_cachedBundleApps;
  }

  return cachedBundleApps;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 1;
}

- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteDataForCategory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [v6 identifier];

  if (v7
    && (id v8 = objc_alloc((Class)NSUUID),
        [v6 identifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v8 initWithUUIDString:v9],
        v9,
        v10))
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = sub_3E6C;
    uint64_t v24 = sub_3E7C;
    id v25 = 0;
    backupQueue = self->_backupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3E84;
    block[3] = &unk_8360;
    id v18 = &v20;
    void block[4] = self;
    id v16 = v10;
    id v17 = v6;
    id v19 = a4;
    id v12 = v10;
    dispatch_sync((dispatch_queue_t)backupQueue, block);
    BOOL v13 = v21[5] == 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (float)sizeForCategory:(id)a3
{
  dispatch_queue_t v4 = [a3 identifier];
  v5 = [(NSMutableDictionary *)self->_cachedCategorySizes objectForKeyedSubscript:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (NSMutableDictionary)allBackups
{
  return self->_allBackups;
}

- (void)setAllBackups:(id)a3
{
}

- (NBManager)backupManager
{
  return self->_backupManager;
}

- (void)setBackupManager:(id)a3
{
}

- (OS_dispatch_queue)backupQueue
{
  return self->_backupQueue;
}

- (void)setBackupQueue:(id)a3
{
}

- (NSArray)cachedBundleApps
{
  return self->_cachedBundleApps;
}

- (void)setCachedBundleApps:(id)a3
{
}

- (NSMutableDictionary)cachedCategorySizes
{
  return self->_cachedCategorySizes;
}

- (void)setCachedCategorySizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCategorySizes, 0);
  objc_storeStrong((id *)&self->_cachedBundleApps, 0);
  objc_storeStrong((id *)&self->_backupQueue, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);

  objc_storeStrong((id *)&self->_allBackups, 0);
}

@end