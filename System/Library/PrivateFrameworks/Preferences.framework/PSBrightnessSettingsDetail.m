@interface PSBrightnessSettingsDetail
+ (BOOL)autoBrightnessEnabled;
+ (BOOL)deviceSupportsAutoBrightness;
+ (double)currentValue;
+ (double)incrementedBrightnessValue:(double)a3;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)beginBrightnessAdjustmentTransaction;
+ (void)beginObservingExternalBrightnessChanges:(id)a3 changedAction:(id)a4;
+ (void)endBrightnessAdjustmentTransaction;
+ (void)endObservingExternalBrightnessChanges;
+ (void)incrementBrightnessValue:(double)a3;
+ (void)setAutoBrightnessEnabled:(BOOL)a3;
+ (void)setValue:(double)a3;
@end

@implementation PSBrightnessSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=DISPLAY"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.display");
}

+ (double)currentValue
{
  PSBKSDisplayBrightnessGetCurrent();
  return v2;
}

+ (double)incrementedBrightnessValue:(double)a3
{
  PSBKSDisplayBrightnessGetCurrent();
  double result = fmax(v4 + a3, 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

+ (void)incrementBrightnessValue:(double)a3
{
  PSBKSDisplayBrightnessGetCurrent();
  double v5 = fmax(v4 + a3, 0.0);
  if (v5 > 1.0) {
    double v5 = 1.0;
  }
  float v6 = v5;
  PSBKSDisplayBrightnessSet(v6);
}

+ (void)setValue:(double)a3
{
  if (__transactionRef)
  {
    float v3 = a3;
    PSBKSDisplayBrightnessSet(v3);
  }
  else
  {
    NSLog(&cfstr_DSWarningThere.isa, a2, a3, 683, "+[PSBrightnessSettingsDetail setValue:]");
  }
}

+ (void)beginBrightnessAdjustmentTransaction
{
  if (!__transactionRef)
  {
    uint64_t v5 = 0;
    float v6 = &v5;
    uint64_t v7 = 0x2020000000;
    float v2 = (uint64_t (*)(void))getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    v8 = getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    if (!getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr)
    {
      float v3 = (void *)BackBoardServicesLibrary();
      v6[3] = (uint64_t)dlsym(v3, "BKSDisplayBrightnessTransactionCreate");
      getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr = (_UNKNOWN *)v6[3];
      float v2 = (uint64_t (*)(void))v6[3];
    }
    _Block_object_dispose(&v5, 8);
    if (!v2)
    {
      float v4 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
      _Block_object_dispose(&v5, 8);
      _Unwind_Resume(v4);
    }
    __transactionRef = v2(*MEMORY[0x1E4F1CF80]);
  }
}

+ (void)endBrightnessAdjustmentTransaction
{
  if (__transactionRef)
  {
    CFRelease((CFTypeRef)__transactionRef);
    __transactionRef = 0;
  }
}

+ (void)beginObservingExternalBrightnessChanges:(id)a3 changedAction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  observer = +[PSBrightnessController sharedController];
  [observer setIsTracking:v6];

  [observer setBrightnessChangedExternally:v5];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, observer, (CFNotificationCallback)_BrightnessChangedExternally, (CFStringRef)*MEMORY[0x1E4F43CB0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (void)endObservingExternalBrightnessChanges
{
  observer = +[PSBrightnessController sharedController];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observer, (CFNotificationName)*MEMORY[0x1E4F43CB0], 0);
  [observer setIsTracking:0];
  [observer setBrightnessChangedExternally:0];
}

+ (BOOL)deviceSupportsAutoBrightness
{
  return MGGetBoolAnswer();
}

+ (void)setAutoBrightnessEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"BKEnableALS", (CFPropertyListRef)[MEMORY[0x1E4F28ED0] numberWithBool:0], @"com.apple.backboardd");
  CFPreferencesAppSynchronize(@"com.apple.backboardd");
}

+ (BOOL)autoBrightnessEnabled
{
  return CFPreferencesGetAppBooleanValue(@"BKEnableALS", @"com.apple.backboardd", 0) != 0;
}

@end