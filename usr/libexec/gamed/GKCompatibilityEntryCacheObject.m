@interface GKCompatibilityEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKCompatibilityEntryCacheObject

+ (id)entityName
{
  return @"CompatibilityMatrixEntry";
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCompatibilityEntryCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKCompatibilityEntryCacheObject internalRepresentation]", [v7 UTF8String], 2678);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = +[GKCompatibilityEntryInternal internalRepresentation];
  v10 = [(GKCompatibilityEntryCacheObject *)self bundleID];
  [v9 setBundleID:v10];

  v11 = [(GKCompatibilityEntryCacheObject *)self adamID];
  [v9 setAdamID:v11];

  v12 = [(GKCompatibilityEntryCacheObject *)self platform];
  [v9 setPlatform:[v12 integerValue]];

  id v13 = objc_alloc((Class)NSMutableSet);
  v14 = [(GKCompatibilityEntryCacheObject *)self versions];
  id v15 = [v13 initWithCapacity:[v14 count]];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v16 = [(GKCompatibilityEntryCacheObject *)self versions];
  id v17 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v36 + 1) + 8 * i) version];
        [v15 addObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v18);
  }

  [v9 setVersions:v15];
  id v22 = objc_alloc((Class)NSMutableSet);
  v23 = [(GKCompatibilityEntryCacheObject *)self shortVersions];
  id v24 = [v22 initWithCapacity:[v23 count]];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v25 = [(GKCompatibilityEntryCacheObject *)self shortVersions];
  id v26 = [v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) shortVersion];
        [v24 addObject:v30];
      }
      id v27 = [v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v27);
  }

  [v9 setShortVersions:v24];

  return v9;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCompatibilityEntryCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKCompatibilityEntryCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 2701);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [(GKCompatibilityEntryCacheObject *)self managedObjectContext];
  v60.receiver = self;
  v60.super_class = (Class)GKCompatibilityEntryCacheObject;
  [(GKCacheObject *)&v60 updateWithServerRepresentation:v4];
  v12 = [(GKCompatibilityEntryCacheObject *)self versions];
  [v11 _gkDeleteObjects:v12];

  id v13 = [v4 objectForKey:@"bundle-id"];
  [(GKCompatibilityEntryCacheObject *)self setBundleID:v13];
  v14 = [v4 objectForKey:@"adam-id"];
  [(GKCompatibilityEntryCacheObject *)self setAdamID:v14];
  id v15 = [v4 objectForKey:@"platform"];
  v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:v15]);
  [(GKCompatibilityEntryCacheObject *)self setPlatform:v16];

  id v17 = [v4 objectForKey:@"versions"];
  id v18 = v17;
  if (v13 && [v17 count])
  {
    v45 = v15;
    v48 = self;
    id v50 = v4;
    id v19 = [objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:[v18 count]];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v43 = v18;
    id v20 = v18;
    id v21 = [v20 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v57;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v57 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = [v25 objectForKey:@"bundle-version"];
          }
          else
          {
            id v26 = v25;
          }
          id v27 = v26;
          if (v26)
          {
            uint64_t v28 = [(GKCacheObject *)[GKCompatibilityVersionCacheObject alloc] initWithManagedObjectContext:v11];
            [(GKCompatibilityVersionCacheObject *)v28 setVersion:v27];
            [v19 addObject:v28];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v22);
    }

    self = v48;
    [(GKCompatibilityEntryCacheObject *)v48 setVersions:v19];

    id v4 = v50;
    id v18 = v43;
    id v15 = v45;
  }
  v29 = [(GKCompatibilityEntryCacheObject *)self shortVersions];
  [v11 _gkDeleteObjects:v29];

  v30 = [v4 objectForKey:@"short-versions"];
  v31 = v30;
  if (v13 && [v30 count])
  {
    v44 = v18;
    v46 = v15;
    v47 = v13;
    v49 = self;
    id v51 = v4;
    id v32 = [objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:[v31 count]];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v42 = v31;
    id v33 = v31;
    id v34 = [v33 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v53;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v53 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v39 = [v38 objectForKey:@"short-bundle-version"];
          }
          else
          {
            id v39 = v38;
          }
          v40 = v39;
          if (v39)
          {
            v41 = [(GKCacheObject *)[GKCompatibilityShortVersionCacheObject alloc] initWithManagedObjectContext:v11];
            [(GKCompatibilityShortVersionCacheObject *)v41 setShortVersion:v40];
            [v32 addObject:v41];
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v35);
    }

    [(GKCompatibilityEntryCacheObject *)v49 setShortVersions:v32];
    id v4 = v51;
    id v13 = v47;
    id v18 = v44;
    id v15 = v46;
    v31 = v42;
  }
}

@end