@interface PUPhotoSharingManager
+ (id)sharedInstance;
- (BOOL)isRemaking;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (PLProgressView)publishingProgressView;
- (id)_currentPublishingAgent;
- (void)_addPublishingAgentIfNeeded:(id)a3;
- (void)_cleanUpPublishingProgressView;
- (void)_removePublishingAgent:(id)a3;
- (void)_schedulePublishingProgressViewUpdate;
- (void)_setDelaysAppSuspend:(BOOL)a3;
- (void)_setFlag:(BOOL)a3 forReferenceCounter:(int64_t *)a4 performIfChanged:(id)a5;
- (void)_setNetworkPromptShowing:(BOOL)a3;
- (void)_updatePublishingProgressView:(id)a3;
- (void)cancelPublishing;
- (void)dealloc;
- (void)publishingAgentCancelButtonClicked:(id)a3;
- (void)publishingAgentDidBeginPublishing:(id)a3;
- (void)publishingAgentDidEndPublishing:(id)a3 error:(id)a4;
- (void)publishingAgentDidEndRemaking:(id)a3 didSucceed:(BOOL)a4;
- (void)publishingAgentDidStartRemaking:(id)a3;
- (void)setRemaking:(BOOL)a3;
@end

@implementation PUPhotoSharingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishingAgents, 0);
  objc_storeStrong((id *)&self->_publishingProgressTimer, 0);
  objc_storeStrong((id *)&self->_publishingProgressView, 0);
}

- (void)publishingAgentCancelButtonClicked:(id)a3
{
  id v4 = a3;
  [(PUPhotoSharingManager *)self _removePublishingAgent:v4];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F8A630] object:v4];

  v6 = [(PUPhotoSharingManager *)self _currentPublishingAgent];

  if (!v6)
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"PUPhotoSharingManagerDidEndPublishing" object:0];

    [(PUPhotoSharingManager *)self _cleanUpPublishingProgressView];
  }
}

- (void)publishingAgentDidEndPublishing:(id)a3 error:(id)a4
{
  id v6 = a3;
  [v6 showAlertWithError:a4];
  [(PUPhotoSharingManager *)self _removePublishingAgent:v6];
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:*MEMORY[0x1E4F8A638] object:v6 userInfo:0];

  v8 = [(PUPhotoSharingManager *)self _currentPublishingAgent];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"PUPhotoSharingManagerDidEndPublishing" object:0];

    [(PUPhotoSharingManager *)self _cleanUpPublishingProgressView];
  }
}

- (void)publishingAgentDidBeginPublishing:(id)a3
{
  id v8 = a3;
  [(PUPhotoSharingManager *)self _addPublishingAgentIfNeeded:v8];
  [(PUPhotoSharingManager *)self _setNetworkPromptShowing:1];
  [(PUPhotoSharingManager *)self _setDelaysAppSuspend:1];
  [(id)*MEMORY[0x1E4FB2608] setStatusBarShowsProgress:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4F8A650] object:v8];

  v5 = v8;
  if (v8)
  {
    id v6 = [(PUPhotoSharingManager *)self _currentPublishingAgent];
    if (v6 == v8)
    {
      char v7 = [v8 isVideoMedia];

      v5 = v8;
      if (v7) {
        goto LABEL_6;
      }
      [(PUPhotoSharingManager *)self _schedulePublishingProgressViewUpdate];
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 postNotificationName:@"PUPhotoSharingManagerDidBeginPublishing" object:0];
    }

    v5 = v8;
  }
LABEL_6:
}

- (void)publishingAgentDidEndRemaking:(id)a3 didSucceed:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PUPhotoSharingManager *)self setRemaking:0];
  uint64_t v10 = *MEMORY[0x1E4F8A648];
  char v7 = [NSNumber numberWithBool:v4];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:*MEMORY[0x1E4F8A640] object:v6 userInfo:v8];

  if (!v4) {
    [(PUPhotoSharingManager *)self _removePublishingAgent:v6];
  }
}

- (void)publishingAgentDidStartRemaking:(id)a3
{
  id v8 = a3;
  [(PUPhotoSharingManager *)self setRemaking:1];
  [(PUPhotoSharingManager *)self _addPublishingAgentIfNeeded:v8];
  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4F8A658] object:v8 userInfo:0];

  v5 = v8;
  if (v8)
  {
    id v6 = [(PUPhotoSharingManager *)self _currentPublishingAgent];

    v5 = v8;
    if (v6 == v8)
    {
      [(PUPhotoSharingManager *)self _schedulePublishingProgressViewUpdate];
      char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"PUPhotoSharingManagerDidBeginPublishing" object:0];

      v5 = v8;
    }
  }
}

- (void)_removePublishingAgent:(id)a3
{
  id v10 = a3;
  int v4 = [(NSMutableArray *)self->_publishingAgents containsObject:v10];
  v5 = v10;
  if (v4)
  {
    [v10 setDelegate:0];
    [(NSMutableArray *)self->_publishingAgents removeObject:v10];
    if ([v10 deleteMediaFileAfterPublishing])
    {
      id v6 = [v10 mediaPath];
      char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v8 = [v7 fileExistsAtPath:v6];

      if (v8)
      {
        v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v9 removeItemAtPath:v6 error:0];
      }
    }
    [(PUPhotoSharingManager *)self _setNetworkPromptShowing:0];
    [(PUPhotoSharingManager *)self _setDelaysAppSuspend:0];
    v5 = v10;
  }
}

- (void)_addPublishingAgentIfNeeded:(id)a3
{
  id v7 = a3;
  publishingAgents = self->_publishingAgents;
  if (publishingAgents) {
    v5 = publishingAgents;
  }
  else {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v6 = self->_publishingAgents;
  self->_publishingAgents = v5;

  if (([(NSMutableArray *)self->_publishingAgents containsObject:v7] & 1) == 0) {
    [(NSMutableArray *)self->_publishingAgents addObject:v7];
  }
}

- (void)_cleanUpPublishingProgressView
{
  [(NSTimer *)self->_publishingProgressTimer invalidate];
  publishingProgressTimer = self->_publishingProgressTimer;
  self->_publishingProgressTimer = 0;

  [(PLProgressView *)self->_publishingProgressView removeFromSuperview];
  publishingProgressView = self->_publishingProgressView;
  self->_publishingProgressView = 0;
}

- (void)_updatePublishingProgressView:(id)a3
{
  uint64_t v4 = [(PUPhotoSharingManager *)self _currentPublishingAgent];
  id v5 = (id)v4;
  if (v4)
  {
    [(PLProgressView *)self->_publishingProgressView updateUIForPublishingAgent:v4];
    [(PUPhotoSharingManager *)self _schedulePublishingProgressViewUpdate];
  }
  else
  {
    [(PUPhotoSharingManager *)self _cleanUpPublishingProgressView];
  }
}

- (void)_schedulePublishingProgressViewUpdate
{
  v3 = [(PUPhotoSharingManager *)self _currentPublishingAgent];

  if (v3)
  {
    [(NSTimer *)self->_publishingProgressTimer invalidate];
    uint64_t v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__updatePublishingProgressView_ selector:0 userInfo:1 repeats:0.2];
    publishingProgressTimer = self->_publishingProgressTimer;
    self->_publishingProgressTimer = v4;
  }
  else
  {
    [(PUPhotoSharingManager *)self _cleanUpPublishingProgressView];
  }
}

- (id)_currentPublishingAgent
{
  return (id)[(NSMutableArray *)self->_publishingAgents firstObject];
}

- (void)_setDelaysAppSuspend:(BOOL)a3
{
  BOOL v3 = a3;
  p_appSuspensionCount = &self->_appSuspensionCount;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PUPhotoSharingManager__setDelaysAppSuspend___block_invoke;
  v6[3] = &unk_1E5F2CEE8;
  v6[4] = self;
  id v5 = self;
  [(PUPhotoSharingManager *)v5 _setFlag:v3 forReferenceCounter:p_appSuspensionCount performIfChanged:v6];
}

uint64_t __46__PUPhotoSharingManager__setDelaysAppSuspend___block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = result;
  if (a2)
  {
    result = [(id)*MEMORY[0x1E4FB2608] beginBackgroundTaskWithExpirationHandler:0];
    uint64_t v3 = result;
    uint64_t v4 = v2 + 32;
  }
  else
  {
    uint64_t v4 = result + 32;
    uint64_t v3 = *MEMORY[0x1E4FB2748];
    if (*(void *)(*(void *)(result + 32) + 56) == *MEMORY[0x1E4FB2748]) {
      return result;
    }
    result = objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
  }
  *(void *)(*(void *)v4 + 56) = v3;
  return result;
}

- (void)_setNetworkPromptShowing:(BOOL)a3
{
}

void __50__PUPhotoSharingManager__setNetworkPromptShowing___block_invoke()
{
  SBSSpringBoardServerPort();
  JUMPOUT(0x1B3E7BB80);
}

- (void)_setFlag:(BOOL)a3 forReferenceCounter:(int64_t *)a4 performIfChanged:(id)a5
{
  id v7 = (void (**)(void))a5;
  int64_t v8 = *a4;
  if (a3)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (!v8)
    {
      int v12 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = -1;
  }
  BOOL v10 = __OFADD__(v8, v9);
  int64_t v11 = v8 + v9;
  *a4 = v11;
  if ((v11 < 0) ^ v10 | (v11 == 0)) {
    int v12 = 0;
  }
  else {
    int v12 = 1;
  }
LABEL_9:
  int v13 = v8 > 0;
  if (v7 && v13 != v12)
  {
    v14 = v7;
    v7[2]();
    id v7 = v14;
  }
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[(NSMutableArray *)self->_publishingAgents copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isRemaking", (void)v14) & 1) == 0 && (objc_msgSend(v11, "isPublishing") & 1) == 0)
        {
          if (!v3)
          {
            char v12 = 0;
            goto LABEL_14;
          }
          [(PUPhotoSharingManager *)self _removePublishingAgent:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v12 = 1;
LABEL_14:

  return v12 | v3;
}

- (void)cancelPublishing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSMutableArray *)self->_publishingAgents copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        -[PUPhotoSharingManager _removePublishingAgent:](self, "_removePublishingAgent:", v9, (void)v11);
        [v9 setShouldCancelPublish:1];
        [v9 cancelRemaking];
        [(PUPhotoSharingManager *)self publishingAgentDidEndRemaking:v9 didSucceed:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:*MEMORY[0x1E4F8A660] object:0];
}

- (PLProgressView)publishingProgressView
{
  BOOL v3 = [(PUPhotoSharingManager *)self _currentPublishingAgent];

  if (v3)
  {
    publishingProgressView = self->_publishingProgressView;
    if (!publishingProgressView)
    {
      uint64_t v5 = (PLProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E0]), "initWithFrame:", 0.0, 0.0, 0.0, 45.0);
      uint64_t v6 = self->_publishingProgressView;
      self->_publishingProgressView = v5;

      publishingProgressView = self->_publishingProgressView;
    }
    uint64_t v7 = publishingProgressView;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)setRemaking:(BOOL)a3
{
  BOOL v3 = a3;
  p_videoRemakingCount = &self->_videoRemakingCount;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PUPhotoSharingManager_setRemaking___block_invoke;
  v6[3] = &unk_1E5F2CEE8;
  v6[4] = self;
  uint64_t v5 = self;
  [(PUPhotoSharingManager *)v5 _setFlag:v3 forReferenceCounter:p_videoRemakingCount performIfChanged:v6];
}

uint64_t __37__PUPhotoSharingManager_setRemaking___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setDelaysAppSuspend:a2];
}

- (BOOL)isRemaking
{
  return self->_videoRemakingCount > 0;
}

- (void)dealloc
{
  [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:self->_backgroundTaskIdentifier];
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoSharingManager;
  [(PUPhotoSharingManager *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_65406 != -1) {
    dispatch_once(&sharedInstance_onceToken_65406, &__block_literal_global_65407);
  }
  uint64_t v2 = (void *)sharedInstance_manager;
  return v2;
}

void __39__PUPhotoSharingManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PUPhotoSharingManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;
}

@end