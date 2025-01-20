@interface _SBSSystemNotesCreateActionSettingsDescriptionProvider
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation _SBSSystemNotesCreateActionSettingsDescriptionProvider

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (!a3) {
    return @"createReason";
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, self, @"SBSSystemNotesCreateAction.m", 50, @"Invalid parameter not satisfying: %@", @"setting < SBSSystemNotesCreateActionSettingsKeyCount" object file lineNumber description];

  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v9 = v8;
  if (a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSSystemNotesCreateAction.m", 61, @"Invalid parameter not satisfying: %@", @"setting < SBSSystemNotesCreateActionSettingsKeyCount" object file lineNumber description];

    v10 = @"-count-";
  }
  else
  {
    SBSSystemNotesCreateReasonDescription([v8 integerValue]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end