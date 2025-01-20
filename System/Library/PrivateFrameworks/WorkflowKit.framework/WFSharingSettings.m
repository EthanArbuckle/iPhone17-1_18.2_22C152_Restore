@interface WFSharingSettings
+ (BOOL)isPrivateSharingEnabled;
+ (BOOL)sharingEnabled;
+ (BOOL)shortcutFileSharingEnabled;
+ (id)privateSharingDisabledAlertWithShortcutName:(id)a3;
+ (id)privateSharingDisabledErrorWithShortcutName:(id)a3;
+ (id)sharingDisabledAlertWithShortcutName:(id)a3;
+ (id)sharingDisabledAlertWithWorkflowName:(id)a3;
+ (id)shortcutFileSharingDisabledAlert;
+ (id)shortcutFileSharingDisabledError;
@end

@implementation WFSharingSettings

+ (id)privateSharingDisabledAlertWithShortcutName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5A768];
  v4 = [a1 privateSharingDisabledErrorWithShortcutName:a3];
  v5 = [v3 alertWithError:v4];

  return v5;
}

+ (id)privateSharingDisabledErrorWithShortcutName:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    v4 = NSString;
    v5 = WFLocalizedString(@"“%@” Can’t Be Imported");
    v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  }
  else
  {
    v6 = WFLocalizedString(@"Shortcut Cannot Be Imported");
  }
  if ([v3 length])
  {
    v7 = NSString;
    v8 = WFLocalizedString(@"The shortcut “%@” was received from someone you know, but it cannot be opened because Private Sharing is disabled in your Shortcuts settings.");
    v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
  }
  else
  {
    v9 = WFLocalizedString(@"This shortcut was received from someone you may know, but it cannot be opened because Private Sharing is disabled in your Shortcuts settings.");
  }
  v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v15[0] = *MEMORY[0x1E4F28568];
  v15[1] = v11;
  v16[0] = v9;
  v16[1] = v6;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v13 = [v10 errorWithDomain:@"WFShortcutSharingErrorDomain" code:2 userInfo:v12];

  return v13;
}

+ (BOOL)isPrivateSharingEnabled
{
  v2 = +[WFSecuredPreferences standardPreferences];
  char v3 = [v2 BOOLForKey:@"WFShortcutsPrivateSharingEnabled"];

  return v3;
}

+ (id)shortcutFileSharingDisabledError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v8[0] = *MEMORY[0x1E4F28568];
  char v3 = WFLocalizedString(@"Importing unsigned shortcut files is not supported. Please use another sharing option.");
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E4F28588];
  v4 = WFLocalizedString(@"Shortcut Cannot Be Opened");
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v6 = [v2 errorWithDomain:@"WFShortcutSharingErrorDomain" code:0 userInfo:v5];

  return v6;
}

+ (id)shortcutFileSharingDisabledAlert
{
  v2 = (void *)MEMORY[0x1E4F5A768];
  char v3 = [a1 shortcutFileSharingDisabledError];
  v4 = [v2 alertWithError:v3];

  return v4;
}

+ (id)sharingDisabledAlertWithShortcutName:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    v4 = NSString;
    v5 = WFLocalizedString(@"“%@” Can’t Be Opened");
    v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  }
  else
  {
    v6 = WFLocalizedString(@"Shortcut Cannot Be Opened");
  }
  v7 = WFLocalizedString(@"This shortcut cannot be opened because your Shortcuts security settings don’t allow untrusted shortcuts.");
  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28588];
  v13[0] = *MEMORY[0x1E4F28568];
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v11 = [v8 errorWithDomain:@"WFShortcutSharingErrorDomain" code:2 userInfo:v10];

  return v11;
}

+ (id)sharingDisabledAlertWithWorkflowName:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F5A768];
  v4 = [a1 sharingDisabledAlertWithShortcutName:a3];
  v5 = [v3 alertWithError:v4];

  return v5;
}

+ (BOOL)shortcutFileSharingEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFShortcutsFileSharingEnabled"];

  return v3;
}

+ (BOOL)sharingEnabled
{
  return 1;
}

@end