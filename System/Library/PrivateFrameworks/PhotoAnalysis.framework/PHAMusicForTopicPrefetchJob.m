@interface PHAMusicForTopicPrefetchJob
- (BOOL)shouldRunForLibrary:(id)a3;
- (PHAMusicForTopicPrefetchJob)init;
- (double)periodicity;
- (void)runWithGraphManager:(id)a3 progressBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation PHAMusicForTopicPrefetchJob

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
  id v7 = a4;
  id v8 = a5;
  runQueue = self->_runQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke;
  v12[3] = &unk_1E6918540;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(runQueue, v12);
}

void __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke(uint64_t a1)
{
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_6749);
  }
  v2 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v2, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicForTopicPrefetch - beginning music for topic prefetch job", buf, 2u);
  }
  v3 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:*(void *)(a1 + 32)];
  v4 = (void *)MEMORY[0x1E4F8D818];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_196;
  v5[3] = &unk_1E6918AA8;
  id v6 = *(id *)(a1 + 40);
  [v4 prefetchCuratedSongLibraryAssetsWithProgressReporter:v3 completionHandler:v5];
}

void __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_196(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__PXLog_genericOnceToken != -1) {
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_199);
  }
  id v6 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[MemoriesMusic] PHAMusicForTopicPrefetch - music for topic prefetch job completed, success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2_197()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

uint64_t __83__PHAMusicForTopicPrefetchJob_runWithGraphManager_progressBlock_completionHandler___block_invoke_2()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (PHAMusicForTopicPrefetchJob)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHAMusicForTopicPrefetchJob;
  v2 = [(PHAMusicForTopicPrefetchJob *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photoanalysisd.music.forTopicPrefetchJob", v4);
    runQueue = v2->_runQueue;
    v2->_runQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end