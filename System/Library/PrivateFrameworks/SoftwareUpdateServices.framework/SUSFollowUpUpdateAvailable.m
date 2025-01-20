@interface SUSFollowUpUpdateAvailable
+ (double)notificationFrequency;
+ (id)actions;
+ (id)identifier;
+ (id)informativeTextWithDescriptor:(id)a3;
+ (id)notificationClear;
+ (id)notificationDetails;
+ (id)notificationOptions;
+ (id)notificationWithDescriptor:(id)a3;
+ (id)titleWithDescriptor:(id)a3;
+ (unint64_t)displayStyle;
@end

@implementation SUSFollowUpUpdateAvailable

+ (id)identifier
{
  return (id)SUSFollowUpUniqueIdentifierUpdateAvailable;
}

+ (id)titleWithDescriptor:(id)a3
{
  id v3 = a3;
  if ([v3 upgradeType] == 2)
  {
    v11 = [v3 humanReadableUpdateName];
    if (v11)
    {
      v12 = NSString;
      v13 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
      v14 = [v13 localizedStringForKey:@"AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_MAJOR" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
      v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);
    }
    else
    {
      SULogError(@"[SUSFollowUpUpdateAvailable] Anomaly, updateName = %@, update = %@", v4, v5, v6, v7, v8, v9, v10, 0);
      v13 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
      v15 = [v13 localizedStringForKey:@"AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_MINOR" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    }
  }
  else
  {
    char v16 = [v3 isSplatOnly];
    v17 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    v11 = v17;
    if (v16) {
      v18 = @"AUTO_SU_FOLLOW_UP_TEXT_RSR_AVAILABLE_MINOR";
    }
    else {
      v18 = @"AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_MINOR";
    }
    v15 = [v17 localizedStringForKey:v18 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  }

  return v15;
}

+ (id)informativeTextWithDescriptor:(id)a3
{
  id v3 = a3;
  v11 = [v3 humanReadableUpdateName];
  if (v11)
  {
    v12 = NSString;
    char v13 = [v3 isSplatOnly];
    v14 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    v15 = v14;
    if (v13) {
      char v16 = @"AUTO_SU_FOLLOW_UP_TEXT_RSR_AVAILABLE_BODY";
    }
    else {
      char v16 = @"AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_BODY";
    }
    v20 = [v14 localizedStringForKey:v16 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    v21 = objc_msgSend(v12, "stringWithFormat:", v20, v11);
  }
  else
  {
    SULogError(@"[SUSFollowUpUpdateAvailable] Anomaly, updateName = %@, update = %@", v4, v5, v6, v7, v8, v9, v10, 0);
    char v17 = [v3 isSplatOnly];
    v18 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    v15 = v18;
    if (v17) {
      v19 = @"AUTO_SU_FOLLOW_UP_TEXT_RSR_AVAILABLE_BODY_FALLBCAK";
    }
    else {
      v19 = @"AUTO_SU_FOLLOW_UP_TEXT_SU_AVAILABLE_BODY_FALLBACK";
    }
    v21 = [v18 localizedStringForKey:v19 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  }

  return v21;
}

+ (unint64_t)displayStyle
{
  return 2;
}

+ (id)actions
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  if (v2)
  {
    id v3 = [NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
    [v2 setUrl:v3];

    [v2 setIdentifier:@"com.followup.go_to_update_pane"];
    uint64_t v4 = NSString;
    uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    uint64_t v6 = [v5 localizedStringForKey:@"DETAILS" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    uint64_t v7 = [v4 stringWithFormat:v6];
    [v2 setLabel:v7];

    v10[0] = v2;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)notificationWithDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F35390]);
  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() notificationTitleWithDescriptor:v3];
    [v4 setTitle:v5];

    uint64_t v6 = [(id)objc_opt_class() notificationInformativeTextWithDescriptor:v3];
    [v4 setInformativeText:v6];

    uint64_t v7 = [(id)objc_opt_class() notificationDetails];
    [v4 setActivateAction:v7];

    uint64_t v8 = [(id)objc_opt_class() notificationClear];
    [v4 setClearAction:v8];

    [(id)objc_opt_class() notificationFrequency];
    objc_msgSend(v4, "setFrequency:");
    uint64_t v9 = [(id)objc_opt_class() notificationOptions];
    [v4 setOptions:v9];
  }
  return v4;
}

+ (id)notificationDetails
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = v2;
  if (v2)
  {
    [v2 setIdentifier:@"com.followup.go_to_update_pane"];
    id v4 = NSString;
    uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    uint64_t v6 = [v5 localizedStringForKey:@"DETAILS" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    uint64_t v7 = [v4 stringWithFormat:v6];
    [v3 setLabel:v7];
  }
  return v3;
}

+ (id)notificationClear
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  id v3 = v2;
  if (v2)
  {
    [v2 setIdentifier:@"com.followup.go_to_update_pane"];
    id v4 = NSString;
    uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    uint64_t v6 = [v5 localizedStringForKey:@"DISMISS" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    uint64_t v7 = [v4 stringWithFormat:v6];
    [v3 setLabel:v7];
  }
  return v3;
}

+ (double)notificationFrequency
{
  return 0.0;
}

+ (id)notificationOptions
{
  v7[3] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F35390] defaultOptions];
  uint64_t v3 = *MEMORY[0x263F35300];
  v7[0] = *MEMORY[0x263F352F8];
  v7[1] = v3;
  v7[2] = *MEMORY[0x263F35318];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  uint64_t v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

@end