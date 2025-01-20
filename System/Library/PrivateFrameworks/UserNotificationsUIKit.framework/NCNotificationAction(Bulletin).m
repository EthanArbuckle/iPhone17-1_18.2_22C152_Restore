@interface NCNotificationAction(Bulletin)
+ (id)_notificationActionForAction:()Bulletin bulletin:observer:;
+ (id)notificationActionForAction:()Bulletin bulletin:observer:;
+ (id)notificationActionForDefaultAction:()Bulletin bulletin:observer:;
+ (id)notificationActionForDismissAction:()Bulletin bulletin:observer:;
+ (id)notificationActionForFollowActivityAction:()Bulletin bulletin:observer:;
+ (id)notificationActionForSilenceAction:()Bulletin bulletin:observer:;
+ (id)notificationActionForUNNotificationAction:()Bulletin bulletin:observer:;
+ (id)userNotificationActionForNCNotificationAction:()Bulletin;
+ (uint64_t)isSiriActionCandidate:()Bulletin contentType:;
@end

@implementation NCNotificationAction(Bulletin)

+ (id)notificationActionForAction:()Bulletin bulletin:observer:
{
  v1 = objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
  v2 = (void *)[v1 copy];

  return v2;
}

+ (id)notificationActionForDefaultAction:()Bulletin bulletin:observer:
{
  if (a3)
  {
    v3 = objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
    [v3 setIdentifier:*MEMORY[0x1E4F446D0]];
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)notificationActionForDismissAction:()Bulletin bulletin:observer:
{
  id v8 = a3;
  v9 = [a1 _notificationActionForAction:v8 bulletin:a4 observer:a5];
  [v9 setIdentifier:*MEMORY[0x1E4F446E0]];
  [v9 setActivationMode:0];
  if (v8) {
    uint64_t v10 = [v8 shouldDismissBulletin];
  }
  else {
    uint64_t v10 = 1;
  }
  [v9 setShouldDismissNotification:v10];
  v11 = (void *)[v9 copy];

  return v11;
}

+ (id)notificationActionForSilenceAction:()Bulletin bulletin:observer:
{
  v1 = objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
  [v1 setIdentifier:*MEMORY[0x1E4F446F0]];
  [v1 setActivationMode:0];
  v2 = (void *)[v1 copy];

  return v2;
}

+ (id)notificationActionForFollowActivityAction:()Bulletin bulletin:observer:
{
  if (a3)
  {
    v3 = objc_msgSend(a1, "_notificationActionForAction:bulletin:observer:");
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_notificationActionForAction:()Bulletin bulletin:observer:
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 appearance];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB37A0]);
  v12 = [v7 identifier];
  [v11 setIdentifier:v12];

  v13 = [v10 title];
  [v11 setTitle:v13];

  uint64_t v14 = [v7 activationMode];
  if (v14 == 1) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = v14 == 0;
  }
  [v11 setActivationMode:v15];
  objc_msgSend(v11, "setRequiresAuthentication:", objc_msgSend(v7, "isAuthenticationRequired"));
  v16 = [v7 launchURL];
  [v11 setLaunchURL:v16];

  v17 = [v7 launchBundleID];
  [v11 setLaunchBundleID:v17];

  objc_msgSend(v11, "setBehavior:", objc_msgSend(v7, "behavior") == 1);
  v18 = [v7 behaviorParameters];
  [v11 setBehaviorParameters:v18];

  if (v7)
  {
    v19 = [v7 appearance];
    objc_msgSend(v11, "setDestructiveAction:", objc_msgSend(v19, "style") == 1);
  }
  else
  {
    [v11 setDestructiveAction:0];
  }
  objc_msgSend(v11, "setShouldDismissNotification:", objc_msgSend(v7, "shouldDismissBulletin"));
  v20 = [v10 image];
  v21 = [v20 name];
  [v11 setIconImageName:v21];

  v22 = [v20 bundlePath];
  [v11 setIconImageBundlePath:v22];

  v23 = (void *)MEMORY[0x1E4FB37D8];
  v24 = [v9 contentType];
  objc_msgSend(v11, "setIsSiriActionCandidate:", objc_msgSend(v23, "isSiriActionCandidate:contentType:", v9, v24));

  v25 = [[NCBulletinActionRunner alloc] initWithAction:v7 bulletin:v9 observer:v8];
  [v11 setActionRunner:v25];

  return v11;
}

+ (uint64_t)isSiriActionCandidate:()Bulletin contentType:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F50C70]]) {
      int v8 = 0;
    }
    else {
      int v8 = [v7 isEqualToString:*MEMORY[0x1E4F50C60]] ^ 1;
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v5 intentIDs];
    if ([v14 containsObject:v11])
    {
      uint64_t v15 = [v5 intentIDs];
      int v16 = [v15 containsObject:v13];

      int v17 = v16 ^ 1;
    }
    else
    {
      int v17 = 1;
    }

    uint64_t v9 = (v8 | v17) ^ 1u;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)notificationActionForUNNotificationAction:()Bulletin bulletin:observer:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4FB37A0];
  id v38 = a5;
  id v10 = objc_alloc_init(v9);
  id v11 = [v7 identifier];
  [v10 setIdentifier:v11];

  v12 = [v7 title];
  [v10 setTitle:v12];

  uint64_t v35 = [v7 options] & 4;
  if (v35) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  objc_msgSend(v10, "setActivationMode:", v13, v35);
  char v14 = [v7 options];
  [v10 setRequiresAuthentication:v14 & 1];
  objc_opt_class();
  uint64_t v15 = objc_opt_isKindOfClass() & 1;
  [v10 setBehavior:v15];
  unint64_t v16 = [v7 options];
  char v17 = v16;
  [v10 setDestructiveAction:(v16 >> 1) & 1];
  int v18 = [v7 options];
  int v19 = v18;
  [v10 setShouldDismissNotification:(*(void *)&v18 & 0x10000) == 0];
  v20 = [v7 icon];
  v21 = [v20 imageName];
  [v10 setIconImageName:v21];

  v39 = v8;
  if ([v20 isSystemIcon])
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = [v8 sectionBundlePath];
  }
  uint64_t v23 = v14 & 1;
  v37 = (void *)v22;
  [v10 setIconImageBundlePath:v22];
  v24 = (void *)MEMORY[0x1E4F50CA8];
  v25 = [v7 identifier];
  v26 = [v7 title];
  v27 = [v24 actionWithIdentifier:v25 title:v26];

  [v27 setActionType:7];
  [v27 setActivationMode:(v36 >> 2) ^ 1];
  [v27 setAuthenticationRequired:v23];
  [v27 setBehavior:v15];
  [v27 setShouldDismissBulletin:(*(void *)&v19 & 0x10000) == 0];
  if ((v17 & 2) != 0)
  {
    v28 = [v27 appearance];
    [v28 setStyle:1];
  }
  if (v20)
  {
    v29 = [v27 appearance];
    v30 = (void *)MEMORY[0x1E4F50CC0];
    v31 = [v20 imageName];
    v32 = [v30 imageWithName:v31 inBundlePath:v37];
    [v29 setImage:v32];
  }
  v33 = [[NCBulletinActionRunner alloc] initWithAction:v27 bulletin:v39 observer:v38];

  [v10 setActionRunner:v33];

  return v10;
}

+ (id)userNotificationActionForNCNotificationAction:()Bulletin
{
  id v3 = a3;
  v4 = [v3 identifier];
  uint64_t v5 = [v3 title];
  id v6 = (void *)v5;
  id v7 = &stru_1F2F516F8;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  id v8 = v7;

  [v3 activationMode];
  [v3 requiresAuthentication];
  [v3 isDestructiveAction];
  uint64_t v9 = [v3 iconImageName];
  if (v9)
  {
    id v10 = [v3 iconImageBundlePath];
    if ([v10 length]) {
      [MEMORY[0x1E4F445E8] iconWithTemplateImageName:v9];
    }
    else {
    id v11 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:v9];
    }
  }
  else
  {
    id v11 = 0;
  }
  if ([v3 behavior] == 1)
  {
    v12 = [v3 behaviorParameters];
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F446A0]];

    char v14 = [v3 behaviorParameters];
    uint64_t v15 = [v14 objectForKey:*MEMORY[0x1E4F446A8]];

    unint64_t v16 = [MEMORY[0x1E4F44660] actionWithIdentifier:v4 title:v8 options:0 icon:v11 textInputButtonTitle:v13 textInputPlaceholder:v15];
  }
  else
  {
    unint64_t v16 = [MEMORY[0x1E4F445D8] actionWithIdentifier:v4 title:v8 options:0 icon:v11];
  }

  return v16;
}

@end