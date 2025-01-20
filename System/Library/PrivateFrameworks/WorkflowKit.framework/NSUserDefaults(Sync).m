@interface NSUserDefaults(Sync)
+ (id)syncShortcutsUserDefaults;
+ (uint64_t)databaseCoherenceEnabled;
+ (uint64_t)shouldSyncCoherence;
+ (uint64_t)syncCoherenceEnabled;
+ (uint64_t)syncEventLoggingEnabled;
+ (void)setShouldSyncCoherence:()Sync;
+ (void)setSyncEventLoggingEnabled:()Sync;
@end

@implementation NSUserDefaults(Sync)

+ (uint64_t)databaseCoherenceEnabled
{
  v0 = [MEMORY[0x1E4F1CB18] simulatedFeatureFlagState:@"coherence_database"];
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 BOOLValue];
  }
  else {
    uint64_t v2 = _os_feature_enabled_impl();
  }
  uint64_t v3 = v2;

  return v3;
}

+ (id)syncShortcutsUserDefaults
{
  if (syncShortcutsUserDefaults_onceToken[0] != -1) {
    dispatch_once(syncShortcutsUserDefaults_onceToken, &__block_literal_global_56212);
  }
  v0 = (void *)syncShortcutsUserDefaults_syncShortcutsUserDefaults;
  return v0;
}

+ (void)setSyncEventLoggingEnabled:()Sync
{
  id v4 = [a1 syncShortcutsUserDefaults];
  [v4 setBool:a3 forKey:@"WFSyncEventLoggingEnabled"];
}

+ (uint64_t)syncEventLoggingEnabled
{
  v1 = [a1 syncShortcutsUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:@"WFSyncEventLoggingEnabled"];

  return v2;
}

+ (void)setShouldSyncCoherence:()Sync
{
  id v4 = [a1 syncShortcutsUserDefaults];
  [v4 setBool:a3 forKey:@"WFShortcutsShouldSyncCoherence"];
}

+ (uint64_t)shouldSyncCoherence
{
  if (![a1 databaseCoherenceEnabled]
    || ![a1 syncCoherenceEnabled])
  {
    return 0;
  }
  uint64_t v2 = [a1 syncShortcutsUserDefaults];
  uint64_t v3 = [v2 BOOLForKey:@"WFShortcutsShouldSyncCoherence"];

  return v3;
}

+ (uint64_t)syncCoherenceEnabled
{
  v0 = [MEMORY[0x1E4F1CB18] simulatedFeatureFlagState:@"coherence_sync"];
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 BOOLValue];
  }
  else {
    uint64_t v2 = _os_feature_enabled_impl();
  }
  uint64_t v3 = v2;

  return v3;
}

@end