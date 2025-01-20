@interface TIStatusBarStyleOverrideLoggingCapture
+ (int64_t)_decrementLoggingCaptureOverride;
+ (int64_t)_incrementLoggingCaptureOverride;
+ (int64_t)_loggingCaptureOverrideCountPtr;
+ (void)_statusBarStyleOverrideLoggingCapture:(BOOL)a3;
+ (void)acquireLoggingCaptureOverride;
+ (void)releaseLoggingCaptureOverride;
- (TIStatusBarStyleOverrideLoggingCapture)init;
- (void)dealloc;
@end

@implementation TIStatusBarStyleOverrideLoggingCapture

- (void)dealloc
{
  [(id)objc_opt_class() releaseLoggingCaptureOverride];
  v3.receiver = self;
  v3.super_class = (Class)TIStatusBarStyleOverrideLoggingCapture;
  [(TIStatusBarStyleOverrideLoggingCapture *)&v3 dealloc];
}

- (TIStatusBarStyleOverrideLoggingCapture)init
{
  v4.receiver = self;
  v4.super_class = (Class)TIStatusBarStyleOverrideLoggingCapture;
  v2 = [(TIStatusBarStyleOverrideLoggingCapture *)&v4 init];
  if (v2) {
    [(id)objc_opt_class() acquireLoggingCaptureOverride];
  }
  return v2;
}

+ (void)releaseLoggingCaptureOverride
{
}

uint64_t __71__TIStatusBarStyleOverrideLoggingCapture_releaseLoggingCaptureOverride__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _decrementLoggingCaptureOverride];
  if (result == 1)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _statusBarStyleOverrideLoggingCapture:0];
  }
  return result;
}

+ (void)acquireLoggingCaptureOverride
{
}

uint64_t __71__TIStatusBarStyleOverrideLoggingCapture_acquireLoggingCaptureOverride__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _incrementLoggingCaptureOverride];
  if (!result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _statusBarStyleOverrideLoggingCapture:1];
  }
  return result;
}

+ (void)_statusBarStyleOverrideLoggingCapture:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&v18[5] = *MEMORY[0x1E4F143B8];
  objc_super v4 = _sbsOverrideLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "Release";
    if (v3) {
      v5 = "Acquire";
    }
    int v17 = 136315138;
    *(void *)v18 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEFAULT, "%s 'LoggingCapture' style override assertion", (uint8_t *)&v17, 0xCu);
  }

  pid_t v6 = _statusBarStyleOverrideLoggingCapture__pid;
  if (!_statusBarStyleOverrideLoggingCapture__pid)
  {
    pid_t v6 = getpid();
    _statusBarStyleOverrideLoggingCapture__pid = v6;
  }
  uint64_t v7 = _statusBarStyleOverrideLoggingCapture__assertion;
  if (v6 && !_statusBarStyleOverrideLoggingCapture__assertion)
  {
    v8 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    int v9 = [v8 BOOLForKey:54];

    if (v9) {
      uint64_t v10 = 0x8000;
    }
    else {
      uint64_t v10 = 0x200000;
    }
    uint64_t v11 = [MEMORY[0x1E4FA6C10] assertionWithStatusBarStyleOverrides:v10 forPID:_statusBarStyleOverrideLoggingCapture__pid exclusive:0 showsWhenForeground:1];
    v12 = (void *)_statusBarStyleOverrideLoggingCapture__assertion;
    _statusBarStyleOverrideLoggingCapture__assertion = v11;

    pid_t v6 = _statusBarStyleOverrideLoggingCapture__pid;
    uint64_t v7 = _statusBarStyleOverrideLoggingCapture__assertion;
  }
  if (v6 && v7)
  {
    if (v3)
    {
      if (_statusBarStyleOverrideLoggingCapture__timer)
      {
        [(id)_statusBarStyleOverrideLoggingCapture__timer invalidate];
        v13 = (void *)_statusBarStyleOverrideLoggingCapture__timer;
        _statusBarStyleOverrideLoggingCapture__timer = 0;
      }
      if (!_statusBarStyleOverrideLoggingCapture__assertionAcquired)
      {
        [(id)_statusBarStyleOverrideLoggingCapture__assertion acquireWithHandler:&__block_literal_global_13960 invalidationHandler:&__block_literal_global_11];
        [(id)_statusBarStyleOverrideLoggingCapture__assertion setStatusString:@"Recording Keyboard Data"];
      }
    }
    else if (_statusBarStyleOverrideLoggingCapture__assertionAcquired && !_statusBarStyleOverrideLoggingCapture__timer)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:&__block_literal_global_17_13963 block:2.0];
      v16 = (void *)_statusBarStyleOverrideLoggingCapture__timer;
      _statusBarStyleOverrideLoggingCapture__timer = v15;
    }
  }
  else
  {
    v14 = _sbsOverrideLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 67109376;
      v18[0] = _statusBarStyleOverrideLoggingCapture__pid;
      LOWORD(v18[1]) = 2048;
      *(void *)((char *)&v18[1] + 2) = _statusBarStyleOverrideLoggingCapture__assertion;
      _os_log_error_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_ERROR, "Couldn't get pid %d or assertion %p.", (uint8_t *)&v17, 0x12u);
    }
  }
}

uint64_t __80__TIStatusBarStyleOverrideLoggingCapture__statusBarStyleOverrideLoggingCapture___block_invoke_14()
{
  uint64_t result = [(id)_statusBarStyleOverrideLoggingCapture__assertion invalidate];
  _statusBarStyleOverrideLoggingCapture__assertionAcquired = 0;
  return result;
}

void __80__TIStatusBarStyleOverrideLoggingCapture__statusBarStyleOverrideLoggingCapture___block_invoke_8()
{
  v0 = _sbsOverrideLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E3F0E000, v0, OS_LOG_TYPE_DEFAULT, "'LoggingCapture' style override assertion was invalidated.", v1, 2u);
  }

  _statusBarStyleOverrideLoggingCapture__assertionAcquired = 0;
}

void __80__TIStatusBarStyleOverrideLoggingCapture__statusBarStyleOverrideLoggingCapture___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _sbsOverrideLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = "Failed to acquire";
    if (a2) {
      objc_super v4 = "Acquired";
    }
    int v5 = 136315138;
    pid_t v6 = v4;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEFAULT, "%s 'LoggingCapture' style override assertion.", (uint8_t *)&v5, 0xCu);
  }

  _statusBarStyleOverrideLoggingCapture__assertionAcquired = a2;
}

+ (int64_t)_decrementLoggingCaptureOverride
{
  BOOL v3 = (int64_t *)[a1 _loggingCaptureOverrideCountPtr];
  int64_t v4 = *v3;
  if (*v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = *v3;
  }
  *(void *)[a1 _loggingCaptureOverrideCountPtr] = v5 - 1;
  return v4;
}

+ (int64_t)_incrementLoggingCaptureOverride
{
  int64_t v3 = *(void *)[a1 _loggingCaptureOverrideCountPtr];
  *(void *)[a1 _loggingCaptureOverrideCountPtr] = v3 + 1;
  return v3;
}

+ (int64_t)_loggingCaptureOverrideCountPtr
{
  return (int64_t *)&_loggingCaptureOverrideCountPtr_count;
}

@end