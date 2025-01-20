@interface PLAssetsdClientService
- (void)addPhotoLibraryUnavailabilityHandler:(id)a3;
- (void)downloadStatusForIdentifier:(id)a3 progress:(double)a4 completed:(BOOL)a5 data:(id)a6 error:(id)a7;
- (void)libraryBecameUnavailable:(id)a3 reason:(id)a4;
@end

@implementation PLAssetsdClientService

- (void)addPhotoLibraryUnavailabilityHandler:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  libraryUnavailabilityHandlers = v4->_libraryUnavailabilityHandlers;
  if (!libraryUnavailabilityHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = v4->_libraryUnavailabilityHandlers;
    v4->_libraryUnavailabilityHandlers = v6;

    libraryUnavailabilityHandlers = v4->_libraryUnavailabilityHandlers;
  }
  v8 = (void *)MEMORY[0x19F38F770](v9);
  [(NSMutableArray *)libraryUnavailabilityHandlers addObject:v8];

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

- (void)libraryBecameUnavailable:(id)a3 reason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  id v9 = v8->_libraryUnavailabilityHandlers;
  libraryUnavailabilityHandlers = v8->_libraryUnavailabilityHandlers;
  v8->_libraryUnavailabilityHandlers = 0;

  objc_sync_exit(v8);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = v9;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)downloadStatusForIdentifier:(id)a3 progress:(double)a4 completed:(BOOL)a5 data:(id)a6 error:(id)a7
{
  BOOL v8 = a5;
  id v19 = a6;
  id v12 = a7;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA60];
  id v14 = a3;
  uint64_t v15 = [v13 dictionary];
  [v15 setObject:v14 forKeyedSubscript:@"taskIdentifier"];

  if (a4 >= 0.0)
  {
    long long v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
    [v15 setObject:v16 forKeyedSubscript:@"progress"];
  }
  long long v17 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
  [v15 setObject:v17 forKeyedSubscript:@"completed"];

  if (v12) {
    [v15 setObject:v12 forKeyedSubscript:@"error"];
  }
  if (v19) {
    [v15 setObject:v19 forKeyedSubscript:@"data"];
  }
  long long v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 postNotificationName:@"PLGatekeeperUpdateCPLDownloadStatusNotification" object:self userInfo:v15];
}

@end