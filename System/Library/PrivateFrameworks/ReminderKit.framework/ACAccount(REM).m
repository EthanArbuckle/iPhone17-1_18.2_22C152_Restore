@interface ACAccount(REM)
- (uint64_t)rem_didChooseToMigrate;
- (uint64_t)rem_didFinishMigration;
- (uint64_t)rem_eligibleForAutoCloudKitMigration;
- (uint64_t)rem_isEligibleForCloudKitReminders;
- (uint64_t)rem_isManagedAppleID;
- (uint64_t)rem_isPrimaryAppleAccount;
@end

@implementation ACAccount(REM)

- (uint64_t)rem_didChooseToMigrate
{
  v1 = [a1 objectForKeyedSubscript:@"remindersIsUsingCloudKit"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)rem_didFinishMigration
{
  v1 = [a1 objectForKeyedSubscript:@"remindersDidFinishMigrationToCloudKit"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)rem_isManagedAppleID
{
  uint64_t v2 = [a1 accountType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17750]];

  if (!v4) {
    return 0;
  }
  v5 = +[REMUserDefaults daemonUserDefaults];
  char v6 = [v5 simulateMAIDAccount];

  if (v6) {
    return 1;
  }

  return objc_msgSend(a1, "aa_isManagedAppleID");
}

- (uint64_t)rem_isPrimaryAppleAccount
{
  uint64_t v2 = [a1 accountType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17750]];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F4BF38];

  return objc_msgSend(a1, "aa_isAccountClass:", v5);
}

- (uint64_t)rem_eligibleForAutoCloudKitMigration
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 accountType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17750]];

  if (v4)
  {
    uint64_t v5 = +[REMUserDefaults daemonUserDefaults];
    int v6 = [v5 forceEligibleForAutoCloudKitMigration];

    SEL v7 = NSSelectorFromString(&cfstr_AaIsremindersa.isa);
    if (objc_opt_respondsToSelector()) {
      unsigned int v8 = ((uint64_t (*)(void *, SEL))[a1 methodForSelector:v7])(a1, v7);
    }
    else {
      unsigned int v8 = 0;
    }
    v12 = +[REMLog account];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [a1 identifier];
      int v14 = 138543874;
      v15 = v13;
      __int16 v16 = 1024;
      unsigned int v17 = v8;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_DEFAULT, "rem_eligibleForAutoCloudKitMigration: {identifier: %{public}@, aa_isRemindersAutoMigratableToCK: %d, forceEligibleForAutoCloudKitMigration: %d}", (uint8_t *)&v14, 0x18u);
    }
    return v6 | v8;
  }
  else
  {
    v9 = +[REMLog account];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [a1 identifier];
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_DEFAULT, "rem_eligibleForAutoCloudKitMigration: Not an AppleAccount {identifier: %{public}@}", (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
}

- (uint64_t)rem_isEligibleForCloudKitReminders
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 accountType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17750]];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = +[REMUserDefaults daemonUserDefaults];
  int v6 = [v5 forceBasicAAAccountEligibleForCloudKitReminders];

  if (v6 && objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E4F4BF28]))
  {
    SEL v7 = +[REMLog account];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [a1 identifier];
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "rem_isEligibleForCloudKitReminders: AAAccount is .basic but forceBasicAAAccountEligibleForCloudKitReminders is turned on, returning YES {identifier: %{public}@}", (uint8_t *)&v11, 0xCu);
    }
    return 1;
  }
  uint64_t result = [a1 isProvisionedForDataclass:*MEMORY[0x1E4F17640]];
  if (!result) {
    return result;
  }
  if (objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38])) {
    return 1;
  }
  uint64_t v10 = *MEMORY[0x1E4F4BF30];

  return objc_msgSend(a1, "aa_isAccountClass:", v10);
}

@end