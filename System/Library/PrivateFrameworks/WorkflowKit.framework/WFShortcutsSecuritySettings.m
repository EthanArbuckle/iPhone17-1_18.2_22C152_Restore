@interface WFShortcutsSecuritySettings
+ (BOOL)allowsDeletingLargeAmountsOfData;
+ (BOOL)allowsDeletingWithoutConfirmation;
+ (BOOL)allowsSharingLargeAmountsOfData;
+ (BOOL)areScriptingActionsEnabled;
+ (id)scripingActionDisabledErrorWithActionName:(id)a3;
@end

@implementation WFShortcutsSecuritySettings

+ (BOOL)allowsDeletingLargeAmountsOfData
{
  v2 = +[WFSecuredPreferences standardPreferences];
  char v3 = [v2 BOOLForKey:@"WFAllowDeletingLargeAmountsOfDataKey"];

  return v3;
}

+ (BOOL)allowsDeletingWithoutConfirmation
{
  v2 = +[WFSecuredPreferences standardPreferences];
  char v3 = [v2 BOOLForKey:@"WFAllowDeletingWithoutConfirmationKey"];

  return v3;
}

+ (BOOL)allowsSharingLargeAmountsOfData
{
  v2 = +[WFSecuredPreferences standardPreferences];
  char v3 = [v2 BOOLForKey:@"WFAllowSharingLargeAmountsOfDataKey"];

  return v3;
}

+ (id)scripingActionDisabledErrorWithActionName:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    v4 = NSString;
    v5 = WFLocalizedString(@"“%@” Can’t Be Run");
    v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  }
  else
  {
    v6 = WFLocalizedString(@"Action Cannot Be Run");
  }
  if ([v3 length])
  {
    v7 = NSString;
    v8 = WFLocalizedString(@"This shortcut cannot be run because “%@” is a scripting action and your Shortcuts security settings don’t allow you to run scripting actions.");
    v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
  }
  else
  {
    v9 = WFLocalizedString(@"This shortcut cannot be run because this action is a scripting action and your Shortcuts security settings don’t allow you to run scripting actions.");
  }
  v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v15[0] = *MEMORY[0x1E4F28568];
  v15[1] = v11;
  v16[0] = v6;
  v16[1] = v9;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v13 = [v10 errorWithDomain:@"WFActionErrorDomain" code:12 userInfo:v12];

  return v13;
}

+ (BOOL)areScriptingActionsEnabled
{
  v2 = +[WFSecuredPreferences standardPreferences];
  char v3 = [v2 BOOLForKey:@"WFScriptingActionEnabledKey"];

  return v3;
}

@end