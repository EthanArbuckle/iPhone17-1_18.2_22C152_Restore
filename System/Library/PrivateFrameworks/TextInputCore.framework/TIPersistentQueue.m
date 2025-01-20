@interface TIPersistentQueue
- (TIPersistentQueue)initWithURL:(id)a3;
- (void)dequeueObjects:(id)a3;
- (void)enqueueObjects:(id)a3;
- (void)readObjects:(id)a3;
@end

@implementation TIPersistentQueue

- (void).cxx_destruct
{
}

- (void)dequeueObjects:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    presentedItemURL = self->_presentedItemURL;
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__TIPersistentQueue_dequeueObjects___block_invoke;
    v10[3] = &unk_1E6E2DC10;
    id v11 = v4;
    [v5 coordinateWritingItemAtURL:presentedItemURL options:0 error:&v12 byAccessor:v10];
    id v7 = v12;
    if (v7)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      v8 = TIOSLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = [NSString stringWithFormat:@"%s failed to coordinate write of %@: %@", "-[TIPersistentQueue dequeueObjects:]", self->_presentedItemURL, v7];
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

void __36__TIPersistentQueue_dequeueObjects___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfURL:v3];
  unint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v5 > [v4 count]) {
    unint64_t v5 = [v4 count];
  }
  v6 = objc_msgSend(v4, "subarrayWithRange:", v5, objc_msgSend(v4, "count") - v5);

  if (v5)
  {
    if (![v6 count])
    {
      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v11 = 0;
      [v9 removeItemAtURL:v3 error:&v11];
      id v7 = v11;

      if (!v7)
      {
LABEL_16:

        goto LABEL_17;
      }
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      v8 = TIOSLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = [NSString stringWithFormat:@"%s failed to delete %@: %@", "-[TIPersistentQueue dequeueObjects:]_block_invoke", v3, v7];
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_15:

      goto LABEL_16;
    }
    if (([v6 writeToURL:v3 atomically:1] & 1) == 0)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      id v7 = TIOSLogFacility();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      v8 = [NSString stringWithFormat:@"%s failed to write to %@ for updated persistent queue: %@", "-[TIPersistentQueue dequeueObjects:]_block_invoke", v3, v6];
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_15;
    }
  }
LABEL_17:
}

- (void)enqueueObjects:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    presentedItemURL = self->_presentedItemURL;
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__TIPersistentQueue_enqueueObjects___block_invoke;
    v10[3] = &unk_1E6E2DC10;
    id v11 = v4;
    [v5 coordinateWritingItemAtURL:presentedItemURL options:0 error:&v12 byAccessor:v10];
    id v7 = v12;
    if (v7)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      v8 = TIOSLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = [NSString stringWithFormat:@"%s failed to coordinate write of %@: %@", "-[TIPersistentQueue enqueueObjects:]", self->_presentedItemURL, v7];
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v9;
        _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

void __36__TIPersistentQueue_enqueueObjects___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithContentsOfURL:");
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
  v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  if ([v8 count]) {
    [v8 writeToURL:v9 atomically:1];
  }
}

- (void)readObjects:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    presentedItemURL = self->_presentedItemURL;
    id v12 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__TIPersistentQueue_readObjects___block_invoke;
    v10[3] = &unk_1E6E2DC10;
    id v11 = v4;
    [v5 coordinateReadingItemAtURL:presentedItemURL options:0 error:&v12 byAccessor:v10];
    id v7 = v12;
    if (v7)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      id v8 = TIOSLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [NSString stringWithFormat:@"%s failed to coordinate read of %@: %@", "-[TIPersistentQueue readObjects:]", self->_presentedItemURL, v7];
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v9;
        _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

void __33__TIPersistentQueue_readObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1C978] arrayWithContentsOfURL:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (TIPersistentQueue)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPersistentQueue;
  v6 = [(TIPersistentQueue *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentedItemURL, a3);
    id v8 = v7;
  }

  return v7;
}

@end