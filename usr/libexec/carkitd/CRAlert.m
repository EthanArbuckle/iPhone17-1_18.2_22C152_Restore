@interface CRAlert
- (BOOL)_isDeviceUnlocked;
- (BOOL)alertAutoDismissed;
- (BOOL)allowInCar;
- (BOOL)dismissAlert;
- (BOOL)dismissOnUnlock;
- (BOOL)presentAlertWithCompletion:(id)a3;
- (BOOL)requiresUnlockedDevice;
- (NSTimer)alertDismissTimer;
- (double)alertDismissal;
- (id)_alertContents;
- (id)alertAcceptButtonTitle;
- (id)alertDeclineButtonTitle;
- (id)alertMessage;
- (id)alertOtherButtonTitle;
- (id)alertTitle;
- (id)iconImagePath;
- (id)lockscreenMessage;
- (id)lockscreenTitle;
- (void)_setAlert:(__CFUserNotification *)a3;
- (void)setAlertAutoDismissed:(BOOL)a3;
- (void)setAlertDismissTimer:(id)a3;
@end

@implementation CRAlert

- (void)_setAlert:(__CFUserNotification *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  alert = self->_alert;
  if (alert) {
    CFRelease(alert);
  }
  self->_alert = a3;
}

- (BOOL)allowInCar
{
  return 0;
}

- (double)alertDismissal
{
  return 0.0;
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

- (id)lockscreenTitle
{
  return (id)CRLocalizedStringForKey();
}

- (id)lockscreenMessage
{
  return 0;
}

- (BOOL)dismissOnUnlock
{
  return 0;
}

- (id)alertTitle
{
  return 0;
}

- (id)alertMessage
{
  return 0;
}

- (id)alertAcceptButtonTitle
{
  return 0;
}

- (id)alertDeclineButtonTitle
{
  return 0;
}

- (id)alertOtherButtonTitle
{
  return 0;
}

- (id)iconImagePath
{
  v2 = CRFrameworkBundle();
  v3 = [v2 bundlePath];

  v4 = [v3 stringByAppendingPathComponent:@"CarPlayNotificationIcon.png"];

  return v4;
}

- (BOOL)_isDeviceUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (id)_alertContents
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  v4 = +[NSNumber numberWithInt:[(CRAlert *)self dismissOnUnlock] ^ 1];
  [v3 setObject:v4 forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];

  v5 = +[NSNumber numberWithBool:[(CRAlert *)self allowInCar]];
  [v3 setObject:v5 forKeyedSubscript:SBUserNotificationAllowInCarKey];

  v6 = [(CRAlert *)self alertTitle];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  }
  v7 = [(CRAlert *)self alertMessage];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  }
  v8 = [(CRAlert *)self alertAcceptButtonTitle];
  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  v9 = [(CRAlert *)self alertDeclineButtonTitle];
  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  }
  v10 = [(CRAlert *)self alertOtherButtonTitle];
  if (v10) {
    [v3 setObject:v10 forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
  }
  v11 = [(CRAlert *)self lockscreenMessage];
  BOOL v12 = v11 != 0;
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:SBUserNotificationLockScreenAlertMessageKey];
  }
  v13 = [(CRAlert *)self lockscreenTitle];
  if (v13)
  {
    [v3 setObject:v13 forKeyedSubscript:SBUserNotificationLockScreenAlertHeaderKey];
    BOOL v12 = 1;
  }
  v14 = [(CRAlert *)self iconImagePath];
  if (v14)
  {
    [v3 setObject:v14 forKeyedSubscript:SBUserNotificationIconImagePath];
  }
  else if (!v12)
  {
    goto LABEL_19;
  }
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
LABEL_19:

  return v3;
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  id v4 = a3;
  SInt32 error = 0;
  [(CRAlert *)self setAlertAutoDismissed:0];
  CFDictionaryRef v5 = [(CRAlert *)self _alertContents];
  if (v5 && (CFUserNotificationRef v6 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v5)) != 0)
  {
    CFUserNotificationRef v7 = v6;
    [(CRAlert *)self _setAlert:v6];
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004B74;
    block[3] = &unk_1000BD160;
    CFUserNotificationRef v16 = v7;
    block[4] = self;
    id v15 = v4;
    dispatch_async(v8, block);

    [(CRAlert *)self alertDismissal];
    if (v9 > 0.0)
    {
      [(CRAlert *)self alertDismissal];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100004D44;
      v13[3] = &unk_1000BD188;
      v13[4] = self;
      v10 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13);
      [(CRAlert *)self setAlertDismissTimer:v10];
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)dismissAlert
{
  alert = self->_alert;
  if (alert) {
    LOBYTE(alert) = CFUserNotificationCancel(alert) == 0;
  }
  return (char)alert;
}

- (NSTimer)alertDismissTimer
{
  return self->_alertDismissTimer;
}

- (void)setAlertDismissTimer:(id)a3
{
}

- (BOOL)alertAutoDismissed
{
  return self->_alertAutoDismissed;
}

- (void)setAlertAutoDismissed:(BOOL)a3
{
  self->_alertAutoDismissed = a3;
}

- (void).cxx_destruct
{
}

@end