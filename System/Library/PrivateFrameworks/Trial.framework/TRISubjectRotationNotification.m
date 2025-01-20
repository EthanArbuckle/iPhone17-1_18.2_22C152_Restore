@interface TRISubjectRotationNotification
+ (BOOL)notifySubjectRotation;
+ (id)registerSubjectRotationWithQueue:(id)a3 usingBlock:(id)a4;
+ (void)deregisterUpdateWithToken:(id)a3;
@end

@implementation TRISubjectRotationNotification

+ (id)registerSubjectRotationWithQueue:(id)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    v5 = dispatch_queue_create("com.apple.trial.SubjectRotation", v8);
  }
  int out_token = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __78__TRISubjectRotationNotification_registerSubjectRotationWithQueue_usingBlock___block_invoke;
  v19 = &unk_1E596A288;
  id v20 = v6;
  id v9 = v6;
  uint32_t v10 = notify_register_dispatch("com.apple.trial.SubjectRotation", &out_token, v5, &v16);
  if (v10)
  {
    uint32_t v11 = v10;
    v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v11;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v14 = [TRINotificationState alloc];
    v13 = -[TRINotificationState initWithToken:](v14, "initWithToken:", out_token, v16, v17, v18, v19, v20);
  }

  return v13;
}

uint64_t __78__TRISubjectRotationNotification_registerSubjectRotationWithQueue_usingBlock___block_invoke(uint64_t a1)
{
  v2 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19D909000, v2, OS_LOG_TYPE_DEBUG, "received notification for subject rotation", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)deregisterUpdateWithToken:(id)a3
{
  if (a3)
  {
    int v3 = [a3 token];
    notify_cancel(v3);
  }
}

+ (BOOL)notifySubjectRotation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint32_t v2 = notify_post("com.apple.trial.SubjectRotation");
  if (v2)
  {
    int v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      uint64_t v6 = v2;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2 == 0;
}

@end