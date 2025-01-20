@interface TCBundleResourceManager
+ (id)instance;
+ (void)disposeInstance;
- (TCBundleResourceManager)init;
- (_xmlDoc)xmlDocumentForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5;
- (id)dataForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5 cacheResult:(BOOL)a6;
- (id)packageEntryForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5;
- (id)packageWithName:(id)a3 cacheResult:(BOOL)a4;
@end

@implementation TCBundleResourceManager

+ (id)instance
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sInstance;
  if (!sInstance)
  {
    v4 = objc_alloc_init(TCBundleResourceManager);
    v5 = (void *)sInstance;
    sInstance = (uint64_t)v4;

    v3 = (void *)sInstance;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (void)disposeInstance
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)sInstance;
  if (sInstance)
  {
    sInstance = 0;
  }
  objc_sync_exit(obj);
}

- (TCBundleResourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCBundleResourceManager;
  id v2 = [(TCBundleResourceManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mPackageMap = v2->mPackageMap;
    v2->mPackageMap = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)dataForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5 cacheResult:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  +[TCBundleResourceDebugEntry addEntry:v10 ofType:v11 inPackage:v12 cacheResult:v6];
  v13 = [(TCBundleResourceManager *)self packageWithName:v12 cacheResult:v6];
  if (v13)
  {
    v14 = [v10 stringByAppendingPathExtension:v11];
    v15 = [v13 entryWithName:v14 cacheResult:v6];
    if (!v15) {
      +[TCBundleResourceException raise:@"TCBundleResourcePackageEntryNotFoundError", @"Entry %@ not found in package %@", v14, v12 format];
    }
    v16 = [v15 data];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)packageEntryForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[TCBundleResourceDebugEntry addEntry:v8 ofType:v9 inPackage:v10 cacheResult:0];
  id v11 = [(TCBundleResourceManager *)self packageWithName:v10 cacheResult:0];
  if (v11)
  {
    id v12 = [v8 stringByAppendingPathExtension:v9];
    v13 = [v11 entryWithName:v12 cacheResult:0];
    if (!v13) {
      +[TCBundleResourceException raise:@"TCBundleResourcePackageEntryNotFoundError", @"Entry %@ not found in package %@", v12, v10 format];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_xmlDoc)xmlDocumentForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[TCBundleResourceDebugEntry addEntry:v8 ofType:v9 inPackage:v10 cacheResult:1];
  id v11 = [(TCBundleResourceManager *)self packageWithName:v10 cacheResult:1];
  if (v11)
  {
    id v12 = [v8 stringByAppendingPathExtension:v9];
    v13 = [v11 entryWithName:v12 cacheResult:1];
    if (!v13) {
      +[TCBundleResourceException raise:@"TCBundleResourcePackageEntryNotFoundError", @"Entry %@ not found in package %@", v12, v10 format];
    }
    v14 = (_xmlDoc *)[v13 xmlDocument];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (id)packageWithName:(id)a3 cacheResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(NSMutableDictionary *)self->mPackageMap objectForKey:v6];
  if (!v7)
  {
    id v8 = TCBundle();
    id v9 = [v8 pathForResource:v6 ofType:@"zip"];

    if (!v9)
    {
      os_unfair_lock_unlock(&self->_lock);
      +[TCBundleResourceException raise:@"TCBundleResourcePackageNotFound", @"Couldn't find bundle resource package named %@", v6 format];
    }
    id v10 = [[OISFUZipArchive alloc] initWithPath:v9 collapseCommonRootDirectory:0];
    if (v10)
    {
      v7 = [[TCBundleResourcePackage alloc] initWithZipArchive:v10];
      if (v4)
      {
        id v11 = self->mPackageMap;
        objc_sync_enter(v11);
        [(NSMutableDictionary *)self->mPackageMap setObject:v7 forKey:v6];
        objc_sync_exit(v11);
      }
    }
    else
    {
      v7 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

@end