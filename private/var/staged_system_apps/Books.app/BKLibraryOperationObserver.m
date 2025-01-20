@interface BKLibraryOperationObserver
- (BKLibraryOperationObserver)init;
- (void)invalidateBookIndices:(id)a3;
- (void)libraryOperationCompleteNotificationReceived:(id)a3;
- (void)setup;
@end

@implementation BKLibraryOperationObserver

- (void)setup
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"libraryOperationCompleteNotificationReceived:" name:BKLibraryOperationCompleteNotification object:0];
}

- (BKLibraryOperationObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryOperationObserver;
  v2 = [(BKLibraryOperationObserver *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(BKLibraryOperationObserver *)v2 setup];
  }
  return v3;
}

- (void)libraryOperationCompleteNotificationReceived:(id)a3
{
  id v12 = a3;
  v4 = [v12 userInfo];

  objc_super v5 = v12;
  if (v4)
  {
    v6 = [v12 userInfo];
    v7 = [v6 objectForKeyedSubscript:BKLibraryOperationTypeKey];
    id v8 = [v7 unsignedIntegerValue];

    v9 = [v12 userInfo];
    v10 = [v9 objectForKeyedSubscript:BKLibraryOperationAssetIDsKey];

    if ([v10 count]) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      [(BKLibraryOperationObserver *)self invalidateBookIndices:v10];
    }

    objc_super v5 = v12;
  }
}

- (void)invalidateBookIndices:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        +[AEPictureBookRenderingCache purgeCacheForIdentifier:](AEPictureBookRenderingCache, "purgeCacheForIdentifier:", v7, (void)v8);
        +[AEPdfRenderingCache purgeCacheForIdentifier:v7];
        +[BEPageSnapshotCache purgeCacheForIdentifier:v7];
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  +[BKTextIndex invalidateBookIndicesWithNames:v3];
}

@end