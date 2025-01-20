void sub_2218CE63C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromLockSource(int a1)
{
  if ((a1 - 1) > 0x19) {
    return @"None";
  }
  else {
    return off_2645D38D0[a1 - 1];
  }
}

unint64_t SBUIUnlockSourceIsUserAction(unsigned int a1)
{
  return (a1 > 0x29) | (0x1A61A0280A2uLL >> a1) & 1;
}

__CFString *NSStringFromUnlockSource(int a1)
{
  if ((a1 - 1) > 0x28) {
    return @"None";
  }
  else {
    return off_2645D39A0[a1 - 1];
  }
}

__CFString *NSStringFromUnlockIntent(int a1)
{
  if ((a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_2645D3AE8[a1 - 1];
  }
}

uint64_t SBUIConvertLockSourceToBacklightChangeSource(int a1)
{
  if ((a1 - 1) > 0x19) {
    return 0;
  }
  else {
    return qword_2218E4480[a1 - 1];
  }
}

uint64_t SBUIConvertUnlockSourceToBacklightChangeSource(int a1)
{
  if ((a1 - 1) > 0x28) {
    return 0;
  }
  else {
    return qword_2218E4550[a1 - 1];
  }
}

__CFString *NSStringFromSBUIBackgroundStyle(unint64_t a1)
{
  if (a1 > 9) {
    return 0;
  }
  else {
    return off_2645D3B20[a1];
  }
}

id SBUIGetBackdropSettingsForBackgroundStyle(uint64_t a1)
{
  if (SBUIGetBackdropSettingsForBackgroundStyle___once != -1) {
    dispatch_once(&SBUIGetBackdropSettingsForBackgroundStyle___once, &__block_literal_global);
  }
  int IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (SBUIGetBackdropSettingsForBackgroundStyle_wasReducedTransparencyEnabledLastTime != IsReduceTransparencyEnabled)
  {
    char v3 = IsReduceTransparencyEnabled;
    [(id)SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings removeAllObjects];
    SBUIGetBackdropSettingsForBackgroundStyle_wasReducedTransparencyEnabledLastTime = v3;
  }
  v4 = [NSNumber numberWithInteger:a1];
  v5 = [(id)SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings objectForKeyedSubscript:v4];
  if (!v5)
  {
    switch(a1)
    {
      case 3:
        v5 = [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2030];
        [v5 setGrayscaleTintAlpha:0.0];
        [v5 setGrayscaleTintLevel:0.0];
        [v5 setColorTintAlpha:0.0];
        goto LABEL_13;
      case 4:
      case 5:
        v6 = (void *)MEMORY[0x263F1CBF0];
        uint64_t v7 = 2020;
        goto LABEL_12;
      case 6:
        v6 = (void *)MEMORY[0x263F1CBF0];
        uint64_t v7 = 2030;
        goto LABEL_12;
      case 7:
        v6 = (void *)MEMORY[0x263F1CBF0];
        uint64_t v7 = 2050;
        goto LABEL_12;
      case 8:
        v5 = [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2030];
        [v5 setGrayscaleTintAlpha:0.15];
        [v5 setGrayscaleTintLevel:0.0];
        [v5 setColorTintAlpha:0.0];
        [v5 setSaturationDeltaFactor:1.0];
        goto LABEL_13;
      case 9:
        v5 = [MEMORY[0x263F1CBF0] settingsForPrivateStyle:2030];
        [v5 setGrayscaleTintAlpha:0.0];
        [v5 setGrayscaleTintLevel:0.0];
        [v5 setColorTintAlpha:0.0];
        [v5 setSaturationDeltaFactor:1.9];
        [v5 setBlurRadius:30.0];
        goto LABEL_13;
      default:
        v6 = (void *)MEMORY[0x263F1CBF0];
        uint64_t v7 = -2;
LABEL_12:
        v5 = [v6 settingsForPrivateStyle:v7];
LABEL_13:
        if (v5) {
          [(id)SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings setObject:v5 forKeyedSubscript:v4];
        }
        break;
    }
  }

  return v5;
}

uint64_t __SBUIGetBackdropSettingsForBackgroundStyle_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings;
  SBUIGetBackdropSettingsForBackgroundStyle__mapFromBackgroundStyleToBackdropSettings = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

BOOL SBUIHasBlurForBackgroundStyle(uint64_t a1)
{
  return a1 > 2;
}

__CFString *NSStringFromSBSceneViewDisplayMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"None";
  }
  else {
    return off_2645D3CF0[a1 - 1];
  }
}

void sub_2218D2CA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id SpringBoardUIBundle()
{
  id v0 = (void *)SpringBoardUIBundle___SpringBoardUIBundle;
  if (!SpringBoardUIBundle___SpringBoardUIBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v2 = (void *)SpringBoardUIBundle___SpringBoardUIBundle;
    SpringBoardUIBundle___SpringBoardUIBundle = v1;

    id v0 = (void *)SpringBoardUIBundle___SpringBoardUIBundle;
  }

  return v0;
}

__CFString *NSStringFromSBAlertItemPresentationState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_2645D3D48[a1 - 1];
  }
}

__CFString *SBStringFromAlertItemDeactivateReason(int a1)
{
  if ((a1 - 1) > 5) {
    return @"Lock";
  }
  else {
    return off_2645D3D18[a1 - 1];
  }
}

BOOL SBAlertItemIsUserDeactivate(int a1)
{
  return (a1 & 0xFFFFFFFE) == 2;
}

__CFString *NSStringFromLockScreenElement(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2645D3E30[a1];
  }
}

uint64_t SBLockScreenCapabilityAllExcept(uint64_t a1)
{
  return ~a1;
}

id NSStringFromLockScreenCapabilities(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __NSStringFromLockScreenCapabilities_block_invoke;
  v13 = &unk_2645D3E10;
  id v3 = v2;
  id v14 = v3;
  v4 = &v10;
  if (a1)
  {
    char v15 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(uint64_t *))v12)(v4);
          if (v15) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  v8 = [v3 componentsJoinedByString:@", ", v10, v11];

  return v8;
}

void *__NSStringFromLockScreenCapabilities_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a2 <= 15)
  {
    switch(a2)
    {
      case -1:
        uint64_t v2 = @"All";
        break;
      case 0:
        uint64_t v2 = @"None";
        break;
      case 2:
        uint64_t v2 = @"Siri";
        break;
      case 4:
        uint64_t v2 = @"Camera";
        break;
      case 8:
        uint64_t v2 = @"Unlock";
        break;
      default:
        break;
    }
  }
  else
  {
    id v3 = @"TodayCenter";
    v4 = @"ControlCenter";
    uint8x8_t v5 = @"Screenshot";
    if (a2 != 512) {
      uint8x8_t v5 = 0;
    }
    if (a2 != 256) {
      v4 = v5;
    }
    if (a2 != 128) {
      id v3 = v4;
    }
    int v6 = @"Logout";
    unint64_t v7 = @"TouchID";
    v8 = @"MediaControls";
    if (a2 != 64) {
      v8 = 0;
    }
    if (a2 != 32) {
      unint64_t v7 = v8;
    }
    if (a2 != 16) {
      int v6 = v7;
    }
    if (a2 <= 127) {
      uint64_t v2 = v6;
    }
    else {
      uint64_t v2 = v3;
    }
  }
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result addObject:v2];
  }
  return result;
}

__CFString *NSStringFromLockScreenEvent(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_2645D3E50[a1];
  }
}

__CFString *NSStringFromLockScreenPluginBackgroundStyle(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2645D3E98[a1];
  }
}

__CFString *NSStringFromLockScreenPluginPresentationStyle(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_2645D3EB8[a1];
  }
}

__CFString *NSStringFromLockScreenPluginNotificationBehavior(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2645D3EE0[a1];
  }
}

uint64_t SBUIHasHIDRingerButton()
{
  return MEMORY[0x270F95FB8](@"RingerButtonCapability");
}

uint64_t SBUIHasHIDRingerSwitch()
{
  return MEMORY[0x270F95FB8](@"ringer-switch");
}

void sub_2218D794C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2218D9668(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2218DA53C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2218DA940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _NewChevronPiece()
{
  id v0 = objc_alloc(MEMORY[0x263F1CB60]);
  BSRectWithSize();
  uint64_t v1 = objc_msgSend(v0, "initWithFrame:");
  uint64_t v2 = [v1 layer];
  [v2 setCornerRadius:2.25];

  uint64_t v3 = [v1 layer];
  [v3 setAllowsEdgeAntialiasing:1];

  return v1;
}

__CFString *SBUIFrameworkBundleID()
{
  return @"com.apple.SpringBoardUIFramework";
}

void SBUIPrewarmKeyboard()
{
  if (SBUIPrewarmKeyboard_onceToken != -1) {
    dispatch_once(&SBUIPrewarmKeyboard_onceToken, &__block_literal_global_4);
  }
}

uint64_t __SBUIPrewarmKeyboard_block_invoke()
{
  id v0 = (id)[MEMORY[0x263F1C738] sharedInstance];
  uint64_t v1 = UIKeyboardOrderInAutomaticSkippingAnimation();

  return MEMORY[0x270F06190](v1);
}

id SBUIGetUserAgent()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v1 = [v0 pluginUserAgent];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

__CFString *SBUIPluginStringForActivationEvent(int a1)
{
  if ((a1 - 1) > 0xB) {
    return @"Unknown";
  }
  else {
    return off_2645D4368[a1 - 1];
  }
}

void sub_2218DF568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBLogUIRemoteVC()
{
  if (SBLogUIRemoteVC_onceToken != -1) {
    dispatch_once(&SBLogUIRemoteVC_onceToken, &__block_literal_global_5);
  }
  id v0 = (void *)SBLogUIRemoteVC___logObj;

  return v0;
}

uint64_t __SBLogUIRemoteVC_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F79498], "UIRemoteVC");
  uint64_t v1 = SBLogUIRemoteVC___logObj;
  SBLogUIRemoteVC___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id SBLogLegibility()
{
  if (SBLogLegibility_onceToken != -1) {
    dispatch_once(&SBLogLegibility_onceToken, &__block_literal_global_3);
  }
  os_log_t v0 = (void *)SBLogLegibility___logObj;

  return v0;
}

uint64_t __SBLogLegibility_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F79498], "Legibility");
  uint64_t v1 = SBLogLegibility___logObj;
  SBLogLegibility___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id SBLogContinuitySessionService()
{
  if (SBLogContinuitySessionService_onceToken != -1) {
    dispatch_once(&SBLogContinuitySessionService_onceToken, &__block_literal_global_6);
  }
  os_log_t v0 = (void *)SBLogContinuitySessionService___logObj;

  return v0;
}

uint64_t __SBLogContinuitySessionService_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F79498], "ContinuitySessionService");
  uint64_t v1 = SBLogContinuitySessionService___logObj;
  SBLogContinuitySessionService___logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x270F10840]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x270F10858]();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return MEMORY[0x270F10898]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return MEMORY[0x270F108E8]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x270F18C48]();
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t FBSProcessPrettyDescription()
{
  return MEMORY[0x270F2D218]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x270EF2BA8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x270F77088]();
}

uint64_t SBLogCFUserNotifications()
{
  return MEMORY[0x270F770F8]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x270F77100]();
}

uint64_t SBLogNotifications()
{
  return MEMORY[0x270F77108]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

uint64_t UIKeyboardOrderInAutomaticSkippingAnimation()
{
  return MEMORY[0x270F06188]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}