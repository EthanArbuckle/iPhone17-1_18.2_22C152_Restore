@interface _PBFGalleryEnqueuedPushToProactiveRequest
- (BOOL)isFinalized;
- (NSDictionary)updatedDescriptors;
- (NSString)reason;
- (NSUUID)sessionId;
- (_PBFGalleryEnqueuedPushToProactiveRequest)initWithUpdatedDescriptors:(id)a3 reason:(id)a4 sessionId:(id)a5;
- (void)addCompletionHandler:(id)a3;
- (void)addCompletionHandlersFromEnqueuedPushToProactive:(id)a3;
- (void)fireCompletionHandlersWithError:(id)a3 didUpdate:(BOOL)a4;
@end

@implementation _PBFGalleryEnqueuedPushToProactiveRequest

- (_PBFGalleryEnqueuedPushToProactiveRequest)initWithUpdatedDescriptors:(id)a3 reason:(id)a4 sessionId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_PBFGalleryEnqueuedPushToProactiveRequest;
  v11 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    sessionId = v11->_sessionId;
    v11->_sessionId = (NSUUID *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v8 copyItems:1];
    updatedDescriptors = v11->_updatedDescriptors;
    v11->_updatedDescriptors = (NSDictionary *)v14;

    uint64_t v16 = [v9 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v16;
  }
  return v11;
}

- (void)addCompletionHandlersFromEnqueuedPushToProactive:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (_PBFGalleryEnqueuedPushToProactiveRequest *)a3;
  if (!v5)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"enqueuedPush"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFGalleryEnqueuedPushToProactiveRequest addCompletionHandlersFromEnqueuedPushToProactive:](a2);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32BAFD8);
  }
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7[1];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          [(_PBFGalleryEnqueuedPushToProactiveRequest *)self addCompletionHandler:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
}

- (void)addCompletionHandler:(id)a3
{
  v4 = (void (**)(id, BOOL, NSError *))a3;
  if (v4)
  {
    uint64_t v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (v5->_finalized)
    {
      v10[2](v10, v5->_finalizedResult, v5->_finalizedError);
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
      uint64_t v9 = (void *)[v10 copy];
      [(NSMutableArray *)completionHandlers addObject:v9];
    }
    objc_sync_exit(v5);

    v4 = v10;
  }
}

- (void)fireCompletionHandlersWithError:(id)a3 didUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (!v7->_finalized)
  {
    v7->_finalizedResult = v4;
    objc_storeStrong((id *)&v7->_finalizedError, a3);
    id v8 = (void *)[(NSMutableArray *)v7->_completionHandlers mutableCopy];
    [(NSMutableArray *)v7->_completionHandlers removeAllObjects];
    while ([v8 count])
    {
      uint64_t v9 = (void *)MEMORY[0x1D9433EF0]();
      uint64_t v10 = [v8 firstObject];
      ((void (**)(void, BOOL, id))v10)[2](v10, v4, v11);
      [v8 removeObjectAtIndex:0];
    }
    v7->_finalized = 1;
  }
  objc_sync_exit(v7);
}

- (NSDictionary)updatedDescriptors
{
  return self->_updatedDescriptors;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_updatedDescriptors, 0);
  objc_storeStrong((id *)&self->_finalizedError, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

- (void)addCompletionHandlersFromEnqueuedPushToProactive:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end