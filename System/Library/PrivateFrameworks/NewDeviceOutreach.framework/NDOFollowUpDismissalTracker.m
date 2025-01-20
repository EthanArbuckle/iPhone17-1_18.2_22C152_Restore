@interface NDOFollowUpDismissalTracker
+ (BOOL)followUpIsDismissedForSerial:(id)a3;
+ (id)_dismissedSerialNumberHashes;
+ (id)uniqueIdentfierForSerialNumber:(id)a3;
+ (void)eraseAllFollowUpDismissals;
+ (void)eraseFollowUpDismissalForDeviceSerial:(id)a3;
+ (void)storeFollowUpDismissalWithDeviceSerial:(id)a3;
@end

@implementation NDOFollowUpDismissalTracker

+ (id)_dismissedSerialNumberHashes
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"FollowupDismissedSerialNumberHashes"];
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  v7 = [MEMORY[0x263EFFA08] setWithArray:v6];

  return v7;
}

+ (id)uniqueIdentfierForSerialNumber:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [a3 sha256Hash];
    v4 = [@"com.apple.NewDeviceOutreach" stringByAppendingFormat:@".%@", v3];
  }
  else
  {
    v4 = @"com.apple.NewDeviceOutreach";
  }
  return v4;
}

+ (void)storeFollowUpDismissalWithDeviceSerial:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446467;
    v16 = "+[NDOFollowUpDismissalTracker storeFollowUpDismissalWithDeviceSerial:]";
    __int16 v17 = 2113;
    id v18 = v4;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - Storing follow up dismissal by user %{private}@ ", (uint8_t *)&v15, 0x16u);
  }

  id v6 = [a1 _dismissedSerialNumberHashes];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v4 sha256Hash];
  [v7 addObject:v8];

  v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v10 = [v7 allObjects];
  [v9 setObject:v10 forKey:@"FollowupDismissedSerialNumberHashes"];

  v11 = [v4 sha256Hash];
  v12 = [v11 stringByAppendingString:@".dismissed"];

  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v14 = [MEMORY[0x263EFF910] date];
  [v13 setObject:v14 forKey:v12];
}

+ (void)eraseFollowUpDismissalForDeviceSerial:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446210;
    int v15 = "+[NDOFollowUpDismissalTracker eraseFollowUpDismissalForDeviceSerial:]";
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - Erasing follow up dismissal for device", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [a1 _dismissedSerialNumberHashes];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v4 sha256Hash];
  [v7 removeObject:v8];

  v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v10 = [v7 allObjects];
  [v9 setObject:v10 forKey:@"FollowupDismissedSerialNumberHashes"];

  v11 = [v4 sha256Hash];

  v12 = [v11 stringByAppendingString:@".dismissed"];

  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 removeObjectForKey:v12];
}

+ (void)eraseAllFollowUpDismissals
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    v5 = "+[NDOFollowUpDismissalTracker eraseAllFollowUpDismissals]";
    _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s - Erasing all follow up dismissals", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 removeObjectForKey:@"FollowupDismissedSerialNumberHashes"];
}

+ (BOOL)followUpIsDismissedForSerial:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 _dismissedSerialNumberHashes];
  uint64_t v6 = [v4 sha256Hash];

  int v7 = [v5 containsObject:v6];
  v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    v11 = "+[NDOFollowUpDismissalTracker followUpIsDismissedForSerial:]";
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl(&dword_23C013000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - isDismissedByUser: %d", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

@end