@interface SCSharingReminderDeliveryTask
+ (id)taskRequestScheduledAfter:(double)a3;
- (BOOL)isRepeating;
- (id)identifier;
- (id)nonRepeatingTaskHandler;
@end

@implementation SCSharingReminderDeliveryTask

+ (id)taskRequestScheduledAfter:(double)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F298E0]) initWithIdentifier:@"com.apple.safetycheckd.reminder_delivery"];
  [v4 setRequiresNetworkConnectivity:1];
  [v4 setPriority:2];
  [v4 setScheduleAfter:a3];
  return v4;
}

- (id)identifier
{
  return @"com.apple.safetycheckd.reminder_delivery";
}

- (BOOL)isRepeating
{
  return 0;
}

- (id)nonRepeatingTaskHandler
{
  return &__block_literal_global_2;
}

void __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_2;
  v9[3] = &unk_265497018;
  v9[4] = &v10;
  [v2 setExpirationHandler:v9];
  v3 = SCLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v2;
    _os_log_impl(&dword_25B654000, v3, OS_LOG_TYPE_INFO, "\"SCSharingReminderDeliveryTask handling underlying task: %@\"", buf, 0xCu);
  }

  +[SCUtils registerDarwinNotification:@"com.apple.springboard.lockNotificationListEmptyAtScreenOn"];
  if (*((unsigned char *)v11 + 24))
  {
    id v8 = 0;
    char v4 = [v2 setTaskExpiredWithRetryAfter:&v8 error:300.0];
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      v6 = SCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v7 = [v2 identifier];
        __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_cold_1(v7, (uint64_t)v5, buf, v6);
      }

      [v2 setTaskCompleted];
    }
  }
  else
  {
    [v2 setTaskCompleted];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_25B654000, log, OS_LOG_TYPE_FAULT, "\"Failed to expire task: %@ with error: %@\"", buf, 0x16u);
}

@end