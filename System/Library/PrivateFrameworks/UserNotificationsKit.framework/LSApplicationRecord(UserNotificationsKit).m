@interface LSApplicationRecord(UserNotificationsKit)
+ (id)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit;
+ (void)_unkit_enumerateRecordsWithOptions:()UserNotificationsKit block:;
+ (void)unkit_enumerateApplicationRecordsEligibleToDeliverNotifications:()UserNotificationsKit;
- (uint64_t)unkit_isEligibleToDeliverNotifications;
@end

@implementation LSApplicationRecord(UserNotificationsKit)

- (uint64_t)unkit_isEligibleToDeliverNotifications
{
  int v2 = [a1 isLaunchProhibited];
  v3 = [a1 applicationState];
  if (![v3 isInstalled] || v2) {
    uint64_t v4 = objc_msgSend(a1, "unkit_isWebAppPlaceholder");
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

+ (void)unkit_enumerateApplicationRecordsEligibleToDeliverNotifications:()UserNotificationsKit
{
  id v4 = a3;
  objc_msgSend(a1, "_unkit_enumerateRecordsWithOptions:block:", 0, v4);
  objc_msgSend(a1, "_unkit_enumerateRecordsWithOptions:block:", 64, v4);
}

+ (id)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit
{
  id v3 = a3;
  id v13 = 0;
  id v4 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:1 error:&v13];
  id v5 = v13;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  if (v5)
  {
    v10 = (void *)NCUILogUtilities;
    if (os_log_type_enabled((os_log_t)NCUILogUtilities, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(UserNotificationsKit) unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:v10];
    }
  }
  else if ((objc_msgSend(v9, "unkit_isEligibleToDeliverNotifications") & 1) == 0)
  {
    v11 = NCUILogUtilities;
    if (os_log_type_enabled((os_log_t)NCUILogUtilities, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(UserNotificationsKit) unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:]((uint64_t)v3, v11);
    }

    id v9 = 0;
  }

  return v9;
}

+ (void)_unkit_enumerateRecordsWithOptions:()UserNotificationsKit block:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F01878] enumeratorWithOptions:a3];
  [v6 setFilter:&__block_literal_global_2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v5[2](v5, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (void)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22012C000, a2, OS_LOG_TYPE_ERROR, "Application record for bundle-id '%{public}@' is ineligible to deliver notifications.", (uint8_t *)&v2, 0xCu);
}

+ (void)unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:()UserNotificationsKit .cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = a2 != 0;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C66DB0](v4);
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_22012C000, v5, OS_LOG_TYPE_ERROR, "Error looking up application record for bundle-id '%{public}@'. Bundle record exists: '%{public}@'", (uint8_t *)&v7, 0x16u);
}

@end