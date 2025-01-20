@interface _PBFGalleryEnqueuedRefreshGalleryRequest
- (BOOL)isFinalized;
- (NSUUID)sessionId;
- (_PBFGalleryEnqueuedRefreshGalleryRequest)initWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 sessionId:(id)a5;
- (void)addCompletionHandler:(id)a3;
- (void)fireCompletionHandlersWithError:(id)a3 faceGalleryConfiguration:(id)a4 lastUpdateDate:(id)a5 didUpdate:(BOOL)a6;
- (void)setSessionId:(id)a3;
@end

@implementation _PBFGalleryEnqueuedRefreshGalleryRequest

- (_PBFGalleryEnqueuedRefreshGalleryRequest)initWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 sessionId:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_PBFGalleryEnqueuedRefreshGalleryRequest;
  v9 = [(_PBFGalleryEnqueuedRefreshGalleryRequest *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    sessionId = v9->_sessionId;
    v9->_sessionId = (NSUUID *)v10;

    v9->_options = a3;
    v9->_powerLogReason = a4;
  }

  return v9;
}

- (void)addCompletionHandler:(id)a3
{
  v4 = (void (**)(id, PRSPosterGalleryLayout *, NSDate *, BOOL, NSError *))a3;
  if (v4)
  {
    uint64_t v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (v5->_finalized)
    {
      v10[2](v10, v5->_finalizedGalleryConfiguration, v5->_finalizedLastUpdateDate, v5->_finalizedDidUpdate, v5->_finalizedError);
    }
    else
    {
      completionHandlers = v5->_completionHandlers;
      if (!completionHandlers)
      {
        uint64_t v7 = objc_opt_new();
        id v8 = v5->_completionHandlers;
        v5->_completionHandlers = (NSMutableArray *)v7;

        completionHandlers = v5->_completionHandlers;
      }
      v9 = (void *)[v10 copy];
      [(NSMutableArray *)completionHandlers addObject:v9];
    }
    objc_sync_exit(v5);

    v4 = v10;
  }
}

- (void)fireCompletionHandlersWithError:(id)a3 faceGalleryConfiguration:(id)a4 lastUpdateDate:(id)a5 didUpdate:(BOOL)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  objc_sync_enter(v14);
  if (!v14->_finalized)
  {
    objc_storeStrong((id *)&v14->_finalizedError, a3);
    uint64_t v15 = [v12 copy];
    finalizedGalleryConfiguration = v14->_finalizedGalleryConfiguration;
    v14->_finalizedGalleryConfiguration = (PRSPosterGalleryLayout *)v15;

    uint64_t v17 = [v13 copy];
    finalizedLastUpdateDate = v14->_finalizedLastUpdateDate;
    v14->_finalizedLastUpdateDate = (NSDate *)v17;

    v14->_finalizedDidUpdate = a6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v19 = v14->_completionHandlers;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v19);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * v22) + 16))(*(void *)(*((void *)&v23 + 1) + 8 * v22));
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v20);
    }

    [(NSMutableArray *)v14->_completionHandlers removeAllObjects];
    v14->_finalized = 1;
  }
  objc_sync_exit(v14);
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_finalizedLastUpdateDate, 0);
  objc_storeStrong((id *)&self->_finalizedGalleryConfiguration, 0);
  objc_storeStrong((id *)&self->_finalizedError, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end