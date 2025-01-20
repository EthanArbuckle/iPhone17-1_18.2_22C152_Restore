@interface VUIScopedBackgroundTask
- (VUIScopedBackgroundTask)init;
- (VUIScopedBackgroundTask)initWithIdentifier:(id)a3 expirationHandler:(id)a4;
- (unint64_t)taskIdentifier;
- (void)_endTask;
- (void)dealloc;
- (void)setTaskIdentifier:(unint64_t)a3;
@end

@implementation VUIScopedBackgroundTask

- (void)dealloc
{
  [(VUIScopedBackgroundTask *)self _endTask];
  v3.receiver = self;
  v3.super_class = (Class)VUIScopedBackgroundTask;
  [(VUIScopedBackgroundTask *)&v3 dealloc];
}

- (VUIScopedBackgroundTask)initWithIdentifier:(id)a3 expirationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VUIScopedBackgroundTask;
  v8 = [(VUIScopedBackgroundTask *)&v22 init];
  if (v8)
  {
    objc_initWeak(&location, v8);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __64__VUIScopedBackgroundTask_initWithIdentifier_expirationHandler___block_invoke;
    v17 = &unk_1E6DF43D0;
    objc_copyWeak(&v20, &location);
    id v9 = v6;
    id v18 = v9;
    id v19 = v7;
    v10 = _Block_copy(&v14);
    v11 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v14, v15, v16, v17);
    uint64_t v12 = [v11 beginBackgroundTaskWithName:v9 expirationHandler:v10];

    [(VUIScopedBackgroundTask *)v8 setTaskIdentifier:v12];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (void)_endTask
{
  unint64_t v3 = [(VUIScopedBackgroundTask *)self taskIdentifier];
  uint64_t v4 = *MEMORY[0x1E4FB2748];
  if (v3 != *MEMORY[0x1E4FB2748])
  {
    v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v5, "endBackgroundTask:", -[VUIScopedBackgroundTask taskIdentifier](self, "taskIdentifier"));

    [(VUIScopedBackgroundTask *)self setTaskIdentifier:v4];
  }
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (VUIScopedBackgroundTask)init
{
  return [(VUIScopedBackgroundTask *)self initWithIdentifier:0 expirationHandler:0];
}

void __64__VUIScopedBackgroundTask_initWithIdentifier_expirationHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unint64_t v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      uint64_t v9 = [WeakRetained taskIdentifier];
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIScopedBackgroundTask with identifier %@ (%lu) expired. Ending background task", (uint8_t *)&v6, 0x16u);
    }

    [WeakRetained _endTask];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

@end