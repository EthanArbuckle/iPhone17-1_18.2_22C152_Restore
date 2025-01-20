void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

double SBRectWithSize()
{
  return *MEMORY[0x1E4F1DAD8];
}

double SBUnintegralizedRectCenteredAboutPoint(double a1, double a2, double a3, double a4, double a5)
{
  return a5 - a3 * 0.5;
}

id SBLogLegibility()
{
  if (SBLogLegibility_onceToken != -1) {
    dispatch_once(&SBLogLegibility_onceToken, &__block_literal_global_3_2);
  }
  v0 = (void *)SBLogLegibility___logObj;
  return v0;
}

uint64_t SBUILegibilityShadowCompositingFilterForCAFilterName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqual:*MEMORY[0x1E4F3A078]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqual:*MEMORY[0x1E4F3A228]])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

double SBUILegibilityImageSizeForContentSizeAndSettings(void *a1, double a2)
{
  id v3 = a1;
  [v3 imageOutset];
  double v5 = a2 + v4;
  [v3 imageOutset];

  return v5;
}

uint64_t SBUILegibilitySettingsAreEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  if (v3 == v4)
  {
    uint64_t v8 = 1;
    goto LABEL_18;
  }
  if (!v3 && v4) {
    goto LABEL_17;
  }
  if (v3 && !v4) {
    goto LABEL_17;
  }
  uint64_t v6 = [v3 style];
  if (v6 != [v5 style]) {
    goto LABEL_17;
  }
  [v3 minFillHeight];
  [v5 minFillHeight];
  if (BSCompareFloats()) {
    goto LABEL_17;
  }
  long long v7 = 0uLL;
  if (v3)
  {
    [v3 shadowSettings];
    long long v7 = 0uLL;
  }
  long long v20 = v7;
  long long v21 = v7;
  if (v5) {
    objc_msgSend(v5, "shadowSettings", v7, v7, (unsigned __int128)0, (unsigned __int128)0);
  }
  if (BSCompareFloats() || BSCompareFloats() || BSCompareFloats() || BSCompareIntegers()) {
    goto LABEL_17;
  }
  uint64_t v10 = [v3 primaryColor];
  uint64_t v11 = [v5 primaryColor];
  v12 = (void *)v11;
  if (v10 == v11 || !(v10 | v11))
  {
  }
  else
  {
    int v13 = [(id)v10 _isSimilarToColor:v11 withinPercentage:0.01];

    if (!v13) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = objc_msgSend(v3, "secondaryColor", v20, v21);
  uint64_t v15 = [v5 secondaryColor];
  v16 = (void *)v15;
  if (v14 == v15 || !(v14 | v15))
  {

    goto LABEL_29;
  }
  int v17 = [(id)v14 _isSimilarToColor:v15 withinPercentage:0.01];

  if (!v17)
  {
LABEL_17:
    uint64_t v8 = 0;
    goto LABEL_18;
  }
LABEL_29:
  uint64_t v18 = [v3 shadowColor];
  uint64_t v19 = [v5 shadowColor];
  uint64_t v8 = 1;
  if (v18 != v19 && v18 | v19) {
    uint64_t v8 = [(id)v18 _isSimilarToColor:v19 withinPercentage:0.01];
  }

LABEL_18:
  return v8;
}

void sub_1A760BA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A760CB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v48 - 248), 8);
  _Block_object_dispose((const void *)(v48 - 200), 8);
  _Block_object_dispose((const void *)(v48 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A760CF04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

double SBLayoutDefaultSideLayoutElementWidth(uint64_t a1)
{
  int v5 = __sb__runningInSpringBoard();
  char v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v1 userInterfaceIdiom] != 1 || SBFEffectiveHomeButtonType() != 2)
    {

      goto LABEL_10;
    }
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  uint64_t v10 = MEMORY[0x1E4FA6E50];
  double v11 = *(double *)(MEMORY[0x1E4FA6E50] + 328);
  BOOL v13 = v12 >= v11;
  if (v12 >= v11)
  {
    int v14 = __sb__runningInSpringBoard();
    char v15 = v14;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_25;
      }
    }
    else
    {
      id v3 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v3 userInterfaceIdiom] != 1)
      {
        BOOL v13 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      long long v20 = [MEMORY[0x1E4F42D90] mainScreen];
      [v20 _referenceBounds];
    }
    BSSizeRoundForScale();
    BOOL v13 = v18 < *(double *)(v10 + 264);
    if ((v17 & 1) == 0) {

    }
    if ((v15 & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_25:
  if ((v8 & 1) == 0) {

  }
  if (v6)
  {
    if (v13) {
      goto LABEL_31;
    }
LABEL_10:
    *(void *)&double result = SBPhoneOnPadFallbackLaunchSize().n128_u64[0];
    return result;
  }

  if (!v13) {
    goto LABEL_10;
  }
LABEL_31:
  if ((unint64_t)(a1 - 1) >= 2) {
    uint64_t v19 = v10 + 32;
  }
  else {
    uint64_t v19 = v10;
  }
  return *(double *)v19;
}

__n128 SBPhoneOnPadFallbackLaunchSize()
{
  int v2 = __sb__runningInSpringBoard();
  char v3 = v2;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return *(__n128 *)MEMORY[0x1E4FA6E50];
    }
LABEL_5:
    int v5 = __sb__runningInSpringBoard();
    char v6 = v5;
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v1 = [MEMORY[0x1E4F42D90] mainScreen];
      [v1 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v7 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      __n128 result = *(__n128 *)(MEMORY[0x1E4FA6E50] + 32);
      if (v6) {
        goto LABEL_14;
      }
    }
    else
    {
      __n128 result = *(__n128 *)MEMORY[0x1E4FA6E50];
      if (v6)
      {
LABEL_14:
        if (v3) {
          return result;
        }
        goto LABEL_15;
      }
    }
    __n128 v8 = result;

    __n128 result = v8;
    goto LABEL_14;
  }
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v0 userInterfaceIdiom] == 1) {
    goto LABEL_5;
  }
  __n128 result = *(__n128 *)MEMORY[0x1E4FA6E50];
LABEL_15:
  __n128 v9 = result;

  return v9;
}

BOOL SBFloatGreaterThanFloat(double a1, double a2)
{
  return a1 - a2 > 0.00000011920929;
}

void SBTransformedRectWithScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10 = a1 + CGRectGetWidth(*(CGRect *)&a1) * 0.5;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGFloat v11 = a2 + CGRectGetHeight(v19) * 0.5;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -v10, -v11);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&v17, v10, v11);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, a5, a5);
  CGAffineTransform t1 = v18;
  memset(&v15, 0, sizeof(v15));
  CGAffineTransform t2 = v16;
  CGAffineTransformConcat(&v15, &t1, &t2);
  CGAffineTransform t2 = v15;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransform v12 = v17;
  CGAffineTransformConcat(&t1, &t2, &v12);
  CGAffineTransform t2 = t1;
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectApplyAffineTransform(v20, &t2);
}

void sub_1A760E458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1A760E768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:@"com.apple.springboard"];

  if (v2)
  {
    uint64_t v3 = 1;
    uint64_t v4 = SBFEffectiveArtworkSubtype();
    if (v4 > 2795)
    {
      if (v4 == 2796 || v4 == 2868) {
        return v3;
      }
    }
    else if (v4 == 2556 || v4 == 2622)
    {
      return v3;
    }
    return 0;
  }
  return SBSIsSystemApertureAvailable();
}

void SBSAcquireWallpaperAnimationSuspensionAssertion(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v5 isUsable]
    && (memset(v8, 0, 512), [v3 getCString:v8 maxLength:1024 encoding:4])
    && (uint64_t v6 = SBSSpringBoardServerPort(), !MEMORY[0x1AD0CE7C0](v6, v8, [v5 port])))
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6A10]) initWithAssertionName:@"SBSUIWallpaperAnimationSuspensionAssertionName" reason:v3 receiveRight:v5];
  }
  else
  {
    double v7 = 0;
  }
  v4[2](v4, v7);
}

void sub_1A7610590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKGlyphViewClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PassKitUIFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5CCC5F0;
    uint64_t v5 = 0;
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PassKitUIFoundationLibraryCore_frameworkLibrary) {
    __getPKGlyphViewClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PKGlyphView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPKGlyphViewClass_block_invoke_cold_2();
  }
  getPKGlyphViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitUIFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUIFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A76129DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBGetPowerDownViewMetrics(uint64_t a1, int a2)
{
  if (!a1)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    int v2 = objc_msgSend(NSString, "stringWithUTF8String:", "void SBGetPowerDownViewMetrics(SBUIPowerDownViewMetrics *, BOOL)");
    [v21 handleFailureInFunction:v2, @"SBUIPowerDownView.m", 46, @"Invalid parameter not satisfying: %@", @"metrics" file lineNumber description];
  }
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      BOOL v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    int v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {
      BOOL v8 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v8 = v11 >= *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v10 & 1) == 0) {

  }
  if ((v7 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  if (__sb__runningInSpringBoard())
  {
    int v12 = SBFEffectiveDeviceClass();
    *(void *)(a1 + 24) = 0x402A000000000000;
    *(void *)(a1 + 40) = 0x402A000000000000;
    if (v12 != 2) {
      goto LABEL_17;
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    *(void *)(a1 + 24) = 0x402A000000000000;
    *(void *)(a1 + 40) = 0x402A000000000000;
    if (v15 != 1)
    {
LABEL_17:
      if (SBFEffectiveHomeButtonType() == 2) {
        double v13 = 64.0;
      }
      else {
        double v13 = 28.0;
      }
      goto LABEL_34;
    }
  }
  double v16 = 70.0;
  if (a2) {
    double v16 = 62.0;
  }
  if (v8) {
    double v13 = v16;
  }
  else {
    double v13 = 40.0;
  }
  if (!__sb__runningInSpringBoard())
  {
    CGAffineTransform v17 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v17 userInterfaceIdiom] != 1)
    {

      goto LABEL_34;
    }
    uint64_t v18 = SBFEffectiveHomeButtonType();

    if (v18 != 2) {
      goto LABEL_34;
    }
LABEL_32:
    double v13 = v13 + -4.0;
    goto LABEL_34;
  }
  if (SBFEffectiveDeviceClass() == 2 && SBFEffectiveHomeButtonType() == 2) {
    goto LABEL_32;
  }
LABEL_34:
  *(double *)a1 = v13;
  *(void *)(a1 + 8) = 0x4052000000000000;
  double v19 = 120.0;
  if (v8) {
    double v19 = 54.0;
  }
  double v20 = 100.0;
  if (v8) {
    double v20 = 34.0;
  }
  *(double *)(a1 + 16) = v19;
  *(double *)(a1 + 32) = v20;
}

void sub_1A76154D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A7615694(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

objc_class *_SBUIEffectiveBiometricClassFromString(void *a1)
{
  uint64_t v1 = a1;
  if (![(NSString *)v1 hasPrefix:@"BK"] || !_os_feature_enabled_impl())
  {
LABEL_7:
    Class v3 = NSClassFromString(v1);
    goto LABEL_8;
  }
  uint64_t v2 = [@"_LA" stringByAppendingString:v1];
  Class v3 = NSClassFromString(v2);

  if (!v3)
  {
    long long v4 = SBLogBiometricResource();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      _SBUIEffectiveBiometricClassFromString_cold_1((uint64_t)v1, v4);
    }

    goto LABEL_7;
  }
LABEL_8:
  uint64_t v5 = v3;

  return v5;
}

uint64_t NSStringFromBiometricKitStatus(unsigned int a1)
{
  if (a1 > 0x64) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_1E5CCC8B8 + (int)a1);
  }
}

void sub_1A7616A90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void *____loadBiometricKitIfNecessary_block_invoke()
{
  __loadBiometricKitIfNecessary_biometricKit = (uint64_t)dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 1);
  if (_os_feature_enabled_impl())
  {
    v0 = SBLogBiometricResource();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      ____loadBiometricKitIfNecessary_block_invoke_cold_1(v0);
    }

    uint64_t result = dlopen("/System/Library/Frameworks/LocalAuthentication.framework/LocalAuthentication", 1);
  }
  else
  {
    uint64_t result = (void *)__loadBiometricKitIfNecessary_biometricKit;
  }
  __loadBiometricKitIfNecessary_localAuthentication = (uint64_t)result;
  return result;
}

BOOL SBUIPasscodeScreenShouldNotWrapSubtitle(uint64_t a1)
{
  if (!__sb__runningInSpringBoard())
  {
    long long v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom] != 1)
    {
      BOOL IsEqualToCategory = 0;
      goto LABEL_9;
    }

    if ((unint64_t)(a1 - 3) > 1) {
      return 0;
    }
LABEL_7:
    long long v4 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v5 = [v4 preferredContentSizeCategory];
    BOOL IsEqualToCategory = UIContentSizeCategoryIsEqualToCategory(v5, (NSString *)*MEMORY[0x1E4F43760]);

LABEL_9:
    return IsEqualToCategory;
  }
  int v2 = SBFEffectiveDeviceClass();
  BOOL IsEqualToCategory = 0;
  if ((unint64_t)(a1 - 3) <= 1 && v2 == 2) {
    goto LABEL_7;
  }
  return IsEqualToCategory;
}

id _SBUIAXAwareLocalizedStringForKey(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (SBUIPasscodeScreenShouldNotWrapSubtitle(a2))
  {
    uint64_t v4 = [v3 stringByAppendingString:@"_LARGE"];

    id v3 = (id)v4;
  }
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v6 = [v5 localizedStringForKey:v3 value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

  return v6;
}

id _SBUIPasscodeLocalizeStringForMesaOrPearlKey(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([a3 hasPearlSupport]) {
    int v9 = v8;
  }
  else {
    int v9 = v7;
  }
  char v10 = _SBUIAXAwareLocalizedStringForKey(v9, a4);

  return v10;
}

__CFString *NSStringFromSBUIPasscodeLockViewState(uint64_t a1)
{
  if (a1 == 1) {
    return @"SBUIPasscodeLockViewStatePasscode";
  }
  else {
    return @"SBUIPasscodeLockViewStateBiometric";
  }
}

uint64_t SBUIPasscodeLockViewTransitionContextMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  return result;
}

void sub_1A761E6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A7620180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7620400(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SBUISystemApertureMaximumContentSizeCategory()
{
  return (id)*MEMORY[0x1E4F43790];
}

id SBUISystemApertureDefaultContentSizeCategory()
{
  return (id)*MEMORY[0x1E4F437B0];
}

double SBUISystemApertureHorizontalItemSpacing()
{
  return 20.0;
}

double SBUISystemApertureVerticalItemSpacing()
{
  return 23.0;
}

double SBUISystemApertureInterItemSpacing()
{
  return 11.0;
}

double SBUISystemApertureControlEdgeSpacing()
{
  return 19.0;
}

double SBUISystemApertureMinimumMicroNoticeHorizontalPaddingFromWindow()
{
  v0 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v0 maximumExpandedSize];
  uint64_t v1 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v1 maximumMicroNoticeSize];
  UICeilToScale();
  double v3 = v2;

  return v3;
}

double SBUISystemApertureMaximumMicroNoticeSize()
{
  v0 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v0 maximumMicroNoticeSize];
  double v2 = v1;

  return v2;
}

id _SBUIColorInterpolatedColor(void *a1, void *a2)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  id v3 = a2;
  [a1 getRed:&v23 green:&v22 blue:&v21 alpha:&v20];
  [v3 getRed:&v19 green:&v18 blue:&v17 alpha:&v16];

  if (a1)
  {
    uint64_t v4 = v23;
    if (v3)
    {
LABEL_3:
      uint64_t v5 = v16;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = v19;
    uint64_t v22 = v18;
    uint64_t v23 = v19;
    uint64_t v21 = v17;
    uint64_t v20 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = v22;
  uint64_t v19 = v4;
  uint64_t v17 = v21;
  uint64_t v16 = 0;
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = v20;
  BSIntervalValueForFraction();
  double v8 = v7;
  BSIntervalValueForFraction();
  double v10 = v9;
  BSIntervalValueForFraction();
  double v12 = v11;
  BSIntervalValueForFraction();
  int v14 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", v8, v10, v12, v13, v6, 1, v5, 1);
  return v14;
}

id _SBUIInterpolatedLegibilitySettings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4)
    {
      uint64_t v6 = [v4 style];
      double v7 = [v3 primaryColor];
      double v8 = [v5 primaryColor];
      double v9 = _SBUIColorInterpolatedColor(v7, v8);

      double v10 = [v3 secondaryColor];
      double v11 = [v5 secondaryColor];
      double v12 = _SBUIColorInterpolatedColor(v10, v11);

      double v13 = [v3 shadowColor];
      int v14 = [v5 shadowColor];
      uint64_t v15 = _SBUIColorInterpolatedColor(v13, v14);

      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:v6 primaryColor:v9 secondaryColor:v12 shadowColor:v15];
      goto LABEL_7;
    }
    id v17 = v3;
  }
  else
  {
    id v17 = v4;
  }
  uint64_t v16 = v17;
LABEL_7:

  return v16;
}

void sub_1A76261E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMUIAmbientPresentationSceneExtensionClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AmbientUIServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AmbientUIServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5CCCF20;
    uint64_t v5 = 0;
    AmbientUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AmbientUIServicesLibraryCore_frameworkLibrary) {
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AMUIAmbientPresentationSceneExtension");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2();
  }
  getAMUIAmbientPresentationSceneExtensionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AmbientUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AmbientUIServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SBUIProudLockIconViewStateIsCoaching(unint64_t a1)
{
  if (a1 < 9) {
    return 0;
  }
  if (a1 == 23) {
    return _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled();
  }
  return 1;
}

uint64_t SBUIProudLockIconViewStateIsCameraCovered(unint64_t a1)
{
  return (a1 > 0x17) | (0x3800u >> a1) & 1;
}

uint64_t SBUIProudLockIconViewStateIsUpsideDown(unint64_t a1)
{
  return (a1 > 0x17) | (0xC0000u >> a1) & 1;
}

uint64_t SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(uint64_t a1)
{
  double v2 = +[SBUIBiometricResource sharedInstance];
  char v3 = [v2 hasPoseidonSupport];

  if (v3) {
    return 1;
  }
  uint64_t result = 3;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      return 1;
    case 9:
      uint64_t result = 2;
      break;
    case 11:
    case 12:
    case 13:
      uint64_t result = 4;
      break;
    case 14:
      uint64_t result = 5;
      break;
    case 15:
      uint64_t result = 6;
      break;
    case 16:
      uint64_t result = 7;
      break;
    case 17:
      uint64_t result = 8;
      break;
    case 18:
    case 19:
      uint64_t result = 12;
      break;
    case 20:
      uint64_t result = 9;
      break;
    case 21:
      uint64_t result = 10;
      break;
    case 22:
      uint64_t result = 11;
      break;
    case 23:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()) {
        uint64_t result = 14;
      }
      else {
        uint64_t result = 1;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBUIProudLockIconViewStateShowsCoachingText(unint64_t a1)
{
  double v2 = +[SBUIBiometricResource sharedInstance];
  char v3 = [v2 hasPoseidonSupport];

  if (v3) {
    return 0;
  }
  uint64_t result = 1;
  if (a1 > 0x17) {
    return result;
  }
  if (((1 << a1) & 0x1C5FF) != 0) {
    return 0;
  }
  if (((1 << a1) & 0xC3A00) != 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    return (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else if (a1 == 23)
  {
    return _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled();
  }
  return result;
}

void sub_1A7628C80(_Unwind_Exception *a1)
{
}

void sub_1A762A52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLAUIPearlGlyphViewClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getLAUIPearlGlyphViewClass_softClass;
  uint64_t v7 = getLAUIPearlGlyphViewClass_softClass;
  if (!getLAUIPearlGlyphViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLAUIPearlGlyphViewClass_block_invoke;
    v3[3] = &unk_1E5CCC5D0;
    v3[4] = &v4;
    __getLAUIPearlGlyphViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A762A610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAUIPearlGlyphStaticConfigurationClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationPrivateUILibrary();
  Class result = objc_getClass("LAUIPearlGlyphStaticConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLAUIPearlGlyphStaticConfigurationClass_block_invoke_cold_1();
  }
  getLAUIPearlGlyphStaticConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void LocalAuthenticationPrivateUILibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __LocalAuthenticationPrivateUILibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5CCD0E8;
    uint64_t v2 = 0;
    LocalAuthenticationPrivateUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary) {
    LocalAuthenticationPrivateUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __LocalAuthenticationPrivateUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationPrivateUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLAUIPearlGlyphViewClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationPrivateUILibrary();
  Class result = objc_getClass("LAUIPearlGlyphView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLAUIPearlGlyphViewClass_block_invoke_cold_1();
  }
  getLAUIPearlGlyphViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A762B6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AmbientUIServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5CCD118;
    uint64_t v5 = 0;
    AmbientUIServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_0) {
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AMUIAmbientPresentationSceneExtension");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2_0();
  }
  getAMUIAmbientPresentationSceneExtensionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AmbientUIServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AmbientUIServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id SBSUIStarkNotificationsSceneClientSettingValueDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 2998744415) > 1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = BSSettingFlagDescription();
  }
  return v2;
}

__CFString *SBUIServiceButtonEventDescription(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = v2;
    if (v1)
    {
      [(__CFString *)v2 appendString:@" lock"];
      v1 &= ~1uLL;
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [(__CFString *)v3 appendString:@" volUp"];
    v1 &= ~2uLL;
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
LABEL_17:
    [(__CFString *)v3 appendString:@" volDown"];
    v1 &= ~4uLL;
    if ((v1 & 0x10) == 0)
    {
LABEL_6:
      if ((v1 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
LABEL_18:
    [(__CFString *)v3 appendString:@" home"];
    v1 &= ~0x10uLL;
    if ((v1 & 8) == 0)
    {
LABEL_7:
      if ((v1 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
LABEL_19:
    [(__CFString *)v3 appendString:@" headset"];
    v1 &= ~8uLL;
    if ((v1 & 0x20) == 0)
    {
LABEL_8:
      if (!v1)
      {
LABEL_10:
        [(__CFString *)v3 appendString:@""]);
        goto LABEL_12;
      }
LABEL_9:
      [(__CFString *)v3 appendFormat:@" %li", v1];
      goto LABEL_10;
    }
LABEL_20:
    [(__CFString *)v3 appendString:@" headset-long"];
    v1 &= ~0x20uLL;
    if (!v1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v3 = @"none";
LABEL_12:
  return v3;
}

uint64_t __eventsFromObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      long long v4 = v3;
    }
    else {
      long long v4 = 0;
    }
  }
  else
  {
    long long v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    uint64_t v6 = [v5 integerValue];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t SBUICurrentPasscodeStyleForUser()
{
  if (SBUICurrentPasscodeStyleForUser_onceToken != -1) {
    dispatch_once(&SBUICurrentPasscodeStyleForUser_onceToken, &__block_literal_global_9);
  }
  if (SBUICurrentPasscodeStyleForUser___unlockScreenType == 1) {
    return 2;
  }
  if (SBUICurrentPasscodeStyleForUser___unlockScreenType) {
    return 3;
  }
  uint64_t result = SBUICurrentPasscodeStyleForUser___simplePasscodeType;
  if (!SBUICurrentPasscodeStyleForUser___simplePasscodeType) {
    return result;
  }
  if (SBUICurrentPasscodeStyleForUser___simplePasscodeType == -1)
  {
    [MEMORY[0x1E4F1CA00] raise:@"Cannot be simple and have a non-simple passcode type." format:&stru_1EFCB7578];
    return 3;
  }
  return 1;
}

uint64_t __SBUICurrentPasscodeStyleForUser_block_invoke()
{
  SBUICurrentPasscodeStyleForUser___simplePasscodeType = -1;
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  SBUICurrentPasscodeStyleForUser___unlockScreenType = [v0 unlockScreenTypeWithOutSimplePasscodeType:&SBUICurrentPasscodeStyleForUser___simplePasscodeType];

  int out_token = 0;
  id v1 = (const char *)[(id)*MEMORY[0x1E4F74200] UTF8String];
  return notify_register_dispatch(v1, &out_token, MEMORY[0x1E4F14428], &__block_literal_global_3);
}

void __SBUICurrentPasscodeStyleForUser_block_invoke_2()
{
  SBUICurrentPasscodeStyleForUser___simplePasscodeType = -1;
  id v0 = [MEMORY[0x1E4F74230] sharedConnection];
  SBUICurrentPasscodeStyleForUser___unlockScreenType = [v0 unlockScreenTypeWithOutSimplePasscodeType:&SBUICurrentPasscodeStyleForUser___simplePasscodeType];
}

void sub_1A763088C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AmbientUIServicesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5CCD298;
    uint64_t v5 = 0;
    AmbientUIServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!AmbientUIServicesLibraryCore_frameworkLibrary_1) {
    __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AMUIAmbientPresentationSettingsExtension");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_2();
  }
  getAMUIAmbientPresentationSettingsExtensionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AmbientUIServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AmbientUIServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1A7631E28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

__CFString *SBUIStringForPhoneUnlockWithWatchErrorCode(uint64_t a1)
{
  uint64_t v1 = @"Internal only - AKSFailure";
  switch(a1)
  {
    case 101:
      break;
    case 102:
      uint64_t v1 = @"Internal only - DeviceLocked";
      break;
    case 103:
      uint64_t v1 = @"Internal only - MessageSendFailed";
      break;
    case 104:
      uint64_t v1 = @"Internal only - BadDeviceIdentifier";
      break;
    case 105:
      uint64_t v1 = @"Internal only - PairedDeviceNotNearby";
      break;
    case 106:
      uint64_t v1 = @"Internal only - SendFailedToPairedDevice";
      break;
    case 107:
      uint64_t v1 = @"Internal only - EnableRequestTimedOut";
      break;
    case 108:
      uint64_t v1 = @"Internal only - KeyDeviceNoPasscode";
      break;
    case 109:
      uint64_t v1 = @"Internal only - PairedUnlockDisabled";
      break;
    case 110:
      uint64_t v1 = @"Internal only - StashRequestTimedOut";
      break;
    case 111:
      uint64_t v1 = @"Internal only - NoPermission";
      break;
    case 112:
      uint64_t v1 = @"Internal only - InvalidParameters";
      break;
    case 113:
      uint64_t v1 = @"Internal only - StateRequestTimedOut";
      break;
    case 114:
      uint64_t v1 = @"Internal only - WiFiFailure";
      break;
    case 115:
      uint64_t v1 = @"Internal only - FeatureUnsupported";
      break;
    case 116:
      uint64_t v1 = @"Internal only - ScanTimeout";
      break;
    case 117:
      uint64_t v1 = @"Internal only - NoEnabledDevices";
      break;
    case 118:
      uint64_t v1 = @"Internal only - Cancelled";
      break;
    case 119:
      uint64_t v1 = @"Internal only - CodeWatchNotInState";
      break;
    case 120:
      uint64_t v1 = @"Internal only - WiFiInterfaceDisabled";
      break;
    case 121:
      uint64_t v1 = @"Internal only - ViewNotSyncing";
      break;
    case 122:
      uint64_t v1 = @"Internal only - NoEntitlement";
      break;
    case 123:
      uint64_t v1 = @"Internal only - BluetoothInterfaceDisabled";
      break;
    case 124:
      uint64_t v1 = @"Internal only - BluetoothWiFiInterfaceDisabled";
      break;
    case 125:
      uint64_t v1 = @"Internal only - WatchMissingLTK";
      break;
    case 126:
      uint64_t v1 = @"Internal only - OldProtocol";
      break;
    case 127:
      uint64_t v1 = @"Internal only - UnlockAttemptLimitReached";
      break;
    case 128:
      uint64_t v1 = @"Internal only - PeerNotAvailable";
      break;
    case 129:
      uint64_t v1 = @"Internal only - LTKHashesMismatch";
      break;
    case 130:
      uint64_t v1 = @"Internal only - AppleWatchOutOfRange";
      break;
    case 131:
      uint64_t v1 = @"Internal only - UnableToFindWatch";
      break;
    case 132:
      uint64_t v1 = @"Internal only - UnableToFindWatchInProxy";
      break;
    case 133:
      uint64_t v1 = @"Internal only - SetupFailed";
      break;
    case 134:
      uint64_t v1 = @"Internal only - NotCloudPaired";
      break;
    case 135:
      uint64_t v1 = @"Internal only - WatchLockedAndOnWrist";
      break;
    case 136:
      uint64_t v1 = @"Internal only - CodeConfirmationFailure";
      break;
    case 137:
      uint64_t v1 = @"Internal only - NoRangingResults";
      break;
    case 138:
      uint64_t v1 = @"Internal only - UnableToFindRangingPeer";
      break;
    case 139:
      uint64_t v1 = @"Internal only - RangingFailure";
      break;
    case 140:
      uint64_t v1 = @"Internal only - ProxyFailedToConnect";
      break;
    case 141:
      uint64_t v1 = @"Internal only - ProxyFailedToSend";
      break;
    case 142:
      uint64_t v1 = @"Internal only - ProxyFailedToSendTimeout";
      break;
    case 143:
      uint64_t v1 = @"Internal only - ProxyUnknownError";
      break;
    case 144:
      uint64_t v1 = @"Internal only - ProxyNotAvailableForUnlock";
      break;
    case 145:
      uint64_t v1 = @"Internal only - MachineClamshellWithNoDisplay";
      break;
    case 146:
      uint64_t v1 = @"Internal only - MacInternetSharing";
      break;
    case 147:
      uint64_t v1 = @"Internal only - IncorrectUserPassword";
      break;
    case 148:
      uint64_t v1 = @"Internal only - MacMissingLTK";
      break;
    case 149:
      uint64_t v1 = @"Internal only - MissingLocalLTK";
      break;
    case 150:
      uint64_t v1 = @"Internal only - WatchNotSignedIn";
      break;
    case 151:
      uint64_t v1 = @"Internal only - SetupRequestSendFailed";
      break;
    case 152:
      uint64_t v1 = @"Internal only - SetupTokenExchangeSendFailed";
      break;
    case 153:
      uint64_t v1 = @"Internal only - SetupInitialRequestTimeout";
      break;
    case 154:
      uint64_t v1 = @"Internal only - SetupTokenExchangeTimeout";
      break;
    case 155:
      uint64_t v1 = @"Internal only - SetupWatchFailedToSendToken";
      break;
    case 156:
      uint64_t v1 = @"Internal only - SetupWatchFailedSendCompnID";
      break;
    case 157:
      uint64_t v1 = @"Internal only - OverallAttemptTimeout";
      break;
    case 158:
      uint64_t v1 = @"Internal only - WatchOffWrist";
      break;
    case 159:
      uint64_t v1 = @"Internal only - WatchLockedAndOffWrist";
      break;
    case 160:
      uint64_t v1 = @"Internal only - MessageMissingSetupToken";
      break;
    case 161:
      uint64_t v1 = @"Internal only - AKSSessionSetupFailedWatch";
      break;
    case 163:
      uint64_t v1 = @"Internal only - AKSSecretStepFailed";
      break;
    case 164:
      uint64_t v1 = @"Internal only - AKSFinalStepFailed";
      break;
    case 165:
      uint64_t v1 = @"Internal only - FailedCreateSessionTokenWatch";
      break;
    case 166:
      uint64_t v1 = @"Internal only - FailedStoreSessionTokenWatch";
      break;
    case 169:
      uint64_t v1 = @"Internal only - FailedToCreateEscrowSecret";
      break;
    case 170:
      uint64_t v1 = @"Internal only - FailedToStoreEscrowSecret";
      break;
    case 171:
      uint64_t v1 = @"Internal only - UnknownWatchFailure";
      break;
    case 172:
      uint64_t v1 = @"Internal only - AKSPeerSetupFailed";
      break;
    case 173:
      uint64_t v1 = @"Internal only - NewWatchVersion";
      break;
    case 174:
      uint64_t v1 = @"Internal only - PasscodeKeychainMismatch";
      break;
    case 175:
      uint64_t v1 = @"Internal only - MissingPasscode";
      break;
    case 176:
      uint64_t v1 = @"Internal only - WaitingForLTKSync";
      break;
    case 177:
      uint64_t v1 = @"Internal only - iPhoneNeedsUnlock";
      break;
    case 178:
      uint64_t v1 = @"Internal only - MacNotIDSRegistered";
      break;
    case 179:
      uint64_t v1 = @"Internal only - UserDeniedAuthRequest";
      break;
    case 180:
      uint64_t v1 = @"Internal only - AuthRequestFailedToPost";
      break;
    case 181:
      uint64_t v1 = @"Internal only - UnexpectedAuthMode";
      break;
    case 182:
      uint64_t v1 = @"Internal only - TestMode";
      break;
    case 183:
      uint64_t v1 = @"Internal only - UserSessionNotAvailable";
      break;
    case 184:
      uint64_t v1 = @"Internal only - AuthPromptsDisabled";
      break;
    case 185:
      uint64_t v1 = @"Internal only - AuthPromptsMissingToken";
      break;
    case 186:
      uint64_t v1 = @"Internal only - WatchFailedToConnect";
      break;
    case 187:
      uint64_t v1 = @"Internal only - LTKMissing";
      break;
    case 188:
      uint64_t v1 = @"Internal only - IncorrectLocalLTK";
      break;
    case 189:
      uint64_t v1 = @"Internal only - EncryptionFailed";
      break;
    case 190:
      uint64_t v1 = @"Internal only - DecryptionFailed";
      break;
    case 191:
      uint64_t v1 = @"Internal only - MissingSessionKey";
      break;
    case 192:
      uint64_t v1 = @"Internal only - AWDLFailedToStart";
      break;
    case 193:
      uint64_t v1 = @"Internal only - MacLTKHashMismatch";
      break;
    case 194:
      uint64_t v1 = @"Internal only - MissingLocalIDSID";
      break;
    case 195:
      uint64_t v1 = @"Internal only - ReceivedMsgBeforeFirstUnlock";
      break;
    case 196:
      uint64_t v1 = @"Internal only - TimeoutLTKResponseFromPhone";
      break;
    case 197:
      uint64_t v1 = @"Internal only - PairingWatchTimeout";
      break;
    case 198:
      uint64_t v1 = @"Internal only - NoIDSDeviceForBluetoothID";
      break;
    case 199:
      uint64_t v1 = @"Internal only - WatchWiFiInterfaceDisabled";
      break;
    case 200:
      uint64_t v1 = @"Internal only - AuthPromptRequestFailed";
      break;
    case 201:
      uint64_t v1 = @"Internal only - AuthPromptResponseFailed";
      break;
    case 202:
      uint64_t v1 = @"Internal only - AuthPromptImageDataFailed";
      break;
    case 203:
      uint64_t v1 = @"Internal only - AuthPromptCallerInfoMissing";
      break;
    case 204:
      uint64_t v1 = @"Internal only - WatchInSleepMode";
      break;
    case 205:
      uint64_t v1 = @"Internal only - FaceIDDisabled";
      break;
    case 206:
      uint64_t v1 = @"Internal only - NoMask";
      break;
    case 207:
      uint64_t v1 = @"Internal only - BioLockout";
      break;
    case 210:
      uint64_t v1 = @"Internal only - WatchNoMotionDetected";
      break;
    case 211:
      uint64_t v1 = @"Internal only - RegistrationTokenMissing";
      break;
    case 212:
      uint64_t v1 = @"Internal only - RegistrationMalformedRequest";
      break;
    case 213:
      uint64_t v1 = @"Internal only - UnlockAttemptTokenNotArmed";
      break;
    case 214:
      uint64_t v1 = @"Internal only - UnlockAttemptNoRecentUnlock";
      break;
    case 215:
      uint64_t v1 = @"Internal only - WatchUnlockedAfterPhone";
      break;
    case 216:
      uint64_t v1 = @"Internal only - AttemptBlockedDueToRelock";
      break;
    default:
      uint64_t v2 = [NSNumber numberWithInteger:a1];
      uint64_t v1 = [v2 stringValue];

      break;
  }
  return v1;
}

__CFString *SBUISystemApertureCommandDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"unknown";
  }
  else {
    return off_1E5CCD3E0[a1 - 1];
  }
}

uint64_t SBLayoutSupportsSideLayoutRole()
{
  if (SBLayoutSupportsSideLayoutRole_onceToken != -1) {
    dispatch_once(&SBLayoutSupportsSideLayoutRole_onceToken, &__block_literal_global_12);
  }
  return SBLayoutSupportsSideLayoutRole_sSBLayoutSupportsSideLayoutRole;
}

uint64_t __SBLayoutSupportsSideLayoutRole_block_invoke()
{
  if (MGGetBoolAnswer()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = MGGetBoolAnswer();
  }
  SBLayoutSupportsSideLayoutRole_sSBLayoutSupportsSideLayoutRole = result;
  return result;
}

void sub_1A7634F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SBSUIInCallWindowSceneSessionDestructionReasonDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5CCD4A0[a1];
  }
}

__CFString *SBSUIHardwareButtonEventTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E5CCD4E8[a1 - 1];
  }
}

__CFString *SBSUIHardwareButtonEventTypeMaskDescription(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    double v10 = __SBSUIHardwareButtonEventTypeMaskDescription_block_invoke;
    double v11 = &unk_1E5CCD4C8;
    id v3 = v2;
    double v12 = v3;
    long long v4 = v9;
    char v13 = 0;
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
          ((void (*)(void *))v10)(v4);
          if (v13) {
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

    [(__CFString *)v3 appendFormat:@" %lu", a1];
    [(__CFString *)v3 appendString:@""]);
  }
  else
  {
    id v3 = @"none";
  }
  return v3;
}

uint64_t __SBSUIHardwareButtonEventTypeMaskDescription_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id v3 = *(void **)(a1 + 32);
  unint64_t v4 = a3 - 1;
  if (v4 > 3) {
    uint8x8_t v5 = @"unknown";
  }
  else {
    uint8x8_t v5 = off_1E5CCD4E8[v4];
  }
  return [v3 appendFormat:@" %@", v5];
}

BOOL SBSUIHardwareButtonEventTypeIsValid(unint64_t a1)
{
  return a1 < 5;
}

void _SBUIApplyDisplayEdgeInfo(void *a1)
{
  uint64_t v1 = _SBUIApplyDisplayEdgeInfo_onceToken;
  id v2 = a1;
  id v4 = v2;
  if (v1 == -1)
  {
    id v3 = v2;
  }
  else
  {
    dispatch_once(&_SBUIApplyDisplayEdgeInfo_onceToken, &__block_literal_global_13);
    id v3 = v4;
  }
  objc_msgSend((id)_SBUIApplyDisplayEdgeInfo_displayEdgeInfo, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
  [v4 setCornerRadiusConfiguration:_SBUIApplyDisplayEdgeInfo_cornerRadiusConfiguration];
}

void sub_1A7635A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBHScreenTypeForCurrentDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "SBHScreenTypeForCurrentDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpringBoardHomeLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __SpringBoardHomeLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5CCD5F8;
    uint64_t v4 = 0;
    SpringBoardHomeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SpringBoardHomeLibraryCore_frameworkLibrary;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary) {
    SpringBoardHomeLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __SpringBoardHomeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardHomeLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SpringBoardHomeLibrary();
  uint64_t result = dlsym(v2, "SBHDisplayCornerRadiusForScreenType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A763A388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A763A74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A763AD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A763B280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A763B35C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A763B420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A763C4D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A763C708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPBItemMetadataKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getPBItemMetadataKeySymbolLoc_ptr;
  uint64_t v7 = getPBItemMetadataKeySymbolLoc_ptr;
  if (!getPBItemMetadataKeySymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPBItemMetadataKeySymbolLoc_block_invoke;
    v3[3] = &unk_1E5CCC5D0;
    v3[4] = &v4;
    __getPBItemMetadataKeySymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getPBItemMetadataKey_cold_1();
  }
  uint64_t v1 = *v0;
  return v1;
}

void sub_1A76404B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPBItemMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PasteboardLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __PasteboardLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5CCD7E8;
    uint64_t v6 = 0;
    PasteboardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)PasteboardLibraryCore_frameworkLibrary;
  if (!PasteboardLibraryCore_frameworkLibrary) {
    __getPBItemMetadataKeySymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "PBItemMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPBItemMetadataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PasteboardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PasteboardLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t SBUI_LegibilitySettingsShadowHasSameShapeAsLegibilitySettings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = v4;
  if (v3)
  {
    [v3 shadowSettings];
    double v6 = v18;
    if (v5)
    {
LABEL_3:
      [v5 shadowSettings];
      double v7 = v17;
      goto LABEL_6;
    }
  }
  else
  {
    double v6 = 0.0;
    if (v4) {
      goto LABEL_3;
    }
  }
  double v7 = 0.0;
LABEL_6:
  if (vabdd_f64(v6, v7) > 2.22044605e-16) {
    goto LABEL_14;
  }
  if (!v3)
  {
    double v8 = 0.0;
    if (v5) {
      goto LABEL_9;
    }
LABEL_11:
    double v9 = 0.0;
    goto LABEL_12;
  }
  [v3 shadowSettings];
  double v8 = v16;
  if (!v5) {
    goto LABEL_11;
  }
LABEL_9:
  [v5 shadowSettings];
  double v9 = v15;
LABEL_12:
  if (vabdd_f64(v8, v9) <= 2.22044605e-16)
  {
    [v3 minFillHeight];
    double v11 = v10;
    [v5 minFillHeight];
    if (vabdd_f64(v11, v12) <= 2.22044605e-16)
    {
      uint64_t v13 = 1;
      goto LABEL_15;
    }
  }
LABEL_14:
  uint64_t v13 = 0;
LABEL_15:

  return v13;
}

BOOL SBUI_LegibilityShadowSettingsAreEqual(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 24) == *(void *)(a2 + 24)
      && vabdd_f64(*(double *)(a1 + 8), *(double *)(a2 + 8)) < 2.22044605e-16
      && vabdd_f64(*(double *)a1, *(double *)a2) < 2.22044605e-16
      && vabdd_f64(*(double *)(a1 + 16), *(double *)(a2 + 16)) < 2.22044605e-16;
}

uint64_t SBUILegibilityShadowSettingsHash(uint64_t a1)
{
  id v2 = [NSNumber numberWithDouble:*(double *)a1];
  uint64_t v3 = [v2 hash];
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
  uint64_t v5 = [v4 hash] ^ v3;
  double v6 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  uint64_t v7 = [v6 hash];
  double v8 = [NSNumber numberWithInteger:*(void *)(a1 + 24)];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

id CAFilterForSBUILegibilityShadowCompositingFilter(uint64_t a1)
{
  if (a1 == 1)
  {
    id v2 = (id *)MEMORY[0x1E4F3A078];
LABEL_5:
    id v3 = *v2;
    return v3;
  }
  if (a1 == 2)
  {
    id v2 = (id *)MEMORY[0x1E4F3A228];
    goto LABEL_5;
  }
  id v3 = 0;
  return v3;
}

double SBUILegibilityImageSizeForContentSizeAndStyle(uint64_t a1, double a2)
{
  id v3 = +[SBUILegibilitySettings sharedInstanceForStyle:a1];
  double v4 = SBUILegibilityImageSizeForContentSizeAndSettings(v3, a2);

  return v4;
}

__CFString *SBUISystemApertureSettingKeyValueDescription(void *a1, uint64_t a2)
{
  id v3 = a1;
  double v4 = v3;
  if (v3)
  {
    switch(a2)
    {
      case 3213009:
      case 3213019:
      case 3213020:
      case 3213021:
      case 3213022:
        uint64_t v5 = objc_opt_class();
        id v6 = v4;
        if (v5)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v7 = v6;
          }
          else {
            uint64_t v7 = 0;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        id v13 = v7;

        uint64_t v14 = [v13 unsignedIntegerValue];
        uint64_t v15 = SBUISystemApertureLayoutModeDescription(v14);
        goto LABEL_17;
      case 3213016:
        unint64_t v19 = [v3 unsignedIntegerValue];
        if (v19 >= 4) {
          double v8 = @"invalid";
        }
        else {
          double v8 = off_1E5CCD900[v19];
        }
        break;
      case 3213017:
        uint64_t v20 = objc_opt_class();
        id v21 = v4;
        if (v20)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = 0;
          }
        }
        else
        {
          uint64_t v22 = 0;
        }
        id v39 = v22;

        [v39 BOOLValue];
        uint64_t v15 = NSStringFromBOOL();
        goto LABEL_17;
      case 3213018:
        uint64_t v23 = objc_opt_class();
        id v24 = v4;
        if (v23)
        {
          if (objc_opt_isKindOfClass()) {
            v25 = v24;
          }
          else {
            v25 = 0;
          }
        }
        else
        {
          v25 = 0;
        }
        id v40 = v25;

        unint64_t v41 = [v40 unsignedIntegerValue];
        uint64_t v15 = SBUISystemApertureContentRoleDescription(v41);
        goto LABEL_17;
      case 3213028:
        v26 = NSString;
        uint64_t v27 = objc_opt_class();
        id v28 = v4;
        if (v27)
        {
          if (objc_opt_isKindOfClass()) {
            v29 = v28;
          }
          else {
            v29 = 0;
          }
        }
        else
        {
          v29 = 0;
        }
        id v42 = v29;

        uint64_t v43 = [v42 unsignedIntValue];
        objc_msgSend(v26, "stringWithFormat:", @"%u", v43);
        goto LABEL_16;
      case 3213029:
      case 3213030:
      case 3213031:
      case 3213032:
        uint64_t v9 = NSString;
        uint64_t v10 = objc_opt_class();
        id v11 = v4;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            double v12 = v11;
          }
          else {
            double v12 = 0;
          }
        }
        else
        {
          double v12 = 0;
        }
        id v16 = v12;

        uint64_t v17 = [v16 unsignedLongLongValue];
        objc_msgSend(v9, "stringWithFormat:", @"%llu", v17);
        uint64_t v15 = LABEL_16:;
        goto LABEL_17;
      case 3213034:
        uint64_t v30 = objc_opt_class();
        id v31 = v4;
        if (v30)
        {
          if (objc_opt_isKindOfClass()) {
            v32 = v31;
          }
          else {
            v32 = 0;
          }
        }
        else
        {
          v32 = 0;
        }
        id v44 = v32;

        _SBUISafeBackgroundActivityIdentifiersDescription(v44);
        double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 3213036:
        uint64_t v33 = objc_opt_class();
        id v34 = v4;
        if (v33)
        {
          if (objc_opt_isKindOfClass()) {
            v35 = v34;
          }
          else {
            v35 = 0;
          }
        }
        else
        {
          v35 = 0;
        }
        id v45 = v35;

        unint64_t v46 = [v45 integerValue];
        uint64_t v15 = SBUISystemApertureCustomLayoutDescription(v46);
        goto LABEL_17;
      case 3213039:
        uint64_t v36 = objc_opt_class();
        id v37 = v4;
        if (v36)
        {
          if (objc_opt_isKindOfClass()) {
            v38 = v37;
          }
          else {
            v38 = 0;
          }
        }
        else
        {
          v38 = 0;
        }
        id v47 = v38;

        uint64_t v48 = [v47 unsignedIntegerValue];
        uint64_t v15 = SBUISystemAperturePresentationBehaviorsDescription(v48);
        goto LABEL_17;
      default:
        uint64_t v15 = [v3 description];
LABEL_17:
        double v8 = (__CFString *)v15;
        break;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

__CFString *SBUISystemApertureSettingKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 3213008) > 0x2C) {
    return @"invalid";
  }
  else {
    return off_1E5CCD920[a1 - 3213008];
  }
}

void sub_1A764A5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBUIProudLockIconViewStateForSBUIFaceIDCoachingCondition(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 2:
      uint64_t result = 9;
      break;
    case 4:
      uint64_t v7 = SBUIFaceIDCameraOrientationForDevice();
      uint64_t result = 13;
      switch(a3)
      {
        case 0uLL:
          if (SBUIFaceIDCameraOrientationAlignsWithInterfaceOrientation(v7, a2)) {
            uint64_t result = 11;
          }
          else {
            uint64_t result = 13;
          }
          break;
        case 1uLL:
          if (SBUIInterfaceOrientationForFaceIDCameraOrientation(v7) == a2) {
            uint64_t result = 11;
          }
          else {
            uint64_t result = 13;
          }
          break;
        case 2uLL:
          return result;
        case 3uLL:
          uint64_t result = 11;
          break;
        default:
          goto LABEL_10;
      }
      break;
    case 5:
    case 6:
    case 7:
      uint64_t result = 4;
      break;
    case 8:
      uint64_t result = 17;
      break;
    case 9:
      uint64_t result = 20;
      break;
    case 10:
      uint64_t result = 21;
      break;
    case 11:
      uint64_t result = 22;
      break;
    case 12:
      if (a3 >= 4) {
        goto LABEL_10;
      }
      uint64_t result = qword_1A76A56F0[a3];
      break;
    case 13:
LABEL_10:
      uint64_t result = 0;
      break;
    case 14:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()) {
        uint64_t result = 23;
      }
      else {
        uint64_t result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

__CFString *NSStringForSBUIProudLockIconViewState(unint64_t a1)
{
  if (SBUIProudLockIconViewStateIsCoaching(a1))
  {
    unint64_t v2 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(a1);
    if (a1 - 11 >= 3)
    {
      DebugStringForSBUIFaceIDCoachingCondition(v2);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = off_1E5CCDB00[a1 - 11];
    }
    double v4 = [NSString stringWithFormat:@"Coaching: %@", v3];
  }
  else if (a1 > 0x14)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = off_1E5CCDB18[a1];
  }
  return v4;
}

id NSStringCoachingTextForSBUIProudLockIconViewState(unint64_t a1)
{
  if (SBUIProudLockIconViewStateIsCoaching(a1))
  {
    uint64_t v2 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(a1);
    id v3 = SBUICoachingTextForSBUIFaceIDCoachingCondition(v2);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

BOOL SBUIUnlockSourceShowsScanningState(int a1)
{
  return a1 != 10;
}

id SBUIWindowForViewControllerTransition(void *a1)
{
  uint64_t v1 = [a1 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 window];
  }
  id v3 = v2;

  return v3;
}

void sub_1A764BD0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

__CFString *SBSUIIdleTimerModeDescription(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (!a1) {
    uint64_t v1 = @"SBSUIIdleTimerModeUnlocked";
  }
  if (a1 == 1) {
    return @"SBSUIIdleTimerModeLocked";
  }
  else {
    return v1;
  }
}

__CFString *SBSUIRotationModeDescription(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (a1 == 1) {
    uint64_t v1 = @"SBSUIRotationModeNotAllowed";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"SBSUIRotationModeAllowed";
  }
}

__CFString *SBSUIWallpaperModeDescription(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (a1 == 1) {
    uint64_t v1 = @"SBSUIWallpaperModeDark";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"SBSUIWallpaperModeLight";
  }
}

__CFString *SBSUILoginUISceneClientSettingValueDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (a1 == 736840729)
  {
    uint64_t v9 = [v3 unsignedIntegerValue];
    id v6 = @"unknown";
    if (v9 == 1) {
      id v6 = @"SBSUIWallpaperModeDark";
    }
    uint64_t v7 = @"SBSUIWallpaperModeLight";
    goto LABEL_13;
  }
  if (a1 == 736840728)
  {
    uint64_t v9 = [v3 integerValue];
    id v6 = @"unknown";
    if (v9 == 1) {
      id v6 = @"SBSUIRotationModeNotAllowed";
    }
    uint64_t v7 = @"SBSUIRotationModeAllowed";
LABEL_13:
    BOOL v8 = v9 == 0;
    goto LABEL_14;
  }
  if (a1 != 736840726)
  {
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = [v3 integerValue];
  id v6 = @"unknown";
  if (!v5) {
    id v6 = @"SBSUIIdleTimerModeUnlocked";
  }
  uint64_t v7 = @"SBSUIIdleTimerModeLocked";
  BOOL v8 = v5 == 1;
LABEL_14:
  if (v8) {
    id v6 = v7;
  }
  uint64_t v10 = v6;
LABEL_18:

  return v10;
}

id NSDictionaryFromSBUILegibilityShadowSettings(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"kSBUIModernLegibilityShadowRadiusKey";
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)a1];
  v9[0] = v2;
  v8[1] = @"kSBUIModernLegibilityShadowAlphaKey";
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
  v9[1] = v3;
  v8[2] = @"kSBUIModernLegibilityImageOutsetKey";
  double v4 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  void v9[2] = v4;
  v8[3] = @"kSBUIModernLegibilityShadowCompositingFilterNameKey";
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 24)];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

void SBUILegibilityShadowSettingsFromDictionary(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  id v3 = a1;
  double v4 = [v3 objectForKeyedSubscript:@"kSBUIModernLegibilityShadowRadiusKey"];
  [v4 floatValue];
  *(double *)a2 = v5;

  id v6 = [v3 objectForKeyedSubscript:@"kSBUIModernLegibilityShadowAlphaKey"];
  [v6 floatValue];
  *(double *)(a2 + _Block_object_dispose(&STACK[0x410], 8) = v7;

  BOOL v8 = [v3 objectForKeyedSubscript:@"kSBUIModernLegibilityImageOutsetKey"];
  [v8 floatValue];
  *(double *)(a2 + 16) = v9;

  id v10 = [v3 objectForKeyedSubscript:@"kSBUIModernLegibilityShadowCompositingFilterNameKey"];

  *(void *)(a2 + 24) = [v10 integerValue];
}

id ComputeLegibilityColorFromColor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F428B8] blackColor];
  id v3 = v1;
  if (CGColorGetNumberOfComponents((CGColorRef)[v3 CGColor]) >= 3)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    uint64_t v7 = 0;
    if ([v3 getHue:&v9 saturation:&v8 brightness:&v7 alpha:0])
    {
      double v4 = 0.0;
      if (v9 != 0.0) {
        double v4 = fmin(fmax(v8, 0.3), 0.5);
      }
      uint64_t v5 = [MEMORY[0x1E4F428B8] colorWithHue:v9 saturation:v4 brightness:0.3 alpha:1.0];

      uint64_t v2 = (void *)v5;
    }
  }

  return v2;
}

__CFString *NSStringFromSBUIBiometricEvent(unint64_t a1)
{
  if (a1 > 0x22) {
    return @"(unknown)";
  }
  else {
    return off_1E5CCDEA8[a1];
  }
}

__CFString *NSStringFromSBUIBiometricLockoutState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return @"None";
  }
  else {
    return off_1E5CCDFC0[a1 - 1];
  }
}

__CFString *NSStringFromSBUIBiometricMatchMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_1E5CCE010[a1 - 1];
  }
}

uint64_t _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()
{
  return _os_feature_enabled_impl();
}

id SBSUIInCallSceneClientSettingValueDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch(a1)
  {
    case 2001:
      uint64_t v11 = objc_opt_class();
      id v12 = v3;
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
      id v20 = v13;

      uint64_t v21 = [v20 unsignedIntegerValue];
      uint64_t v8 = SBSUIHardwareButtonEventTypeMaskDescription(v21);
      goto LABEL_8;
    case 2002:
      uint64_t v14 = objc_opt_class();
      id v15 = v3;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v22 = v16;

      double v9 = _SBUISafeBackgroundActivityIdentifiersDescription(v22);

      break;
    case 2003:
    case 2004:
    case 2005:
    case 2006:
    case 2008:
    case 2009:
    case 2010:
    case 2011:
      uint64_t v4 = objc_opt_class();
      id v5 = v3;
      if (v4)
      {
        if (objc_opt_isKindOfClass()) {
          id v6 = v5;
        }
        else {
          id v6 = 0;
        }
      }
      else
      {
        id v6 = 0;
      }
      id v7 = v6;

      [v7 BOOLValue];
      uint64_t v8 = NSStringFromBOOL();
      goto LABEL_8;
    case 2007:
      uint64_t v17 = objc_opt_class();
      id v18 = v3;
      if (v17)
      {
        if (objc_opt_isKindOfClass()) {
          unint64_t v19 = v18;
        }
        else {
          unint64_t v19 = 0;
        }
      }
      else
      {
        unint64_t v19 = 0;
      }
      id v23 = v19;

      [v23 UIEdgeInsetsValue];
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;

      v33.top = v25;
      v33.left = v27;
      v33.bottom = v29;
      v33.right = v31;
      uint64_t v8 = NSStringFromUIEdgeInsets(v33);
LABEL_8:
      double v9 = (void *)v8;
      break;
    default:
      double v9 = 0;
      break;
  }

  return v9;
}

double _SBMainScreenScale()
{
  if (_SBMainScreenScale_onceToken != -1) {
    dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
  }
  return *(double *)&_SBMainScreenScale___s;
}

BOOL SBFloatEqualsFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t SBRectEqualsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5)) {
    return 1;
  }
  double v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= 2.22044605e-16 || v17 >= 2.22044605e-16) {
    return 0;
  }
  BOOL v19 = vabdd_f64(a3, a7) < 2.22044605e-16;
  return vabdd_f64(a4, a8) < 2.22044605e-16 && v19;
}

BOOL SBPointEqualsPoint(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

BOOL SBSizeEqualsSize(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

BOOL SBSizeLessThanSize(double a1, double a2, double a3, double a4)
{
  return a2 < a4 && a1 < a3;
}

uint64_t SBSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  double v4 = vabdd_f64(a1, a3);
  if (a1 <= a3 && v4 >= 2.22044605e-16) {
    return 0;
  }
  BOOL v6 = vabdd_f64(a2, a4) < 2.22044605e-16;
  return a2 > a4 || v6;
}

BOOL SBPointEqualToPointAtScale(double a1, double a2, double a3, double a4, double a5)
{
  if (fabs(a5) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1) {
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
    }
    a5 = *(double *)&_SBMainScreenScale___s;
  }
  return vabdd_f64(a1 * a5, a3 * a5) < 2.22044605e-16 && vabdd_f64(a2 * a5, a4 * a5) < 2.22044605e-16;
}

double SBFloatRoundForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1) {
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
    }
    a2 = *(double *)&_SBMainScreenScale___s;
  }
  return round(a2 * a1) / a2;
}

double SBFloatRoundForMainScreenScale(double a1)
{
  if (_SBMainScreenScale_onceToken != -1) {
    dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
  }
  return round(*(double *)&_SBMainScreenScale___s * a1) / *(double *)&_SBMainScreenScale___s;
}

double SBFloatFloorForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1) {
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
    }
    a2 = *(double *)&_SBMainScreenScale___s;
  }
  return floor(a2 * a1) / a2;
}

double SBFloatCeilForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    if (_SBMainScreenScale_onceToken != -1) {
      dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
    }
    a2 = *(double *)&_SBMainScreenScale___s;
  }
  return ceil(a2 * a1) / a2;
}

double SBPointRoundForScale(double a1, double a2, double a3)
{
  double v5 = SBFloatRoundForScale(a1, a3);
  SBFloatRoundForScale(a2, a3);
  return v5;
}

double SBPointRoundForMainScreenScale(double a1)
{
  if (_SBMainScreenScale_onceToken != -1) {
    dispatch_once(&_SBMainScreenScale_onceToken, &__block_literal_global_26);
  }
  return round(a1 * *(double *)&_SBMainScreenScale___s) / *(double *)&_SBMainScreenScale___s;
}

double SBRectRoundForScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9 = SBFloatRoundForScale(a1, a5);
  SBFloatRoundForScale(a2, a5);
  SBFloatRoundForScale(a3, a5);
  SBFloatRoundForScale(a4, a5);
  return v9;
}

double SBRectRoundForMainScreenScale(double a1, double a2, double a3, double a4)
{
  return SBRectRoundForScale(a1, a2, a3, a4, 0.0);
}

double SBOffsetPointInReferenceSpaceAlongSceneSpaceDirectionForOrientation(unint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  double v7 = -a5;
  if (a1 > 1)
  {
    if (a1 == 2) {
      double v8 = a5;
    }
    else {
      double v8 = -a5;
    }
    uint64_t v9 = objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", v7);
    double v7 = -v8;
    if (v9 != 1) {
      double v7 = v8;
    }
    switch(a2)
    {
      case 0:
LABEL_11:
        a3 = *MEMORY[0x1E4F1DAD8];
        break;
      case 1:
LABEL_12:
        a3 = a3 - v7;
        break;
      case 2:
LABEL_13:
        a3 = a3 + v7;
        break;
      default:
        return a3;
    }
  }
  else
  {
    if (!a1) {
      double v7 = a5;
    }
    switch(a2)
    {
      case 0:
        goto LABEL_11;
      case 3:
        goto LABEL_13;
      case 4:
        goto LABEL_12;
      default:
        return a3;
    }
  }
  return a3;
}

uint64_t SBRectContainsPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  return SBRectContainsPointIncludingEdges(15, a1, a2, a3, a4, a5, a6);
}

uint64_t SBRectContainsPointIncludingEdges(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  if (CGRectIsNull(*(CGRect *)&a2)) {
    return 0;
  }
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  if (CGRectIsEmpty(v15)) {
    return 0;
  }
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  if (CGRectGetMinX(v16) > a6) {
    return 0;
  }
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  if (a6 > CGRectGetMaxX(v17)) {
    return 0;
  }
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  if (CGRectGetMinY(v18) > a7) {
    return 0;
  }
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  if (a7 > CGRectGetMaxY(v19)) {
    return 0;
  }
  if ((a1 & 1) == 0)
  {
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    if (a7 == CGRectGetMinY(v20)) {
      return 0;
    }
  }
  if ((a1 & 2) == 0)
  {
    v21.origin.x = a2;
    v21.origin.y = a3;
    v21.size.width = a4;
    v21.size.height = a5;
    if (a6 == CGRectGetMinX(v21)) {
      return 0;
    }
  }
  if ((a1 & 4) == 0)
  {
    v22.origin.x = a2;
    v22.origin.y = a3;
    v22.size.width = a4;
    v22.size.height = a5;
    if (a7 == CGRectGetMaxY(v22)) {
      return 0;
    }
  }
  if ((a1 & 8) == 0
    && (v23.origin.x = a2, v23.origin.y = a3, v23.size.width = a4, v23.size.height = a5, a6 == CGRectGetMaxX(v23)))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

uint64_t SBTransformFromOrientationToOrientation()
{
  return MEMORY[0x1F415BCF0]();
}

uint64_t SBStringFromRectCornerRadii(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"topLeft:%f topRight:%f bottomLeft:%f bottomRight:%f", *(void *)&a1, *(void *)&a4, *(void *)&a2, *(void *)&a3);
}

__CFString *SBStringFromCornerMask(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 15)
    {
      id v3 = @"allCorners";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"minXminY:%d maxXminY:%d minXmaxY:%d maxXmaxY:%d", a1 & 1, (a1 >> 1) & 1, (a1 >> 2) & 1, (a1 >> 3) & 1, v1);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v3 = @"noCorners";
  }
  return v3;
}

double SBTransformedSizeWithScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

uint64_t SBVelocityMatrixForUniform2DScaling@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v3 = MEMORY[0x1E4F39B10];
  double v4 = fabs(a3);
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)(a2 + 80) = v5;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v3 + 96);
  *(void *)(a2 + 112) = *(void *)(v3 + 112);
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  long long v7 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x410], 8) = v7;
  *(double *)a2 = v4;
  *(double *)(a2 + 40) = v4;
  *(void *)(a2 + 80) = 0;
  LODWORD(v3) = a3 < 0.0;
  double v8 = NAN;
  if ((v3 & result) == 0) {
    double v8 = 0.0;
  }
  *(double *)(a2 + 120) = v8;
  return result;
}

void _SBUILegibilityMetalEngineCGDataProviderFreeDataCallback(uint64_t a1, void *a2)
{
  uint64_t v3 = malloc_default_zone();
  malloc_zone_free(v3, a2);
}

void sub_1A765D934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  objc_destroyWeak(v49);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v50 - 248), 8);
  _Block_object_dispose((const void *)(v50 - 200), 8);
  _Block_object_dispose((const void *)(v50 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A76612FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7664474(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A7664708(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromSBUIContinuitySessionErrorCode(uint64_t a1)
{
  uint64_t v1 = @"None";
  if (a1 == -1000) {
    uint64_t v1 = @"Generic";
  }
  if (a1 == -1001) {
    uint64_t v1 = @"Security";
  }
  if (a1 == -2001) {
    return @"InvalidSession";
  }
  else {
    return v1;
  }
}

id SBUIContinuitySessionErrorCreate(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  if (a1)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = v11;
    id v13 = @"None";
    if (a1 == (void *)-1000) {
      id v13 = @"Generic";
    }
    if (a1 == (void *)-1001) {
      id v13 = @"Security";
    }
    if (a1 == (void *)-2001) {
      uint64_t v14 = @"InvalidSession";
    }
    else {
      uint64_t v14 = v13;
    }
    objc_msgSend(v11, "bs_setSafeObject:forKey:", v14, *MEMORY[0x1E4F4F610]);
    if (v10)
    {
      CGRect v15 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
      objc_msgSend(v12, "bs_setSafeObject:forKey:", v15, *MEMORY[0x1E4F28588]);
    }
    a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBUIContinuitySessionErrorDomain" code:a1 userInfo:v12];
  }
  return a1;
}

__CFString *NSStringFromSBUIContinuityButtonEventType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"none";
  }
  else {
    return off_1E5CCE230[a1 - 1];
  }
}

__CFString *NSStringFromSBUIContinuitySessionStep(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"unknown";
  }
  else {
    return off_1E5CCE248[a1 - 1];
  }
}

id SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration(void *a1)
{
  uint64_t v1 = [a1 hardwareIdentifier];
  uint64_t v2 = @"<embedded>";
  if (v1) {
    uint64_t v2 = v1;
  }
  uint64_t v3 = [NSString stringWithFormat:@"SB-display-%@", v2];

  return v3;
}

__CFString *SBSUIDeviceLockSourceTypeDescription(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (a1 == 2) {
    uint64_t v1 = @"smartCover";
  }
  if (a1 == 1) {
    return @"lockButton";
  }
  else {
    return v1;
  }
}

uint64_t SBUIBiometricEventIsProvidingFeedback(unint64_t a1)
{
  return (a1 < 0x20) & (0x808F0000 >> a1);
}

uint64_t SBUIFaceIDCoachingConditionForBiometricEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 16) > 0xF) {
    return 0;
  }
  else {
    return qword_1A76A57B8[a1 - 16];
  }
}

id UIContentSizeCategoryOneSmallerThanSizeCategory(void *a1)
{
  uint64_t v1 = a1;
  NSComparisonResult v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43760]);
  uint64_t v3 = (void *)*MEMORY[0x1E4F43768];
  if (v2)
  {
    NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43768]);
    uint64_t v3 = (void *)*MEMORY[0x1E4F43770];
    if (v4)
    {
      NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43770]);
      uint64_t v3 = (void *)*MEMORY[0x1E4F43778];
      if (v5)
      {
        NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43778]);
        uint64_t v3 = (void *)*MEMORY[0x1E4F43780];
        if (v6)
        {
          NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43780]);
          uint64_t v3 = (void *)*MEMORY[0x1E4F43790];
          if (v7)
          {
            NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43790]);
            uint64_t v3 = (void *)*MEMORY[0x1E4F43798];
            if (v8)
            {
              NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F43798]);
              uint64_t v3 = (void *)*MEMORY[0x1E4F437A0];
              if (v9)
              {
                NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F437A0]);
                uint64_t v3 = (void *)*MEMORY[0x1E4F437B0];
                if (v10)
                {
                  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F437B0]);
                  uint64_t v3 = (void *)*MEMORY[0x1E4F437B8];
                  if (v11)
                  {
                    NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F437B8]);
                    uint64_t v3 = (void *)*MEMORY[0x1E4F437C8];
                    if (v12)
                    {
                      NSComparisonResult v13 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F437C8]);
                      uint64_t v3 = (void *)*MEMORY[0x1E4F437A8];
                      if (v13)
                      {
                        if (UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F437A8])) {
                          uint64_t v3 = (void *)*MEMORY[0x1E4F437D0];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v14 = v3;

  return v14;
}

BOOL UIContentSizeCategoryIsEqualToCategory(NSString *a1, NSString *a2)
{
  return UIContentSizeCategoryCompareToCategory(a1, a2) == NSOrderedSame;
}

NSString *UIContentSizeCategoryClip(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  NSComparisonResult v6 = a2;
  NSComparisonResult v7 = a3;
  if (v5)
  {
    NSComparisonResult v8 = (NSString *)v5;
    NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v8, v7);
    NSComparisonResult v10 = v7;
    if (v9 == NSOrderedDescending
      || (v11 = UIContentSizeCategoryCompareToCategory(v8, v6), NSComparisonResult v10 = v6, v11 == NSOrderedAscending))
    {
      NSComparisonResult v12 = v10;

      NSComparisonResult v8 = v12;
    }
  }
  else
  {
    NSComparisonResult v8 = v6;
  }

  return v8;
}

BOOL UIContentSizeCategoryIsInRange(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  UIContentSizeCategoryClip(v5, a2, a3);
  NSComparisonResult v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v5, v6);

  return v7 == NSOrderedSame;
}

uint64_t SBUIUIFontForCoachingTextForContentSizeCategory(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F42A30], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E4F43870], 12, a1);
}

id SBUICurrentPreferredFontForCoachingText()
{
  uint64_t v0 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v1 = [v0 preferredContentSizeCategory];

  NSComparisonResult v2 = objc_msgSend(MEMORY[0x1E4F42A30], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E4F43870], 12, v1);

  return v2;
}

uint64_t SBUICeilingCapHeightForCoachingTextForUIContentSizeCategory(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F42D90];
  id v2 = a1;
  uint64_t v3 = [v1 mainScreen];
  [v3 scale];

  NSComparisonResult v4 = objc_msgSend(MEMORY[0x1E4F42A30], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E4F43870], 12, v2);

  [v4 capHeight];
  return BSFloatRoundForScale();
}

uint64_t SBUIBytesPerPixelForMetalPixelFormat(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 4;
  switch(v1)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 79:
    case 80:
      uint64_t result = 8;
      break;
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 59:
    case 61:
    case 62:
    case 63:
    case 64:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
      uint64_t result = 16;
      break;
    case 39:
    case 40:
    case 42:
      uint64_t result = 5;
      break;
    case 41:
      return result;
    case 52:
    case 53:
    case 54:
    case 102:
    case 103:
    case 104:
    case 122:
    case 123:
    case 124:
      uint64_t result = 32;
      break;
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
      uint64_t result = 10;
      break;
    default:
      SBUIBytesPerPixelForMetalPixelFormat_cold_1();
  }
  return result;
}

uint64_t SBUIBitsPerComponentForMTLPixelFormat(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 4;
  switch(v1)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 79:
    case 80:
      uint64_t result = 8;
      break;
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 59:
    case 61:
    case 62:
    case 63:
    case 64:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
      uint64_t result = 16;
      break;
    case 39:
    case 40:
    case 42:
      uint64_t result = 5;
      break;
    case 41:
      return result;
    case 52:
    case 53:
    case 54:
    case 102:
    case 103:
    case 104:
    case 122:
    case 123:
    case 124:
      uint64_t result = 32;
      break;
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
      uint64_t result = 10;
      break;
    default:
      SBUIBitsPerComponentForMTLPixelFormat_cold_1();
  }
  return result;
}

uint64_t UIImageCreateFromMTLPixelFormat(unint64_t a1, char a2, void *a3, void *a4, void *a5, double a6, double a7, double a8)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id Data = a3;
  CGRect v15 = a4;
  id v46 = a5;
  uint64_t v16 = MEMORY[0x1AD0CEF60]();
  float v17 = a6 * a8;
  size_t v18 = vcvtps_u32_f32(v17);
  unint64_t v19 = UIImageBytesNeeded(a1, a6, a7, a8);
  unsigned int v20 = SBUIBitsPerComponentForMTLPixelFormat(a1);
  size_t v21 = SBUIBytesPerPixelForMetalPixelFormat(a1) * v20;
  uint64_t bytesPerRow = CGBitmapGetAlignedBytesPerRow();
  space = SBUIColorSpaceFromPixelFormat(a1);
  int v22 = 7;
  switch(a1)
  {
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6FuLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
      goto LABEL_9;
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
      goto LABEL_2;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x28uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
      int v22 = 4096;
      goto LABEL_18;
    case 0x19uLL:
    case 0x41uLL:
      int v22 = 4352;
      goto LABEL_18;
    case 0x29uLL:
    case 0x2AuLL:
      int v22 = 4098;
      goto LABEL_18;
    case 0x2BuLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x72uLL:
      int v22 = 4097;
      goto LABEL_18;
    case 0x35uLL:
    case 0x36uLL:
    case 0x67uLL:
    case 0x68uLL:
      goto LABEL_10;
    case 0x37uLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x69uLL:
    case 0x7BuLL:
    case 0x7CuLL:
      int v22 = 8448;
      goto LABEL_18;
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
      int v22 = 1;
      goto LABEL_18;
    case 0x50uLL:
    case 0x51uLL:
      int v22 = 8194;
      goto LABEL_18;
    case 0x5AuLL:
    case 0x5BuLL:
      int v22 = 204801;
      goto LABEL_18;
    case 0x5EuLL:
      int v22 = 16385;
      goto LABEL_18;
    case 0x73uLL:
      int v22 = 4353;
      goto LABEL_18;
    case 0x7DuLL:
      int v22 = 8449;
      goto LABEL_18;
    default:
      if (a1 == 252)
      {
LABEL_10:
        int v22 = 0x2000;
      }
      else
      {
        if (a1 != 253) {
LABEL_9:
        }
          UIImageCreateFromMTLPixelFormat_cold_1();
LABEL_2:
        int v22 = 0;
      }
LABEL_18:
      size_t bitsPerPixel = v21;
      context = (void *)v16;
      float v23 = a7 * a8;
      size_t v24 = vcvtps_u32_f32(v23);
      if (Data)
      {
        CGFloat v25 = v15;
        double v26 = Data;
        unint64_t v27 = [Data slotLength];
        if (v19 > v27)
        {
          unint64_t v39 = v27;
          uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
          id v42 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage * _Nonnull UIImageCreateFromMTLPixelFormat(CGSize, CGFloat, MTLPixelFormat, CGImageAlphaInfo, CPMemoryPool *__strong _Nullable, __strong SBUIGraphicsDrawBlock _Nonnull, __strong SBUIGraphicsCreateImageBlock _Nullable)");
          id v40 = NSStringFromMTLPixelFormat(a1);
          v54.width = a6;
          v54.height = a7;
          unint64_t v41 = NSStringFromCGSize(v54);
          [v43 handleFailureInFunction:v42, @"SBUIMetalHelpers.m", 369, @"requested slot length (%zd) larger than maximum slotLength (%zd), not large enough for %@ context with dimensions %@ @%fx", v19, v39, v40, v41, *(void *)&a8 file lineNumber description];
        }
        id Data = (id)CGBitmapAllocateData();
        CGRect v15 = v25;
      }
      else
      {
        double v26 = 0;
      }
      uint32_t v28 = v22 | a2 & 0x1F;
      size_t v29 = v20;
      double v30 = CGBitmapContextCreate(Data, v18, v24, v20, bytesPerRow, space, v28);
      v55.size.width = (double)v18;
      v55.origin.x = 0.0;
      v55.origin.y = 0.0;
      v55.size.height = (double)v24;
      CGContextClearRect(v30, v55);
      if (v15)
      {
        CGContextTranslateCTM(v30, 0.0, (double)v24);
        CGContextScaleCTM(v30, a8, -a8);
        CGContextGetCTM(&v51, v30);
        CGContextSetBaseCTM();
        UIGraphicsPushContext(v30);
        v15[2](v15);
        UIGraphicsPopContext();
      }
      uint64_t v48 = v15;
      if (Data)
      {
        CFDataRef v31 = [v26 nextSlotWithBytes:Data length:v19];
        v32 = CGDataProviderCreateWithCFData(v31);
        if (_MTLPixeLFormatIsSingleComponent(a1))
        {
          *(_OWORD *)decode = xmmword_1A76A5840;
          CGImageRef v33 = CGImageMaskCreate(v18, v24, v29, bitsPerPixel, bytesPerRow, v32, decode, 0);
        }
        else
        {
          CGImageRef v33 = CGImageCreate(v18, v24, v29, bitsPerPixel, bytesPerRow, space, v28, v32, 0, 0, kCGRenderingIntentDefault);
        }
        Image = v33;
        v35 = (void (**)(void, void, void, double))v46;
        CGDataProviderRelease(v32);
        CGBitmapFreeData();

        if (v46) {
          goto LABEL_32;
        }
LABEL_29:
        uint64_t v36 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:a8];
        goto LABEL_33;
      }
      Image = CGBitmapContextCreateImage(v30);
      v35 = (void (**)(void, void, void, double))v46;
      if (!v46) {
        goto LABEL_29;
      }
LABEL_32:
      uint64_t v36 = ((void (**)(void, CGImage *, void, double))v35)[2](v35, Image, 0, a8);
LABEL_33:
      uint64_t v37 = v36;
      CGImageRelease(Image);
      CGColorSpaceRelease(space);
      CGContextRelease(v30);

      return v37;
  }
}

uint64_t UIImageBytesNeeded(uint64_t a1, double a2, double a3, double a4)
{
  float v5 = a3 * a4;
  unint64_t v6 = vcvtps_u32_f32(v5);
  SBUIBitsPerComponentForMTLPixelFormat(a1);
  SBUIBytesPerPixelForMetalPixelFormat(a1);
  return CGBitmapGetAlignedBytesPerRow() * v6;
}

CGColorSpaceRef SBUIColorSpaceFromPixelFormat(uint64_t a1)
{
  if ((unint64_t)(a1 - 10) <= 0x3D)
  {
    if (((1 << (a1 - 10)) & 0x200000008009) != 0) {
      return CGColorSpaceCreateDeviceGray();
    }
    if (a1 == 71) {
      return CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    }
  }
  if ((unint64_t)(a1 - 252) < 2) {
    return CGColorSpaceCreateDeviceGray();
  }
  if (a1 == 81) {
    return CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  }
  else {
    return CGColorSpaceCreateDeviceRGB();
  }
}

__CFString *NSStringFromMTLPixelFormat(uint64_t a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      uint64_t result = @"MTLPixelFormatInvalid";
      break;
    case 1:
      uint64_t result = @"MTLPixelFormatA8Unorm";
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 21:
    case 26:
    case 27:
    case 28:
    case 29:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 56:
    case 57:
    case 58:
    case 59:
    case 61:
    case 66:
    case 67:
    case 68:
    case 69:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 106:
    case 107:
    case 108:
    case 109:
    case 111:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 168:
    case 169:
    case 171:
    case 173:
    case 175:
    case 177:
    case 184:
    case 185:
    case 191:
    case 201:
    case 202:
    case 203:
    case 209:
    case 219:
    case 220:
    case 221:
    case 227:
    case 237:
    case 238:
    case 239:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 249:
    case 251:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 259:
      return result;
    case 10:
      uint64_t result = @"MTLPixelFormatR8Unorm";
      break;
    case 11:
      uint64_t result = @"MTLPixelFormatR8Unorm_sRGB";
      break;
    case 12:
      uint64_t result = @"MTLPixelFormatR8Snorm";
      break;
    case 13:
      uint64_t result = @"MTLPixelFormatR8Uint";
      break;
    case 14:
      uint64_t result = @"MTLPixelFormatR8Sint";
      break;
    case 20:
      uint64_t result = @"MTLPixelFormatR16Unorm";
      break;
    case 22:
      uint64_t result = @"MTLPixelFormatR16Snorm";
      break;
    case 23:
      uint64_t result = @"MTLPixelFormatR16Uint";
      break;
    case 24:
      uint64_t result = @"MTLPixelFormatR16Sint";
      break;
    case 25:
      uint64_t result = @"MTLPixelFormatR16Float";
      break;
    case 30:
      uint64_t result = @"MTLPixelFormatRG8Unorm";
      break;
    case 31:
      uint64_t result = @"MTLPixelFormatRG8Unorm_sRGB";
      break;
    case 32:
      uint64_t result = @"MTLPixelFormatRG8Snorm";
      break;
    case 33:
      uint64_t result = @"MTLPixelFormatRG8Uint";
      break;
    case 34:
      uint64_t result = @"MTLPixelFormatRG8Sint";
      break;
    case 40:
      uint64_t result = @"MTLPixelFormatB5G6R5Unorm";
      break;
    case 41:
      uint64_t result = @"MTLPixelFormatA1BGR5Unorm";
      break;
    case 42:
      uint64_t result = @"MTLPixelFormatABGR4Unorm";
      break;
    case 43:
      uint64_t result = @"MTLPixelFormatBGR5A1Unorm";
      break;
    case 53:
      uint64_t result = @"MTLPixelFormatR32Uint";
      break;
    case 54:
      uint64_t result = @"MTLPixelFormatR32Sint";
      break;
    case 55:
      uint64_t result = @"MTLPixelFormatR32Float";
      break;
    case 60:
      uint64_t result = @"MTLPixelFormatRG16Unorm";
      break;
    case 62:
      uint64_t result = @"MTLPixelFormatRG16Snorm";
      break;
    case 63:
      uint64_t result = @"MTLPixelFormatRG16Uint";
      break;
    case 64:
      uint64_t result = @"MTLPixelFormatRG16Sint";
      break;
    case 65:
      uint64_t result = @"MTLPixelFormatRG16Float";
      break;
    case 70:
      uint64_t result = @"MTLPixelFormatRGBA8Unorm";
      break;
    case 71:
      uint64_t result = @"MTLPixelFormatRGBA8Unorm_sRGB";
      break;
    case 72:
      uint64_t result = @"MTLPixelFormatRGBA8Snorm";
      break;
    case 73:
      uint64_t result = @"MTLPixelFormatRGBA8Uint";
      break;
    case 74:
      uint64_t result = @"MTLPixelFormatRGBA8Sint";
      break;
    case 80:
      uint64_t result = @"MTLPixelFormatBGRA8Unorm";
      break;
    case 81:
      uint64_t result = @"MTLPixelFormatBGRA8Unorm_sRGB";
      break;
    case 90:
      uint64_t result = @"MTLPixelFormatRGB10A2Unorm";
      break;
    case 91:
      uint64_t result = @"MTLPixelFormatRGB10A2Uint";
      break;
    case 92:
      uint64_t result = @"MTLPixelFormatRG11B10Float";
      break;
    case 93:
      uint64_t result = @"MTLPixelFormatRGB9E5Float";
      break;
    case 94:
      uint64_t result = @"MTLPixelFormatBGR10A2Unorm";
      break;
    case 103:
      uint64_t result = @"MTLPixelFormatRG32Uint";
      break;
    case 104:
      uint64_t result = @"MTLPixelFormatRG32Sint";
      break;
    case 105:
      uint64_t result = @"MTLPixelFormatRG32Float";
      break;
    case 110:
      uint64_t result = @"MTLPixelFormatRGBA16Unorm";
      break;
    case 112:
      uint64_t result = @"MTLPixelFormatRGBA16Snorm";
      break;
    case 113:
      uint64_t result = @"MTLPixelFormatRGBA16Uint";
      break;
    case 114:
      uint64_t result = @"MTLPixelFormatRGBA16Sint";
      break;
    case 115:
      uint64_t result = @"MTLPixelFormatRGBA16Float";
      break;
    case 123:
      uint64_t result = @"MTLPixelFormatRGBA32Uint";
      break;
    case 124:
      uint64_t result = @"MTLPixelFormatRGBA32Sint";
      break;
    case 125:
      uint64_t result = @"MTLPixelFormatRGBA32Float";
      break;
    case 160:
      uint64_t result = @"MTLPixelFormatPVRTC_RGB_2BPP";
      break;
    case 161:
      uint64_t result = @"MTLPixelFormatPVRTC_RGB_2BPP_sRGB";
      break;
    case 162:
      uint64_t result = @"MTLPixelFormatPVRTC_RGB_4BPP";
      break;
    case 163:
      uint64_t result = @"MTLPixelFormatPVRTC_RGB_4BPP_sRGB";
      break;
    case 164:
      uint64_t result = @"MTLPixelFormatPVRTC_RGBA_2BPP";
      break;
    case 165:
      uint64_t result = @"MTLPixelFormatPVRTC_RGBA_2BPP_sRGB";
      break;
    case 166:
      uint64_t result = @"MTLPixelFormatPVRTC_RGBA_4BPP";
      break;
    case 167:
      uint64_t result = @"MTLPixelFormatPVRTC_RGBA_4BPP_sRGB";
      break;
    case 170:
      uint64_t result = @"MTLPixelFormatEAC_R11Unorm";
      break;
    case 172:
      uint64_t result = @"MTLPixelFormatEAC_R11Snorm";
      break;
    case 174:
      uint64_t result = @"MTLPixelFormatEAC_RG11Unorm";
      break;
    case 176:
      uint64_t result = @"MTLPixelFormatEAC_RG11Snorm";
      break;
    case 178:
      uint64_t result = @"MTLPixelFormatEAC_RGBA8";
      break;
    case 179:
      uint64_t result = @"MTLPixelFormatEAC_RGBA8_sRGB";
      break;
    case 180:
      uint64_t result = @"MTLPixelFormatETC2_RGB8";
      break;
    case 181:
      uint64_t result = @"MTLPixelFormatETC2_RGB8_sRGB";
      break;
    case 182:
      uint64_t result = @"MTLPixelFormatETC2_RGB8A1";
      break;
    case 183:
      uint64_t result = @"MTLPixelFormatETC2_RGB8A1_sRGB";
      break;
    case 186:
      uint64_t result = @"MTLPixelFormatASTC_4x4_sRGB";
      break;
    case 187:
      uint64_t result = @"MTLPixelFormatASTC_5x4_sRGB";
      break;
    case 188:
      uint64_t result = @"MTLPixelFormatASTC_5x5_sRGB";
      break;
    case 189:
      uint64_t result = @"MTLPixelFormatASTC_6x5_sRGB";
      break;
    case 190:
      uint64_t result = @"MTLPixelFormatASTC_6x6_sRGB";
      break;
    case 192:
      uint64_t result = @"MTLPixelFormatASTC_8x5_sRGB";
      break;
    case 193:
      uint64_t result = @"MTLPixelFormatASTC_8x6_sRGB";
      break;
    case 194:
      uint64_t result = @"MTLPixelFormatASTC_8x8_sRGB";
      break;
    case 195:
      uint64_t result = @"MTLPixelFormatASTC_10x5_sRGB";
      break;
    case 196:
      uint64_t result = @"MTLPixelFormatASTC_10x6_sRGB";
      break;
    case 197:
      uint64_t result = @"MTLPixelFormatASTC_10x8_sRGB";
      break;
    case 198:
      uint64_t result = @"MTLPixelFormatASTC_10x10_sRGB";
      break;
    case 199:
      uint64_t result = @"MTLPixelFormatASTC_12x10_sRGB";
      break;
    case 200:
      uint64_t result = @"MTLPixelFormatASTC_12x12_sRGB";
      break;
    case 204:
      uint64_t result = @"MTLPixelFormatASTC_4x4_LDR";
      break;
    case 205:
      uint64_t result = @"MTLPixelFormatASTC_5x4_LDR";
      break;
    case 206:
      uint64_t result = @"MTLPixelFormatASTC_5x5_LDR";
      break;
    case 207:
      uint64_t result = @"MTLPixelFormatASTC_6x5_LDR";
      break;
    case 208:
      uint64_t result = @"MTLPixelFormatASTC_6x6_LDR";
      break;
    case 210:
      uint64_t result = @"MTLPixelFormatASTC_8x5_LDR";
      break;
    case 211:
      uint64_t result = @"MTLPixelFormatASTC_8x6_LDR";
      break;
    case 212:
      uint64_t result = @"MTLPixelFormatASTC_8x8_LDR";
      break;
    case 213:
      uint64_t result = @"MTLPixelFormatASTC_10x5_LDR";
      break;
    case 214:
      uint64_t result = @"MTLPixelFormatASTC_10x6_LDR";
      break;
    case 215:
      uint64_t result = @"MTLPixelFormatASTC_10x8_LDR";
      break;
    case 216:
      uint64_t result = @"MTLPixelFormatASTC_10x10_LDR";
      break;
    case 217:
      uint64_t result = @"MTLPixelFormatASTC_12x10_LDR";
      break;
    case 218:
      uint64_t result = @"MTLPixelFormatASTC_12x12_LDR";
      break;
    case 222:
      uint64_t result = @"MTLPixelFormatASTC_4x4_HDR";
      break;
    case 223:
      uint64_t result = @"MTLPixelFormatASTC_5x4_HDR";
      break;
    case 224:
      uint64_t result = @"MTLPixelFormatASTC_5x5_HDR";
      break;
    case 225:
      uint64_t result = @"MTLPixelFormatASTC_6x5_HDR";
      break;
    case 226:
      uint64_t result = @"MTLPixelFormatASTC_6x6_HDR";
      break;
    case 228:
      uint64_t result = @"MTLPixelFormatASTC_8x5_HDR";
      break;
    case 229:
      uint64_t result = @"MTLPixelFormatASTC_8x6_HDR";
      break;
    case 230:
      uint64_t result = @"MTLPixelFormatASTC_8x8_HDR";
      break;
    case 231:
      uint64_t result = @"MTLPixelFormatASTC_10x5_HDR";
      break;
    case 232:
      uint64_t result = @"MTLPixelFormatASTC_10x6_HDR";
      break;
    case 233:
      uint64_t result = @"MTLPixelFormatASTC_10x8_HDR";
      break;
    case 234:
      uint64_t result = @"MTLPixelFormatASTC_10x10_HDR";
      break;
    case 235:
      uint64_t result = @"MTLPixelFormatASTC_12x10_HDR";
      break;
    case 236:
      uint64_t result = @"MTLPixelFormatASTC_12x12_HDR";
      break;
    case 240:
      uint64_t result = @"MTLPixelFormatGBGR422";
      break;
    case 241:
      uint64_t result = @"MTLPixelFormatBGRG422";
      break;
    case 250:
      uint64_t result = @"MTLPixelFormatDepth16Unorm";
      break;
    case 252:
      uint64_t result = @"MTLPixelFormatDepth32Float";
      break;
    case 253:
      uint64_t result = @"MTLPixelFormatStencil8";
      break;
    case 260:
      uint64_t result = @"MTLPixelFormatDepth32Float_Stencil8";
      break;
    case 261:
      uint64_t result = @"MTLPixelFormatX32_Stencil8";
      break;
    default:
      switch(a1)
      {
        case 552:
          uint64_t result = @"MTLPixelFormatBGRA10_XR";
          break;
        case 553:
          uint64_t result = @"MTLPixelFormatBGRA10_XR_sRGB";
          break;
        case 554:
          uint64_t result = @"MTLPixelFormatBGR10_XR";
          break;
        case 555:
          uint64_t result = @"MTLPixelFormatBGR10_XR_sRGB";
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

BOOL _MTLPixeLFormatIsSingleComponent(unint64_t a1)
{
  BOOL result = 1;
  if (a1 > 0x37 || ((1 << a1) & 0x80000002002400) == 0) {
    return a1 - 252 < 2;
  }
  return result;
}

uint64_t SBUIMetalPixelFormatForCGImage(CGImage *a1, int *a2)
{
  __int16 BitmapInfo = CGImageGetBitmapInfo(a1);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(a1);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  int v7 = BitmapInfo & 0x1B;
  BOOL v8 = (BitmapInfo & 0x1F) == 7 && (BitmapInfo & 0x1B) != 1;
  BOOL v9 = v7 != 2 && (BitmapInfo & 0x1B) == 1;
  if (v7 == 2) {
    BOOL v8 = 0;
  }
  BOOL v10 = v7 == 2;
  BOOL v11 = (BitmapInfo & 0x3000) != 0 && v10;
  BOOL v12 = (BitmapInfo & 0x3000) == 0 && v10;
  BOOL v13 = (BitmapInfo & 0x3000) != 0 && v9;
  BOOL v14 = (BitmapInfo & 0x3000) == 0 && v9;
  unint64_t v15 = (BitsPerPixel + BitsPerComponent - 1) / BitsPerComponent;
  if ((BitmapInfo & 0x100) != 0)
  {
    if (v15 == 4)
    {
      int v19 = 0;
      if (BitsPerComponent == 16)
      {
        uint64_t v18 = 115;
        goto LABEL_68;
      }
      if (BitsPerComponent == 32)
      {
        int v19 = 0;
        uint64_t v18 = 125;
        goto LABEL_68;
      }
      goto LABEL_66;
    }
LABEL_46:
    uint64_t v18 = 0;
    int v19 = 0;
    goto LABEL_67;
  }
  if (BitsPerComponent == 8)
  {
    switch(v15)
    {
      case 4uLL:
        if (v11) {
          uint64_t v18 = 80;
        }
        else {
          uint64_t v18 = 70;
        }
        if (v11 || v14)
        {
          int v19 = 0;
        }
        else
        {
          if (v13) {
            int v19 = 2;
          }
          else {
            int v19 = 0;
          }
          if (v13) {
            uint64_t v18 = 80;
          }
          else {
            uint64_t v18 = 0;
          }
          if (v13 || !v12)
          {
            if (!v13) {
              goto LABEL_67;
            }
          }
          else
          {
            int v19 = 1;
            uint64_t v18 = 70;
          }
        }
        goto LABEL_68;
      case 2uLL:
        int v19 = 8;
        uint64_t v18 = 30;
        goto LABEL_68;
      case 1uLL:
        if (v8) {
          int v19 = 0;
        }
        else {
          int v19 = 4;
        }
        if (v8) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = 10;
        }
        goto LABEL_68;
    }
    goto LABEL_46;
  }
  if (BitsPerComponent == 5)
  {
    BOOL v16 = v15 != 4;
    char v17 = v15 != 4 || v11;
    if (v15 == 4) {
      uint64_t v18 = 43;
    }
    else {
      uint64_t v18 = 0;
    }
    int v19 = 0;
    if ((v17 & 1) == 0)
    {
      if (v13)
      {
        uint64_t v18 = 41;
        goto LABEL_68;
      }
LABEL_66:
      uint64_t v18 = 0;
      goto LABEL_67;
    }
  }
  else
  {
    BOOL v20 = BitsPerComponent == 16 && v15 == 4;
    BOOL v16 = !v20;
    int v21 = !v20 || v14;
    char v22 = v21 | v12;
    if (v20) {
      uint64_t v18 = 110;
    }
    else {
      uint64_t v18 = 0;
    }
    if ((v22 & 1) == 0)
    {
      int v19 = 0;
      if (v13)
      {
        uint64_t v18 = 110;
        goto LABEL_68;
      }
      goto LABEL_66;
    }
    int v19 = v21 ^ 1;
  }
  if (v16) {
LABEL_67:
  }
    NSLog(&cfstr_NoMatchingMtlp.isa, a1);
LABEL_68:
  if (a2) {
    *a2 = v19;
  }
  return v18;
}

BOOL SBLockOverlayStyleIsOpaque(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

void _PowerChanged(int a1, int a2, uint64_t a3, intptr_t notificationID)
{
  if (a3 == -536870288 || a3 == -536870272)
  {
    io_connect_t v5 = __SBUIBiometricEMRootDomainConnect;
    IOAllowPowerChange(v5, notificationID);
  }
  else if (a3 == -536870112)
  {
    id v6 = +[SBUIBiometricResource sharedInstance];
    [v6 _deviceWillWake];
  }
}

void sub_1A766EDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A766F168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A766F364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A766F544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL SBUIProudLockContainerViewControllerConfigurationEqualToConfiguration(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
      && *((unsigned __int8 *)a1 + 1) == *((unsigned __int8 *)a2 + 1)
      && vabdd_f64(a1[1], a2[1]) < 2.22044605e-16
      && vabdd_f64(a1[3], a2[3]) < 2.22044605e-16
      && vabdd_f64(a1[4], a2[4]) < 2.22044605e-16
      && vabdd_f64(a1[6], a2[6]) < 2.22044605e-16
      && vabdd_f64(a1[7], a2[7]) < 2.22044605e-16
      && *((unsigned __int8 *)a1 + 64) == *((unsigned __int8 *)a2 + 64)
      && *((unsigned __int8 *)a1 + 65) == *((unsigned __int8 *)a2 + 65)
      && vabdd_f64(a1[5], a2[5]) < 2.22044605e-16
      && *((unsigned __int8 *)a1 + 66) == *((unsigned __int8 *)a2 + 66)
      && *((void *)a1 + 9) == *((void *)a2 + 9);
}

uint64_t SBUIProudLockContainerViewControllerConfigurationDefault@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x410], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = 0x3FF3333333333333;
  *(unsigned char *)(a1 + 16) = 1;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x3FE999999999999AuLL);
  *(_OWORD *)(a1 + 40) = xmmword_1A76A5A50;
  *(void *)(a1 + 56) = 0x4008000000000000;
  char v2 = 0;
  uint64_t result = SBFEffectiveArtworkSubtype();
  if (result > 2795)
  {
    if (result != 2796 && result != 2868) {
      goto LABEL_7;
    }
  }
  else if (result != 2556 && result != 2622)
  {
LABEL_7:
    char v2 = 1;
  }
  *(unsigned char *)(a1 + 64) = v2;
  *(_WORD *)(a1 + 65) = 0;
  *(void *)(a1 + 72) = 0;
  return result;
}

uint64_t SBSUIWallpaperSetImageAsWallpaperForLocations(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA6078];
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v8 = a1;
  uint64_t v9 = objc_msgSend(v3, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:", 0, 1, 1, 0, 1.0, 1.0, v4, v5, v6, v7, 0.0);
  uint64_t v10 = _SBSUIWallpaperSetImageWithoutCheckingMC(v8, v9, a2);

  return v10;
}

uint64_t _SBSUIWallpaperSetImageWithoutCheckingMC(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  double v7 = [v6 name];
  if ([v7 length])
  {
    id v8 = [v6 name];
    int v9 = [v8 intValue];

    if (v9 <= 49)
    {
      uint64_t v10 = SBLogWallpaper();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        _SBSUIWallpaperSetImageWithoutCheckingMC_cold_1(v6);
      }

      BOOL v11 = SBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v14 = 0;
        _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_INFO, "You're trying to set a wallpaper with a name that doesn't start with a >50 number. This is wrong because we expect a number to be able to gather diagnostics.", v14, 2u);
      }

      __assert_rtn("_SBSUIWallpaperSetImageWithoutCheckingMC", "SBSUIWallpaperUtilities.m", 314, "0");
    }
  }
  else
  {
  }
  if (SBSUIWallpaperSetImageSurface(v5, v6, a3)) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = SBSUIWallpaperSetImageArchive(v5, v6);
  }

  return v12;
}

uint64_t SBSUIWallpaperSetImageArchive(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v3 setWallpaperStatus:1];
  uint64_t v5 = SBSUIWallpaperSetImageArchiveWithWallpaperMode(v4, v3);

  return v5;
}

uint64_t SBSUIWallpaperSetImageArchiveWithWallpaperMode(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(a1, "bs_secureEncoded");
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    [v3 cropRect];
    bzero(v12, 0x400uLL);
    double v7 = [v3 name];
    [v7 getCString:v12 maxLength:1024 encoding:4];

    id v8 = [v3 wallpaperKitData];
    if (v8)
    {
      int v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:0];
    }
    else
    {
      int v9 = 0;
    }
    SBSSpringBoardServerPort();
    [v3 parallaxFactor];
    [v3 zoomScale];
    [v3 supportsCropping];
    [v3 isPortrait];
    [v3 hasVideo];
    [v3 stillTimeInVideo];
    [v3 wallpaperMode];
    [v3 wallpaperStatus];
    id v10 = v9;
    [v10 bytes];
    [v10 length];
    SBSetWallpaperImageForLocations();
  }
  return 0;
}

uint64_t SBSUIWallpaperSetImagesArchive(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = SBLogWallpaper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v3 count];
    double v7 = PBUIStringForWallpaperLocations();
    id v8 = PBUIStringForWallpaperMode();
    *(_DWORD *)buf = 67240962;
    int v30 = v6;
    __int16 v31 = 2114;
    id v32 = v4;
    __int16 v33 = 2114;
    id v34 = v7;
    __int16 v35 = 2114;
    uint64_t v36 = v8;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Setting %{public}d archive images with options: %{public}@ for variant: %{public}@ with current wallpaper mode: %{public}@", buf, 0x26u);
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v9 = PBUIStringForWallpaperMode();
    uint64_t v10 = PBUIStringForWallpaperMode();
    BOOL v11 = [v3 objectForKeyedSubscript:v9];
    uint32_t v28 = (void *)v9;
    uint64_t v12 = [v4 objectForKeyedSubscript:v9];
    [v12 setWallpaperStatus:2];
    uint64_t v13 = SBSUIWallpaperSetImageArchiveWithWallpaperMode(v11, v12);
    BOOL v14 = [v3 objectForKeyedSubscript:v10];
    unint64_t v27 = (void *)v10;
    unint64_t v15 = [v4 objectForKeyedSubscript:v10];
    [v15 setWallpaperStatus:3];
    BOOL v16 = objc_msgSend(v14, "bs_secureEncoded");
    char v17 = v16;
    if (v16)
    {
      id v26 = v4;
      id v18 = v16;
      [v18 bytes];
      [v18 length];
      [v15 cropRect];
      bzero(buf, 0x400uLL);
      int v19 = [v15 name];
      [v19 getCString:buf maxLength:1024 encoding:4];

      uint64_t v20 = [v15 wallpaperKitData];
      CGFloat v25 = (void *)v20;
      if (v20)
      {
        int v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v20 format:200 options:0 error:0];
      }
      else
      {
        int v21 = 0;
      }
      SBSSpringBoardServerPort();
      [v15 parallaxFactor];
      [v15 zoomScale];
      [v15 supportsCropping];
      [v15 isPortrait];
      [v15 hasVideo];
      [v15 stillTimeInVideo];
      [v15 wallpaperMode];
      [v15 wallpaperStatus];
      id v23 = v21;
      [v23 bytes];
      [v23 length];
      SBSetWallpaperImageForLocations();

      id v4 = v26;
      uint64_t v13 = v13;
    }

    goto LABEL_13;
  }
  if ([v3 count] == 1)
  {
    char v22 = [v3 allKeys];
    BOOL v11 = [v22 firstObject];

    uint64_t v12 = [v3 objectForKeyedSubscript:v11];
    BOOL v14 = [v4 objectForKeyedSubscript:v11];
    [v14 setWallpaperMode:0];
    [v14 setWallpaperStatus:1];
    uint64_t v13 = SBSUIWallpaperSetImageArchive(v12, v14);
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

BOOL SBSUIWallpaperSetImageSurface(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  [v5 setWallpaperStatus:1];
  BOOL v7 = SBSUIWallpaperSetImageSurfaceWithWallpaperMode(v6, v5, a3, 0);

  return v7;
}

BOOL SBSUIWallpaperSetImageSurfaceWithWallpaperMode(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a2;
  id v8 = SBLogWallpaper();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543618;
    id v80 = v7;
    __int16 v81 = 2048;
    uint64_t v82 = a4;
    _os_signpost_emit_with_name_impl(&dword_1A7607000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SET_IMAGE_SURFACE", "Options: %{public}@, Mode: %ld", buf, 0x16u);
  }

  if (_os_feature_enabled_impl())
  {
    SBFCreateIOSurfaceForImage();
    uint64_t v9 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v77 = a4;
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(v9);
      uint64_t v12 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
      [v13 scale];
      BOOL v14 = objc_msgSend(v12, "sbf_imageWithIOSurface:scale:orientation:", v10, 0);

      unint64_t v15 = [MEMORY[0x1E4F42D90] mainScreen];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      uint64_t v20 = [MEMORY[0x1E4F42D90] mainScreen];
      [v20 scale];
      double v22 = v21;
      uint64_t v23 = PBUICurrentParallaxDeviceType();
      [v14 scale];
      objc_msgSend(v7, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", v23, v17, v19, v22, v24);

      [v7 cropRect];
      id v75 = v14;
      CGFloat v25 = objc_msgSend(v14, "sbf_cropImageWithRect:outputSize:");
      SBFCreateIOSurfaceForImage();
      id v26 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      unint64_t v27 = v26;
      if (v26)
      {
        xpc_object_t v72 = IOSurfaceCreateXPCObject(v26);
        v66 = v25;
        uint32_t v28 = objc_msgSend(v25, "pbui_CGImageBackedImage");
        size_t v29 = objc_msgSend(MEMORY[0x1E4F42A80], "pbui_thumbnailImageForImage:", v28);
        objc_msgSend(v29, "pbui_CGImageBackedImage");
        int v30 = (UIImage *)objc_claimAutoreleasedReturnValue();

        v69 = v30;
        if (v30)
        {
          v67 = UIImageJPEGRepresentation(v30, 0.8);
        }
        else
        {
          v67 = 0;
        }
        v70 = v28;
        id v74 = v6;
        CGRect v55 = objc_msgSend(v28, "sbf_imageHashData");
        v56 = SBLogWallpaper();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v80 = v7;
          _os_log_impl(&dword_1A7607000, v56, OS_LOG_TYPE_DEFAULT, "SETTING WALLPAPER: %{public}@", buf, 0xCu);
        }

        v57 = PBUIStringForWallpaperLocations();
        v58 = PBUIStringForWallpaperMode();
        BOOL v34 = +[SBSUIWallpaperService setWallpaperImage:XPCObject adjustedImage:v72 thumbnailData:v67 imageHashData:v55 wallpaperOptions:v7 forLocations:v57 currentWallpaperMode:v58];

        a4 = v77;
        id v6 = v74;
        CGFloat v25 = v66;
      }
      else
      {
        BOOL v34 = 0;
        a4 = v77;
      }
    }
    else
    {
      BOOL v34 = 0;
    }
    v59 = SBLogWallpaper();
    if (os_signpost_enabled(v59))
    {
      *(_DWORD *)buf = 138543618;
      id v80 = v7;
      __int16 v81 = 2048;
      uint64_t v82 = a4;
      _os_signpost_emit_with_name_impl(&dword_1A7607000, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_SET_IMAGE_SURFACE", "Options: %{public}@, Mode: %ld", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v78 = a4;
    SBFCreateIOSurfaceForImage();
    __int16 v31 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      [v7 cropRect];
      bzero(buf, 0x400uLL);
      id v32 = [v7 name];
      [v32 getCString:buf maxLength:1024 encoding:4];

      __int16 v33 = [v7 wallpaperKitData];
      if (v33)
      {
        id v76 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v33 format:200 options:0 error:0];
      }
      else
      {
        id v76 = 0;
      }
      IOSurfaceCreateMachPort(v31);
      __int16 v35 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v36 = [MEMORY[0x1E4F42D90] mainScreen];
      [v36 scale];
      uint64_t v37 = objc_msgSend(v35, "sbf_imageWithIOSurface:scale:orientation:", v31, 0);

      v38 = [MEMORY[0x1E4F42D90] mainScreen];
      [v38 bounds];
      double v40 = v39;
      double v42 = v41;
      uint64_t v43 = [MEMORY[0x1E4F42D90] mainScreen];
      [v43 scale];
      double v45 = v44;
      uint64_t v46 = PBUICurrentParallaxDeviceType();
      [v37 scale];
      objc_msgSend(v7, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", v46, v40, v42, v45, v47);

      [v7 cropRect];
      v73 = v37;
      uint64_t v48 = objc_msgSend(v37, "sbf_cropImageWithRect:outputSize:");
      SBFCreateIOSurfaceForImage();
      v49 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      uint64_t v50 = v49;
      if (v49)
      {
        IOSurfaceCreateMachPort(v49);
        v68 = v48;
        CGAffineTransform v51 = objc_msgSend(v48, "pbui_CGImageBackedImage");
        v52 = objc_msgSend(MEMORY[0x1E4F42A80], "pbui_thumbnailImageForImage:", v51);
        objc_msgSend(v52, "pbui_CGImageBackedImage");
        uint64_t v53 = (UIImage *)objc_claimAutoreleasedReturnValue();

        v71 = v31;
        v65 = v53;
        if (v53)
        {
          CGSize v54 = UIImageJPEGRepresentation(v53, 0.8);
        }
        else
        {
          CGSize v54 = 0;
        }
        id v60 = v54;
        [v60 bytes];
        [v60 length];
        objc_msgSend(v51, "sbf_imageHashData");
        id v61 = objc_claimAutoreleasedReturnValue();
        [v61 bytes];
        [v61 length];
        SBSSpringBoardServerPort();
        [v7 parallaxFactor];
        [v7 zoomScale];
        [v7 supportsCropping];
        [v7 isPortrait];
        [v7 hasVideo];
        [v7 stillTimeInVideo];
        [v7 wallpaperMode];
        [v7 wallpaperStatus];
        id v62 = v76;
        [v62 bytes];
        [v62 length];
        SBSetWallpaperImageSurfaceForLocations();
        BSMachSendRightRelease();

        __int16 v31 = v71;
        uint64_t v48 = v68;
      }
      BSMachSendRightRelease();
    }
    v63 = SBLogWallpaper();
    if (os_signpost_enabled(v63))
    {
      *(_DWORD *)buf = 138543618;
      id v80 = v7;
      __int16 v81 = 2048;
      uint64_t v82 = v78;
      _os_signpost_emit_with_name_impl(&dword_1A7607000, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_SET_IMAGE_SURFACE", "Options: %{public}@, Mode: %ld", buf, 0x16u);
    }

    BOOL v34 = 0;
  }

  return v34;
}

BOOL SBSUIWallpaperSetImagesSurface(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = SBLogWallpaper();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v7 count];
    BOOL v11 = PBUIStringForWallpaperLocations();
    uint64_t v12 = PBUIStringForWallpaperMode();
    *(_DWORD *)buf = 67240962;
    int v27 = v10;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2114;
    __int16 v31 = v11;
    __int16 v32 = 2114;
    __int16 v33 = v12;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_DEFAULT, "Setting %{public}d surface images with options: %{public}@ for variant: %{public}@ with current wallpaper mode: %{public}@", buf, 0x26u);
  }
  if ((unint64_t)[v7 count] < 2)
  {
    if ([v7 count] != 1)
    {
      BOOL v17 = 0;
      goto LABEL_9;
    }
    [v7 allKeys];
    double v21 = v8;
    v23 = uint64_t v22 = a3;
    unint64_t v15 = [v23 firstObject];

    double v16 = [v7 objectForKeyedSubscript:v15];
    id v25 = v21;
    double v18 = [v21 objectForKeyedSubscript:v15];
    [v18 setWallpaperMode:0];
    [v18 setWallpaperStatus:1];
    BOOL v17 = SBSUIWallpaperSetImageSurface(v16, v18, v22);
  }
  else
  {
    uint64_t v13 = PBUIStringForWallpaperMode();
    BOOL v14 = PBUIStringForWallpaperMode();
    unint64_t v15 = [v7 objectForKeyedSubscript:v13];
    double v16 = [v8 objectForKeyedSubscript:v13];
    [v16 setWallpaperStatus:2];
    BOOL v17 = SBSUIWallpaperSetImageSurfaceWithWallpaperMode(v15, v16, a3, a4);
    double v18 = [v7 objectForKeyedSubscript:v14];
    id v25 = v8;
    [v8 objectForKeyedSubscript:v14];
    v20 = uint64_t v19 = a3;
    [v20 setWallpaperStatus:3];
    SBSUIWallpaperSetImageSurfaceWithWallpaperMode(v18, v20, v19, a4);
  }
  id v8 = v25;
LABEL_9:

  return v17;
}

uint64_t _SBSUIWallpaperSetImagesWithoutCheckingMC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = a2;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        BOOL v14 = [v8 objectForKeyedSubscript:v13];
        unint64_t v15 = [v14 name];

        if ([v15 length] && (int)objc_msgSend(v15, "intValue") <= 49)
        {
          double v18 = SBLogWallpaper();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            _SBSUIWallpaperSetImagesWithoutCheckingMC_cold_1((uint64_t)v15, v13, v18);
          }

          uint64_t v19 = SBLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl(&dword_1A7607000, v19, OS_LOG_TYPE_INFO, "You're trying to set a wallpaper with a name that doesn't start with a >50 number. This is wrong because we expect a number to be able to gather diagnostics.", v20, 2u);
          }

          __assert_rtn("_SBSUIWallpaperSetImagesWithoutCheckingMC", "SBSUIWallpaperUtilities.m", 333, "0");
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  if (SBSUIWallpaperSetImagesSurface(v7, v8, a3, a4)) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = SBSUIWallpaperSetImagesArchive(v7, v8);
  }

  return v16;
}

uint64_t SBSUIWallpaperSetImage(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [MEMORY[0x1E4F74230] sharedConnection];
  int v8 = [v7 isWallpaperModificationAllowed];

  if (v8) {
    uint64_t v9 = _SBSUIWallpaperSetImageWithoutCheckingMC(v5, v6, a3);
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t SBSUIWallpaperSetImages(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = [MEMORY[0x1E4F74230] sharedConnection];
  int v10 = [v9 isWallpaperModificationAllowed];

  if (v10) {
    uint64_t v11 = _SBSUIWallpaperSetImagesWithoutCheckingMC(v7, v8, a3, a4);
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t SBSUIWallpaperSetImagesAndVideos(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = a4;
  id v13 = v11;
  BOOL v14 = (void *)os_transaction_create();
  if (a5 == 1) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  uint64_t v16 = PBUIStringForWallpaperMode();
  BOOL v17 = PBUIStringForWallpaperMode();
  double v18 = [v13 objectForKeyedSubscript:v16];
  [v18 setWallpaperStatus:2];
  v71 = [v13 objectForKeyedSubscript:v17];
  [v71 setWallpaperStatus:3];
  unint64_t v19 = [v10 count];
  if ((v12 & 1) == 0 || v19 < 2)
  {
    uint64_t v45 = [v10 count];
    if ((v12 & 1) == 0 || v45 != 1)
    {
      if ((v12 & 1) == 0)
      {
LABEL_20:
        uint64_t v63 = SBSUIWallpaperSetImages(v9, v13, v12, a5);
        goto LABEL_22;
      }
LABEL_18:
      if (![v10 count]) {
        SBSUIWallpaperClearVideo();
      }
      goto LABEL_20;
    }
    v70 = v14;
    SBSUIWallpaperClearVideo();
    uint64_t v20 = [v9 objectForKeyedSubscript:v16];
    if (!v20) {
      goto LABEL_21;
    }
    [v18 cropRect];
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    [v20 size];
    CGFloat v55 = 1.0 / v54;
    [v20 size];
    CGAffineTransformMakeScale(&v72, v55, 1.0 / v56);
    v76.origin.CGFloat x = v47;
    v76.origin.CGFloat y = v49;
    v76.size.CGFloat width = v51;
    v76.size.CGFloat height = v53;
    CGRect v77 = CGRectApplyAffineTransform(v76, &v72);
    CGFloat x = v77.origin.x;
    CGFloat y = v77.origin.y;
    CGFloat width = v77.size.width;
    CGFloat height = v77.size.height;
    [v10 objectForKeyedSubscript:v16];
    id v61 = v68 = v12;
    char v62 = SBSUIWallpaperSetVideoWithWallpaperMode(v61, [v18 supportsCropping], 0, x, y, width, height);

    uint64_t v12 = v68;
    if ((v62 & 1) == 0)
    {
LABEL_21:

      uint64_t v63 = 0;
      BOOL v14 = v70;
      goto LABEL_22;
    }
LABEL_15:

    BOOL v14 = v70;
    goto LABEL_18;
  }
  uint64_t v67 = v12;
  v70 = v14;
  uint64_t v20 = [v9 objectForKeyedSubscript:v16];
  id v69 = v9;
  long long v21 = [v9 objectForKeyedSubscript:v17];
  if (v20)
  {
    if (v21)
    {
      id v66 = v21;
      [v18 cropRect];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      [v20 size];
      CGFloat v31 = 1.0 / v30;
      [v20 size];
      CGAffineTransformMakeScale(&v73, v31, 1.0 / v32);
      v74.origin.CGFloat x = v23;
      v74.origin.CGFloat y = v25;
      v74.size.CGFloat width = v27;
      v74.size.CGFloat height = v29;
      CGRect v75 = CGRectApplyAffineTransform(v74, &v73);
      CGFloat v33 = v75.origin.x;
      CGFloat v34 = v75.origin.y;
      CGFloat v35 = v75.size.width;
      CGFloat v36 = v75.size.height;
      uint64_t v37 = [v10 objectForKeyedSubscript:v16];
      int v38 = SBSUIWallpaperSetVideoWithWallpaperMode(v37, [v18 supportsCropping], a5, v33, v34, v35, v36);

      long long v21 = v66;
      if (v38)
      {
        double v39 = [v10 objectForKeyedSubscript:v17];
        int v65 = [v71 supportsCropping];
        [v71 cropRect];
        char v44 = SBSUIWallpaperSetVideoWithWallpaperMode(v39, v65, v15, v40, v41, v42, v43);

        long long v21 = v66;
        if (v44)
        {

          uint64_t v12 = v67;
          id v9 = v69;
          goto LABEL_15;
        }
      }
    }
  }

  uint64_t v63 = 0;
  id v9 = v69;
  BOOL v14 = v70;
LABEL_22:

  return v63;
}

uint64_t SBSUIWallpaperSetVideoWithWallpaperMode(void *a1, int a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a1;
  BOOL v14 = [MEMORY[0x1E4F74230] sharedConnection];
  int v15 = [v14 isWallpaperModificationAllowed];

  if (v15)
  {
    if (_os_feature_enabled_impl())
    {
      if (a2)
      {
        v26.origin.CGFloat x = a4;
        v26.origin.CGFloat y = a5;
        v26.size.CGFloat width = a6;
        v26.size.CGFloat height = a7;
        NSStringFromCGRect(v26);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = 0;
      }
      id v22 = [v13 URL];
      [v22 fileSystemRepresentation];
      CGFloat v23 = (char *)sandbox_extension_issue_file();

      uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:strlen(v23)];
      free(v23);
      long long v21 = [v13 URL];
      double v24 = PBUIStringForWallpaperMode();
      uint64_t v17 = +[SBSUIWallpaperService setWallpaperWithVideo:v21 sandboxToken:v20 cropRect:v16 wallpaperMode:v24];
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
      double v18 = [v13 URL];
      unint64_t v19 = [v18 path];
      if ((a2 & 1) == 0)
      {
        a4 = *MEMORY[0x1E4F1DB20];
        a5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        a6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        a7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
      uint64_t v17 = objc_msgSend(v16, "setWallpaperWithVideoWithWallpaperMode:cropRect:wallpaperMode:", v19, a3, a4, a5, a6, a7);

      [v16 invalidate];
      if (v17) {
        goto LABEL_13;
      }
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v21 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL SBSUIWallpaperSetVideoWithWallpaperMode(AVURLAsset *__strong, BOOL, CGRect, SBFWallpaperMode)");
      [v20 handleFailureInFunction:v21 file:@"SBSUIWallpaperUtilities.m" lineNumber:453 description:@"The iris wallpaper asset failed to be exported."];
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v17 = 0;
LABEL_14:

  return v17;
}

uint64_t SBSUIWallpaperClearVideo()
{
  uint64_t v0 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v1 = [v0 isWallpaperModificationAllowed];

  if (v1)
  {
    if (_os_feature_enabled_impl())
    {
      +[SBSUIWallpaperService removeWallpaperVideo];
    }
    else
    {
      char v4 = 0;
      uint64_t v2 = SBSSpringBoardServerPort();
      MEMORY[0x1AD0CE7D0](v2, &v4);
      if (!v4) {
        SBSUIWallpaperClearVideo_cold_1();
      }
    }
  }
  return v1;
}

uint64_t SBSUIWallpaperSetVideo(void *a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  return SBSUIWallpaperSetVideoWithWallpaperMode(a1, a2, 0, a3, a4, a5, a6);
}

uint64_t SBSUIWallpaperSetColorName(void *a1, uint64_t a2)
{
  id v3 = a1;
  char v4 = [MEMORY[0x1E4F74230] sharedConnection];
  int v5 = [v4 isWallpaperModificationAllowed];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
    uint64_t v7 = [v6 setWallpaperColorName:v3 forVariants:a2];
    [v6 invalidate];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t SBSUIWallpaperSetColor(void *a1, uint64_t a2)
{
  id v3 = a1;
  char v4 = [MEMORY[0x1E4F74230] sharedConnection];
  int v5 = [v4 isWallpaperModificationAllowed];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
    uint64_t v7 = [v3 resolvedColorWithTraitCollection:v6];

    id v8 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
    id v9 = [v3 resolvedColorWithTraitCollection:v8];

    if ([v7 isEqual:v9])
    {

      id v9 = 0;
    }
    if (_os_feature_enabled_impl())
    {
      PBUIStringForWallpaperLocations();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = +[SBSUIWallpaperService setWallpaperColor:v7 darkColor:v9 forLocations:v10];
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
      uint64_t v11 = [v10 setWallpaperColor:v7 darkColor:v9 forVariants:a2];
      [v10 invalidate];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t SBSUIWallpaperSetGradient(void *a1, uint64_t a2)
{
  id v3 = a1;
  char v4 = [MEMORY[0x1E4F74230] sharedConnection];
  int v5 = [v4 isWallpaperModificationAllowed];

  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      PBUIStringForWallpaperLocations();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = +[SBSUIWallpaperService setWallpaperGradient:v3 forLocations:v6];
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
      uint64_t v7 = [v6 setWallpaperGradient:v3 forVariants:a2];
      [v6 invalidate];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t SBSUIWallpaperRestoreDefault()
{
  uint64_t v0 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v1 = [v0 isWallpaperModificationAllowed];

  if (v1)
  {
    if (_os_feature_enabled_impl())
    {
      +[SBSUIWallpaperService restoreDefaultWallpaper];
    }
    else
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __SBSUIWallpaperRestoreDefault_block_invoke;
      v5[3] = &unk_1E5CCC580;
      id v6 = v2;
      id v3 = v2;
      [v3 restoreDefaultWallpaperWithCompletion:v5];
    }
  }
  return v1;
}

uint64_t __SBSUIWallpaperRestoreDefault_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t SBSUITriggerPosterSignificantEvent()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __SBSUITriggerPosterSignificantEvent_block_invoke;
  v3[3] = &unk_1E5CCC580;
  id v4 = v0;
  id v1 = v0;
  [v1 triggerPosterSignificantEventWithCompletion:v3];

  return 1;
}

uint64_t __SBSUITriggerPosterSignificantEvent_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id SBSUIWallpaperGetCurrentHomeScreenImage(double a1)
{
  return SBSUIWallpaperGetPreviewWithImageUsingData(1u, 0, 0, a1);
}

id SBSUIWallpaperGetPreviewWithImageUsingData(unsigned __int8 a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v17 = 0;
  unsigned int v16 = 0;
  objc_msgSend(a3, "bs_secureEncoded");
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];
  uint64_t v10 = SBSSpringBoardServerPort();
  int v11 = MEMORY[0x1AD0CE8B0](v10, a1, a2, v8, v9, &v17, &v16, a4);
  uint64_t v12 = 0;
  if (!v11)
  {
    id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:v16];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F42A80], "bs_secureDecodedFromData:", v13);
  }
  BOOL v14 = (unsigned int *)MEMORY[0x1E4F14960];
  if (v17) {
    MEMORY[0x1AD0CF430](*MEMORY[0x1E4F14960], v17, v16);
  }
  if (v8) {
    MEMORY[0x1AD0CF430](*v14, v8, v9);
  }

  return v12;
}

id SBSUIWallpaperGetHomeScreenPreviewWithImage(void *a1, double a2)
{
  return SBSUIWallpaperGetPreviewWithImage(1u, 0, a1, a2);
}

id SBSUIWallpaperGetPreviewWithImage(unsigned __int8 a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  MEMORY[0x1AD0CEC40]();
  uint64_t v22 = 0;
  SBFCreateIOSurfaceForImage();
  uint64_t v8 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
  uint64_t MachPort = IOSurfaceCreateMachPort(v8);
  unsigned int v21 = 0;
  uint64_t v10 = SBSSpringBoardServerPort();
  int v11 = 0;
  if (!MEMORY[0x1AD0CE8C0](v10, a1, a2, MachPort, &v21, a4))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F2EF78]);
    id v13 = (void *)[v12 initWithMachPort:v21];
    BOOL v14 = (int *)MEMORY[0x1E4F14960];
    if (IOSurfaceSetOwnership())
    {
      int v15 = SBLogWallpaper();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = *v14;
        *(_DWORD *)buf = 67109120;
        int v24 = v16;
        _os_log_impl(&dword_1A7607000, v15, OS_LOG_TYPE_DEFAULT, "Failed to assign surface ownership to task %d", buf, 8u);
      }
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F42A80];
    double v18 = [MEMORY[0x1E4F42D90] mainScreen];
    [v18 scale];
    int v11 = objc_msgSend(v17, "sbf_imageWithIOSurface:scale:orientation:", v13, 0);
  }
  BSMachSendRightRelease();
  BSMachSendRightRelease();
  if (v22) {
    CGImageBlockSetRelease();
  }
  if (!v11)
  {
    unint64_t v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v19, OS_LOG_TYPE_INFO, "Wallpaper preview failed to be sent by ioSurface.", buf, 2u);
    }

    int v11 = SBSUIWallpaperGetPreviewWithImageUsingData(a1, a2, v7, a4);
  }

  return v11;
}

id SBSUIWallpaperGetCurrentLockScreenImage(double a1)
{
  return SBSUIWallpaperGetPreviewWithImageUsingData(0, 0, 0, a1);
}

id SBSUIWallpaperGetLockScreenPreviewWithImage(void *a1, double a2)
{
  return SBSUIWallpaperGetPreviewWithImage(0, 0, a1, a2);
}

id SBSUIWallpaperGetHomeScreenOverlayWithLightForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(1u, 2560, a1);
}

id SBSUIWallpaperGetOverlay(unsigned __int8 a1, uint64_t a2, double a3)
{
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", 1.0, 1.0);
  id v7 = [v6 imageWithActions:&__block_literal_global_34];
  uint64_t v8 = SBSUIWallpaperGetPreviewWithImage(a1, a2, v7, a3);

  return v8;
}

id SBSUIWallpaperGetHomeScreenOverlayWithDarkForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(1u, 1536, a1);
}

id SBSUIWallpaperGetLockScreenOverlayWithLightForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(0, 2048, a1);
}

id SBSUIWallpaperGetLockScreenOverlayWithDarkForegroundColor(double a1)
{
  return SBSUIWallpaperGetOverlay(0, 1024, a1);
}

id SBSUIWallpaperGetPreview(unsigned __int8 a1, uint64_t a2, double a3)
{
  return SBSUIWallpaperGetPreviewWithImage(a1, a2, 0, a3);
}

void __SBSUIWallpaperGetOverlay_block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F428B8];
  id v3 = a2;
  id v4 = [v2 colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.1];
  [v4 setFill];

  id v5 = [v3 format];
  [v5 bounds];
  objc_msgSend(v3, "fillRect:");
}

id SBSUIWallpaperGetOptions()
{
  if (_os_feature_enabled_impl())
  {
    id v0 = PBUIStringForWallpaperVariant();
    uint64_t v1 = +[SBSUIWallpaperService getWallpaperOptionsForVariant:v0];
  }
  else
  {
    float v12 = 1.0;
    float v13 = 1.0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    char v9 = 1;
    char v8 = 1;
    char v7 = 0;
    double v6 = 0.0;
    uint64_t v5 = 0;
    int v4 = 0;
    SBSSpringBoardServerPort();
    SBGetWallpaperOptions();
    id v0 = 0;
    MEMORY[0x1AD0CF430](*MEMORY[0x1E4F14960]);
    uint64_t v1 = objc_msgSend(MEMORY[0x1E4FA6078], "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperKitData:", 0, v9 != 0, v8 != 0, v7 != 0, 0, v13, v12, *((float *)&v11 + 1), *(float *)&v11, *((float *)&v10 + 1), *(float *)&v10, v6);
  }
  id v2 = (void *)v1;

  return v2;
}

id SBSUIWallpaperGetLegibilitySettings(unsigned __int8 a1)
{
  if (_os_feature_enabled_impl())
  {
    id v2 = PBUIStringForWallpaperVariant();
    id v3 = +[SBSUIWallpaperService getWallpaperLegibilitySettingsForVariant:v2];
  }
  else
  {
    uint64_t v13 = 0;
    unsigned int v12 = 0;
    uint64_t v4 = SBSSpringBoardServerPort();
    int v5 = MEMORY[0x1AD0CE890](v4, a1, &v13, &v12);
    if (v13)
    {
      if (v5)
      {
        id v3 = 0;
      }
      else
      {
        double v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v13 length:v12 freeWhenDone:0];
        char v7 = (void *)MEMORY[0x1E4F28DC0];
        char v8 = self;
        uint64_t v11 = 0;
        id v3 = [v7 unarchivedObjectOfClass:v8 fromData:v6 error:&v11];

        if (!v3)
        {
          char v9 = SBLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            SBSUIWallpaperGetLegibilitySettings_cold_1(v9);
          }
        }
      }
      MEMORY[0x1AD0CF430](*MEMORY[0x1E4F14960]);
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

void SBSUIMagicWallpaperSetWithOptions(void *a1, unsigned __int8 a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a1;
  int v7 = _os_feature_enabled_impl();
  uint64_t v8 = *MEMORY[0x1E4F83C38];
  if (v7)
  {
    char v9 = [v6 objectForKey:v8];
    uint64_t v10 = PBUIMagicWallpaperOptionsDictionary();

    uint64_t v11 = PBUIStringForWallpaperLocations();
    +[SBSUIWallpaperService setProceduralWallpaperIdentifier:v9 options:v10 locations:v11];

    unsigned int v12 = SBLogWallpaper();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v19 = v9;
      __int16 v20 = 2114;
      unsigned int v21 = v10;
      _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_DEFAULT, "SETTING PROCEDURAL WALLPAPER %{public}@: %{public}@", buf, 0x16u);
    }

    return;
  }
  uint64_t v13 = (void *)[v6 objectForKey:v8];
  BOOL v14 = (void *)PBUIMagicWallpaperOptionsDictionary();

  if (!v13)
  {
    int v15 = "com.apple.springboard.unset-procedural-wallpaper";
    if (!v14) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v15 = (const char *)[v13 UTF8String];
  if (v14)
  {
LABEL_7:
    BOOL v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:0];
  }
LABEL_8:
  uint64_t v16 = SBSSpringBoardServerPort();
  id v17 = v14;
  MEMORY[0x1AD0CEA00](v16, v15, a2, [v17 bytes], objc_msgSend(v17, "length"));
}

BOOL SBSUIWallpaperSetVariant(unsigned __int8 a1)
{
  char v4 = 0;
  uint64_t v2 = SBSSpringBoardServerPort();
  MEMORY[0x1AD0CEA40](v2, a1, &v4);
  return v4 != 0;
}

BOOL SBSUIWallpaperSetOptionsForLocations(void *a1, unsigned __int8 a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  char v29 = 0;
  char v4 = [v3 name];
  if ([v4 length])
  {
    id v5 = [v3 name];
    int v6 = [v5 intValue];

    if (v6 <= 49)
    {
      int v7 = SBLogWallpaper();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        _SBSUIWallpaperSetImageWithoutCheckingMC_cold_1(v3);
      }

      uint64_t v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_INFO, "You're trying to set a wallpaper with a name that doesn't start with a >50 number. This is wrong because we expect a number to be able to gather diagnostics.", buf, 2u);
      }

      __assert_rtn("SBSUIWallpaperSetOptionsForLocations", "SBSUIWallpaperUtilities.m", 796, "0");
    }
  }
  else
  {
  }
  [v3 cropRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  bzero(buf, 0x400uLL);
  id v17 = [v3 name];
  [v17 getCString:buf maxLength:1024 encoding:4];

  uint64_t v18 = SBSSpringBoardServerPort();
  [v3 parallaxFactor];
  float v20 = v19;
  [v3 zoomScale];
  float v22 = v21;
  uint64_t v23 = [v3 supportsCropping];
  uint64_t v24 = [v3 isPortrait];
  uint64_t v25 = [v3 hasVideo];
  [v3 stillTimeInVideo];
  *(float *)&double v10 = v10;
  *(float *)&double v12 = v12;
  *(float *)&double v14 = v14;
  *(float *)&double v16 = v16;
  MEMORY[0x1AD0CEA30](v18, v23, v24, v25, buf, a2, &v29, v20, v22, *(float *)&v10, *(float *)&v12, *(float *)&v14, *(float *)&v16, v26);
  BOOL v27 = v29 != 0;

  return v27;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A7678B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A767EB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A767ED50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *SBSUIStarkNotificationsSuspensionReasonsDescription(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v3 = v2;
    if (v1)
    {
      [(__CFString *)v2 appendString:@" assistant"];
      v1 &= ~1uLL;
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if (!v1)
        {
LABEL_6:
          [(__CFString *)v3 appendString:@""]);
          goto LABEL_8;
        }
LABEL_5:
        [(__CFString *)v3 appendFormat:@" %li", v1];
        goto LABEL_6;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [(__CFString *)v3 appendString:@" other"];
    v1 &= ~2uLL;
    if (!v1) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v3 = @"none";
LABEL_8:
  return v3;
}

id SBSUIStarkNotificationsSceneSettingValueDescription(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  switch(a1)
  {
    case 2998744415:
    case 2998744418:
      uint64_t v6 = BSSettingFlagDescription();
      goto LABEL_11;
    case 2998744416:
      uint64_t v8 = objc_opt_class();
      id v9 = v5;
      if (v8)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      uint64_t v12 = [v11 unsignedIntegerValue];
      uint64_t v6 = SBSUIStarkNotificationsSuspensionReasonsDescription(v12);
      goto LABEL_11;
    case 2998744417:
      uint64_t v6 = [v4 description];
LABEL_11:
      int v7 = (void *)v6;
      break;
    default:
      int v7 = 0;
      break;
  }

  return v7;
}

void sub_1A76810B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

double _CentroidOfTouches(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  unint64_t v4 = 0;
  uint64_t v5 = *(void *)v18;
  double v6 = 0.0;
  double v7 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v1);
      }
      id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      uint64_t v10 = [v9 window];
      [v9 locationInView:0];
      objc_msgSend(v10, "_convertPointToSceneReferenceSpace:");
      double v12 = v11;
      double v14 = v13;

      double v6 = v6 + v12;
      double v7 = v7 + v14;
    }
    v4 += v3;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v3);
  if (v4) {
    double v15 = v6 / (double)v4;
  }
  else {
LABEL_10:
  }
    double v15 = *MEMORY[0x1E4F1DAD8];

  return v15;
}

uint64_t SBSUIHardwareButtonHintViewsSupported()
{
  if (SBSUIHardwareButtonHintViewsSupported_onceToken != -1) {
    dispatch_once(&SBSUIHardwareButtonHintViewsSupported_onceToken, &__block_literal_global_37);
  }
  return SBSUIHardwareButtonHintViewsSupported_hintViewsSupported;
}

void __SBSUIHardwareButtonHintViewsSupported_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA6AA8]);
  SBSUIHardwareButtonHintViewsSupported_hintViewsSupported = [v0 getAssociatedHintViewsSupported];
  [v0 invalidate];
}

void SBSUIHardwareButtonGetHintViewsSupportedAsync(void *a1)
{
  id v1 = a1;
  uint64_t v2 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SBSUIHardwareButtonGetHintViewsSupportedAsync_block_invoke;
  block[3] = &unk_1E5CCC698;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

uint64_t __SBSUIHardwareButtonGetHintViewsSupportedAsync_block_invoke(uint64_t a1)
{
  if (SBSUIHardwareButtonHintViewsSupported_onceToken != -1) {
    dispatch_once(&SBSUIHardwareButtonHintViewsSupported_onceToken, &__block_literal_global_37);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id SBSUIRegisterHardwareButtonHintView(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA6AA8]);
  id v5 = [v3 layer];
  if (v5)
  {
    double v6 = CALayerGetContext();
    double v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 contextId];
      uint64_t RenderId = CALayerGetRenderId();
      [v5 size];
      uint64_t v10 = objc_msgSend(v4, "registerAssociatedHintViewContextId:layerRenderId:layerSize:forButtonKind:", v8, RenderId, a2);
      [v4 invalidate];
      goto LABEL_10;
    }
    double v11 = SBLogHardwareButtonService();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      SBSUIRegisterHardwareButtonHintView_cold_2((uint64_t)v5, v11);
    }
  }
  else
  {
    double v7 = SBLogHardwareButtonService();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      SBSUIRegisterHardwareButtonHintView_cold_1((uint64_t)v3, v7);
    }
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

void SBSUIRegisterHardwareButtonHintViewAsync(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  double v7 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SBSUIRegisterHardwareButtonHintViewAsync_block_invoke;
  block[3] = &unk_1E5CCDD90;
  id v12 = v6;
  uint64_t v13 = a2;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __SBSUIRegisterHardwareButtonHintViewAsync_block_invoke(uint64_t a1)
{
  uint64_t v2 = SBSUIRegisterHardwareButtonHintView(*(void **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }
  return MEMORY[0x1F41817F8](v3, v2);
}

void SBSUIRequestHardwareButtonSystemGlowEffectWithInitialStyle(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA6AA8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __SBSUIRequestHardwareButtonSystemGlowEffectWithInitialStyle_block_invoke;
  v7[3] = &unk_1E5CCE950;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 requestSystemGlowEffectWithInitialStyle:a1 completion:v7];
}

void __SBSUIRequestHardwareButtonSystemGlowEffectWithInitialStyle_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

double SBUIFloatFloorForMainScreenScale(double a1)
{
  return SBUIFloatFloorForScale(a1, 0.0);
}

double SBUIFloatFloorForScale(double a1, double a2)
{
  double v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    id v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 scale];
    double v2 = v5;
  }
  return floor(v2 * a1) / v2;
}

double SBUIScaledFontSizeWithMaxSizeCategory(void *a1, double a2)
{
  uint64_t v3 = a1;
  id v4 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, v3);

  id v6 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v7 = *MEMORY[0x1E4F43870];
  if (v5 == NSOrderedAscending)
  {
    id v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v3];
    id v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];
  }
  [v9 _scaledValueForValue:a2];
  uint64_t v10 = [MEMORY[0x1E4F42D90] mainScreen];
  UIRoundToScreenScale();
  double v12 = v11;

  return v12;
}

uint64_t SBUISupportsIndicatorSecureRendering()
{
  if (SBUISupportsIndicatorSecureRendering_onceToken != -1) {
    dispatch_once(&SBUISupportsIndicatorSecureRendering_onceToken, &__block_literal_global_38);
  }
  return SBUISupportsIndicatorSecureRendering_supportsSecureIndicator;
}

uint64_t __SBUISupportsIndicatorSecureRendering_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  SBUISupportsIndicatorSecureRendering_supportsSecureIndicator = result;
  return result;
}

uint64_t SBUIAllowsIndicatorSecureRendering()
{
  if (SBUISupportsIndicatorSecureRendering_onceToken != -1) {
    dispatch_once(&SBUISupportsIndicatorSecureRendering_onceToken, &__block_literal_global_38);
  }
  if (!SBUISupportsIndicatorSecureRendering_supportsSecureIndicator) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

__CFString *SBUISystemApertureLayoutModeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5) {
    return @"invalid mode";
  }
  else {
    return off_1E5CCEA90[a1 + 1];
  }
}

__CFString *SBUISystemApertureContentRoleDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"invalid role";
  }
  else {
    return off_1E5CCEAC0[a1];
  }
}

__CFString *SBUISystemApertureCustomLayoutDescription(unint64_t a1)
{
  if (a1 > 4) {
    return @"invalid layout";
  }
  else {
    return off_1E5CCEAD8[a1];
  }
}

__CFString *SBUISystemAperturePresentationBehaviorsDescription(uint64_t a1)
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__5;
  long long v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v10 = __SBUISystemAperturePresentationBehaviorsDescription_block_invoke;
  double v11 = &unk_1E5CCE9F0;
  double v12 = &v13;
  double v2 = v9;
  if (a1)
  {
    char v19 = 0;
    uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v3.i16[0] = vaddlv_u8(v3);
    int v4 = v3.i32[0];
    if (v3.i32[0])
    {
      unint64_t v5 = 0;
      do
      {
        if (((1 << v5) & a1) != 0)
        {
          ((void (*)(void *))v10)(v2);
          if (v19) {
            break;
          }
          --v4;
        }
        if (v5 > 0x3E) {
          break;
        }
        ++v5;
      }
      while (v4 > 0);
    }
  }

  id v6 = (__CFString *)v14[5];
  if (!v6) {
    id v6 = @"default";
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v13, 8);

  return v7;
}

void sub_1A76859F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SBUISystemAperturePresentationBehaviorsDescription_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 > 127)
  {
    if (a2 > 1023)
    {
      switch(a2)
      {
        case 1024:
          uint8x8_t v3 = @"showsExclusivelyOverAssociatedAppOrScene";
          break;
        case 2048:
          uint8x8_t v3 = @"isSuppressedOnContinuityDisplay";
          break;
        case 4096:
          uint8x8_t v3 = @"requireAssociatedAppBundleIdentifierForSuppression";
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(a2)
      {
        case 128:
          uint8x8_t v3 = @"customViewHandlesLongPress";
          break;
        case 256:
          uint8x8_t v3 = @"requiresAssociatedApp";
          break;
        case 512:
          uint8x8_t v3 = @"dismissesUponHandlingLaunchAction";
          break;
        default:
          return result;
      }
    }
  }
  else if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        uint8x8_t v3 = @"disablesTapToApp";
        break;
      case 32:
        uint8x8_t v3 = @"disablesTapToAppWhenCompactOrMinimal";
        break;
      case 64:
        uint8x8_t v3 = @"undimsScreenIfNecessary";
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(a2)
    {
      case 2:
        uint8x8_t v3 = @"showsOverAssociatedAppBundleIdentifier";
        break;
      case 4:
        uint8x8_t v3 = @"showsOverAssociatedScene";
        break;
      case 8:
        uint8x8_t v3 = @"showsOnCoversheet";
        break;
      default:
        return result;
    }
  }
  int v4 = *(void **)(*(void *)(*(void *)(result + 32) + 8) + 40);
  if (v4) {
    return [v4 appendFormat:@" | %@", v3];
  }
  uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithString:v3];
  uint64_t v6 = *(void *)(*(void *)(v2 + 32) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x1F41817F8](v5, v7);
}

void sub_1A7686878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id SBSUIInCallSceneClientSettingValueDescription_0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  switch(a1)
  {
    case 3001:
      [v3 integerValue];
      uint64_t v5 = SBSInCallPresentationModeDescription();
      goto LABEL_7;
    case 3002:
    case 3004:
    case 3005:
    case 3006:
      [v3 BOOLValue];
      BSSettingFlagForBool();
      uint64_t v5 = BSSettingFlagDescription();
      goto LABEL_7;
    case 3003:
      [v3 CGRectValue];
      uint64_t v5 = NSStringFromCGRect(v9);
      goto LABEL_7;
    case 3007:
      uint64_t v5 = [v3 UUIDString];
LABEL_7:
      uint64_t v6 = (void *)v5;
      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

uint64_t SystemStatusLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SystemStatusLibraryCore_frameworkLibrary;
  uint64_t v5 = SystemStatusLibraryCore_frameworkLibrary;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E5CCED28;
    long long v7 = *(_OWORD *)&off_1E5CCED38;
    v3[3] = _sl_dlopen();
    SystemStatusLibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1A768CD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SystemStatusLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SystemStatusLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SystemStatusLibrary()
{
  id v1 = 0;
  uint64_t result = SystemStatusLibraryCore();
  if (!result) {
    SystemStatusLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getSTBackgroundActivityIdentifiersDescriptionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  uint64_t v6 = getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr;
  if (!getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusLibrary();
    v4[3] = (uint64_t)dlsym(v1, "STBackgroundActivityIdentifiersDescription");
    getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A768CEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusLibrary();
  uint64_t result = dlsym(v2, "STBackgroundActivityIdentifiersDescription");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTBackgroundActivityIdentifiersDescriptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_STBackgroundActivityIdentifiersDescription(uint64_t a1)
{
  STBackgroundActivityIdentifiersDescriptionSymbolLoc = (uint64_t (*)(uint64_t))getSTBackgroundActivityIdentifiersDescriptionSymbolLoc();
  if (!STBackgroundActivityIdentifiersDescriptionSymbolLoc) {
    soft_STBackgroundActivityIdentifiersDescription_cold_1();
  }
  return STBackgroundActivityIdentifiersDescriptionSymbolLoc(a1);
}

uint64_t SystemStatusUILibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SystemStatusUILibraryCore_frameworkLibrary;
  uint64_t v5 = SystemStatusUILibraryCore_frameworkLibrary;
  if (!SystemStatusUILibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E5CCED70;
    long long v7 = *(_OWORD *)&off_1E5CCED80;
    v3[3] = _sl_dlopen();
    SystemStatusUILibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1A768D0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SystemStatusUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SystemStatusUILibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SystemStatusUILibrary()
{
  id v1 = 0;
  uint64_t result = SystemStatusUILibraryCore();
  if (!result) {
    SystemStatusUILibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  uint64_t v6 = getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr;
  if (!getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusUILibrary();
    v4[3] = (uint64_t)dlsym(v1, "STUIBackgroundActivityIdentifiersForStyleOverrides");
    getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A768D27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusUILibrary();
  uint64_t result = dlsym(v2, "STUIBackgroundActivityIdentifiersForStyleOverrides");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t a1)
{
  STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc = (uint64_t (*)(uint64_t))getSTUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc();
  if (!STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc) {
    soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1();
  }
  return STUIBackgroundActivityIdentifiersForStyleOverridesSymbolLoc(a1);
}

uint64_t getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  uint64_t v6 = getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr;
  if (!getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr)
  {
    id v1 = (void *)SystemStatusUILibrary();
    v4[3] = (uint64_t)dlsym(v1, "STUIStyleOverridesForBackgroundActivityIdentifiers");
    getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A768D400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SystemStatusUILibrary();
  uint64_t result = dlsym(v2, "STUIStyleOverridesForBackgroundActivityIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(uint64_t a1)
{
  STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc = (uint64_t (*)(uint64_t))getSTUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc();
  if (!STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc) {
    soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1();
  }
  return STUIStyleOverridesForBackgroundActivityIdentifiersSymbolLoc(a1);
}

id _SBUISafeBackgroundActivityIdentifiersDescription(void *a1)
{
  id v1 = a1;
  if (SystemStatusLibraryCore() && getSTBackgroundActivityIdentifiersDescriptionSymbolLoc())
  {
    uint64_t v2 = soft_STBackgroundActivityIdentifiersDescription((uint64_t)v1);
  }
  else
  {
    uint64_t v3 = [v1 allObjects];
    uint64_t v2 = [v3 componentsJoinedByString:@", "];
  }
  return v2;
}

void sub_1A768F528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogUIRemoteVC()
{
  if (SBLogUIRemoteVC_onceToken != -1) {
    dispatch_once(&SBLogUIRemoteVC_onceToken, &__block_literal_global_44);
  }
  uint64_t v0 = (void *)SBLogUIRemoteVC___logObj;
  return v0;
}

uint64_t __SBLogUIRemoteVC_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "UIRemoteVC");
  uint64_t v1 = SBLogUIRemoteVC___logObj;
  SBLogUIRemoteVC___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __SBLogLegibility_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Legibility");
  uint64_t v1 = SBLogLegibility___logObj;
  SBLogLegibility___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
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
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "ContinuitySessionService");
  uint64_t v1 = SBLogContinuitySessionService___logObj;
  SBLogContinuitySessionService___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

__CFString *SBUICoachingTextForSBUIFaceIDCoachingCondition(uint64_t a1)
{
  uint64_t v1 = &stru_1EFCB7578;
  switch(a1)
  {
    case 2:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_FACE_TOO_FAR";
      goto LABEL_14;
    case 3:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_FACE_TOO_CLOSE";
      goto LABEL_14;
    case 4:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_CAMERA_COVERED";
      goto LABEL_14;
    case 5:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_ATTENTION_REQUIRED";
      goto LABEL_14;
    case 6:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_SHOW_COMPLETE_FACE";
      goto LABEL_14;
    case 7:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_FACE_OUT_OF_VIEW";
      goto LABEL_14;
    case 8:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_DISABLED";
      goto LABEL_14;
    case 9:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_NOT_LOOKING";
      goto LABEL_14;
    case 10:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"GENERIC_WATCH_UNLOCK_ERROR";
      goto LABEL_14;
    case 11:
      uint64_t v6 = +[SBUIPhoneUnlockWithWatchController sharedInstance];
      uint64_t v7 = [v6 errorCode];

      SBUIStringForPhoneUnlockWithWatchErrorCode(v7);
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 12:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_UPSIDE_DOWN";
      goto LABEL_14;
    case 14:
      if (!_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()) {
        goto LABEL_15;
      }
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = v2;
      uint64_t v4 = @"FACE_ID_POSE_OUT_OF_RANGE";
LABEL_14:
      uint64_t v1 = [v2 localizedStringForKey:v4 value:&stru_1EFCB7578 table:@"SpringBoardUIServices_Late_Fall_2018_iOS"];

LABEL_15:
      return v1;
    default:
      goto LABEL_15;
  }
}

__CFString *DebugStringForSBUIFaceIDCoachingCondition(unint64_t a1)
{
  if (a1 > 0xE) {
    return @"Face is too far";
  }
  else {
    return *(&off_1E5CCEDE8 + a1);
  }
}

uint64_t SBUIFaceIDCoachingConditionShouldBeVisible(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
    case 13:
      uint64_t result = 0;
      break;
    case 2:
    case 4:
    case 12:
      uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v5 = [v4 userInterfaceIdiom];

      uint64_t result = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      break;
    case 14:
      uint64_t result = _SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBUIFaceIDCameraOrientationForDevice()
{
  os_log_t v0 = +[SBUIBiometricResource sharedInstance];
  int v1 = [v0 hasPearlSupport];

  if (!v1) {
    return 0;
  }
  if (MGGetSInt32Answer()) {
    return 2;
  }
  return 1;
}

uint64_t SBUIInterfaceOrientationForFaceIDCameraOrientation(uint64_t a1)
{
  uint64_t v1 = 3;
  if (a1 != 2) {
    uint64_t v1 = 1;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

BOOL SBUIFaceIDCameraOrientationAlignsWithInterfaceOrientation(uint64_t a1, uint64_t a2)
{
  BOOL v2 = (unint64_t)(a2 - 1) < 2;
  if (a1 != 1) {
    BOOL v2 = 0;
  }
  if (a1 == 2) {
    return (unint64_t)(a2 - 3) < 2;
  }
  else {
    return v2;
  }
}

__CFString *SBUIStringFromPresentableButtonEvent(uint64_t a1)
{
  uint64_t v1 = @"[INVALID]";
  if (a1 == 1) {
    uint64_t v1 = @"homeButtonPress";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"noEvent";
  }
}

id getACUISActivityMetricsRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getACUISActivityMetricsRequestClass_softClass;
  uint64_t v7 = getACUISActivityMetricsRequestClass_softClass;
  if (!getACUISActivityMetricsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getACUISActivityMetricsRequestClass_block_invoke;
    v3[3] = &unk_1E5CCC5D0;
    void v3[4] = &v4;
    __getACUISActivityMetricsRequestClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A7690EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACUISSizeDimensionRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getACUISSizeDimensionRequestClass_softClass;
  uint64_t v7 = getACUISSizeDimensionRequestClass_softClass;
  if (!getACUISSizeDimensionRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getACUISSizeDimensionRequestClass_block_invoke;
    v3[3] = &unk_1E5CCC5D0;
    void v3[4] = &v4;
    __getACUISSizeDimensionRequestClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A769113C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACUISEdgeInsetsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getACUISEdgeInsetsClass_softClass;
  uint64_t v7 = getACUISEdgeInsetsClass_softClass;
  if (!getACUISEdgeInsetsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getACUISEdgeInsetsClass_block_invoke;
    v3[3] = &unk_1E5CCC5D0;
    void v3[4] = &v4;
    __getACUISEdgeInsetsClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A7691220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACUISActivityItemMetricsRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getACUISActivityItemMetricsRequestClass_softClass;
  uint64_t v7 = getACUISActivityItemMetricsRequestClass_softClass;
  if (!getACUISActivityItemMetricsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getACUISActivityItemMetricsRequestClass_block_invoke;
    v3[3] = &unk_1E5CCC5D0;
    void v3[4] = &v4;
    __getACUISActivityItemMetricsRequestClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A7691304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A76917D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A76919CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACUISActivityMetricsRequestClass_block_invoke(uint64_t a1)
{
  ActivityUIServicesLibrary();
  Class result = objc_getClass("ACUISActivityMetricsRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACUISActivityMetricsRequestClass_block_invoke_cold_1();
  }
  getACUISActivityMetricsRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ActivityUIServicesLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ActivityUIServicesLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ActivityUIServicesLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5CCEE60;
    uint64_t v2 = 0;
    ActivityUIServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!ActivityUIServicesLibraryCore_frameworkLibrary) {
    ActivityUIServicesLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ActivityUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ActivityUIServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getACUISSizeDimensionRequestClass_block_invoke(uint64_t a1)
{
  ActivityUIServicesLibrary();
  Class result = objc_getClass("ACUISSizeDimensionRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACUISSizeDimensionRequestClass_block_invoke_cold_1();
  }
  getACUISSizeDimensionRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACUISEdgeInsetsClass_block_invoke(uint64_t a1)
{
  ActivityUIServicesLibrary();
  Class result = objc_getClass("ACUISEdgeInsets");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACUISEdgeInsetsClass_block_invoke_cold_1();
  }
  getACUISEdgeInsetsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACUISActivityItemMetricsRequestClass_block_invoke(uint64_t a1)
{
  ActivityUIServicesLibrary();
  Class result = objc_getClass("ACUISActivityItemMetricsRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACUISActivityItemMetricsRequestClass_block_invoke_cold_1();
  }
  getACUISActivityItemMetricsRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getACUISSystemApertureMetricsRequestClass_block_invoke(uint64_t a1)
{
  ActivityUIServicesLibrary();
  Class result = objc_getClass("ACUISSystemApertureMetricsRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACUISSystemApertureMetricsRequestClass_block_invoke_cold_1();
  }
  getACUISSystemApertureMetricsRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UserNotificationsUIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __UserNotificationsUIKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5CCEE78;
    uint64_t v6 = 0;
    UserNotificationsUIKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v2 = (void *)UserNotificationsUIKitLibraryCore_frameworkLibrary;
  if (!UserNotificationsUIKitLibraryCore_frameworkLibrary) {
    __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "NCNotificationStructuredListViewControllerInsetMarginHorizontal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                 + 24);
  return result;
}

uint64_t __UserNotificationsUIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserNotificationsUIKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

id _SBUIWidgetBundlePaths()
{
  if (_SBUIWidgetBundlePaths_onceToken != -1) {
    dispatch_once(&_SBUIWidgetBundlePaths_onceToken, &__block_literal_global_46);
  }
  os_log_t v0 = (void *)_SBUIWidgetBundlePaths___widgetBundlePaths;
  return v0;
}

void _enhanceContrastChanged()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  __graphicsQualitCGFloat y = [v0 _graphicsQuality];
}

void SBUICommonInitialize()
{
  if (SBUICommonInitialize_onceToken != -1) {
    dispatch_once(&SBUICommonInitialize_onceToken, &__block_literal_global_47);
  }
}

void __SBUICommonInitialize_block_invoke()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  __graphicsQualitCGFloat y = [v0 _graphicsQuality];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F43480];
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_enhanceContrastChanged, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t SBUIGraphicsQuality()
{
  uint64_t result = __graphicsQuality;
  if (__graphicsQuality == -1)
  {
    long long v1 = [MEMORY[0x1E4F28B00] currentHandler];
    CFStringRef v2 = [NSString stringWithUTF8String:"_UIDeviceGraphicsQuality SBUIGraphicsQuality(void)"];
    [v1 handleFailureInFunction:v2 file:@"SBUICommon.m" lineNumber:26 description:@"Reading graphics quality static before it has been initialized"];

    return __graphicsQuality;
  }
  return result;
}

void __getPKGlyphViewClass_block_invoke_cold_1(void *a1)
{
  CFStringRef v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PassKitUIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUIPasscodeBiometricAuthenticationView.m", 21, @"%s", *a1);

  __break(1u);
}

void __getPKGlyphViewClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getPKGlyphViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIPasscodeBiometricAuthenticationView.m", 22, @"Unable to find class %s", "PKGlyphView");

  __break(1u);
}

void _SBUIEffectiveBiometricClassFromString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7607000, a2, OS_LOG_TYPE_DEBUG, "_LABK: %@ is not wrapped, using original BiometricKit class", (uint8_t *)&v2, 0xCu);
}

void ____loadBiometricKitIfNecessary_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)long long v1 = 0;
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AmbientUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUIBannerSourceApplicationSceneSpecification.m", 13, @"%s", *a1);

  __break(1u);
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getAMUIAmbientPresentationSceneExtensionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIBannerSourceApplicationSceneSpecification.m", 16, @"Unable to find class %s", "AMUIAmbientPresentationSceneExtension");

  __break(1u);
}

void __getLAUIPearlGlyphStaticConfigurationClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getLAUIPearlGlyphStaticConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIProudLockIconView.m", 40, @"Unable to find class %s", "LAUIPearlGlyphStaticConfiguration");

  __break(1u);
}

void LocalAuthenticationPrivateUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *LocalAuthenticationPrivateUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUIProudLockIconView.m", 38, @"%s", *a1);

  __break(1u);
}

void __getLAUIPearlGlyphViewClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getLAUIPearlGlyphViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIProudLockIconView.m", 39, @"Unable to find class %s", "LAUIPearlGlyphView");

  __break(1u);
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AmbientUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBSUIInCallSceneSpecification.m", 18, @"%s", *a1);

  __break(1u);
}

void __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_cold_2_0()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getAMUIAmbientPresentationSceneExtensionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBSUIInCallSceneSpecification.m", 21, @"Unable to find class %s", "AMUIAmbientPresentationSceneExtension");

  __break(1u);
}

void __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AmbientUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBSUIInCallWindowScene.m", 28, @"%s", *a1);

  __break(1u);
}

void __getAMUIAmbientPresentationSettingsExtensionClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getAMUIAmbientPresentationSettingsExtensionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBSUIInCallWindowScene.m", 31, @"Unable to find class %s", "AMUIAmbientPresentationSettingsExtension");

  __break(1u);
}

void SpringBoardHomeLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpringBoardHomeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUIContinuityAccessorySceneManager.m", 28, @"%s", *a1);

  __break(1u);
}

void getPBItemMetadataKey_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"NSString *getPBItemMetadataKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUISystemDrag.m", 16, @"%s", dlerror());

  __break(1u);
}

void __getPBItemMetadataKeySymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PasteboardLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUISystemDrag.m", 15, @"%s", *a1);

  __break(1u);
}

void SBUIBytesPerPixelForMetalPixelFormat_cold_1()
{
}

void SBUIBitsPerComponentForMTLPixelFormat_cold_1()
{
}

void UIImageCreateFromMTLPixelFormat_cold_1()
{
}

void _SBSUIWallpaperSetImageWithoutCheckingMC_cold_1(void *a1)
{
  long long v1 = [a1 name];
  OUTLINED_FUNCTION_0_2(&dword_1A7607000, v2, v3, "Asserting because wallpaper name is: %{public}@", v4, v5, v6, v7, 2u);
}

void _SBSUIWallpaperSetImagesWithoutCheckingMC_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A7607000, log, OS_LOG_TYPE_ERROR, "Asserting because wallpaper name is: %{public}@ for key: %{public}@", (uint8_t *)&v3, 0x16u);
}

void SBSUIWallpaperClearVideo_cold_1()
{
  id v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v1 = 0;
    _os_log_impl(&dword_1A7607000, v0, OS_LOG_TYPE_INFO, "The iris wallpaper asset failed to be exported.", v1, 2u);
  }

  __assert_rtn("SBSUIWallpaperClearVideo", "SBSUIWallpaperUtilities.m", 475, "0");
}

void SBSUIWallpaperGetLegibilitySettings_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1A7607000, log, OS_LOG_TYPE_ERROR, "Error unarchive wallpaper legibility settings: %@", (uint8_t *)&v1, 0xCu);
}

void SBSUIRegisterHardwareButtonHintView_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "no CALayer present for view %{public}@", (uint8_t *)&v2, 0xCu);
}

void SBSUIRegisterHardwareButtonHintView_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "hint view layer %@ has no CAContext", (uint8_t *)&v2, 0xCu);
}

void SystemStatusLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SystemStatusLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"_SBUISystemStatusSoftLinking.m", 12, @"%s", *a1);

  __break(1u);
}

void soft_STBackgroundActivityIdentifiersDescription_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFStringRef soft_STBackgroundActivityIdentifiersDescription(CFSetRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_SBUISystemStatusSoftLinking.m", 13, @"%s", dlerror());

  __break(1u);
}

void SystemStatusUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SystemStatusUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"_SBUISystemStatusSoftLinking.m", 17, @"%s", *a1);

  __break(1u);
}

void soft_STUIBackgroundActivityIdentifiersForStyleOverrides_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFSetRef soft_STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_SBUISystemStatusSoftLinking.m", 18, @"%s", dlerror());

  __break(1u);
}

void soft_STUIStyleOverridesForBackgroundActivityIdentifiers_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"uint64_t soft_STUIStyleOverridesForBackgroundActivityIdentifiers(CFSetRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_SBUISystemStatusSoftLinking.m", 19, @"%s", dlerror());

  __break(1u);
}

void __getACUISActivityMetricsRequestClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getACUISActivityMetricsRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUILiveActivityMetrics.m", 23, @"Unable to find class %s", "ACUISActivityMetricsRequest");

  __break(1u);
}

void ActivityUIServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ActivityUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUILiveActivityMetrics.m", 19, @"%s", *a1);

  __break(1u);
}

void __getACUISSizeDimensionRequestClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getACUISSizeDimensionRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUILiveActivityMetrics.m", 32, @"Unable to find class %s", "ACUISSizeDimensionRequest");

  __break(1u);
}

void __getACUISEdgeInsetsClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getACUISEdgeInsetsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUILiveActivityMetrics.m", 35, @"Unable to find class %s", "ACUISEdgeInsets");

  __break(1u);
}

void __getACUISActivityItemMetricsRequestClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getACUISActivityItemMetricsRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUILiveActivityMetrics.m", 26, @"Unable to find class %s", "ACUISActivityItemMetricsRequest");

  __break(1u);
}

void __getACUISSystemApertureMetricsRequestClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getACUISSystemApertureMetricsRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUILiveActivityMetrics.m", 29, @"Unable to find class %s", "ACUISSystemApertureMetricsRequest");

  __break(1u);
}

void __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *UserNotificationsUIKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUILiveActivityMetrics.m", 20, @"%s", *a1);

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x1F410BDD0]();
}

uint64_t BKSHIDEventGetBaseAttributes()
{
  return MEMORY[0x1F410BE80]();
}

uint64_t BSCompareFloats()
{
  return MEMORY[0x1F410C1A0]();
}

uint64_t BSCompareIntegers()
{
  return MEMORY[0x1F410C1A8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F410C310]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1F410C398]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x1F410C3C0]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1F410C408]();
}

uint64_t BSMachSendRightRelease()
{
  return MEMORY[0x1F410C458]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1F410C5D8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1F410C610]();
}

uint64_t BSSizeLessThanSize()
{
  return MEMORY[0x1F410C628]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSTimeUntilNextClockMinute()
{
  return MEMORY[0x1F410C6A0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1F40F4AC0](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetContext()
{
  return MEMORY[0x1F40F4BD8]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1F40F4BE8]();
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1F40F4D08](t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x1F40D9800]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x1F40D9888]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9318](buffer);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9558](*(void *)&port);
}

uint64_t IOSurfaceSetOwnership()
{
  return MEMORY[0x1F40E95C8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4102B10](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t PBUICurrentParallaxDeviceType()
{
  return MEMORY[0x1F4139FC8]();
}

uint64_t PBUIMagicWallpaperOptionsDictionary()
{
  return MEMORY[0x1F4139FF0]();
}

uint64_t PBUIStringForWallpaperLocations()
{
  return MEMORY[0x1F413A020]();
}

uint64_t PBUIStringForWallpaperMode()
{
  return MEMORY[0x1F413A028]();
}

uint64_t PBUIStringForWallpaperType()
{
  return MEMORY[0x1F413A030]();
}

uint64_t PBUIStringForWallpaperVariant()
{
  return MEMORY[0x1F413A038]();
}

uint64_t SBAddWallpaperAnimationSuspensionAssertion()
{
  return MEMORY[0x1F415C000]();
}

uint64_t SBClearWallpaperAsset()
{
  return MEMORY[0x1F415C030]();
}

uint64_t SBFCreateIOSurfaceForImage()
{
  return MEMORY[0x1F415BB48]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1F415BB68]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1F415BB70]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1F415BB80]();
}

uint64_t SBFPreheatImageData()
{
  return MEMORY[0x1F415BC78]();
}

uint64_t SBFStringForUIUserInterfaceStyle()
{
  return MEMORY[0x1F415BCC8]();
}

uint64_t SBFStringForWallpaperLocations()
{
  return MEMORY[0x1F415BCD0]();
}

uint64_t SBFStringForWallpaperMode()
{
  return MEMORY[0x1F415BCD8]();
}

uint64_t SBFStringForWallpaperVariant()
{
  return MEMORY[0x1F415BCE0]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1F415BCF8]();
}

uint64_t SBGetWallpaperLegibilitySettings()
{
  return MEMORY[0x1F415C058]();
}

uint64_t SBGetWallpaperOptions()
{
  return MEMORY[0x1F415C060]();
}

uint64_t SBGetWallpaperPreview()
{
  return MEMORY[0x1F415C068]();
}

uint64_t SBGetWallpaperPreviewSurface()
{
  return MEMORY[0x1F415C070]();
}

uint64_t SBLogBanners()
{
  return MEMORY[0x1F415C0E0]();
}

uint64_t SBLogBiometricResource()
{
  return MEMORY[0x1F415C0E8]();
}

uint64_t SBLogCFUserNotifications()
{
  return MEMORY[0x1F415C0F0]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1F415C108]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1F415C128]();
}

uint64_t SBLogDashBoardCallToActionLabel()
{
  return MEMORY[0x1F415C130]();
}

uint64_t SBLogHardwareButtonService()
{
  return MEMORY[0x1F415C1A8]();
}

uint64_t SBLogHearingTestMode()
{
  return MEMORY[0x1F415C1B0]();
}

uint64_t SBLogInCallPresentation()
{
  return MEMORY[0x1F415C1D0]();
}

uint64_t SBLogLockScreenBiometricFaceIDCoaching()
{
  return MEMORY[0x1F415C1F8]();
}

uint64_t SBLogPhoneUnlockWithWatch()
{
  return MEMORY[0x1F415C250]();
}

uint64_t SBLogSystemApertureHosting()
{
  return MEMORY[0x1F415C290]();
}

uint64_t SBLogSystemNotes()
{
  return MEMORY[0x1F415C298]();
}

uint64_t SBLogTransientOverlay()
{
  return MEMORY[0x1F415C2B0]();
}

uint64_t SBLogWallpaper()
{
  return MEMORY[0x1F415C2C0]();
}

uint64_t SBSHearingTestModeDescription()
{
  return MEMORY[0x1F415C388]();
}

uint64_t SBSInCallPresentationModeDescription()
{
  return MEMORY[0x1F415C398]();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x1F415C3A0]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1F415C450]();
}

uint64_t SBSetProceduralWallpaper()
{
  return MEMORY[0x1F415C480]();
}

uint64_t SBSetWallpaperImageForLocations()
{
  return MEMORY[0x1F415C488]();
}

uint64_t SBSetWallpaperImageSurfaceForLocations()
{
  return MEMORY[0x1F415C490]();
}

uint64_t SBSetWallpaperOptionsForLocations()
{
  return MEMORY[0x1F415C498]();
}

uint64_t SBSetWallpaperVariant()
{
  return MEMORY[0x1F415C4A0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4102BA8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1F4102C10]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return MEMORY[0x1F4102CB0]();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return MEMORY[0x1F4102CB8]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1F4102D48]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4102D60]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4102D70]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4102D78]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4102D80]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4102D90]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4102DF8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4102E10]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1F4102E18]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1F4102E38]();
}

uint64_t UIViewControllerFromPresentable()
{
  return MEMORY[0x1F410C130]();
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  return MEMORY[0x1F4178DC8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _SBFWallpaperRegisterForExternalChangeNotification()
{
  return MEMORY[0x1F415BD38]();
}

uint64_t _SBF_Private_IsD93Like()
{
  return MEMORY[0x1F415BD98]();
}

uint64_t _SBF_Private_IsD94Like()
{
  return MEMORY[0x1F415BDA0]();
}

uint64_t _UIAdaptLocalizedStringForView()
{
  return MEMORY[0x1F4102EA8]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1F4102F40]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1F415C4D0]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1F415C4E0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1F40CCB30]();
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBD0](zone, alignment, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

vImage_Error vImageTentConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D48](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageTentConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D50](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}