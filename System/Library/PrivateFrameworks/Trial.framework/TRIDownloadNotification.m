@interface TRIDownloadNotification
+ (BOOL)_errorIsInsufficientDiskSpaceCloudKitError:(id)a3;
+ (BOOL)_notifyDownloadUpdateForKey:(id)a3 withState:(unint64_t)a4;
+ (BOOL)notifyDownloadCompletedForKey:(id)a3;
+ (BOOL)notifyDownloadFailedForKey:(id)a3 withCloudKitError:(id)a4;
+ (BOOL)notifyDownloadFailedForKey:(id)a3 withError:(unint64_t)a4;
+ (BOOL)notifyDownloadProgressForKey:(id)a3 withProgress:(unint64_t)a4;
+ (BOOL)notifyDownloadStalledForKey:(id)a3 withProgress:(unint64_t)a4;
+ (id)_descriptionForErrorCode:(unint64_t)a3;
+ (id)_dispatchQueue;
+ (id)_notificationWithState:(unint64_t)a3;
+ (id)generalErrorFromDownloadNotificationError:(id)a3;
+ (id)immediateDownloadNotificationKeyForNamespaceNames:(id)a3;
+ (id)notificationNameForKey:(id)a3;
+ (id)registerDownloadNotificationForKey:(id)a3 queue:(id)a4 usingBlock:(id)a5;
+ (void)deregisterNotificationWithToken:(id)a3;
- (NSError)error;
- (TRIDownloadNotification)initWithType:(unint64_t)a3 progress:(unint64_t)a4 error:(id)a5;
- (unint64_t)progress;
- (unint64_t)progressMaxValue;
- (unint64_t)type;
@end

@implementation TRIDownloadNotification

- (TRIDownloadNotification)initWithType:(unint64_t)a3 progress:(unint64_t)a4 error:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TRIDownloadNotification;
  v10 = [(TRIDownloadNotification *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_progress = a4;
    objc_storeStrong((id *)&v10->_error, a5);
  }

  return v11;
}

- (unint64_t)progressMaxValue
{
  return 100;
}

+ (id)registerDownloadNotificationForKey:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a4;
  id v9 = a5;
  v10 = +[TRIDownloadNotification notificationNameForKey:v7];
  if (!v8)
  {
    v8 = +[TRIDownloadNotification _dispatchQueue];
  }
  int out_token = 0;
  id v11 = v10;
  v12 = (const char *)[v11 UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __79__TRIDownloadNotification_registerDownloadNotificationForKey_queue_usingBlock___block_invoke;
  handler[3] = &unk_1E596A980;
  id v13 = v7;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  uint32_t v15 = notify_register_dispatch(v12, &out_token, v8, handler);
  if (v15)
  {
    uint32_t v16 = v15;
    v17 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v16;
      _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }

    v18 = 0;
  }
  else
  {
    v19 = [TRINotificationState alloc];
    v18 = [(TRINotificationState *)v19 initWithToken:out_token];
  }

  return v18;
}

void __79__TRIDownloadNotification_registerDownloadNotificationForKey_queue_usingBlock___block_invoke(uint64_t a1, uint64_t token)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  v4 = +[TRIDownloadNotification _notificationWithState:state64];
  v5 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [v4 type];
    uint64_t v8 = [v4 progress];
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19D909000, v5, OS_LOG_TYPE_DEFAULT, "received download notification for notification key %@, with type %lu and progress: %lu", buf, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [[TRINotificationState alloc] initWithToken:token];
  (*(void (**)(uint64_t, TRINotificationState *, void *))(v9 + 16))(v9, v10, v4);
}

+ (void)deregisterNotificationWithToken:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    notify_cancel([v3 token]);
  }
}

+ (BOOL)notifyDownloadProgressForKey:(id)a3 withProgress:(unint64_t)a4
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:withState:](TRIDownloadNotification, "_notifyDownloadUpdateForKey:withState:");
}

+ (BOOL)notifyDownloadCompletedForKey:(id)a3
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:a3 withState:0x1000000000000000];
}

+ (BOOL)notifyDownloadFailedForKey:(id)a3 withError:(unint64_t)a4
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:a3 withState:a4 | 0x2000000000000000];
}

+ (BOOL)notifyDownloadFailedForKey:(id)a3 withCloudKitError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [a1 _errorIsInsufficientDiskSpaceCloudKitError:v7];
    if (v7)
    {
      uint64_t v9 = [v7 userInfo];
      v10 = [v9 objectForKeyedSubscript:@"CKPartialErrors"];

      if (v10)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              __int16 v16 = objc_msgSend(v11, "objectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
              if ([a1 _errorIsInsufficientDiskSpaceCloudKitError:v16]) {
                LOBYTE(v8) = 1;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v13);
        }

        v8 &= 1u;
      }
    }
    if (v8) {
      uint64_t v17 = 4;
    }
    else {
      uint64_t v17 = 1;
    }
    BOOL v18 = +[TRIDownloadNotification notifyDownloadFailedForKey:withError:](TRIDownloadNotification, "notifyDownloadFailedForKey:withError:", v6, v17, (void)v20);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)notifyDownloadStalledForKey:(id)a3 withProgress:(unint64_t)a4
{
  return a3
      && +[TRIDownloadNotification _notifyDownloadUpdateForKey:withState:](TRIDownloadNotification, "_notifyDownloadUpdateForKey:withState:");
}

+ (BOOL)_errorIsInsufficientDiskSpaceCloudKitError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:@"CKErrorDomain"]) {
      BOOL v6 = [v4 code] == 140;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)immediateDownloadNotificationKeyForNamespaceNames:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SIRI_DICTATION_ASSETS", @"SIRI_UNDERSTANDING_ASR_ASSISTANT", @"SIRI_TEXT_TO_SPEECH", @"TRIAL_INTEGRATION_TEST1", @"TRIAL_INTEGRATION_TEST2", @"BIFROST_DEV_1", @"BIFROST_DEV_2", @"BIFROST_PROD_1", @"BIFROST_PROD_2", @"SPRINGBOARD_HOME", @"HEALTH_FEATURE_AVAILABILITY", @"SIRI_TTS_DEVICE_TRAINING", @"REMINDERS_GROCERY", @"BLACKPEARL_SPARROW", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  BOOL v6 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([v4 containsObject:v9])
        {
          BOOL v6 = [NSString stringWithFormat:@"ImmediateDownload-%@", v9];
          goto LABEL_11;
        }
      }
      BOOL v6 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)_notifyDownloadUpdateForKey:(id)a3 withState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = +[TRIDownloadNotification notificationNameForKey:a3];
  BOOL v6 = (const char *)[v5 UTF8String];
  int out_token = 0;
  uint64_t v7 = +[TRIDownloadNotification _dispatchQueue];
  uint32_t v8 = notify_register_dispatch(v6, &out_token, v7, &__block_literal_global_21);

  notify_set_state(out_token, a4);
  notify_cancel(out_token);
  if (v8)
  {
    uint64_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v8;
      v10 = "notify_register_dispatch error: %lu";
LABEL_10:
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
  }
  else
  {
    uint32_t v11 = notify_post(v6);
    if (!v11)
    {
      BOOL v13 = 1;
      goto LABEL_7;
    }
    uint32_t v12 = v11;
    uint64_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v12;
      v10 = "notify_post error: %lu";
      goto LABEL_10;
    }
  }

  BOOL v13 = 0;
LABEL_7:

  return v13;
}

+ (id)notificationNameForKey:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"%@.%@", @"com.apple.trial.Download", v4];

  return v5;
}

+ (id)_dispatchQueue
{
  v2 = (void *)MEMORY[0x1E4F93B18];
  uint64_t v3 = [@"com.apple.trial.Download" UTF8String];
  return (id)[v2 autoreleasingSerialQueueWithLabel:v3 qosClass:17];
}

+ (id)_descriptionForErrorCode:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown error.";
  }
  else {
    return off_1E596B490[a3 - 1];
  }
}

+ (id)_notificationWithState:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFFLL;
  switch(a3 >> 60)
  {
    case 0uLL:
      id v4 = [TRIDownloadNotification alloc];
      uint64_t v5 = 0;
      goto LABEL_7;
    case 1uLL:
      id v4 = [TRIDownloadNotification alloc];
      uint64_t v5 = 1;
      uint64_t v7 = 100;
      goto LABEL_8;
    case 2uLL:
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v10 = [a1 _descriptionForErrorCode:v3];
      v15[0] = v10;
      uint32_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint32_t v12 = (void *)[v9 initWithDomain:@"com.apple.trial" code:v3 userInfo:v11];

      BOOL v6 = [[TRIDownloadNotification alloc] initWithType:2 progress:0 error:v12];
      break;
    case 3uLL:
      id v4 = [TRIDownloadNotification alloc];
      uint64_t v5 = 3;
LABEL_7:
      uint64_t v7 = v3;
LABEL_8:
      BOOL v6 = [(TRIDownloadNotification *)v4 initWithType:v5 progress:v7 error:0];
      break;
    default:
      BOOL v6 = 0;
      break;
  }
  return v6;
}

+ (id)generalErrorFromDownloadNotificationError:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    switch([v4 code])
    {
      case 0:
      case 2:
        goto LABEL_3;
      case 1:
        id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F28568];
        v19 = @"Download encountered a network error.";
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        uint32_t v8 = v11;
        uint64_t v9 = 15;
        goto LABEL_4;
      case 3:
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F28568];
        uint64_t v17 = @"Download cancelled.";
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        uint32_t v8 = v12;
        uint64_t v9 = 14;
        goto LABEL_4;
      case 4:
        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v21[0] = @"System does not have enough disk space available.";
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        uint32_t v8 = v13;
        uint64_t v9 = 4;
        goto LABEL_4;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28568];
    uint64_t v15 = @"Unknown download error.";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint32_t v8 = v6;
    uint64_t v9 = 1;
LABEL_4:
    unint64_t v3 = (void *)[v8 initWithDomain:@"TRIGeneralErrorDomain" code:v9 userInfo:v7];
  }
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end