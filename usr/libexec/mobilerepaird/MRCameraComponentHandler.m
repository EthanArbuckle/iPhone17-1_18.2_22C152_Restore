@interface MRCameraComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRCameraComponentHandler)init;
- (id)_init;
@end

@implementation MRCameraComponentHandler

- (MRCameraComponentHandler)init
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
  v16.receiver = self;
  v16.super_class = (Class)MRCameraComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v16 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", [v3 BOOLForKey:@"SUcaseForCamera"]);

    [(MRBaseComponentHandler *)v2 setComponentName:@"Camera"];
    [(MRBaseComponentHandler *)v2 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_CAMERA_NOTIF_TEXT"];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationTitle:@"IMPORTANT_CAMERA_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_CAMERA_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setComponentSUCaseKey:@"SUcaseForCamera"];
    [(MRBaseComponentHandler *)v2 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v2 setDisplayModalPopup:[(MRBaseComponentHandler *)v2 isSUCaseForComponent] ^ 1];
    v4 = +[NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Camera"];
    v5 = +[NSURL URLWithString:v4];
    [(MRBaseComponentHandler *)v2 setLinkedSensitiveURL:v5];

    [(MRBaseComponentHandler *)v2 setComponentFollowupClientID:@"com.apple.mobilerepair.CameraRepair"];
    [(MRBaseComponentHandler *)v2 setFinishRepairTitle:@"FINISH_CAMERA_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_CAMERA_REPAIR_DESC"];
    v6 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v7 = [v6 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v2 setFinishRepairKey:v7];

    [(MRBaseComponentHandler *)v2 setComponentUnLockCheckCountKey:@"unlockCheckCountForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentRetriggerCountKey:@"retriggerCheckCountForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentLastCheckTimeKey:@"lastCheckTimeForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentHasDisplayedFollowUpKey:@"hasDisplayedFollowupForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentUnlockCheckerActivityName:@"com.apple.mobilerepair.cameraunlockchecker"];
    [(MRBaseComponentHandler *)v2 setComponentId:2];
    [(MRBaseComponentHandler *)v2 setComponentNtwkActivityName:@"com.apple.mobilerepair.cameranotifyServer"];
    [(MRBaseComponentHandler *)v2 setComponentHasNotifiedServerKey:@"hasNotifiedServerForCamera"];
    [(MRBaseComponentHandler *)v2 setNotifyServer:0];
    [(MRBaseComponentHandler *)v2 setComponentDataCollectionPresentedKey:@"dataCollectionNoticePresentedForPartsAndService"];
    [(MRBaseComponentHandler *)v2 setComponentFirstUIDisplayedTimeKey:@"firstUIDisplayedTimeForCamera"];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierKey:@"lastKnownIDForCamera"];
    v8 = [(MRBaseComponentHandler *)v2 componentName];
    id v9 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:v8];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierValue:v9];

    v10 = objc_opt_new();
    [(MRBaseComponentHandler *)v2 setComponentAuthHandler:v10];

    v11 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v12 = [@"/var/mobile/Library/Preferences/" stringByAppendingString:v11];
    v13 = [v12 stringByAppendingString:@".plist"];
    [(MRBaseComponentHandler *)v2 setStateFilePath:v13];

    [(MRBaseComponentHandler *)v2 setComponentForceKey:@"ForceCameraStatus"];
    if ([(MRBaseComponentHandler *)v2 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_CAMERA_REPAIR_DESC_IPAD"];
      v14 = objc_opt_new();
      [(MRBaseComponentHandler *)v2 setComponentAuthHandler:v14];
    }
  }
  return v2;
}

+ (void)handleSUCase
{
  v3 = (void *)MGCopyAnswer();
  [v3 intValue];

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", @"CmCl") & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRPropertySupported:@"RCSn"])
  {
    id v4 = (id)objc_opt_new();
    [a1 handleComponentSUCase:@"hasDisplayedFollowupForCamera" lastAUthCheckBuildVersion:@"LastCameraAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.CameraRepair" queryString:@"Camera" suCasekey:@"SUcaseForCamera" startBuildVersion:@"18D1" componentAuth:v4];
  }
}

+ (id)sharedSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004098;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA08 != -1) {
    dispatch_once(&qword_10001EA08, block);
  }
  v2 = (void *)qword_10001EA00;

  return v2;
}

@end