@interface MBAppPlugin
- (NSArray)allAppGroupContainers;
- (NSArray)groups;
- (NSDictionary)entitlements;
- (NSString)bundleDir;
- (NSString)entitlementsRelativePath;
- (NSString)ownerBundleID;
- (id)domain;
@end

@implementation MBAppPlugin

- (NSString)ownerBundleID
{
  return (NSString *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"PluginOwnerBundleID"];
}

- (NSString)bundleDir
{
  return (NSString *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Path"];
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Entitlements"];
}

- (NSArray)groups
{
  v3 = +[NSMutableArray array];
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

- (id)domain
{
  v3 = [(MBContainer *)self identifier];
  v4 = [(MBContainer *)self volumeMountPoint];
  id v5 = [(MBContainer *)self containerDir];
  id v6 = +[MBDomain appPluginDomainWithIdentifier:v3 volumeMountPoint:v4 rootPath:v5];

  uint64_t v7 = sub_1002AB09C();
  [v6 setRelativePathsToBackupAndRestore:v7];

  v8 = sub_1002AB0F0();
  [v6 setRelativePathsNotToBackup:v8];

  uint64_t v9 = sub_1002AB144();
  [v6 setRelativePathsNotToRestore:v9];

  [v6 setShouldDigest:0];
  return v6;
}

- (NSString)entitlementsRelativePath
{
  v2 = [(MBAppPlugin *)self bundleDir];
  v3 = sub_1002AA7CC(v2);

  return (NSString *)v3;
}

- (NSArray)allAppGroupContainers
{
  v3 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(MBAppPlugin *)self groups];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", v15, v16);
        id v11 = [v10 length];

        if (v11)
        {
          [v3 addObject:v9];
        }
        else
        {
          v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [(MBContainer *)self identifier];
            *(_DWORD *)buf = 138412546;
            v22 = v9;
            __int16 v23 = 2112;
            v24 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found empty app group container identifier for %@ (%@)", buf, 0x16u);

            [(MBContainer *)self identifier];
            v16 = long long v15 = v9;
            _MBLog();
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end