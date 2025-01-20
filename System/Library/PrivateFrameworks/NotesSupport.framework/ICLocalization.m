@interface ICLocalization
+ (id)localizedFrameworkStringForKey:(id)a3 value:(id)a4 table:(id)a5 allowSiri:(BOOL)a6;
@end

@implementation ICLocalization

void __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke()
{
  BOOL v0 = +[ICDeviceSupport processIsSiri];
  localizedFrameworkStringForKey_value_table_allowSiri__shouldUseSiriLocalization = v0;
  if (v0)
  {
    if (!dlopen("/System/Library/PrivateFrameworks/SiriUI.framework/SiriUI", 1))
    {
      v1 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_2(v1);
      }
    }
    if (!dlopen("/System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI", 1))
    {
      v2 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_1(v2);
      }
    }
  }
}

+ (id)localizedFrameworkStringForKey:(id)a3 value:(id)a4 table:(id)a5 allowSiri:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (localizedFrameworkStringForKey_value_table_allowSiri__onceToken != -1) {
    dispatch_once(&localizedFrameworkStringForKey_value_table_allowSiri__onceToken, &__block_literal_global_13);
  }
  int v12 = localizedFrameworkStringForKey_value_table_allowSiri__shouldUseSiriLocalization;
  v13 = (void *)MEMORY[0x263F086E0];
  v14 = ICSharedFrameworkBundleIdentifier();
  v15 = [v13 bundleWithIdentifier:v14];
  v16 = v15;
  if (v12 && v6)
  {
    uint64_t v17 = [v15 siriUILocalizedStringForKey:v9 value:v10 table:v11];
  }
  else
  {
    uint64_t v17 = [v15 localizedStringForKey:v9 value:v10 table:v11];
  }
  v18 = (void *)v17;

  return v18;
}

void __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C263000, log, OS_LOG_TYPE_ERROR, "Unable to lazy load AssistantUI framework", v1, 2u);
}

void __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C263000, log, OS_LOG_TYPE_ERROR, "Unable to lazy load SiriUI framework", v1, 2u);
}

@end