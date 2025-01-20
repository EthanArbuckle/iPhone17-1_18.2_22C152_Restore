@interface PXStoryErrorRepository
+ (id)analyticsNameForComponent:(id)a3;
- (NSArray)errors;
- (NSDictionary)errorsByComponent;
- (OS_dispatch_queue)storyQueue;
- (PXStoryErrorRepository)init;
- (PXStoryErrorRepository)initWithQueue:(id)a3;
- (void)setError:(id)a3 forComponent:(id)a4;
@end

@implementation PXStoryErrorRepository

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_errorsByComponent, 0);
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)setError:(id)a3 forComponent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXStoryErrorRepository *)self log];
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v18 = [(PXStoryErrorRepository *)self logContext];
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryError", "Context=%{signpost.telemetry:string2}lu Component=%{signpost.description:attribute,public}@ Error=%{signpost.description:attribute}@ ", buf, 0x20u);
    }
  }

  v11 = [(PXStoryErrorRepository *)self storyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PXStoryErrorRepository_setError_forComponent___block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v11, block);
}

void __48__PXStoryErrorRepository_setError_forComponent___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(id *)(a1 + 48);
  if (v3 == v2)
  {
  }
  else
  {
    v4 = v3;
    char v5 = [v3 isEqual:v2];

    if ((v5 & 1) == 0)
    {
      id v6 = PLStoryGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v7;
        __int16 v27 = 2114;
        uint64_t v28 = v8;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Error for component %{public}@: %{public}@", buf, 0x16u);
      }

      if (*(void *)(a1 + 48))
      {
        id v9 = [NSString alloc];
        os_signpost_id_t v10 = [(id)objc_opt_class() analyticsNameForComponent:*(void *)(a1 + 40)];
        v11 = (void *)[v9 initWithFormat:@"com.apple.photos.memory.interactiveMemoryErrorOccurredIn%@", v10];

        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v23 = *MEMORY[0x1E4F56568];
        uint64_t v24 = v12;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.memory.interactiveMemoryErrorOccurred" withPayload:v13];
        [MEMORY[0x1E4F56658] sendEvent:v11 withPayload:v13];
      }
      v14 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __48__PXStoryErrorRepository_setError_forComponent___block_invoke_13;
      v18[3] = &unk_1E5DBEF80;
      id v15 = v2;
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      id v19 = v15;
      uint64_t v20 = v16;
      id v21 = v17;
      id v22 = *(id *)(a1 + 48);
      [v14 performChanges:v18];
    }
  }
}

void __48__PXStoryErrorRepository_setError_forComponent___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "removeObject:");
  }
  [*(id *)(*(void *)(a1 + 40) + 96) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 56)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "addObject:");
  }
  [*(id *)(a1 + 40) signalChange:1];
}

- (NSDictionary)errorsByComponent
{
  id v2 = (void *)[(NSMutableDictionary *)self->_errorsByComponent copy];
  return (NSDictionary *)v2;
}

- (NSArray)errors
{
  id v2 = (void *)[(NSMutableArray *)self->_errors copy];
  return (NSArray *)v2;
}

- (PXStoryErrorRepository)initWithQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryErrorRepository;
  char v5 = [(PXStoryErrorRepository *)&v15 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errorsByComponent = v5->_errorsByComponent;
    v5->_errorsByComponent = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    errors = v5->_errors;
    v5->_errors = v8;

    if (v4)
    {
      os_signpost_id_t v10 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v10;
    }
    else
    {
      uint64_t v12 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v12;
    }
  }
  return v5;
}

- (PXStoryErrorRepository)init
{
  return [(PXStoryErrorRepository *)self initWithQueue:0];
}

+ (id)analyticsNameForComponent:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  [v3 whitespaceCharacterSet];
  [v4 componentsSeparatedByCharactersInSet:objc_claimAutoreleasedReturnValue()];
  objc_claimAutoreleasedReturnValue();

  PXMap();
}

uint64_t __52__PXStoryErrorRepository_analyticsNameForComponent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 capitalizedString];
}

@end