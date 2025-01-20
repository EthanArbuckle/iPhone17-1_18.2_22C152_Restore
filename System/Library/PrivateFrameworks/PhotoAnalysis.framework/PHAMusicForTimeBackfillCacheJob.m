@interface PHAMusicForTimeBackfillCacheJob
- (BOOL)shouldRunForLibrary:(id)a3;
- (PHAMusicForTimeBackfillCacheJob)init;
- (double)periodicity;
- (void)runWithGraphManager:(id)a3 progressBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation PHAMusicForTimeBackfillCacheJob

- (void).cxx_destruct
{
}

- (double)periodicity
{
  return 86400.0;
}

- (BOOL)shouldRunForLibrary:(id)a3
{
  return 1;
}

- (void)runWithGraphManager:(id)a3 progressBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, a3);
  runQueue = self->_runQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PHAMusicForTimeBackfillCacheJob_runWithGraphManager_progressBlock_completionHandler___block_invoke;
  v13[3] = &unk_1E6918AD0;
  objc_copyWeak(&v16, &location);
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(runQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __87__PHAMusicForTimeBackfillCacheJob_runWithGraphManager_progressBlock_completionHandler___block_invoke(uint64_t a1)
{
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_3969);
  }
  v2 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v2, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicForTimeCache - beginning music for time backfill cache job", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:*(void *)(a1 + 40)];
    v5 = [WeakRetained photoLibrary];
    v6 = (void *)MEMORY[0x1E4F8D808];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__PHAMusicForTimeBackfillCacheJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_197;
    v8[3] = &unk_1E6918AA8;
    id v9 = *(id *)(a1 + 32);
    [v6 cacheMusicForMomentsInPhotoLibrary:v5 progressReporter:v4 completionHandler:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v4 = [MEMORY[0x1E4F8D3C8] errorForCode:-8];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v4);
  }
}

void __87__PHAMusicForTimeBackfillCacheJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_197(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_200_3974);
  }
  v6 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicForTimeCache - music for time backfill cache job completed, success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__PHAMusicForTimeBackfillCacheJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2_198()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __87__PHAMusicForTimeBackfillCacheJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (PHAMusicForTimeBackfillCacheJob)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHAMusicForTimeBackfillCacheJob;
  v2 = [(PHAMusicForTimeBackfillCacheJob *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photoanalysisd.music.timeBackfillCacheJob", v4);
    runQueue = v2->_runQueue;
    v2->_runQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end