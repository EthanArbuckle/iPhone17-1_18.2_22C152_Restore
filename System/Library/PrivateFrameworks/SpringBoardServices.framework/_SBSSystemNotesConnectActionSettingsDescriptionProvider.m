@interface _SBSSystemNotesConnectActionSettingsDescriptionProvider
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation _SBSSystemNotesConnectActionSettingsDescriptionProvider

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (!a3) {
    return @"connectionSource";
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, self, @"SBSSystemNotesConnectAction.m", 49, @"Invalid parameter not satisfying: %@", @"setting < SBSSystemNotesConnectActionSettingsKeyCount" object file lineNumber description];

  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v9 = v8;
  if (a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSSystemNotesConnectAction.m", 60, @"Invalid parameter not satisfying: %@", @"setting < SBSSystemNotesConnectActionSettingsKeyCount" object file lineNumber description];

    v10 = @"-count-";
  }
  else
  {
    SBSSystemNotesConnectionSourceDescription([v8 unsignedIntegerValue]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end