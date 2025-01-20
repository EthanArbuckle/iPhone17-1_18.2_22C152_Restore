@interface SAAppPath
+ (BOOL)isValidAppPathPlist:(id)a3 writersID:(id)a4 uniquePaths:(id)a5 sharedPaths:(id)a6;
+ (BOOL)isValidAppPathPlistArray:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validatePaths:(id)a3;
+ (SAAppPath)appPathWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9;
+ (id)newFromPlist:(id)a3;
- (BOOL)forceHidden;
- (BOOL)forceVisible;
- (BOOL)isAppUserVisible;
- (BOOL)isDataSeparated;
- (BOOL)isGroup;
- (BOOL)isPlugin;
- (BOOL)isUserVisible;
- (BOOL)validate;
- (NSDate)lastUsed;
- (NSMutableArray)binaryURLs;
- (NSMutableSet)bundleRecords;
- (NSMutableSet)sharedURLs;
- (NSMutableSet)uniqueURLs;
- (NSMutableSet)writersIDs;
- (NSNumber)_isUserVisible;
- (NSNumber)lastKnownAppCacheSize;
- (NSNumber)lastKnownTmpSize;
- (NSString)cacheVolumePath;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)dataContainerURL;
- (SAAppPath)init;
- (SAAppPath)initWithBundleID:(id)a3;
- (SAAppPath)initWithBundleID:(id)a3 writersIDs:(id)a4 uniqueURLs:(id)a5 sharedURLs:(id)a6;
- (SAAppPath)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9;
- (SAAppPath)initWithCoder:(id)a3;
- (double)timestamp;
- (id)appRecord;
- (id)bundleSet;
- (id)cachePath;
- (id)getDictionary;
- (id)tmpPath;
- (int)urgency;
- (int64_t)threeDaysAgo;
- (unint64_t)cacheDeletePluginSize;
- (unint64_t)cacheDirStatsID;
- (unint64_t)dirstatsCloneSize:(BOOL)a3;
- (unint64_t)dirstatsPhysicalSize:(BOOL)a3;
- (unint64_t)dirstatsPurgeableSize:(BOOL)a3;
- (unint64_t)getAppCacheSize:(BOOL)a3;
- (unint64_t)tempSize:(BOOL)a3;
- (void)addBundleRecord:(id)a3;
- (void)addBundleRecords:(id)a3;
- (void)addSharedURL:(id)a3;
- (void)addUniqueURL:(id)a3;
- (void)addWriterId:(id)a3;
- (void)enableDirStats;
- (void)encodeWithCoder:(id)a3;
- (void)extendWithPropertiesFromAppPath:(id)a3;
- (void)removeSharedURL:(id)a3;
- (void)removeUniqueURL:(id)a3;
- (void)setBinaryURLs:(id)a3;
- (void)setBundleRecords:(id)a3;
- (void)setCacheDeletePluginSize:(unint64_t)a3;
- (void)setCacheDirStatsID:(unint64_t)a3;
- (void)setCacheVolumePath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastKnownAppCacheSize:(id)a3;
- (void)setLastKnownTmpSize:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setSharedURLs:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUniqueURLs:(id)a3;
- (void)setWritersIDs:(id)a3;
- (void)set_isUserVisible:(id)a3;
@end

@implementation SAAppPath

- (SAAppPath)init
{
  v12.receiver = self;
  v12.super_class = (Class)SAAppPath;
  v2 = [(SAAppPath *)&v12 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->identifier;
    v2->identifier = 0;

    uint64_t v5 = +[NSMutableSet set];
    writersIDs = v3->writersIDs;
    v3->writersIDs = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableSet set];
    uniqueURLs = v3->uniqueURLs;
    v3->uniqueURLs = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableSet set];
    sharedURLs = v3->sharedURLs;
    v3->sharedURLs = (NSMutableSet *)v9;
  }
  return v3;
}

- (SAAppPath)initWithBundleID:(id)a3
{
  id v5 = a3;
  v6 = [(SAAppPath *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->identifier, a3);
  }

  return v7;
}

- (SAAppPath)initWithBundleID:(id)a3 writersIDs:(id)a4 uniqueURLs:(id)a5 sharedURLs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SAAppPath;
  v15 = [(SAAppPath *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->identifier, a3);
    objc_storeStrong((id *)&v16->writersIDs, a4);
    objc_storeStrong((id *)&v16->uniqueURLs, a5);
    objc_storeStrong((id *)&v16->sharedURLs, a6);
  }

  return v16;
}

+ (BOOL)isValidAppPathPlistArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v4 = v3;
      id v5 = (char *)[v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v5)
      {
        v6 = v5;
        uint64_t v7 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(void *)v27 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v17 = SALog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                sub_10002E9C8(v17, v18, v19, v20, v21, v22, v23, v24);
              }

              goto LABEL_18;
            }
          }
          v6 = (char *)[v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
          BOOL v9 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      v4 = SALog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10002EA40(v4, v10, v11, v12, v13, v14, v15, v16);
      }
LABEL_18:
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)isValidAppPathPlist:(id)a3 writersID:(id)a4 uniquePaths:(id)a5 sharedPaths:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    uint64_t v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002EAB8();
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002EB88();
    }
    goto LABEL_20;
  }
  if (v10 && !+[SAAppPath isValidAppPathPlistArray:v10])
  {
    uint64_t v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002EB54();
    }
    goto LABEL_20;
  }
  if (v11 && !+[SAAppPath isValidAppPathPlistArray:v11])
  {
    uint64_t v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002EB20();
    }
    goto LABEL_20;
  }
  if (v12 && !+[SAAppPath isValidAppPathPlistArray:v12])
  {
    uint64_t v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002EAEC();
    }
LABEL_20:

    BOOL v13 = 0;
    goto LABEL_21;
  }
  BOOL v13 = 1;
LABEL_21:

  return v13;
}

+ (BOOL)validatePaths:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (!v4)
  {
    char v8 = 1;
    goto LABEL_25;
  }
  id v6 = v4;
  uint64_t v7 = *(void *)v18;
  char v8 = 1;
  *(void *)&long long v5 = 138412290;
  long long v16 = v5;
  do
  {
    id v9 = 0;
    do
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
      if (objc_msgSend(v10, "hasPrefix:", @"~", v16))
      {
        id v11 = SALog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          uint64_t v22 = v10;
          id v12 = v11;
          BOOL v13 = "Invalid path (%@) - '~' is not resolved.";
          goto LABEL_21;
        }
        goto LABEL_14;
      }
      if (([v10 hasPrefix:@"/"] & 1) == 0)
      {
        id v11 = SALog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          uint64_t v22 = v10;
          id v12 = v11;
          BOOL v13 = "Invalid path (%@) - the provided path is relative, must provide an absolute path.";
LABEL_21:
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
        }
LABEL_14:

        char v8 = 0;
        goto LABEL_15;
      }
      if ([v10 containsString:@"/./"])
      {
        id v11 = SALog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          uint64_t v22 = v10;
          id v12 = v11;
          BOOL v13 = "Invalid path (%@) - the path contains reference to current dir.";
          goto LABEL_21;
        }
        goto LABEL_14;
      }
      if ([v10 containsString:@"/../"])
      {
        id v11 = SALog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          uint64_t v22 = v10;
          id v12 = v11;
          BOOL v13 = "Invalid path (%@) - the path contains reference to parent dir.";
          goto LABEL_21;
        }
        goto LABEL_14;
      }
LABEL_15:
      id v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    id v14 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    id v6 = v14;
  }
  while (v14);
LABEL_25:

  return v8 & 1;
}

+ (id)newFromPlist:(id)a3
{
  id v4 = a3;
  v62 = +[NSMutableSet set];
  v61 = +[NSMutableSet set];
  long long v5 = +[NSMutableSet set];
  id v6 = +[NSMutableSet set];
  uint64_t v7 = +[NSFileManager defaultManager];
  char v8 = +[NSMutableSet set];
  id v9 = +[NSArray array];
  if (![v7 fileExistsAtPath:v4]
    || ([v4 pathExtension],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isEqual:@"plist"],
        v10,
        (v11 & 1) == 0))
  {
    id v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002EE08();
    }
    goto LABEL_61;
  }
  id v60 = a1;
  id v76 = 0;
  id v12 = +[NSData dataWithContentsOfFile:v4 options:2 error:&v76];
  id v13 = v76;
  if (v13 || !v12)
  {
    v48 = SALog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_10002EBF0();
    }

    goto LABEL_60;
  }
  id v75 = 0;
  id v14 = +[NSPropertyListSerialization propertyListWithData:v12 options:0 format:0 error:&v75];
  id v13 = v75;
  if (v13 || !v14)
  {
    v49 = SALog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_10002EC60();
    }

LABEL_60:
LABEL_61:
    v47 = 0;
    goto LABEL_62;
  }
  v59 = [v14 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_OWNER"];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_WRITERS"];

  uint64_t v16 = [v14 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_PATHS"];

  long long v5 = (void *)v16;
  uint64_t v17 = [v14 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_SHARED"];

  id v6 = (void *)v17;
  v58 = (void *)v15;
  if (+[SAAppPath isValidAppPathPlist:writersID:uniquePaths:sharedPaths:](SAAppPath, "isValidAppPathPlist:writersID:uniquePaths:sharedPaths:"))
  {
    v53 = v14;
    v54 = v12;
    id v55 = v4;
    v56 = (void *)v17;
    v52 = v5;
    long long v18 = v59;
    v57 = v7;
    if (v5)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v19 = v5;
      id v20 = [v19 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v72;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v72 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v71 + 1) + 8 * i) isDirectory:1];
            if (v24)
            {
              uint64_t v25 = +[SASupport getResolvedURL:v24];
              long long v26 = (void *)v25;
              if (v25) {
                long long v27 = (void *)v25;
              }
              else {
                long long v27 = v24;
              }
              id v28 = v27;

              [v62 addObject:v28];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v71 objects:v79 count:16];
        }
        while (v21);
      }

      id v6 = v56;
      uint64_t v7 = v57;
      long long v18 = v59;
    }
    if (v6)
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v29 = v6;
      id v30 = [v29 countByEnumeratingWithState:&v67 objects:v78 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v68;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v68 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v67 + 1) + 8 * (void)j) isDirectory:1];
            if (v34)
            {
              uint64_t v35 = +[SASupport getResolvedURL:v34];
              v36 = (void *)v35;
              if (v35) {
                v37 = (void *)v35;
              }
              else {
                v37 = v34;
              }
              id v38 = v37;

              [v61 addObject:v38];
            }
          }
          id v31 = [v29 countByEnumeratingWithState:&v67 objects:v78 count:16];
        }
        while (v31);
      }

      id v6 = v56;
      uint64_t v7 = v57;
      long long v18 = v59;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v9 = v58;
    id v39 = [v9 countByEnumeratingWithState:&v63 objects:v77 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v64;
      do
      {
        for (k = 0; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(v9);
          }
          [v8 addObject:*(void *)(*((void *)&v63 + 1) + 8 * (void)k)];
        }
        id v40 = [v9 countByEnumeratingWithState:&v63 objects:v77 count:16];
      }
      while (v40);
    }

    long long v5 = v52;
    id v12 = v54;
    id v4 = v55;
    if (([v60 validatePaths:v52] & 1) == 0)
    {
      v43 = SALog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_10002ED38();
      }
    }
    if (([v60 validatePaths:v6] & 1) == 0)
    {
      v44 = SALog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_10002ECD0();
      }
    }
    id v45 = [objc_alloc((Class)v60) initWithBundleID:v18 writersIDs:v8 uniqueURLs:v62 sharedURLs:v61];
    v46 = v18;
    v47 = v45;
  }
  else
  {
    v51 = SALog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_10002EDA0();
    }

    v47 = 0;
    id v9 = v58;
  }
LABEL_62:

  return v47;
}

- (void)addUniqueURL:(id)a3
{
}

- (void)addSharedURL:(id)a3
{
}

- (void)addWriterId:(id)a3
{
  id v7 = a3;
  id v4 = [(SAAppPath *)self writersIDs];
  unsigned __int8 v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = [(SAAppPath *)self writersIDs];
    [v6 addObject:v7];
  }
}

- (void)removeUniqueURL:(id)a3
{
}

- (void)removeSharedURL:(id)a3
{
}

- (void)extendWithPropertiesFromAppPath:(id)a3
{
  id v27 = a3;
  id v4 = [(SAAppPath *)self writersIDs];
  unsigned __int8 v5 = [v27 writersIDs];
  id v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  id v7 = [(SAAppPath *)self sharedURLs];
  char v8 = [v27 sharedURLs];
  id v9 = [v8 allObjects];
  [v7 addObjectsFromArray:v9];

  id v10 = [(SAAppPath *)self uniqueURLs];
  unsigned __int8 v11 = [v27 uniqueURLs];
  id v12 = [v11 allObjects];
  [v10 addObjectsFromArray:v12];

  id v13 = [v27 bundleRecords];

  if (v13)
  {
    bundleRecords = self->_bundleRecords;
    if (!bundleRecords)
    {
      uint64_t v15 = (NSMutableSet *)objc_opt_new();
      uint64_t v16 = self->_bundleRecords;
      self->_bundleRecords = v15;

      bundleRecords = self->_bundleRecords;
    }
    uint64_t v17 = [v27 bundleRecords];
    [(NSMutableSet *)bundleRecords unionSet:v17];
  }
  long long v18 = [v27 binaryURLs];

  if (v18)
  {
    binaryURLs = self->_binaryURLs;
    if (!binaryURLs)
    {
      id v20 = (NSMutableArray *)objc_opt_new();
      id v21 = self->_binaryURLs;
      self->_binaryURLs = v20;

      binaryURLs = self->_binaryURLs;
    }
    uint64_t v22 = [v27 binaryURLs];
    [(NSMutableArray *)binaryURLs addObjectsFromArray:v22];

    uint64_t v23 = +[NSMutableSet setWithArray:self->_binaryURLs];
    uint64_t v24 = [v23 allObjects];
    uint64_t v25 = (NSMutableArray *)[v24 mutableCopy];
    long long v26 = self->_binaryURLs;
    self->_binaryURLs = v25;
  }
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"bundleID"];
  [v5 encodeObject:self->writersIDs forKey:@"writersIDs"];
  [v5 encodeObject:self->uniqueURLs forKey:@"uniqueURLs"];
  [v5 encodeObject:self->sharedURLs forKey:@"sharedURLs"];
}

- (SAAppPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SAAppPath;
  id v5 = [(SAAppPath *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    identifier = v5->identifier;
    v5->identifier = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"writersIDs"];
    writersIDs = v5->writersIDs;
    v5->writersIDs = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"uniqueURLs"];
    uniqueURLs = v5->uniqueURLs;
    v5->uniqueURLs = (NSMutableSet *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"sharedURLs"];
    sharedURLs = v5->sharedURLs;
    v5->sharedURLs = (NSMutableSet *)v21;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAAppPath)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9
{
  id v13 = a3;
  id v86 = a4;
  id v84 = a5;
  id v81 = a6;
  id v85 = a6;
  v109.receiver = self;
  v109.super_class = (Class)SAAppPath;
  uint64_t v14 = [(SAAppPath *)&v109 init];
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_21:
    uint64_t v35 = 0;
    v36 = 0;
    v37 = v84;
    goto LABEL_63;
  }
  if (!v13 || !v86)
  {
    v34 = SALog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10002EE70(v34);
    }

    goto LABEL_21;
  }
  p_dataContainerURL = (void **)&v14->_dataContainerURL;
  objc_storeStrong((id *)&v14->_dataContainerURL, a5);
  uint64_t v16 = objc_opt_new();
  writersIDs = v15->writersIDs;
  v15->writersIDs = (NSMutableSet *)v16;

  uint64_t v18 = objc_opt_new();
  uint64_t v19 = v13;
  p_uniqueURLs = (id *)&v15->uniqueURLs;
  uniqueURLs = v15->uniqueURLs;
  v15->uniqueURLs = (NSMutableSet *)v18;

  uint64_t v22 = objc_opt_new();
  sharedURLs = v15->sharedURLs;
  v15->sharedURLs = (NSMutableSet *)v22;

  objc_storeStrong((id *)&v15->identifier, a4);
  v80 = v19;
  v79 = [v19 anyObject];
  if (v15->_dataContainerURL)
  {
    if (a9) {
      p_sharedURLs = (id *)&v15->sharedURLs;
    }
    else {
      p_sharedURLs = (id *)&v15->uniqueURLs;
    }
    objc_msgSend(*p_sharedURLs, "addObject:");
  }
  uint64_t v25 = objc_opt_new();
  binaryURLs = v15->_binaryURLs;
  v15->_binaryURLs = (NSMutableArray *)v25;

  if (!a9)
  {
    long long v107 = 0uLL;
    long long v108 = 0uLL;
    long long v105 = 0uLL;
    long long v106 = 0uLL;
    id obj = v19;
    id v38 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
    if (!v38) {
      goto LABEL_58;
    }
    id v39 = v38;
    uint64_t v40 = *(void *)v106;
    uint64_t v87 = *(void *)v106;
    while (1)
    {
      uint64_t v41 = 0;
      id v88 = v39;
      do
      {
        if (*(void *)v106 != v40) {
          objc_enumerationMutation(obj);
        }
        v42 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v41);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v43 = sub_10000F920(v42);
          uint64_t v44 = [v43 allKeys];
          id v45 = v42;
          uint64_t v46 = [v45 bundleContainerURL];
          if (v46) {
            goto LABEL_32;
          }
          id v47 = [v45 executableURL];
          uint64_t v46 = sub_10000FB20((const char *)[v47 fileSystemRepresentation]);

          v48 = SALog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v113 = v46;
            _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "SAAppPath: Falling back to executable URL: %@", buf, 0xCu);
          }

          if (v46)
          {
LABEL_32:
            id v94 = (id)v46;
            [(NSMutableArray *)v15->_binaryURLs addObject:v46];
            int v95 = 1;
          }
          else
          {
            int v95 = 0;
            id v94 = 0;
          }
          v90 = v45;
          v93 = v41;
          if (v44) {
            [(NSMutableSet *)v15->writersIDs addObjectsFromArray:v44];
          }
          v91 = (void *)v44;
          v92 = v43;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v96 = [v43 allValues];
          id v49 = [v96 countByEnumeratingWithState:&v101 objects:v111 count:16];
          if (v49)
          {
            id v50 = v49;
            uint64_t v51 = *(void *)v102;
            do
            {
              for (i = 0; i != v50; i = (char *)i + 1)
              {
                if (*(void *)v102 != v51) {
                  objc_enumerationMutation(v96);
                }
                v53 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                v54 = [v53 objectForKeyedSubscript:@"CONTAINER_CLASS_APPLICATION"];
                id v55 = sub_100007EAC(v54);

                if (v55)
                {
                  if (([(NSMutableArray *)v15->_binaryURLs containsObject:v55] & 1) == 0)
                  {
                    if (!v95) {
                      goto LABEL_44;
                    }
                    v56 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v55 fileSystemRepresentation]);
                    v57 = p_uniqueURLs;
                    v58 = v15;
                    v59 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v94 fileSystemRepresentation]);
                    unsigned __int8 v60 = [v56 hasPrefix:v59];

                    uint64_t v15 = v58;
                    p_uniqueURLs = v57;

                    if ((v60 & 1) == 0) {
LABEL_44:
                    }
                      [(NSMutableArray *)v15->_binaryURLs addObject:v55];
                  }
                }
                v61 = [v53 objectForKeyedSubscript:@"CONTAINER_CLASS_APPLICATION_DATA"];
                v62 = sub_100007EAC(v61);

                if (v62 && ([*p_uniqueURLs containsObject:v62] & 1) == 0) {
                  [*p_uniqueURLs addObject:v62];
                }
              }
              id v50 = [v96 countByEnumeratingWithState:&v101 objects:v111 count:16];
            }
            while (v50);
          }

          uint64_t v40 = v87;
          id v39 = v88;
          id v63 = v92;
          uint64_t v41 = v93;
          long long v64 = v91;
        }
        else
        {
          long long v65 = [v42 executableURL];

          if (!v65) {
            goto LABEL_54;
          }
          long long v66 = v15->_binaryURLs;
          id v63 = [v42 executableURL];
          long long v64 = sub_10000FB20((const char *)[v63 fileSystemRepresentation]);
          [(NSMutableArray *)v66 addObject:v64];
        }

LABEL_54:
        uint64_t v41 = (char *)v41 + 1;
      }
      while (v41 != v39);
      id v67 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
      id v39 = v67;
      if (!v67) {
        goto LABEL_58;
      }
    }
  }
  long long v99 = 0uLL;
  long long v100 = 0uLL;
  long long v97 = 0uLL;
  long long v98 = 0uLL;
  id v27 = v19;
  id v28 = [v27 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v98;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v98 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = v15->writersIDs;
        v33 = [*(id *)(*((void *)&v97 + 1) + 8 * (void)j) bundleIdentifier];
        [(NSMutableSet *)v32 addObject:v33];
      }
      id v29 = [v27 countByEnumeratingWithState:&v97 objects:v110 count:16];
    }
    while (v29);
  }
LABEL_58:
  id v13 = v80;

  if (v85 && !*p_dataContainerURL && !a8)
  {
    uint64_t v68 = sub_10000F5CC((const char *)[v86 UTF8String], 2, (uint64_t)objc_msgSend(v79, "platform"), (uint64_t)objc_msgSend(objc_retainAutorelease(v85), "UTF8String"), 0, 0);
    long long v69 = *p_dataContainerURL;
    *p_dataContainerURL = (void *)v68;
  }
  long long v70 = (NSMutableSet *)[v80 mutableCopy];
  bundleRecords = v15->_bundleRecords;
  v15->_bundleRecords = v70;

  objc_storeStrong((id *)&v15->_personaUniqueString, v81);
  v15->_isDataSeparated = a7;
  v15->_isPlugin = a8;
  v15->_isGroup = a9;
  uint64_t v72 = +[NSNumber numberWithUnsignedLongLong:[(SAAppPath *)v15 tempSize:0]];
  lastKnownTmpSize = v15->_lastKnownTmpSize;
  v15->_lastKnownTmpSize = (NSNumber *)v72;

  uint64_t v74 = +[NSNumber numberWithUnsignedLongLong:[(SAAppPath *)v15 getAppCacheSize:0]];
  lastKnownAppCacheSize = v15->_lastKnownAppCacheSize;
  v15->_lastKnownAppCacheSize = (NSNumber *)v74;

  v15->_timestamp = nan("");
  cacheVolumePath = v15->_cacheVolumePath;
  v15->_cacheVolumePath = 0;

  v36 = v15;
  v37 = v84;
  uint64_t v35 = v79;
LABEL_63:

  return v36;
}

- (int)urgency
{
  v2 = [(SAAppPath *)self lastUsed];
  int v3 = sub_1000059BC(v2);

  return v3;
}

- (BOOL)forceHidden
{
  if (qword_10005AA30 != -1) {
    dispatch_once(&qword_10005AA30, &stru_10004C7D0);
  }
  int v3 = (void *)qword_10005AA28;
  id v4 = [(SAAppPath *)self identifier];
  id v5 = [v3 objectForKey:v4];
  unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];

  return v6;
}

- (BOOL)forceVisible
{
  if (qword_10005AA40 != -1) {
    dispatch_once(&qword_10005AA40, &stru_10004C7F0);
  }
  int v3 = (void *)qword_10005AA38;
  id v4 = [(SAAppPath *)self identifier];
  id v5 = [v3 objectForKey:v4];
  unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];

  if (v6) {
    return 1;
  }
  uint64_t v8 = [(SAAppPath *)self identifier];
  BOOL v9 = +[SALLMList isLLM:v8];

  return v9;
}

- (id)appRecord
{
  uint64_t v11 = 0;
  id v12 = (id *)&v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100008538;
  uint64_t v15 = sub_100008548;
  id v16 = 0;
  int v3 = [(SAAppPath *)self bundleRecords];
  id v4 = [v3 anyObject];

  id v5 = [(SAAppPath *)self bundleRecords];
  if ([v5 count] == (id)1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_storeStrong(v12 + 5, v4);
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [(SAAppPath *)self identifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008550;
  v10[3] = &unk_10004C818;
  v10[4] = self;
  v10[5] = &v11;
  +[SASupport getLSAppRecordForBundle:v7 reply:v10];

LABEL_6:
  id v8 = v12[5];

  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)isAppUserVisible
{
  if (![(SAAppPath *)self forceVisible])
  {
    if ([(SAAppPath *)self forceHidden]
      || [(SAAppPath *)self isGroup]
      || [(SAAppPath *)self isPlugin])
    {
      return 0;
    }
    id v5 = [(SAAppPath *)self appRecord];
    unsigned __int8 v6 = v5;
    if (v5)
    {
      id v7 = [v5 applicationState];
      unsigned __int8 v8 = [v7 isRestricted];

      if ((v8 & 1) == 0)
      {
        if (([v6 isDeletable] & 1) != 0
          || [v6 developerType] != 1)
        {
          unsigned __int8 v3 = 1;
        }
        else
        {
          unsigned __int8 v3 = [v6 isSystemPlaceholder];
        }
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v9 = SALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002EF9C(self, v9);
      }
    }
    unsigned __int8 v3 = 0;
LABEL_18:

    return v3;
  }
  return 1;
}

- (BOOL)isUserVisible
{
  isUserVisible = self->__isUserVisible;
  if (!isUserVisible)
  {
    id v4 = +[NSNumber numberWithBool:[(SAAppPath *)self isAppUserVisible]];
    id v5 = self->__isUserVisible;
    self->__isUserVisible = v4;

    isUserVisible = self->__isUserVisible;
  }

  return [(NSNumber *)isUserVisible BOOLValue];
}

- (id)bundleSet
{
  unsigned __int8 v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_bundleRecords;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "bundleIdentifier", (void)v12);
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = +[NSSet setWithArray:v3];

  return v10;
}

- (id)getDictionary
{
  unsigned __int8 v3 = objc_opt_new();
  id v4 = v3;
  if (v3)
  {
    [v3 setObject:self->identifier forKeyedSubscript:@"SPACE_ATTRIBUTION_OWNER"];
    id v5 = objc_opt_new();
    [v4 setObject:v5 forKeyedSubscript:@"SPACE_ATTRIBUTION_WRITERS"];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v6 = self->writersIDs;
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v59;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v59 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          long long v12 = [v4 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_WRITERS"];
          [v12 addObject:v11];
        }
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v58 objects:v65 count:16];
      }
      while (v8);
    }

    long long v13 = objc_opt_new();
    [v4 setObject:v13 forKeyedSubscript:@"SPACE_ATTRIBUTION_PATHS"];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v14 = self->uniqueURLs;
    id v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v55;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
          id v20 = [v4 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_PATHS"];
          uint64_t v21 = [v19 absoluteString];
          [v20 addObject:v21];
        }
        id v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v16);
    }

    uint64_t v22 = objc_opt_new();
    [v4 setObject:v22 forKeyedSubscript:@"SPACE_ATTRIBUTION_SHARED"];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v23 = self->sharedURLs;
    id v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v51;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v50 + 1) + 8 * (void)k);
          id v29 = [v4 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_SHARED"];
          uint64_t v30 = [v28 absoluteString];
          [v29 addObject:v30];
        }
        id v25 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v25);
    }

    id v31 = objc_opt_new();
    [v4 setObject:v31 forKeyedSubscript:@"SPACE_ATTRIBUTION_EXECUTABLE"];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v32 = self->_binaryURLs;
    id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v47;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v46 + 1) + 8 * (void)m);
          id v38 = objc_msgSend(v4, "objectForKeyedSubscript:", @"SPACE_ATTRIBUTION_EXECUTABLE", (void)v46);
          id v39 = [v37 absoluteString];
          [v38 addObject:v39];
        }
        id v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v46 objects:v62 count:16];
      }
      while (v34);
    }

    uint64_t v40 = [(SAAppPath *)self dataContainerURL];

    if (v40)
    {
      uint64_t v41 = [(SAAppPath *)self dataContainerURL];
      v42 = [v41 path];
      [v4 setObject:v42 forKeyedSubscript:@"SPACE_ATTRIBUTION_CONTAINER_URL"];
    }
    v43 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[SAAppPath getAppCacheSize:](self, "getAppCacheSize:", 0, (void)v46));
    [v4 setObject:v43 forKeyedSubscript:@"cache_size"];

    uint64_t v44 = +[NSNumber numberWithUnsignedLongLong:[(SAAppPath *)self tempSize:0]];
    [v4 setObject:v44 forKeyedSubscript:@"tmp_size"];
  }

  return v4;
}

+ (SAAppPath)appPathWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v15)
  {
    LOBYTE(v21) = a9;
    uint64_t v18 = [[SAAppPath alloc] initWithBundleRecords:v14 identifier:v15 dataContainerURL:v16 personaUniqueString:v17 isDataSeparated:v10 isPlugin:v9 isGroup:v21];
    if (v18) {
      goto LABEL_9;
    }
    uint64_t v19 = SALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002F068();
    }
  }
  else
  {
    uint64_t v19 = SALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002F034();
    }
    uint64_t v18 = 0;
  }

LABEL_9:

  return v18;
}

- (void)enableDirStats
{
  unsigned __int8 v3 = [(SAAppPath *)self dataContainerURL];
  id v4 = [v3 path];
  int v5 = +[SASupport enableDirStatInfoForPath:v4 withOptions:0 andGetInfo:&self->dstats];

  if (v5)
  {
    id v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002F0D0(v5);
    }
  }
}

- (unint64_t)dirstatsCloneSize:(BOOL)a3
{
  if (a3 || ![(SAAppPath *)self validate]) {
    [(SAAppPath *)self enableDirStats];
  }
  return self->dstats.clone_size;
}

- (unint64_t)dirstatsPurgeableSize:(BOOL)a3
{
  if (a3 || ![(SAAppPath *)self validate]) {
    [(SAAppPath *)self enableDirStats];
  }
  return self->dstats.purgeable_size;
}

- (unint64_t)dirstatsPhysicalSize:(BOOL)a3
{
  if (a3 || ![(SAAppPath *)self validate]) {
    [(SAAppPath *)self enableDirStats];
  }
  unint64_t physical_size = self->dstats.physical_size;
  unint64_t v5 = self->dstats.purgeable_size + self->dstats.clone_size;
  unint64_t result = physical_size - v5;
  if (physical_size < v5)
  {
    id v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002F148();
    }

    return self->dstats.physical_size;
  }
  return result;
}

- (unint64_t)getAppCacheSize:(BOOL)a3
{
  unint64_t v5 = [(SAAppPath *)self cachePath];

  if (!v5) {
    return 0;
  }
  if (a3 || ![(SAAppPath *)self validate])
  {
    id v6 = objc_opt_new();
    id v7 = [(SAAppPath *)self cachePath];
    id v8 = [v6 getFolderSizeAtPath:v7 options:2];

    -[SAAppPath setCacheDirStatsID:](self, "setCacheDirStatsID:", [v8 dirstatsID]);
    BOOL v9 = [v8 volumePath];
    [(SAAppPath *)self setCacheVolumePath:v9];

    BOOL v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 dataSize]);
    [(SAAppPath *)self setLastKnownAppCacheSize:v10];
  }
  uint64_t v11 = [(SAAppPath *)self lastKnownAppCacheSize];
  id v12 = [v11 unsignedLongLongValue];

  return (unint64_t)v12;
}

- (unint64_t)tempSize:(BOOL)a3
{
  unint64_t v5 = [(SAAppPath *)self tmpPath];

  if (!v5) {
    return 0;
  }
  if (a3 || ![(SAAppPath *)self validate])
  {
    id v6 = [(SAAppPath *)self tmpPath];
    id v7 = [0 getFolderSizeAtPath:v6 options:2];

    id v8 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v7 dataSize]);
    [(SAAppPath *)self setLastKnownTmpSize:v8];
  }
  BOOL v9 = [(SAAppPath *)self lastKnownTmpSize];
  id v10 = [v9 unsignedLongLongValue];

  return (unint64_t)v10;
}

- (void)addBundleRecord:(id)a3
{
  id v7 = a3;
  id v4 = [(SAAppPath *)self bundleRecords];
  unsigned __int8 v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = [(SAAppPath *)self bundleRecords];
    [v6 addObject:v7];
  }
}

- (void)addBundleRecords:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SAAppPath *)self addBundleRecord:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)cachePath
{
  unsigned __int8 v3 = [(SAAppPath *)self dataContainerURL];

  if (v3)
  {
    id v4 = [(SAAppPath *)self dataContainerURL];
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v4 fileSystemRepresentation]);
    id v6 = [v5 stringByAppendingPathComponent:@"Library/Caches"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tmpPath
{
  unsigned __int8 v3 = [(SAAppPath *)self dataContainerURL];

  if (v3)
  {
    id v4 = [(SAAppPath *)self dataContainerURL];
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v4 fileSystemRepresentation]);
    id v6 = [v5 stringByAppendingPathComponent:@"tmp"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)validate
{
  return 1;
}

- (int64_t)threeDaysAgo
{
  v4.tv_sec = 0;
  *(void *)&v4.tv_usec = 0;
  if (gettimeofday(&v4, 0))
  {
    v2 = SALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10002F17C();
    }
  }
  return v4.tv_sec - 259200;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableSet)writersIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWritersIDs:(id)a3
{
}

- (NSMutableSet)uniqueURLs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUniqueURLs:(id)a3
{
}

- (NSMutableSet)sharedURLs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSharedURLs:(id)a3
{
}

- (NSMutableArray)binaryURLs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBinaryURLs:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (BOOL)isPlugin
{
  return self->_isPlugin;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (NSMutableSet)bundleRecords
{
  return self->_bundleRecords;
}

- (void)setBundleRecords:(id)a3
{
}

- (NSNumber)lastKnownAppCacheSize
{
  return self->_lastKnownAppCacheSize;
}

- (void)setLastKnownAppCacheSize:(id)a3
{
}

- (NSNumber)lastKnownTmpSize
{
  return self->_lastKnownTmpSize;
}

- (void)setLastKnownTmpSize:(id)a3
{
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)cacheDeletePluginSize
{
  return self->_cacheDeletePluginSize;
}

- (void)setCacheDeletePluginSize:(unint64_t)a3
{
  self->_cacheDeletePluginSize = a3;
}

- (unint64_t)cacheDirStatsID
{
  return self->_cacheDirStatsID;
}

- (void)setCacheDirStatsID:(unint64_t)a3
{
  self->_cacheDirStatsID = a3;
}

- (NSString)cacheVolumePath
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCacheVolumePath:(id)a3
{
}

- (NSNumber)_isUserVisible
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)set_isUserVisible:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__isUserVisible, 0);
  objc_storeStrong((id *)&self->_cacheVolumePath, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_lastKnownTmpSize, 0);
  objc_storeStrong((id *)&self->_lastKnownAppCacheSize, 0);
  objc_storeStrong((id *)&self->_bundleRecords, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_binaryURLs, 0);
  objc_storeStrong((id *)&self->sharedURLs, 0);
  objc_storeStrong((id *)&self->uniqueURLs, 0);
  objc_storeStrong((id *)&self->writersIDs, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

@end