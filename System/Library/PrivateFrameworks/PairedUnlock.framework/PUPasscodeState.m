@interface PUPasscodeState
+ (BOOL)hasPasscode;
+ (BOOL)hasSEP;
+ (BOOL)isLocked;
+ (BOOL)isModificationAllowed;
+ (BOOL)isUnlockOnly;
+ (BOOL)wristDetectDisabledPreference;
+ (id)setOffWristEnabled:(BOOL)a3 withContext:(id)a4;
+ (id)toProtobuf;
+ (unint64_t)passcodeMinimumLength;
+ (void)_setOffWristPreference:(BOOL)a3;
+ (void)setOffWristEnabledSSE:(BOOL)a3 completion:(id)a4;
+ (void)setWristDetectionDisabled:(BOOL)a3 completion:(id)a4;
- (PUPasscodeState)init;
@end

@implementation PUPasscodeState

- (PUPasscodeState)init
{
  return 0;
}

+ (BOOL)hasPasscode
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isPasscodeSet];

  return v3;
}

+ (BOOL)isLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

+ (BOOL)isUnlockOnly
{
  if (![a1 hasPasscode]) {
    return 0;
  }
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 unlockScreenType] == 2;

  return v3;
}

+ (BOOL)wristDetectDisabledPreference
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"DisableWristDetection", @"com.apple.Carousel", &keyExistsAndHasValidFormat) != 0;
}

+ (id)setOffWristEnabled:(BOOL)a3 withContext:(id)a4
{
  return 0;
}

+ (void)setOffWristEnabledSSE:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[PUError errorWithCode:104 description:@"only supported on watch"];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

+ (void)_setOffWristPreference:(BOOL)a3
{
  BOOL v3 = +[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"DisableWristDetection", v3, @"com.apple.Carousel");

  CFPreferencesAppSynchronize(@"com.apple.Carousel");
  id v6 = objc_alloc_init((Class)NPSManager);
  v4 = +[NSSet setWithObject:@"DisableWristDetection"];
  [v6 synchronizeUserDefaultsDomain:@"com.apple.Carousel" keys:v4];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CSLDisableWristDetectionChangedNotification", 0, 0, 0);
}

+ (void)setWristDetectionDisabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = pu_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = +[NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setting wrist detection disabled to %@", buf, 0xCu);
  }
  if ([a1 isLocked])
  {
    CFStringRef v9 = @"cannot change wrist detect setting if the device is locked";
    uint64_t v10 = 102;
  }
  else
  {
    if (!v4) {
      goto LABEL_14;
    }
    if ([a1 isUnlockOnly])
    {
      CFStringRef v9 = @"cannot disable wrist detection when unlock only";
      uint64_t v10 = 100;
    }
    else
    {
      v11 = +[MCProfileConnection sharedConnection];
      unsigned int v12 = [v11 isSettingLockedDownByRestrictions:MCFeatureWatchWristDetectRequired];

      if (!v12) {
        goto LABEL_14;
      }
      CFStringRef v9 = @"cannot disable wrist detection, required by configuration";
      uint64_t v10 = 101;
    }
  }
  v13 = +[PUError errorWithCode:v10 description:v9];
  if (v13)
  {
    v14 = pu_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100010140(v4, (uint64_t)v13, v14);
    }

    v6[2](v6, v13);
    goto LABEL_19;
  }
LABEL_14:
  if ([a1 hasSEP])
  {
    v15 = pu_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = +[NSNumber numberWithBool:v4];
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "calling SEP to set wrist detection disabled to %@", buf, 0xCu);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100004F18;
    v17[3] = &unk_100018550;
    id v19 = a1;
    BOOL v20 = v4;
    v18 = v6;
    [a1 setOffWristEnabledSSE:v4 completion:v17];
  }
  else
  {
    [a1 _setOffWristPreference:v4];
    v6[2](v6, 0);
  }
LABEL_19:
}

+ (BOOL)hasSEP
{
  return _MGGetBoolAnswer(@"HasSEP", a2);
}

+ (unint64_t)passcodeMinimumLength
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 valueRestrictionForFeature:MCFeatureMinimumPasscodeLength];
  BOOL v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "current minimum passcode length is %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [v3 unsignedIntegerValue];
  return (unint64_t)v5;
}

+ (BOOL)isModificationAllowed
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 isPasscodeModificationAllowed];
  BOOL v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "passcode modification allowed: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  return v3;
}

+ (id)toProtobuf
{
  unsigned int v3 = objc_alloc_init(PUProtoPasscodePolicy);
  -[PUProtoPasscodePolicy setModificationAllowed:](v3, "setModificationAllowed:", [a1 isModificationAllowed]);
  -[PUProtoPasscodePolicy setMinimumLength:](v3, "setMinimumLength:", [a1 passcodeMinimumLength]);
  BOOL v4 = objc_alloc_init(PUProtoPasscodeState);
  -[PUProtoPasscodeState setHasPasscode:](v4, "setHasPasscode:", [a1 hasPasscode]);
  -[PUProtoPasscodeState setIsLocked:](v4, "setIsLocked:", [a1 isLocked]);
  if ([(PUProtoPasscodeState *)v4 hasPasscode]) {
    id v5 = [a1 isUnlockOnly];
  }
  else {
    id v5 = 0;
  }
  [(PUProtoPasscodeState *)v4 setIsUnlockOnly:v5];
  if ([(PUProtoPasscodeState *)v4 hasPasscode]) {
    uint64_t v6 = [a1 isWristDetectionDisabled] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  [(PUProtoPasscodeState *)v4 setIsWristDetectionEnabled:v6];
  [(PUProtoPasscodeState *)v4 setPolicy:v3];

  return v4;
}

@end