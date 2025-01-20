@interface NSItemProvider
@end

@implementation NSItemProvider

void __51__NSItemProvider_SafariExtras__safari_timeoutQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilesafari.NSItemProviderTimeoutQueue", v2);
  v1 = (void *)safari_timeoutQueue_queue;
  safari_timeoutQueue_queue = (uint64_t)v0;
}

uint64_t __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v5 = objc_msgSend(MEMORY[0x1E4F28D78], "safari_timeoutQueue");
  dispatch_source_t v40 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);

  v6 = v36[5];
  dispatch_time_t v7 = dispatch_time(0, 300000000);
  dispatch_source_set_timer(v6, v7, 0x11E1A300uLL, 0x5F5E100uLL);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5;
  v29[3] = &unk_1E6D7BF28;
  v29[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v30 = v8;
  v33 = v41;
  id v9 = v3;
  id v32 = v9;
  id v31 = *(id *)(a1 + 40);
  v34 = &v35;
  v10 = (void *)MEMORY[0x1E4E42950](v29);
  dispatch_source_set_event_handler((dispatch_source_t)v36[5], v10);
  dispatch_activate((dispatch_object_t)v36[5]);
  v11 = (id)WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_cold_1(v13, (uint64_t *)(a1 + 32), buf, v11);
  }

  v14 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_6;
  v20[3] = &unk_1E6D7BF78;
  id v15 = v8;
  uint64_t v16 = *(void *)(a1 + 32);
  id v21 = v15;
  uint64_t v22 = v16;
  v26 = v41;
  v27 = &v35;
  id v17 = v9;
  id v24 = v17;
  id v23 = *(id *)(a1 + 40);
  uint64_t v28 = 0x3FD3333333333333;
  id v18 = v10;
  id v25 = v18;
  [v14 _loadAsynchronousFieldsWithUpdateHandler:v20];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  return 0;
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5_cold_1(a1, v2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v3 = *(void *)(a1 + 56);
  v4 = [*(id *)(a1 + 48) dataRepresentation];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);

  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_6(uint64_t a1, char a2)
{
  v4 = objc_msgSend(MEMORY[0x1E4F28D78], "safari_timeoutQueue");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2;
  block[3] = &unk_1E6D7BF50;
  id v5 = *(id *)(a1 + 32);
  char v15 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  long long v13 = *(_OWORD *)(a1 + 72);
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 88);
  id v12 = *(id *)(a1 + 64);
  dispatch_async(v4, block);
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v4 = v3;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 96))
    {
      id v5 = WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_3(a1, v5);
      }
    }
  }
  else if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_2(a1, v6);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [*(id *)(a1 + 48) dataRepresentation];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
  else if (v4 >= *(double *)(a1 + 88))
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v12();
  }
  else
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_1(a1, v11);
    }
  }
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_cold_1(void *a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *a2;
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Starting fetch of metadata for copy for <%{public}@: %p>", buf, 0x16u);
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5_cold_1(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  double v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
  int v9 = 138543874;
  id v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEBUG, "Timed out fetching metadata for copy for <%{public}@: %p> in %fs", (uint8_t *)&v9, 0x20u);
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1E102C000, v5, v6, "Completed partial fetch of metadata for copy for <%{public}@: %p> in %fs", v7, v8, v9, v10, v11);
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1E102C000, v5, v6, "Completed fetch of metadata for copy for <%{public}@: %p> in %fs", v7, v8, v9, v10, v11);
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1E102C000, v5, v6, "Timeout exceeded: Completed fetch of metadata for copy for <%{public}@: %p> in %fs", v7, v8, v9, v10, v11);
}

@end