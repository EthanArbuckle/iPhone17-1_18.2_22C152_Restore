void sub_2397D1598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2397D4094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PKLocalizedDrawingBundleForLanguage(void *a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x263F086E0];
    v7 = [v4 localizations];
    v15[0] = v3;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v9 = [v6 preferredLocalizationsFromArray:v7 forPreferences:v8];
    v10 = [v9 firstObject];

    if (v10)
    {
      id v11 = v10;

      id v3 = v11;
    }
    v12 = [v5 pathForResource:v3 ofType:@"lproj"];
    if ([v12 length])
    {
      id v13 = [MEMORY[0x263F086E0] bundleWithPath:v12];

      if (v13) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v13 = v5;
LABEL_9:

  return v13;
}

id PKLocalizedStringForLanguageInBundle(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  v9 = PKLocalizedDrawingBundleForLanguage(a2, a3);
  v10 = [v9 localizedStringForKey:v8 value:0 table:v7];

  return v10;
}

void sub_2397D78D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PencilPairingUIBundle()
{
  if (PencilPairingUIBundle_onceToken != -1) {
    dispatch_once(&PencilPairingUIBundle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)PencilPairingUIBundle___PencilPairingUIBundle;
  return v0;
}

void __PencilPairingUIBundle_block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PencilPairingUI"];
  v1 = (void *)PencilPairingUIBundle___PencilPairingUIBundle;
  PencilPairingUIBundle___PencilPairingUIBundle = v0;

  if (!PencilPairingUIBundle___PencilPairingUIBundle)
  {
    v2 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_2397CD000, v2, OS_LOG_TYPE_DEFAULT, "__PencilPairingUIBundle is nil, try loading with a class", (uint8_t *)&v6, 2u);
    }

    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (void *)PencilPairingUIBundle___PencilPairingUIBundle;
    PencilPairingUIBundle___PencilPairingUIBundle = v3;
  }
  v5 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = PencilPairingUIBundle___PencilPairingUIBundle;
    _os_log_impl(&dword_2397CD000, v5, OS_LOG_TYPE_DEFAULT, "__PencilPairingUIBundle: %p", (uint8_t *)&v6, 0xCu);
  }
}

void sub_2397D9830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 160));
  _Unwind_Resume(a1);
}

void sub_2397D9C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void PNPChargingStatusConfigureAutoDismiss(void *a1, void *a2)
{
}

void PNPChargingStatusConfigureAutoDismissWithTime(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  uint64_t v8 = [v6 autoDismissBlock];

  if (!v8) {
    goto LABEL_4;
  }
  v9 = [v6 autoDismissDate];
  uint64_t v10 = [v9 compare:v7];

  if (v10 != -1)
  {
    id v11 = [v6 autoDismissBlock];
    dispatch_block_cancel(v11);

LABEL_4:
    objc_initWeak(&location, v6);
    objc_initWeak(&from, v5);
    [v6 setAutoDismissDate:v7];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke;
    v20 = &unk_264DA5A88;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0, &v17);
    objc_msgSend(v6, "setAutoDismissBlock:", v12, v17, v18, v19, v20);

    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    id v14 = MEMORY[0x263EF83A0];
    v15 = [v6 autoDismissBlock];
    v16 = (void *)MEMORY[0x263EF83A0];
    dispatch_after(v13, MEMORY[0x263EF83A0], v15);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void sub_2397DB8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke_2;
    v5[3] = &unk_264DA56A0;
    id v6 = v3;
    PNPPlatterDismissPlatterContainerView(WeakRetained, 1, v5);
    [WeakRetained setAutoDismissBlock:0];
    [WeakRetained setAutoDismissDate:0];
  }
}

uint64_t __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
}

void sub_2397DC608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2397DCC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PNPSignpostLog()
{
  if (_PNPSignpostLog_onceToken != -1) {
    dispatch_once(&_PNPSignpostLog_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)_PNPSignpostLog____PNPSignpostLog;
  return v0;
}

void sub_2397DE718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2397E37A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2397E45EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2397E4B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFMUIDiscoveredAccessoryClass_block_invoke(uint64_t a1)
{
  FindMyUICoreLibrary();
  Class result = objc_getClass("FMUIDiscoveredAccessory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFMUIDiscoveredAccessoryClass_block_invoke_cold_1();
  }
  getFMUIDiscoveredAccessoryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void FindMyUICoreLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!FindMyUICoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __FindMyUICoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264DA5C28;
    uint64_t v3 = 0;
    FindMyUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!FindMyUICoreLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __FindMyUICoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FindMyUICoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke(uint64_t a1)
{
  FindMyUICoreLibrary();
  Class result = objc_getClass("FMUIAccessoryOnboardingCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke_cold_1();
  }
  getFMUIAccessoryOnboardingCoordinatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double PNPWizardScratchpadOpacitySliderAnimationParameters@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_2397FABB0;
  double result = 1.0;
  *(_OWORD *)(a1 + 24) = xmmword_2397FABC0;
  return result;
}

id getOpaqueTouchValue(void *a1)
{
  v18[2] = *MEMORY[0x263EF8340];
  v1 = a1;
  uint64_t v2 = IOHIDEventSystemClientCreateWithType();
  if (v2)
  {
    uint64_t v3 = (__IOHIDEventSystemClient *)v2;
    v17[0] = @"PrimaryUsagePage";
    v17[1] = @"PrimaryUsage";
    v18[0] = &unk_26ECE7978;
    v18[1] = &unk_26ECE7990;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    IOHIDEventSystemClientSetMatching();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFArrayRef v5 = IOHIDEventSystemClientCopyServices(v3);
    uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v12 + 1) + 8 * v9), v1);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }

        if (v7 == ++v9)
        {
          uint64_t v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v10 = 0;
    }

    CFRelease(v3);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_2397F0BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

float BatteryLevel(float a1)
{
  return BatteryLevelPercentage(a1 * 100.0) / 100.0;
}

float BatteryLevelPercentage(float a1)
{
  if (BatteryLevelPercentage_onceToken != -1) {
    dispatch_once(&BatteryLevelPercentage_onceToken, &__block_literal_global_13);
  }
  if (BatteryLevelPercentage___demoBatteryLevelMode == 3) {
    return *(float *)&BatteryLevelPercentage___demoBatteryLevel;
  }
  if (BatteryLevelPercentage___demoBatteryLevelMode == 2)
  {
    if (*(float *)&BatteryLevelPercentage___demoBatteryLevel <= a1) {
      return *(float *)&BatteryLevelPercentage___demoBatteryLevel;
    }
  }
  else if (BatteryLevelPercentage___demoBatteryLevelMode == 1 {
         && *(float *)&BatteryLevelPercentage___demoBatteryLevel > a1)
  }
  {
    return *(float *)&BatteryLevelPercentage___demoBatteryLevel;
  }
  return a1;
}

void __BatteryLevelPercentage_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BatteryLevelPercentage___demoBatteryLevelMode = [v0 integerForKey:@"internalSettings.pencil.demo.batteryLevelMode"];

  v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v1 floatForKey:@"internalSettings.pencil.demo.batteryLevel"];
  BatteryLevelPercentage___demoBatteryLevel = v2;

  if (*(float *)&BatteryLevelPercentage___demoBatteryLevel == 0.0) {
    BatteryLevelPercentage___demoBatteryLevel = 1117126656;
  }
}

void _PNPPlatterContainerViewMoveToPresented(void *a1, char a2, int a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = ___PNPPlatterContainerViewMoveToPresented_block_invoke;
  v15[3] = &unk_264DA5740;
  id v9 = v7;
  id v16 = v9;
  char v17 = a2;
  uint64_t v10 = (void (**)(void))MEMORY[0x23ECA63E0](v15);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = ___PNPPlatterContainerViewMoveToPresented_block_invoke_2;
  v13[3] = &unk_264DA5800;
  id v11 = v8;
  id v14 = v11;
  long long v12 = (void (**)(void, void))MEMORY[0x23ECA63E0](v13);
  if (a3)
  {
    [MEMORY[0x263F1CB60] _animateUsingDefaultTimingWithOptions:2 animations:v10 completion:v12];
  }
  else
  {
    v10[2](v10);
    v12[2](v12, 1);
  }
}

void PNPPlatterPresentPlatterContainerView(void *a1, int a2, void *a3)
{
}

void PNPPlatterDismissPlatterContainerView(void *a1, int a2, void *a3)
{
}

void __getFMUIDiscoveredAccessoryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke_cold_1(v0);
}

void __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke_cold_1()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BKSHIDServicesGetPersistentServiceProperties()
{
  return MEMORY[0x270F10510]();
}

uint64_t BKSHIDServicesSetPersistentServiceProperties()
{
  return MEMORY[0x270F10568]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x270F10858]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x270EF4310]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x270EF4418](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x270EF4490]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4658](service, key);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x270F55398]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F061E0]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F061F8]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F06208]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F06210]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F06218]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F06248]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  return MEMORY[0x270F90558]();
}

uint64_t _AXSPencilExtendedSqueezeRangeEnabled()
{
  return MEMORY[0x270F90930]();
}

uint64_t _AXSSetAllowOpaqueTouchGestures()
{
  return MEMORY[0x270F909D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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