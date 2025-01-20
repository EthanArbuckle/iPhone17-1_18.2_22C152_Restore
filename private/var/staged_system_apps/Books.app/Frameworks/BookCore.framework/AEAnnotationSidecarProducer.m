@interface AEAnnotationSidecarProducer
+ (id)defaultBookmarkContainerKey;
+ (id)defaultBookmarkGenerationKey;
+ (id)defaultWrapperRevisionKey;
+ (id)legacyBookmarkKey;
- (AEAnnotationSidecarProducer)initWithName:(id)a3;
- (id)cachedGeneration;
- (id)generationCacheKey;
- (id)maxAnnotationVersionInMOC:(id)a3;
- (id)newBookmarkDictionarysArray:(id)a3 modern:(BOOL)a4;
- (void)appendData:(id)a3;
- (void)cacheGeneration;
- (void)dealloc;
- (void)rewriteWithAnnotationProvider:(id)a3 completionBlock:(id)a4;
@end

@implementation AEAnnotationSidecarProducer

- (AEAnnotationSidecarProducer)initWithName:(id)a3
{
  id v4 = a3;
  v5 = [(AEAnnotationSidecarProducer *)self init];
  if (v5 && [v4 length])
  {
    v6 = +[NSURL bu_booksRepositoryURL];
    v7 = [v6 URLByAppendingPathComponent:v4];
    uint64_t v8 = [v7 path];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v8;
  }
  return v5;
}

- (void)dealloc
{
  filePath = self->_filePath;
  self->_filePath = 0;

  generation = self->_generation;
  self->_generation = 0;

  if (self->_userDefaultsChanged)
  {
    v5 = +[NSUserDefaults standardUserDefaults];
    [v5 synchronize];
  }
  v6.receiver = self;
  v6.super_class = (Class)AEAnnotationSidecarProducer;
  [(AEAnnotationSidecarProducer *)&v6 dealloc];
}

+ (id)legacyBookmarkKey
{
  return @"Bookmarks";
}

+ (id)defaultBookmarkGenerationKey
{
  return @"Generation";
}

+ (id)defaultWrapperRevisionKey
{
  return @"Wrapper-Revision";
}

+ (id)defaultBookmarkContainerKey
{
  return @"Bookmark-Container-12202011";
}

- (id)generationCacheKey
{
  v2 = [(NSString *)self->_filePath lastPathComponent];
  v3 = [v2 stringByAppendingString:@"-Generation"];

  return v3;
}

- (id)cachedGeneration
{
  v2 = [(AEAnnotationSidecarProducer *)self generationCacheKey];
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:v2];

  return v4;
}

- (void)cacheGeneration
{
  int v3 = [(NSNumber *)self->_generation intValue];
  self->_userDefaultsChanged = 1;
  id v6 = +[NSUserDefaults standardUserDefaults];
  if (v3 < 1)
  {
    v5 = [(AEAnnotationSidecarProducer *)self generationCacheKey];
    [v6 removeObjectForKey:v5];
  }
  else
  {
    generation = self->_generation;
    v5 = [(AEAnnotationSidecarProducer *)self generationCacheKey];
    [v6 setObject:generation forKey:v5];
  }
}

- (void)rewriteWithAnnotationProvider:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  generation = self->_generation;
  self->_generation = 0;

  NSUInteger v9 = [(NSString *)self->_filePath length];
  if (v6 && v9)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_128C5C;
    v19 = sub_128C6C;
    id v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_128C74;
    v14[3] = &unk_2C9800;
    v14[4] = &v15;
    [v6 performBlockOnUserSideQueueAndWait:v14];
    if (v16[5])
    {
      v10 = [(AEAnnotationSidecarProducer *)self cachedGeneration];
      id v11 = [v10 unsignedLongLongValue];
      if (v11 >= [(id)v16[5] unsignedLongLongValue])
      {
        v12 = +[NSFileManager defaultManager];
        [v12 fileExistsAtPath:self->_filePath];
      }
      objc_storeStrong((id *)&self->_generation, (id)v16[5]);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_128DD8;
      v13[3] = &unk_2C9828;
      v13[4] = self;
      [v6 performBlockOnUserSideQueueAndWait:v13];
      [(AEAnnotationSidecarProducer *)self cacheGeneration];
    }
    _Block_object_dispose(&v15, 8);
  }
  if (v7) {
    v7[2](v7);
  }
}

- (id)newBookmarkDictionarysArray:(id)a3 modern:(BOOL)a4
{
  id v4 = a3;
  id v6 = +[AEAnnotation userAnnotationTypeValues];
  v7 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"annotationType", v6];

  uint64_t v8 = +[AEAnnotation modernDictionaryRepresentationForAnnotationsMatchingPredicate:v7 inManagedObjectContext:v4];

  return v8;
}

- (id)maxAnnotationVersionInMOC:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithValue:1];
  v16 = v3;
  v5 = +[AEAnnotation maxAnnotationVersionForAssetsWithPredicate:v4 inManagedObjectContext:v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v5 allValues];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) valueForKey:@"futureProofing2"];
        v13 = v12;
        if (v12)
        {
          if (v9)
          {
            if ([v9 compare:v12 options:64])
            {
              id v14 = v13;

              id v9 = v14;
            }
          }
          else
          {
            id v9 = v12;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)appendData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:self->_filePath];
  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v8 = v5;
  id v6 = [(id)objc_opt_class() defaultBookmarkContainerKey];
  [v8 setObject:v4 forKey:v6];

  id v7 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:100 options:0 error:0];
  [v7 writeToFile:self->_filePath atomically:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generation, 0);

  objc_storeStrong((id *)&self->_filePath, 0);
}

@end