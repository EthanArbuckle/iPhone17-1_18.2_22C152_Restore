uint64_t _WallpaperStyleForBackgroundStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return 1;
  }
  else {
    return qword_1BC53F518[a1 - 1];
  }
}

uint64_t soft_PUIPosterSignificantEventOptionsContainsEvent(uint64_t a1, uint64_t a2)
{
  PUIPosterSignificantEventOptionsContainsEventSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getPUIPosterSignificantEventOptionsContainsEventSymbolLoc();
  if (!PUIPosterSignificantEventOptionsContainsEventSymbolLoc) {
    soft_PUIPosterSignificantEventOptionsContainsEvent_cold_1();
  }
  return PUIPosterSignificantEventOptionsContainsEventSymbolLoc(a1, a2);
}

uint64_t getPUIPosterSignificantEventOptionsContainsEventSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr;
  uint64_t v6 = getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr;
  if (!getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIPosterSignificantEventOptionsContainsEvent");
    getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4B60A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PBUIWallpaperStyleIsHidden(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t soft_PUIDynamicRotationIsActive()
{
  IsActiveSymbolLoc = (uint64_t (*)(void))getPUIDynamicRotationIsActiveSymbolLoc();
  if (!IsActiveSymbolLoc) {
    soft_PUIDynamicRotationIsActive_cold_1();
  }
  return IsActiveSymbolLoc();
}

uint64_t getPUIDynamicRotationIsActiveSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIDynamicRotationIsActiveSymbolLoc_ptr;
  uint64_t v6 = getPUIDynamicRotationIsActiveSymbolLoc_ptr;
  if (!getPUIDynamicRotationIsActiveSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIDynamicRotationIsActive");
    getPUIDynamicRotationIsActiveSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4B7464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PBUIRenderingLogFenceReason()
{
  if (PBUIRenderingLogFenceReason_onceToken != -1) {
    dispatch_once(&PBUIRenderingLogFenceReason_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)PBUIRenderingLogFenceReason___logObj;
  return v0;
}

id NSStringFrom_PBUIPosterViewControllerUpdateReasons(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __NSStringFrom_PBUIPosterViewControllerUpdateReasons_block_invoke;
  v13 = &unk_1E62B49F0;
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

void sub_1BC4B7A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4B81F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PBUILogSnapshot()
{
  if (PBUILogSnapshot_onceToken != -1) {
    dispatch_once(&PBUILogSnapshot_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)PBUILogSnapshot___logObj;
  return v0;
}

__CFString *PBUIStringForWallpaperVariant(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2) {
    return 0;
  }
  else {
    return off_1E62B4460[a1 + 1];
  }
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void PBUIApplyParallaxSettingsToViewWithFactor(void *a1, void *a2, double a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  unint64_t v7 = v6;
  if (v6)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v8 = objc_msgSend(v6, "_motionEffects", 0);
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

void PBUIApplyParallaxSettingsToView(void *a1, void *a2)
{
}

uint64_t PBUIWallpaperStyleTransitionStateMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  return result;
}

BOOL PBUIWallpaperVariantIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PBUIWallpaperStylePriorityIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

id PBUILogCommon()
{
  if (PBUILogCommon_onceToken != -1) {
    dispatch_once(&PBUILogCommon_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)PBUILogCommon___logObj;
  return v0;
}

void sub_1BC4BB278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PBUIWallpaperStyleDescription(unint64_t a1)
{
  if (a1 >= 0x1F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%li)", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_1E62B4B98[a1];
  }
  return v1;
}

__CFString *PBUIStringForWallpaperStylePriority(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E62B4D88[a1];
  }
}

BOOL PBUIWallpaperStyleIsValid(uint64_t a1)
{
  return a1 >= 0;
}

void sub_1BC4BBB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BC4BBC4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getPUIImageEncoderClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIImageEncoderClass_softClass;
  uint64_t v7 = getPUIImageEncoderClass_softClass;
  if (!getPUIImageEncoderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIImageEncoderClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPUIImageEncoderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4BBD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC4BBE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _WallpaperStyleUpdatesWithUserInterfaceStyle(uint64_t a1)
{
  return (unint64_t)(a1 - 28) < 3;
}

void _WallpaperBackdropParametersForStyleAndAverageColor(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  id v5 = a2;
  PBUIWallpaperBackdropParametersMake(0, 0, 0, a3);
  uint64_t v6 = 2030;
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      uint64_t v6 = -2;
      goto LABEL_7;
    case 3uLL:
      uint64_t v8 = 5;
      goto LABEL_14;
    case 4uLL:
    case 0x10uLL:
      uint64_t v6 = 2010;
      goto LABEL_7;
    case 5uLL:
    case 0xAuLL:
    case 0x11uLL:
      uint64_t v6 = 2070;
      goto LABEL_7;
    case 6uLL:
    case 0xBuLL:
    case 0x12uLL:
      uint64_t v6 = 2071;
      goto LABEL_7;
    case 7uLL:
    case 0xCuLL:
    case 0x13uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      uint64_t v6 = 2020;
      goto LABEL_7;
    case 8uLL:
    case 0x14uLL:
LABEL_7:
      *(void *)a3 = v6;
      if (a1 > 0x1E) {
        break;
      }
      uint64_t v7 = (void *)qword_1E62B4C90[a1];
      goto LABEL_22;
    case 9uLL:
      *(void *)(a3 + 24) = 0x4054000000000000;
      uint64_t v8 = 2010;
      goto LABEL_14;
    case 0xDuLL:
      *(void *)a3 = 2030;
      *(_OWORD *)(a3 + 40) = xmmword_1BC53F4D0;
      long long v9 = xmmword_1BC53F4E0;
      goto LABEL_16;
    case 0xEuLL:
      *(void *)a3 = 2020;
      *(void *)(a3 + 24) = 0x4024000000000000;
      *(_OWORD *)(a3 + 40) = xmmword_1BC53F4C0;
      goto LABEL_21;
    case 0xFuLL:
      *(void *)(a3 + 24) = 0x4054000000000000;
      uint64_t v8 = 2030;
LABEL_14:
      *(void *)a3 = v8;
      goto LABEL_21;
    case 0x15uLL:
      *(void *)a3 = 2030;
      *(_OWORD *)(a3 + 40) = xmmword_1BC53F4F0;
      long long v9 = xmmword_1BC53F500;
LABEL_16:
      *(_OWORD *)(a3 + 24) = v9;
      goto LABEL_21;
    case 0x1CuLL:
      uint64_t v10 = 1;
      goto LABEL_20;
    case 0x1DuLL:
      uint64_t v10 = 2;
      goto LABEL_20;
    case 0x1EuLL:
      uint64_t v10 = 3;
LABEL_20:
      *(void *)(a3 + 56) = v10;
LABEL_21:
      uint64_t v7 = (void *)MEMORY[0x1E4F43F90];
LABEL_22:
      *(void *)(a3 + 8) = *v7;
      break;
    default:
      break;
  }
  uint64_t v11 = _BackdropRenderingHintForWallpaperAverageColor(v5);

  *(void *)(a3 + 16) = v11;
}

void *_BackdropRenderingHintForWallpaperAverageColor(void *result)
{
  if (result)
  {
    double v1 = 0.0;
    double v2 = 0.0;
    [result getHue:0 saturation:&v2 brightness:&v1 alpha:0];
    if (v1 > 0.95) {
      return (void *)(v2 < 0.05);
    }
    else {
      return 0;
    }
  }
  return result;
}

int64x2_t PBUIWallpaperBackdropParametersMake@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  int64x2_t result = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(a4 + 24) = result;
  *(int64x2_t *)(a4 + 40) = result;
  *(void *)(a4 + 56) = 0;
  return result;
}

void sub_1BC4BCDB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t _WallpaperStyleHasTint(unint64_t a1)
{
  return (a1 < 0x1E) & (0x3DBFDE04u >> a1);
}

void sub_1BC4BD690(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t _WallpaperStyleHasBlur(unint64_t a1)
{
  return (a1 < 0x1F) & (0x76C0FFF8u >> a1);
}

uint64_t PBUIReplicaDebugModeIsEnabled()
{
  if (PBUIReplicaDebugModeIsEnabled_onceToken != -1) {
    dispatch_once(&PBUIReplicaDebugModeIsEnabled_onceToken, &__block_literal_global_5);
  }
  return PBUIReplicaDebugModeIsEnabled___isEnabled;
}

uint64_t PBUIWallpaperTransformOptionsShouldIgnoreZoom(char a1)
{
  return a1 & 1;
}

uint64_t PBUIWallpaperTransformOptionsShouldIgnoreRotation(unint64_t a1)
{
  return (a1 >> 1) & 1;
}

uint64_t PBUIWallpaperTransformOptionsShouldIgnoreLandscapeRotation(unint64_t a1)
{
  return (a1 >> 6) & 1;
}

Class initISAVPlayer()
{
  if (LoadPhotosPlayer_loadPredicate != -1) {
    dispatch_once(&LoadPhotosPlayer_loadPredicate, &__block_literal_global);
  }
  Class result = objc_getClass("ISAVPlayer");
  classISAVPlayer = (uint64_t)result;
  getISAVPlayerClass = (uint64_t (*)())ISAVPlayerFunction;
  return result;
}

id ISAVPlayerFunction()
{
  return (id)classISAVPlayer;
}

void __LoadPhotosPlayer_block_invoke()
{
  LoadPhotosPlayer_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PhotosPlayer.framework/PhotosPlayer", 2);
  if (!LoadPhotosPlayer_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

void sub_1BC4C0BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4C1D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC4C2290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC4C2518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC4C27F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getISAssetClass_block_invoke(uint64_t a1)
{
  PhotosPlayerLibrary();
  Class result = objc_getClass("ISAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getISAssetClass_block_invoke_cold_1();
  }
  getISAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PhotosPlayerLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!PhotosPlayerLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __PhotosPlayerLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E62B28B0;
    uint64_t v2 = 0;
    PhotosPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosPlayerLibraryCore_frameworkLibrary) {
    PhotosPlayerLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __PhotosPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getISPlayerItemClass_block_invoke(uint64_t a1)
{
  PhotosPlayerLibrary();
  Class result = objc_getClass("ISPlayerItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getISPlayerItemClass_block_invoke_cold_1();
  }
  getISPlayerItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLiveWallpaperPlayerClass_block_invoke(uint64_t a1)
{
  PhotosPlayerLibrary();
  Class result = objc_getClass("ISLiveWallpaperPlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getISLiveWallpaperPlayerClass_block_invoke_cold_1();
  }
  getISLiveWallpaperPlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLivePhotoPlayerClass_block_invoke(uint64_t a1)
{
  PhotosPlayerLibrary();
  Class result = objc_getClass("ISLivePhotoPlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getISLivePhotoPlayerClass_block_invoke_cold_1();
  }
  getISLivePhotoPlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLiveWallpaperUIViewClass_block_invoke(uint64_t a1)
{
  PhotosPlayerLibrary();
  Class result = objc_getClass("ISLiveWallpaperUIView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getISLiveWallpaperUIViewClass_block_invoke_cold_1();
  }
  getISLiveWallpaperUIViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISLivePhotoUIViewClass_block_invoke(uint64_t a1)
{
  PhotosPlayerLibrary();
  Class result = objc_getClass("ISLivePhotoUIView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getISLivePhotoUIViewClass_block_invoke_cold_1();
  }
  getISLivePhotoUIViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *PBUIStringForWallpaperTransformOptions(uint64_t a1)
{
  if (a1 > 1)
  {
    if (a1 != 2)
    {
      if (a1 == 15) {
        return @"ignoring all wallpaper options";
      }
      return @"unknown wallpaper options";
    }
    return @"ignore rotation";
  }
  else
  {
    if (a1)
    {
      if (a1 == 1) {
        return @"ignore scale";
      }
      return @"unknown wallpaper options";
    }
    return @"default wallpaper options";
  }
}

void sub_1BC4C3BC4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void sub_1BC4C42FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

id getMTMaterialViewClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMTMaterialViewClass_softClass;
  uint64_t v7 = getMTMaterialViewClass_softClass;
  if (!getMTMaterialViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMTMaterialViewClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getMTMaterialViewClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4C6F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTMaterialViewClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __MaterialKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E62B2BC0;
    uint64_t v5 = 0;
    MaterialKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MaterialKitLibraryCore_frameworkLibrary) {
    __getMTMaterialViewClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("MTMaterialView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMTMaterialViewClass_block_invoke_cold_2();
  }
  getMTMaterialViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MaterialKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MaterialKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BC4C8008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1BC4C8390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BC4C93F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PBUIRegisterForWallpaperExternalChangeNotification()
{
  if (PBUIRegisterForWallpaperExternalChangeNotification___once != -1) {
    dispatch_once(&PBUIRegisterForWallpaperExternalChangeNotification___once, &__block_literal_global_3);
  }
}

void sub_1BC4C9A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PBUIRegisterForExternalWallpaperChangeNotificationWithHandler(void *a1)
{
  id v1 = a1;
  int out_token = -1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PBUIRegisterForExternalWallpaperChangeNotificationWithHandler_block_invoke;
  v5[3] = &unk_1E62B2DD0;
  id v6 = v1;
  id v2 = v1;
  notify_register_dispatch("com.apple.springboard.wallpaperchanged", &out_token, MEMORY[0x1E4F14428], v5);
  uint64_t v3 = out_token;

  return v3;
}

void sub_1BC4D0198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _WallpaperMinimumZoomScale(double a1, double a2, double a3, double a4)
{
  double result = a1 / a3;
  double v5 = a2 / a4;
  if (result < v5) {
    return v5;
  }
  return result;
}

uint64_t _WallpaperMinimumZoomScaleForParallax(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", a1, a4, a5);
}

uint64_t __PBUIRegisterForExternalWallpaperChangeNotificationWithHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __PBUIRegisterForWallpaperExternalChangeNotification_block_invoke()
{
  return notify_register_dispatch("com.apple.springboard.wallpaperchanged", (int *)&PBUIRegisterForWallpaperExternalChangeNotification___token, MEMORY[0x1E4F14428], &__block_literal_global_147);
}

void __PBUIRegisterForWallpaperExternalChangeNotification_block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SBFWallpaperDidChangeNotification" object:0];
}

uint64_t PBUIPostExternalWallpaperChangeNotificationAsSystemShell()
{
  __isSystemShell = 1;
  return notify_post("com.apple.springboard.wallpaperchanged");
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

unint64_t PBUIIrisWallpaperPlaybackStateForISPlaybackState(unint64_t result)
{
  if (result >= 6) {
    return -1;
  }
  return result;
}

id PBUIIrisWallpaperPlaybackStateDescription(unint64_t a1)
{
  if (a1 >= 6)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
  }
  else
  {
    id v1 = (void *)*((void *)&off_1E62B2E58 + a1);
  }
  return v1;
}

__CFString *PBUIIrisWallpaperViewModeDescription(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v2 = @"still-only";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"live";
  }
  return v2;
}

id PBUIIrisPlayerStateDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v1 = objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
  }
  else
  {
    uint64_t v1 = (void *)*((void *)&off_1E62B2E88 + a1);
  }
  return v1;
}

uint64_t __PBUILogCommon_block_invoke()
{
  PBUILogCommon___logObj = (uint64_t)os_log_create("com.apple.PaperBoardUI", "Common");
  return MEMORY[0x1F41817F8]();
}

id PBUIRenderingLogLocalRenderer()
{
  if (PBUIRenderingLogLocalRenderer_onceToken != -1) {
    dispatch_once(&PBUIRenderingLogLocalRenderer_onceToken, &__block_literal_global_5);
  }
  id v0 = (void *)PBUIRenderingLogLocalRenderer___logObj;
  return v0;
}

uint64_t __PBUIRenderingLogLocalRenderer_block_invoke()
{
  PBUIRenderingLogLocalRenderer___logObj = (uint64_t)os_log_create("com.apple.paperboard.rendering", "LocalRenderer");
  return MEMORY[0x1F41817F8]();
}

id PBUIRenderingLogRendererService()
{
  if (PBUIRenderingLogRendererService_onceToken != -1) {
    dispatch_once(&PBUIRenderingLogRendererService_onceToken, &__block_literal_global_8);
  }
  id v0 = (void *)PBUIRenderingLogRendererService___logObj;
  return v0;
}

uint64_t __PBUIRenderingLogRendererService_block_invoke()
{
  PBUIRenderingLogRendererService___logObj = (uint64_t)os_log_create("com.apple.paperboard.rendering", "RendererService");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PBUIRenderingLogFenceReason_block_invoke()
{
  PBUIRenderingLogFenceReason___logObj = (uint64_t)os_log_create("com.apple.paperboard.rendering", "FenceReason");
  return MEMORY[0x1F41817F8]();
}

id PBUIRenderingLogImageUtilities()
{
  if (PBUIRenderingLogImageUtilities_onceToken != -1) {
    dispatch_once(&PBUIRenderingLogImageUtilities_onceToken, &__block_literal_global_14);
  }
  id v0 = (void *)PBUIRenderingLogImageUtilities___logObj;
  return v0;
}

uint64_t __PBUIRenderingLogImageUtilities_block_invoke()
{
  PBUIRenderingLogImageUtilities___logObj = (uint64_t)os_log_create("com.apple.paperboard.rendering", "ImageUtilities");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PBUILogSnapshot_block_invoke()
{
  PBUILogSnapshot___logObj = (uint64_t)os_log_create("com.apple.PaperBoardUI", "Snapshot");
  return MEMORY[0x1F41817F8]();
}

id PBUILogCaching()
{
  if (PBUILogCaching_onceToken != -1) {
    dispatch_once(&PBUILogCaching_onceToken, &__block_literal_global_20);
  }
  id v0 = (void *)PBUILogCaching___logObj;
  return v0;
}

uint64_t __PBUILogCaching_block_invoke()
{
  PBUILogCaching___logObj = (uint64_t)os_log_create("com.apple.PaperBoardUI", "Caching");
  return MEMORY[0x1F41817F8]();
}

void sub_1BC4D44D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4610(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4A10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4AC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4B68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4C0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4F18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D4FC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5064(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5238(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5690(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D571C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D57D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5870(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BC4D5BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BC4D5C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BC4D5D0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5EB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D5F54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC4D66F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __PBUIReplicaDebugModeIsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  PBUIReplicaDebugModeIsEnabled___isEnabled = [v0 BOOLForKey:@"PBUIReplicaDebugMode"];
}

void sub_1BC4D7624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

PBUIHomeVariantStyleState *PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration(void *a1)
{
  id v1 = a1;
  id v2 = [v1 customizationConfiguration];
  uint64_t v3 = [v2 isDimmed];

  uint64_t v4 = [v1 customizationConfiguration];
  double v5 = [v4 tintColorStyle];

  id v6 = [v1 customizationConfiguration];
  uint64_t v7 = [v6 suggestedTintColor];

  uint64_t v8 = [v1 customizationConfiguration];
  uint64_t v9 = [v8 iconUserInterfaceSize];

  uint64_t v10 = [v1 customizationConfiguration];

  uint64_t v11 = [v10 iconUserInterfaceStyleType];

  v12 = [[PBUIHomeVariantStyleState alloc] initWithTintColorStyle:v5 suggestedTintColor:v7 isHomeScreenDimmed:v3 iconSize:v9 iconStyle:v11];
  return v12;
}

id __possibleWallpaperFileNames()
{
  if (__possibleWallpaperFileNames_onceToken != -1) {
    dispatch_once(&__possibleWallpaperFileNames_onceToken, &__block_literal_global_34);
  }
  id v0 = (void *)__possibleWallpaperFileNames_possibleWallpaperFileNames;
  return v0;
}

id __wallpaperImageFilename(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a1 != 1)
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    id v2 = @"HomeBackground";
  }
  else
  {
    id v2 = @"LockBackground";
  }
  if (a2 == 2)
  {
    uint64_t v3 = PBUIStringForWallpaperMode(2uLL);
    id v2 = [(__CFString *)v2 stringByAppendingString:v3];
  }
  uint64_t v4 = [(__CFString *)v2 stringByAppendingString:@".cpbitmap"];

LABEL_9:
  return v4;
}

id __wallpaperOriginalImageFilename(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a1 != 1)
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    id v2 = @"OriginalHomeBackground";
  }
  else
  {
    id v2 = @"OriginalLockBackground";
  }
  if (a2 == 2)
  {
    uint64_t v3 = PBUIStringForWallpaperMode(2uLL);
    id v2 = [(__CFString *)v2 stringByAppendingString:v3];
  }
  uint64_t v4 = [(__CFString *)v2 stringByAppendingString:@".cpbitmap"];

LABEL_9:
  return v4;
}

id __wallpaperThumbnailFilename(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a1 != 1)
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    id v2 = @"HomeBackgroundThumbnail";
  }
  else
  {
    id v2 = @"LockBackgroundThumbnail";
  }
  if (a2 == 2)
  {
    uint64_t v3 = PBUIStringForWallpaperMode(2uLL);
    id v2 = [(__CFString *)v2 stringByAppendingString:v3];
  }
  uint64_t v4 = [(__CFString *)v2 stringByAppendingString:@".jpg"];

LABEL_9:
  return v4;
}

BOOL __hasEnoughFreeSpaceToSetWallpaper()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(&v4, 0, 512);
  NSHomeDirectory();
  id v0 = objc_claimAutoreleasedReturnValue();
  int v1 = statfs((const char *)[v0 fileSystemRepresentation], &v4);

  return !v1 && v4.f_bfree * v4.f_bsize > 0x1400000;
}

id __wallpaperVideoFilename(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a1 != 1)
    {
      statfs v4 = 0;
      goto LABEL_9;
    }
    id v2 = @"HomeVideo";
  }
  else
  {
    id v2 = @"LockVideo";
  }
  if (a2 == 2)
  {
    uint64_t v3 = PBUIStringForWallpaperMode(2uLL);
    id v2 = [(__CFString *)v2 stringByAppendingString:v3];
  }
  statfs v4 = [(__CFString *)v2 stringByAppendingString:@".mov"];

LABEL_9:
  return v4;
}

id __wallpaperOriginalVideoFilename(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a1 != 1)
    {
      statfs v4 = 0;
      goto LABEL_9;
    }
    id v2 = @"OriginalHomeVideo";
  }
  else
  {
    id v2 = @"OriginalLockVideo";
  }
  if (a2 == 2)
  {
    uint64_t v3 = PBUIStringForWallpaperMode(2uLL);
    id v2 = [(__CFString *)v2 stringByAppendingString:v3];
  }
  statfs v4 = [(__CFString *)v2 stringByAppendingString:@".mov"];

LABEL_9:
  return v4;
}

void sub_1BC4DAB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ____possibleWallpaperFileNames_block_invoke()
{
  id v2 = (id)objc_opt_new();
  [v2 addObject:@"OriginalLockBackground"];
  [v2 addObject:@"OriginalHomeBackground"];
  [v2 addObject:@"OriginalHomeVideo"];
  [v2 addObject:@"OriginalLockVideo"];
  [v2 addObject:@"LockBackgroundThumbnail"];
  [v2 addObject:@"HomeBackgroundThumbnail"];
  [v2 addObject:@"LockVideo"];
  [v2 addObject:@"HomeVideo"];
  [v2 addObject:@"LockBackground"];
  [v2 addObject:@"HomeBackground"];
  uint64_t v0 = [v2 copy];
  int v1 = (void *)__possibleWallpaperFileNames_possibleWallpaperFileNames;
  __possibleWallpaperFileNames_possibleWallpaperFileNames = v0;
}

id PBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURL()
{
  soft_PUIFeatureEnabled(4);
  uint64_t v0 = BSSystemSharedResourcesDirectoryForIdentifier();
  int v1 = [v0 stringByAppendingPathComponent:@"Wallpaper"];

  if (v1
    || (NSTemporaryDirectory(),
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 stringByAppendingPathComponent:@"SpringBoard"],
        int v1 = objc_claimAutoreleasedReturnValue(),
        v2,
        v1))
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1 isDirectory:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1BC4DF510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
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

id PBUIStringForWallpaperLocations(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PBUIStringForWallpaperLocations_block_invoke;
  v6[3] = &unk_1E62B2D28;
  id v7 = v2;
  id v3 = v2;
  PBUIWallpaperEnumerateVariantsForLocations(a1, v6);
  uint64_t v4 = [v3 componentsJoinedByString:@"+"];

  return v4;
}

void PBUIWallpaperEnumerateVariantsForLocations(char a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void (**)(void, void, void))v3;
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v6 = 0;
  (*((void (**)(id, void, char *))v3 + 2))(v3, 0, &v6);
  if ((a1 & 2) != 0 && !v6)
  {
LABEL_6:
    char v5 = 0;
    ((void (**)(void, uint64_t, char *))v4)[2](v4, 1, &v5);
  }
LABEL_7:
}

void __PBUIStringForWallpaperLocations_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  PBUIStringForWallpaperVariant(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

uint64_t PBUIWallpaperLocationForVariant(uint64_t a1)
{
  if (a1) {
    return 2 * (a1 == 1);
  }
  else {
    return 1;
  }
}

uint64_t PBUIWallpaperLocationsForString(void *a1)
{
  id v1 = a1;
  int v2 = [v1 containsString:@"lock"];
  int v3 = [v1 containsString:@"home"];

  uint64_t v4 = 3;
  if (!v3) {
    uint64_t v4 = 1;
  }
  uint64_t v5 = 2;
  if (!v3) {
    uint64_t v5 = 0;
  }
  if (v2) {
    return v4;
  }
  else {
    return v5;
  }
}

void sub_1BC4E3044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _UIUserInterfaceStyleDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a1);
  }
  else
  {
    id v1 = *(&off_1E62B3830 + a1);
  }
  return v1;
}

void sub_1BC4E4878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4E5008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4E5C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4E7AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Unwind_Resume(a1);
}

void sub_1BC4E9CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4E9FD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BC4EAC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4EB1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC4EB550(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1BC4EC408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPIParallaxLegacyPosterStyleClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotoImagingLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PhotoImagingLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E62B3868;
    uint64_t v5 = 0;
    PhotoImagingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotoImagingLibraryCore_frameworkLibrary) {
    __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PIParallaxLegacyPosterStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_2();
  }
  getPIParallaxLegacyPosterStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotoImagingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoImagingLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL PBUICurrentParallaxDeviceType()
{
  return (unint64_t)(PBUICurrentDeviceWallpaperSizeType() - 3) < 2;
}

__CFString *PBUIStringForPosterWallpaperPairingType(unsigned int a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", (int)a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E62B3880[a1];
  }
  return v1;
}

__CFString *PBUIStringForPosterWallpaperMigrationProvider(unsigned int a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", (int)a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E62B3898[a1];
  }
  return v1;
}

__CFString *PBUIExtensionIdentifierForPosterWallpaperMigrationProvider(uint64_t a1)
{
  if (a1 == 1) {
    return @"com.apple.PhotosUIPrivate.PhotosPosterProvider";
  }
  if (a1 == 2) {
    return @"com.apple.WallpaperKit.CollectionsPoster";
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"invalid provider %i", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    PBUIExtensionIdentifierForPosterWallpaperMigrationProvider_cold_1((uint64_t)v2);
  }
  [v2 UTF8String];
  uint64_t result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

__CFString *_NSStringFromUIUserInterfaceStyle(uint64_t a1)
{
  id v1 = @"Unspecified";
  if (a1 == 2) {
    id v1 = @"Dark";
  }
  if (a1 == 1) {
    return @"Light";
  }
  else {
    return v1;
  }
}

id soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t, uint64_t))get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr;
  uint64_t v9 = get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr;
  if (!get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke;
    v5[3] = &unk_1E62B2890;
    void v5[4] = &v6;
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke((uint64_t)v5);
    uint64_t v2 = (void (*)(uint64_t, uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1();
  }
  int v3 = v2(19, a1);
  return v3;
}

void sub_1BC4EE518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MaterialKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MaterialKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1BC4EF960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PBUIWallpaperImageWithFlatColor(void *a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v7 = (CGColor *)[a1 CGColor];
  uint64_t v8 = v7;
  if (v7 && (ColorSpace = CGColorGetColorSpace(v7)) != 0) {
    DeviceRGB = CGColorSpaceRetain(ColorSpace);
  }
  else {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  uint64_t v11 = DeviceRGB;
  if (DeviceRGB && (v12 = PBUICreateWallpaperImageBitmapContext(DeviceRGB, a2, a3, a4), CGColorSpaceRelease(v11), v12))
  {
    CGContextSetFillColorWithColor(v12, v8);
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = a2;
    v17.size.height = a3;
    CGContextFillRect(v12, v17);
    Image = CGBitmapContextCreateImage(v12);
    CGContextRelease(v12);
    id v14 = [MEMORY[0x1E4F42A80] imageWithCGImage:Image scale:0 orientation:a4];
    CGImageRelease(Image);
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

CGContext *PBUICreateWallpaperImageBitmapContext(CGColorSpace *a1, double a2, double a3, CGFloat a4)
{
  size_t v7 = (unint64_t)(a2 * a4);
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(a1);
  BOOL v9 = CGColorSpaceUsesExtendedRange(a1);
  size_t v10 = v7 + v7 * NumberOfComponents;
  if (NumberOfComponents == 1)
  {
    size_t v10 = v7;
    int v11 = 0;
  }
  else
  {
    int v11 = 2;
  }
  if (v9) {
    size_t v12 = 4 * v7 * NumberOfComponents;
  }
  else {
    size_t v12 = v10;
  }
  if (v9) {
    size_t v13 = 32;
  }
  else {
    size_t v13 = 8;
  }
  if (v9) {
    uint32_t v14 = 8448;
  }
  else {
    uint32_t v14 = v11;
  }
  double v15 = CGBitmapContextCreate(0, v7, (unint64_t)(a3 * a4), v13, v12, a1, v14);
  CGContextScaleCTM(v15, a4, a4);
  return v15;
}

CGContext *PBUIWallpaperImageWithGradient(void *a1, double a2, double a3, CGFloat a4)
{
  id v7 = a1;
  uint64_t v8 = [v7 colors];
  id v9 = [v8 firstObject];
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v9 CGColor]);
  DeviceRGB = CGColorSpaceRetain(ColorSpace);

  if (DeviceRGB || (DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0)
  {
    size_t v12 = PBUICreateWallpaperImageBitmapContext(DeviceRGB, a2, a3, a4);
    CGColorSpaceRelease(DeviceRGB);
    if (v12)
    {
      size_t v13 = (CGGradient *)[v7 copyCGGradient];
      [v7 startPoint];
      double v14 = a2 * a4;
      CGFloat v16 = a2 * a4 * v15;
      double v17 = a3 * a4;
      CGFloat v19 = a3 * a4 * v18;
      [v7 endPoint];
      v26.x = v14 * v20;
      v26.y = v17 * v21;
      v25.x = v16;
      v25.y = v19;
      CGContextDrawLinearGradient(v12, v13, v25, v26, 0);
      CGGradientRelease(v13);
      Image = CGBitmapContextCreateImage(v12);
      CGContextRelease(v12);
      size_t v12 = [MEMORY[0x1E4F42A80] imageWithCGImage:Image scale:0 orientation:a4];
      CGImageRelease(Image);
    }
  }
  else
  {
    size_t v12 = 0;
  }

  return v12;
}

id PBUIWallpaperDataForFileURL(void *a1, void *a2)
{
  if (a1)
  {
    [a1 path];
    uint64_t MappedDataFromPath = CPBitmapCreateMappedDataFromPath();
    long long v4 = (void *)MappedDataFromPath;
    if (a2 && !MappedDataFromPath) {
      *a2 = 0;
    }
  }
  else
  {
    long long v4 = 0;
  }
  return v4;
}

void *PBUIWallpaperUIImageForImageData(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v3 = a1;
  CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
  if (ImagesFromData)
  {
    CFArrayRef v5 = ImagesFromData;
    ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
    CGImageRetain(ValueAtIndex);
    CFRelease(v5);
    if (ValueAtIndex) {
      goto LABEL_6;
    }
  }
  id v7 = CGImageSourceCreateWithData(v3, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    if (CGImageSourceGetCount(v7))
    {
      size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v8);
      ValueAtIndex = CGImageSourceCreateImageAtIndex(v8, PrimaryImageIndex, 0);
      CFRelease(v8);
      if (ValueAtIndex)
      {
LABEL_6:
        a2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:", ValueAtIndex, 0);
        CGImageRelease(ValueAtIndex);
        goto LABEL_10;
      }
    }
    else
    {
      CFRelease(v8);
    }
  }
  if (a2)
  {
    size_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28588];
    v14[0] = @"Failed to create images from CPBitmapCreateImagesFromData / CGImageSourceCreateWithData";
    int v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, 0);
    *a2 = [v10 errorWithDomain:@"com.apple.PaperBoardUI.error" code:256 userInfo:v11];

    a2 = 0;
  }
LABEL_10:

  return a2;
}

id soft_PUIIOSurfaceFromCGImage(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  long long v4 = (void (*)(uint64_t, uint64_t))getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  int v11 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  if (!getPUIIOSurfaceFromCGImageSymbolLoc_ptr)
  {
    CFArrayRef v5 = (void *)PosterUIFoundationLibrary();
    v9[3] = (uint64_t)dlsym(v5, "PUIIOSurfaceFromCGImage");
    getPUIIOSurfaceFromCGImageSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    long long v4 = (void (*)(uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    soft_PUIIOSurfaceFromCGImage_cold_1();
  }
  uint64_t v6 = v4(a1, a2);
  return v6;
}

void sub_1BC4F26F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC4F3AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPUIImageEncoderErrorDomain()
{
  uint64_t v4 = 0;
  CFArrayRef v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  uint64_t v7 = getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  if (!getPUIImageEncoderErrorDomainSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary();
    v5[3] = (uint64_t)dlsym(v1, "PUIImageEncoderErrorDomain");
    getPUIImageEncoderErrorDomainSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getPUIImageEncoderErrorDomain_cold_1();
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1BC4F3BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIIOSurfaceFromCGImageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary();
  uint64_t result = dlsym(v2, "PUIIOSurfaceFromCGImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIIOSurfaceFromCGImageSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterUIFoundationLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __PosterUIFoundationLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E62B3998;
    uint64_t v4 = 0;
    PosterUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PosterUIFoundationLibraryCore_frameworkLibrary;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary) {
    PosterUIFoundationLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __PosterUIFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterUIFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPUIImageOnDiskFormatClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIImageOnDiskFormat");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIImageOnDiskFormatClass_block_invoke_cold_1();
  }
  getPUIImageOnDiskFormatClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPUIImageEncoderErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary();
  Class result = dlsym(v2, "PUIImageEncoderErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIImageEncoderErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_0(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t, uint64_t))get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0;
  id v9 = get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0;
  if (!get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_ptr_0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_0;
    v5[3] = &unk_1E62B2890;
    void v5[4] = &v6;
    __get_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyleSymbolLoc_block_invoke_0((uint64_t)v5);
    uint64_t v2 = (void (*)(uint64_t, uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1_0();
  }
  long long v3 = v2(19, a1);
  return v3;
}

void sub_1BC4F6098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC4F6B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __MaterialKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  MaterialKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

uint64_t PBUIWallpaperTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"static"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"procedural"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"video"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"color"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *PBUIStringForWallpaperType(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E62B3B20[a1];
  }
}

void sub_1BC4F9234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return objc_opt_class();
}

void sub_1BC4FAED4(_Unwind_Exception *a1)
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

void __PBUIGetCurrentMagnifyMode_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  [v10 size];
  if (v8 == *(double *)(a1 + 40) && v7 == *(double *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __PBUIGetMagnifyModes_block_invoke()
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MGCopyAnswer();
  if ([v0 hasPrefix:@"N56"])
  {
    uint64_t v1 = +[PBUIMagnifyMode magnifyModeWithSize:@"Large", 1242.0, 2208.0 name];
    v16[0] = v1;
    uint64_t v2 = +[PBUIMagnifyMode magnifyModeWithSize:@"Medium", 1125.0, 2001.0 name];
    v16[1] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v4 = (void *)PBUIGetMagnifyModes_PBUIMagnifyModes;
    PBUIGetMagnifyModes_PBUIMagnifyModes = v3;

    uint64_t v5 = [(id)PBUIGetMagnifyModes_PBUIMagnifyModes objectAtIndexedSubscript:1];
    uint64_t v6 = v5;
    LODWORD(v7) = 1066225631;
  }
  else
  {
    if (![v0 hasPrefix:@"N61"])
    {
      uint64_t v6 = +[PBUIMagnifyMode magnifyModeWithSize:@"Medium", 640.0, 1136.0 name];
      double v14 = v6;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      uint64_t v13 = (void *)PBUIGetMagnifyModes_PBUIMagnifyModes;
      PBUIGetMagnifyModes_PBUIMagnifyModes = v12;

      goto LABEL_7;
    }
    double v8 = +[PBUIMagnifyMode magnifyModeWithSize:@"Medium", 750.0, 1334.0 name];
    v15[0] = v8;
    uint64_t v9 = +[PBUIMagnifyMode magnifyModeWithSize:@"Small", 640.0, 1136.0 name];
    v15[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    int v11 = (void *)PBUIGetMagnifyModes_PBUIMagnifyModes;
    PBUIGetMagnifyModes_PBUIMagnifyModes = v10;

    uint64_t v5 = [(id)PBUIGetMagnifyModes_PBUIMagnifyModes objectAtIndexedSubscript:1];
    uint64_t v6 = v5;
    LODWORD(v7) = 1066795008;
  }
  [v5 setZoomFactor:v7];
LABEL_7:
}

uint64_t PosterBoardServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PosterBoardServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = PosterBoardServicesLibraryCore_frameworkLibrary;
  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E62B3D68;
    long long v7 = *(_OWORD *)&off_1E62B3D78;
    v3[3] = _sl_dlopen();
    PosterBoardServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1BC4FB6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PosterBoardServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PosterBoardServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterBoardServicesLibrary()
{
  uint64_t v1 = 0;
  uint64_t result = PosterBoardServicesLibraryCore();
  if (!result) {
    PosterBoardServicesLibrary_cold_1(&v1);
  }
  return result;
}

id getPRSWallpaperObserverClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSWallpaperObserverClass_softClass;
  uint64_t v7 = getPRSWallpaperObserverClass_softClass;
  if (!getPRSWallpaperObserverClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSWallpaperObserverClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSWallpaperObserverClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FB8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSWallpaperObserverClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSWallpaperObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSWallpaperObserverClass_block_invoke_cold_1();
  }
  getPRSWallpaperObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSWallpaperObserverConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSWallpaperObserverConfigurationClass_softClass;
  uint64_t v7 = getPRSWallpaperObserverConfigurationClass_softClass;
  if (!getPRSWallpaperObserverConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSWallpaperObserverConfigurationClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSWallpaperObserverConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FBA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSWallpaperObserverConfigurationClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSWallpaperObserverConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSWallpaperObserverConfigurationClass_block_invoke_cold_1();
  }
  getPRSWallpaperObserverConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSWallpaperLocationStateObserverClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSWallpaperLocationStateObserverClass_softClass;
  uint64_t v7 = getPRSWallpaperLocationStateObserverClass_softClass;
  if (!getPRSWallpaperLocationStateObserverClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSWallpaperLocationStateObserverClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSWallpaperLocationStateObserverClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FBB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSWallpaperLocationStateObserverClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSWallpaperLocationStateObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSWallpaperLocationStateObserverClass_block_invoke_cold_1();
  }
  getPRSWallpaperLocationStateObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSPosterUpdaterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSPosterUpdaterClass_softClass;
  uint64_t v7 = getPRSPosterUpdaterClass_softClass;
  if (!getPRSPosterUpdaterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSPosterUpdaterClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSPosterUpdaterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FBC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSPosterUpdaterClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSPosterUpdater");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSPosterUpdaterClass_block_invoke_cold_1();
  }
  getPRSPosterUpdaterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSPosterUpdateClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSPosterUpdateClass_softClass;
  uint64_t v7 = getPRSPosterUpdateClass_softClass;
  if (!getPRSPosterUpdateClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSPosterUpdateClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSPosterUpdateClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FBDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSPosterUpdateClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSPosterUpdate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSPosterUpdateClass_block_invoke_cold_1();
  }
  getPRSPosterUpdateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSServiceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSServiceClass_softClass;
  uint64_t v7 = getPRSServiceClass_softClass;
  if (!getPRSServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSServiceClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FBEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSServiceClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSServiceClass_block_invoke_cold_1();
  }
  getPRSServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPRSPosterConfigurationClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRSPosterConfigurationClass_softClass;
  uint64_t v7 = getPRSPosterConfigurationClass_softClass;
  if (!getPRSPosterConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRSPosterConfigurationClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRSPosterConfigurationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FC02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRSPosterConfigurationClass_block_invoke(uint64_t a1)
{
  PosterBoardServicesLibrary();
  Class result = objc_getClass("PRSPosterConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRSPosterConfigurationClass_block_invoke_cold_1();
  }
  getPRSPosterConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterFoundationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PosterFoundationLibraryCore_frameworkLibrary;
  uint64_t v5 = PosterFoundationLibraryCore_frameworkLibrary;
  if (!PosterFoundationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E62B3DB0;
    long long v7 = *(_OWORD *)&off_1E62B3DC0;
    v3[3] = _sl_dlopen();
    PosterFoundationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1BC4FC1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PosterFoundationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PosterFoundationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterFoundationLibrary()
{
  id v1 = 0;
  uint64_t result = PosterFoundationLibraryCore();
  if (!result) {
    PosterFoundationLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getPFFileProtectionNoneAttributesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPFFileProtectionNoneAttributesSymbolLoc_ptr;
  uint64_t v6 = getPFFileProtectionNoneAttributesSymbolLoc_ptr;
  if (!getPFFileProtectionNoneAttributesSymbolLoc_ptr)
  {
    id v1 = (void *)PosterFoundationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "PFFileProtectionNoneAttributes");
    getPFFileProtectionNoneAttributesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FC380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPFFileProtectionNoneAttributesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterFoundationLibrary();
  uint64_t result = dlsym(v2, "PFFileProtectionNoneAttributes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPFFileProtectionNoneAttributesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_PFFileProtectionNoneAttributes()
{
  PFFileProtectionNoneAttributesSymbolLoc = (uint64_t (*)(void))getPFFileProtectionNoneAttributesSymbolLoc();
  if (!PFFileProtectionNoneAttributesSymbolLoc) {
    soft_PFFileProtectionNoneAttributes_cold_1();
  }
  return PFFileProtectionNoneAttributesSymbolLoc();
}

uint64_t getPF_IS_PAD_DEVICESymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPF_IS_PAD_DEVICESymbolLoc_ptr;
  uint64_t v6 = getPF_IS_PAD_DEVICESymbolLoc_ptr;
  if (!getPF_IS_PAD_DEVICESymbolLoc_ptr)
  {
    id v1 = (void *)PosterFoundationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "PF_IS_PAD_DEVICE");
    getPF_IS_PAD_DEVICESymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FC4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_PF_IS_PAD_DEVICE()
{
  PF_IS_PAD_DEVICESymbolLoc = (uint64_t (*)(void))getPF_IS_PAD_DEVICESymbolLoc();
  if (!PF_IS_PAD_DEVICESymbolLoc) {
    soft_PF_IS_PAD_DEVICE_cold_1();
  }
  return PF_IS_PAD_DEVICESymbolLoc();
}

id getPFPosterExtensionInstanceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPFPosterExtensionInstanceClass_softClass;
  uint64_t v7 = getPFPosterExtensionInstanceClass_softClass;
  if (!getPFPosterExtensionInstanceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPFPosterExtensionInstanceClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPFPosterExtensionInstanceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FC654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPFPosterExtensionInstanceClass_block_invoke(uint64_t a1)
{
  PosterFoundationLibrary();
  Class result = objc_getClass("PFPosterExtensionInstance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPFPosterExtensionInstanceClass_block_invoke_cold_1();
  }
  getPFPosterExtensionInstanceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterUIFoundationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PosterUIFoundationLibraryCore_frameworkLibrary_0;
  uint64_t v5 = PosterUIFoundationLibraryCore_frameworkLibrary_0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary_0)
  {
    long long v6 = xmmword_1E62B3DD0;
    long long v7 = *(_OWORD *)&off_1E62B3DE0;
    v3[3] = _sl_dlopen();
    PosterUIFoundationLibraryCore_frameworkLibrary_0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1BC4FC7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PosterUIFoundationLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PosterUIFoundationLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterUIFoundationLibrary_0()
{
  id v1 = 0;
  uint64_t result = PosterUIFoundationLibraryCore();
  if (!result) {
    PosterUIFoundationLibrary_cold_1_0(&v1);
  }
  return result;
}

id getPUIColorBoxesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIColorBoxesClass_softClass;
  uint64_t v7 = getPUIColorBoxesClass_softClass;
  if (!getPUIColorBoxesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIColorBoxesClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPUIColorBoxesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FC99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIColorBoxesClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary_0();
  Class result = objc_getClass("PUIColorBoxes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIColorBoxesClass_block_invoke_cold_1();
  }
  getPUIColorBoxesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIColorStatisticsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIColorStatisticsClass_softClass;
  uint64_t v7 = getPUIColorStatisticsClass_softClass;
  if (!getPUIColorStatisticsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIColorStatisticsClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPUIColorStatisticsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FCAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIColorStatisticsClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary_0();
  Class result = objc_getClass("PUIColorStatistics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIColorStatisticsClass_block_invoke_cold_1();
  }
  getPUIColorStatisticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIDiscreteGradientVariatedCustomStyleClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIDiscreteGradientVariatedCustomStyleClass_softClass;
  uint64_t v7 = getPUIDiscreteGradientVariatedCustomStyleClass_softClass;
  if (!getPUIDiscreteGradientVariatedCustomStyleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FCC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary_0();
  Class result = objc_getClass("PUIDiscreteGradientVariatedCustomStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke_cold_1();
  }
  getPUIDiscreteGradientVariatedCustomStyleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPUIImageEncoderClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary_0();
  Class result = objc_getClass("PUIImageEncoder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIImageEncoderClass_block_invoke_cold_1();
  }
  getPUIImageEncoderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIImageOnDiskFormatClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIImageOnDiskFormatClass_softClass_0;
  uint64_t v7 = getPUIImageOnDiskFormatClass_softClass_0;
  if (!getPUIImageOnDiskFormatClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIImageOnDiskFormatClass_block_invoke_0;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPUIImageOnDiskFormatClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FCDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIImageOnDiskFormatClass_block_invoke_0(uint64_t a1)
{
  PosterUIFoundationLibrary_0();
  Class result = objc_getClass("PUIImageOnDiskFormat");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIImageOnDiskFormatClass_block_invoke_cold_1_0();
  }
  getPUIImageOnDiskFormatClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIMappedImageCacheManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPUIMappedImageCacheManagerClass_softClass;
  uint64_t v7 = getPUIMappedImageCacheManagerClass_softClass;
  if (!getPUIMappedImageCacheManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPUIMappedImageCacheManagerClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPUIMappedImageCacheManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC4FCEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIMappedImageCacheManagerClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary_0();
  Class result = objc_getClass("PUIMappedImageCacheManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIMappedImageCacheManagerClass_block_invoke_cold_1();
  }
  getPUIMappedImageCacheManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getPUIImageEncoderErrorDomainSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIImageEncoderErrorDomainSymbolLoc_ptr_0;
  uint64_t v6 = getPUIImageEncoderErrorDomainSymbolLoc_ptr_0;
  if (!getPUIImageEncoderErrorDomainSymbolLoc_ptr_0)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIImageEncoderErrorDomain");
    getPUIImageEncoderErrorDomainSymbolLoc_ptr_0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FD02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIImageEncoderErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIImageEncoderErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIImageEncoderErrorDomainSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUIImageEncoderErrorDomain_0()
{
  PUIImageEncoderErrorDomainSymbolLoc = (void **)getPUIImageEncoderErrorDomainSymbolLoc();
  if (!PUIImageEncoderErrorDomainSymbolLoc) {
    getPUIImageEncoderErrorDomain_cold_1_0();
  }
  id v1 = *PUIImageEncoderErrorDomainSymbolLoc;
  return v1;
}

uint64_t getPUISceneRoleRenderingSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUISceneRoleRenderingSymbolLoc_ptr;
  uint64_t v6 = getPUISceneRoleRenderingSymbolLoc_ptr;
  if (!getPUISceneRoleRenderingSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUISceneRoleRendering");
    getPUISceneRoleRenderingSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FD1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUISceneRoleRenderingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUISceneRoleRendering");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUISceneRoleRenderingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getPUISceneRoleRendering()
{
  PUISceneRoleRenderingSymbolLoc = (void **)getPUISceneRoleRenderingSymbolLoc();
  if (!PUISceneRoleRenderingSymbolLoc) {
    getPUISceneRoleRendering_cold_1();
  }
  id v1 = *PUISceneRoleRenderingSymbolLoc;
  return v1;
}

void *__getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIPosterSignificantEventOptionsContainsEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIPosterSignificantEventOptionsContainsEventSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

uint64_t getPUIIOSurfaceFromCGImageSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0;
  uint64_t v6 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0;
  if (!getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIIOSurfaceFromCGImage");
    getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FD364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIIOSurfaceFromCGImageSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIIOSurfaceFromCGImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIIOSurfaceFromCGImageSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_PUIIOSurfaceFromCGImage_0(uint64_t a1, uint64_t a2)
{
  PUIIOSurfaceFromCGImageSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getPUIIOSurfaceFromCGImageSymbolLoc();
  if (!PUIIOSurfaceFromCGImageSymbolLoc) {
    soft_PUIIOSurfaceFromCGImage_cold_1_0();
  }
  return PUIIOSurfaceFromCGImageSymbolLoc(a1, a2);
}

uint64_t getPUIFeatureEnabledSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIFeatureEnabledSymbolLoc_ptr;
  uint64_t v6 = getPUIFeatureEnabledSymbolLoc_ptr;
  if (!getPUIFeatureEnabledSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIFeatureEnabled");
    getPUIFeatureEnabledSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FD4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIFeatureEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIFeatureEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIFeatureEnabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_PUIFeatureEnabled(uint64_t a1)
{
  PUIFeatureEnabledSymbolLoc = (uint64_t (*)(uint64_t))getPUIFeatureEnabledSymbolLoc();
  if (!PUIFeatureEnabledSymbolLoc) {
    soft_PUIFeatureEnabled_cold_1();
  }
  return PUIFeatureEnabledSymbolLoc(a1);
}

void *__getPUIDynamicRotationIsActiveSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIDynamicRotationIsActive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIDynamicRotationIsActiveSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getPUICalculateContrastFromColorBoxesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUICalculateContrastFromColorBoxesSymbolLoc_ptr;
  uint64_t v6 = getPUICalculateContrastFromColorBoxesSymbolLoc_ptr;
  if (!getPUICalculateContrastFromColorBoxesSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUICalculateContrastFromColorBoxes");
    getPUICalculateContrastFromColorBoxesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FD6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUICalculateContrastFromColorBoxesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUICalculateContrastFromColorBoxes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUICalculateContrastFromColorBoxesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double soft_PUICalculateContrastFromColorBoxes(void *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  id v13 = a1;
  PUICalculateContrastFromColorBoxesSymbolLoc = (double (*)(id, uint64_t, uint64_t, double, double, double, double))getPUICalculateContrastFromColorBoxesSymbolLoc();
  if (!PUICalculateContrastFromColorBoxesSymbolLoc) {
    soft_PUICalculateContrastFromColorBoxes_cold_1();
  }
  double v15 = PUICalculateContrastFromColorBoxesSymbolLoc(v13, a2, a3, a4, a5, a6, a7);

  return v15;
}

uint64_t getPUIIOSurfaceUpdatePurgableSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr;
  uint64_t v6 = getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr;
  if (!getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIIOSurfaceUpdatePurgable");
    getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FD894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIIOSurfaceUpdatePurgableSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIIOSurfaceUpdatePurgable");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIIOSurfaceUpdatePurgableSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_PUIIOSurfaceUpdatePurgable(uint64_t a1, uint64_t a2)
{
  PUIIOSurfaceUpdatePurgableSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getPUIIOSurfaceUpdatePurgableSymbolLoc();
  if (!PUIIOSurfaceUpdatePurgableSymbolLoc) {
    soft_PUIIOSurfaceUpdatePurgable_cold_1();
  }
  return PUIIOSurfaceUpdatePurgableSymbolLoc(a1, a2);
}

uint64_t getPUIAverageColorFromColorBoxesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIAverageColorFromColorBoxesSymbolLoc_ptr;
  uint64_t v6 = getPUIAverageColorFromColorBoxesSymbolLoc_ptr;
  if (!getPUIAverageColorFromColorBoxesSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIAverageColorFromColorBoxes");
    getPUIAverageColorFromColorBoxesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FDA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIAverageColorFromColorBoxesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIAverageColorFromColorBoxes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIAverageColorFromColorBoxesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id soft_PUIAverageColorFromColorBoxes(void *a1, double a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  PUIAverageColorFromColorBoxesSymbolLoc = (void (*)(id, double, double, double, double, double))getPUIAverageColorFromColorBoxesSymbolLoc();
  if (!PUIAverageColorFromColorBoxesSymbolLoc) {
    soft_PUIAverageColorFromColorBoxes_cold_1();
  }
  id v13 = PUIAverageColorFromColorBoxesSymbolLoc(v11, a2, a3, a4, a5, a6);

  return v13;
}

uint64_t getPUICreateIOSurfaceForImageSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUICreateIOSurfaceForImageSymbolLoc_ptr;
  uint64_t v6 = getPUICreateIOSurfaceForImageSymbolLoc_ptr;
  if (!getPUICreateIOSurfaceForImageSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUICreateIOSurfaceForImage");
    getPUICreateIOSurfaceForImageSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FDBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUICreateIOSurfaceForImageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUICreateIOSurfaceForImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUICreateIOSurfaceForImageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id soft_PUICreateIOSurfaceForImage(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  PUICreateIOSurfaceForImageSymbolLoc = (void (*)(id, uint64_t, uint64_t))getPUICreateIOSurfaceForImageSymbolLoc();
  if (!PUICreateIOSurfaceForImageSymbolLoc) {
    soft_PUICreateIOSurfaceForImage_cold_1();
  }
  uint64_t v7 = PUICreateIOSurfaceForImageSymbolLoc(v5, a2, a3);

  return v7;
}

uint64_t getPUIMaterialsIsLowQualityDeviceSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr;
  uint64_t v6 = getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr;
  if (!getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIMaterialsIsLowQualityDevice");
    getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FDDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIMaterialsIsLowQualityDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIMaterialsIsLowQualityDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIMaterialsIsLowQualityDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_PUIMaterialsIsLowQualityDevice()
{
  IsLowQualityDeviceSymbolLoc = (uint64_t (*)(void))getPUIMaterialsIsLowQualityDeviceSymbolLoc();
  if (!IsLowQualityDeviceSymbolLoc) {
    soft_PUIMaterialsIsLowQualityDevice_cold_1();
  }
  return IsLowQualityDeviceSymbolLoc();
}

uint64_t getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr;
  uint64_t v6 = getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr;
  if (!getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIHomeScreenLegibilityMaterialRecipeBundle");
    getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FDF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIHomeScreenLegibilityMaterialRecipeBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t soft_PUIHomeScreenLegibilityMaterialRecipeBundle()
{
  PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc = (uint64_t (*)(void))getPUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc();
  if (!PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc) {
    soft_PUIHomeScreenLegibilityMaterialRecipeBundle_cold_1();
  }
  return PUIHomeScreenLegibilityMaterialRecipeBundleSymbolLoc();
}

uint64_t getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr;
  uint64_t v6 = getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr;
  if (!getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting");
    getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FE090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                           + 24);
  return result;
}

uint64_t soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting()
{
  ShouldAdjustAlphaForWeightingSymbolLoc = (uint64_t (*)(void))getPUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeightingSymbolLoc();
  if (!ShouldAdjustAlphaForWeightingSymbolLoc) {
    soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting_cold_1();
  }
  return ShouldAdjustAlphaForWeightingSymbolLoc();
}

uint64_t getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr;
  uint64_t v6 = getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr;
  if (!getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr)
  {
    id v1 = (void *)PosterUIFoundationLibrary_0();
    v4[3] = (uint64_t)dlsym(v1, "PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment");
    getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BC4FE200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PosterUIFoundationLibrary_0();
  Class result = dlsym(v2, "PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

uint64_t soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment(double a1)
{
  PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc = (uint64_t (*)(__n128))getPUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc();
  if (!PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc) {
    soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment_cold_1();
  }
  v3.n128_f64[0] = a1;
  return PUIHomeScreenLegibilityMaterialRecipeScaleAdjustmentSymbolLoc(v3);
}

uint64_t PosterBoardUIServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  __n128 v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PosterBoardUIServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = PosterBoardUIServicesLibraryCore_frameworkLibrary;
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E62B3DF0;
    long long v7 = *(_OWORD *)&off_1E62B3E00;
    v3[3] = _sl_dlopen();
    PosterBoardUIServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1BC4FE3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PosterBoardUIServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PosterBoardUIServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterBoardUIServicesLibrary()
{
  id v1 = 0;
  uint64_t result = PosterBoardUIServicesLibraryCore();
  if (!result) {
    PosterBoardUIServicesLibrary_cold_1(&v1);
  }
  return result;
}

void __copy_assignment_8_8_t0w24_s24_s32(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  objc_storeStrong((id *)(a1 + 24), *((id *)a2 + 3));
  uint64_t v5 = (void *)*((void *)a2 + 4);
  objc_storeStrong((id *)(a1 + 32), v5);
}

void sub_1BC4FFBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1C1872570](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
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
    void v3[5] = v3;
    long long v4 = xmmword_1E62B3E80;
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

BOOL PBUIPosterPresentationModeRequiresPosterContent(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t _PRNeedsWallpaperCaptureView()
{
  if (_PRNeedsWallpaperCaptureView_onceToken != -1) {
    dispatch_once(&_PRNeedsWallpaperCaptureView_onceToken, &__block_literal_global_15);
  }
  return _PRNeedsWallpaperCaptureView_needsWallpaperCaptureView;
}

uint64_t _PRCollectionsPosterDescriptorNeedsSnapshotReplacement(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"7595"] & 1) != 0
    || ([v1 isEqualToString:@"7600"] & 1) != 0
    || ([v1 isEqualToString:@"7605"] & 1) != 0
    || ([v1 isEqualToString:@"7610"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"7615"];
  }

  return v2;
}

void sub_1BC500BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BC5015A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1BC5017C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BC50308C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC503168(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getMTMaterialViewClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MaterialKitLibraryCore_frameworkLibrary_2)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __MaterialKitLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E62B4050;
    uint64_t v5 = 0;
    MaterialKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!MaterialKitLibraryCore_frameworkLibrary_2) {
    __getMTMaterialViewClass_block_invoke_cold_1_0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("MTMaterialView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMTMaterialViewClass_block_invoke_cold_2_0();
  }
  getMTMaterialViewClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MaterialKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  MaterialKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

id PBUIMagicWallpaperDictionary(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a2;
  id v11 = a1;
  uint64_t v12 = [v9 dictionary];
  [v12 setObject:v11 forKey:@"kSBUIMagicWallpaperIdentifierKey"];

  id v13 = [v10 bundlePath];

  [v12 setObject:v13 forKey:@"kSBUIMagicWallpaperBundlePathKey"];
  if (v8)
  {
    [v12 setObject:v8 forKey:@"kSBUIMagicWallpaperPresetOptionsKey"];
    double v14 = [v8 objectForKey:@"thumbnailImageName"];
    double v15 = v14;
    if (v14)
    {
      id v16 = v14;

      id v7 = v16;
    }
  }
  if (v7) {
    [v12 setObject:v7 forKey:@"kSBUIMagicWallpaperThumbnailNameKey"];
  }

  return v12;
}

id PBUIMagicWallpaperDictionariesForClass(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = [MEMORY[0x1E4F1CA48] array];
  if (a1 && v3)
  {
    uint64_t v5 = [a1 identifier];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [a1 thumbnailImageName];
    }
    else
    {
      uint64_t v6 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([a1 presetWallpaperOptions], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = v7;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = PBUIMagicWallpaperDictionary(v5, v3, v6, *(void **)(*((void *)&v15 + 1) + 8 * i));
            [v4 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
    else
    {
      id v8 = PBUIMagicWallpaperDictionary(v5, v3, v6, 0);
      [v4 addObject:v8];
    }
  }
  return v4;
}

id PBUIMagicWallpaperOptionsDictionary(void *a1, void *a2)
{
  id v3 = a2;
  long long v4 = [a1 objectForKey:@"kSBUIMagicWallpaperPresetOptionsKey"];
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4)
    {
      uint64_t v6 = (void *)[v4 mutableCopy];
      [v6 addEntriesFromDictionary:v3];
      goto LABEL_7;
    }
    id v7 = v3;
  }
  else
  {
    id v7 = v4;
  }
  uint64_t v6 = v7;
LABEL_7:

  return v6;
}

id PBUIGetProceduralWallpaper(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = a1;
  id v13 = [v12 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];
  double v14 = objc_msgSend(objc_alloc((Class)PBUIMagicWallpaperClassForIdentifier(v13)), "initWithFrame:", a3, a4, a5, a6);
  long long v15 = PBUIMagicWallpaperOptionsDictionary(v12, v11);

  if (v15 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 setWallpaperOptions:v15];
  }

  return v14;
}

id PBUIMagicWallpaperClassForIdentifier(void *a1)
{
  uint64_t v1 = _PBUIMagicWallpaperEnsure___once;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_PBUIMagicWallpaperEnsure___once, &__block_literal_global_16);
  }
  id v3 = [(id)__identifierClassMap objectForKey:v2];

  return v3;
}

id PBUIMagicWallpaperThumbnail(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];
  id v3 = PBUIMagicWallpaperClassForIdentifier(v2);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 thumbnailImageForOptions:v1], (long long v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [v1 objectForKey:@"kSBUIMagicWallpaperPresetOptionsKey"];
    id v7 = [v1 objectForKey:@"kSBUIMagicWallpaperBundlePathKey"];
    id v8 = [MEMORY[0x1E4F28B50] bundleWithPath:v7];
    uint64_t v9 = [v6 objectForKey:@"kSBUIMagicWallpaperThumbnailNameKey"];
    uint64_t v10 = (void *)v9;
    id v11 = 0;
    if (v8 && v9)
    {
      id v11 = [MEMORY[0x1E4F42A80] _deviceSpecificImageNamed:v9 inBundle:v8];
    }
    uint64_t v12 = [v6 objectForKey:@"largeThumbJPEGPath"];
    id v13 = (void *)v12;
    if (!v11 && v12)
    {
      double v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v15 = [v14 fileExistsAtPath:v13];

      if (v15)
      {
        id v11 = [MEMORY[0x1E4F42A80] imageWithContentsOfFile:v13];
      }
      else
      {
        id v11 = 0;
      }
    }
    id v5 = v11;
  }
  return v5;
}

id PBUIMagicWallpaperRepresentativeThumbnailForClass(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];
  id v3 = PBUIMagicWallpaperClassForIdentifier(v2);
  long long v4 = [v1 objectForKey:@"kSBUIMagicWallpaperBundlePathKey"];

  id v5 = [MEMORY[0x1E4F28B50] bundleWithPath:v4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v3 representativeThumbnailImageName];
    id v7 = (void *)v6;
    id v8 = 0;
    if (v5 && v6)
    {
      id v8 = [MEMORY[0x1E4F42A80] _deviceSpecificImageNamed:v6 inBundle:v5];
    }
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }

  return v8;
}

void _PBUIMagicWallpaperEnsure()
{
  if (_PBUIMagicWallpaperEnsure___once != -1) {
    dispatch_once(&_PBUIMagicWallpaperEnsure___once, &__block_literal_global_16);
  }
}

id PBUIMagicWallpaperEnumeration()
{
  if (_PBUIMagicWallpaperEnsure___once != -1) {
    dispatch_once(&_PBUIMagicWallpaperEnsure___once, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)__wallpaperEnumeration;
  return v0;
}

id BundlePathForWallpaperIdentifier(void *a1)
{
  id v1 = PBUIMagicWallpaperClassForIdentifier(a1);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28B50] bundleForClass:v1];
    id v3 = [v2 bundlePath];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void sub_1BC506950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1BC507534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC50B984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Block_object_dispose((const void *)(v41 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1BC50C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PBUIStringForWallpaperMode(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E62B42C8[a1];
  }
}

uint64_t PBUIWallpaperModeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"light"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"dark"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"inactive"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1BC510EF0(_Unwind_Exception *a1)
{
  __destructor_8_s24_s32(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s24_s32(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

id __copy_helper_block_e8_40n17_8_8_t0w24_s24_s32(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  *(void *)(a1 + 64) = *(id *)(a2 + 64);
  id result = *(id *)(a2 + 72);
  *(void *)(a1 + 72) = result;
  return result;
}

void __destroy_helper_block_e8_40n9_8_s24_s32(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
}

void sub_1BC5112EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  __destructor_8_s24_s32(v25);
  _Unwind_Resume(a1);
}

void sub_1BC511784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BC5118C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BC511C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1BC511DC8(_Unwind_Exception *a1)
{
  __destructor_8_s24_s32(v1);
  _Unwind_Resume(a1);
}

void sub_1BC511ED4(_Unwind_Exception *a1)
{
  __destructor_8_s24_s32(v1);
  _Unwind_Resume(a1);
}

void sub_1BC514DC0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

__CFString *PBUIWallpaperWindowSceneSettingKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 727229969) > 0x10) {
    return 0;
  }
  else {
    return off_1E62B4360[a1 - 727229969];
  }
}

id PBUIWallpaperWindowSceneSettingValueDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = v3;
  if (a1 == 727229970)
  {
    [v3 CGRectValue];
    uint64_t v5 = NSStringFromCGRect(v9);
    goto LABEL_5;
  }
  if (a1 == 727229969)
  {
    uint64_t v5 = PBUIStringForWallpaperVariant([v3 integerValue]);
LABEL_5:
    uint64_t v6 = (void *)v5;
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

uint64_t PBUIWallpaperVariantForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"home"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"lock"] - 1;
  }

  return v2;
}

void sub_1BC51D6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BC51D890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC51E070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC51F6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC520A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __PBUIColorSamplingQueue_block_invoke()
{
  uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
  uint64_t v1 = PBUIColorSamplingQueue_queue;
  PBUIColorSamplingQueue_queue = SerialWithQoS;
  return MEMORY[0x1F41817F8](SerialWithQoS, v1);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1BC521AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BC5225B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1BC523048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPRUISSnapshotServiceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRUISSnapshotServiceClass_softClass;
  uint64_t v7 = getPRUISSnapshotServiceClass_softClass;
  if (!getPRUISSnapshotServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRUISSnapshotServiceClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRUISSnapshotServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC52313C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPRUISAnalysisServiceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRUISAnalysisServiceClass_softClass;
  uint64_t v7 = getPRUISAnalysisServiceClass_softClass;
  if (!getPRUISAnalysisServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRUISAnalysisServiceClass_block_invoke;
    v3[3] = &unk_1E62B2890;
    v3[4] = &v4;
    __getPRUISAnalysisServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BC523220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRUISSnapshotServiceClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary_0();
  Class result = objc_getClass("PRUISSnapshotService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISSnapshotServiceClass_block_invoke_cold_1();
  }
  getPRUISSnapshotServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PosterBoardUIServicesLibrary_0()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __PosterBoardUIServicesLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E62B4720;
    uint64_t v2 = 0;
    PosterBoardUIServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary_0) {
    PosterBoardUIServicesLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __PosterBoardUIServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PosterBoardUIServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPRUISAnalysisServiceClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary_0();
  Class result = objc_getClass("PRUISAnalysisService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISAnalysisServiceClass_block_invoke_cold_1();
  }
  getPRUISAnalysisServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

int64x2_t PBUIWallpaperBackdropParametersMakeIdentity@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1 = *MEMORY[0x1E4F43F90];
  *(void *)a1 = -2;
  *(void *)(a1 + 8) = v1;
  *(void *)(a1 + 16) = 0;
  int64x2_t result = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(a1 + 24) = result;
  *(int64x2_t *)(a1 + 40) = result;
  *(void *)(a1 + 56) = 0;
  return result;
}

id PBUIBackdropInputSettingsForWallpaperBackdropParameters(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:*(void *)a1 graphicsQuality:100];
    [v1 setStackingLevel:*(void *)(a1 + 8)];
    [v1 setRenderingHint:*(void *)(a1 + 16)];
    if (*(double *)(a1 + 24) != 1.79769313e308) {
      objc_msgSend(v1, "setBlurRadius:");
    }
    if (*(double *)(a1 + 32) != 1.79769313e308) {
      objc_msgSend(v1, "setSaturationDeltaFactor:");
    }
    if (*(double *)(a1 + 40) != 1.79769313e308) {
      objc_msgSend(v1, "setGrayscaleTintLevel:");
    }
    if (*(double *)(a1 + 48) != 1.79769313e308) {
      objc_msgSend(v1, "setGrayscaleTintAlpha:");
    }
  }
  return v1;
}

id PBUIBackdropOutputSettingsForWallpaperBackdropParameters(long long *a1)
{
  long long v2 = a1[1];
  long long v9 = *a1;
  long long v10 = v2;
  long long v3 = a1[3];
  long long v11 = a1[2];
  long long v12 = v3;
  uint64_t v4 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v9);
  long long v5 = a1[1];
  long long v9 = *a1;
  long long v10 = v5;
  long long v6 = a1[3];
  long long v11 = a1[2];
  long long v12 = v6;
  uint64_t v7 = PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v9);
  [v7 computeOutputSettingsUsingModel:v4];

  return v7;
}

__CFString *PBUIStringForWallpaperMaterialStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"nil";
  }
  else {
    return off_1E62B4790[a1 - 1];
  }
}

id PBUIStringForWallpaperBackdropParameters(double *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v3 = objc_msgSend(NSString, "stringWithFormat:", @"backdrop style: %li", *(void *)a1);
  [v2 addObject:v3];

  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"stacking level: %li", *((void *)a1 + 1));
  [v2 addObject:v4];

  long long v5 = objc_msgSend(NSString, "stringWithFormat:", @"rendering hint: %li", *((void *)a1 + 2));
  [v2 addObject:v5];

  if (a1[3] != 1.79769313e308)
  {
    long long v6 = objc_msgSend(NSString, "stringWithFormat:", @"blur radius: %f", *((void *)a1 + 3));
    [v2 addObject:v6];
  }
  if (a1[4] != 1.79769313e308)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"saturation delta factor: %f", *((void *)a1 + 4));
    [v2 addObject:v7];
  }
  if (a1[5] != 1.79769313e308)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"grayscale tint level: %f", *((void *)a1 + 5));
    [v2 addObject:v8];
  }
  if (a1[6] != 1.79769313e308)
  {
    long long v9 = objc_msgSend(NSString, "stringWithFormat:", @"grayscale tint alpha: %f", *((void *)a1 + 6));
    [v2 addObject:v9];
  }
  unint64_t v10 = *((void *)a1 + 7) - 1;
  if (v10 <= 2) {
    [v2 addObject:off_1E62B47A8[v10]];
  }
  long long v11 = [v2 componentsJoinedByString:@", "];

  return v11;
}

id PBUIWallpaperTreatmentBundle()
{
  if (PBUIWallpaperTreatmentBundle___onceToken != -1) {
    dispatch_once(&PBUIWallpaperTreatmentBundle___onceToken, &__block_literal_global_21);
  }
  uint64_t v0 = (void *)PBUIWallpaperTreatmentBundle___paperBoardUIBundle;
  return v0;
}

void __PBUIWallpaperTreatmentBundle_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleForClass:v3];
  id v2 = (void *)PBUIWallpaperTreatmentBundle___paperBoardUIBundle;
  PBUIWallpaperTreatmentBundle___paperBoardUIBundle = v1;
}

BOOL _PBUIPosterViewControllerUpdateReasonsNecessitateFencedUpdate(char a1)
{
  return (a1 & 0x61) != 0;
}

void sub_1BC525090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t PBUICurrentDeviceWallpaperSizeType()
{
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v0 userInterfaceIdiom] == 1)
  {
    uint64_t v1 = [MEMORY[0x1E4F42D90] mainScreen];
    [v1 _referenceBounds];
    double Height = CGRectGetHeight(v12);

    if (Height > 1194.0) {
      return 4;
    }
  }
  else
  {
  }
  uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1) {
    return 3;
  }
  long long v6 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v6 userInterfaceIdiom])
  {
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 _referenceBounds];
    double v8 = CGRectGetHeight(v13);

    if (v8 > 667.0) {
      return 2;
    }
  }
  long long v9 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v9 userInterfaceIdiom])
  {

    return 0;
  }
  else
  {
    unint64_t v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 _referenceBounds];
    BOOL v3 = CGRectGetHeight(v14) > 568.0;
  }
  return v3;
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL _WallpaperStyleHasDarkBlur(uint64_t a1)
{
  return _WallpaperStyleByRemovingTintFromStyle(a1) == 8;
}

uint64_t _WallpaperStyleByRemovingTintFromStyle(uint64_t result)
{
  uint64_t v1 = result - 9;
  if (unint64_t)(result - 9) <= 0x12 && ((0x6DF4Fu >> v1)) {
    return qword_1BC53F548[v1];
  }
  return result;
}

id PBUIStringForStyleTransitionState(unint64_t *a1)
{
  id v2 = NSString;
  BOOL v3 = PBUIWallpaperStyleDescription(*a1);
  uint64_t v4 = PBUIWallpaperStyleDescription(a1[1]);
  uint64_t v5 = [v2 stringWithFormat:@"%@ -> %@ (%.02f)", v3, v4, a1[2]];

  return v5;
}

__CFString *PBUIWallpaperWindowSceneClientSettingKeyDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1207217227) > 0x11) {
    return 0;
  }
  else {
    return off_1E62B4DB8[a1 - 1207217227];
  }
}

id PBUIWallpaperWindowSceneClientSettingValueDescription(uint64_t a1, void *a2)
{
  if (a1 == 1207217244)
  {
    uint64_t v4 = PBUIIrisWallpaperPlaybackStateDescription(objc_msgSend(a2, "integerValue", v2));
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

void sub_1BC52DF18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BC52E274(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __getISAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getISAssetClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUILivePhotoPlayerView.m", 17, @"Unable to find class %s", "ISAsset");

  __break(1u);
}

void PhotosPlayerLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotosPlayerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUILivePhotoPlayerView.m", 16, @"%s", *a1);

  __break(1u);
}

void __getISPlayerItemClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getISPlayerItemClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUILivePhotoPlayerView.m", 22, @"Unable to find class %s", "ISPlayerItem");

  __break(1u);
}

void __getISLiveWallpaperPlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getISLiveWallpaperPlayerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUILivePhotoPlayerView.m", 20, @"Unable to find class %s", "ISLiveWallpaperPlayer");

  __break(1u);
}

void __getISLivePhotoPlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getISLivePhotoPlayerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUILivePhotoPlayerView.m", 18, @"Unable to find class %s", "ISLivePhotoPlayer");

  __break(1u);
}

void __getISLiveWallpaperUIViewClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getISLiveWallpaperUIViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUILivePhotoPlayerView.m", 21, @"Unable to find class %s", "ISLiveWallpaperUIView");

  __break(1u);
}

void __getISLivePhotoUIViewClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getISLivePhotoUIViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUILivePhotoPlayerView.m", 19, @"Unable to find class %s", "ISLivePhotoUIView");

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MaterialKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIPosterEffectView.m", 19, @"%s", *a1);

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMTMaterialViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterEffectView.m", 20, @"Unable to find class %s", "MTMaterialView");

  __break(1u);
}

void __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotoImagingLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIWallpaperInactiveTreatment.m", 17, @"%s", *a1);

  __break(1u);
}

void __getPIParallaxLegacyPosterStyleClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPIParallaxLegacyPosterStyleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIWallpaperInactiveTreatment.m", 18, @"Unable to find class %s", "PIParallaxLegacyPosterStyle");

  __break(1u);
}

void PBUIExtensionIdentifierForPosterWallpaperMigrationProvider_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"NSString * _Nonnull PBUIExtensionIdentifierForPosterWallpaperMigrationProvider(PBUIPosterWallpaperMigrationProvider)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  long long v6 = @"PBUIPosterWallpaperMigrationInfo.m";
  __int16 v7 = 1024;
  int v8 = 43;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

void soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(MTMaterialRecipe, UIUserInterfaceStyle)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIWallpaperEffectCompositor.m", 27, @"%s", dlerror());

  __break(1u);
}

void soft_PUIIOSurfaceFromCGImage_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurface *soft_PUIIOSurfaceFromCGImage(CGImageRef, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICodableImage.m", 39, @"%s", dlerror());

  __break(1u);
}

void getPUIImageEncoderErrorDomain_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getPUIImageEncoderErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICodableImage.m", 38, @"%s", dlerror());

  __break(1u);
}

void PosterUIFoundationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterUIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUICodableImage.m", 36, @"%s", *a1);

  __break(1u);
}

void __getPUIImageOnDiskFormatClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIImageOnDiskFormatClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICodableImage.m", 37, @"Unable to find class %s", "PUIImageOnDiskFormat");

  __break(1u);
}

void soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(MTMaterialRecipe, UIUserInterfaceStyle)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIWallpaperView.m", 46, @"%s", dlerror());

  __break(1u);
}

void PosterBoardServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIPosterBridge.m", 11, @"%s", *a1);

  __break(1u);
}

void __getPRSWallpaperObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSWallpaperObserverClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 12, @"Unable to find class %s", "PRSWallpaperObserver");

  __break(1u);
}

void __getPRSWallpaperObserverConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSWallpaperObserverConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 13, @"Unable to find class %s", "PRSWallpaperObserverConfiguration");

  __break(1u);
}

void __getPRSWallpaperLocationStateObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSWallpaperLocationStateObserverClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 14, @"Unable to find class %s", "PRSWallpaperLocationStateObserver");

  __break(1u);
}

void __getPRSPosterUpdaterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSPosterUpdaterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 15, @"Unable to find class %s", "PRSPosterUpdater");

  __break(1u);
}

void __getPRSPosterUpdateClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSPosterUpdateClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 16, @"Unable to find class %s", "PRSPosterUpdate");

  __break(1u);
}

void __getPRSServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 17, @"Unable to find class %s", "PRSService");

  __break(1u);
}

void __getPRSPosterConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRSPosterConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 18, @"Unable to find class %s", "PRSPosterConfiguration");

  __break(1u);
}

void PosterFoundationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIPosterBridge.m", 20, @"%s", *a1);

  __break(1u);
}

void soft_PFFileProtectionNoneAttributes_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSDictionary *soft_PFFileProtectionNoneAttributes(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 21, @"%s", dlerror());

  __break(1u);
}

void soft_PF_IS_PAD_DEVICE_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_PF_IS_PAD_DEVICE(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 22, @"%s", dlerror());

  __break(1u);
}

void __getPFPosterExtensionInstanceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPFPosterExtensionInstanceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 23, @"Unable to find class %s", "PFPosterExtensionInstance");

  __break(1u);
}

void PosterUIFoundationLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterUIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIPosterBridge.m", 25, @"%s", *a1);

  __break(1u);
}

void __getPUIColorBoxesClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIColorBoxesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 26, @"Unable to find class %s", "PUIColorBoxes");

  __break(1u);
}

void __getPUIColorStatisticsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIColorStatisticsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 27, @"Unable to find class %s", "PUIColorStatistics");

  __break(1u);
}

void __getPUIDiscreteGradientVariatedCustomStyleClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIDiscreteGradientVariatedCustomStyleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 28, @"Unable to find class %s", "PUIDiscreteGradientVariatedCustomStyle");

  __break(1u);
}

void __getPUIImageEncoderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIImageEncoderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 29, @"Unable to find class %s", "PUIImageEncoder");

  __break(1u);
}

void __getPUIImageOnDiskFormatClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIImageOnDiskFormatClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 30, @"Unable to find class %s", "PUIImageOnDiskFormat");

  __break(1u);
}

void __getPUIMappedImageCacheManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIMappedImageCacheManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 31, @"Unable to find class %s", "PUIMappedImageCacheManager");

  __break(1u);
}

void getPUIImageEncoderErrorDomain_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (PUIImageEncoderErrorDomain) (*)(void))0)()) getPUIImageEncoderErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 32, @"%s", dlerror());

  __break(1u);
}

void getPUISceneRoleRendering_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (PUISceneRoleRendering) (*)(void))0)()) getPUISceneRoleRendering(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 33, @"%s", dlerror());

  __break(1u);
}

void soft_PUIPosterSignificantEventOptionsContainsEvent_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL soft_PUIPosterSignificantEventOptionsContainsEvent(PUIPosterSignificantEventOptions, PUIPosterSignificantEvent)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 34, @"%s", dlerror());

  __break(1u);
}

void soft_PUIIOSurfaceFromCGImage_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurface *soft_PUIIOSurfaceFromCGImage(CGImageRef, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 35, @"%s", dlerror());

  __break(1u);
}

void soft_PUIFeatureEnabled_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_PUIFeatureEnabled(PUIFeature)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 36, @"%s", dlerror());

  __break(1u);
}

void soft_PUIDynamicRotationIsActive_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_PUIDynamicRotationIsActive(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 37, @"%s", dlerror());

  __break(1u);
}

void soft_PUICalculateContrastFromColorBoxes_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat soft_PUICalculateContrastFromColorBoxes(PUIColorBoxes *__strong, CGRect, CGFloat *, CGFloat *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 38, @"%s", dlerror());

  __break(1u);
}

void soft_PUIIOSurfaceUpdatePurgable_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurfaceRef soft_PUIIOSurfaceUpdatePurgable(IOSurfaceRef, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 39, @"%s", dlerror());

  __break(1u);
}

void soft_PUIAverageColorFromColorBoxes_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "UIColor *soft_PUIAverageColorFromColorBoxes(PUIColorBoxes *__strong, CGRect, CGFloat)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 40, @"%s", dlerror());

  __break(1u);
}

void soft_PUICreateIOSurfaceForImage_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurface *soft_PUICreateIOSurfaceForImage(UIImage *__strong, CGImageBlockSetRef *, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 41, @"%s", dlerror());

  __break(1u);
}

void soft_PUIMaterialsIsLowQualityDevice_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_PUIMaterialsIsLowQualityDevice(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 42, @"%s", dlerror());

  __break(1u);
}

void soft_PUIHomeScreenLegibilityMaterialRecipeBundle_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSBundle *soft_PUIHomeScreenLegibilityMaterialRecipeBundle(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 43, @"%s", dlerror());

  __break(1u);
}

void soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_PUIHomeScreenLegibilityMaterialShouldAdjustAlphaForWeighting(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 44, @"%s", dlerror());

  __break(1u);
}

void soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CGFloat soft_PUIHomeScreenLegibilityMaterialRecipeScaleAdjustment(CGFloat)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterBridge.m", 45, @"%s", dlerror());

  __break(1u);
}

void PosterBoardUIServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterBoardUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIPosterBridge.m", 47, @"%s", *a1);

  __break(1u);
}

void __getMTMaterialLayerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *CoreMaterialLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIMaterialTreatment.m", 18, @"%s", *a1);

  __break(1u);
}

void __getMTMaterialLayerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMTMaterialLayerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIMaterialTreatment.m", 19, @"Unable to find class %s", "MTMaterialLayer");

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *MaterialKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUIPosterHomeViewController.m", 37, @"%s", *a1);

  __break(1u);
}

void __getMTMaterialViewClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMTMaterialViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUIPosterHomeViewController.m", 38, @"Unable to find class %s", "MTMaterialView");

  __break(1u);
}

void __getPRUISSnapshotServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISSnapshotServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICARemoteRenderer.m", 30, @"Unable to find class %s", "PRUISSnapshotService");

  __break(1u);
}

void PosterBoardUIServicesLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterBoardUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUICARemoteRenderer.m", 29, @"%s", *a1);

  __break(1u);
}

void __getPRUISAnalysisServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISAnalysisServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICARemoteRenderer.m", 31, @"Unable to find class %s", "PRUISAnalysisService");

  __break(1u);
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

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1F410C2D8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1F410C358]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1F410C538]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C588]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1F410C5E8]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t BSSizeGreaterThanOrEqualToSize()
{
  return MEMORY[0x1F410C620]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSStringFromCGRect()
{
  return MEMORY[0x1F410C660]();
}

uint64_t BSStringFromCGSize()
{
  return MEMORY[0x1F410C668]();
}

uint64_t BSSystemSharedResourcesDirectoryForIdentifier()
{
  return MEMORY[0x1F410C688]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CAMLEncodeLayerTreeToPathWithOptions()
{
  return MEMORY[0x1F40F4C00]();
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
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

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x1F40D7B50](fileSec, mode);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

void CGColorRelease(CGColorRef color)
{
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
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

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

uint64_t CGImageBlockSetRetain()
{
  return MEMORY[0x1F40DA858]();
}

uint64_t CGImageCopyJPEGData()
{
  return MEMORY[0x1F40E9690]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1F40E9698]();
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

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

uint64_t CGImageGetHash()
{
  return MEMORY[0x1F40E9778]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1F40DA950]();
}

uint64_t CGImageGetImageSource()
{
  return MEMORY[0x1F40E9780]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E9A00](isrc);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x1F4102AD8](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

uint64_t CPBitmapCreateImagesFromData()
{
  return MEMORY[0x1F4109250]();
}

uint64_t CPBitmapCreateMappedDataFromPath()
{
  return MEMORY[0x1F4109260]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t IOMobileFramebufferGetCanvasSizes()
{
  return MEMORY[0x1F4124A38]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x1F4124AE0]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1F4102AE8](transform);
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

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4102C98]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4102D60]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4102D70]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1F4102E38]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIImageGetCGImageRepresentation()
{
  return MEMORY[0x1F4102F00]();
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

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEA70](xarray, index);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}