@interface MRUWBComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRUWBComponentHandler)init;
- (id)_init;
@end

@implementation MRUWBComponentHandler

- (MRUWBComponentHandler)init
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
  v8.receiver = self;
  v8.super_class = (Class)MRUWBComponentHandler;
  v2 = [(MRSystemHealthComponentHandler *)&v8 initWithComponentName:@"UWB"];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"UWB"];
    v4 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v4];

    [(MRBaseComponentHandler *)v3 setComponentId:7];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationTitle:@"UWB_FOLLOWUP_TITLE"];
    if ([(MRBaseComponentHandler *)v3 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"UWB_FOLLOWUP_INFO_IPAD"];
      [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"UWB_POPUP_INFO_IPAD"];
      v5 = objc_opt_new();
      unsigned __int8 v6 = [v5 isSupportedIPad];

      if ((v6 & 1) == 0)
      {
        [(MRBaseComponentHandler *)v3 setUnlockCheckActivityRequired:0];
        [(MRBaseComponentHandler *)v3 setDisplayNotification:0];
        [(MRBaseComponentHandler *)v3 setDisplayModalPopup:0];
        [(MRBaseComponentHandler *)v3 setDisplayFollowup:0];
      }
    }
    else
    {
      [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"UWB_FOLLOWUP_INFO"];
      [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"UWB_POPUP_INFO"];
    }
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000467C;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA28 != -1) {
    dispatch_once(&qword_10001EA28, block);
  }
  v2 = (void *)qword_10001EA20;

  return v2;
}

+ (void)handleSUCase
{
  id v3 = (id)objc_opt_new();
  [a1 handleComponentSUCase:@"hasDisplayedFollowupForSHCUWB" lastAUthCheckBuildVersion:@"LastUWBAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.UWBRepair" queryString:@"UWB" suCasekey:@"SUcaseForUWB" startBuildVersion:@"19F1" componentAuth:v3];
}

@end