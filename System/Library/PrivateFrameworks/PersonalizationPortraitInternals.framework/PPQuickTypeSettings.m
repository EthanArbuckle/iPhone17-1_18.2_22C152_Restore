@interface PPQuickTypeSettings
+ (BOOL)servantShouldRespondToQuery:(id)a3;
@end

@implementation PPQuickTypeSettings

+ (BOOL)servantShouldRespondToQuery:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PPQuickTypeSettings.m", 26, @"Invalid parameter not satisfying: %@", @"servant" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v9 = (id *)MEMORY[0x1E4F8A050];
LABEL_12:
    v7 = *v9;
    v10 = +[PPSettings sharedInstance];
    char v8 = [v10 bundleIdentifierIsEnabledForDonation:v7];

    goto LABEL_13;
  }
  if (v6 == objc_opt_class())
  {
    v9 = (id *)MEMORY[0x1E4F8A040];
    goto LABEL_12;
  }
  if (v6 == objc_opt_class())
  {
    v9 = (id *)MEMORY[0x1E4F8A0A0];
    goto LABEL_12;
  }
  v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v6;
    _os_log_fault_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_FAULT, "unknown servant passed to servantShouldRespondToQuery: %@", buf, 0xCu);
  }
  char v8 = 0;
LABEL_13:

  return v8;
}

@end