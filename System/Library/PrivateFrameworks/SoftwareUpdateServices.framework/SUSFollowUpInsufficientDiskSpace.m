@interface SUSFollowUpInsufficientDiskSpace
+ (double)notificationFrequency;
+ (id)_goToSUPaneAction;
+ (id)actions;
+ (id)identifier;
+ (id)informativeTextWithDescriptor:(id)a3;
+ (id)notificationInformativeTextWithDescriptor:(id)a3;
+ (id)notificationOptions;
+ (id)notificationTitleWithDescriptor:(id)a3;
+ (id)notificationWithDescriptor:(id)a3;
+ (id)titleWithDescriptor:(id)a3;
+ (unint64_t)displayStyle;
@end

@implementation SUSFollowUpInsufficientDiskSpace

+ (id)identifier
{
  return (id)SUSFollowUpUniqueIdentifierInsufficientDiskSpace;
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
      SULogError(@"[SUSFollowUpInsufficientDiskSpace] Anomaly, updateName = %@, update = %@", v4, v5, v6, v7, v8, v9, v10, 0);
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
  int v3 = [a3 isSplatOnly];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = @"AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_CELL_RSR_BODY";
  }
  else {
    uint64_t v6 = @"AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_CELL_UPDATE_BODY";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];

  return v7;
}

+ (unint64_t)displayStyle
{
  return 2;
}

+ (id)_goToSUPaneAction
{
  id v2 = objc_alloc_init(MEMORY[0x263F35378]);
  int v3 = [NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  [v2 setUrl:v3];

  uint64_t v4 = NSString;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  uint64_t v6 = [v5 localizedStringForKey:@"DETAILS" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  uint64_t v7 = [v4 stringWithFormat:v6];
  [v2 setLabel:v7];

  return v2;
}

+ (id)actions
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [a1 _goToSUPaneAction];
  v5[0] = v2;
  int v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
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

    uint64_t v7 = [(id)objc_opt_class() _goToSUPaneAction];
    [v4 setActivateAction:v7];

    [(id)objc_opt_class() notificationFrequency];
    objc_msgSend(v4, "setFrequency:");
    uint64_t v8 = [(id)objc_opt_class() notificationOptions];
    [v4 setOptions:v8];
  }
  return v4;
}

+ (id)notificationTitleWithDescriptor:(id)a3
{
  id v3 = NSString;
  int v4 = [a3 isSplatOnly];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  uint64_t v6 = v5;
  if (v4) {
    uint64_t v7 = @"AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_RSR_TITLE";
  }
  else {
    uint64_t v7 = @"AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_UPDATE_TITLE";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  uint64_t v9 = [v3 stringWithFormat:v8];

  return v9;
}

+ (id)notificationInformativeTextWithDescriptor:(id)a3
{
  id v3 = NSString;
  int v4 = [a3 isSplatOnly];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  uint64_t v6 = v5;
  if (v4) {
    uint64_t v7 = @"AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_RSR_BODY";
  }
  else {
    uint64_t v7 = @"AUTO_SU_FOLLOW_UP_INSUFFICIENT_DISK_SPACE_UPDATE_BODY";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  uint64_t v9 = [v3 stringWithFormat:v8];

  return v9;
}

+ (double)notificationFrequency
{
  return 0.0;
}

+ (id)notificationOptions
{
  v8[4] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F35390] defaultOptions];
  uint64_t v3 = *MEMORY[0x263F35318];
  v8[0] = *MEMORY[0x263F35320];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x263F352F8];
  v8[2] = *MEMORY[0x263F35328];
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v2 setByAddingObjectsFromArray:v5];

  return v6;
}

@end