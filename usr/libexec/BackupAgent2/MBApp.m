@interface MBApp
+ (id)appWithBundleID:(id)a3;
+ (id)appWithPropertyList:(id)a3;
+ (id)safeHarborWithPath:(id)a3;
+ (void)_addContainer:(id)a3 toArray:(id)a4 visited:(id)a5;
- (BOOL)isAppUpdating;
- (BOOL)isPlaceholder;
- (BOOL)isSystemApp;
- (NSArray)containers;
- (NSArray)groups;
- (NSArray)plugins;
- (NSArray)uniqueContainers;
- (NSDictionary)entitlements;
- (NSString)bundleDir;
- (NSString)bundleVersion;
- (NSString)entitlementsRelativePath;
- (id)_visitContainerDependenciesAndFilterDuplicates:(BOOL)a3;
- (id)domain;
- (void)setBundleDir:(id)a3;
@end

@implementation MBApp

+ (id)appWithBundleID:(id)a3
{
  v7[0] = kCFBundleIdentifierKey;
  v7[1] = @"ContainerContentClass";
  v8[0] = a3;
  v8[1] = @"Data/Application";
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v5 = +[MBApp appWithPropertyList:v4];

  return v5;
}

+ (id)appWithPropertyList:(id)a3
{
  id v3 = a3;
  v4 = [(MBContainer *)[MBApp alloc] initWithPropertyList:v3 volumeMountPoint:0];

  return v4;
}

+ (id)safeHarborWithPath:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:kMBSafeHarborInfoDirName];
  v4 = [v3 stringByAppendingPathComponent:kMBSafeHarborInfoPlistFilename];

  v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
  if (v5)
  {
    v6 = +[MBApp appWithPropertyList:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)bundleVersion
{
  return (NSString *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:kCFBundleVersionKey];
}

- (NSString)bundleDir
{
  return (NSString *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Path"];
}

- (void)setBundleDir:(id)a3
{
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Entitlements"];
}

- (NSString)entitlementsRelativePath
{
  v2 = [(MBApp *)self bundleDir];
  id v3 = sub_1000402A0(v2);

  return (NSString *)v3;
}

- (NSArray)groups
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"GroupContainers", 0];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [MBAppGroup alloc];
        v11 = [(MBContainer *)self volumeMountPoint];
        v12 = [(MBContainer *)v10 initWithPropertyList:v9 volumeMountPoint:v11];
        [v3 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)plugins
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Plugins", 0];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [MBAppPlugin alloc];
        v11 = [(MBContainer *)self volumeMountPoint];
        v12 = [(MBContainer *)v10 initWithPropertyList:v9 volumeMountPoint:v11];
        [v3 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)uniqueContainers
{
  return (NSArray *)[(MBApp *)self _visitContainerDependenciesAndFilterDuplicates:1];
}

- (NSArray)containers
{
  return (NSArray *)[(MBApp *)self _visitContainerDependenciesAndFilterDuplicates:0];
}

+ (void)_addContainer:(id)a3 toArray:(id)a4 visited:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v10 identifier];
  if (([v8 containsObject:v9] & 1) == 0)
  {
    [v7 addObject:v10];
    [v8 addObject:v9];
  }
}

- (id)_visitContainerDependenciesAndFilterDuplicates:(BOOL)a3
{
  if (a3) {
    v4 = objc_opt_new();
  }
  else {
    v4 = 0;
  }
  id v5 = +[NSMutableArray array];
  [v5 addObject:self];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(MBApp *)self groups];
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        [(id)objc_opt_class() _addContainer:*(void *)(*((void *)&v31 + 1) + 8 * i) toArray:v5 visited:v4];
      }
      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(MBApp *)self plugins];
  id v11 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        [(id)objc_opt_class() _addContainer:v14 toArray:v5 visited:v4];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v15 = [v14 groups];
        id v16 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (k = 0; k != v17; k = (char *)k + 1)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              [(id)objc_opt_class() _addContainer:*(void *)(*((void *)&v23 + 1) + 8 * (void)k) toArray:v5 visited:v4];
            }
            id v17 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v17);
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isAppUpdating
{
  v2 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"IsUpdating"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPlaceholder
{
  v2 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"IsPlaceholder"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSystemApp
{
  v2 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"ApplicationType"];
  if ([v2 isEqualToString:@"System"]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:@"Internal"];
  }

  return v3;
}

- (id)domain
{
  unsigned __int8 v3 = [(MBApp *)self bundleID];
  v4 = [(MBContainer *)self volumeMountPoint];
  id v5 = [(MBContainer *)self containerDir];
  id v6 = +[MBDomain appDomainWithIdentifier:v3 volumeMountPoint:v4 rootPath:v5];

  id v7 = sub_100040B70();
  [v6 setRelativePathsToBackupAndRestore:v7];

  id v8 = sub_100040BC4();
  [v6 setRelativePathsNotToBackup:v8];

  uint64_t v9 = sub_100040C18();
  [v6 setRelativePathsNotToRestore:v9];

  [v6 setShouldDigest:0];

  return v6;
}

@end