@interface MRDisplayComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRDisplayComponentHandler)init;
- (id)_init;
@end

@implementation MRDisplayComponentHandler

- (MRDisplayComponentHandler)init
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector("sharedSingleton");
  v7 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"Use +[%@ %@] instead of -%@.", v5, v6, v7);

  return 0;
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)MRDisplayComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v19 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", [v3 BOOLForKey:@"SUcaseForDisplay"]);

    [(MRBaseComponentHandler *)v2 setComponentName:@"TouchController"];
    [(MRBaseComponentHandler *)v2 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT"];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationTitle:@"IMPORTANT_DISPLAY_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_DISPLAY_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setComponentSUCaseKey:@"SUcaseForDisplay"];
    [(MRBaseComponentHandler *)v2 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v2 setDisplayModalPopup:[(MRBaseComponentHandler *)v2 isSUCaseForComponent] ^ 1];
    v4 = +[NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/TouchController"];
    v5 = +[NSURL URLWithString:v4];
    [(MRBaseComponentHandler *)v2 setLinkedSensitiveURL:v5];

    [(MRBaseComponentHandler *)v2 setComponentFollowupClientID:@"com.apple.mobilerepair.DisplayRepair"];
    [(MRBaseComponentHandler *)v2 setFinishRepairTitle:@"FINISH_DISPLAY_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_DISPLAY_REPAIR_DESC"];
    v6 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v7 = [v6 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v2 setFinishRepairKey:v7];

    [(MRBaseComponentHandler *)v2 setComponentUnLockCheckCountKey:@"unlockCheckCountForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentRetriggerCountKey:@"retriggerCheckCountForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentLastCheckTimeKey:@"lastCheckTimeForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentHasDisplayedFollowUpKey:@"hasDisplayedFollowupForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentUnlockCheckerActivityName:@"com.apple.mobilerepair.displayunlockchecker"];
    [(MRBaseComponentHandler *)v2 setComponentNtwkActivityName:@"com.apple.mobilerepair.displaynotifyServer"];
    [(MRBaseComponentHandler *)v2 setComponentId:1];
    [(MRBaseComponentHandler *)v2 setComponentHasNotifiedServerKey:@"hasNotifiedServerForDisplay"];
    v8 = objc_opt_new();
    -[MRBaseComponentHandler setNotifyServer:](v2, "setNotifyServer:", [v8 deviceSupportsRepairBootIntent] ^ 1);

    [(MRBaseComponentHandler *)v2 setComponentNtwkActivityName:@"com.apple.mobilerepair.displaynotifyServer"];
    [(MRBaseComponentHandler *)v2 setComponentDataCollectionPresentedKey:@"dataCollectionNoticePresentedForPartsAndService"];
    [(MRBaseComponentHandler *)v2 setComponentFirstUIDisplayedTimeKey:@"firstUIDisplayedTimeForDisplay"];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierKey:@"lastKnownIDForDisplay"];
    v9 = [(MRBaseComponentHandler *)v2 componentName];
    id v10 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:v9];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierValue:v10];

    v11 = objc_opt_new();
    [(MRBaseComponentHandler *)v2 setComponentAuthHandler:v11];

    v12 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v13 = [@"/var/mobile/Library/Preferences/" stringByAppendingString:v12];
    v14 = [v13 stringByAppendingString:@".plist"];
    [(MRBaseComponentHandler *)v2 setStateFilePath:v14];

    [(MRBaseComponentHandler *)v2 setComponentForceKey:@"ForceDisplayStatus"];
    v18.receiver = v2;
    v18.super_class = (Class)MRDisplayComponentHandler;
    if ([(MRBaseComponentHandler *)&v18 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_DISPLAY_REPAIR_DESC_IPAD"];
      [(MRBaseComponentHandler *)v2 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_DISPLAY_MESSAGE_IPAD"];
      [(MRBaseComponentHandler *)v2 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT"];
      v15 = objc_opt_new();
      unsigned __int8 v16 = [v15 isSupportedIPad];

      if ((v16 & 1) == 0)
      {
        [(MRBaseComponentHandler *)v2 setUnlockCheckActivityRequired:0];
        [(MRBaseComponentHandler *)v2 setDisplayNotification:0];
        [(MRBaseComponentHandler *)v2 setDisplayModalPopup:0];
        [(MRBaseComponentHandler *)v2 setDisplayFollowup:0];
      }
    }
  }
  return v2;
}

+ (void)handleSUCase
{
  if (+[CRFDRBaseDeviceHandler isFDRDataClassSupported:@"tcrt"])
  {
    id v3 = (id)objc_opt_new();
    [a1 handleComponentSUCase:@"hasDisplayedFollowupForDisplay" lastAUthCheckBuildVersion:@"LastDisplayAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.DisplayRepair" queryString:@"TouchController" suCasekey:@"SUcaseForDisplay" startBuildVersion:@"17A800" componentAuth:v3];
  }
}

+ (id)sharedSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000055DC;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA68 != -1) {
    dispatch_once(&qword_10001EA68, block);
  }
  v2 = (void *)qword_10001EA60;

  return v2;
}

@end