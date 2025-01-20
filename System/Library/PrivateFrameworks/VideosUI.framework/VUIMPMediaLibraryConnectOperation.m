@interface VUIMPMediaLibraryConnectOperation
- (BOOL)success;
- (MPMediaLibrary)mediaLibrary;
- (NSError)error;
- (OS_dispatch_source)progressTimer;
- (VUIMPMediaLibraryConnectOperation)init;
- (VUIMPMediaLibraryConnectOperation)initWithMediaLibrary:(id)a3;
- (id)progressBlock;
- (void)_notifyClientOfProgress:(float)a3;
- (void)_startProgressTimer;
- (void)_stopProgressTimer;
- (void)executionDidBegin;
- (void)setError:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setProgressTimer:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation VUIMPMediaLibraryConnectOperation

- (VUIMPMediaLibraryConnectOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMPMediaLibraryConnectOperation)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)VUIMPMediaLibraryConnectOperation;
  v6 = [(VUIMPMediaLibraryConnectOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
  }

  return v7;
}

- (void)executionDidBegin
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(VUIMPMediaLibraryConnectOperation *)self mediaLibrary];
    id v5 = [v4 name];
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Starting connection to %@", buf, 0xCu);
  }
  [(VUIMPMediaLibraryConnectOperation *)self _startProgressTimer];
  objc_initWeak((id *)buf, self);
  v6 = [(VUIMPMediaLibraryConnectOperation *)self mediaLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__VUIMPMediaLibraryConnectOperation_executionDidBegin__block_invoke;
  v7[3] = &unk_1E6DFC528;
  objc_copyWeak(&v8, (id *)buf);
  [v6 connectWithCompletionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __54__VUIMPMediaLibraryConnectOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setSuccess:v3 == 0];
    [v5 setError:v3];
    [v5 _stopProgressTimer];
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 mediaLibrary];
      id v8 = [v7 name];
      objc_super v9 = VUIBoolLogString();
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Connect attempt finished to %@ (Success = %@)", (uint8_t *)&v10, 0x16u);
    }
    [v5 finishExecutionIfPossible];
  }
}

- (void)_startProgressTimer
{
  id v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v3, v4, 0x1DCD6500uLL, 0);
  [(VUIMPMediaLibraryConnectOperation *)self setProgressTimer:v3];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__VUIMPMediaLibraryConnectOperation__startProgressTimer__block_invoke;
  v5[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v6, &location);
  dispatch_source_set_event_handler(v3, v5);
  dispatch_activate(v3);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__VUIMPMediaLibraryConnectOperation__startProgressTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v2 = [WeakRetained mediaLibrary];
    [v2 connectionProgress];
    int v4 = v3;

    LODWORD(v5) = v4;
    [v6 _notifyClientOfProgress:v5];
    id WeakRetained = v6;
  }
}

- (void)_stopProgressTimer
{
  source = [(VUIMPMediaLibraryConnectOperation *)self progressTimer];
  [(VUIMPMediaLibraryConnectOperation *)self setProgressTimer:0];
  dispatch_source_cancel(source);
}

- (void)_notifyClientOfProgress:(float)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VUIMPMediaLibraryConnectOperation *)self mediaLibrary];
    v7 = [v6 name];
    *(float *)&double v8 = a3;
    objc_super v9 = [MEMORY[0x1E4F28ED0] numberWithFloat:v8];
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Connection progress to %@ (Progress = %@)", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [(VUIMPMediaLibraryConnectOperation *)self progressBlock];
  uint64_t v11 = (void *)v10;
  if (v10) {
    (*(void (**)(uint64_t, float))(v10 + 16))(v10, a3);
  }
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (OS_dispatch_source)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

@end