@interface SFCollaborationUserDefaults
+ (id)sharedDefaults;
- (id)existingCollaborativeModeForContentIdentifier:(id)a3;
- (void)setCollaborativeMode:(BOOL)a3 contentIdentifier:(id)a4;
@end

@implementation SFCollaborationUserDefaults

+ (id)sharedDefaults
{
  if (sharedDefaults_once != -1) {
    dispatch_once(&sharedDefaults_once, &__block_literal_global_12);
  }
  v2 = (void *)sharedDefaults_sharedDefaults;

  return v2;
}

void __45__SFCollaborationUserDefaults_sharedDefaults__block_invoke()
{
  v0 = objc_alloc_init(SFCollaborationUserDefaults);
  v1 = (void *)sharedDefaults_sharedDefaults;
  sharedDefaults_sharedDefaults = (uint64_t)v0;
}

- (void)setCollaborativeMode:(BOOL)a3 contentIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [NSString stringWithFormat:@"%@.%@", @"SFCollaborationUserDefaults", v5];
  v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "no";
    if (v4) {
      v8 = "yes";
    }
    *(_DWORD *)buf = 136315394;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Saving collaborative mode:%s for contentIdentifier:%@", buf, 0x16u);
  }

  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v10 = [NSNumber numberWithBool:v4];
  [v9 setObject:v10 forKey:v6];
}

- (id)existingCollaborativeModeForContentIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [NSString stringWithFormat:@"%@.%@", @"SFCollaborationUserDefaults", v3];
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [v5 objectForKey:v4];

  v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 BOOLValue];
    v9 = "no";
    if (v8) {
      v9 = "yes";
    }
    *(_DWORD *)buf = 136315394;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Retrieving collaborative mode:%s for contentIdentifier:%@", buf, 0x16u);
  }

  return v6;
}

@end