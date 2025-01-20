@interface OSASubmissionScheduler
+ (double)_lastSuccessTime;
+ (id)_calculateNewCadenceParametersWithPermissive:(BOOL)a3 fastLane:(BOOL)a4;
+ (id)_getCurrentCadenceParametersFromActivity:(id)a3;
+ (int64_t)_retryCount;
+ (void)_incrementRetryCount;
+ (void)_resetRetryCount;
+ (void)_saveLastSuccessTime;
+ (void)_scheduleSubmissionWithPermissive:(BOOL)a3;
+ (void)_updateCadenceForActivity:(id)a3 newCadenceParameters:(id)a4;
+ (void)scheduleCleanupWithHomeDirectory:(id)a3;
+ (void)scheduleSubmission;
@end

@implementation OSASubmissionScheduler

+ (void)scheduleSubmission
{
  +[OSASubmissionScheduler _scheduleSubmissionWithPermissive:1];
  +[OSASubmissionScheduler _scheduleSubmissionWithPermissive:0];
}

+ (void)_scheduleSubmissionWithPermissive:(BOOL)a3
{
  v3 = "com.apple.osanalytics.submissions.submit";
  v4 = (void *)*MEMORY[0x1E4F14158];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke;
  v5[3] = &__block_descriptor_41_e33_v16__0__NSObject_OS_xpc_object__8l;
  if (a3) {
    v3 = "com.apple.osanalytics.submissions.submit-permissive";
  }
  BOOL v6 = a3;
  v5[4] = a1;
  xpc_activity_register(v3, v4, v5);
}

void __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (!state)
    {
      +[OSASubmissionScheduler _lastSuccessTime];
      if (v5 <= 0.0) {
        +[OSASubmissionScheduler _saveLastSuccessTime];
      }
      uint64_t v6 = [MEMORY[0x1E4F83948] fastLane];
      if (v6 >= 1) {
        +[OSASubmissionScheduler _resetRetryCount];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v7 = "YES";
        if (*(unsigned char *)(a1 + 40)) {
          v8 = "YES";
        }
        else {
          v8 = "NO";
        }
        if (v6 <= 0) {
          v7 = "NO";
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Initializing submission activity cadence. Permissive: %{public}s. FastLane: %{public}s.", buf, 0x16u);
      }
      v9 = [*(id *)(a1 + 32) _calculateNewCadenceParametersWithPermissive:*(unsigned __int8 *)(a1 + 40) fastLane:v6 > 0];
      +[OSASubmissionScheduler _updateCadenceForActivity:v3 newCadenceParameters:v9];
    }
    goto LABEL_33;
  }
  v10 = [MEMORY[0x1E4F83948] sharedInstance];
  char v11 = [v10 optInApple];

  if (v11)
  {
    if (!*(unsigned char *)(a1 + 40))
    {
LABEL_19:
      uint64_t v17 = [MEMORY[0x1E4F83948] fastLane];
      BOOL v18 = v17 > 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v19 = "YES";
        if (*(unsigned char *)(a1 + 40)) {
          v20 = "YES";
        }
        else {
          v20 = "NO";
        }
        if (v17 <= 0) {
          v19 = "NO";
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Scheduling submission. Permissive: %{public}s. FastLane: %{public}s.", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v32 = 0;
      v21 = dispatch_queue_create("com.apple.osanalytics.submissions.schedulerQueue", 0);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_14;
      v25[3] = &unk_1E6CAF4F0;
      BOOL v29 = v18;
      char v30 = *(unsigned char *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 32);
      v27 = buf;
      uint64_t v28 = v22;
      v26 = v3;
      dispatch_sync(v21, v25);

      _Block_object_dispose(buf, 8);
      goto LABEL_33;
    }
    xpc_object_t v12 = xpc_activity_copy_criteria(v3);
    int64_t int64 = xpc_dictionary_get_int64(v12, (const char *)*MEMORY[0x1E4F141C8]);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v15 = v14;
    +[OSASubmissionScheduler _lastSuccessTime];
    if (v15 - v16 >= (double)(int64 + 86400))
    {

      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)MEMORY[0x1E4F1C9C8];
      +[OSASubmissionScheduler _lastSuccessTime];
      v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = int64;
      _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Cancelling permissive submission due to recent success at %{public}@ with interval %{public}lli.", buf, 0x16u);
    }
    xpc_activity_set_state(v3, 5);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Cancelling submission due to opt-out.", buf, 2u);
    }
    xpc_activity_set_state(v3, 5);
  }
LABEL_33:
}

void __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_14(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(OSASubmissionClient);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(OSASubmissionClient *)v2 submit];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    +[OSASubmissionScheduler _saveLastSuccessTime];
LABEL_4:
    +[OSASubmissionScheduler _resetRetryCount];
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_4;
  }
  if (!*(unsigned char *)(a1 + 57)) {
    +[OSASubmissionScheduler _incrementRetryCount];
  }
LABEL_5:
  uint64_t v7 = MEMORY[0x1E4F143A8];
  LOBYTE(v8) = *(unsigned char *)(a1 + 57);
  AnalyticsSendEventLazy();
  v3 = objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance", v7, 3221225472, __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_2, &__block_descriptor_33_e19___NSDictionary_8__0l, v8, @"crk");
  v4 = [v3 crashReporterKey];
  v9[1] = @"type";
  v10[0] = v4;
  v10[1] = @"unified";
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  rtcsc_send();

  [MEMORY[0x1E4F83940] recordEvent:*MEMORY[0x1E4F83980]];
  uint64_t v6 = [*(id *)(a1 + 48) _calculateNewCadenceParametersWithPermissive:*(unsigned __int8 *)(a1 + 57) fastLane:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 48) _updateCadenceForActivity:*(void *)(a1 + 32) newCadenceParameters:v6];
}

id __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_2(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"action";
  v4[1] = @"type";
  v5[0] = @"submit";
  v5[1] = @"unified";
  v4[2] = @"permissive";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[2] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

+ (void)scheduleCleanupWithHomeDirectory:(id)a3
{
  id v3 = a3;
  v4 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke;
  handler[3] = &unk_1E6CAF580;
  id v7 = v3;
  id v5 = v3;
  xpc_activity_register("com.apple.osanalytics.submissions.cleanup", v4, handler);
}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Scheduling cleanup.", buf, 2u);
    }
    id v3 = dispatch_queue_create("com.apple.osanalytics.submissions.schedulerQueue", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_45;
    block[3] = &unk_1E6CAF538;
    id v5 = *(id *)(a1 + 32);
    dispatch_sync(v3, block);
    AnalyticsSendEventLazy();
  }
}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_45(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F83930];
  id v3 = [MEMORY[0x1E4F83948] sharedInstance];
  v4 = [v3 pathSubmission];
  id v5 = [v2 scanProxies:v4];

  uint64_t v6 = [MEMORY[0x1E4F83A18] submissionPathsWithHomeDirectory:*(void *)(a1 + 32)];
  if ([MEMORY[0x1E4F83930] isDataVaultEnabled])
  {
    id v7 = [MEMORY[0x1E4F83948] sharedInstance];
    uint64_t v8 = [v7 pathSubmissionDataVault];

    if (v8)
    {
      v9 = [MEMORY[0x1E4F83930] scanProxies:v8];
      id v10 = (id)[v5 arrayByAddingObjectsFromArray:v9];

      id v11 = (id)[v6 arrayByAddingObject:v8];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_45_cold_1();
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  xpc_object_t v12 = objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5, 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [MEMORY[0x1E4F83930] cleanupRetired:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  if (OSAIsRSDDisplay()) {
    [MEMORY[0x1E4F83930] cleanupForUser:0];
  }
}

void *__59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_48()
{
  return &unk_1F382C700;
}

+ (id)_calculateNewCadenceParametersWithPermissive:(BOOL)a3 fastLane:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[OSASubmissionScheduler _retryCount];
  uint64_t v7 = *MEMORY[0x1E4F141F8];
  if (v5 && v4)
  {
    uint64_t v8 = *MEMORY[0x1E4F141F8];
    v7 *= 12;
    goto LABEL_10;
  }
  uint64_t v9 = *MEMORY[0x1E4F141E8];
  if (v5)
  {
    uint64_t v8 = *MEMORY[0x1E4F141F8];
LABEL_6:
    uint64_t v7 = v9;
    goto LABEL_10;
  }
  if (v4 || OSAIsACDCDevice())
  {
    uint64_t v8 = *MEMORY[0x1E4F14210];
  }
  else
  {
    if (v6 < 1)
    {
      uint64_t v8 = 3 * v7;
      goto LABEL_6;
    }
    uint64_t v18 = v7;
    if (v6 != 1)
    {
      if (v6 == 2) {
        uint64_t v18 = 2 * v7;
      }
      else {
        uint64_t v18 = *MEMORY[0x1E4F14218];
      }
    }
    uint64_t v19 = v18 + arc4random_uniform(0xE10u);
    uint64_t v8 = v7;
    uint64_t v7 = v19 - 1800;
  }
LABEL_10:
  id v10 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14170]];
  v20[0] = v10;
  id v11 = [NSNumber numberWithLongLong:v7];
  v21[0] = v11;
  xpc_object_t v12 = [NSString stringWithUTF8String:*MEMORY[0x1E4F141C8]];
  v20[1] = v12;
  uint64_t v13 = [NSNumber numberWithLongLong:v7];
  v21[1] = v13;
  uint64_t v14 = [NSString stringWithUTF8String:*MEMORY[0x1E4F141A8]];
  v20[2] = v14;
  uint64_t v15 = [NSNumber numberWithLongLong:v8];
  v21[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v16;
}

+ (id)_getCurrentCadenceParametersFromActivity:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  BOOL v4 = (const char *)*MEMORY[0x1E4F14170];
  BOOL v5 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14170]];
  v15[0] = v5;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(v3, v4));
  v16[0] = v6;
  uint64_t v7 = (const char *)*MEMORY[0x1E4F141C8];
  uint64_t v8 = [NSString stringWithUTF8String:*MEMORY[0x1E4F141C8]];
  v15[1] = v8;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(v3, v7));
  v16[1] = v9;
  id v10 = (const char *)*MEMORY[0x1E4F141A8];
  id v11 = [NSString stringWithUTF8String:*MEMORY[0x1E4F141A8]];
  v15[2] = v11;
  xpc_object_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(v3, v10));
  v16[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

+ (void)_updateCadenceForActivity:(id)a3 newCadenceParameters:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_xpc_activity_s *)a3;
  id v7 = a4;
  uint64_t v8 = [a1 _getCurrentCadenceParametersFromActivity:v6];
  uint64_t v9 = xpc_activity_copy_identifier();
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [NSString stringWithUTF8String:v9];
    free(v10);
  }
  else
  {
    id v11 = 0;
  }
  xpc_activity_state_t state = xpc_activity_get_state(v6);
  if (!state) {
    goto LABEL_11;
  }
  if (state != 2) {
    goto LABEL_15;
  }
  if (xpc_activity_set_state(v6, 5)) {
    usleep(0xAu);
  }
  if ([v8 isEqualToDictionary:v7])
  {
LABEL_15:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543618;
      v24 = v11;
      __int16 v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Submission cadences were unchanged for activity %{public}@. Keeping current cadences parameters %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
LABEL_11:
    xpc_object_t v13 = xpc_activity_copy_criteria(v6);
    uint64_t v14 = (const char *)*MEMORY[0x1E4F14170];
    uint64_t v15 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14170]];
    uint64_t v16 = [v7 objectForKeyedSubscript:v15];
    xpc_dictionary_set_int64(v13, v14, [v16 longLongValue]);

    long long v17 = (const char *)*MEMORY[0x1E4F141C8];
    uint64_t v18 = [NSString stringWithUTF8String:*MEMORY[0x1E4F141C8]];
    uint64_t v19 = [v7 objectForKeyedSubscript:v18];
    xpc_dictionary_set_int64(v13, v17, [v19 longLongValue]);

    long long v20 = (const char *)*MEMORY[0x1E4F141A8];
    v21 = [NSString stringWithUTF8String:*MEMORY[0x1E4F141A8]];
    uint64_t v22 = [v7 objectForKeyedSubscript:v21];
    xpc_dictionary_set_int64(v13, v20, [v22 longLongValue]);

    xpc_activity_set_criteria(v6, v13);
  }
}

+ (void)_saveLastSuccessTime
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "setDouble:forKey:", @"lastSuccess");
}

+ (double)_lastSuccessTime
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"lastSuccess"];
  double v4 = v3;

  return v4;
}

+ (int64_t)_retryCount
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"retryCount"];

  return v3;
}

+ (void)_incrementRetryCount
{
  uint64_t v3 = +[OSASubmissionScheduler _retryCount];
  if (v3 > 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Maxed out on retries. Resetting retry count", buf, 2u);
    }
    [a1 _resetRetryCount];
  }
  else
  {
    uint64_t v4 = v3;
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setInteger:v4 + 1 forKey:@"retryCount"];
  }
}

+ (void)_resetRetryCount
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setInteger:0 forKey:@"retryCount"];
}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_45_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DCCDF000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get the data vault submission path.", v0, 2u);
}

@end