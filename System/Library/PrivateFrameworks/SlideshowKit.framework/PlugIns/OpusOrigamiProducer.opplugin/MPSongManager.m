@interface MPSongManager
+ (id)sharedManager;
+ (void)releaseSharedManager;
- (BOOL)hasBeatsForSongAtPath:(id)a3;
- (MPSongManager)init;
- (MPSongManager)initWithPaths:(id)a3;
- (id)beatsForSongAtPath:(id)a3 progressCallback:(void *)a4 context:(void *)a5;
- (id)cachedBeatsForSongAtPath:(id)a3;
- (id)songMetadataForPath:(id)a3;
- (void)dealloc;
- (void)storeBeats:(id)a3 forPath:(id)a4;
@end

@implementation MPSongManager

+ (id)sharedManager
{
  id result = (id)qword_1F1338;
  if (!qword_1F1338)
  {
    objc_sync_enter(a1);
    if (!qword_1F1338) {
      qword_1F1338 = [[MPSongManager alloc] initWithPaths:0];
    }
    objc_sync_exit(a1);
    return (id)qword_1F1338;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F1338)
  {
    objc_sync_enter(a1);

    qword_1F1338 = 0;
    objc_sync_exit(a1);
  }
}

- (MPSongManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)MPSongManager;
  v2 = [(MPSongManager *)&v16 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    v2->mSongLock = v3;
    [(NSRecursiveLock *)v3 setName:@"MPSongManager.songLock"];
    v2->mSongCacheFilePath = 0;
    v2->mDaFunc = 0;
    v2->mSongDescriptions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    mSongDescriptions = v2->mSongDescriptions;
    id v6 = [(NSMutableDictionary *)mSongDescriptions countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(mSongDescriptions);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (!objc_msgSend(-[NSMutableDictionary objectForKey:](v2->mSongDescriptions, "objectForKey:", v10), "count")) {
            objc_msgSend(v4, "setObject:forKey:", +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", -[NSBundle pathForResource:ofType:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", v10, @"plist")), v10);
          }
        }
        id v7 = [(NSMutableDictionary *)mSongDescriptions countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
    if ([v4 count]) {
      [(NSMutableDictionary *)v2->mSongDescriptions addEntriesFromDictionary:v4];
    }

    v2->mSongBeats = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  self->mSongLock = 0;
  self->mSongDescriptions = 0;

  self->mSongBeats = 0;
  self->mSongCacheFilePath = 0;

  self->mSongMetaData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPSongManager;
  [(MPSongManager *)&v3 dealloc];
}

- (id)beatsForSongAtPath:(id)a3 progressCallback:(void *)a4 context:(void *)a5
{
  if (a3) {
    return -[NSMutableDictionary objectForKey:](self->mSongBeats, "objectForKey:", a3, a4, a5);
  }
  else {
    return 0;
  }
}

- (BOOL)hasBeatsForSongAtPath:(id)a3
{
  return objc_msgSend(+[MPSongManager sharedManager](MPSongManager, "sharedManager"), "cachedBeatsForSongAtPath:", a3) != 0;
}

- (id)songMetadataForPath:(id)a3
{
  id v4 = [a3 lastPathComponent];
  mSongMetaData = self->mSongMetaData;
  return [(NSMutableDictionary *)mSongMetaData objectForKey:v4];
}

- (void)storeBeats:(id)a3 forPath:(id)a4
{
}

- (MPSongManager)initWithPaths:(id)a3
{
  id v4 = [(MPSongManager *)self init];
  if (v4)
  {
    v4->mSongMetaData = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v5 = +[NSMutableArray array];
    id v6 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v5, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [*(id *)(*((void *)&v14 + 1) + 8 * i) stringByAppendingPathComponent:@"Audio/SongDescriptions.plist"]);
          if (v11)
          {
            id v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:2 format:0 error:0];
            if (v12) {
              [(NSMutableDictionary *)v4->mSongMetaData addEntriesFromDictionary:v12];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v4;
}

- (id)cachedBeatsForSongAtPath:(id)a3
{
  return [(NSMutableDictionary *)self->mSongBeats objectForKey:a3];
}

@end