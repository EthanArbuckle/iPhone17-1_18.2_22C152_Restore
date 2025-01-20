@interface ICQuickNoteSessionSettings
+ (BOOL)hasAccountSupportingLockScreen;
+ (int64_t)sessionDuration;
+ (int64_t)showOnLockScreen;
+ (int64_t)showOnLockScreenSettingValue;
+ (void)disableNotesOnLockScreenIfNecessary;
+ (void)initialize;
+ (void)setSessionDuration:(int64_t)a3;
+ (void)setShowOnLockScreen:(int64_t)a3;
+ (void)updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded;
@end

@implementation ICQuickNoteSessionSettings

+ (void)initialize
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F837D0];
  v4[0] = @"ShowOnLockScreen";
  v4[1] = @"QuickNoteSessionExpiration";
  v5[0] = &unk_1F1F62AF0;
  v5[1] = &unk_1F1F62B08;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  [v2 registerDefaults:v3];
}

+ (int64_t)showOnLockScreen
{
  if ([MEMORY[0x1E4F837D0] BOOLForKey:@"DisableOnLockScreen"]) {
    return 0;
  }
  objc_opt_class();
  v3 = [MEMORY[0x1E4F837D0] objectForKey:@"ShowOnLockScreen"];
  v4 = ICDynamicCast();

  if (v4 && ([v4 unsignedIntegerValue], (unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 3)) {
    int64_t v2 = [v4 unsignedIntegerValue];
  }
  else {
    int64_t v2 = 1;
  }

  return v2;
}

+ (void)setShowOnLockScreen:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F837D0];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  [v4 setObject:v5 forKey:@"ShowOnLockScreen"];

  v6 = (void *)MEMORY[0x1E4F837D0];
  [v6 setBool:a3 == 0 forKey:@"DisableOnLockScreen"];
}

+ (int64_t)sessionDuration
{
  int64_t v2 = [MEMORY[0x1E4F837D0] objectForKey:@"QuickNoteSessionExpiration"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

+ (void)setSessionDuration:(int64_t)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F837D0];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v3 setObject:v4 forKey:@"QuickNoteSessionExpiration"];
}

+ (void)disableNotesOnLockScreenIfNecessary
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Disabling Notes on lock screen because there are no modern accounts", v1, 2u);
}

+ (void)updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded
{
  if ([a1 hasAccountSupportingLockScreen])
  {
    if ([MEMORY[0x1E4F837D0] BOOLForKey:@"DisableOnLockScreen"])
    {
      uint64_t v3 = [a1 showOnLockScreenSettingValue];
      if (v3)
      {
        uint64_t v4 = v3;
        v5 = os_log_create("com.apple.notes", "QuickNote");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Enabling Notes on lock screen because there are modern accounts", buf, 2u);
        }

        [MEMORY[0x1E4F837D0] setBool:0 forKey:@"DisableOnLockScreen"];
        if (v4 != 1) {
          [a1 setShowOnLockScreen:1];
        }
      }
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Disabling Notes on lock screen because there are no modern accounts", v7, 2u);
    }

    [MEMORY[0x1E4F837D0] setBool:1 forKey:@"DisableOnLockScreen"];
  }
}

+ (BOOL)hasAccountSupportingLockScreen
{
  int64_t v2 = +[ICNoteContext sharedContext];
  uint64_t v3 = [v2 workerManagedObjectContext];

  LOBYTE(v2) = +[ICAccount hasModernAccountInContext:v3];
  return (char)v2;
}

+ (int64_t)showOnLockScreenSettingValue
{
  objc_opt_class();
  int64_t v2 = [MEMORY[0x1E4F837D0] objectForKey:@"ShowOnLockScreen"];
  uint64_t v3 = ICDynamicCast();

  if (v3 && ([v3 unsignedIntegerValue], (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 3)) {
    int64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

@end