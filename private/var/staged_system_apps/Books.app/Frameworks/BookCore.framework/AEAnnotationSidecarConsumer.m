@interface AEAnnotationSidecarConsumer
+ (id)annotationUuidsFromDictionaryRepresentations:(id)a3;
+ (id)doesNotExistTimestamp;
+ (id)modificationDatesFromDictionaryRepresentations:(id)a3;
- (BOOL)acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a3 assetID:(id)a4 provider:(id)a5;
- (id)fileTimestamp;
- (id)timestampCacheKey;
- (void)cacheTimestamp;
- (void)mergeIntoAnnotationProvider:(id)a3 completionBlock:(id)a4;
- (void)read;
@end

@implementation AEAnnotationSidecarConsumer

+ (id)annotationUuidsFromDictionaryRepresentations:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
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
        +[AEAnnotation annotationUuidFromDictionaryRepresentation:](AEAnnotation, "annotationUuidFromDictionaryRepresentation:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ([(__CFString *)v10 length])
        {
          v11 = v4;
          CFStringRef v12 = v10;
        }
        else
        {
          v11 = v4;
          CFStringRef v12 = &stru_2CE418;
        }
        [v11 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)modificationDatesFromDictionaryRepresentations:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
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
        v10 = +[AEAnnotation lastModificationFromDictionaryRepresentation:](AEAnnotation, "lastModificationFromDictionaryRepresentation:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v10)
        {
          [v4 addObject:v10];
        }
        else
        {
          v11 = +[NSNumber numberWithInt:0];
          [v4 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)mergeIntoAnnotationProvider:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  generation = self->super._generation;
  self->super._generation = 0;

  bookmarks = self->_bookmarks;
  self->_bookmarks = 0;

  acknowledgedMismatchingAssetIDs = self->_acknowledgedMismatchingAssetIDs;
  self->_acknowledgedMismatchingAssetIDs = 0;

  if (v6)
  {
    [(AEAnnotationSidecarConsumer *)self read];
    CFStringRef v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    long long v14 = sub_DCE20;
    long long v15 = &unk_2C8CC0;
    long long v16 = self;
    id v17 = v6;
    [v17 performBlockOnUserSideQueueAndWait:&v12];
    [(AEAnnotationSidecarConsumer *)self cacheTimestamp];
  }
  v11 = self->_bookmarks;
  self->_bookmarks = 0;

  if (v7) {
    v7[2](v7);
  }
}

+ (id)doesNotExistTimestamp
{
  return @"DidNotExist";
}

- (id)timestampCacheKey
{
  v2 = [(NSString *)self->super._filePath lastPathComponent];
  id v3 = [v2 stringByAppendingString:@"-Timestamp"];

  return v3;
}

- (id)fileTimestamp
{
  id v3 = objc_alloc_init((Class)NSFileManager);
  if ([v3 fileExistsAtPath:self->super._filePath])
  {
    v4 = [v3 attributesOfItemAtPath:self->super._filePath error:0];
    id v5 = [v4 objectForKey:NSFileModificationDate];
    if (v5)
    {
      id v6 = objc_alloc_init((Class)NSDateFormatter);
      [v6 setDateFormat:@"HH:mm:ss;yyyy-MM-dd"];
      id v7 = [v6 stringFromDate:v5];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = +[AEAnnotationSidecarConsumer doesNotExistTimestamp];
  }
  objc_storeStrong((id *)&self->_timestamp, v7);

  return v7;
}

- (void)cacheTimestamp
{
  if ([(NSString *)self->_timestamp length]
    && (id v3 = self->_timestamp,
        +[AEAnnotationSidecarConsumer doesNotExistTimestamp], v4 = objc_claimAutoreleasedReturnValue(), LOBYTE(v3) = [(NSString *)v3 isEqualToString:v4], v4, (v3 & 1) == 0))
  {
    self->super._userDefaultsChanged = 1;
    id v7 = +[NSUserDefaults standardUserDefaults];
    timestamp = self->_timestamp;
    id v5 = [(AEAnnotationSidecarConsumer *)self timestampCacheKey];
    [v7 setObject:timestamp forKey:v5];
  }
  else
  {
    self->super._userDefaultsChanged = 1;
    id v7 = +[NSUserDefaults standardUserDefaults];
    id v5 = [(AEAnnotationSidecarConsumer *)self timestampCacheKey];
    [v7 removeObjectForKey:v5];
  }
}

- (void)read
{
  generation = self->super._generation;
  self->super._generation = 0;

  bookmarks = self->_bookmarks;
  self->_bookmarks = 0;

  id v5 = self->_timestamp;
  if (!v5)
  {
    id v5 = [(AEAnnotationSidecarConsumer *)self fileTimestamp];
  }
  id v6 = +[AEAnnotationSidecarConsumer doesNotExistTimestamp];
  unsigned __int8 v7 = [(NSString *)v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:self->super._filePath];
    if (v8)
    {
      v9 = +[AEAnnotationSidecarProducer defaultBookmarkContainerKey];
      v10 = [v8 objectForKey:v9];

      if (v10)
      {
        v11 = +[AEAnnotationSidecarProducer defaultBookmarkGenerationKey];
        CFStringRef v12 = [v10 objectForKey:v11];
        uint64_t v13 = self->super._generation;
        self->super._generation = v12;

        long long v14 = [(id)objc_opt_class() defaultWrapperRevisionKey];
        long long v15 = [v10 objectForKey:v14];

        if (v15)
        {
          if ([@"5" compare:v15 options:64] == (id)-1)
          {
            v21 = BCIMLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              int v23 = 136315650;
              v24 = "-[AEAnnotationSidecarConsumer read]";
              __int16 v25 = 2080;
              v26 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/AEAnnot"
                    "ationSidecarConsumer.m";
              __int16 v27 = 1024;
              int v28 = 310;
              _os_log_impl(&def_7D91C, v21, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v23, 0x1Cu);
            }

            v22 = BCIMLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              int v23 = 138412546;
              v24 = v15;
              __int16 v25 = 2112;
              v26 = @"5";
              _os_log_impl(&def_7D91C, v22, OS_LOG_TYPE_INFO, "@\"Can't consume sidecar. Wrapper-Revision too high. Wrapper-Revision {%@} Annotation-Current {%@}\"", (uint8_t *)&v23, 0x16u);
            }
          }
          else
          {
            long long v16 = [v10 objectForKey:v15];
            id v17 = self->_bookmarks;
            self->_bookmarks = v16;
          }
        }
        else
        {
          v18 = +[AEAnnotationSidecarProducer legacyBookmarkKey];
          v19 = [v10 objectForKey:v18];
          v20 = self->_bookmarks;
          self->_bookmarks = v19;
        }
      }
    }
  }
}

- (BOOL)acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a3 assetID:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_acknowledgedMismatchingAssetIDs)
  {
    if (v8)
    {
LABEL_3:
      id v11 = [v9 stringByAppendingFormat:@":%@", v8];
      goto LABEL_6;
    }
  }
  else
  {
    CFStringRef v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    acknowledgedMismatchingAssetIDs = self->_acknowledgedMismatchingAssetIDs;
    self->_acknowledgedMismatchingAssetIDs = v12;

    if (v8) {
      goto LABEL_3;
    }
  }
  id v11 = v9;
LABEL_6:
  long long v14 = v11;
  if (([(NSMutableSet *)self->_acknowledgedMismatchingAssetIDs containsObject:v11] & 1) == 0)
  {
    if (![v10 acknowledgeMergingAnnotationsWithAssetVersionMismatch:v8 assetID:v9])
    {
      BOOL v15 = 0;
      goto LABEL_11;
    }
    [(NSMutableSet *)self->_acknowledgedMismatchingAssetIDs addObject:v14];
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedMismatchingAssetIDs, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_bookmarks, 0);
}

@end