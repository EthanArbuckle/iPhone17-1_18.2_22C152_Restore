@interface NCNotificationRequest(UserAlert)
+ (id)_notificationOptionsForAlertController:()UserAlert item:;
+ (id)_notificationRequestForDestinations:()UserAlert withAlertItem:identifier:;
+ (id)_notificationSoundFromSound:()UserAlert;
+ (id)notificationRequestForCarPlayWithAlertItem:()UserAlert;
+ (id)notificationRequestForLockScreenWithAlertItem:()UserAlert;
+ (uint64_t)_soundTypeForSBSoundType:()UserAlert;
@end

@implementation NCNotificationRequest(UserAlert)

+ (id)notificationRequestForCarPlayWithAlertItem:()UserAlert
{
  v4 = NSString;
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@-CarPlay-%lu", v7, objc_msgSend(v5, "hash")];

  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FB3850]];
  v10 = [a1 _notificationRequestForDestinations:v9 withAlertItem:v5 identifier:v8];

  return v10;
}

+ (id)notificationRequestForLockScreenWithAlertItem:()UserAlert
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = NSString;
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@-LockScreen-%lu", v7, objc_msgSend(v5, "hash")];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = *MEMORY[0x1E4FB3858];
  v15[0] = *MEMORY[0x1E4FB3860];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12 = [v9 setWithArray:v11];
  v13 = [a1 _notificationRequestForDestinations:v12 withAlertItem:v5 identifier:v8];

  return v13;
}

+ (id)_notificationRequestForDestinations:()UserAlert withAlertItem:identifier:
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = [v8 alertController];
  v13 = [v12 title];

  if (!v13)
  {
    uint64_t v14 = [v8 _prepareNewAlertControllerWithLockedState:1 requirePasscodeForActions:1];

    v12 = (void *)v14;
  }
  [v11 setNotificationIdentifier:v9];
  v15 = NSString;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  uint64_t v18 = [v15 stringWithFormat:@"com.apple.springboard.alert.%@", v17];

  v67 = (void *)v18;
  [v11 setSectionIdentifier:v18];
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  [v11 setThreadIdentifier:v20];

  v21 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setTimestamp:v21];

  [v11 setRequestDestinations:v10];
  v22 = objc_opt_new();
  v23 = [v12 title];
  if ([v23 length])
  {
    v24 = [v12 message];
    uint64_t v25 = [v24 length];

    if (v25) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v26 = [MEMORY[0x1E4F28B50] mainBundle];
  v27 = [v26 localizedStringForKey:@"SYSTEM_NOTIFICATION_HEADER" value:&stru_1F3084718 table:@"SpringBoard"];
  [v22 setCustomHeader:v27];

LABEL_8:
  v28 = [v12 title];
  [v22 setTitle:v28];

  v29 = [v12 message];
  [v22 setMessage:v29];

  v30 = [v8 contactIdentifier];

  if (v30)
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F44690]);
    v32 = [v8 contactIdentifier];
    [v31 setCnContactIdentifier:v32];

    id v33 = objc_alloc_init(MEMORY[0x1E4F44688]);
    [v33 setSender:v31];
    [v33 setBundleIdentifier:v67];
    [v22 setCommunicationContext:v33];
  }
  v34 = [v8 contentType];
  [v22 setContentType:v34];

  uint64_t v35 = [v8 iconImage];
  if (!v35) {
    goto LABEL_18;
  }
  id v36 = (id)v35;
  if ([v8 shouldMaskIcon])
  {
    id v65 = v9;
    id v37 = objc_alloc(MEMORY[0x1E4F6F238]);
    id v36 = v36;
    uint64_t v38 = [v36 CGImage];
    [v36 scale];
    v39 = objc_msgSend(v37, "initWithCGImage:scale:", v38);
    id v40 = objc_alloc(MEMORY[0x1E4F6F248]);
    v68[0] = v39;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
    v66 = (void *)[v40 initWithImages:v41];

    if (objc_opt_respondsToSelector())
    {
      [MEMORY[0x1E4FB3918] prominentIconDimension];
      double v43 = v42;
    }
    else
    {
      double v43 = 38.0;
    }
    id v44 = objc_alloc(MEMORY[0x1E4F6F258]);
    v45 = [MEMORY[0x1E4F42D90] mainScreen];
    [v45 scale];
    v47 = objc_msgSend(v44, "initWithSize:scale:", v43, v43, v46);

    v48 = [v66 imageForDescriptor:v47];
    v49 = v48;
    if (v48)
    {
      v50 = (void *)MEMORY[0x1E4F42A80];
      v64 = v39;
      v51 = a1;
      uint64_t v52 = [v48 CGImage];
      [v49 scale];
      uint64_t v53 = objc_msgSend(v50, "imageWithCGImage:scale:orientation:", v52, 0);

      id v36 = (id)v53;
      a1 = v51;
      v39 = v64;
    }

    id v9 = v65;
    if (!v36)
    {
LABEL_18:
      v54 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.circle"];
      v55 = [MEMORY[0x1E4F42A30] defaultFontForTextStyle:*MEMORY[0x1E4F438F8]];
      v56 = a1;
      v57 = (void *)MEMORY[0x1E4F42A98];
      [v55 pointSize];
      v58 = objc_msgSend(v57, "configurationWithPointSize:");
      id v36 = [v54 imageWithConfiguration:v58];

      a1 = v56;
    }
  }
  [v22 setIcon:v36];
  v59 = [v8 _attachmentImage];
  if (v59) {
    [v22 setAttachmentImage:v59];
  }
  [v11 setContent:v22];
  v60 = [a1 _notificationOptionsForAlertController:v12 item:v8];
  [v11 setOptions:v60];

  v61 = [MEMORY[0x1E4FB37D8] defaultNotificationActionForSBAlertItem:v8];
  if (v61) {
    [v11 setDefaultAction:v61];
  }
  v62 = [MEMORY[0x1E4FB37D8] dismissNotificationActionForSBAlertItem:v8];
  if (v62)
  {
    [v11 setClearAction:v62];
    [v11 setCloseAction:v62];
    [v11 setSilenceAction:v62];
  }

  return v11;
}

+ (id)_notificationOptionsForAlertController:()UserAlert item:
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDismissAutomatically:0];
  objc_msgSend(v7, "setOverridesQuietMode:", objc_msgSend(v6, "_ignoresQuietMode"));
  [v7 setAlertsWhenLocked:1];
  objc_msgSend(v7, "setAddToLockScreenWhenUnlocked:", objc_msgSend(v6, "shouldShowInLockScreen"));
  [v7 setLockScreenPersistence:1];
  [v7 setLockScreenPriority:200];
  [v7 setCanPlaySound:1];
  objc_msgSend(v7, "setCanTurnOnDisplay:", objc_msgSend(v6, "wakeDisplay"));
  objc_msgSend(v7, "setHideClearActionInList:", objc_msgSend(v6, "allowLockScreenDismissal") ^ 1);
  char v8 = [v6 allowMessageInCar];

  if (v8)
  {
    id v9 = [v5 message];
    objc_msgSend(v7, "setLauchUsingSiriForCarPlayDefaultAction:", objc_msgSend(v9, "length") != 0);
  }
  else
  {
    [v7 setLauchUsingSiriForCarPlayDefaultAction:0];
  }

  return v7;
}

+ (uint64_t)_soundTypeForSBSoundType:()UserAlert
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1D8FD2E10[a3 - 1];
  }
}

+ (id)_notificationSoundFromSound:()UserAlert
{
  id v4 = a3;
  unint64_t v5 = [v4 soundType];
  if (v5 > 4 || v5 == 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_opt_new();
    objc_msgSend(v7, "setSoundType:", objc_msgSend(a1, "_soundTypeForSBSoundType:", objc_msgSend(v4, "soundType")));
    char v8 = [v4 songPath];
    [v7 setSongPath:v8];

    objc_msgSend(v7, "setSystemSoundID:", objc_msgSend(v4, "systemSoundID"));
    objc_msgSend(v7, "setSoundBehavior:", objc_msgSend(v4, "soundBehavior"));
    id v9 = [v4 vibrationPattern];
    [v7 setVibrationPattern:v9];
  }
  return v7;
}

@end