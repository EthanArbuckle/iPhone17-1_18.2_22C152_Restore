@interface TRIDeferralNotifier
+ (void)forwardDeferralsFromMonitoredActivity:(id)a3 usingDarwinNotificationName:(const char *)a4 whileExecutingBlock:(id)a5;
@end

@implementation TRIDeferralNotifier

+ (void)forwardDeferralsFromMonitoredActivity:(id)a3 usingDarwinNotificationName:(const char *)a4 whileExecutingBlock:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(void))a5;
  v11 = v10;
  if (a4)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"TRIDeferralNotifier.m", 23, @"Invalid parameter not satisfying: %@", @"notificationName" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"TRIDeferralNotifier.m", 24, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  uint64_t v27 = 0;
  v28 = (unsigned __int8 *)&v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  if (v9)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke;
    v25 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    v26 = a4;
    uint64_t v12 = xpc_activity_add_eligibility_changed_handler();
    v13 = (void *)MEMORY[0x1E4F93B18];
    v14 = dispatch_get_global_queue(17, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke_2;
    v18[3] = &unk_1E6BBA208;
    v20 = &v27;
    id v19 = v9;
    v21 = a4;
    [v13 runAsyncOnQueue:v14 afterDelaySeconds:v18 block:1.0];
  }
  else
  {
    uint64_t v12 = 0;
  }
  v15 = (void *)MEMORY[0x1E016E7F0]();
  v11[2](v11);
  atomic_store(0, v28 + 24);
  if (v12) {
    xpc_activity_remove_eligibility_changed_handler();
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t result = xpc_activity_should_defer(activity);
  if (result)
  {
    v4 = *(const char **)(a1 + 32);
    return notify_post(v4);
  }
  return result;
}

uint64_t __109__TRIDeferralNotifier_forwardDeferralsFromMonitoredActivity_usingDarwinNotificationName_whileExecutingBlock___block_invoke_2(uint64_t result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(result + 40) + 8) + 24));
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = xpc_activity_should_defer(*(xpc_activity_t *)(result + 32));
    if (result)
    {
      v3 = *(const char **)(v2 + 48);
      return notify_post(v3);
    }
  }
  return result;
}

@end