@interface MTSnapshotScheduler
+ (double)_quiescingWindow;
- (MTSnapshotScheduler)initWithBundleID:(id)a3;
@end

@implementation MTSnapshotScheduler

- (MTSnapshotScheduler)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSnapshotScheduler;
  v6 = [(MTSnapshotScheduler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

+ (double)_quiescingWindow
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MTSnapshotScheduler__quiescingWindow__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_quiescingWindow_onceToken != -1) {
    dispatch_once(&_quiescingWindow_onceToken, block);
  }
  return *(double *)&_quiescingWindow_quiescingWindow;
}

void __39__MTSnapshotScheduler__quiescingWindow__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = +[MTUserDefaults sharedUserDefaults];
  v1 = MTTimeIntervalIsPositive();
  [v0 timeIntervalForKey:@"SnapshotWindow" isValid:v1 defaultValue:5.0];
  _quiescingWindow_quiescingWindow = v2;

  v3 = MTLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2050;
    uint64_t v8 = _quiescingWindow_quiescingWindow;
    id v4 = v6;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Using snapshot quiescing window of %{public}f", (uint8_t *)&v5, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end