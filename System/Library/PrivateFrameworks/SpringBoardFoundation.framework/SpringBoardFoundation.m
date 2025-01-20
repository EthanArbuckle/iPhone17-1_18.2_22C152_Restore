id getSOSUtilitiesClass()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSOSUtilitiesClass_softClass;
  v7 = getSOSUtilitiesClass_softClass;
  if (!getSOSUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSOSUtilitiesClass_block_invoke;
    v3[3] = &unk_1E548C938;
    v3[4] = &v4;
    __getSOSUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B53061C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBFBoolEquals(int a1, int a2)
{
  return a1 ^ a2 ^ 1u;
}

BOOL SBFIsChamoisWindowingUIAvailable()
{
  int v0 = atomic_load(__ChamoisWindowingUIStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBChamoisWindowingUI", 0, __ChamoisWindowingUIStorage, ChamoisWindowingUIDefaultValueFunction) == 0;
  }
  return !v1;
}

BOOL SBFIsShellSceneKitAvailable()
{
  int v0 = atomic_load(__ShellSceneKitStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBShellSceneKit", 0, __ShellSceneKitStorage, ShellSceneKitDefaultValueFunction) == 0;
  }
  return !v1;
}

double SBFFloatFloorForScale(double a1, double a2)
{
  double v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 scale];
    double v2 = v5;
  }
  return floor(v2 * a1) / v2;
}

uint64_t SBFInterfaceOrientationDescription()
{
  return MEMORY[0x1F410C398]();
}

id SBLogKeyWindow()
{
  if (SBLogKeyWindow_onceToken != -1) {
    dispatch_once(&SBLogKeyWindow_onceToken, &__block_literal_global_10);
  }
  int v0 = (void *)SBLogKeyWindow___logObj;
  return v0;
}

uint64_t SBFEffectiveHomeButtonType()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  uint64_t v1 = [v0 homeButtonType];

  return v1;
}

uint64_t SBFEffectiveDeviceClass()
{
  int v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  uint64_t v1 = [v0 deviceClass];

  return v1;
}

uint64_t _SBFCGBitmapImageCreate(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v16 = a4;
  id v17 = a5;
  v18 = (void *)MEMORY[0x18C132FE0]();
  size_t v19 = vcvtpd_u64_f64(a6 * a8);
  size_t v20 = vcvtpd_u64_f64(a7 * a8);
  uint64_t v53 = _SBFGraphicsContextComponentsCountForType(a1);
  v56 = (void (**)(void, void, void, double))v17;
  uint64_t bytesPerRow = CGBitmapGetAlignedBytesPerRow();
  switch(a1)
  {
    case 0uLL:
      if (!a2)
      {
        LODWORD(a2) = 0x2000;
        int v21 = 2;
        goto LABEL_20;
      }
      space = CGColorSpaceRetain((CGColorSpaceRef)a2);
      LODWORD(a2) = 0x2000;
      int v21 = 2;
      goto LABEL_21;
    case 1uLL:
      if (a2)
      {
        space = CGColorSpaceRetain((CGColorSpaceRef)a2);
        LODWORD(a2) = 0x2000;
        int v21 = 6;
      }
      else
      {
        LODWORD(a2) = 0x2000;
        int v21 = 6;
LABEL_20:
        space = CGColorSpaceCreateDeviceRGB();
      }
      goto LABEL_21;
    case 2uLL:
      if (a2)
      {
        v45 = [MEMORY[0x1E4F28B00] currentHandler];
        v46 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
        [v45 handleFailureInFunction:v46 file:@"SBFImageUtilities.m" lineNumber:683 description:@"cannot provide a colorSpace if context type is gray"];
      }
      int v21 = 1;
      space = CGColorSpaceCreateDeviceGray();
      goto LABEL_14;
    case 3uLL:
      if (a2)
      {
        v47 = [MEMORY[0x1E4F28B00] currentHandler];
        v48 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
        [v47 handleFailureInFunction:v48 file:@"SBFImageUtilities.m" lineNumber:689 description:@"cannot provide a colorSpace if context type is gray"];
      }
      space = CGColorSpaceCreateDeviceGray();
      goto LABEL_13;
    case 4uLL:
      if (a2)
      {
        a2 = [MEMORY[0x1E4F28B00] currentHandler];
        v49 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
        [(id)a2 handleFailureInFunction:v49 file:@"SBFImageUtilities.m" lineNumber:695 description:@"cannot provide a colorSpace if context type is alphaOnly"];

        space = 0;
        LODWORD(a2) = 0;
      }
      else
      {
        space = 0;
      }
      int v21 = 7;
      goto LABEL_21;
    default:
      space = 0;
LABEL_13:
      int v21 = 0;
LABEL_14:
      LODWORD(a2) = 0;
LABEL_21:
      unint64_t v54 = a1;
      size_t v55 = bytesPerRow * v20;
      if (v15)
      {
        unint64_t v22 = [v15 slotLength];
        if (bytesPerRow * v20 > v22)
        {
          unint64_t v37 = v22;
          v50 = [MEMORY[0x1E4F28B00] currentHandler];
          v38 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage *_SBFCGBitmapImageCreate(CGSize, CGFloat, SBFGraphicsContextType, CGColorSpaceRef, CPMemoryPool *__strong, __strong SBFGraphicsDrawBlock, __strong SBFGraphicsCreateImageBlock)");
          SBFGraphicsContextTypeDescription(a1);
          size_t v52 = v20;
          size_t v39 = v19;
          v40 = v18;
          v41 = v16;
          v43 = id v42 = v15;
          v62.width = a6;
          v62.height = a7;
          v44 = NSStringFromCGSize(v62);
          [v50 handleFailureInFunction:v38, @"SBFImageUtilities.m", 704, @"requested slot length (%zd) larger than maximum slotLength (%zd), not large enough for %@ context with dimensions %@ @%fx", v55, v37, v43, v44, *(void *)&a8 file lineNumber description];

          id v15 = v42;
          v16 = v41;
          v18 = v40;
          size_t v19 = v39;
          size_t v20 = v52;
        }
        Data = (void *)CGBitmapAllocateData();
      }
      else
      {
        Data = 0;
      }
      uint32_t v24 = a2 | v21;
      v25 = CGBitmapContextCreate(Data, v19, v20, 8uLL, bytesPerRow, space, v24);
      v63.size.width = (double)v19;
      v63.origin.x = 0.0;
      v63.origin.y = 0.0;
      v63.size.height = (double)v20;
      CGContextClearRect(v25, v63);
      if (v16)
      {
        CGContextTranslateCTM(v25, 0.0, (double)v20);
        CGContextScaleCTM(v25, a8, -a8);
        CGContextGetCTM(&v59, v25);
        CGContextSetBaseCTM();
        UIGraphicsPushContext(v25);
        v16[2](v16);
        UIGraphicsPopContext();
      }
      if (Data)
      {
        v51 = v18;
        v26 = v16;
        v27 = v15;
        size_t v28 = 8 * v53;
        v29 = v27;
        CFDataRef v30 = [v27 nextSlotWithBytes:Data length:v55];
        v31 = CGDataProviderCreateWithCFData(v30);
        if (v54 == 4)
        {
          *(_OWORD *)decode = xmmword_18B5E44E0;
          CGImageRef v32 = CGImageMaskCreate(v19, v20, 8uLL, v28, bytesPerRow, v31, decode, 0);
        }
        else
        {
          CGImageRef v32 = CGImageCreate(v19, v20, 8uLL, v28, bytesPerRow, space, v24, v31, 0, 0, kCGRenderingIntentDefault);
        }
        Image = v32;
        CGDataProviderRelease(v31);
        CGBitmapFreeData();

        id v15 = v29;
        v16 = v26;
        v18 = v51;
      }
      else
      {
        Image = CGBitmapContextCreateImage(v25);
      }
      if (v56)
      {
        uint64_t v34 = ((void (**)(void, CGImage *, void, double))v56)[2](v56, Image, 0, a8);
      }
      else
      {
        uint64_t v34 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:a8];
      }
      uint64_t v35 = v34;
      CGImageRelease(Image);
      CGColorSpaceRelease(space);
      CGContextRelease(v25);

      return v35;
  }
}

uint64_t _SBFGraphicsContextComponentsCountForType(unint64_t a1)
{
  if (a1 < 5) {
    return qword_18B5E44B0[a1];
  }
  v3 = [MEMORY[0x1E4F28B00] currentHandler];
  v4 = [NSString stringWithUTF8String:"size_t _SBFGraphicsContextComponentsCountForType(SBFGraphicsContextType)"];
  double v5 = SBFGraphicsContextTypeDescription(a1);
  [v3 handleFailureInFunction:v4, @"SBFImageUtilities.m", 652, @"unrecognized type=%@", v5 file lineNumber description];

  return 0;
}

id _SBModifyFrameRateForAnimationBlockFromSettings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = (void *)MEMORY[0x18C133210](v3);
  [v4 frameRateRange];
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  v12 = [v4 preferredFrameRateRange];

  int v13 = [v12 highFrameRateReason];
  v24.minimum = v7;
  v24.maximum = v9;
  v24.preferred = v11;
  if (!CAFrameRateRangeIsEqualToRange(v24, *MEMORY[0x1E4F39AF0]))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = ___SBModifyFrameRateForAnimationBlockFromSettings_block_invoke;
    v17[3] = &unk_1E548DE40;
    float v19 = v7;
    float v20 = v9;
    float v21 = v11;
    int v22 = v13;
    id v18 = v3;
    uint64_t v14 = MEMORY[0x18C133210](v17);

    double v5 = (void *)v14;
  }
  id v15 = (void *)MEMORY[0x18C133210](v5);

  return v15;
}

uint64_t SBFEffectiveArtworkSubtype()
{
  if (SBFEffectiveArtworkSubtype_onceToken != -1) {
    dispatch_once(&SBFEffectiveArtworkSubtype_onceToken, &__block_literal_global_19);
  }
  return SBFEffectiveArtworkSubtype_deviceSubtype;
}

id SBLogReusableViewCache()
{
  if (SBLogReusableViewCache_onceToken != -1) {
    dispatch_once(&SBLogReusableViewCache_onceToken, &__block_literal_global_16);
  }
  int v0 = (void *)SBLogReusableViewCache___logObj;
  return v0;
}

BOOL SBFInterfaceOrientationMaskContainsInterfaceOrientation(char a1, char a2)
{
  return ((1 << a2) & 0x1E & (unint64_t)a1) != 0;
}

uint64_t SBFAudioCategoriesDisablingVolumeHUDIncludesCategory(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    if ([v3 count]) {
      uint64_t v6 = [v3 containsObject:v5];
    }
    else {
      uint64_t v6 = 1;
    }
  }

  return v6;
}

__CFString *_SBFZStackParticipantIdentifierDescription(unint64_t a1)
{
  if (a1 > 0x1F) {
    return 0;
  }
  else {
    return off_1E548D950[a1];
  }
}

id SBFAudioCategoriesDisablingVolumeHUDUnion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  if (v3 && v4)
  {
    if ([v3 count])
    {
      if ([v5 count])
      {
        id v6 = [v3 setByAddingObjectsFromSet:v5];
      }
      else
      {
        id v6 = v5;
      }
    }
    else
    {
      id v6 = v3;
    }
  }
  else
  {
    if (v3) {
      float v7 = v3;
    }
    else {
      float v7 = v4;
    }
    id v6 = v7;
  }
  float v8 = v6;

  return v8;
}

uint64_t (*_get_MKBGetDeviceLockStateInfo())(uint64_t a1)
{
  int v0 = _os_feature_enabled_impl();
  uint64_t v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F780B8];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBGetDeviceLockStateInfoSymbolLoc = get_LAMKBGetDeviceLockStateInfoSymbolLoc(),
          uint64_t v1 = __LAMKBGetDeviceLockStateInfo,
          !LAMKBGetDeviceLockStateInfoSymbolLoc))
    {
      id v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBGetDeviceLockStateInfo_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t))MEMORY[0x1E4F780B8];
    }
  }
  return v1;
}

BOOL SBFIsMoreForegroundAppsAvailable()
{
  int v0 = atomic_load(__MoreForegroundAppsStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBMoreForegroundApps", 0, __MoreForegroundAppsStorage, MoreForegroundAppsDefaultValueFunction) == 0;
  }
  return !v1;
}

BOOL SBFIsChamoisStripDisabledWhenHiddenAvailable()
{
  int v0 = atomic_load(__ChamoisStripDisabledWhenHiddenStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBChamoisStripDisabledWhenHidden", 0, __ChamoisStripDisabledWhenHiddenStorage, ChamoisStripDisabledWhenHiddenDefaultValueFunction) == 0;
  }
  return !v1;
}

__CFString *NSStringFromSBFIdleTimerMode(unint64_t a1)
{
  if (a1 > 3) {
    return @"<unknown>";
  }
  else {
    return off_1E548D1E8[a1];
  }
}

__CFString *NSStringFromIdleWarnMode(unint64_t a1)
{
  if (a1 > 2) {
    return @"(none)";
  }
  else {
    return off_1E548D280[a1];
  }
}

__CFString *NSStringFromIdleTimerDuration(unint64_t a1)
{
  if (a1 > 0xE) {
    return @"(none)";
  }
  else {
    return off_1E548D208[a1];
  }
}

double convertDampingRatioAndResponseToTensionAndFriction(double *a1, double *a2, double result, double a4)
{
  double v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1) {
    *a1 = v4;
  }
  if (a2)
  {
    double v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

uint64_t SBFEdgeInsetsRotateToInterfaceOrientation(uint64_t result)
{
  if (result == 2 || result == 3 || result == 4) {
    return UIEdgeInsetsRotate();
  }
  return result;
}

BOOL SBFPointEqualToPointAtScale(double a1, double a2, double a3, double a4, double a5)
{
  double v5 = a5;
  if (fabs(a5) < 2.22044605e-16)
  {
    uint64_t v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    double v5 = v11;
  }
  return vabdd_f64(a1 * v5, a3 * v5) < 2.22044605e-16 && vabdd_f64(a2 * v5, a4 * v5) < 2.22044605e-16;
}

void SBFApplyParallaxSettingsToView(void *a1, void *a2)
{
}

void __SBFPreheatImageData_block_invoke_2(uint64_t a1)
{
  DataProvider = CGImageGetDataProvider((CGImageRef)[*(id *)(a1 + 32) CGImage]);
  if (DataProvider)
  {
    CFDataRef v2 = CGDataProviderCopyData(DataProvider);
    if (v2)
    {
      CFDataRef v3 = v2;
      CFIndex Length = CFDataGetLength(v2);
      if (Length >= 0x200000)
      {
        uint64_t v6 = SBLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __SBFPreheatImageData_block_invoke_2_cold_1(Length, v6, v7, v8, v9, v10, v11, v12);
        }
      }
      else
      {
        BytePtr = (UInt8 *)CFDataGetBytePtr(v3);
        madvise(BytePtr, Length, 3);
      }
      CFRelease(v3);
    }
  }
}

uint64_t SBFBSInterfaceOrientationMaskForBSInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

double SBFRectRoundForScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9 = SBFFloatRoundForScale(a1, a5);
  SBFFloatRoundForScale(a2, a5);
  SBFFloatRoundForScale(a3, a5);
  SBFFloatRoundForScale(a4, a5);
  return v9;
}

double SBFFloatRoundForScale(double a1, double a2)
{
  double v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    double v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 scale];
    double v2 = v5;
  }
  return round(v2 * a1) / v2;
}

double SBFFloatCeilForScale(double a1, double a2)
{
  double v2 = a2;
  if (fabs(a2) < 2.22044605e-16)
  {
    double v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 scale];
    double v2 = v5;
  }
  return ceil(v2 * a1) / v2;
}

id SBFSafeCast(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    CFDataRef v3 = v2;
  }
  else {
    CFDataRef v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id SBFSafeProtocolCast(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:a1]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void SBFPreheatImageData(void *a1)
{
  id v1 = a1;
  if (SBFPreheatImageData_onceToken != -1) {
    dispatch_once(&SBFPreheatImageData_onceToken, &__block_literal_global_24);
  }
  id v2 = SBFPreheatImageData_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SBFPreheatImageData_block_invoke_2;
  block[3] = &unk_1E548CA88;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

__CFString *SBStringFromAnimationUpdateMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unspecified";
  }
  else {
    return off_1E548DED8[a1 - 1];
  }
}

__CFString *SBFDescriptionForSensorType(unint64_t a1)
{
  if (a1 > 2) {
    return @"invalid";
  }
  else {
    return off_1E548E1A0[a1];
  }
}

BOOL SBFIsSAEHungryHomeAffordanceAvailable()
{
  int v0 = atomic_load((unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBSAEHungryHomeAffordance", 0, (unsigned __int8 *)&__SAEHungryHomeAffordanceStorage, SAEHungryHomeAffordanceDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation();
  v5.n128_u64[0] = 0;
  v6.n128_u64[0] = 0;
  if (a1 != 1)
  {
    if (a1 == 3)
    {
      v6.n128_u64[0] = 0x3FF921FB54442D18;
    }
    else if (a1 == 4)
    {
      v6.n128_u64[0] = 0xBFF921FB54442D18;
    }
    else
    {
      v6.n128_u64[0] = 0x400921FB54442D18;
      if (a1 != 2) {
        v6.n128_f64[0] = 0.0;
      }
    }
  }
  if (a2 != 1)
  {
    if (a2 == 3)
    {
      v5.n128_u64[0] = 0x3FF921FB54442D18;
    }
    else if (a2 == 4)
    {
      v5.n128_u64[0] = 0xBFF921FB54442D18;
    }
    else
    {
      v5.n128_u64[0] = 0x400921FB54442D18;
      if (a2 != 2) {
        v5.n128_f64[0] = 0.0;
      }
    }
  }
  return MEMORY[0x1F4102EB0](v4, v6, v5);
}

uint64_t _SBF_Private_IsD94Like()
{
  if (_SBF_Private_IsD94Like_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD94Like_onceToken, &__block_literal_global_81);
  }
  return _SBF_Private_IsD94Like_isD94Like;
}

uint64_t _SBF_Private_IsD64Like()
{
  if (_SBF_Private_IsD64Like_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD64Like_onceToken, &__block_literal_global_59);
  }
  return _SBF_Private_IsD64Like_isD64Like;
}

void SBFApplyParallaxSettingsToViewWithFactor(void *a1, void *a2, double a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  if (v6)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v8 = objc_msgSend(v6, "_motionEffects", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 _removeMotionEffect:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v10);
    }

    int v13 = [v5 slideEnabled];
    if (fabs(a3) >= 2.22044605e-16 && v13)
    {
      if ([v5 tiltEnabled])
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F43270]);
        [v5 slidePixelsX];
        double v16 = v15 * (double)[v5 slideDirectionX] * 0.5 * a3;
        [v5 slidePixelsY];
        double v18 = v17 * (double)[v5 slideDirectionY] * 0.5 * a3;
        objc_msgSend(v14, "setSlideMagnitude:", v16, v18);
        if ([v5 increaseEnabled])
        {
          [v5 slideIncreaseX];
          [v14 setHorizontalSlideAccelerationBoostFactor:fabs(v19 * a3 * 0.5 / v16)];
          [v5 slideIncreaseY];
          [v14 setVerticalSlideAccelerationBoostFactor:fabs(v20 * a3 * 0.5 / v18)];
        }
        objc_msgSend(v14, "setRotatingSphereRadius:", (double)-objc_msgSend(v5, "distanceFromScreen") * a3);
        [v5 tiltDegreesX];
        objc_msgSend(v14, "setMaximumHorizontalTiltAngle:", -(v21 * (double)objc_msgSend(v5, "tiltDirectionX")) * a3 * 0.0174532925);
        [v5 tiltDegreesY];
        objc_msgSend(v14, "setMaximumVerticalTiltAngle:", -(v22 * (double)objc_msgSend(v5, "tiltDirectionY")) * a3 * 0.0174532925);
        [v7 _addMotionEffect:v14];
      }
      else
      {
        [v5 slidePixelsX];
        objc_msgSend(v7, "_setVisualAltitude:");
        [v5 slidePixelsY];
        double v24 = v23;
        [v5 slidePixelsX];
        objc_msgSend(v7, "_setVisualAltitudeBias:", 1.0, v24 / v25);
      }
    }
    [v7 bounds];
    if (v27 <= v26)
    {
      double v30 = v26;
      [v5 tiltDegreesX];
      double v28 = v30;
    }
    else
    {
      double v28 = v27;
      [v5 tiltDegreesY];
    }
    double v31 = v28 * -0.5;
    double v32 = tan(v29 * 0.0174532925);
    v33 = [v7 layer];
    [v33 setZPosition:v31 * v32];
  }
}

void sub_18B53AF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SBFLoggingMethodProem(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = _NSFullMethodName();
  id v5 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 rangeOfString:@" "];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      uint64_t v8 = NSString;
      uint64_t v9 = [v5 substringToIndex:v6];
      uint64_t v10 = [v5 substringFromIndex:v7 + 1];
      uint64_t v11 = [v8 stringWithFormat:@"%@ (%p) %@", v9, v3, v10];

      id v5 = (void *)v11;
    }
  }

  return v5;
}

void sub_18B53D0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B53D268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B53D41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B53D800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18B53E2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreTelephonyLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreTelephonyLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E548C958;
    uint64_t v4 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreTelephonyLibraryCore_frameworkLibrary;
  if (!CoreTelephonyLibraryCore_frameworkLibrary) {
    CoreTelephonyLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreTelephonyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreTelephonyLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCTBasebandSettingsEraseEFSSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreTelephonyLibrary();
  uint64_t result = dlsym(v2, "kCTBasebandSettingsEraseEFS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTBasebandSettingsEraseEFSSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SecurityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SecurityLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getIDSHardDeregisterSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __IDSLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E548C9A8;
    uint64_t v6 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)IDSLibraryCore_frameworkLibrary;
  if (!IDSLibraryCore_frameworkLibrary) {
    __getIDSHardDeregisterSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "IDSHardDeregister");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIDSHardDeregisterSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IDSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IDSLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAKUnregisterAllAppleIDsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __AuthKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E548C9C0;
    uint64_t v6 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)AuthKitLibraryCore_frameworkLibrary;
  if (!AuthKitLibraryCore_frameworkLibrary) {
    __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "AKUnregisterAllAppleIDs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAKUnregisterAllAppleIDsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_18B53F3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBFHandleRemoteBasebandLoggingStatusChanged()
{
}

uint64_t CellularLoggingLibraryCore()
{
  if (!CellularLoggingLibraryCore_frameworkLibrary) {
    CellularLoggingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CellularLoggingLibraryCore_frameworkLibrary;
}

uint64_t __CellularLoggingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CellularLoggingLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCellularLoggingClass_block_invoke(uint64_t a1)
{
  long long v3 = 0;
  if (!CellularLoggingLibraryCore()) {
    __getCellularLoggingClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("CellularLogging");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCellularLoggingClass_block_invoke_cold_2();
  }
  getCellularLoggingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __SBFHandleRemoteBasebandLoggingStatusChanged_block_invoke()
{
  id v0 = +[SBFRemoteBasebandLoggingManager sharedInstance];
  [v0 _notifyObservers];
}

uint64_t SBFMagicWallpaperEnumeration()
{
  return MEMORY[0x1F4139FE8]();
}

uint64_t SBFStringForWallpaperLocations()
{
  return MEMORY[0x1F413A020]();
}

uint64_t SBFStringForWallpaperType()
{
  return MEMORY[0x1F413A030]();
}

uint64_t SBFStringForWallpaperMode()
{
  return MEMORY[0x1F413A028]();
}

uint64_t SBFStringForWallpaperVariant()
{
  return MEMORY[0x1F413A038]();
}

uint64_t SBFMagicWallpaperThumbnail()
{
  return MEMORY[0x1F413A000]();
}

uint64_t SBFMagicWallpaperRepresentativeThumbnailForClass()
{
  return MEMORY[0x1F4139FF8]();
}

uint64_t _SBFWallpaperRegisterForExternalChangeNotification()
{
  return MEMORY[0x1F413A018]();
}

uint64_t (*_get_MKBLockDevice())(uint64_t a1)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F780E0];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (LAMKBLockDeviceSymbolLoc = get_LAMKBLockDeviceSymbolLoc(), BOOL v1 = __LAMKBLockDevice, !LAMKBLockDeviceSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBLockDevice_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t))MEMORY[0x1E4F780E0];
    }
  }
  return v1;
}

uint64_t __LAMKBLockDevice(uint64_t a1)
{
  uint64_t LAMKBLockDeviceSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBLockDeviceSymbolLoc();
  if (!LAMKBLockDeviceSymbolLoc) {
    __LAMKBLockDevice_cold_1();
  }
  return LAMKBLockDeviceSymbolLoc(a1);
}

uint64_t (*_get_MKBUnlockDevice())(uint64_t a1, uint64_t a2)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F780F0];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBUnlockDeviceSymbolLoc = get_LAMKBUnlockDeviceSymbolLoc(),
          BOOL v1 = __LAMKBUnlockDevice,
          !LAMKBUnlockDeviceSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBUnlockDevice_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F780F0];
    }
  }
  return v1;
}

uint64_t __LAMKBUnlockDevice(uint64_t a1, uint64_t a2)
{
  uint64_t LAMKBUnlockDeviceSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))get_LAMKBUnlockDeviceSymbolLoc();
  if (!LAMKBUnlockDeviceSymbolLoc) {
    __LAMKBUnlockDevice_cold_1();
  }
  return LAMKBUnlockDeviceSymbolLoc(a1, a2);
}

uint64_t (*_get_MKBGetDeviceConfigurations())(uint64_t a1)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F780A0];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBGetDeviceConfigurationsSymbolLoc = get_LAMKBGetDeviceConfigurationsSymbolLoc(),
          BOOL v1 = __LAMKBGetDeviceConfigurations,
          !LAMKBGetDeviceConfigurationsSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBGetDeviceConfigurations_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t))MEMORY[0x1E4F780A0];
    }
  }
  return v1;
}

uint64_t __LAMKBGetDeviceConfigurations(uint64_t a1)
{
  uint64_t LAMKBGetDeviceConfigurationsSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBGetDeviceConfigurationsSymbolLoc();
  if (!LAMKBGetDeviceConfigurationsSymbolLoc) {
    __LAMKBGetDeviceConfigurations_cold_1();
  }
  return LAMKBGetDeviceConfigurationsSymbolLoc(a1);
}

uint64_t (*_get_MKBGetDeviceLockState())(uint64_t a1)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F780A8];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBGetDeviceLockStateSymbolLoc = get_LAMKBGetDeviceLockStateSymbolLoc(),
          BOOL v1 = __LAMKBGetDeviceLockState,
          !LAMKBGetDeviceLockStateSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBGetDeviceLockState_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t))MEMORY[0x1E4F780A8];
    }
  }
  return v1;
}

uint64_t __LAMKBGetDeviceLockState(uint64_t a1)
{
  uint64_t LAMKBGetDeviceLockStateSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBGetDeviceLockStateSymbolLoc();
  if (!LAMKBGetDeviceLockStateSymbolLoc) {
    __LAMKBGetDeviceLockState_cold_1();
  }
  return LAMKBGetDeviceLockStateSymbolLoc(a1);
}

uint64_t __LAMKBGetDeviceLockStateInfo(uint64_t a1)
{
  uint64_t LAMKBGetDeviceLockStateInfoSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBGetDeviceLockStateInfoSymbolLoc();
  if (!LAMKBGetDeviceLockStateInfoSymbolLoc) {
    __LAMKBGetDeviceLockStateInfo_cold_1();
  }
  return LAMKBGetDeviceLockStateInfoSymbolLoc(a1);
}

uint64_t (*_get_MKBDeviceUnlockedSinceBoot())()
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)())MEMORY[0x1E4F78088];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBDeviceUnlockedSinceBootSymbolLoc = get_LAMKBDeviceUnlockedSinceBootSymbolLoc(),
          BOOL v1 = __LAMKBDeviceUnlockedSinceBoot,
          !LAMKBDeviceUnlockedSinceBootSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBDeviceUnlockedSinceBoot_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)())MEMORY[0x1E4F78088];
    }
  }
  return v1;
}

uint64_t __LAMKBDeviceUnlockedSinceBoot()
{
  uint64_t LAMKBDeviceUnlockedSinceBootSymbolLoc = (uint64_t (*)(void))get_LAMKBDeviceUnlockedSinceBootSymbolLoc();
  if (!LAMKBDeviceUnlockedSinceBootSymbolLoc) {
    __LAMKBDeviceUnlockedSinceBoot_cold_1();
  }
  return LAMKBDeviceUnlockedSinceBootSymbolLoc();
}

uint64_t (*_get_MKBDeviceLockAssertion())(uint64_t a1, uint64_t a2)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F78080];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBDeviceLockAssertionSymbolLoc = get_LAMKBDeviceLockAssertionSymbolLoc(),
          BOOL v1 = __LAMKBDeviceLockAssertion,
          !LAMKBDeviceLockAssertionSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBDeviceLockAssertion_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F78080];
    }
  }
  return v1;
}

uint64_t __LAMKBDeviceLockAssertion(uint64_t a1, uint64_t a2)
{
  uint64_t LAMKBDeviceLockAssertionSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))get_LAMKBDeviceLockAssertionSymbolLoc();
  if (!LAMKBDeviceLockAssertionSymbolLoc) {
    __LAMKBDeviceLockAssertion_cold_1();
  }
  return LAMKBDeviceLockAssertionSymbolLoc(a1, a2);
}

uint64_t (*_get_MKBKeyBagKeyStashCreateWithOpts())(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E4F780C8];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (v2 = get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc(), BOOL v1 = __LAMKBKeyBagKeyStashCreateWithOpts, !v2))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBKeyBagKeyStashCreateWithOpts_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E4F780C8];
    }
  }
  return v1;
}

uint64_t __LAMKBKeyBagKeyStashCreateWithOpts(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc();
  if (!v8) {
    __LAMKBKeyBagKeyStashCreateWithOpts_cold_1();
  }
  return v8(a1, a2, a3, a4);
}

uint64_t (*_get_MKBKeyBagKeyStashCommit())()
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)())MEMORY[0x1E4F780C0];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBKeyBagKeyStashCommitSymbolLoc = get_LAMKBKeyBagKeyStashCommitSymbolLoc(),
          BOOL v1 = __LAMKBKeyBagKeyStashCommit,
          !LAMKBKeyBagKeyStashCommitSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBKeyBagKeyStashCommit_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)())MEMORY[0x1E4F780C0];
    }
  }
  return v1;
}

uint64_t __LAMKBKeyBagKeyStashCommit()
{
  uint64_t LAMKBKeyBagKeyStashCommitSymbolLoc = (uint64_t (*)(void))get_LAMKBKeyBagKeyStashCommitSymbolLoc();
  if (!LAMKBKeyBagKeyStashCommitSymbolLoc) {
    __LAMKBKeyBagKeyStashCommit_cold_1();
  }
  return LAMKBKeyBagKeyStashCommitSymbolLoc();
}

uint64_t (*_get_MKBKeyBagKeyStashVerify())()
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)())MEMORY[0x1E4F780D0];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBKeyBagKeyStashVerifySymbolLoc = get_LAMKBKeyBagKeyStashVerifySymbolLoc(),
          BOOL v1 = __LAMKBKeyBagKeyStashVerify,
          !LAMKBKeyBagKeyStashVerifySymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBKeyBagKeyStashVerify_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)())MEMORY[0x1E4F780D0];
    }
  }
  return v1;
}

uint64_t __LAMKBKeyBagKeyStashVerify()
{
  uint64_t LAMKBKeyBagKeyStashVerifySymbolLoc = (uint64_t (*)(void))get_LAMKBKeyBagKeyStashVerifySymbolLoc();
  if (!LAMKBKeyBagKeyStashVerifySymbolLoc) {
    __LAMKBKeyBagKeyStashVerify_cold_1();
  }
  return LAMKBKeyBagKeyStashVerifySymbolLoc();
}

uint64_t (*_get_MKBEventsRegister())(void *a1, void *a2)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(void *, void *))MEMORY[0x1E4F78090];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBEventsRegisterSymbolLoc = get_LAMKBEventsRegisterSymbolLoc(),
          BOOL v1 = __LAMKBEventsRegister,
          !LAMKBEventsRegisterSymbolLoc))
    {
      long long v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBEventsRegister_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(void *, void *))MEMORY[0x1E4F78090];
    }
  }
  return v1;
}

uint64_t __LAMKBEventsRegister(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t LAMKBEventsRegisterSymbolLoc = (uint64_t (*)(id, id))get_LAMKBEventsRegisterSymbolLoc();
  if (!LAMKBEventsRegisterSymbolLoc) {
    __LAMKBEventsRegister_cold_1();
  }
  uint64_t v6 = LAMKBEventsRegisterSymbolLoc(v3, v4);

  return v6;
}

uint64_t (*_get_MKBEventsUnregister())(uint64_t a1)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F78098];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBEventsUnregisterSymbolLoc = get_LAMKBEventsUnregisterSymbolLoc(),
          BOOL v1 = __LAMKBEventsUnregister,
          !LAMKBEventsUnregisterSymbolLoc))
    {
      id v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBEventsUnregister_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t))MEMORY[0x1E4F78098];
    }
  }
  return v1;
}

uint64_t __LAMKBEventsUnregister(uint64_t a1)
{
  uint64_t LAMKBEventsUnregisterSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBEventsUnregisterSymbolLoc();
  if (!LAMKBEventsUnregisterSymbolLoc) {
    __LAMKBEventsUnregister_cold_1();
  }
  return LAMKBEventsUnregisterSymbolLoc(a1);
}

uint64_t (*_get_MKBKeyBagPerformRecovery())(uint64_t a1, uint64_t a2)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F780D8];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (uint64_t LAMKBKeyBagPerformRecoverySymbolLoc = get_LAMKBKeyBagPerformRecoverySymbolLoc(),
          BOOL v1 = __LAMKBKeyBagPerformRecovery,
          !LAMKBKeyBagPerformRecoverySymbolLoc))
    {
      id v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBKeyBagPerformRecovery_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F780D8];
    }
  }
  return v1;
}

uint64_t __LAMKBKeyBagPerformRecovery(uint64_t a1, uint64_t a2)
{
  uint64_t LAMKBKeyBagPerformRecoverySymbolLoc = (uint64_t (*)(uint64_t, uint64_t))get_LAMKBKeyBagPerformRecoverySymbolLoc();
  if (!LAMKBKeyBagPerformRecoverySymbolLoc) {
    __LAMKBKeyBagPerformRecovery_cold_1();
  }
  return LAMKBKeyBagPerformRecoverySymbolLoc(a1, a2);
}

uint64_t (*_get_MKBPrewarmSPS())(uint64_t a1)
{
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F780E8];
  if (v0)
  {
    if (!LocalAuthenticationLibraryCore()
      || (LAMKBPrewarmSPSSymbolLoc = get_LAMKBPrewarmSPSSymbolLoc(), BOOL v1 = __LAMKBPrewarmSPS, !LAMKBPrewarmSPSSymbolLoc))
    {
      id v3 = SBLogAuthenticationKeybag();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _get_MKBPrewarmSPS_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      return (uint64_t (*)(uint64_t))MEMORY[0x1E4F780E8];
    }
  }
  return v1;
}

uint64_t __LAMKBPrewarmSPS(uint64_t a1)
{
  uint64_t LAMKBPrewarmSPSSymbolLoc = (uint64_t (*)(uint64_t))get_LAMKBPrewarmSPSSymbolLoc();
  if (!LAMKBPrewarmSPSSymbolLoc) {
    __LAMKBPrewarmSPS_cold_1();
  }
  return LAMKBPrewarmSPSSymbolLoc(a1);
}

void sub_18B542E34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
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

void sub_18B5444AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LocalAuthenticationLibraryCore()
{
  if (!LocalAuthenticationLibraryCore_frameworkLibrary) {
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return LocalAuthenticationLibraryCore_frameworkLibrary;
}

uint64_t get_LAMKBLockDeviceSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBLockDeviceSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBLockDeviceSymbolLoc_ptr;
  if (!get_LAMKBLockDeviceSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBLockDevice");
    get_LAMKBLockDeviceSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B5454E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t LocalAuthenticationLibrary()
{
  BOOL v1 = 0;
  uint64_t result = LocalAuthenticationLibraryCore();
  if (!result) {
    LocalAuthenticationLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t get_LAMKBUnlockDeviceSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBUnlockDeviceSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBUnlockDeviceSymbolLoc_ptr;
  if (!get_LAMKBUnlockDeviceSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBUnlockDevice");
    get_LAMKBUnlockDeviceSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B5456F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBGetDeviceConfigurationsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr;
  if (!get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBGetDeviceConfigurations");
    get_LAMKBGetDeviceConfigurationsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBGetDeviceLockStateSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBGetDeviceLockStateSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!get_LAMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBGetDeviceLockState");
    get_LAMKBGetDeviceLockStateSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBGetDeviceLockStateInfoSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  if (!get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBGetDeviceLockStateInfo");
    get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBDeviceUnlockedSinceBootSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBDeviceUnlockedSinceBoot");
    get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBDeviceLockAssertionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBDeviceLockAssertionSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!get_LAMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBDeviceLockAssertion");
    get_LAMKBDeviceLockAssertionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  if (!get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBKeyBagKeyStashCreateWithOpts");
    get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBKeyBagKeyStashCommitSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  if (!get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBKeyBagKeyStashCommit");
    get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B545FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBKeyBagKeyStashVerifySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  uint64_t v6 = get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  if (!get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBKeyBagKeyStashVerify");
    get_LAMKBKeyBagKeyStashVerifySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B5460F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBEventsRegisterSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBEventsRegisterSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBEventsRegisterSymbolLoc_ptr;
  if (!get_LAMKBEventsRegisterSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBEventsRegister");
    get_LAMKBEventsRegisterSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B546230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBEventsUnregisterSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBEventsUnregisterSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBEventsUnregisterSymbolLoc_ptr;
  if (!get_LAMKBEventsUnregisterSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBEventsUnregister");
    get_LAMKBEventsUnregisterSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B546370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBKeyBagPerformRecoverySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr;
  uint64_t v6 = get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr;
  if (!get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBKeyBagPerformRecovery");
    get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B5464B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_LAMKBPrewarmSPSSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = get_LAMKBPrewarmSPSSymbolLoc_ptr;
  uint64_t v6 = get_LAMKBPrewarmSPSSymbolLoc_ptr;
  if (!get_LAMKBPrewarmSPSSymbolLoc_ptr)
  {
    BOOL v1 = (void *)LocalAuthenticationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "_LAMKBPrewarmSPS");
    get_LAMKBPrewarmSPSSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18B5465F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id SBFWindowForViewControllerTransition(void *a1)
{
  BOOL v1 = [a1 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 window];
  }
  uint64_t v3 = v2;

  return v3;
}

__CFString *SBFStringForAppearState(unsigned int a1)
{
  if (a1 > 3) {
    return @"[Invalid]";
  }
  else {
    return off_1E548CC50[a1];
  }
}

BOOL SBFIsSymbolicLinkAtPath(void *a1)
{
  memset(&v3, 0, sizeof(v3));
  return !lstat((const char *)objc_msgSend(a1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v3)
      && (v3.st_mode & 0xF000) == 40960;
}

double SBFModificationDateForPath(void *a1)
{
  memset(&v3, 0, sizeof(v3));
  int v1 = stat((const char *)objc_msgSend(a1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v3);
  double result = 0.0;
  if (!v1) {
    return (double)v3.st_mtimespec.tv_nsec / 1000000000.0 + (double)v3.st_mtimespec.tv_sec + -978307200.0;
  }
  return result;
}

uint64_t SBFEnsureDirectoryExistsAtPath(void *a1)
{
  id v1 = a1;
  int v2 = mkdir((const char *)[v1 fileSystemRepresentation], 0x1FFu);
  if (!v2 || v2 == -1 && *__error() == 17)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v3 = [v4 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v3;
}

id SBFCachedNSHomeDirectory()
{
  if (SBFCachedNSHomeDirectory_sbf_once_token_0 != -1) {
    dispatch_once(&SBFCachedNSHomeDirectory_sbf_once_token_0, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)SBFCachedNSHomeDirectory_sbf_once_object_0;
  return v0;
}

void __SBFCachedNSHomeDirectory_block_invoke()
{
  NSHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 copy];
  id v1 = (void *)SBFCachedNSHomeDirectory_sbf_once_object_0;
  SBFCachedNSHomeDirectory_sbf_once_object_0 = v0;
}

id SBFCachesPathForSandboxPath(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    SBFCachedNSHomeDirectory();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v2 = [v1 stringByAppendingPathComponent:@"Library/Caches"];

  return v2;
}

void _SBFScreenTimeRegisterForExternalChangeNotification()
{
  if (_SBFScreenTimeRegisterForExternalChangeNotification___once != -1) {
    dispatch_once(&_SBFScreenTimeRegisterForExternalChangeNotification___once, &__block_literal_global_3);
  }
}

uint64_t _SBFScreenTimePostExternalChangeNotification(uint64_t state64)
{
  unsigned int v1 = state64;
  LODWORD(state64) = _SBFScreenTimePostExternalChangeNotification_token;
  if (_SBFScreenTimePostExternalChangeNotification_token != -1
    || (notify_register_check("com.apple.springboard.screenchanged", &_SBFScreenTimePostExternalChangeNotification_token), state64 = _SBFScreenTimePostExternalChangeNotification_token, _SBFScreenTimePostExternalChangeNotification_token != -1))
  {
    notify_set_state(state64, v1);
    return notify_post("com.apple.springboard.screenchanged");
  }
  return state64;
}

__CFString *_SBFScreenTimeNameForCategory(unsigned int a1)
{
  if (a1 > 0x13) {
    return 0;
  }
  else {
    return off_1E548CCC8[a1];
  }
}

void sub_18B54A6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t _SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent()
{
  if (BSFloatEqualToFloat() & 1) != 0 || (BSFloatEqualToFloat()) {
    return 1;
  }
  return BSFloatEqualToFloat();
}

void sub_18B54BF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v16 - 96), 8);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B54FC5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

Class __getSBUILegibilityLabelClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SpringBoardUIServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548CEB8;
    uint64_t v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary) {
    __getSBUILegibilityLabelClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SBUILegibilityLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBUILegibilityLabelClass_block_invoke_cold_2();
  }
  getSBUILegibilityLabelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUIServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCSProminentLayoutControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoverSheetKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoverSheetKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548CED0;
    uint64_t v5 = 0;
    CoverSheetKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoverSheetKitLibraryCore_frameworkLibrary) {
    __getCSProminentLayoutControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CSProminentLayoutController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSProminentLayoutControllerClass_block_invoke_cold_2();
  }
  getCSProminentLayoutControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoverSheetKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoverSheetKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18B554CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromSBFAuthenticationState(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E548D150[a1];
  }
}

void sub_18B5562D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B557008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B5585D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_18B5589F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAAUIDeviceLocatorServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __AppleAccountUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548D138;
    uint64_t v5 = 0;
    AppleAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountUILibraryCore_frameworkLibrary) {
    __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AAUIDeviceLocatorService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAAUIDeviceLocatorServiceClass_block_invoke_cold_2();
  }
  getAAUIDeviceLocatorServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppleAccountUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_18B559684(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18B55A0C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B55A140(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B55AAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SBFFeatureAvailabilityComputeBool(void *a1, int a2, unsigned __int8 *a3, uint64_t (*a4)(void))
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  int v8 = atomic_load(a3);
  if (v8)
  {
    LOBYTE(v9) = v8 - 2;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v11 = [v10 objectForKey:v7];

    if (v11)
    {
      int v12 = [v10 BOOLForKey:v7];
      int v9 = v12;
      if (v12) {
        unsigned __int8 v13 = 3;
      }
      else {
        unsigned __int8 v13 = 2;
      }
      atomic_store(v13, a3);
      if (v12 != a2)
      {
        id v14 = SBLogFeatureFlags();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          double v15 = "NO";
          if (v9) {
            double v15 = "YES";
          }
          int v18 = 138412546;
          id v19 = v7;
          __int16 v20 = 2080;
          double v21 = v15;
          _os_log_impl(&dword_18B52E000, v14, OS_LOG_TYPE_DEFAULT, "%@=%s", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    else
    {
      if (a4) {
        int v9 = a4();
      }
      else {
        int v9 = a2;
      }
      if (v9) {
        unsigned __int8 v16 = 3;
      }
      else {
        unsigned __int8 v16 = 2;
      }
      atomic_store(v16, a3);
    }
  }
  return (char)v9;
}

BOOL SBFIsChamoisExternalDisplayControllerAvailable()
{
  int v0 = atomic_load(__ChamoisExternalDisplayControllerStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBChamoisExternalDisplayController", 0, __ChamoisExternalDisplayControllerStorage, ChamoisExternalDisplayControllerDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t ChamoisExternalDisplayControllerDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1) {
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  }
  if ((SBSupportedChamoisFeatures_sFeaturesMask & 2) == 0) {
    return 0;
  }
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithChamoisExternalDisplayController(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__ChamoisExternalDisplayControllerStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __ChamoisExternalDisplayControllerStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisExternalDisplayControllerStorage);
  return result;
}

uint64_t ChamoisWindowingUIDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1) {
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  }
  if ((SBSupportedChamoisFeatures_sFeaturesMask & 1) == 0) {
    return 0;
  }
  if (_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithChamoisWindowingUI(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__ChamoisWindowingUIStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __ChamoisWindowingUIStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisWindowingUIStorage);
  return result;
}

BOOL SBFIsChamoisOverflowGestureAvailable()
{
  int v0 = atomic_load((unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBChamoisOverflowGesture", 0, (unsigned __int8 *)&__ChamoisOverflowGestureStorage, 0) == 0;
  }
  return !v1;
}

uint64_t SBFTestWithChamoisOverflowGesture(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, (unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, (unsigned __int8 *)&__ChamoisOverflowGestureStorage);
  return result;
}

BOOL SBFIsChamoisFullScreenToStripGroupOpacityAvailable()
{
  int v0 = atomic_load(__ChamoisFullScreenToStripGroupOpacityStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBChamoisFullScreenToStripGroupOpacity", 0, __ChamoisFullScreenToStripGroupOpacityStorage, (uint64_t (*)(void))ChamoisFullScreenToStripGroupOpacityDefaultValueFunction) == 0;
  }
  return !v1;
}

BOOL ChamoisFullScreenToStripGroupOpacityDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1) {
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  }
  return SBSupportedChamoisFeatures_sFeaturesMask == -1;
}

uint64_t SBFTestWithChamoisFullScreenToStripGroupOpacity(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__ChamoisFullScreenToStripGroupOpacityStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __ChamoisFullScreenToStripGroupOpacityStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisFullScreenToStripGroupOpacityStorage);
  return result;
}

uint64_t ChamoisStripDisabledWhenHiddenDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithChamoisStripDisabledWhenHidden(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__ChamoisStripDisabledWhenHiddenStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __ChamoisStripDisabledWhenHiddenStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ChamoisStripDisabledWhenHiddenStorage);
  return result;
}

uint64_t ShellSceneKitDefaultValueFunction()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithShellSceneKit(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__ShellSceneKitStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __ShellSceneKitStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ShellSceneKitStorage);
  return result;
}

BOOL SBFIsOnenessAvailable()
{
  int v0 = atomic_load(__OnenessStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBOneness", 0, __OnenessStorage, OnenessDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t OnenessDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithOneness(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__OnenessStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __OnenessStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __OnenessStorage);
  return result;
}

BOOL SBFIsOnenessHomeScreenEditingAvailable()
{
  int v0 = atomic_load(__OnenessHomeScreenEditingStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBOnenessHomeScreenEditing", 0, __OnenessHomeScreenEditingStorage, OnenessHomeScreenEditingDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t OnenessHomeScreenEditingDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithOnenessHomeScreenEditing(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__OnenessHomeScreenEditingStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __OnenessHomeScreenEditingStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __OnenessHomeScreenEditingStorage);
  return result;
}

BOOL SBFIsOnenessHomeScreenOnEmbeddedAvailable()
{
  int v0 = atomic_load(__OnenessHomeScreenOnEmbeddedStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBOnenessHomeScreenOnEmbedded", 0, __OnenessHomeScreenOnEmbeddedStorage, OnenessHomeScreenOnEmbeddedDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t OnenessHomeScreenOnEmbeddedDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithOnenessHomeScreenOnEmbedded(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__OnenessHomeScreenOnEmbeddedStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __OnenessHomeScreenOnEmbeddedStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __OnenessHomeScreenOnEmbeddedStorage);
  return result;
}

BOOL SBFIsScreenLongevityAvailable()
{
  int v0 = atomic_load(__ScreenLongevityStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBScreenLongevity", 0, __ScreenLongevityStorage, ScreenLongevityDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t ScreenLongevityDefaultValueFunction()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return MGGetBoolAnswer();
}

uint64_t SBFTestWithScreenLongevity(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__ScreenLongevityStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __ScreenLongevityStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __ScreenLongevityStorage);
  return result;
}

BOOL SBFIsSAEPersistentSiriAvailable()
{
  int v0 = atomic_load(__SAEPersistentSiriStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBSAEPersistentSiri", 0, __SAEPersistentSiriStorage, SAEPersistentSiriDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t SAEPersistentSiriDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAEPersistentSiri(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__SAEPersistentSiriStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __SAEPersistentSiriStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __SAEPersistentSiriStorage);
  return result;
}

uint64_t MoreForegroundAppsDefaultValueFunction()
{
  if (SBSupportedChamoisFeatures_onceToken != -1) {
    dispatch_once(&SBSupportedChamoisFeatures_onceToken, &__block_literal_global_12);
  }
  if ((SBSupportedChamoisFeatures_sFeaturesMask & 1) == 0) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithMoreForegroundApps(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__MoreForegroundAppsStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __MoreForegroundAppsStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __MoreForegroundAppsStorage);
  return result;
}

uint64_t SAEHungryHomeAffordanceDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAEHungryHomeAffordance(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, (unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, (unsigned __int8 *)&__SAEHungryHomeAffordanceStorage);
  return result;
}

BOOL SBFIsSAETappyHomeAffordanceAvailable()
{
  int v0 = atomic_load(__SAETappyHomeAffordanceStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBSAETappyHomeAffordance", 0, __SAETappyHomeAffordanceStorage, SAETappyHomeAffordanceDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t SAETappyHomeAffordanceDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAETappyHomeAffordance(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__SAETappyHomeAffordanceStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __SAETappyHomeAffordanceStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __SAETappyHomeAffordanceStorage);
  return result;
}

BOOL SBFIsSAEIncreasedInsetAvailable()
{
  int v0 = atomic_load(__SAEIncreasedInsetStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBSAEIncreasedInset", 0, __SAEIncreasedInsetStorage, SAEIncreasedInsetDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t SAEIncreasedInsetDefaultValueFunction()
{
  return _os_feature_enabled_impl();
}

uint64_t SBFTestWithSAEIncreasedInset(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(__SAEIncreasedInsetStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, __SAEIncreasedInsetStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, __SAEIncreasedInsetStorage);
  return result;
}

BOOL SBFIsIRDCResetAvailable()
{
  int v0 = atomic_load((unsigned __int8 *)&__IRDCResetStorage);
  if (v0) {
    BOOL v1 = v0 == 2;
  }
  else {
    BOOL v1 = _SBFFeatureAvailabilityComputeBool(@"SBIRDCReset", 0, (unsigned __int8 *)&__IRDCResetStorage, IRDCResetDefaultValueFunction) == 0;
  }
  return !v1;
}

uint64_t IRDCResetDefaultValueFunction()
{
  return MGIsDeviceOneOfType();
}

uint64_t SBFTestWithIRDCReset(int a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&__IRDCResetStorage);
  if (a1) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 2;
  }
  atomic_store(v3, (unsigned __int8 *)&__IRDCResetStorage);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  atomic_store(v2, (unsigned __int8 *)&__IRDCResetStorage);
  return result;
}

uint64_t __SBSupportedChamoisFeatures_block_invoke()
{
  SBSupportedChamoisFeatures_sFeaturesMask = 0;
  if (MGGetBoolAnswer()) {
    SBSupportedChamoisFeatures_sFeaturesMask |= 1uLL;
  }
  uint64_t result = MGGetBoolAnswer();
  if (result) {
    SBSupportedChamoisFeatures_sFeaturesMask = -1;
  }
  return result;
}

__CFString *NSStringFromSBFAuthenticationAssertionType(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E548D1D0[a1];
  }
}

void sub_18B55E2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_18B55F490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B55F7A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t _SBF_Private_IsN84OrSimilarDevice()
{
  if (_SBF_Private_IsN84OrSimilarDevice_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsN84OrSimilarDevice_onceToken, &__block_literal_global_15);
  }
  return _SBF_Private_IsN84OrSimilarDevice_isN84OrSimilarDevice;
}

uint64_t _SBF_Private_IsN84ZoomedOrSimilarDevice()
{
  if (_SBF_Private_IsN84ZoomedOrSimilarDevice_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsN84ZoomedOrSimilarDevice_onceToken, &__block_literal_global_2);
  }
  return _SBF_Private_IsN84ZoomedOrSimilarDevice_isN84Zoomed4OrSimilarDevice;
}

uint64_t _SBF_Private_IsD33OrSimilarDevice()
{
  if (_SBF_Private_IsD33OrSimilarDevice_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD33OrSimilarDevice_onceToken, &__block_literal_global_4);
  }
  return _SBF_Private_IsD33OrSimilarDevice_isD33OrSimilarDevice;
}

uint64_t _SBF_Private_IsD52OrSimilarDevice()
{
  if (_SBF_Private_IsD52OrSimilarDevice_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD52OrSimilarDevice_onceToken, &__block_literal_global_7_0);
  }
  return _SBF_Private_IsD52OrSimilarDevice_isD52OrSimilarDevice;
}

uint64_t _SBF_Private_IsD52ZoomedOrSimilarDevice()
{
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD52ZoomedOrSimilarDevice_onceToken, &__block_literal_global_9_0);
  }
  return _SBF_Private_IsD52ZoomedOrSimilarDevice_isD52ZoomedOrSimilarDevice;
}

uint64_t _SBF_Private_IsD54()
{
  if (_SBF_Private_IsD54_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD54_onceToken, &__block_literal_global_11);
  }
  return _SBF_Private_IsD54_isD54;
}

uint64_t _SBF_Private_IsD53()
{
  if (_SBF_Private_IsD53_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD53_onceToken, &__block_literal_global_17_0);
  }
  return _SBF_Private_IsD53_isD53;
}

uint64_t _SBF_Private_IsD16()
{
  if (_SBF_Private_IsD16_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD16_onceToken, &__block_literal_global_22_0);
  }
  return _SBF_Private_IsD16_isD16;
}

uint64_t _SBF_Private_IsD17()
{
  if (_SBF_Private_IsD17_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD17_onceToken, &__block_literal_global_27);
  }
  return _SBF_Private_IsD17_isD17;
}

uint64_t _SBF_Private_IsD63()
{
  if (_SBF_Private_IsD63_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD63_onceToken, &__block_literal_global_32_0);
  }
  return _SBF_Private_IsD63_isD63;
}

uint64_t _SBF_Private_IsD64()
{
  if (_SBF_Private_IsD64_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD64_onceToken, &__block_literal_global_37);
  }
  return _SBF_Private_IsD64_isD64;
}

uint64_t _SBF_Private_IsD63Like()
{
  if (_SBF_Private_IsD63Like_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD63Like_onceToken, &__block_literal_global_42_0);
  }
  return _SBF_Private_IsD63Like_isD63Like;
}

uint64_t _SBF_Private_IsD93Like()
{
  if (_SBF_Private_IsD93Like_onceToken != -1) {
    dispatch_once(&_SBF_Private_IsD93Like_onceToken, &__block_literal_global_76);
  }
  return _SBF_Private_IsD93Like_isD93Like;
}

__CFString *SBExternalDisplayEducationReasonMaskDescription(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 3)
    {
      uint64_t v2 = @".All";
    }
    else
    {
      unsigned __int8 v3 = [MEMORY[0x1E4F28E78] string];
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      char v15 = 1;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      uint64_t v10 = __SBExternalDisplayEducationReasonMaskDescription_block_invoke;
      uint64_t v11 = &unk_1E548D5C8;
      unsigned __int8 v13 = v14;
      uint64_t v2 = v3;
      int v12 = v2;
      long long v4 = v9;
      char v16 = 0;
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
            if (v16) {
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

      _Block_object_dispose(v14, 8);
    }
  }
  else
  {
    uint64_t v2 = @".None";
  }
  return v2;
}

void sub_18B561C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SBExternalDisplayEducationReasonMaskDescription_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    uint64_t result = [*(id *)(result + 32) appendString:@"|"];
  }
  if (a2 == 1)
  {
    long long v4 = @".Satisfied";
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    long long v4 = @".NotSatisfied";
LABEL_7:
    uint64_t result = [*(id *)(v3 + 32) appendString:v4];
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = 0;
  return result;
}

void sub_18B563148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B5633D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_18B5636CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18B563774(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id SBLogAnimation()
{
  if (SBLogAnimation_onceToken != -1) {
    dispatch_once(&SBLogAnimation_onceToken, &__block_literal_global_16);
  }
  int v0 = (void *)SBLogAnimation___logObj;
  return v0;
}

uint64_t __SBLogAnimation_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Animation");
  uint64_t v1 = SBLogAnimation___logObj;
  SBLogAnimation___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBLogWallpaper()
{
  if (SBLogWallpaper_onceToken != -1) {
    dispatch_once(&SBLogWallpaper_onceToken, &__block_literal_global_7_1);
  }
  os_log_t v0 = (void *)SBLogWallpaper___logObj;
  return v0;
}

uint64_t __SBLogWallpaper_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "Wallpaper");
  uint64_t v1 = SBLogWallpaper___logObj;
  SBLogWallpaper___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __SBLogKeyWindow_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "KeyWindow");
  uint64_t v1 = SBLogKeyWindow___logObj;
  SBLogKeyWindow___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBLogTailspinSignposts()
{
  if (SBLogTailspinSignposts_onceToken != -1) {
    dispatch_once(&SBLogTailspinSignposts_onceToken, &__block_literal_global_13);
  }
  os_log_t v0 = (void *)SBLogTailspinSignposts___logObj;
  return v0;
}

uint64_t __SBLogTailspinSignposts_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "TailspinSignposts");
  uint64_t v1 = SBLogTailspinSignposts___logObj;
  SBLogTailspinSignposts___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __SBLogReusableViewCache_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "ReusableViewCache");
  uint64_t v1 = SBLogReusableViewCache___logObj;
  SBLogReusableViewCache___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBLogWebClip()
{
  if (SBLogWebClip_onceToken != -1) {
    dispatch_once(&SBLogWebClip_onceToken, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)SBLogWebClip___logObj;
  return v0;
}

uint64_t __SBLogWebClip_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "WebClip");
  uint64_t v1 = SBLogWebClip___logObj;
  SBLogWebClip___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBLogCellularLogCollection()
{
  if (SBLogCellularLogCollection_onceToken != -1) {
    dispatch_once(&SBLogCellularLogCollection_onceToken, &__block_literal_global_22_1);
  }
  os_log_t v0 = (void *)SBLogCellularLogCollection___logObj;
  return v0;
}

uint64_t __SBLogCellularLogCollection_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "CellularLogCollection");
  uint64_t v1 = SBLogCellularLogCollection___logObj;
  SBLogCellularLogCollection___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBLogFeatureFlags()
{
  if (SBLogFeatureFlags_onceToken != -1) {
    dispatch_once(&SBLogFeatureFlags_onceToken, &__block_literal_global_25);
  }
  os_log_t v0 = (void *)SBLogFeatureFlags___logObj;
  return v0;
}

uint64_t __SBLogFeatureFlags_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "FeatureFlags");
  uint64_t v1 = SBLogFeatureFlags___logObj;
  SBLogFeatureFlags___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBLogLiveRendering()
{
  if (SBLogLiveRendering_onceToken != -1) {
    dispatch_once(&SBLogLiveRendering_onceToken, &__block_literal_global_28_0);
  }
  os_log_t v0 = (void *)SBLogLiveRendering___logObj;
  return v0;
}

uint64_t __SBLogLiveRendering_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA6E58], "LiveRendering");
  uint64_t v1 = SBLogLiveRendering___logObj;
  SBLogLiveRendering___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t SBCopyCharacterUSetWithPattern(void *a1)
{
  if (!a1) {
    return 0;
  }
  [a1 cStringUsingEncoding:10];
  uint64_t v1 = uset_openPattern();
  MEMORY[0x18C1334C0](v1);
  return v1;
}

void sub_18B5655D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTMaterialLayerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreMaterialLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreMaterialLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548D818;
    uint64_t v5 = 0;
    CoreMaterialLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreMaterialLibraryCore_frameworkLibrary) {
    __getMTMaterialLayerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("MTMaterialLayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMTMaterialLayerClass_block_invoke_cold_2();
  }
  getMTMaterialLayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreMaterialLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMaterialLibraryCore_frameworkLibrary = result;
  return result;
}

void __SBFEffectiveArtworkSubtype_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFDictionaryGetValue(v0, @"ArtworkDeviceSubType");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if (v2) {
      SBFEffectiveArtworkSubtype_deviceSubtype = (int)[v2 intValue];
    }
    CFRelease(v1);
  }
}

double SBFEffectiveDisplayCornerRadius()
{
  if (SBFEffectiveDisplayCornerRadius_onceToken != -1) {
    dispatch_once(&SBFEffectiveDisplayCornerRadius_onceToken, &__block_literal_global_6);
  }
  return *(double *)&SBFEffectiveDisplayCornerRadius_displayCornerRadius;
}

double __SBFEffectiveDisplayCornerRadius_block_invoke()
{
  MGGetFloat32Answer();
  double result = v0;
  SBFEffectiveDisplayCornerRadius_displayCornerRadius = *(void *)&result;
  return result;
}

void sub_18B5662F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBFIsReducedQualityDevice()
{
  if (SBFIsReducedQualityDevice_onceToken != -1) {
    dispatch_once(&SBFIsReducedQualityDevice_onceToken, &__block_literal_global_21);
  }
  return SBFIsReducedQualityDevice_isReducedQualityDevice;
}

void __SBFIsReducedQualityDevice_block_invoke()
{
  id v1 = (id)MGGetStringAnswer();
  if ([v1 isEqualToString:@"t8010"]) {
    char v0 = 1;
  }
  else {
    char v0 = [v1 isEqualToString:@"t8011"];
  }
  SBFIsReducedQualityDevice_isReducedQualityDevice = v0;
}

void sub_18B568850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double convertTensionAndFrictionToDampingRatioAndResponse(double *a1, double *a2, double a3, double a4)
{
  double result = sqrt(a3);
  if (a1) {
    *a1 = a4 / (result + result);
  }
  if (a2)
  {
    double result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double convertDampingMassAndStiffnessToDampingRatioAndResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5 = sqrt(a5 / a4);
  if (a1)
  {
    double result = result / a4 / (v5 + v5);
    *a1 = result;
  }
  if (a2)
  {
    double result = 6.28318531 / v5;
    *a2 = 6.28318531 / v5;
  }
  return result;
}

void sub_18B56C298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B56C7E4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_18B56CE2C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_18B56D358(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

__CFString *SBFImageNameModifierSuffix(int a1, double a2, double a3)
{
  if (a1)
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v7 = a3;
    double v5 = a2;
  }
  if (__sb__runningInSpringBoard())
  {
    int v8 = SBFEffectiveDeviceClass();
    double v9 = 320.0;
    double v10 = 480.0;
    if (v8 != 2 || v5 == 320.0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v11 userInterfaceIdiom] != 1)
  {

    double v9 = 320.0;
    goto LABEL_12;
  }

  double v9 = 320.0;
  if (v5 == 320.0)
  {
LABEL_12:
    *(double *)&uint64_t v12 = 480.0;
    goto LABEL_13;
  }
LABEL_10:
  double v9 = 768.0;
  *(double *)&uint64_t v12 = 1024.0;
LABEL_13:
  double v10 = *(double *)&v12;
LABEL_14:
  if (v5 == v9)
  {
    unsigned __int8 v13 = &stru_1ED879EF8;
  }
  else
  {
    objc_msgSend(&stru_1ED879EF8, "stringByAppendingFormat:", @"-%.0fw", *(void *)&v5);
    unsigned __int8 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v7 != v10)
  {
    uint64_t v14 = [(__CFString *)v13 stringByAppendingFormat:@"-%.0fh", *(void *)&v7];

    unsigned __int8 v13 = (__CFString *)v14;
  }
  return v13;
}

id SBFModifiedImageNameForName(void *a1, int a2, double a3, double a4)
{
  id v10 = a1;
  int v11 = __sb__runningInSpringBoard();
  char v12 = v11;
  if (v11)
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
      goto LABEL_31;
    }
  }
  else
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v4 userInterfaceIdiom])
    {

      goto LABEL_31;
    }
  }
  int v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v14 = 0;
      int v15 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    double v29 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v29 userInterfaceIdiom] != 1)
    {
      int v14 = 0;
      int v15 = 1;
      goto LABEL_17;
    }
  }
  int v15 = v13 ^ 1;
  int v16 = __sb__runningInSpringBoard();
  if (v16)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v27 = [MEMORY[0x1E4F42D90] mainScreen];
    [v27 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v17 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v20 = 1;
    if ((v16 & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  int v14 = v16 ^ 1;
LABEL_17:
  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v20 = a2 ^ 1;
      if (v14) {
        goto LABEL_36;
      }
LABEL_25:
      if (!v15) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom] != 1)
    {
      int v20 = a2 ^ 1;

      if (v14) {
        goto LABEL_36;
      }
      goto LABEL_25;
    }
  }
  int v28 = v15;
  int v21 = __sb__runningInSpringBoard();
  char v22 = v21;
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v6 = [MEMORY[0x1E4F42D90] mainScreen];
    [v6 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v26 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v20 = 1;
    if (v22) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  int v20 = a2 ^ 1;
  if ((v22 & 1) == 0) {
LABEL_43:
  }

LABEL_44:
  if (v19)
  {
    int v15 = v28;
    if (!v14) {
      goto LABEL_25;
    }
  }
  else
  {

    int v15 = v28;
    if ((v14 & 1) == 0) {
      goto LABEL_25;
    }
  }
LABEL_36:

  if (v15) {
LABEL_26:
  }

LABEL_27:
  if ((v12 & 1) == 0)
  {

    double v23 = v10;
    if ((v20 & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  double v23 = v10;
  if (v20)
  {
LABEL_31:
    double v24 = SBFImageNameModifierSuffix(a2, a3, a4);
    double v23 = [v10 stringByAppendingString:v24];
  }
LABEL_32:

  return v23;
}

id SBFModifiedFullscreenImageNameForName(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F42D90];
  id v2 = a1;
  uint64_t v3 = [v1 mainScreen];
  [v3 _referenceBounds];
  double v6 = SBFModifiedImageNameForName(v2, 1, v4, v5);

  return v6;
}

__IOSurface *SBFCreateIOSurfaceForImage(void *a1, uint64_t *a2, int a3)
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (!a2)
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurface *SBFCreateIOSurfaceForImage(UIImage *__strong, CGImageBlockSetRef *, BOOL)");
    [v32 handleFailureInFunction:v33 file:@"SBFImageUtilities.m" lineNumber:151 description:@"Must have an outBlockSet to release later"];
  }
  uint64_t v6 = [v5 ioSurface];
  if (v6)
  {
    double v7 = (__IOSurface *)v6;
    if (a2) {
      *a2 = 0;
    }
  }
  else
  {
    [v5 scale];
    double v9 = v8;
    [v5 size];
    double v11 = v10;
    if (MEMORY[0x18C1327D0](*MEMORY[0x1E4F2F2C0]) >= vcvtpd_u64_f64(v9 * v12)
      && MEMORY[0x18C1327D0](*MEMORY[0x1E4F2F0E8]) >= vcvtpd_u64_f64(v9 * v11))
    {
      id v13 = v5;
      int v14 = (CGImage *)[v13 CGImage];
      if (CGImageGetBitsPerComponent(v14) > 8) {
        goto LABEL_22;
      }
      CGImageGetWidth(v14);
      CGImageGetHeight(v14);
      if (!CGImageGetImageProvider()) {
        goto LABEL_22;
      }
      uint64_t v15 = *MEMORY[0x1E4F1CFD0];
      uint64_t v16 = *MEMORY[0x1E4F1DD38];
      if (a3)
      {
        v37[0] = *MEMORY[0x1E4F1DD48];
        v37[1] = v16;
        uint64_t v17 = *MEMORY[0x1E4F1DD30];
        v38[0] = v15;
        v38[1] = v17;
        v37[2] = *MEMORY[0x1E4F1DD40];
        v38[2] = v15;
        int v18 = (void *)MEMORY[0x1E4F1C9E8];
        char v19 = v38;
        int v20 = v37;
        uint64_t v21 = 3;
      }
      else
      {
        v35[0] = *MEMORY[0x1E4F1DD48];
        v35[1] = v16;
        uint64_t v22 = *MEMORY[0x1E4F1DD30];
        v36[0] = v15;
        v36[1] = v22;
        int v18 = (void *)MEMORY[0x1E4F1C9E8];
        char v19 = v36;
        int v20 = v35;
        uint64_t v21 = 2;
      }
      double v23 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
      uint64_t v24 = CGImageProviderCopyImageBlockSetWithOptions();
      if (v24)
      {
        uint64_t v25 = v24;
        CGImageBlockSetGetImageBlock();
        CGImageBlockGetBytesPerRow();
        CGImageBlockGetData();
        double v7 = (__IOSurface *)IOSurfaceWrapClientImage();
        *a2 = v25;
        uint64_t ColorSpace = CGImageProviderGetColorSpace();
        if (ColorSpace)
        {
          double v27 = (CGColorSpace *)ColorSpace;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
          {
            CFPropertyListRef v29 = CGColorSpaceCopyPropertyList(v27);
            if (v29)
            {
              double v30 = v29;
              IOSurfaceSetValue(v7, (CFStringRef)*MEMORY[0x1E4F2F068], v29);
              CFRelease(v30);
            }
          }
          CGColorSpaceRelease(DeviceRGB);
        }
      }
      else
      {
        double v7 = 0;
      }

      if (!v7)
      {
LABEL_22:
        MGGetBoolAnswer();
        [v13 size];
        [v13 scale];
        objc_msgSend(v13, "sbf_colorSpace");
        id v34 = v13;
        BSUISurfaceWithColorSpaceAndDrawBlock();
        double v7 = (__IOSurface *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      double v7 = 0;
    }
  }

  return v7;
}

uint64_t __SBFCreateIOSurfaceForImage_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

id __sbfImageByApplyingColorSpace(void *a1, CGColorSpace *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = (CGImage *)[v3 CGImage];
  if (!v4)
  {
    double v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __sbfImageByApplyingColorSpace_cold_1((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }
  id v5 = v4;
  CGColorSpaceRef ColorSpace = CGImageGetColorSpace(v4);
  if (!ColorSpace)
  {
    double v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __sbfImageByApplyingColorSpace_cold_2((uint64_t)v3, v10, v17, v18, v19, v20, v21, v22);
    }
LABEL_10:

    double v23 = v3;
    goto LABEL_32;
  }
  double v7 = ColorSpace;
  double v8 = CGColorSpaceRetain(a2);
  if (!v8)
  {
    switch(CGColorSpaceGetType())
    {
      case 0u:
      case 3u:
        goto LABEL_5;
      case 1u:
      case 4u:
        goto LABEL_17;
      case 2u:
        goto LABEL_18;
      default:
        if (!CGColorSpaceIsICCCompatible())
        {
          uint64_t v25 = SBLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            __sbfImageByApplyingColorSpace_cold_4();
          }
          goto LABEL_23;
        }
        CGColorSpaceModel Model = CGColorSpaceGetModel(v7);
        if (Model == kCGColorSpaceModelCMYK)
        {
LABEL_18:
          CGColorSpaceRef DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
        }
        else if (Model == kCGColorSpaceModelRGB)
        {
LABEL_17:
          CGColorSpaceRef DeviceCMYK = CGColorSpaceCreateDeviceRGB();
        }
        else
        {
          if (Model)
          {
            uint64_t v25 = SBLogCommon();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              __sbfImageByApplyingColorSpace_cold_3(v7);
            }
LABEL_23:

            goto LABEL_24;
          }
LABEL_5:
          CGColorSpaceRef DeviceCMYK = CGColorSpaceCreateDeviceGray();
        }
        double v8 = DeviceCMYK;
        if (DeviceCMYK) {
          break;
        }
LABEL_24:
        double v8 = CGColorSpaceRetain(v7);
        break;
    }
  }
  double v23 = v3;
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CopyWithCGColorSpaceRef ColorSpace = CGImageCreateCopyWithColorSpace(v5, v8);
    if (CopyWithColorSpace)
    {
      CGImageRef v27 = CopyWithColorSpace;
      id v28 = objc_alloc(MEMORY[0x1E4F42A80]);
      [v3 scale];
      double v23 = objc_msgSend(v28, "initWithCGImage:scale:orientation:", v27, objc_msgSend(v3, "imageOrientation"), v29);

      CFRelease(v27);
    }
    else
    {
      double v30 = SBLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v32 = 138412802;
        v33 = v8;
        __int16 v34 = 2112;
        long long v35 = v5;
        __int16 v36 = 2114;
        long long v37 = v7;
        _os_log_error_impl(&dword_18B52E000, v30, OS_LOG_TYPE_ERROR, " [SBFImageColorSpaceUtilities] failed to create copy with colorSpace=%@ of original CGImage=%@ with colorSpace=%{public}@", (uint8_t *)&v32, 0x20u);
      }

      double v23 = v3;
    }
  }
  CGColorSpaceRelease(v8);
LABEL_32:

  return v23;
}

__CFString *SBFGraphicsContextTypeDescription(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%d)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E548DC30[a1];
  }
  return v1;
}

void __SBFPreheatImageData_block_invoke()
{
  id v4 = [MEMORY[0x1E4F4F730] concurrent];
  char v0 = [v4 autoreleaseFrequency:1];
  uint64_t v1 = [v0 serviceClass:25];
  uint64_t v2 = BSDispatchQueueCreate();
  id v3 = (void *)SBFPreheatImageData_dispatchQueue;
  SBFPreheatImageData_dispatchQueue = v2;
}

void releaseIOSurface(void *a1)
{
  [a1 unlockWithOptions:1 seed:0];
  [a1 decrementUseCount];
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t SBFInterfaceOrientationMaskForInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

uint64_t SBFFirstInterfaceOrientationInInterfaceOrientationMask(unint64_t a1)
{
  uint64_t v1 = 4;
  uint64_t v2 = 3;
  if ((a1 & 8) == 0) {
    uint64_t v2 = (a1 >> 1) & 2;
  }
  if ((a1 & 0x10) == 0) {
    uint64_t v1 = v2;
  }
  if ((a1 & 2) != 0) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t SBFInterfaceOrientationMaskForInterfaceOrientationPair(uint64_t a1)
{
  uint64_t v1 = 24;
  if ((unint64_t)(a1 - 3) >= 2) {
    uint64_t v1 = 0;
  }
  if ((unint64_t)(a1 - 1) >= 2) {
    return v1;
  }
  else {
    return 6;
  }
}

__CFString *SBFStringForBSDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E548DC58[a1 - 1];
  }
}

__CFString *SBFStringForBSInterfaceOrientation(uint64_t a1)
{
  if (a1)
  {
    SBFStringForBSInterfaceOrientationMask((1 << a1) & 0x1E);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"unknown";
  }
  return v2;
}

__CFString *SBFStringForBSInterfaceOrientationMask(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"none";
    goto LABEL_11;
  }
  char v1 = a1;
  if (a1 == 30)
  {
    uint64_t v2 = @"All";
    goto LABEL_11;
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if ((v1 & 2) != 0)
  {
    [v3 addObject:@"Pu"];
    if ((v1 & 0x10) == 0)
    {
LABEL_7:
      if ((v1 & 8) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      [v4 addObject:@"Lr"];
      if ((v1 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((v1 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  [v4 addObject:@"Ll"];
  if ((v1 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v1 & 4) != 0) {
LABEL_9:
  }
    [v4 addObject:@"Pd"];
LABEL_10:
  uint64_t v2 = [v4 componentsJoinedByString:@","];

LABEL_11:
  return v2;
}

__CFString *SBFStringForUIDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E548DC58[a1 - 1];
  }
}

void sub_18B57160C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBFDashBoardPadPageInsetsMake(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, long long a10, uint64_t a11, uint64_t a12)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(double *)(a1 + 40) = a7;
  *(double *)(a1 + 48) = a8;
  *(double *)(a1 + 56) = a9;
  *(_OWORD *)(a1 + 64) = a10;
  *(void *)(a1 + 80) = a11;
  *(void *)(a1 + 88) = a12;
}

__CFString *SBScreenWakeStateDescription(uint64_t a1)
{
  char v1 = @"unknown";
  if (a1 == 1) {
    char v1 = @"sleep";
  }
  if (a1 == 2) {
    return @"awake";
  }
  else {
    return v1;
  }
}

void _SBFGetHSBAValuesForColor(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  id v10 = v9;
  if (CGColorGetNumberOfComponents((CGColorRef)[v10 CGColor]) == 2) {
    [v10 getWhite:a4 alpha:a5];
  }
  else {
    [v10 getHue:a2 saturation:a3 brightness:a4 alpha:a5];
  }
}

void _SBFGetHSBValuesForColor(void *a1, void *a2, void *a3, void *a4)
{
}

void _SBFGetRGBAValuesForColor(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  id v10 = v9;
  if (CGColorGetNumberOfComponents((CGColorRef)[v10 CGColor]) == 2)
  {
    uint64_t v11 = 0;
    [v10 getWhite:&v11 alpha:a5];
    if (a2) {
      *a2 = v11;
    }
    if (a3) {
      *a3 = v11;
    }
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    [v10 getRed:a2 green:a3 blue:a4 alpha:a5];
  }
}

void _SBFGetRGBValuesForColor(void *a1, void *a2, void *a3, void *a4)
{
}

void sub_18B57BFD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __SBFGetCurrentMagnifyMode_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  [v10 size];
  if (v8 == *(double *)(a1 + 40) && v7 == *(double *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __SBFGetMagnifyModes_block_invoke()
{
  v16[2] = *MEMORY[0x1E4F143B8];
  char v0 = (void *)MGCopyAnswer();
  if ([v0 hasPrefix:@"N56"])
  {
    uint64_t v1 = +[SBFMagnifyMode magnifyModeWithSize:@"Large", 1242.0, 2208.0 name];
    v16[0] = v1;
    uint64_t v2 = +[SBFMagnifyMode magnifyModeWithSize:@"Medium", 1125.0, 2001.0 name];
    v16[1] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v4 = (void *)SBFGetMagnifyModes_SBFMagnifyModes;
    SBFGetMagnifyModes_SBFMagnifyModes = v3;

    id v5 = [(id)SBFGetMagnifyModes_SBFMagnifyModes objectAtIndexedSubscript:1];
    uint64_t v6 = v5;
    LODWORD(v7) = 1066225631;
  }
  else
  {
    if (![v0 hasPrefix:@"N61"])
    {
      uint64_t v6 = +[SBFMagnifyMode magnifyModeWithSize:@"Medium", 640.0, 1136.0 name];
      uint64_t v14 = v6;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      uint64_t v13 = (void *)SBFGetMagnifyModes_SBFMagnifyModes;
      SBFGetMagnifyModes_SBFMagnifyModes = v12;

      goto LABEL_7;
    }
    double v8 = +[SBFMagnifyMode magnifyModeWithSize:@"Medium", 750.0, 1334.0 name];
    v15[0] = v8;
    id v9 = +[SBFMagnifyMode magnifyModeWithSize:@"Small", 640.0, 1136.0 name];
    v15[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v11 = (void *)SBFGetMagnifyModes_SBFMagnifyModes;
    SBFGetMagnifyModes_SBFMagnifyModes = v10;

    id v5 = [(id)SBFGetMagnifyModes_SBFMagnifyModes objectAtIndexedSubscript:1];
    uint64_t v6 = v5;
    LODWORD(v7) = 1066795008;
  }
  [v5 setZoomFactor:v7];
LABEL_7:
}

id SBCompletionBlockC2ToBS(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __SBCompletionBlockC2ToBS_block_invoke;
    v5[3] = &unk_1E548DDF8;
    id v6 = v1;
    uint64_t v3 = (void *)MEMORY[0x18C133210](v5);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __SBCompletionBlockC2ToBS_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id SBCompletionBlockBSToC2(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __SBCompletionBlockBSToC2_block_invoke;
    v5[3] = &unk_1E548DB98;
    id v6 = v1;
    uint64_t v3 = (void *)MEMORY[0x18C133210](v5);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __SBCompletionBlockBSToC2_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *NSStringFromSBFWebClipSanitizationResult(unint64_t a1)
{
  if (a1 > 2) {
    return @"(Unknown SBFWebClipSanitizationResult)";
  }
  else {
    return off_1E548DF10[a1];
  }
}

__CFString *NSStringFromSBFWebClipSanitizationError(unint64_t a1)
{
  if (a1 > 2) {
    return @"(Unknown SBFWebClipSanitizationError)";
  }
  else {
    return off_1E548DF28[a1];
  }
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *SBFStringForUIUserInterfaceStyle(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E548DF40[a1];
  }
  return v1;
}

id SBFFrameRateReasonString(uint64_t a1)
{
  uint64_t v2 = (void *)SBFFrameRateReasonString___reasons;
  uint64_t v3 = [NSNumber numberWithUnsignedShort:a1];
  id v4 = [v2 objectForKey:v3];

  if (!v4)
  {
    id v5 = (void *)SBFFrameRateReasonString___reasons;
    if (!SBFFrameRateReasonString___reasons)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      double v7 = (void *)SBFFrameRateReasonString___reasons;
      SBFFrameRateReasonString___reasons = v6;

      id v5 = (void *)SBFFrameRateReasonString___reasons;
    }
    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"SpringBoard.%lu", a1);
    id v9 = [NSNumber numberWithUnsignedShort:a1];
    [v5 setObject:v8 forKey:v9];
  }
  uint64_t v10 = (void *)SBFFrameRateReasonString___reasons;
  uint64_t v11 = [NSNumber numberWithUnsignedShort:a1];
  uint64_t v12 = [v10 objectForKey:v11];

  return v12;
}

void sub_18B57DF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

id SBFComposedColor(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  double v20 = 0.0;
  double v21 = 0.0;
  double v18 = 0.0;
  double v19 = 0.0;
  if (([v5 getRed:&v21 green:&v20 blue:&v19 alpha:&v18] & 1) == 0)
  {
    double v17 = 0.0;
    [v5 getWhite:&v17 alpha:&v18];
    double v19 = v17;
    double v20 = v17;
    double v21 = v17;
  }
  double v16 = 0.0;
  double v17 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  if (([v6 getRed:&v17 green:&v16 blue:&v15 alpha:&v14] & 1) == 0)
  {
    double v13 = 0.0;
    [v6 getWhite:&v13 alpha:&v14];
    double v15 = v13;
    double v16 = v13;
    double v17 = v13;
  }
  if (a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"SBFComposedColor does not support blend mode %d. But you can add it!", a3);
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  double v7 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", ((1.0 - v18) * (v14 * v17) + v21 * v18) / (v18 + v14 * (1.0 - v18)), ((1.0 - v18) * (v14 * v16) + v20 * v18) / (v18 + v14 * (1.0 - v18)), ((1.0 - v18) * (v14 * v15) + v19 * v18) / (v18 + v14 * (1.0 - v18)));

  return v7;
}

void sub_18B57E9C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t SBWakeLoggerSourceFromBacklightChangeSource(uint64_t a1)
{
  if (a1 > 19)
  {
    switch(a1)
    {
      case 47:
        return 5;
      case 34:
        return 6;
      case 20:
        return 2;
      default:
        return 0;
    }
  }
  else
  {
    uint64_t v1 = a1 - 2;
    uint64_t result = 1;
    switch(v1)
    {
      case 0:
        uint64_t result = 3;
        break;
      case 1:
        uint64_t result = 4;
        break;
      case 5:
        return 5;
      case 7:
        return result;
      default:
        return 0;
    }
  }
  return result;
}

__CFString *SBWakeLoggerSourceDescription(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = @"TOUCH";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @"LIFT";
      break;
    case 2:
      uint64_t result = @"HOME_BUTTON";
      break;
    case 3:
      uint64_t result = @"LOCK_BUTTON";
      break;
    case 4:
      uint64_t result = @"SMART_COVER";
      break;
    default:
      if (@"TOUCH" == (__CFString *)34) {
        uint64_t result = @"MOUSE_BUTTON";
      }
      else {
        uint64_t result = @"unknown";
      }
      break;
  }
  return result;
}

void sub_18B5806D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBUILegibilityLabelClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SpringBoardUIServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548DFE0;
    uint64_t v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_0) {
    __getSBUILegibilityLabelClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SBUILegibilityLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBUILegibilityLabelClass_block_invoke_cold_2_0();
  }
  getSBUILegibilityLabelClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUIServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUIServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id SBFBundle()
{
  if (SBFBundle___onceToken != -1) {
    dispatch_once(&SBFBundle___onceToken, &__block_literal_global_33);
  }
  char v0 = (void *)SBFBundle___springBoardFoundationBundle;
  return v0;
}

uint64_t __SBFBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = SBFBundle___springBoardFoundationBundle;
  SBFBundle___springBoardFoundationBundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id SBFLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SBFBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_1ED879EF8 table:@"SpringBoardFoundation"];

  return v3;
}

uint64_t SBFCompareIntegers(uint64_t a1, uint64_t a2)
{
  if (a1 < a2) {
    return -1;
  }
  else {
    return a1 > a2;
  }
}

uint64_t SBFEqualStrings(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToString:a2];
  }
  else {
    return a1 == a2;
  }
}

__CFString *SB_NSStringFromUIPressType(__CFString *a1)
{
  if ((uint64_t)a1 <= 201)
  {
    uint64_t v3 = (char *)&a1->isa + 1;
    a1 = @"UIPressTypeUpArrow";
    switch((unint64_t)v3)
    {
      case 0uLL:
        a1 = @"UIPressTypeNone";
        break;
      case 1uLL:
        goto LABEL_144;
      case 2uLL:
        a1 = @"UIPressTypeDownArrow";
        break;
      case 3uLL:
        a1 = @"UIPressTypeLeftArrow";
        break;
      case 4uLL:
        a1 = @"UIPressTypeRightArrow";
        break;
      case 5uLL:
        a1 = @"UIPressTypeSelect";
        break;
      case 6uLL:
        a1 = @"UIPressTypeMenu";
        break;
      case 7uLL:
        a1 = @"UIPressTypePlayPause";
        break;
      case 8uLL:
        a1 = @"UIPressTypeBack";
        break;
      case 9uLL:
        a1 = @"UIPressTypePlay";
        break;
      case 0xAuLL:
        a1 = @"UIPressTypePause";
        break;
      case 0xBuLL:
        a1 = @"UIPressTypeStop";
        break;
      case 0xCuLL:
        a1 = @"UIPressTypeRewind";
        break;
      case 0xDuLL:
        a1 = @"UIPressTypeFastForward";
        break;
      case 0xEuLL:
        a1 = @"UIPressTypeNextTrack";
        break;
      case 0xFuLL:
        a1 = @"UIPressTypePreviousTrack";
        break;
      case 0x10uLL:
        a1 = @"UIPressTypeSkipForwards";
        break;
      case 0x11uLL:
        a1 = @"UIPressTypeSkipBackwards";
        break;
      case 0x12uLL:
        a1 = @"UIPressTypeDataOnScreen";
        break;
      case 0x13uLL:
        a1 = @"UIPressTypeMicrophone";
        break;
      default:
        switch((unint64_t)@"UIPressTypeUpArrow")
        {
          case 'e':
            a1 = @"UIPressTypeHome";
            break;
          case 'f':
            a1 = @"UIPressTypeVolumeUp";
            break;
          case 'g':
            a1 = @"UIPressTypeVolumeDown";
            break;
          case 'h':
            a1 = @"UIPressTypeLock";
            break;
          case 'i':
            a1 = @"UIPressTypeHomeTap";
            break;
          default:
            goto LABEL_73;
        }
        break;
    }
  }
  else if ((uint64_t)a1 <= 399)
  {
    if (a1 == (__CFString *)202)
    {
      a1 = @"UIPressTypeDone";
    }
    else if (a1 == (__CFString *)300)
    {
      a1 = @"UIPressTypeWatchSide";
    }
    else
    {
LABEL_73:
      if ((uint64_t)a1 <= 1999)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN UIPressType: %ld", a1);
        a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_144:
      }
      else
      {
        a1 = @"UIPressTypeCustomOffset";
      }
    }
  }
  else
  {
    switch((unint64_t)a1)
    {
      case 0x190uLL:
        a1 = @"UIPressTypeTelephoneFlash";
        break;
      case 0x191uLL:
      case 0x192uLL:
        a1 = @"UIPressTypeTelephoneHookSwitch";
        break;
      case 0x193uLL:
        a1 = @"UIPressTypeTelephoneKey0";
        break;
      case 0x194uLL:
        a1 = @"UIPressTypeTelephoneKey1";
        break;
      case 0x195uLL:
        a1 = @"UIPressTypeTelephoneKey2";
        break;
      case 0x196uLL:
        a1 = @"UIPressTypeTelephoneKey3";
        break;
      case 0x197uLL:
        a1 = @"UIPressTypeTelephoneKey4";
        break;
      case 0x198uLL:
        a1 = @"UIPressTypeTelephoneKey5";
        break;
      case 0x199uLL:
        a1 = @"UIPressTypeTelephoneKey6";
        break;
      case 0x19AuLL:
        a1 = @"UIPressTypeTelephoneKey7";
        break;
      case 0x19BuLL:
        a1 = @"UIPressTypeTelephoneKey8";
        break;
      case 0x19CuLL:
        a1 = @"UIPressTypeTelephoneKey9";
        break;
      case 0x19DuLL:
        a1 = @"UIPressTypeTelephoneKeyStar";
        break;
      case 0x19EuLL:
        a1 = @"UIPressTypeTelephoneKeyPound";
        break;
      case 0x19FuLL:
        a1 = @"UIPressTypeTelephoneMute";
        break;
      default:
        if (a1 == (__CFString *)500)
        {
          a1 = @"UIPressTypeLaunchPad";
        }
        else
        {
          if (a1 != (__CFString *)501) {
            goto LABEL_73;
          }
          a1 = @"UIPressTypeExposeAll";
        }
        break;
    }
  }
  return a1;
}

uint64_t SBBitmaskUnionIf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned int (**)(uint64_t))(a3 + 16))(a3)) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 | a1;
}

double _SBFLockScreenFloatFloorForMainScreenScale(double a1)
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  double v4 = v3;

  return floor(v4 * a1) / v4;
}

uint64_t SBValueIndexForCurrentContentSizeCategory()
{
  uint64_t v0 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v1 = [v0 preferredContentSizeCategory];

  if (([v1 isEqualToString:*MEMORY[0x1E4F437B0]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F437A0]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F43798]])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 3;
  }

  return v2;
}

Class __getSOSUtilitiesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SOSLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SOSLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548E000;
    uint64_t v5 = 0;
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SOSLibraryCore_frameworkLibrary) {
    __getSOSUtilitiesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SOSUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSOSUtilitiesClass_block_invoke_cold_2();
  }
  getSOSUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SOSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SOSLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18B5BB8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t SBValidateLogicalScale(void *a1, double a2, CGFloat a3, CGFloat a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  [v7 minimumLogicalScale];
  CGFloat v9 = v8;
  [v7 maximumLogicalScale];
  CGFloat v11 = v10;
  if ((BSFloatGreaterThanFloat() & 1) != 0 || BSFloatGreaterThanFloat())
  {
    id v12 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v34.width = v9;
      v34.height = v11;
      double v13 = NSStringFromCGSize(v34);
      int v19 = 134218754;
      double v20 = a2;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      __int16 v23 = 2048;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl(&dword_18B52E000, v12, OS_LOG_TYPE_DEFAULT, "[SBValidateLogicalScale()] [rdar://102453240] [rdar://102453504] we're dropping logicalScale of %g because it's outside of logicalScaleLimits %{public}@; caDisplay: (%p) %{public}@",
        (uint8_t *)&v19,
        0x2Au);
LABEL_5:
    }
  }
  else
  {
    if ((BSFloatGreaterThanFloat() & 1) == 0 && !BSFloatGreaterThanFloat())
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    id v12 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v35.width = a3 * a2;
      v35.height = a4 * a2;
      double v13 = NSStringFromCGSize(v35);
      v36.width = a3;
      v36.height = a4;
      double v16 = NSStringFromCGSize(v36);
      v37.width = 6144.0;
      v37.height = 3456.0;
      double v17 = NSStringFromCGSize(v37);
      v38.width = v9;
      v38.height = v11;
      double v18 = NSStringFromCGSize(v38);
      int v19 = 134219522;
      double v20 = a2;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2114;
      id v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      __int16 v29 = 2048;
      id v30 = v7;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_error_impl(&dword_18B52E000, v12, OS_LOG_TYPE_ERROR, "[SBValidateLogicalScale()] [rdar://102453240] [rdar://102453504] we're dropping logicalScale of %g because scaledDisplaySize %{public}@ [%{public}@] is over our hard-coded display pipeline limit of %{public}@. logicalScaleLimits: %{public}@; caDisplay: (%p) %{public}@",
        (uint8_t *)&v19,
        0x48u);

      goto LABEL_5;
    }
  }

  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

void sub_18B5BCF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBUILegibilityLabelClass_block_invoke_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SpringBoardUIServicesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548E0E0;
    uint64_t v5 = 0;
    SpringBoardUIServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary_1) {
    __getSBUILegibilityLabelClass_block_invoke_cold_1_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SBUILegibilityLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSBUILegibilityLabelClass_block_invoke_cold_2_1();
  }
  getSBUILegibilityLabelClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardUIServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SpringBoardUIServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

CGImageRef _SBFCARendererCGImageForImageData(void *a1)
{
  CFDataRef v1 = a1;
  CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
  if (ImagesFromData)
  {
    CFArrayRef v3 = ImagesFromData;
    ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
    if (ValueAtIndex)
    {
      CGImageRef ImageAtIndex = ValueAtIndex;
      CFRetain(ValueAtIndex);
      CFRelease(v3);
LABEL_8:
      objc_opt_class();
      objc_opt_isKindOfClass();
      goto LABEL_11;
    }
    CFRelease(v3);
  }
  uint64_t v6 = CGImageSourceCreateWithData(v1, 0);
  if (!v6)
  {
LABEL_10:
    CGImageRef ImageAtIndex = 0;
    goto LABEL_11;
  }
  id v7 = v6;
  if (!CGImageSourceGetCount(v6))
  {
    CFRelease(v7);
    goto LABEL_10;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  CFRelease(v7);
  if (ImageAtIndex) {
    goto LABEL_8;
  }
LABEL_11:

  return ImageAtIndex;
}

void sub_18B5C11B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCSProminentDisplayViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoverSheetKitLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoverSheetKitLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E548E180;
    uint64_t v5 = 0;
    CoverSheetKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoverSheetKitLibraryCore_frameworkLibrary_0) {
    __getCSProminentDisplayViewControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CSProminentDisplayViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSProminentDisplayViewControllerClass_block_invoke_cold_2();
  }
  getCSProminentDisplayViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoverSheetKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoverSheetKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

double SBFMainScreenScale()
{
  if (SBFMainScreenScale___once != -1) {
    dispatch_once(&SBFMainScreenScale___once, &__block_literal_global_38);
  }
  return *(double *)&SBFMainScreenScale___mainScreenScale;
}

void __SBFMainScreenScale_block_invoke()
{
  id v1 = [MEMORY[0x1E4F42D90] mainScreen];
  [v1 scale];
  SBFMainScreenScale___mainScreenScale = v0;
}

double SBFBoundPoint(double result, double a2, double a3, double a4, double a5)
{
  if (a3 >= result) {
    uint64_t result = a3;
  }
  if (a5 <= result) {
    return a5;
  }
  return result;
}

BOOL SBFPointLessThanEqualToPoint(double a1, double a2, double a3, double a4)
{
  return a2 <= a4 && a1 <= a3;
}

BOOL SBFFloatEqualsFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t SBFRectApproximatelyEqualToRect()
{
  if (!BSFloatApproximatelyEqualToFloat()
    || !BSFloatApproximatelyEqualToFloat()
    || !BSFloatApproximatelyEqualToFloat())
  {
    return 0;
  }
  return BSFloatApproximatelyEqualToFloat();
}

double SBFPointRoundForScale(double a1, double a2, double a3)
{
  double v5 = SBFFloatRoundForScale(a1, a3);
  SBFFloatRoundForScale(a2, a3);
  return v5;
}

uint64_t SBFRectScaleWithScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  CGFloat v13 = (Width - CGRectGetWidth(v18) * a5) * 0.5;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  double Height = CGRectGetHeight(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGFloat v15 = (Height - CGRectGetHeight(v20) * a6) * 0.5;
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectInset(v21, v13, v15);
  return UIRectIntegralWithScale();
}

CGFloat SBFTransformForScalingAboutPointInSuperview@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, CGFloat a6@<D4>)
{
  double v8 = a4 - a2;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  double v9 = a5 - a3;
  *(_OWORD *)a1 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, a4 - a2, a5 - a3);
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v15.a = *(_OWORD *)a1;
  *(_OWORD *)&v15.c = v10;
  *(_OWORD *)&v15.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v16, &v15, a6, a6);
  long long v11 = *(_OWORD *)&v16.c;
  *(_OWORD *)a1 = *(_OWORD *)&v16.a;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v16.tx;
  long long v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v15.a = *(_OWORD *)a1;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v16, &v15, -v8, -v9);
  long long v13 = *(_OWORD *)&v16.c;
  *(_OWORD *)a1 = *(_OWORD *)&v16.a;
  *(_OWORD *)(a1 + 16) = v13;
  CGFloat result = v16.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v16.tx;
  return result;
}

double SBFTransformFromOrientationToOrientation@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *a3 = *MEMORY[0x1E4F1DAB8];
  a3[1] = v5;
  long long v6 = *(_OWORD *)(v4 + 32);
  a3[2] = v6;
  if (a1 != a2)
  {
    BSDegreesToRadians();
    CGAffineTransformMakeRotation(&v10, v7);
    UIIntegralTransform();
    long long v8 = v12;
    *a3 = v11;
    a3[1] = v8;
    *(void *)&long long v6 = v13;
    a3[2] = v13;
  }
  return *(double *)&v6;
}

uint64_t SBFEdgeInsetsRelativeToRectEdge(uint64_t result)
{
  if (result == 1 || result == 8 || result == 2) {
    return UIEdgeInsetsRotate();
  }
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  CGFloat result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result) {
    _allocatedMem_2 += size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  CGFloat result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result) {
    _allocatedMem_3 += size;
  }
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    _allocatedMem_0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    long long v6 = "NULL";
    if (result) {
      CGFloat v7 = result;
    }
    else {
      CGFloat v7 = "NULL";
    }
    if (a4) {
      long long v8 = a4;
    }
    else {
      long long v8 = "NULL";
    }
    if (a6) {
      long long v6 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3) {
      uint64_t v6 = 0;
    }
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    CGFloat v7 = "NULL";
    if (result) {
      long long v8 = result;
    }
    else {
      long long v8 = "NULL";
    }
    if (a4) {
      double v9 = a4;
    }
    else {
      double v9 = "NULL";
    }
    if (a6) {
      CGFloat v7 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, void *a7)
{
  unsigned int v14 = 0;
  uint64_t result = 4294967293;
  if (a1 && __s1 && a7)
  {
    size_t v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      size_t v13 = v12;
      uint64_t result = getLengthOfParameters(a5, a6, &v14);
      if (!result) {
        *a7 = v13 + v14 + 26;
      }
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  }
  if (a3)
  {
    *a3 = 0;
    int v6 = 0;
    if (a2)
    {
      uint64_t v7 = a2;
      while (1)
      {
        uint64_t v8 = checkParameter(a1);
        if (v8) {
          break;
        }
        int v9 = v6 + 8;
        int v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9)) {
          goto LABEL_10;
        }
        a1 += 6;
        if (!--v7) {
          goto LABEL_9;
        }
      }
      uint64_t v11 = v8;
      unsigned int v12 = 70;
    }
    else
    {
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v6;
      unsigned int v12 = 10;
    }
  }
  else
  {
LABEL_10:
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  }
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  unint64_t v21 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            int v15 = a4;
            uint64_t result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!result)
            {
              if (*a8 < v21) {
                return 4294967293;
              }
              *a7 = *a1;
              size_t v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                size_t v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                CGRect v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                size_t v20 = v18 + 22;
                uint64_t result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!result) {
                  *a8 = v20;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a3 && a4)
  {
    uint64_t v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    uint64_t v11 = v10 + 4;
    if (v6)
    {
      uint64_t v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        size_t __n = *(void *)(a1 + 16);
        uint64_t v12 = checkParameter(__src);
        if (v12) {
          break;
        }
        size_t v13 = (_DWORD *)(a3 + v11);
        size_t v14 = __n;
        *size_t v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if (v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6) {
          goto LABEL_11;
        }
      }
      uint64_t v9 = v12;
      unsigned int v8 = 70;
    }
    else
    {
LABEL_11:
      uint64_t v9 = 0;
      *a4 = v11;
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  }
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, BOOL *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  id v28 = 0;
  unsigned int v27 = 0;
  uint64_t v8 = 4294967293;
  unint64_t v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    unint64_t v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17) {
      return 4294967293;
    }
    id v26 = a4;
    unint64_t v18 = v17 + 1;
    CGRect v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19) {
      return 4294967292;
    }
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    unint64_t v29 = v17 + 17;
    if (v17 + 17 == a2 || (size_t v20 = a5, v21 = *(unsigned char *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      uint64_t v8 = 4294967293;
    }
    else
    {
      unint64_t v25 = v17 + 1;
      uint64_t v22 = a8;
      int v23 = *(_DWORD *)(a1 + v17 + 18);
      unint64_t v29 = v17 + 22;
      uint64_t v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!v8)
      {
        *id v26 = v19;
        *size_t v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *uint64_t v22 = v27;
        return v8;
      }
      unint64_t v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28) {
      Util_SafeDeallocParameters(v28, v27);
    }
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4, _DWORD *a5)
{
  p_opt_class_meths = &OBJC_PROTOCOL___SBFLiquidDetectionObserver.opt_class_meths;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5) {
    goto LABEL_25;
  }
  unint64_t v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    CGAffineTransform v16 = 0;
LABEL_24:
    uint64_t v12 = 0;
    *a4 = v16;
    *a5 = v14;
    unsigned int v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (uint64_t v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!v14) {
    goto LABEL_23;
  }
  int v27 = v14;
  uint64_t v15 = 24 * v14;
  CGAffineTransform v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967292;
    goto LABEL_25;
  }
  id v24 = a4;
  unint64_t v25 = a5;
  id v26 = a3;
  uint64_t v17 = 0;
  while (1)
  {
    unint64_t v18 = &v16[v17];
    *(void *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)unint64_t v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (CGRect v19 = &v16[v17],
          size_t v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967293;
      goto LABEL_31;
    }
    uint64_t v21 = checkParameter(&v16[v17]);
    if (v21)
    {
      uint64_t v12 = v21;
      unsigned int v11 = 70;
      goto LABEL_31;
    }
    if (v20) {
      break;
    }
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SBFLiquidDetectionObserver + 48);
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  uint64_t v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((void *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967292;
LABEL_31:
  p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SBFLiquidDetectionObserver + 48);
LABEL_25:
  if (v11 >= *((unsigned __int8 *)p_opt_class_meths + 240)) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  }
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, void *a11)
{
  unsigned int v18 = 0;
  uint64_t result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        uint64_t result = getLengthOfParameters(a9, a10, &v18);
        if (!result)
        {
          uint64_t v15 = 29;
          if (a1 == 32) {
            uint64_t v15 = 33;
          }
          uint64_t v16 = v15 + a4;
          if (a1 == 32) {
            uint64_t v17 = a6;
          }
          else {
            uint64_t v17 = 0;
          }
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, void *a12)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a12) {
    BOOL v14 = a11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    unsigned int v31 = 0;
    uint64_t result = getLengthOfParameters(a9, a10, &v31);
    if (!result)
    {
      uint64_t v21 = 29;
      if (a1 == 32) {
        uint64_t v21 = 33;
      }
      uint64_t v22 = v21 + a4;
      if (a1 == 32) {
        uint64_t v23 = a6;
      }
      else {
        uint64_t v23 = 0;
      }
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        int v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(void *)a11 = 0;
          *(void *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        uint64_t v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          uint64_t v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          uint64_t v24 = v25 + a6;
        }
        uint64_t v26 = a11 + v24;
        *(unsigned char *)uint64_t v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        uint64_t v30 = v24 + 5;
        uint64_t result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!result) {
          *a12 = v30;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, void *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, void *a11, _DWORD *a12)
{
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  unsigned int v32 = 0;
  uint64_t v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    unint64_t v16 = a3;
    *a4 = *(_OWORD *)a2;
    unint64_t v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      uint64_t v12 = 4294967293;
    }
    else
    {
      unint64_t v20 = *(unsigned int *)(a2 + 16);
      unint64_t v34 = 20;
      uint64_t v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20) {
          goto LABEL_24;
        }
        memcpy(v21, (const void *)(a2 + 20), v20);
        unint64_t v22 = v20 + 20;
        unint64_t v34 = v20 + 20;
        unsigned int v31 = a5;
        if (a1 != 32)
        {
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          size_t v23 = *(unsigned int *)(a2 + v22);
          unint64_t v24 = v20 + 24;
          unint64_t v34 = v20 + 24;
          uint64_t v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            uint64_t v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            unint64_t v22 = v24 + v23;
            unint64_t v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              BOOL v26 = *(unsigned char *)(a2 + v22) != 0;
              unint64_t v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                unint64_t v30 = v20;
                int v27 = v23;
                size_t v23 = (size_t)v25;
                int v28 = *(_DWORD *)(a2 + v22 + 1);
                unint64_t v34 = v22 + 5;
                uint64_t v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!v12)
                {
                  void *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                uint64_t v25 = (void *)v23;
                LODWORD(v23) = v27;
                unint64_t v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        uint64_t v12 = 4294967293;
        goto LABEL_26;
      }
      uint64_t v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33) {
    Util_SafeDeallocParameters(v33, v32);
  }
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, void *a9)
{
  unsigned int v12 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    uint64_t result = getLengthOfParameters(a7, a8, &v12);
    if (!result) {
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
    }
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  unint64_t v23 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3)
  {
    BOOL v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      int v17 = a6;
      uint64_t result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(void *)a9 = 0;
            *(void *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          uint64_t v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          unint64_t v22 = v21 + 4;
          uint64_t result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!result) {
            *a10 = v22;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, void *a4, _DWORD *a5, void *a6, unsigned int *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  uint64_t v39 = 0;
  unint64_t v40 = 0;
  unsigned int v38 = 0;
  uint64_t v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      unsigned int v11 = a4;
      if (a4)
      {
        unsigned int v12 = a5;
        if (a5)
        {
          unint64_t v13 = a6;
          if (a6)
          {
            BOOL v14 = a7;
            if (a7)
            {
              BOOL v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  unint64_t v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  unint64_t v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    uint64_t v10 = 4294967293;
                  }
                  else
                  {
                    unint64_t v18 = *(unsigned int *)(a1 + 16);
                    unint64_t v40 = 20;
                    CGRect v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), unint64_t v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        unsigned int v32 = 0;
                        unsigned int v37 = 0;
                        uint64_t v10 = 4294967293;
                      }
                      else
                      {
                        size_t v20 = *(unsigned int *)(a1 + v18 + 20);
                        unint64_t v21 = v18 + 24;
                        unint64_t v40 = v18 + 24;
                        unsigned int v37 = v20;
                        if (!v20)
                        {
                          CGSize v36 = 0;
                          goto LABEL_20;
                        }
                        uint64_t v33 = v12;
                        unint64_t v34 = v11;
                        unint64_t v22 = v13;
                        unint64_t v23 = v14;
                        unint64_t v24 = v15;
                        size_t v25 = v20;
                        BOOL v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          int v27 = v26;
                          unsigned int v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            CGSize v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            unint64_t v40 = v21;
                            BOOL v15 = v24;
                            BOOL v14 = v23;
                            unint64_t v13 = v22;
                            unsigned int v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              uint64_t v10 = 4294967293;
                            }
                            else
                            {
                              unint64_t v35 = v18;
                              int v28 = v19;
                              unint64_t v29 = v15;
                              int v30 = *(_DWORD *)(a1 + v21);
                              unint64_t v40 = v21 + 4;
                              uint64_t v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!v10)
                              {
                                *unsigned int v11 = v28;
                                _DWORD *v12 = v35;
                                *unint64_t v13 = v36;
                                *BOOL v14 = v37;
                                _DWORD *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              CGRect v19 = v28;
                              unint64_t v18 = v35;
                            }
                            unsigned int v32 = v36;
                            goto LABEL_32;
                          }
                          uint64_t v10 = 4294967293;
                          unsigned int v32 = v27;
                        }
                        else
                        {
                          unsigned int v32 = 0;
                          uint64_t v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    uint64_t v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39) {
    Util_SafeDeallocParameters(v39, v38);
  }
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  int v5 = *a1;
  if (*a1 > 0x1Cu) {
    return result;
  }
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7) {
      return result;
    }
    *a2 = 24;
    uint64_t v9 = a1[5];
    if (v9)
    {
      uint64_t v10 = a1 + 6;
      uint64_t v11 = 24;
      do
      {
        uint64_t result = GetSerializedRequirementSize(*v10, &v12);
        if (result) {
          break;
        }
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  uint64_t v6 = a1[4];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = a1 + 5;
  uint64_t v8 = 20;
  while (1)
  {
    uint64_t result = GetSerializedRequirementSize(*v7, &v12);
    if (result) {
      break;
    }
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  unint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!result)
        {
          if (v12 > *a3) {
            return 4294967293;
          }
          *a2 = *(_OWORD *)a1;
          int v7 = *a1;
          uint64_t result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              uint64_t v8 = a1[3] + 16;
LABEL_9:
              uint64_t result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                uint64_t v8 = 20;
                goto LABEL_9;
              }
              uint64_t v9 = 0;
              uint64_t v8 = 20;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4]) {
                  goto LABEL_9;
                }
              }
            }
            else if (v7 == 7)
            {
              *((void *)a2 + 2) = *((void *)a1 + 2);
              if (!a1[5])
              {
                uint64_t v8 = 24;
                goto LABEL_9;
              }
              uint64_t v10 = 0;
              uint64_t v8 = 24;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5]) {
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          unsigned int v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              size_t v10 = a1[3] + 16;
              if (v10 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  uint64_t v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              uint64_t v13 = a1[4];
              if (8 * v13 + 20 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, v13, &__dst);
              if (v11) {
                goto LABEL_35;
              }
              BOOL v14 = __dst;
              if (!__dst) {
                return 4294967292;
              }
              if (*((_DWORD *)__dst + 3) == 84)
              {
                long long v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *BOOL v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  size_t v10 = 20;
                  goto LABEL_11;
                }
                uint64_t v16 = 0;
                size_t v10 = 20;
                while (1)
                {
                  uint64_t v21 = 0;
                  uint64_t v22 = 0;
                  uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if (v11) {
                    goto LABEL_35;
                  }
                  *(void *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4]) {
                    goto LABEL_11;
                  }
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              uint64_t v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                uint64_t v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!v11)
                {
                  unint64_t v18 = __dst;
                  if (!__dst) {
                    return 4294967292;
                  }
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    uint64_t v4 = 4294967291;
                    goto LABEL_36;
                  }
                  long long v19 = *(_OWORD *)a1;
                  *((void *)__dst + 2) = *((void *)a1 + 2);
                  _OWORD *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    size_t v10 = 24;
                    goto LABEL_11;
                  }
                  uint64_t v20 = 0;
                  size_t v10 = 24;
                  while (1)
                  {
                    uint64_t v21 = 0;
                    uint64_t v22 = 0;
                    uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if (v11) {
                      break;
                    }
                    *((void *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5]) {
                      goto LABEL_11;
                    }
                  }
                }
LABEL_35:
                uint64_t v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst) {
    Util_DeallocRequirement((int *)__dst);
  }
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, void *a2)
{
  uint64_t result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result = 4294967293;
  if (__src && __dst && a3)
  {
    unsigned int v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      size_t v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        uint64_t result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, void *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    unsigned int v8 = *a1;
    uint64_t v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if (v10 == 28) {
          goto LABEL_7;
        }
        return v4;
      case 2u:
        if (v10 == 136) {
          goto LABEL_7;
        }
        return v4;
      case 3u:
        if (v10 == 305) {
          goto LABEL_7;
        }
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!v10) {
          goto LABEL_7;
        }
        return v4;
      case 7u:
        if (v10 == 56) {
          goto LABEL_7;
        }
        return v4;
      case 9u:
        if (v10 == 24) {
          goto LABEL_7;
        }
        return v4;
      case 0xAu:
        if (v10 == 52) {
          goto LABEL_7;
        }
        return v4;
      case 0xCu:
      case 0xFu:
        if (v10 == 8) {
          goto LABEL_7;
        }
        return v4;
      case 0xDu:
      case 0x15u:
        if (v10 == 132) {
          goto LABEL_7;
        }
        return v4;
      case 0x11u:
        if (v10 == 81) {
          goto LABEL_7;
        }
        return v4;
      case 0x12u:
        if (v10 == 20) {
          goto LABEL_7;
        }
        return v4;
      case 0x14u:
        if (v10 != 32) {
          return v4;
        }
LABEL_7:
        uint64_t v4 = Util_AllocCredential(*a1, &__dst);
        if (v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              uint64_t v4 = 4294967293;
            }
            else
            {
              uint64_t v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                uint64_t v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          uint64_t v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  __dst = 0;
  uint64_t v2 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if (v2)
    {
      if (__dst) {
        Util_DeallocCredential(__dst);
      }
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      uint64_t v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(void *__s1, void *__s2, unsigned char *a3)
{
  uint64_t v3 = 4294967293;
  if (__s1)
  {
    uint64_t v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        unsigned int v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          uint64_t v7 = *((unsigned int *)__s1 + 7);
          if (v7 == *((_DWORD *)__s2 + 7))
          {
            uint64_t v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 44;
                BOOL v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                size_t v8 = *((unsigned int *)__s1 + 9);
                if (v8 != *((_DWORD *)__s2 + 9)) {
                  break;
                }
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 13);
                BOOL v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                size_t v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)(v6 + 8);
                BOOL v14 = (char *)(v4 + 8);
                size_t v21 = 24;
                uint64_t v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 5);
                BOOL v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)v6 + 52;
                BOOL v14 = (char *)v4 + 52;
LABEL_74:
                size_t v21 = 16;
                uint64_t v22 = 16;
                goto LABEL_103;
              case 0xD:
                size_t v8 = *((unsigned int *)__s1 + 8);
                if (v8 != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                __s2 = (void *)((char *)__s2 + 36);
                __s1 = (void *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v14 = (char *)(__s2 + 4);
                uint64_t v13 = (char *)(__s1 + 4);
                size_t v21 = 32;
                uint64_t v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 36;
                BOOL v14 = (char *)__s2 + 36;
                size_t v21 = 128;
                uint64_t v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        uint64_t v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  if (!(__s1 | __s2)) {
    return 1;
  }
  BOOL result = 0;
  BOOL v6 = __s1 == 0;
  if (__s2)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = __s1 == 0;
  }
  if (v7 && !v6) {
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  }
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, void *a5)
{
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  uint64_t result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          uint64_t result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(void *)a4 = 0;
              *(void *)(a4 + 8) = 0;
            }
            uint64_t v13 = *a5 - 16;
            uint64_t result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!result)
            {
              size_t v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  size_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    uint64_t v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if (v10)
    {
      uint64_t v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      uint64_t v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12) {
    Util_DeallocCredential(v12);
  }
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, void *a4)
{
  if (a2) {
    BOOL v6 = a1 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 || a3 == 0 || a4 == 0) {
    return 4294967293;
  }
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    uint64_t v11 = a1;
    uint64_t v12 = a2;
    uint64_t v13 = 4;
    while (1)
    {
      BOOL v14 = *v11;
      if (!*v11) {
        return 4294967293;
      }
      v16[0] = *a4 - v13;
      uint64_t result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if (result) {
        return result;
      }
      v13 += v16[0];
      ++v11;
      if (!--v12) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v13 = 4;
LABEL_18:
    uint64_t result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if (v8)
          {
            uint64_t v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              uint64_t v11 = 0;
              uint64_t v12 = 4;
              while (1)
              {
                uint64_t v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if (v13) {
                  break;
                }
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11) {
                  goto LABEL_12;
                }
              }
              uint64_t v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            uint64_t v10 = 0;
LABEL_12:
            uint64_t v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = a1;
      uint64_t v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          void *v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    unint64_t v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, void *a4)
{
  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    __n128 result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      uint64_t result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(void *a1)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    uint64_t result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3) {
      *a3 = *(_OWORD *)a1;
    }
    uint64_t result = 0;
    if (a4) {
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 28;
  }
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          unsigned int v18 = 0;
          uint64_t result = getLengthOfParameters(a5, a6, &v18);
          if (!result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              size_t v17 = a4 + 24;
              uint64_t result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!result) {
                *a8 = v17;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    uint64_t v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if (v11)
    {
      unint64_t v12 = v11 + 24;
      if (v12 > a2) {
        return 4294967293;
      }
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 25;
  }
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          unsigned int v16 = 0;
          uint64_t result = getLengthOfParameters(a4, a5, &v16);
          if (!result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(unsigned char *)(a6 + 20) = a3;
              uint64_t v15 = 21;
              uint64_t result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!result) {
                *a7 = v15;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, void *a6, _DWORD *a7)
{
  uint64_t v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(unsigned char *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 20;
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v12 = 0;
        uint64_t result = getLengthOfParameters(a2, a3, &v12);
        if (!result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            uint64_t v11 = 16;
            uint64_t result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!result) {
              *a5 = v11;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      void v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, unsigned char *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    size_t v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      uint64_t result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(unsigned char *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 24;
  }
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      unsigned int v18 = 0;
      uint64_t result = getLengthOfParameters(a2, a3, &v18);
      if (!result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(void *)a6 = 0;
            *(void *)(a6 + 8) = 0;
          }
          uint64_t v17 = 16;
          uint64_t result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!result)
          {
            uint64_t v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            uint64_t v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            uint64_t result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5, unint64_t *a6, void *a7)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    unint64_t v12 = 16;
    uint64_t result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!result)
    {
      unint64_t v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4)
  {
    uint64_t v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src) {
        memcpy(a3 + 1, __src, __n);
      }
      else {
        uint64_t v8 = 4;
      }
      uint64_t result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, void *a3, void *a4)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    uint64_t result = 0;
    unsigned int v7 = *a1;
    unint64_t v6 = a1 + 1;
    *a4 = v7;
    if (!v7) {
      unint64_t v6 = 0;
    }
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4]) {
        return 4294967293;
      }
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4) {
        return 4294967293;
      }
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16) {
        return 4294967293;
      }
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18) {
        return 4294967293;
      }
      break;
    case 8:
    case 9:
      if (a1[4] != 1) {
        return 4294967293;
      }
      break;
    case 0xB:
      if (a1[4] > 0x400u) {
        return 4294967293;
      }
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  size_t v5 = v4;
  unsigned int v7 = v6;
  int v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))v1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  }
  uint64_t v17 = 0x2000;
  uint64_t v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17) {
      BOOL v14 = v18;
    }
    else {
      BOOL v14 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v14);
  }
  if (v13) {
    unsigned int v15 = 70;
  }
  else {
    unsigned int v15 = 10;
  }
  if (v15 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  }
  size_t v20 = 1024;
  uint64_t v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20) {
      uint64_t v17 = v21;
    }
    else {
      uint64_t v17 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(a8 + 16))(a8, v17);
  }
  if (v16) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  }
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  int v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, uint64_t *))result;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  }
  uint64_t v14 = 256;
  if (v9)
  {
    uint64_t v13 = 8;
    uint64_t result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if (result)
    {
LABEL_7:
      uint64_t v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      uint64_t result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    uint64_t v10 = 4294967291;
  }
  else
  {
    uint64_t v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14) {
      uint64_t v11 = v16;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *))(a5 + 16))(a5, v10, v11);
  }
  if (v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= gACMLoggingLevel) {
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  }
  uint64_t v17 = 0;
  BOOL v16 = 0;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    uint64_t v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    uint64_t v14 = v17;
    if (!v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      uint64_t v14 = v17;
    }
    if (v14) {
      Util_DeallocRequirement(v14);
    }
    if (v13) {
      unsigned int v12 = 70;
    }
    else {
      unsigned int v12 = 10;
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  }
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  BOOL v17 = 0;
  unsigned int v18 = 0;
  uint64_t v22 = 0;
  BOOL v21 = 0;
  uint64_t v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    uint64_t v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    unsigned int v18 = v22;
    BOOL v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a9 + 16))(a9, v19, v17, v18);
  uint64_t result = v22;
  if (v22) {
    uint64_t result = (int *)Util_DeallocRequirement(v22);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  *(void *)int v15 = 0;
  uint64_t result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v15, 0, 1);
  if (result)
  {
    if (a7) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a7 + 16))(a7, result, 0, 0);
    }
  }
  else
  {
    uint64_t result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(void *)v15) {
    uint64_t result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v15, 1);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  }
  uint64_t v14 = 128;
  if (!a4)
  {
    unsigned int v12 = 70;
    uint64_t v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    int v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      unsigned int v12 = 70;
      uint64_t v9 = 4294967292;
      goto LABEL_17;
    }
    uint64_t v14 = 2048;
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 0;
      }
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      unsigned int v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v11 = v15;
      }
      else {
        uint64_t v11 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  unsigned int v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  size_t v5 = (uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t))v0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  }
  uint64_t v10 = 0x2000;
  if (v2)
  {
    uint64_t v6 = LibCall_ACMTRMLoadState(v5, v4, (uint64_t)v11, (uint64_t)&v10);
    if (v6)
    {
      unsigned int v8 = 70;
    }
    else
    {
      if (v10) {
        unsigned int v7 = v11;
      }
      else {
        unsigned int v7 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(v2 + 16))(v2, v7);
      unsigned int v8 = 10;
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v6 = 4294967293;
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v6);
  }
  return v6;
}

uint64_t LibCall_ACMContextUnloadToImage_Block()
{
  MEMORY[0x1F4188790]();
  uint64_t v1 = v0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  }
  if (v1)
  {
    uint64_t v2 = LibCall_ACMContextUnloadToImage();
    if (v2)
    {
      unsigned int v3 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, unsigned char *))(v1 + 16))(v1, v5);
      unsigned int v3 = 10;
    }
  }
  else
  {
    unsigned int v3 = 70;
    uint64_t v2 = 4294967293;
  }
  if (v3 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v2);
  }
  return v2;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  unsigned int v7 = (void (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, unsigned char *, uint64_t *, __n128))result;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  uint64_t v11 = 256;
  if (v7 && a3 && a4)
  {
    uint64_t v10 = 16;
    __n128 AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16) {
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    }
    goto LABEL_9;
  }
  if (a4) {
LABEL_9:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  size_t v20 = (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  size_t v25 = 0;
  BOOL v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    uint64_t v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    uint64_t v22 = v25;
    BOOL v23 = v24;
  }
  else
  {
    if (!a13) {
      goto LABEL_10;
    }
    uint64_t v22 = 0;
    BOOL v23 = 0;
    uint64_t v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a13 + 16))(a13, v21, v23, v22);
  uint64_t result = (uint64_t)v25;
  if (v25) {
    uint64_t result = Util_DeallocRequirement(v25);
  }
LABEL_10:
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(unsigned char *a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  if (*a1) {
    return 0;
  }
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  BOOL result = 0;
  if (__s1)
  {
    if (__s2) {
      return memcmp(__s1, __s2, __n) == 0;
    }
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!result && a2) {
    Util_hexDumpToStrHelper_cold_1();
  }
  if (!a3 && a4) {
    Util_hexDumpToStrHelper_cold_2();
  }
  if (a2 >= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a2;
  }
  if (v4)
  {
    size_t v5 = (unsigned char *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      char v6 = *result++;
      *size_t v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, void *a3, void *__src, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  }
  if (a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        uint64_t v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n) {
        goto LABEL_12;
      }
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        uint64_t v12 = 0;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_13;
      }
    }
    uint64_t v12 = 4294967291;
  }
  else
  {
    uint64_t v12 = 4294967293;
  }
LABEL_19:
  unsigned int v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  }
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, void *a3, void *__dst, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  }
  uint64_t v10 = 4294967293;
  unsigned int v11 = 70;
  if (a1 && a3)
  {
    uint64_t v12 = *a3;
    size_t v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        uint64_t v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n) {
        goto LABEL_11;
      }
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        uint64_t v10 = 0;
        *a3 = v13;
        unsigned int v11 = 10;
        goto LABEL_12;
      }
    }
    uint64_t v10 = 4294967291;
LABEL_17:
    unsigned int v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  }
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 1;
  }
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      unint64_t v4 = a1 + 4;
      uint64_t v5 = a2;
      do
      {
        char v6 = (void *)*((void *)v4 - 1);
        if (v6)
        {
          unint64_t v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  }
  if (a1)
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
    switch(*a1)
    {
      case 1:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        rsize_t v5 = 60;
        char v6 = a1;
        unint64_t v7 = 60;
        int v8 = 144;
        goto LABEL_6;
      case 2:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        rsize_t v5 = 168;
        char v6 = a1;
        unint64_t v7 = 168;
        int v8 = 136;
        goto LABEL_6;
      case 3:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        rsize_t v5 = 337;
        char v6 = a1;
        unint64_t v7 = 337;
        int v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        unint64_t v4 = "ACMCredential";
        rsize_t v5 = 32;
        char v6 = a1;
        unint64_t v7 = 32;
        int v8 = 189;
        goto LABEL_6;
      case 7:
        unint64_t v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        rsize_t v5 = 88;
        char v6 = a1;
        unint64_t v7 = 88;
        int v8 = 152;
        goto LABEL_6;
      case 9:
        unint64_t v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        rsize_t v5 = 56;
        char v6 = a1;
        unint64_t v7 = 56;
        int v8 = 156;
        goto LABEL_6;
      case 0xA:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        rsize_t v5 = 84;
        char v6 = a1;
        unint64_t v7 = 84;
        int v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        unint64_t v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        rsize_t v5 = 40;
        char v6 = a1;
        unint64_t v7 = 40;
        int v8 = 161;
        goto LABEL_6;
      case 0xD:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 132;
        goto LABEL_6;
      case 0x11:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        rsize_t v5 = 113;
        char v6 = a1;
        unint64_t v7 = 113;
        int v8 = 165;
        goto LABEL_6;
      case 0x12:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        rsize_t v5 = 52;
        char v6 = a1;
        unint64_t v7 = 52;
        int v8 = 169;
        goto LABEL_6;
      case 0x14:
        unint64_t v4 = "ACMCredential - ACMCredentialDataAP";
        rsize_t v5 = 64;
        char v6 = a1;
        unint64_t v7 = 64;
        int v8 = 173;
        goto LABEL_6;
      case 0x15:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSignature";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        uint64_t v2 = 0;
        unsigned int v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
  }
  if (v3 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  }
  return v2;
}

uint64_t Util_AllocCredential(int a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  switch(a1)
  {
    case 1:
      rsize_t v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      int v6 = 28;
      goto LABEL_4;
    case 2:
      rsize_t v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      int v6 = 136;
      goto LABEL_4;
    case 3:
      rsize_t v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      int v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      rsize_t v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      int v6 = 0;
      goto LABEL_4;
    case 7:
      rsize_t v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      int v6 = 56;
      goto LABEL_4;
    case 9:
      rsize_t v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      int v6 = 24;
      goto LABEL_4;
    case 10:
      rsize_t v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      int v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      rsize_t v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      int v6 = 8;
      goto LABEL_4;
    case 13:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      int v8 = v5;
      int v9 = 211;
      goto LABEL_18;
    case 17:
      rsize_t v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      int v6 = 81;
      goto LABEL_4;
    case 18:
      rsize_t v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      int v6 = 20;
      goto LABEL_4;
    case 20:
      rsize_t v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      int v6 = 32;
      goto LABEL_4;
    case 21:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataSignature";
      int v8 = v5;
      int v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      int v6 = 132;
LABEL_4:
      if (v5)
      {
        uint64_t result = 0;
        *rsize_t v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        uint64_t result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, void *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  }
  if (a3)
  {
    uint64_t v6 = 4294967293;
    unsigned int v7 = 70;
    switch(a1)
    {
      case 1:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        uint64_t v12 = v8;
        int v13 = 338;
        goto LABEL_49;
      case 2:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        uint64_t v12 = v8;
        int v13 = 343;
        goto LABEL_49;
      case 3:
        int v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        int v9 = 156;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataOr";
        int v15 = v8;
        int v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataAnd";
        int v15 = v8;
        int v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        int v9 = 84;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        int v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        int v9 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        int v9 = 88;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 8:
        int v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        int v9 = 1024;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 13:
        int v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        int v9 = 32;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        uint64_t v12 = v8;
        int v13 = 353;
        goto LABEL_49;
      case 21:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        uint64_t v12 = v8;
        int v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        int v9 = 4;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 24:
        int v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        int v9 = 1060;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 25:
        int v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        int v9 = 43;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 26:
        int v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        int v9 = 28;
        if (!v8)
        {
LABEL_50:
          uint64_t v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        *int v8 = a1;
        *(void *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        uint64_t v6 = 0;
        *a3 = v8;
        unsigned int v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
              goto LABEL_53;
            }
            int v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            int v9 = 120;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1001:
            int v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            int v9 = 168;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1002:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            uint64_t v12 = v8;
            int v13 = 424;
            goto LABEL_49;
          case 1003:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            uint64_t v12 = v8;
            int v13 = 429;
            goto LABEL_49;
          case 1004:
            int v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            int v9 = 16;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    uint64_t v6 = 4294967293;
LABEL_54:
    unsigned int v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  }
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  }
  uint64_t v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  }
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  }
  if (!a1)
  {
    uint64_t v7 = 4294967293;
    unsigned int v8 = 70;
    goto LABEL_28;
  }
  int v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        unint64_t v6 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000) {
        goto LABEL_25;
      }
      if (a1[13])
      {
        unint64_t v4 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      unint64_t v5 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5) {
      goto LABEL_25;
    }
    if (a1[4])
    {
      unint64_t v3 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  int v2 = *a1;
LABEL_25:
  uint64_t v7 = 4294967293;
  unsigned int v8 = 70;
  switch(v2)
  {
    case 1:
      int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 542;
      goto LABEL_27;
    case 2:
      int v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 546;
      goto LABEL_27;
    case 3:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      rsize_t v10 = 172;
      unsigned int v11 = a1;
      unint64_t v12 = 172;
      int v13 = 550;
      goto LABEL_27;
    case 4:
      int v9 = "ACMRequirement - ACMRequirementDataOr";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 595;
      goto LABEL_27;
    case 5:
      int v9 = "ACMRequirement - ACMRequirementDataAnd";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      int v9 = "ACMRequirement";
      rsize_t v10 = 16;
      unsigned int v11 = a1;
      unint64_t v12 = 16;
      int v13 = 538;
      goto LABEL_27;
    case 7:
      int v9 = "ACMRequirement - ACMRequirementDataKofN";
      rsize_t v10 = 104;
      unsigned int v11 = a1;
      unint64_t v12 = 104;
      int v13 = 584;
      goto LABEL_27;
    case 8:
      int v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      rsize_t v10 = 1040;
      unsigned int v11 = a1;
      unint64_t v12 = 1040;
      int v13 = 574;
      goto LABEL_27;
    case 13:
      int v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      rsize_t v10 = 48;
      unsigned int v11 = a1;
      unint64_t v12 = 48;
      int v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      int v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 554;
      goto LABEL_27;
    case 21:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 558;
      goto LABEL_27;
    case 24:
      int v9 = "ACMRequirement - ACMRequirementDataAP";
      rsize_t v10 = 1076;
      unsigned int v11 = a1;
      unint64_t v12 = 1076;
      int v13 = 566;
      goto LABEL_27;
    case 25:
      int v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      rsize_t v10 = 59;
      unsigned int v11 = a1;
      unint64_t v12 = 59;
      int v13 = 570;
      goto LABEL_27;
    case 26:
      int v9 = "ACMRequirement - ACMRequirementDataRatchet";
      rsize_t v10 = 44;
      unsigned int v11 = a1;
      unint64_t v12 = 44;
      int v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      uint64_t v7 = 0;
      unsigned int v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          int v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          rsize_t v10 = 136;
          unsigned int v11 = a1;
          unint64_t v12 = 136;
          int v13 = 601;
          goto LABEL_27;
        case 1001:
          int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          rsize_t v10 = 184;
          unsigned int v11 = a1;
          unint64_t v12 = 184;
          int v13 = 605;
          goto LABEL_27;
        case 1002:
          int v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 609;
          goto LABEL_27;
        case 1003:
          int v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 613;
          goto LABEL_27;
        case 1004:
          int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          rsize_t v10 = 32;
          unsigned int v11 = a1;
          unint64_t v12 = 32;
          int v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  }
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
}

void Util_hexDumpToStrHelper_cold_2()
{
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if (v2)
  {
    updateLogLevelFromKext();
    unsigned int v3 = 70;
  }
  else
  {
    unsigned int v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *a1;
        if (*a1) {
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        }
        *(_DWORD *)buf = 136315650;
        unsigned int v8 = "ACMLib";
        __int16 v9 = 2080;
        rsize_t v10 = "ACMContextCreate";
        __int16 v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      unsigned int v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v2;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    uint64_t v14 = init();
    unsigned int v15 = 70;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if (v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }
  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v8 = 0;
  uint64_t v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      rsize_t v10 = "ACMLib";
      __int16 v11 = 2080;
      uint64_t v12 = "ACMContextCreateWithExternalForm";
      __int16 v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    unsigned int v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    unsigned int v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  unsigned int v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    unsigned int v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = a1[4];
    unsigned int v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "ACMLib";
    uint64_t v14 = "ACMContextDelete";
    __int16 v13 = 2080;
    if (a2) {
      unsigned int v6 = "destroyed";
    }
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  rsize_t v10 = a1;
  uint64_t v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))ioKitTransport, (uint64_t)&v10, a1, a2);
  if (v7) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    __int16 v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0)) {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
  }
  else {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "init";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if (_initialized)
  {
    uint64_t v0 = 0;
  }
  else
  {
    mach_port_t v1 = *MEMORY[0x1E4F2EF00];
    CFDictionaryRef v2 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      unsigned int v5 = 70;
      uint64_t v0 = 4294967291;
      goto LABEL_10;
    }
    io_object_t v4 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, (io_connect_t *)&_connect);
    if (v0)
    {
      unsigned int v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  unsigned int v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "init";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v0;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t inputStructCnt = 0;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    __int16 v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293;
    }
    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if (v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        uint64_t v18 = 0;
        if (a7) {
          *a7 = v22;
        }
      }
    }
    size_t v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if (v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }
  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)unint64_t v29 = (int)v18;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = init();
    if (SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t v10 = init();
    if (v10 || (uint64_t v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &size), v10))
    {
      uint64_t v9 = v10;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        uint64_t v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)__int16 v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  if (a1)
  {
    uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
    if (!v2) {
      uint64_t v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    }
    uint64_t v3 = v2;
    if (v6) {
      ACMContextDelete(v6, 1);
    }
    if (v3) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    unsigned int v4 = 70;
    uint64_t v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
  if (!v2) {
    uint64_t v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  }
  uint64_t v3 = v2;
  if (v6) {
    ACMContextDelete(v6, 1);
  }
  if (v3) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedReplacePassphraseCredentialSize = init();
    if (SerializedReplacePassphraseCredentialSize
      || (uint64_t SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &size),
          SerializedReplacePassphraseCredentialSize))
    {
      uint64_t v9 = SerializedReplacePassphraseCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        bzero(v12, size);
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      char v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)char v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v11 = a1;
  uint64_t v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    __int16 v16 = 2048;
    uint64_t v17 = (int)v8;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(void *)uint64_t v11 = 0;
  uint64_t v10 = ACMContextCreate((uint64_t *)v11);
  if (v10)
  {
    if (a5) {
      (*(void (**)(uint64_t, uint64_t, void, void))(a5 + 16))(a5, v10, 0, 0);
    }
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(void *)v11) {
    ACMContextDelete(*(_DWORD **)v11, 1);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  unsigned int v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  uint64_t v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  size_t __n = 4096;
  size_t size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    uint64_t v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 4294967293;
  if (!a1 || !a2 || !a3) {
    goto LABEL_28;
  }
  uint64_t SerializedProcessAclSize = init();
  if (SerializedProcessAclSize
    || (uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        SerializedProcessAclSize))
  {
    uint64_t v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  size_t v8 = size;
  unsigned int v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    uint64_t v6 = 4294967292;
    goto LABEL_28;
  }
  uint64_t v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if (v10)
  {
    uint64_t v6 = v10;
    __int16 v12 = 0;
    __int16 v14 = 0;
    size_t v11 = 4096;
    goto LABEL_15;
  }
  size_t v11 = 4096;
  __int16 v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    __int16 v14 = 0;
LABEL_31:
    uint64_t v6 = 4294967292;
    goto LABEL_15;
  }
  uint64_t v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  size_t v11 = __n;
  if (v13)
  {
    uint64_t v6 = v13;
    __int16 v14 = 0;
    goto LABEL_15;
  }
  __int16 v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  size_t v11 = __n;
  if (!v14) {
    goto LABEL_31;
  }
  memcpy(v14, v12, __n);
  uint64_t v6 = 0;
  size_t v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  size_t v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    size_t v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if (v6) {
    unsigned int v17 = 70;
  }
  else {
    unsigned int v17 = 10;
  }
  if (v17 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    uint64_t v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    __int16 v25 = 2048;
    uint64_t v26 = (int)v6;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    int v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        unint64_t v6 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      unint64_t v5 = 0;
      do
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unint64_t v9 = 0;
  __int16 v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = 4294967293;
  unsigned int v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    uint64_t v4 = 0;
    int v6 = *a1;
    unsigned int v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21) {
          break;
        }
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        uint64_t v4 = 0;
        unsigned int v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    __int16 v16 = 1024;
    int v17 = a1;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v15 = 0;
  uint64_t v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    __int16 v22 = 1024;
    int v23 = a1;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v7 = 0;
  uint64_t v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if (v4) {
    unsigned int v5 = 70;
  }
  else {
    unsigned int v5 = 10;
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    __int16 v14 = 1024;
    int v15 = a1;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if (v2) {
    unsigned int v3 = 70;
  }
  else {
    unsigned int v3 = 10;
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    __int16 v9 = 2048;
    uint64_t v10 = (int)v2;
    __int16 v11 = 1024;
    int v12 = a1;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    __int16 v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v10 = 256;
  if (a4)
  {
    __int16 v9 = a1;
    uint64_t v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v15 = a1;
  uint64_t v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "ACMLib";
    __int16 v18 = 2080;
    uint64_t v19 = "ACMContextSetDataEx";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  uint64_t Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if (Data) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    __int16 v13 = 2048;
    uint64_t v14 = (int)Data;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315394;
    uint64_t v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  unsigned int size = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 4;
  uint64_t v19 = a1;
  uint64_t v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!v10)
  {
    uint64_t v11 = size;
    if (size)
    {
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        unsigned int v16 = 70;
        uint64_t v14 = 4294967292;
        goto LABEL_15;
      }
      uint64_t v20 = size;
      __int16 v18 = a1;
      uint64_t v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      uint64_t v14 = v13;
      if (a5 && !v13) {
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      }
      rsize_t v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if (v14) {
        goto LABEL_11;
      }
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, void, void))(a5 + 16))(a5, 0, 0);
    }
    uint64_t v14 = 0;
    unsigned int v16 = 10;
    goto LABEL_15;
  }
  uint64_t v14 = v10;
LABEL_11:
  unsigned int v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315650;
    uint64_t v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    __int16 v27 = 2048;
    uint64_t v28 = (int)v14;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if (Data) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)Data;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(long long *a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt)) {
    goto LABEL_8;
  }
  unsigned __int8 v0 = output;
  unsigned int v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    unsigned int v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  __int16 v12 = 0;
  if (a5) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      __int16 v12 = 0;
    }
    else
    {
      __int16 v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)__int16 v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *), uint64_t a2, void *a3, unsigned char *a4, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (!a1 || !a3) {
    goto LABEL_25;
  }
  __int16 v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    uint64_t v18 = 21;
    uint64_t v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!v13)
    {
      if (v18 != 21)
      {
        uint64_t v11 = 4294967291;
        goto LABEL_23;
      }
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    uint64_t v11 = v13;
    if (v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 17;
  unsigned int v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = -5;
  }
  if (v14) {
    uint64_t v11 = v14;
  }
  else {
    uint64_t v11 = v15;
  }
  if (!v14 && v18 == 17)
  {
LABEL_20:
    int v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)__int16 v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4) {
      *a4 = v19[16];
    }
  }
  if (v11) {
    goto LABEL_23;
  }
  unsigned int v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  }
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, unsigned char *a5, int a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  }
  __int16 v12 = 0;
  unsigned int v13 = 70;
  int v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      uint64_t v20 = 9;
      int v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          int v14 = 0;
          goto LABEL_19;
        }
        int v14 = -5;
        goto LABEL_28;
      }
      int v14 = v15;
      if (v15 != -3) {
        goto LABEL_28;
      }
    }
    uint64_t v20 = 5;
    int v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5) {
      int v17 = 0;
    }
    else {
      int v17 = -5;
    }
    if (v16) {
      int v14 = v16;
    }
    else {
      int v14 = v17;
    }
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        __int16 v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          unsigned int v13 = 70;
          int v14 = -4;
          goto LABEL_31;
        }
        int v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)__int16 v12 = *a3;
        v12[4] = v18;
        if (a5) {
          *a5 = BYTE4(v21[0]);
        }
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          unsigned int v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        __int16 v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    __int16 v12 = 0;
    if (v14) {
      goto LABEL_29;
    }
LABEL_30:
    int v14 = 0;
    unsigned int v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  }
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, void, void *, uint64_t, void, void), uint64_t a2, void *a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  }
  if (a1 && a3)
  {
    if (a4) {
      a1(a2, 2, 0, a3, 16, 0, 0);
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    uint64_t v8 = 0;
    unsigned int v9 = 10;
    goto LABEL_8;
  }
  unsigned int v9 = 70;
  uint64_t v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  }
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if (SerializedAddCredentialSize)
    {
      uint64_t v13 = SerializedAddCredentialSize;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        uint64_t v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 5, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        size_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  }
  if (a3 || a5 == 2)
  {
    BOOL v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *BOOL v10 = *a3;
      }
      else
      {
        *(void *)BOOL v10 = 0;
        *((void *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      uint64_t v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if (v11) {
        unsigned int v12 = 70;
      }
      else {
        unsigned int v12 = 10;
      }
    }
    else
    {
      unsigned int v12 = 70;
      uint64_t v11 = 4294967292;
    }
  }
  else
  {
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &size);
    if (v14)
    {
      uint64_t v13 = v14;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        uint64_t v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 6, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        size_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, void *a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  }
  size_t v32 = 0;
  size_t size = 0;
  __int16 v30 = 0;
  unint64_t v31 = 4096;
  unsigned int v18 = 70;
  uint64_t v19 = 4294967293;
  size_t v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      unsigned int v18 = 70;
      uint64_t v19 = 4294967293;
    }
    else
    {
      uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if (SerializedVerifyPolicySize)
      {
        uint64_t v19 = SerializedVerifyPolicySize;
        unsigned int v18 = 70;
      }
      else
      {
        size_t v21 = size;
        uint64_t v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          size_t v32 = size;
          uint64_t v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if (v23)
          {
            uint64_t v19 = v23;
            uint64_t v24 = 0;
          }
          else
          {
            uint64_t v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              uint64_t v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if (v25)
              {
                uint64_t v19 = v25;
              }
              else
              {
                unint64_t v26 = v31 - 4;
                if (v31 < 4)
                {
                  uint64_t v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    uint64_t v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!v19) {
                      *a10 = v30;
                    }
                  }
                  else
                  {
                    uint64_t v19 = 0;
                  }
                }
              }
            }
            else
            {
              uint64_t v19 = 4294967292;
            }
          }
          size_t v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if (v19) {
            unsigned int v18 = 70;
          }
          else {
            unsigned int v18 = 10;
          }
        }
        else
        {
          unsigned int v18 = 70;
          uint64_t v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  }
  unsigned int v4 = 70;
  uint64_t v5 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v5 = Util_DeallocRequirement(a2);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  }
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = a5 != 0;
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  }
  if (v14)
  {
LABEL_16:
    unsigned int v18 = 70;
    uint64_t v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x1F4188790](a1);
    size_t v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *size_t v15 = a3;
    int v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      int v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4)) {
      LibCall_ACMKernelControl_cold_1();
    }
    uint64_t v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if (v17) {
      unsigned int v18 = 70;
    }
    else {
      unsigned int v18 = 10;
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  }
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1) {
    return (_DWORD *)Util_DeallocCredential(a1);
  }
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = __n;
  if ((__src != 0) != (__n != 0)) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              BOOL v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            uint64_t result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        BOOL v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13) {
          return result;
        }
LABEL_79:
        uint64_t result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17) {
          return result;
        }
        uint64_t result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        long long v11 = __src[1];
        long long v16 = __src[2];
        long long v17 = __src[3];
        *((unsigned char *)a1 + 112) = *((unsigned char *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          uint64_t result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20) {
        return result;
      }
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              uint64_t result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              uint64_t result = 0;
              long long v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            BOOL v9 = *a1 == 12 || *a1 == 15;
            BOOL v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              uint64_t result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            uint64_t result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7) {
          return result;
        }
        uint64_t result = 0;
        long long v11 = *__src;
        *((void *)a1 + 10) = *((void *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7) {
        return result;
      }
    }
    uint64_t result = 0;
    long long v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_16;
        }
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          uint64_t result = 0;
          long long v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_102;
        }
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          long long v19 = __src[1];
          long long v20 = __src[2];
          long long v21 = __src[3];
          *((unsigned char *)a1 + 184) = *((unsigned char *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          uint64_t result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          uint64_t result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            BOOL v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18) {
              goto LABEL_64;
            }
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1) {
      return result;
    }
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      uint64_t result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    int v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        uint64_t v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18) {
          return result;
        }
        uint64_t v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      uint64_t v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3) {
        return result;
      }
      uint64_t v8 = a1 + 26;
      a1[25] = 16;
    }
    uint64_t result = 0;
    *uint64_t v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (!a1 || !a3 || !a4) {
    return result;
  }
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17) {
            return result;
          }
          long long v11 = a1 + 12;
LABEL_87:
          uint64_t v12 = 65;
          BOOL v13 = v11;
          uint64_t v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21) {
              return result;
            }
            long long v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((unsigned char *)a1 + 36, 128))
            {
              long long v15 = 0;
              uint64_t v10 = 0;
            }
            else
            {
              uint64_t v10 = a1[8];
            }
            uint64_t result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20) {
            return result;
          }
          long long v11 = a1 + 8;
          uint64_t v12 = 32;
          BOOL v13 = v11;
          uint64_t v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13) {
            return result;
          }
          uint64_t result = 0;
          *a3 = a1 + 9;
          uint64_t v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17) {
          return result;
        }
        long long v11 = a1 + 8;
        uint64_t v12 = 16;
        BOOL v13 = v11;
        uint64_t v14 = 16;
      }
      BOOL isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      uint64_t result = 0;
      BOOL v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory) {
        long long v21 = 0;
      }
      else {
        long long v21 = (int *)v11;
      }
      if (v20) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 0;
      }
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_77;
        }
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      uint64_t result = Util_isNullOrZeroMemory(v9, 16);
      if (result)
      {
        uint64_t result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      uint64_t v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      long long v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      uint64_t v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      *a3 = a1 + 16;
      uint64_t v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10) {
      return result;
    }
LABEL_15:
    BOOL v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          long long v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v10 = *(unsigned int *)((char *)a1 + 205);
          uint64_t v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205)) {
            uint64_t v23 = 0;
          }
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            uint64_t result = 0;
            *a3 = a1 + 10;
            uint64_t v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1) {
          return result;
        }
LABEL_61:
        uint64_t result = 0;
        long long v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0) {
        return result;
      }
LABEL_77:
      uint64_t result = 0;
      long long v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      uint64_t v10 = 4;
      goto LABEL_99;
    }
    int v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        BOOL v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3) {
          return result;
        }
        BOOL v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      BOOL v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18) {
      return result;
    }
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      uint64_t result = 0;
      *a3 = a1 + 4;
      uint64_t v10 = 8;
      goto LABEL_99;
    case 2:
      uint64_t result = 0;
      long long v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      uint64_t result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      uint64_t result = 0;
      long long v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      uint64_t result = 0;
      long long v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 4);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4 = 4294967293;
  if (!a1 || !a3 || !a4) {
    return v4;
  }
  uint64_t v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            int v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            unint64_t v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700) {
          return v4;
        }
        if (*a1 == 7)
        {
LABEL_28:
          uint64_t v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26) {
        return 4294967293;
      }
      if (a1[3] < 0x1C) {
        return 4294967282;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          BOOL v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          unint64_t v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600) {
          return v4;
        }
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            uint64_t v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25) {
        return 4294967293;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 43;
    }
LABEL_72:
    uint64_t v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3) {
          return 4294967293;
        }
        BOOL v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3) {
          return 4294967293;
        }
        unint64_t v10 = 0;
        long long v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24) {
          return 4294967293;
        }
        *a3 = a1 + 5;
        unint64_t v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24) {
          return 4294967293;
        }
        BOOL v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          int v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21) {
              goto LABEL_28;
            }
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200) {
          return v4;
        }
        if (*a1 != 2) {
          return 4294967293;
        }
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((unsigned char *)v11 + v10, 16))
    {
      BOOL v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        unint64_t v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10) {
      long long v11 = 0;
    }
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      unint64_t v10 = 4;
      goto LABEL_72;
    case 2:
      uint64_t v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      uint64_t v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2, uint64_t a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  }
  unsigned int v6 = 70;
  if (a1 && (a3 == 47 || a3 == 29))
  {
    uint64_t v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if (v7) {
      unsigned int v6 = 70;
    }
    else {
      unsigned int v6 = 10;
    }
  }
  else
  {
    uint64_t v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  }
  unsigned int v4 = 70;
  if (a1)
  {
    uint64_t v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    uint64_t v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  }
  unsigned int v14 = 70;
  uint64_t v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      uint64_t v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          uint64_t v19 = 24;
          __n128 Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if (v16)
          {
            uint64_t v15 = v16;
          }
          else if (v19 == 24)
          {
            uint64_t v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!v15)
            {
              unsigned int v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v15 = 4294967291;
          }
          unsigned int v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  }
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  }
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    uint64_t v16 = 8;
    uint64_t Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if (Property_Serialize)
    {
      uint64_t v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      uint64_t v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!v13)
      {
        unsigned int v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = 4294967291;
    }
    unsigned int v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  }
  unint64_t v31 = 4096;
  size_t size = 0;
  size_t v29 = 0;
  __int16 v30 = 0;
  uint64_t v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!v18) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!SerializedVerifyPolicySize)
  {
    size_t v20 = size;
    uint64_t v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      uint64_t v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if (v22)
      {
        uint64_t v18 = v22;
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          uint64_t v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if (v24)
          {
            uint64_t v18 = v24;
          }
          else
          {
            unint64_t v25 = v31 - 4;
            if (v31 < 4)
            {
              uint64_t v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                uint64_t v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!v18) {
                  *a10 = v30;
                }
              }
              else
              {
                uint64_t v18 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v18 = 4294967292;
        }
      }
      size_t v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v18 = 4294967292;
    }
    goto LABEL_18;
  }
  uint64_t v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30) {
    Util_DeallocRequirement(v30);
  }
LABEL_21:
  if (v18) {
    unsigned int v27 = 70;
  }
  else {
    unsigned int v27 = 10;
  }
  if (v27 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  }
  *(void *)size_t v20 = 0;
  uint64_t v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v20, 0, 1);
  if (!v16) {
    uint64_t v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  }
  uint64_t v17 = v16;
  if (*(void *)v20) {
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v20, 1);
  }
  if (v17) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v12 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  }
  unsigned int v9 = 70;
  uint64_t v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    uint64_t v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if (v10) {
      unsigned int v9 = 70;
    }
    else {
      unsigned int v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  }
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t v15 = a1;
  v21[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  }
  if (v15 && a6 == 16 * (a5 != 0) && (a7 ? (BOOL v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80) : (BOOL v16 = a8 != 0), !v16))
  {
    MEMORY[0x1F4188790](a1);
    uint64_t v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)uint64_t v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4) {
      *(_OWORD *)(v17 + 12) = *a4;
    }
    if (a5) {
      *(_OWORD *)(v17 + 28) = *a5;
    }
    if (a8) {
      memcpy(v17 + 44, a7, a8);
    }
    uint64_t v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if (v18) {
      unsigned int v19 = 70;
    }
    else {
      unsigned int v19 = 10;
    }
  }
  else
  {
    unsigned int v19 = 70;
    uint64_t v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    uint64_t v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if (v9) {
      unsigned int v8 = 70;
    }
    else {
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  }
  if (a1)
  {
    BOOL v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3) {
      BOOL v10 = a4 != 0;
    }
    unsigned int v11 = 70;
    if (!v10)
    {
      if (a5) {
        uint64_t v12 = 43;
      }
      else {
        uint64_t v12 = 39;
      }
      uint64_t v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if (v13) {
        unsigned int v11 = 70;
      }
      else {
        unsigned int v11 = 10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v11 = 70;
  }
  uint64_t v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, _OWORD *, unint64_t *))v1;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    uint64_t v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      char v20 = 1;
      *(_WORD *)&v21[1] = 6;
      __int16 v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      uint64_t v19 = 0;
      unint64_t v17 = 280;
      uint64_t v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if (v14)
      {
        uint64_t v12 = v14;
      }
      else if (v17 < 0x18)
      {
        uint64_t v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          uint64_t v12 = 0;
          int v15 = DWORD1(v18[1]);
          *(_OWORD *)uint64_t v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          void *v3 = v13;
          unsigned int v11 = 10;
          goto LABEL_11;
        }
        uint64_t v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      unsigned int v11 = 70;
    }
    else
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, int *))v0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (v9 && v4 && v2)
  {
    long long v20 = 0uLL;
    int v19 = 1310721;
    if (v6) {
      long long v20 = *v6;
    }
    else {
      long long v20 = 0uLL;
    }
    bzero(v16, 0x1106uLL);
    *(void *)int v15 = 4358;
    uint64_t v12 = v9(v8, 49, 0, &v19, 20, v16, v15);
    if (v12)
    {
      uint64_t v11 = v12;
LABEL_18:
      unsigned int v10 = 70;
      goto LABEL_14;
    }
    if (*(void *)v15 < 6uLL)
    {
      unsigned int v10 = 70;
      uint64_t v11 = 4294967291;
    }
    else
    {
      if (v16[0])
      {
        uint64_t v14 = v17;
        uint64_t v11 = Util_ReadFromBuffer((uint64_t)v16, *(size_t *)v15, &v14, v4, (unsigned __int16)__n);
        if (!v11)
        {
          *uint64_t v2 = v14 - v17;
          unsigned int v10 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      unsigned int v10 = 70;
      uint64_t v11 = 4294967280;
    }
  }
LABEL_14:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  }
  size_t size = 0;
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967276;
    }
    else
    {
      uint64_t v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if (v18)
      {
        uint64_t v17 = v18;
        unsigned int v16 = 70;
      }
      else
      {
        size_t v19 = size;
        long long v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          uint64_t v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!v21) {
            uint64_t v21 = a1(a2, 40, 0, v20, size, 0, 0);
          }
          uint64_t v17 = v21;
          size_t v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if (v17) {
            unsigned int v16 = 70;
          }
          else {
            unsigned int v16 = 10;
          }
        }
        else
        {
          unsigned int v16 = 70;
          uint64_t v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu)
  {
    uint64_t v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size_t size = 0;
  unsigned int v17 = 70;
  uint64_t v18 = 4294967293;
  if (a1)
  {
    uint64_t v26 = a2;
    if (a3)
    {
      uint64_t v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          uint64_t v19 = a8;
          uint64_t v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if (v20)
          {
            uint64_t v18 = v20;
            unsigned int v17 = 70;
          }
          else
          {
            size_t v21 = size;
            size_t v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              uint64_t Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!Data_Serialize) {
                uint64_t Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              }
              uint64_t v18 = Data_Serialize;
              size_t v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if (v18) {
                unsigned int v17 = 70;
              }
              else {
                unsigned int v17 = 10;
              }
            }
            else
            {
              unsigned int v17 = 70;
              uint64_t v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v7 = a1;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  }
  if (v7)
  {
    if (a3) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a4 == 0;
    }
    char v9 = !v8;
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x1F4188790](a1);
      uint64_t v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      _DWORD *v12 = 1;
      v12[1] = a4;
      if (a4) {
        memcpy(v12 + 2, a3, a4);
      }
      uint64_t v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if (v11) {
        unsigned int v10 = 70;
      }
      else {
        unsigned int v10 = 10;
      }
    }
  }
  else
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, long long *a3, int a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    int v16 = 1;
    int v18 = a4;
    long long v17 = *a3;
    memset(v15, 0, 140);
    unint64_t v14 = 140;
    uint64_t v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if (v12)
    {
      uint64_t v11 = v12;
    }
    else if (v14 < 0xC)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        uint64_t v11 = 0;
        *a5 = *(void *)((char *)v15 + 4);
        unsigned int v10 = 10;
        goto LABEL_10;
      }
      uint64_t v11 = 4294967281;
    }
    unsigned int v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  }
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  }
  size_t v36 = 0;
  uint64_t v34 = 0;
  unint64_t v35 = 4096;
  size_t v33 = 0;
  uint64_t v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!v20) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!SerializedVerifyAclConstraintSize)
  {
    uint64_t v22 = v36;
    uint64_t v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      uint64_t v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if (v24)
      {
        uint64_t v20 = v24;
        unint64_t v25 = 0;
      }
      else
      {
        unint64_t v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          uint64_t v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if (v26)
          {
            uint64_t v20 = v26;
          }
          else
          {
            unint64_t v27 = v35 - 4;
            if (v35 < 4)
            {
              uint64_t v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                uint64_t v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!v20) {
                  *a14 = v34;
                }
              }
              else
              {
                uint64_t v20 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v20 = 4294967292;
        }
      }
      rsize_t v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v20 = 4294967292;
    }
    goto LABEL_19;
  }
  uint64_t v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34) {
    Util_DeallocRequirement(v34);
  }
LABEL_22:
  if (v20) {
    unsigned int v29 = 70;
  }
  else {
    unsigned int v29 = 10;
  }
  if (v29 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  }
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, void *a14, unint64_t *a15)
{
  unsigned int v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    unsigned int v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclCFIndex Length = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        unsigned int v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          unsigned int v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    uint64_t v20 = a6;
    size_t v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationCFIndex Length = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        unsigned int v19 = gACMLoggingLevel;
      }
    }
  }
  int v39 = a3;
  if (a8)
  {
    uint64_t v22 = a8;
    uint64_t v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u) {
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
          }
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5) {
      BOOL v26 = a6 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = v26;
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if (!a7) {
      goto LABEL_79;
    }
    if (!a8) {
      goto LABEL_79;
    }
    if (v27) {
      goto LABEL_79;
    }
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12) {
      goto LABEL_79;
    }
    size_t v45 = 0;
    unint64_t v44 = 4096;
    if (gACMLoggingLevel <= 0xAu) {
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    }
    uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if (SerializedProcessAclSize)
    {
      uint64_t v25 = SerializedProcessAclSize;
      unsigned int v37 = 70;
      goto LABEL_74;
    }
    uint64_t v29 = v45;
    __int16 v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      unsigned int v37 = 70;
      uint64_t v25 = 4294967292;
      goto LABEL_74;
    }
    unint64_t v44 = 4096;
    unint64_t v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      unint64_t v35 = 0;
      unint64_t v34 = 0;
      uint64_t v25 = 4294967292;
      goto LABEL_68;
    }
    uint64_t v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if (v32 || (uint64_t v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), v32))
    {
      uint64_t v25 = v32;
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      goto LABEL_67;
    }
    unint64_t v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13) {
        *a13 = v31[1] != 0;
      }
      uint64_t v25 = 0;
      unint64_t v34 = 0;
      if (v39 != 30 || !a14)
      {
        unint64_t v35 = 0;
        goto LABEL_67;
      }
      unint64_t v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        rsize_t v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if (v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          unsigned int v37 = 70;
        }
        else if (v25)
        {
          unsigned int v37 = 70;
        }
        else
        {
          unsigned int v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel) {
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        }
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        unint64_t v34 = v31[2];
        if (v34)
        {
          if (v33 >= v34 + 12)
          {
            unint64_t v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              uint64_t v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              uint64_t v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        unint64_t v34 = 0;
        unint64_t v35 = 0;
        uint64_t v25 = 0;
        goto LABEL_67;
      }
    }
    unint64_t v34 = 0;
LABEL_84:
    unint64_t v35 = 0;
    uint64_t v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    goto LABEL_79;
  }
  unsigned int v24 = 70;
  uint64_t v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    uint64_t v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if (v25) {
      unsigned int v24 = 70;
    }
    else {
      unsigned int v24 = 10;
    }
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  }
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, void *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  }
  unsigned int v21 = 70;
  uint64_t v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v21 = 70;
        uint64_t v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            uint64_t v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if (v22) {
              unsigned int v21 = 70;
            }
            else {
              unsigned int v21 = 10;
            }
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, void, void), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  int v16 = a1;
  v24[1] = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  }
  BOOL v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3) {
    BOOL v17 = a4 != 0;
  }
  if (v17)
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
  }
  else
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        uint64_t v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            uint64_t v20 = a4 + 36;
            MEMORY[0x1F4188790](a1);
            uint64_t v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)uint64_t v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3) {
              memcpy(v22 + 36, a3, v21);
            }
            uint64_t v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if (v19) {
              unsigned int v18 = 70;
            }
            else {
              unsigned int v18 = 10;
            }
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, char a3)
{
  char v9 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  }
  uint64_t v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  uint64_t v6 = v5;
  if (v5) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  }
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  }
  char v15 = 0;
  unint64_t v14 = 1;
  char v13 = 0;
  uint64_t v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if (v8)
  {
    uint64_t v11 = v8;
    unsigned int v9 = 70;
  }
  else
  {
    unsigned int v9 = 70;
    if (v14 > 1)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      char v10 = v15 & ~a3;
      if (a4) {
        char v10 = v15 | a3;
      }
      char v13 = v10;
      uint64_t v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if (v11) {
        unsigned int v9 = 70;
      }
      else {
        unsigned int v9 = 10;
      }
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(void, void, void, void, void, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, unsigned char *a8)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  }
  memset(v27, 0, sizeof(v27));
  uint64_t v25 = 64;
  uint64_t v24 = 129;
  if (!a3) {
    goto LABEL_18;
  }
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (!a6 || !a7 || !a8) {
    goto LABEL_14;
  }
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v17 = 4294967293;
    goto LABEL_14;
  }
  uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if (UnlockSecret_Serialize
    || (uint64_t UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), UnlockSecret_Serialize)
    || (size_t __n = 0,
        __src = 0,
        char v21 = 0,
        uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        UnlockSecret_Serialize))
  {
    uint64_t v17 = UnlockSecret_Serialize;
  }
  else
  {
    size_t v19 = __n;
    if (*a7 < __n)
    {
      uint64_t v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        uint64_t v17 = 0;
        *a7 = v19;
        *a8 = v21;
        unsigned int v16 = 10;
        goto LABEL_14;
      }
      uint64_t v17 = 4294967291;
    }
  }
  unsigned int v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  __int16 v30 = a8;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  }
  unint64_t v33 = 1024;
  uint64_t v34 = 0;
  if (!a1) {
    goto LABEL_17;
  }
  BOOL v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3) {
    BOOL v16 = a4 != 0;
  }
  if (v16)
  {
LABEL_17:
    unsigned int v25 = 70;
    uint64_t v24 = 4294967293;
    goto LABEL_21;
  }
  uint64_t Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if (Size)
  {
LABEL_18:
    uint64_t v24 = Size;
LABEL_25:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  uint64_t v18 = a5;
  uint64_t v19 = a2;
  uint64_t v20 = (_OWORD *)MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if (v23)
  {
    uint64_t v24 = v23;
    goto LABEL_20;
  }
  uint64_t v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if (v24)
  {
LABEL_20:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  unsigned int v25 = 10;
  BOOL v26 = v30;
  if (!v30 || !a9) {
    goto LABEL_21;
  }
  size_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if (Size) {
    goto LABEL_18;
  }
  size_t v27 = v31;
  if (*a9 < v31)
  {
    uint64_t v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32) {
    memcpy(v26, v32, v31);
  }
  uint64_t v24 = 0;
  *a9 = v27;
  unsigned int v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  }
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, unsigned char *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v19 = 0;
  uint64_t v18 = 4;
  size_t v10 = a4;
  uint64_t v11 = a4 + 4;
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  }
  unsigned int v13 = 70;
  uint64_t v14 = 4294967293;
  if (a3 && a5)
  {
    unsigned int *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    uint64_t v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if (v15)
    {
      uint64_t v14 = v15;
      unsigned int v13 = 70;
    }
    else if (v18 == 4)
    {
      uint64_t v14 = 0;
      *a5 = 1;
      unsigned int v13 = 10;
    }
    else
    {
      unsigned int v13 = 70;
      uint64_t v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  }
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

void CoreTelephonyLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreTelephonyLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFObliterationController.m", 22, @"%s", *a1);

  __break(1u);
}

void __getIDSHardDeregisterSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *IDSLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFObliterationController.m", 31, @"%s", *a1);

  __break(1u);
}

void __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *AuthKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFObliterationController.m", 39, @"%s", *a1);

  __break(1u);
}

void __getCellularLoggingClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CellularLoggingLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFRemoteBasebandLoggingManager.m", 20, @"%s", *a1);

  __break(1u);
}

void __getCellularLoggingClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCellularLoggingClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFRemoteBasebandLoggingManager.m", 21, @"Unable to find class %s", "CellularLogging");

  __break(1u);
}

void _get_MKBLockDevice_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBLockDevice_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int __LAMKBLockDevice(CFDictionaryRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 67, @"%s", dlerror());

  __break(1u);
}

void _get_MKBUnlockDevice_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBUnlockDevice_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "int __LAMKBUnlockDevice(CFDataRef, CFDictionaryRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 68, @"%s", dlerror());

  __break(1u);
}

void _get_MKBGetDeviceConfigurations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBGetDeviceConfigurations_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFDictionaryRef __LAMKBGetDeviceConfigurations(CFDictionaryRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 69, @"%s", dlerror());

  __break(1u);
}

void _get_MKBGetDeviceLockState_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBGetDeviceLockState_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int __LAMKBGetDeviceLockState(CFDictionaryRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 70, @"%s", dlerror());

  __break(1u);
}

void _get_MKBGetDeviceLockStateInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBGetDeviceLockStateInfo_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFDictionaryRef __LAMKBGetDeviceLockStateInfo(CFDictionaryRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 71, @"%s", dlerror());

  __break(1u);
}

void _get_MKBDeviceUnlockedSinceBoot_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBDeviceUnlockedSinceBoot_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int __LAMKBDeviceUnlockedSinceBoot(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 72, @"%s", dlerror());

  __break(1u);
}

void _get_MKBDeviceLockAssertion_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBDeviceLockAssertion_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "MKBAssertionRef __LAMKBDeviceLockAssertion(CFDictionaryRef, CFErrorRef *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 73, @"%s", dlerror());

  __break(1u);
}

void _get_MKBKeyBagKeyStashCreateWithOpts_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBKeyBagKeyStashCreateWithOpts_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "int __LAMKBKeyBagKeyStashCreateWithOpts(CFDictionaryRef, int, CFDataRef, CFDataRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 74, @"%s", dlerror());

  __break(1u);
}

void _get_MKBKeyBagKeyStashCommit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBKeyBagKeyStashCommit_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int __LAMKBKeyBagKeyStashCommit(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 75, @"%s", dlerror());

  __break(1u);
}

void _get_MKBKeyBagKeyStashVerify_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBKeyBagKeyStashVerify_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFDictionaryRef __LAMKBKeyBagKeyStashVerify(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 76, @"%s", dlerror());

  __break(1u);
}

void _get_MKBEventsRegister_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBEventsRegister_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "MKBEvent *__LAMKBEventsRegister(__strong dispatch_queue_t, void (^__strong)(MKBEventType, CFDictionaryRef))");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 77, @"%s", dlerror());

  __break(1u);
}

void _get_MKBEventsUnregister_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBEventsUnregister_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"void __LAMKBEventsUnregister(MKBEvent *)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 78, @"%s", dlerror());

  __break(1u);
}

void _get_MKBKeyBagPerformRecovery_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBKeyBagPerformRecovery_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "int __LAMKBKeyBagPerformRecovery(CFDataRef, CFDictionaryRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 79, @"%s", dlerror());

  __break(1u);
}

void _get_MKBPrewarmSPS_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __LAMKBPrewarmSPS_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int __LAMKBPrewarmSPS(CFDictionaryRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFMobileKeyBag.m", 80, @"%s", dlerror());

  __break(1u);
}

void LocalAuthenticationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *LocalAuthenticationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFMobileKeyBag.m", 66, @"%s", *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *SpringBoardUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFLockScreenDateView.m", 32, @"%s", *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSBUILegibilityLabelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFLockScreenDateView.m", 33, @"Unable to find class %s", "SBUILegibilityLabel");

  __break(1u);
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoverSheetKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFLockScreenDateView.m", 39, @"%s", *a1);

  __break(1u);
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSProminentLayoutControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFLockScreenDateView.m", 41, @"Unable to find class %s", "CSProminentLayoutController");

  __break(1u);
}

void __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *AppleAccountUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFUserAuthenticationController.m", 36, @"%s", *a1);

  __break(1u);
}

void __getAAUIDeviceLocatorServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAAUIDeviceLocatorServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFUserAuthenticationController.m", 37, @"Unable to find class %s", "AAUIDeviceLocatorService");

  __break(1u);
}

void __getMTMaterialLayerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *CoreMaterialLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFCARendererImpl.m", 31, @"%s", *a1);

  __break(1u);
}

void __getMTMaterialLayerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMTMaterialLayerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFCARendererImpl.m", 32, @"Unable to find class %s", "MTMaterialLayer");

  __break(1u);
}

void __sbfImageByApplyingColorSpace_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18B52E000, a2, a3, " [SBFImageColorSpaceUtilities] the original image isn't CGImage based -> image=%{public}@", a5, a6, a7, a8, 2u);
}

void __sbfImageByApplyingColorSpace_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18B52E000, a2, a3, " [SBFImageColorSpaceUtilities] the original image doesn't have a colorspace -> image=%{public}@", a5, a6, a7, a8, 2u);
}

void __sbfImageByApplyingColorSpace_cold_3(CGColorSpace *a1)
{
  CGColorSpaceGetModel(a1);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_18B52E000, v1, v2, " [SBFImageColorSpaceUtilities] don't know which device colorspace matches ICC model=%i -> space=%{public}@", v3, v4, v5, v6, v7);
}

void __sbfImageByApplyingColorSpace_cold_4()
{
  CGColorSpaceGetType();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_18B52E000, v0, v1, " [SBFImageColorSpaceUtilities] don't know which device colorspace matches type=%i -> space=%{public}@", v2, v3, v4, v5, v6);
}

void __SBFPreheatImageData_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getSBUILegibilityLabelClass_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpringBoardUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFLockScreenDateSubtitleView.m", 15, @"%s", *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSBUILegibilityLabelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFLockScreenDateSubtitleView.m", 16, @"Unable to find class %s", "SBUILegibilityLabel");

  __break(1u);
}

void __getSOSUtilitiesClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SOSLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBSOSDefaults.m", 18, @"%s", *a1);

  __break(1u);
}

void __getSOSUtilitiesClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSOSUtilitiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBSOSDefaults.m", 19, @"Unable to find class %s", "SOSUtilities");

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_1_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SpringBoardUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFLockScreenAlternateDateLabel.m", 21, @"%s", *a1);

  __break(1u);
}

void __getSBUILegibilityLabelClass_block_invoke_cold_2_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSBUILegibilityLabelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFLockScreenAlternateDateLabel.m", 22, @"Unable to find class %s", "SBUILegibilityLabel");

  __break(1u);
}

void __getCSProminentDisplayViewControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoverSheetKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBFLockScreenDateViewController.m", 38, @"%s", *a1);

  __break(1u);
}

void __getCSProminentDisplayViewControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSProminentDisplayViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFLockScreenDateViewController.m", 39, @"Unable to find class %s", "CSProminentDisplayViewController");

  __break(1u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4107218]();
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x1F410A500]();
}

uint64_t AKSEventsUnregister()
{
  return MEMORY[0x1F410A508]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t AnalyticsSetCallbackForQueriedEventWithQueue()
{
  return MEMORY[0x1F41138C8]();
}

uint64_t BKSDisplaySetSecureMode()
{
  return MEMORY[0x1F410BE60]();
}

uint64_t BKSHIDEventMatchingPredicate()
{
  return MEMORY[0x1F410BEC8]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1F410C1B0]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1F410C1F8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x1F410C290]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1F410C2D8]();
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

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1F410C340]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1F410C358]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x1F410C3E0]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSNSStringFromCGSize()
{
  return MEMORY[0x1F410C490]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1F410C538]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1F410C540]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSUISurfaceWithColorSpaceAndDrawBlock()
{
  return MEMORY[0x1F410C710]();
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

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1F4113C88]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
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

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
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

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x1F40D9888]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AE8]();
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

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

uint64_t CGColorSpaceIsICCCompatible()
{
  return MEMORY[0x1F40D9C28]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
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

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithFilename(const char *filename)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA318](filename);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x1F40DA7F0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x1F40DA7F8]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x1F40DA830]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1F40E9698]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
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

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x1F40DAA08]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1F40DAA38]();
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99A8](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1F4109250]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1F4109260]();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF398](name, matrix, options, size);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1F4103088]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1F40E86D0](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1F40E8A28]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x1F4124A38]();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return MEMORY[0x1F4124A88]();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return MEMORY[0x1F4124AB0]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1F4124AE0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x1F40E94A0](property);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

uint64_t IOSurfaceWrapClientImage()
{
  return MEMORY[0x1F40E9640]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

uint64_t MKBPrewarmSPS()
{
  return MEMORY[0x1F412F9F0]();
}

uint64_t MKBVerifyPasswordWithContext()
{
  return MEMORY[0x1F412FA28]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t Mobile_Obliterate()
{
  return MEMORY[0x1F412FA30]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

uint64_t NSStringFromAnalyticsQueryName()
{
  return MEMORY[0x1F415BFA8]();
}

uint64_t NSStringFromBLSBacklightState()
{
  return MEMORY[0x1F410C0E8]();
}

uint64_t NSStringFromBLSFlipbookState()
{
  return MEMORY[0x1F410C0F0]();
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

uint64_t SBLogAuthenticationAssertions()
{
  return MEMORY[0x1F415C0B0]();
}

uint64_t SBLogAuthenticationController()
{
  return MEMORY[0x1F415C0B8]();
}

uint64_t SBLogAuthenticationKeybag()
{
  return MEMORY[0x1F415C0C0]();
}

uint64_t SBLogAuthenticationModel()
{
  return MEMORY[0x1F415C0C8]();
}

uint64_t SBLogAuthenticationRequests()
{
  return MEMORY[0x1F415C0D0]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1F415C108]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1F415C128]();
}

uint64_t SBLogDisplayScaleMapping()
{
  return MEMORY[0x1F415C168]();
}

uint64_t SBLogMotionAlarm()
{
  return MEMORY[0x1F415C238]();
}

uint64_t SBLogMotionGesture()
{
  return MEMORY[0x1F415C240]();
}

uint64_t SBLogScreenWake()
{
  return MEMORY[0x1F415C278]();
}

uint64_t SBLogZStack()
{
  return MEMORY[0x1F415C2C8]();
}

uint64_t SBSDisplayScaleDescription()
{
  return MEMORY[0x1F415C360]();
}

uint64_t SBSDisplayScaleMaskFromScale()
{
  return MEMORY[0x1F415C368]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x1F4102BC8]();
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x1F4102C08]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1F4102C10]();
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

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4102C98]();
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

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4102DF8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1F40E7358]();
}

uint64_t _NSStringFromUIPhysicalButton()
{
  return MEMORY[0x1F4102E58]();
}

uint64_t _UIInterfaceOrientationRotationDirectionForRotationFromInterfaceOrientationToInterfaceOrientation()
{
  return MEMORY[0x1F4102F18]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1F4102FE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
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

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x1F410A5E8]();
}

uint64_t aks_oneness_heartbeat()
{
  return MEMORY[0x1F410A650]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
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

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

void sync(void)
{
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1F417F728](*(void *)&code);
}

uint64_t uset_freeze()
{
  return MEMORY[0x1F41806F0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}

uint64_t uset_span()
{
  return MEMORY[0x1F4180748]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}