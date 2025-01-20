@interface SAAppPathList
- (BOOL)checkURLsAreOverlappingWithURLs:(id)a3;
- (BOOL)importDefaultApps;
- (BOOL)isAppVisible:(id)a3;
- (BOOL)loadFromDisk;
- (BOOL)loadFromDiskWithPathsResolving:(BOOL)a3;
- (BOOL)saveToDisk;
- (NSMutableDictionary)appPathList;
- (NSMutableDictionary)appPathListOnDisk;
- (NSMutableDictionary)writersMap;
- (SAAppPathList)init;
- (SATrie)pathsTrie;
- (id)appPathForBundleID:(id)a3;
- (id)defaultList;
- (id)getGreaterAncestorOfBundle:(id)a3;
- (id)getParentOfBundle:(id)a3;
- (id)groupPathMapping;
- (id)importFromPlists:(id)a3;
- (void)clearAppsWithZeroPath;
- (void)defaultListWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5;
- (void)findBundleIdForURL:(id)a3 reply:(id)a4;
- (void)importFromLaunchServicesWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5;
- (void)isPathInfoClaimedByAnotherApp:(id)a3 reply:(id)a4;
- (void)mergeWritersAppPaths;
- (void)removeAppPath:(id)a3;
- (void)updateWithAppPath:(id)a3;
@end

@implementation SAAppPathList

- (SAAppPathList)init
{
  v8.receiver = self;
  v8.super_class = (Class)SAAppPathList;
  v2 = [(SAAppPathList *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:100];
    appPathList = v2->_appPathList;
    v2->_appPathList = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/spaceattribution", @"AppPathList.db"];
    pathToDisk = v2->pathToDisk;
    v2->pathToDisk = (NSString *)v5;
  }
  return v2;
}

- (SATrie)pathsTrie
{
  uint64_t v3 = (SATrie *)objc_opt_new();
  pathsTrie = self->_pathsTrie;
  self->_pathsTrie = v3;

  appPathList = self->_appPathList;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000098E0;
  v7[3] = &unk_10004C840;
  v7[4] = self;
  [(NSMutableDictionary *)appPathList enumerateKeysAndObjectsUsingBlock:v7];
  return self->_pathsTrie;
}

- (NSMutableDictionary)writersMap
{
  writersMap = self->_writersMap;
  if (!writersMap)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v5 = self->_writersMap;
    self->_writersMap = v4;

    appPathList = self->_appPathList;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100009C18;
    v8[3] = &unk_10004C840;
    v8[4] = self;
    [(NSMutableDictionary *)appPathList enumerateKeysAndObjectsUsingBlock:v8];
    writersMap = self->_writersMap;
  }
  return writersMap;
}

- (BOOL)isAppVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SAAppPathList *)self appPathList];
  v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v6 isUserVisible];
  return (char)v4;
}

- (void)updateWithAppPath:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  uint64_t v5 = self->_appPathList;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->_appPathList objectForKeyedSubscript:v4];
  v7 = v6;
  if (v6) {
    [v6 extendWithPropertiesFromAppPath:v8];
  }
  else {
    [(NSMutableDictionary *)self->_appPathList setValue:v8 forKey:v4];
  }

  objc_sync_exit(v5);
}

- (id)appPathForBundleID:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_appPathList objectForKey:a3];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (void)removeAppPath:(id)a3
{
}

- (void)defaultListWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  [(SAAppPathList *)self loadFromDiskWithPathsResolving:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A07C;
  v12[3] = &unk_10004C868;
  v12[4] = &v13;
  [(SAAppPathList *)self importFromLaunchServicesWithSAActivity:v8 dirKeyCacheList:v9 reply:v12];
  if (*((unsigned char *)v14 + 24)) {
    v10[2](v10, 0, 1);
  }
  id v11 = [(SAAppPathList *)self importFromPlists:@"/System/Library/SpaceAttribution"];
  [(SAAppPathList *)self importDefaultApps];
  [(SAAppPathList *)self mergeWritersAppPaths];
  ((void (**)(id, SAAppPathList *, uint64_t))v10)[2](v10, self, 0);
  _Block_object_dispose(&v13, 8);
}

- (id)defaultList
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100008538;
  id v9 = sub_100008548;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A194;
  v4[3] = &unk_10004C890;
  v4[4] = &v5;
  [(SAAppPathList *)self defaultListWithSAActivity:0 dirKeyCacheList:0 reply:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)saveToDisk
{
  uint64_t v3 = +[NSFileManager defaultManager];
  id v20 = 0;
  unsigned __int8 v4 = [v3 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v20];
  id v5 = v20;
  if (v4)
  {
    appPathList = self->_appPathList;
    id v19 = v5;
    uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:appPathList requiringSecureCoding:0 error:&v19];
    id v8 = v19;

    if (v7)
    {
      unsigned __int8 v9 = [v7 writeToFile:self->pathToDisk atomically:1];
    }
    else
    {
      v17 = SALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002F1FC();
      }

      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    uint64_t v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002F264(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int8 v9 = 0;
    id v8 = v5;
  }

  return v9;
}

- (NSMutableDictionary)appPathListOnDisk
{
  pathToDisk = self->pathToDisk;
  id v15 = 0;
  uint64_t v3 = +[NSData dataWithContentsOfFile:pathToDisk options:0 error:&v15];
  id v4 = v15;
  if (v3)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
    id v14 = v4;
    unsigned __int8 v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v3 error:&v14];
    id v10 = v14;

    if (!v9)
    {
      uint64_t v11 = SALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002F344();
      }

      unsigned __int8 v9 = objc_opt_new();
    }
    id v4 = v10;
  }
  else
  {
    uint64_t v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002F2DC();
    }

    unsigned __int8 v9 = 0;
  }

  return (NSMutableDictionary *)v9;
}

- (BOOL)loadFromDiskWithPathsResolving:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SAAppPathList *)self appPathListOnDisk];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 copy];
    [v7 enumerateKeysAndObjectsUsingBlock:&stru_10004C8D0];

    if (!v3)
    {
      objc_storeStrong((id *)&self->_appPathList, v6);
      goto LABEL_8;
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000A8C0;
    v12[3] = &unk_10004C840;
    id v8 = (NSMutableDictionary *)(id)objc_opt_new();
    uint64_t v13 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    appPathList = self->_appPathList;
    self->_appPathList = v8;
    id v10 = v8;
  }
  else
  {
    id v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002F3AC();
    }
  }

LABEL_8:
  return v6 != 0;
}

- (BOOL)loadFromDisk
{
  return [(SAAppPathList *)self loadFromDiskWithPathsResolving:0];
}

- (id)getParentOfBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SAAppPathList *)self writersMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)getGreaterAncestorOfBundle:(id)a3
{
  id v4 = a3;
  id v5 = [(SAAppPathList *)self getParentOfBundle:v4];

  if (v5)
  {
    id v6 = v4;
    id v5 = 0;
    if (v6)
    {
      do
      {
        id v7 = v5;
        id v5 = v6;

        id v6 = [(SAAppPathList *)self getParentOfBundle:v5];
      }
      while (([v5 isEqualToString:v6] & 1) == 0 && v6);
    }
  }
  return v5;
}

- (void)clearAppsWithZeroPath
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_appPathList allKeys];
  id v4 = [v3 copy];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 136315394;
    long long v17 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appPathList, "objectForKeyedSubscript:", v10, v17);
        uint64_t v12 = [v11 uniqueURLs];
        id v13 = [v12 count];
        id v14 = [v11 sharedURLs];
        id v15 = (char *)[v14 count];

        if (!&v15[(void)v13])
        {
          uint64_t v16 = SALog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = "-[SAAppPathList clearAppsWithZeroPath]";
            __int16 v25 = 2112;
            uint64_t v26 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Removing %@ app path", buf, 0x16u);
          }

          [(NSMutableDictionary *)self->_appPathList removeObjectForKey:v10];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }
}

- (id)groupPathMapping
{
  BOOL v3 = objc_opt_new();
  appPathList = self->_appPathList;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AEF8;
  v7[3] = &unk_10004C840;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)appPathList enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)importFromLaunchServicesWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a5;
  uint64_t v10 = sub_10000F5C0();
  uint64_t v11 = +[NSURL URLWithString:v10];
  uint64_t v12 = +[SAQuery getFSPurgeableInfo:v11 options:0];

  uint64_t v26 = v12;
  id v13 = sub_10000FC20(v12);
  id v14 = sub_10000FE64();
  id v15 = objc_opt_new();
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_100008538;
  v51[4] = sub_100008548;
  id v52 = +[NSDate date];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000B688;
  v36[3] = &unk_10004C8F8;
  id v16 = v15;
  id v37 = v16;
  v43 = v50;
  v44 = v51;
  id v17 = v8;
  id v38 = v17;
  v45 = &v46;
  v18 = (void (**)(void, void))v9;
  id v19 = v14;
  id v39 = v19;
  id v20 = v13;
  id v40 = v20;
  id v21 = v27;
  id v41 = v21;
  v42 = self;
  +[SAQuery installedAppsAtVolume:0 sortForUrgency:3 options:1 block:v36];
  long long v22 = [(SAAppPathList *)self groupPathMapping];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000B9F4;
  v28[3] = &unk_10004C920;
  v33 = v50;
  v34 = v51;
  id v23 = v17;
  id v29 = v23;
  v35 = &v46;
  id v24 = v22;
  id v30 = v24;
  id v25 = v21;
  id v31 = v25;
  v32 = self;
  +[SAQuery installedAppGroupsAtVolume:v28];
  v18[2](v18, *((unsigned __int8 *)v47 + 24));

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v51, 8);
}

- (void)isPathInfoClaimedByAnotherApp:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v8 = [v6 bundleID];
  id v9 = [v6 url];
  uint64_t v10 = [v9 path];
  uint64_t v11 = +[NSURL fileURLWithPath:v10 isDirectory:1];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100008538;
  id v24 = sub_100008548;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C0D0;
  v15[3] = &unk_10004C948;
  v15[4] = &v20;
  v15[5] = &v16;
  [(SAAppPathList *)self findBundleIdForURL:v11 reply:v15];
  if (v21[5])
  {
    if (objc_msgSend(v8, "isEqual:"))
    {
      int v12 = *((unsigned __int8 *)v17 + 24);
      if (v12 != [v6 exclusive]) {
        goto LABEL_7;
      }
    }
  }
  if (v21[5] && (objc_msgSend(v8, "isEqual:") & 1) == 0 && *((unsigned char *)v17 + 24)) {
    goto LABEL_7;
  }
  uint64_t v14 = v21[5];
  if (!v14)
  {
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v8, "isEqual:") & 1) == 0
    && !*((unsigned char *)v17 + 24)
    && [v6 exclusive])
  {
LABEL_7:
    uint64_t v13 = v21[5];
    uint64_t v14 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
LABEL_14:
  v7[2](v7, v13, v14);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)findBundleIdForURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void, id, id))a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = self->_appPathList;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v20 = v7;
    id obj = v8;
    id v11 = 0;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v13);

        id v15 = [(NSMutableDictionary *)self->_appPathList objectForKey:v11];
        uint64_t v16 = [v15 uniqueURLs];
        id v17 = [v16 containsObject:v6];

        if ((v17 & 1) != 0
          || ([v15 sharedURLs],
              uint64_t v18 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v19 = [v18 containsObject:v6],
              v18,
              (v19 & 1) != 0))
        {
          id v7 = v20;
          v20[2](v20, v11, v17);

          goto LABEL_13;
        }

        uint64_t v13 = (char *)v13 + 1;
        uint64_t v14 = v11;
      }
      while (v10 != v13);
      id v8 = obj;
      id v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    id v7 = v20;
  }

  v7[2](v7, 0, 0);
LABEL_13:
}

- (BOOL)checkURLsAreOverlappingWithURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(SAAppPathList *)self pathsTrie];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v10, "path", (void)v16);
        unsigned __int8 v13 = [v5 isOverlapping:v12];

        if (v13)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
        uint64_t v14 = [v10 path];
        [v5 insertPath:v14];
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)importFromPlists:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSFileManager);
  uint64_t v5 = [v3 stringByStandardizingPath];

  long long v23 = (void *)v5;
  if (([v4 fileExistsAtPath:v5] & 1) == 0)
  {
    id v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002F6A0();
    }

    id v8 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:0];
    goto LABEL_9;
  }
  id v6 = +[NSFileManager defaultManager];
  id v30 = 0;
  id v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v30];
  id v8 = v30;

  if (v8)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002F630();
    }

LABEL_9:
    id v11 = v23;
    goto LABEL_10;
  }
  unsigned __int8 v13 = +[NSPredicate predicateWithFormat:@"SELF ENDSWITH '.plist'"];
  uint64_t v14 = [v7 filteredArrayUsingPredicate:v13];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v14;
  id v15 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  id v11 = v23;
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v20 = +[NSString stringWithFormat:@"%@/%@", v11, v19];
        id v21 = +[SAAppPath newFromPlist:v20];
        if (v21)
        {
          [(SAAppPathList *)self updateWithAppPath:v21];
        }
        else
        {
          long long v22 = SALog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to create SAAppPath for plist at path (%@)", buf, 0xCu);
          }

          id v11 = v23;
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v16);
  }

  id v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)importDefaultApps
{
  if (qword_10005AA58 != -1) {
    dispatch_once(&qword_10005AA58, &stru_10004C968);
  }
  if (qword_10005AA48)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000CA08;
    v5[3] = &unk_10004C9E0;
    v5[4] = self;
    [(id)qword_10005AA48 enumerateKeysAndObjectsUsingBlock:v5];
  }
  if (qword_10005AA50)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000CFB4;
    v4[3] = &unk_10004C9E0;
    v4[4] = self;
    [(id)qword_10005AA50 enumerateKeysAndObjectsUsingBlock:v4];
  }
  return 1;
}

- (void)mergeWritersAppPaths
{
  id v3 = [(NSMutableDictionary *)self->_appPathList copy];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_10004CA50];

  id v4 = [(NSMutableDictionary *)self->_appPathList copy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D8C4;
  v9[3] = &unk_10004C840;
  v9[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v5 = [(NSMutableDictionary *)self->_appPathList copy];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DAC8;
  v8[3] = &unk_10004C840;
  v8[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = [(NSMutableDictionary *)self->_appPathList copy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DC74;
  v7[3] = &unk_10004C840;
  void v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (NSMutableDictionary)appPathList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPathList, 0);
  objc_storeStrong((id *)&self->_writersMap, 0);
  objc_storeStrong((id *)&self->_pathsTrie, 0);
  objc_storeStrong((id *)&self->pathToDisk, 0);
}

@end