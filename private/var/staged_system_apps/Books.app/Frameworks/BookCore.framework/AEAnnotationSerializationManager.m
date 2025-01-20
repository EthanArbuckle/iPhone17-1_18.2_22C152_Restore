@interface AEAnnotationSerializationManager
+ (BOOL)managedBooksAllowedToSync;
+ (id)annotationSerializationManagerWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7;
+ (id)annotationSerializationManagerWithBookMetadataProvider:(id)a3;
- (AEAnnotationSerializationManager)initWithBookMetadataProvider:(id)a3;
- (AEBookMetadataProvider)bookMetadataProvider;
- (BOOL)isAssetOfflineWithAssetID:(id)a3;
- (BOOL)p_ensureDirectoryPathExists:(id)a3;
- (BOOL)takeBookOfflineIfManagedWithAnnotationProvider:(id)a3 assetID:(id)a4;
- (id)annotationProviderForOfflineDBWithAssetID:(id)a3;
- (id)p_filenameForOfflineDBWithAssetID:(id)a3;
- (id)urlForOfflineDBWithAssetID:(id)a3;
- (void)protected_takeAssetOfflineWithProvider:(id)a3 assetID:(id)a4 copyData:(BOOL)a5;
- (void)removeOfflineDBFilesWithAssetID:(id)a3 exceptBookVersionString:(id)a4;
- (void)setBookMetadataProvider:(id)a3;
@end

@implementation AEAnnotationSerializationManager

+ (BOOL)managedBooksAllowedToSync
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isEnterpriseBookMetadataSyncAllowed];

  return v3;
}

+ (id)annotationSerializationManagerWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7
{
  v7 = +[AESingleBookMetadataProvider singleBookMetadataProviderWithAssetID:a3 assetURL:a4 bookVersionString:a5 pathToAssetContextDirectory:a6 isManagedBook:a7];
  v8 = [(id)objc_opt_class() annotationSerializationManagerWithBookMetadataProvider:v7];

  return v8;
}

+ (id)annotationSerializationManagerWithBookMetadataProvider:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBookMetadataProvider:v3];

  return v4;
}

- (AEAnnotationSerializationManager)initWithBookMetadataProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AEAnnotationSerializationManager;
  v5 = [(AEAnnotationSerializationManager *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AEAnnotationSerializationManager *)v5 setBookMetadataProvider:v4];
  }

  return v6;
}

- (id)annotationProviderForOfflineDBWithAssetID:(id)a3
{
  id v3 = [(AEAnnotationSerializationManager *)self urlForOfflineDBWithAssetID:a3];
  if (v3)
  {
    v7 = [[AEAnnotationProvider alloc] initWithPersistentStoreURL:v3];
    if (!v7) {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 111, (uint64_t)"-[AEAnnotationSerializationManager annotationProviderForOfflineDBWithAssetID:]", (uint64_t)"provider", @"failed to open annotation provider for url '%@'", v4, v5, v6, (uint64_t)v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)urlForOfflineDBWithAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];
  unsigned int v6 = [v5 isManagedWithAssetID:v4];

  v7 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];

  if (!v7)
  {
    v13 = 0;
    goto LABEL_10;
  }
  objc_super v8 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];
  v9 = v8;
  if (v6)
  {
    v10 = [v8 assetURLForAssetID:v4];

    v11 = [v10 URLByDeletingLastPathComponent];
    v12 = [(AEAnnotationSerializationManager *)self p_filenameForOfflineDBWithAssetID:v4];
    v13 = [v11 URLByAppendingPathComponent:v12];
  }
  else
  {
    v10 = [v8 pathToContextDirectoryForAssetID:v4];

    if (!v10)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v14 = +[NSFileManager defaultManager];
    uint64_t v17 = 0;
    [v14 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v17];

    v15 = [(AEAnnotationSerializationManager *)self p_filenameForOfflineDBWithAssetID:v4];
    v11 = [v10 stringByAppendingPathComponent:v15];

    v13 = +[NSURL fileURLWithPath:v11];
  }

LABEL_9:
LABEL_10:

  return v13;
}

- (BOOL)isAssetOfflineWithAssetID:(id)a3
{
  id v3 = [(AEAnnotationSerializationManager *)self urlForOfflineDBWithAssetID:a3];
  id v4 = +[NSFileManager defaultManager];
  uint64_t v5 = [v3 path];
  unsigned __int8 v6 = [v4 fileExistsAtPath:v5];

  return v6;
}

- (void)removeOfflineDBFilesWithAssetID:(id)a3 exceptBookVersionString:(id)a4
{
  id v6 = a3;
  v7 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];

  if (v7)
  {
    objc_super v8 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];
    uint64_t v9 = [v8 pathToContextDirectoryForAssetID:v6];

    v27 = (void *)v9;
    if (v9)
    {
      if (a4)
      {
        v10 = [(AEAnnotationSerializationManager *)self p_filenameForOfflineDBWithAssetID:v6];
      }
      else
      {
        v10 = 0;
      }
      v11 = &_s13BookAnalytics16ReadingGoalsDataVSQAAMc_ptr;
      v12 = +[NSFileManager defaultManager];
      id v33 = 0;
      id v13 = [v12 contentsOfDirectoryAtPath:v27 error:&v33];
      id v14 = v33;

      if (v14)
      {
        NSLog(@"unexpected error reading file system: %@", v14);
      }
      else
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = v13;
        id v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v15)
        {
          id v16 = v15;
          id v26 = v6;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v13);
              }
              v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if ([v19 hasPrefix:@"offlineNotes"]
                && ([v19 hasPrefix:v10] & 1) == 0)
              {
                id v20 = v13;
                v21 = v10;
                v22 = [v27 stringByAppendingPathComponent:v19];
                v23 = v11;
                v24 = [v11[348] defaultManager];
                id v28 = 0;
                [v24 removeItemAtPath:v22 error:&v28];
                id v25 = v28;

                if (v25) {
                  NSLog(@"error deleting offline annotation database file '%@': '%@'", v19, v25);
                }

                v11 = v23;
                v10 = v21;
                id v13 = v20;
              }
            }
            id v16 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v16);
          id v14 = v13;
          id v6 = v26;
        }
        else
        {
          id v14 = v13;
        }
      }
    }
  }
}

- (BOOL)takeBookOfflineIfManagedWithAnnotationProvider:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];

  if (v8)
  {
    uint64_t v9 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];
    unsigned int v10 = [v9 isManagedWithAssetID:v7];

    if (v10)
    {
      unsigned __int8 v11 = [(AEAnnotationSerializationManager *)self isAssetOfflineWithAssetID:v7];
      unsigned __int8 v12 = [(id)objc_opt_class() managedBooksAllowedToSync];
      LOBYTE(v8) = 0;
      if ((v11 & 1) == 0 && (v12 & 1) == 0)
      {
        LOBYTE(v8) = 1;
        [(AEAnnotationSerializationManager *)self protected_takeAssetOfflineWithProvider:v6 assetID:v7 copyData:1];
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

- (BOOL)p_ensureDirectoryPathExists:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = +[NSFileManager defaultManager];
  uint64_t v11 = 0;
  [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11];
  uint64_t v5 = v11;

  BOOL v9 = v5 == 0;
  if (v5)
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 243, (uint64_t)"-[AEAnnotationSerializationManager p_ensureDirectoryPathExists:]", (uint64_t)"!error", @"Unable to ensure directory path exists at '%@'", v6, v7, v8, (uint64_t)v3);
LABEL_4:
    BOOL v9 = 0;
  }

  return v9;
}

- (void)protected_takeAssetOfflineWithProvider:(id)a3 assetID:(id)a4 copyData:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(AEAnnotationSerializationManager *)self isAssetOfflineWithAssetID:v9])
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 255, (uint64_t)"-[AEAnnotationSerializationManager protected_takeAssetOfflineWithProvider:assetID:copyData:]", (uint64_t)"!isAssetAlreadyOffline", @"expected the asset was not yet offline", v10, v11, v12, v23);
    id v13 = BKMobileCloudSyncAnnotationsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1EEE58((uint64_t)v9, v13);
    }
  }
  else
  {
    id v13 = [(AEAnnotationSerializationManager *)self urlForOfflineDBWithAssetID:v9];
    id v14 = BKMobileCloudSyncAnnotationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&def_7D91C, v14, OS_LOG_TYPE_DEFAULT, "Taking asset offline. assetID: %@, db url: %@", buf, 0x16u);
    }

    if (v13
      && ([v13 URLByDeletingLastPathComponent],
          id v15 = objc_claimAutoreleasedReturnValue(),
          [v15 path],
          id v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [(AEAnnotationSerializationManager *)self p_ensureDirectoryPathExists:v16], v16, v15, v17))
    {
      if (a5) {
        +[AEAnnotation predicateForAnnotationsWithAssetID:v9 includingDeleted:0];
      }
      else {
      v19 = +[NSPredicate predicateWithValue:0];
      }
      id v24 = 0;
      [v8 exportAnnotationsMatchingPredicate:v19 toURL:v13 withType:0 error:&v24];
      v18 = v24;
      if (v18) {
        BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 271, (uint64_t)"-[AEAnnotationSerializationManager protected_takeAssetOfflineWithProvider:assetID:copyData:]", (uint64_t)"error == nil", @"Exporting annotations to offline DB, error: '%@'", v20, v21, v22, (uint64_t)v18);
      }
    }
    else
    {
      v18 = BKMobileCloudSyncAnnotationsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1EEED0(v18);
      }
    }
  }
}

- (id)p_filenameForOfflineDBWithAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AEAnnotationSerializationManager *)self bookMetadataProvider];
  uint64_t v6 = [v5 bookVersionStringForAssetID:v4];

  if (v4)
  {
    CFStringRef v10 = &stru_2CE418;
    if (v6) {
      CFStringRef v10 = v6;
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@:%@:%@:.sqlite", @"offlineNotes", v4, v10];
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 284, (uint64_t)"-[AEAnnotationSerializationManager p_filenameForOfflineDBWithAssetID:]", (uint64_t)"assetID != nil", @"expected asset ID but got nil", v7, v8, v9, v13);
    uint64_t v11 = 0;
  }

  return v11;
}

- (AEBookMetadataProvider)bookMetadataProvider
{
  return self->bookMetadataProvider;
}

- (void)setBookMetadataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end