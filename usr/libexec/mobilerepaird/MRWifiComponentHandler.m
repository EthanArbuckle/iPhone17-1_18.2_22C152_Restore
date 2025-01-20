@interface MRWifiComponentHandler
+ (id)sharedSingleton;
- (MRWifiComponentHandler)init;
- (id)_init;
@end

@implementation MRWifiComponentHandler

- (MRWifiComponentHandler)init
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
  if (MGGetBoolAnswer())
  {
    v17.receiver = self;
    v17.super_class = (Class)MRWifiComponentHandler;
    v3 = [(MRSystemHealthComponentHandler *)&v17 initWithComponentName:@"WLAN"];
    v4 = v3;
    if (!v3) {
      return v4;
    }
    [(MRBaseComponentHandler *)v3 setComponentName:@"WLAN"];
    v5 = objc_opt_new();
    [(MRBaseComponentHandler *)v4 setComponentAuthHandler:v5];

    [(MRBaseComponentHandler *)v4 setComponentId:4];
    [(MRBaseComponentHandler *)v4 setPopUpNotificationTitle:@"WLAN_FOLLOWUP_TITLE"];
    unsigned int v6 = [(MRBaseComponentHandler *)v4 deviceClass];
    BOOL v7 = v6 == 3;
    if (v6 == 3) {
      CFStringRef v8 = @"WLAN_FOLLOWUP_INFO_IPAD";
    }
    else {
      CFStringRef v8 = @"WLAN_FOLLOWUP_INFO";
    }
    CFStringRef v9 = @"WLAN_POPUP_INFO";
    CFStringRef v10 = @"WLAN_POPUP_INFO_IPAD";
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MRWifiComponentHandler;
    v11 = [(MRSystemHealthComponentHandler *)&v16 initWithComponentName:@"Wifi"];
    v4 = v11;
    if (!v11) {
      return v4;
    }
    [(MRBaseComponentHandler *)v11 setComponentName:@"Wifi"];
    v12 = objc_opt_new();
    [(MRBaseComponentHandler *)v4 setComponentAuthHandler:v12];

    [(MRBaseComponentHandler *)v4 setComponentId:4];
    [(MRBaseComponentHandler *)v4 setPopUpNotificationTitle:@"WIFI_FOLLOWUP_TITLE"];
    unsigned int v13 = [(MRBaseComponentHandler *)v4 deviceClass];
    BOOL v7 = v13 == 3;
    if (v13 == 3) {
      CFStringRef v8 = @"WIFI_FOLLOWUP_INFO_IPAD";
    }
    else {
      CFStringRef v8 = @"WIFI_FOLLOWUP_INFO";
    }
    CFStringRef v9 = @"WIFI_POPUP_INFO";
    CFStringRef v10 = @"WIFI_POPUP_INFO_IPAD";
  }
  if (v7) {
    CFStringRef v14 = v10;
  }
  else {
    CFStringRef v14 = v9;
  }
  [(MRBaseComponentHandler *)v4 setFollowUpInfoMessage:v8];
  [(MRBaseComponentHandler *)v4 setPopUpNotificationMessage:v14];
  [(MRBaseComponentHandler *)v4 setUnlockCheckActivityRequired:0];
  [(MRBaseComponentHandler *)v4 setDisplayNotification:0];
  [(MRBaseComponentHandler *)v4 setDisplayModalPopup:0];
  [(MRBaseComponentHandler *)v4 setDisplayFollowup:0];
  return v4;
}

+ (id)sharedSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D24;
  block[3] = &unk_1000185F8;
  block[4] = a1;
  if (qword_10001EA48 != -1) {
    dispatch_once(&qword_10001EA48, block);
  }
  v2 = (void *)qword_10001EA40;

  return v2;
}

@end