@interface DAPlatform_Embedded
+ (id)sharedInstance;
- (BOOL)didSetProxyServerInformation;
- (BOOL)isCheckerBoardActive;
- (BOOL)isInBoxUpdateModeActive;
- (void)_activateCFUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7;
- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7;
@end

@implementation DAPlatform_Embedded

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)isCheckerBoardActive
{
  return 0;
}

- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
}

- (BOOL)didSetProxyServerInformation
{
  return 0;
}

- (BOOL)isInBoxUpdateModeActive
{
  return 0;
}

- (void)_activateCFUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
  v12 = (void (**)(void))a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  [v17 setObject:v16 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  [v17 setObject:v15 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  [v17 setObject:v13 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  [v17 setObject:v14 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [(DAPlatform_Embedded *)self _addPlatformCFUserNotificationOptions:v17];
  v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v17);
  if (v18)
  {
    v19 = v18;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v18, 0.0, &responseFlags);
    CFRelease(v19);
    if (v12 && responseFlags == 1) {
      v12[2](v12);
    }
  }
  else
  {
    v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000D45C(v20);
    }
  }
}

@end