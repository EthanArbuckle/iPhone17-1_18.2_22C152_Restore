@interface FCTaskScheduler
+ (id)backgroundDownloadOperationQueue;
+ (id)lowPriorityOperationQueue;
+ (id)lowPriorityQueue;
+ (id)postLaunchQueue;
+ (void)boostBackgroundDownloads;
+ (void)disableOptionalPrefetching;
+ (void)enableBackgroundDownloadsInSpiteOfHighPriorityTasks;
+ (void)executeOptionalPrefetchBlock:(id)a3;
+ (void)popHighPriorityTaskInFlight;
+ (void)pushHighPriorityTaskInFlight;
+ (void)scheduleBackgroundDownloadOperation:(id)a3;
+ (void)scheduleLowPriorityAsyncBlock:(id)a3;
+ (void)scheduleLowPriorityBlock:(id)a3;
+ (void)scheduleLowPriorityBlockForMainThread:(id)a3;
+ (void)scheduleLowPriorityOperation:(id)a3;
+ (void)scheduleOptionalPrefetchBlock:(id)a3;
+ (void)schedulePostLaunchBlockForMainThread:(id)a3;
@end

@implementation FCTaskScheduler

+ (void)popHighPriorityTaskInFlight
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&stru_1EB5D10D4);
  uint64_t v3 = --qword_1EB5D1110;
  v4 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "TaskScheduler: popped high-priority task depth to %ld", (uint8_t *)&v10, 0xCu);
    uint64_t v3 = qword_1EB5D1110;
  }
  if (!v3)
  {
    v5 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "TaskScheduler: resuming low-priority queues", (uint8_t *)&v10, 2u);
    }
    v6 = [a1 postLaunchQueue];
    dispatch_resume(v6);

    v7 = [a1 lowPriorityQueue];
    dispatch_resume(v7);

    v8 = [a1 lowPriorityOperationQueue];
    [v8 setSuspended:0];

    v9 = [a1 backgroundDownloadOperationQueue];
    [v9 setSuspended:0];
  }
  os_unfair_lock_unlock(&stru_1EB5D10D4);
}

+ (void)pushHighPriorityTaskInFlight
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&stru_1EB5D10D4);
  uint64_t v3 = ++qword_1EB5D1110;
  v4 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "TaskScheduler: pushed high-priority task depth to %ld", (uint8_t *)&v10, 0xCu);
    uint64_t v3 = qword_1EB5D1110;
  }
  if (v3 == 1)
  {
    v5 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "TaskScheduler: suspending low-priority queues", (uint8_t *)&v10, 2u);
    }
    v6 = [a1 postLaunchQueue];
    dispatch_suspend(v6);

    v7 = [a1 lowPriorityQueue];
    dispatch_suspend(v7);

    uint64_t v8 = [a1 lowPriorityOperationQueue];
    [(id)v8 setSuspended:1];

    LOBYTE(v8) = _MergedGlobals_149;
    v9 = [a1 backgroundDownloadOperationQueue];
    [v9 setSuspended:(v8 & 1) == 0];
  }
  os_unfair_lock_unlock(&stru_1EB5D10D4);
}

+ (id)postLaunchQueue
{
  if (qword_1EB5D1120 != -1) {
    dispatch_once(&qword_1EB5D1120, &__block_literal_global_21);
  }
  v2 = (void *)qword_1EB5D1118;
  return v2;
}

+ (id)backgroundDownloadOperationQueue
{
  if (qword_1EB5D1108 != -1) {
    dispatch_once(&qword_1EB5D1108, &__block_literal_global_6);
  }
  v2 = (void *)qword_1EB5D1100;
  return v2;
}

void __44__FCTaskScheduler_lowPriorityOperationQueue__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v3 = (void *)qword_1EB5D10E8;
  qword_1EB5D10E8 = (uint64_t)v2;

  [(id)qword_1EB5D10E8 setQualityOfService:9];
  [(id)qword_1EB5D10E8 setMaxConcurrentOperationCount:1];
  [(id)qword_1EB5D10E8 setName:@"com.apple.news.lowpriority"];
  id v4 = [*(id *)(a1 + 32) lowPriorityQueue];
  [(id)qword_1EB5D10E8 setUnderlyingQueue:v4];
}

+ (void)scheduleLowPriorityBlock:(id)a3
{
  id v4 = a3;
  v5 = [a1 lowPriorityQueue];
  dispatch_async(v5, v4);
}

+ (id)lowPriorityQueue
{
  if (qword_1EB5D10E0 != -1) {
    dispatch_once(&qword_1EB5D10E0, &__block_literal_global_22);
  }
  id v2 = (void *)qword_1EB5D10D8;
  return v2;
}

+ (void)scheduleLowPriorityOperation:(id)a3
{
  id v4 = a3;
  id v5 = [a1 lowPriorityOperationQueue];
  [v5 addOperation:v4];
}

+ (void)scheduleLowPriorityBlockForMainThread:(id)a3
{
  id v4 = a3;
  id v5 = [a1 lowPriorityOperationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke;
  v7[3] = &unk_1E5B4F168;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "fc_addAsyncOperationWithBlock:", v7);
}

+ (id)lowPriorityOperationQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FCTaskScheduler_lowPriorityOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D10F0 != -1) {
    dispatch_once(&qword_1EB5D10F0, block);
  }
  id v2 = (void *)qword_1EB5D10E8;
  return v2;
}

void __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke_2;
  v5[3] = &unk_1E5B4E128;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __57__FCTaskScheduler_scheduleLowPriorityBlockForMainThread___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __35__FCTaskScheduler_lowPriorityQueue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, -5);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.news.lowpriority", v0);
  id v2 = (void *)qword_1EB5D10D8;
  qword_1EB5D10D8 = (uint64_t)v1;
}

void __34__FCTaskScheduler_postLaunchQueue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.news.postlaunch", v0);
  id v2 = (void *)qword_1EB5D1118;
  qword_1EB5D1118 = (uint64_t)v1;
}

uint64_t __51__FCTaskScheduler_backgroundDownloadOperationQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.news.backgrounddownload", v1);
  id v3 = (void *)qword_1EB5D10F8;
  qword_1EB5D10F8 = (uint64_t)v2;

  id v4 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v5 = (void *)qword_1EB5D1100;
  qword_1EB5D1100 = (uint64_t)v4;

  [(id)qword_1EB5D1100 setQualityOfService:9];
  [(id)qword_1EB5D1100 setMaxConcurrentOperationCount:1];
  [(id)qword_1EB5D1100 setUnderlyingQueue:qword_1EB5D10F8];
  id v6 = (void *)qword_1EB5D1100;
  return [v6 setName:@"com.apple.news.backgrounddownload"];
}

+ (void)scheduleLowPriorityAsyncBlock:(id)a3
{
  id v4 = +[FCAsyncBlockOperation asyncBlockOperationWithBlock:a3];
  [a1 scheduleLowPriorityOperation:v4];
}

+ (void)scheduleBackgroundDownloadOperation:(id)a3
{
  id v4 = a3;
  id v5 = [a1 backgroundDownloadOperationQueue];
  objc_msgSend(v4, "setQualityOfService:", objc_msgSend(v5, "qualityOfService"));

  id v6 = [a1 backgroundDownloadOperationQueue];
  [v6 addOperation:v4];
}

+ (void)enableBackgroundDownloadsInSpiteOfHighPriorityTasks
{
  os_unfair_lock_lock(&stru_1EB5D10D4);
  if ((_MergedGlobals_149 & 1) == 0)
  {
    id v3 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "TaskScheduler: permitting background downloads regardless of high-priority task depth", v5, 2u);
    }
    _MergedGlobals_149 = 1;
    id v4 = [a1 backgroundDownloadOperationQueue];
    [v4 setSuspended:0];
  }
  os_unfair_lock_unlock(&stru_1EB5D10D4);
}

+ (void)boostBackgroundDownloads
{
  id v3 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "TaskScheduler: boosting priority of background downloads", v7, 2u);
  }
  [a1 enableBackgroundDownloadsInSpiteOfHighPriorityTasks];
  id v4 = [a1 backgroundDownloadOperationQueue];
  [v4 setQualityOfService:25];
  id v5 = [v4 operations];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_13];

  id v6 = [v4 underlyingQueue];
  FCDispatchAsyncWithQualityOfService(v6, 25, &__block_literal_global_15);
}

uint64_t __43__FCTaskScheduler_boostBackgroundDownloads__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setQualityOfService:25];
}

+ (void)scheduleOptionalPrefetchBlock:(id)a3
{
  if ((s_disableOptionalPrefetching & 1) == 0) {
    [a1 scheduleLowPriorityBlock:a3];
  }
}

+ (void)executeOptionalPrefetchBlock:(id)a3
{
  if ((s_disableOptionalPrefetching & 1) == 0) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

+ (void)disableOptionalPrefetching
{
  s_disableOptionalPrefetching = 1;
}

+ (void)schedulePostLaunchBlockForMainThread:(id)a3
{
  id v4 = a3;
  id v5 = [a1 postLaunchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__FCTaskScheduler_schedulePostLaunchBlockForMainThread___block_invoke;
  block[3] = &unk_1E5B4CA88;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __56__FCTaskScheduler_schedulePostLaunchBlockForMainThread___block_invoke(uint64_t a1)
{
}

@end