uint64_t PREditingSupportsLiveBlurs()
{
  if (PREditingSupportsLiveBlurs_onceToken != -1) {
    dispatch_once(&PREditingSupportsLiveBlurs_onceToken, &__block_literal_global);
  }
  return PREditingSupportsLiveBlurs_supportsLiveBlurs;
}

void __PREditingSupportsLiveBlurs_block_invoke()
{
  id v1 = (id)MGGetStringAnswer();
  if ([v1 isEqualToString:@"t8010"]) {
    char v0 = 0;
  }
  else {
    char v0 = [v1 isEqualToString:@"t8011"] ^ 1;
  }
  PREditingSupportsLiveBlurs_supportsLiveBlurs = v0;
}

uint64_t NSStringFromPRRenderingMode()
{
  return MEMORY[0x1F4145CF8]();
}

uint64_t NSStringFromPRRenderingContent()
{
  return MEMORY[0x1F4145CF0]();
}

uint64_t NSStringFromPRPosterPreviewContent()
{
  return MEMORY[0x1F4145CE0]();
}

id PRBundleURLFromReturnAddress()
{
  char v0 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:dyld_image_path_containing_address() isDirectory:0 relativeToURL:0];
  id v1 = [v0 URLByDeletingLastPathComponent];

  return v1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

uint64_t PRCSLayoutVariantFromPRLayoutVariant(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

uint64_t PRCSElementTypeFromPRElementType(unint64_t a1)
{
  return a1 & 0x1F | (((a1 >> 5) & 3) << 6);
}

void sub_18C1CE3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C1CE728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXFaceGalleryItemEqualObjects(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  v5 = (void *)v4;
  if (!(v3 | v4))
  {
LABEL_2:
    uint64_t v6 = 1;
    goto LABEL_29;
  }
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    v7 = [(id)v3 descriptorIdentifier];
    v8 = [v5 descriptorIdentifier];
    int v9 = BSEqualObjects();

    if (!v9) {
      goto LABEL_28;
    }
    v10 = [(id)v3 extensionBundleIdentifier];
    v11 = [v5 extensionBundleIdentifier];
    int v12 = BSEqualObjects();

    if (!v12) {
      goto LABEL_28;
    }
    v13 = [(id)v3 displayNameLocalizationKey];
    v14 = [v5 displayNameLocalizationKey];
    int v15 = BSEqualObjects();

    if (!v15) {
      goto LABEL_28;
    }
    v16 = [(id)v3 spokenNameLocalizationKey];
    v17 = [v5 spokenNameLocalizationKey];
    int v18 = BSEqualObjects();

    if (!v18) {
      goto LABEL_28;
    }
    v19 = [(id)v3 descriptiveTextLocalizationKey];
    v20 = [v5 descriptiveTextLocalizationKey];
    int v21 = BSEqualObjects();

    if (!v21) {
      goto LABEL_28;
    }
    v22 = [(id)v3 localizedDisplayName];
    v23 = [v5 localizedDisplayName];
    int v24 = BSEqualObjects();

    if (!v24) {
      goto LABEL_28;
    }
    v25 = [(id)v3 localizedSubtitle];
    v26 = [v5 localizedSubtitle];
    int v27 = BSEqualObjects();

    if (!v27) {
      goto LABEL_28;
    }
    v28 = [(id)v3 titleFontName];
    v29 = [v5 titleFontName];
    int v30 = BSEqualObjects();

    if (!v30) {
      goto LABEL_28;
    }
    v31 = [(id)v3 titleColor];
    v32 = [v5 titleColor];
    int v33 = BSEqualObjects();

    if (!v33) {
      goto LABEL_28;
    }
    v34 = [(id)v3 subtitleComplication];
    v35 = [v5 subtitleComplication];
    int v36 = BSEqualObjects();

    if (!v36) {
      goto LABEL_28;
    }
    v37 = [(id)v3 modeSemanticType];
    v38 = [v5 modeSemanticType];
    int v39 = BSEqualObjects();

    if (!v39) {
      goto LABEL_28;
    }
    v40 = [(id)v3 modeUUID];
    v41 = [v5 modeUUID];
    int v42 = BSEqualObjects();

    if (!v42) {
      goto LABEL_28;
    }
    int v43 = [(id)v3 isBlankTemplate];
    if (v43 != [v5 isBlankTemplate]) {
      goto LABEL_28;
    }
    int v44 = [(id)v3 shouldShowAsShuffleStack];
    if (v44 != [v5 shouldShowAsShuffleStack]) {
      goto LABEL_28;
    }
    uint64_t v45 = [(id)v3 source];
    if (v45 != [v5 source]) {
      goto LABEL_28;
    }
    uint64_t v46 = [(id)v3 layoutType];
    if (v46 != [v5 layoutType]) {
      goto LABEL_28;
    }
    v47 = [(id)v3 complications];
    uint64_t v48 = [v47 count];
    v49 = [v5 complications];
    uint64_t v50 = [v49 count];

    if (v48 != v50)
    {
LABEL_28:
      uint64_t v6 = 0;
      goto LABEL_29;
    }
    v51 = [(id)v3 complications];
    uint64_t v52 = [v51 count];

    if (!v52) {
      goto LABEL_2;
    }
    uint64_t v53 = 0;
    uint64_t v54 = v52 - 1;
    do
    {
      v55 = [(id)v3 complications];
      v56 = [v55 objectAtIndex:v53];

      v57 = [v5 complications];
      v58 = [v57 objectAtIndex:v53];

      uint64_t v6 = ATXComplicationEqualObjects((uint64_t)v56, v58);
      if (!v6) {
        break;
      }
    }
    while (v54 != v53++);
  }
LABEL_29:

  return v6;
}

uint64_t ATXComplicationEqualObjects(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = CHSWidgetFromATXComplication();
  unint64_t v4 = CHSWidgetFromATXComplication();

  uint64_t v5 = [v3 matchesPersonality:v4];
  return v5;
}

void PREnumerateInterfaceOrientationsForMask(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  if (v3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      switch(i)
      {
        case 3:
          uint64_t v6 = a1 & 8;
          a1 &= ~8uLL;
          if (v6) {
            goto LABEL_11;
          }
          break;
        case 2:
          uint64_t v7 = a1 & 4;
          a1 &= ~4uLL;
          if (v7) {
            goto LABEL_11;
          }
          break;
        case 1:
          uint64_t v5 = a1 & 2;
          a1 &= ~2uLL;
          if (v5)
          {
LABEL_11:
            char v8 = 0;
            v3[2](v3, i, &v8);
            if (v8) {
              goto LABEL_13;
            }
          }
          break;
      }
    }
  }
LABEL_13:
}

uint64_t PRLockPickIsActive()
{
  if (PRLockPickIsActive_onceToken != -1) {
    dispatch_once(&PRLockPickIsActive_onceToken, &__block_literal_global_1);
  }
  return PRLockPickIsActive_lockPickIsActive;
}

void __PRLockPickIsActive_block_invoke()
{
  uint64_t v0 = PFCurrentDeviceClass();
  char v1 = _os_feature_enabled_impl();
  id v2 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  uint64_t v3 = [v2 homeButtonType];

  if (v0 != 1 && v3 == 2) {
    char v5 = v1;
  }
  else {
    char v5 = 0;
  }
  PRLockPickIsActive_lockPickIsActive = v5;
}

uint64_t PRIsLowQualityDevice()
{
  if (PRIsLowQualityDevice_onceToken != -1) {
    dispatch_once(&PRIsLowQualityDevice_onceToken, &__block_literal_global_4);
  }
  return PRIsLowQualityDevice_isLowQualityDevice;
}

void __PRIsLowQualityDevice_block_invoke()
{
  id v1 = (id)MGGetStringAnswer();
  if ([v1 isEqualToString:@"t8010"]) {
    char v0 = 1;
  }
  else {
    char v0 = [v1 isEqualToString:@"t8011"];
  }
  PRIsLowQualityDevice_isLowQualityDevice = v0;
}

uint64_t PRIsDepthEffectDisallowed(int a1, int a2, unsigned int a3)
{
  return a1 & a2 | a3;
}

uint64_t PRGetMaximumMemoryUsageForCurrentProcess()
{
  int v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v3 = 0u;
  mach_msg_type_number_t task_info_outCnt = 93;
  if (task_info(*MEMORY[0x1E4F14960], 0x16u, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  else {
    return v11 + v23;
  }
}

uint64_t PRGetMemoryUsageForCurrentProcess()
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  memset(v2, 0, sizeof(v2));
  pid_t v0 = getpid();
  if (proc_pid_rusage(v0, 6, (rusage_info_t *)v2) < 0) {
    return 0;
  }
  else {
    return *((void *)&v3 + 1);
  }
}

void sub_18C1D1020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
}

void sub_18C1D21BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
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

void sub_18C1D2DAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_18C1D4EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

uint64_t PRPosterContentsBackgroundTypeForLuminance(double a1)
{
  if (a1 < 0.0 || a1 > 1.0) {
    return 0;
  }
  if (a1 > 0.9) {
    return 2;
  }
  if (a1 >= 0.1) {
    return 1;
  }
  return 3;
}

uint64_t BSUIVibrancyBackgroundTypeForPRPosterContentsBackgroundType(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  else {
    return a1 == 2;
  }
}

id PRSharedWidgetDescriptorProvider()
{
  if (PRSharedWidgetDescriptorProvider___once != -1) {
    dispatch_once(&PRSharedWidgetDescriptorProvider___once, &__block_literal_global_3);
  }
  pid_t v0 = (void *)PRSharedWidgetDescriptorProvider___instance;
  return v0;
}

uint64_t __PRSharedWidgetDescriptorProvider_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F58E00]);
  uint64_t v1 = PRSharedWidgetDescriptorProvider___instance;
  PRSharedWidgetDescriptorProvider___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRSharedWidgetExtensionProvider()
{
  if (PRSharedWidgetExtensionProvider___once != -1) {
    dispatch_once(&PRSharedWidgetExtensionProvider___once, &__block_literal_global_2);
  }
  id v0 = (void *)PRSharedWidgetExtensionProvider___instance;
  return v0;
}

uint64_t __PRSharedWidgetExtensionProvider_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F58E40]);
  uint64_t v1 = PRSharedWidgetExtensionProvider___instance;
  PRSharedWidgetExtensionProvider___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRComplicationsSceneWorkspace()
{
  if (PRComplicationsSceneWorkspace_onceToken != -1) {
    dispatch_once(&PRComplicationsSceneWorkspace_onceToken, &__block_literal_global_5);
  }
  id v0 = (void *)PRComplicationsSceneWorkspace_workspace;
  return v0;
}

uint64_t __PRComplicationsSceneWorkspace_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F624B0]) initWithIdentifier:@"PRComplicationsSceneWorkspace"];
  uint64_t v1 = PRComplicationsSceneWorkspace_workspace;
  PRComplicationsSceneWorkspace_workspace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_18C1D9DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, id *a13, id *a14)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v14 - 168));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_18C1DB4C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t PRPosterLevelIsDefinedLevel(unint64_t a1)
{
  int64x2_t v1 = vdupq_n_s64(a1);
  return vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18C2DCBC0), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18C2DCBD0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18C2DCBE0), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18C2DCBF0))))) & 1;
}

__CFString *NSStringFromPRPosterLevel(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
      {
        uint64_t v2 = @"PRPosterLevelContentOverlay";
        return v2;
      }
      if (a1 == 3000)
      {
        uint64_t v2 = @"PRPosterLevelModal";
        return v2;
      }
    }
    else
    {
      if (!a1)
      {
        uint64_t v2 = @"PRPosterLevelTime";
        return v2;
      }
      if (a1 == 1000)
      {
        uint64_t v2 = @"PRPosterLevelFloating";
        return v2;
      }
    }
LABEL_36:
    objc_msgSend(NSString, "stringWithFormat:", @"(Unknown PRPosterLevel; %lu)", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
    {
      uint64_t v2 = @"PRPosterLevelForeground";
      return v2;
    }
    if (a1 == -500)
    {
      uint64_t v2 = @"PRPosterLevelFloatingUnder";
      return v2;
    }
    goto LABEL_36;
  }
  if (a1 != -3000)
  {
    if (a1 == -2000)
    {
      uint64_t v2 = @"PRPosterLevelBackground";
      return v2;
    }
    goto LABEL_36;
  }
  uint64_t v2 = @"PRPosterLevelBackdrop";
  return v2;
}

__CFString *ShortNSStringFromPRPosterLevel(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
      {
        uint64_t v2 = @"CO6";
        return v2;
      }
      if (a1 == 3000)
      {
        uint64_t v2 = @"M7";
        return v2;
      }
    }
    else
    {
      if (!a1)
      {
        uint64_t v2 = @"TIME4";
        return v2;
      }
      if (a1 == 1000)
      {
        uint64_t v2 = @"FL5";
        return v2;
      }
    }
LABEL_36:
    objc_msgSend(NSString, "stringWithFormat:", @"(UNK%lu)", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
    {
      uint64_t v2 = @"FG2";
      return v2;
    }
    if (a1 == -500)
    {
      uint64_t v2 = @"FU3";
      return v2;
    }
    goto LABEL_36;
  }
  if (a1 != -3000)
  {
    if (a1 == -2000)
    {
      uint64_t v2 = @"BG1";
      return v2;
    }
    goto LABEL_36;
  }
  uint64_t v2 = @"BD0";
  return v2;
}

id PRPosterRoleFromPFPosterRole(void *a1)
{
  id v1 = a1;
  return v1;
}

id _PRPosterContentStyleStringForType(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1ED9EEA28;
  v6[1] = &unk_1ED9EEA40;
  v7[0] = @"OpaqueDiscreteColors";
  v7[1] = @"Gradient";
  v6[2] = &unk_1ED9EEA58;
  v6[3] = &unk_1ED9EEA70;
  v7[2] = @"VibrantMaterial";
  v7[3] = @"VibrantMonochrome";
  v6[4] = &unk_1ED9EEA88;
  v7[4] = @"LUT";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  long long v3 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

__CFString *_PRPosterGradientStyleIdentifierStringForGradientType(uint64_t a1)
{
  id v1 = @"A";
  if (a1 == 1) {
    id v1 = @"R";
  }
  if (a1 == 2) {
    return @"C";
  }
  else {
    return v1;
  }
}

__CFString *PRStringForEditingDestination(uint64_t a1)
{
  id v1 = @"PREditingDestinationUnknown";
  if (a1 == 2) {
    id v1 = @"PREditingDestinationUpdate";
  }
  if (a1 == 1) {
    return @"PREditingDestinationNew";
  }
  else {
    return v1;
  }
}

uint64_t PREditingDestinationForString(void *a1)
{
  id v1 = a1;
  if ([@"PREditingDestinationNew" isEqual:v1])
  {
    uint64_t v2 = 1;
  }
  else if ([@"PREditingDestinationUpdate" isEqual:v1])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id PRSystemNumberingSystem()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F70FE8];
  id v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v2 = [v1 localeIdentifier];
  long long v3 = [v0 numberingSystemForLocaleID:v2];

  return v3;
}

id _PRAllNumberingSystemsMap()
{
  v3[16] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1ED9EEAA0;
  v2[1] = &unk_1ED9EEAB8;
  v3[0] = @"latn";
  v3[1] = @"arab";
  v2[2] = &unk_1ED9EEAD0;
  v2[3] = &unk_1ED9EEAE8;
  v3[2] = @"deva";
  v3[3] = @"khmr";
  _OWORD v2[4] = &unk_1ED9EEB00;
  v2[5] = &unk_1ED9EEB18;
  v3[4] = @"mymr";
  v3[5] = @"beng";
  v2[6] = &unk_1ED9EEB30;
  v2[7] = &unk_1ED9EEB48;
  v3[6] = @"guru";
  v3[7] = @"gujr";
  v2[8] = &unk_1ED9EEB60;
  v2[9] = &unk_1ED9EEB78;
  v3[8] = @"taml";
  v3[9] = @"telu";
  v2[10] = &unk_1ED9EEB90;
  v2[11] = &unk_1ED9EEBA8;
  v3[10] = @"mlym";
  v3[11] = @"knda";
  v2[12] = &unk_1ED9EEBC0;
  v2[13] = &unk_1ED9EEBD8;
  v3[12] = @"orya";
  v3[13] = @"olck";
  v2[14] = &unk_1ED9EEBF0;
  v2[15] = &unk_1ED9EEC08;
  v3[14] = @"mtei";
  v3[15] = @"arabext";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:16];
  return v0;
}

id PRAllNumberingSystems()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1ED9EEFF8];
  if (_os_feature_enabled_impl()) {
    [v0 addObjectsFromArray:&unk_1ED9EF010];
  }
  id v1 = [v0 sortedArrayUsingComparator:&__block_literal_global_11];

  return v1;
}

uint64_t __PRAllNumberingSystems_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  long long v5 = PRNumberingSystemDisplayNameForType([a2 integerValue]);
  uint64_t v6 = [v4 integerValue];

  long long v7 = PRNumberingSystemDisplayNameForType(v6);
  uint64_t v8 = [v5 localizedCompare:v7];

  return v8;
}

id PRNumberingSystemDisplayNameForType(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"ARABIC_INDIC_NUMBERS";
      break;
    case 2:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"DEVANAGARI_NUMBERS";
      break;
    case 3:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"KHMER_NUMBERS";
      break;
    case 4:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"BURMESE_NUMBERS";
      break;
    case 5:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"BANGLA_NUMBERS";
      break;
    case 6:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"GURMUKHI_NUMBERS";
      break;
    case 7:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"GUJARATI_NUMBERS";
      break;
    case 8:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"TAMIL_NUMBERS";
      break;
    case 9:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"TELUGU_NUMBERS";
      break;
    case 10:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"MALAYALAM_NUMBERS";
      break;
    case 11:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"KANNADA_NUMBERS";
      break;
    case 12:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"ODIA_NUMBERS";
      break;
    case 13:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"OLCHIKI_NUMBERS";
      break;
    case 14:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"MEITEI_NUMBERS";
      break;
    case 15:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"URDU_NUMBERS";
      break;
    default:
      id v1 = PRBundle();
      uint64_t v2 = v1;
      long long v3 = @"ARABIC_NUMBERS";
      break;
  }
  id v4 = [v1 localizedStringForKey:v3 value:&stru_1ED9A3120 table:@"PosterKit"];

  return v4;
}

id PRAllNumberingSystemStrings()
{
  uint64_t v0 = _PRAllNumberingSystemsMap();
  id v1 = PRAllNumberingSystems();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PRAllNumberingSystemStrings_block_invoke;
  v5[3] = &unk_1E54DB070;
  id v6 = v0;
  id v2 = v0;
  long long v3 = objc_msgSend(v1, "bs_compactMap:", v5);

  return v3;
}

uint64_t __PRAllNumberingSystemStrings_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

__CFString *PRNumberingSystemStringForType(uint64_t a1)
{
  id v2 = _PRAllNumberingSystemsMap();
  long long v3 = [NSNumber numberWithInteger:a1];
  id v4 = [v2 objectForKey:v3];
  long long v5 = v4;
  if (!v4) {
    id v4 = @"latn";
  }
  id v6 = v4;

  return v6;
}

id PRNumberingSystemImageForType(uint64_t a1)
{
  switch(a1)
  {
    case 1:
    case 15:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.ar";
      goto LABEL_16;
    case 2:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.hi";
      goto LABEL_16;
    case 3:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.km";
      goto LABEL_16;
    case 4:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.my";
      goto LABEL_16;
    case 5:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.bn";
      goto LABEL_16;
    case 6:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.pa";
      goto LABEL_16;
    case 7:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.gu";
      goto LABEL_16;
    case 9:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.te";
      goto LABEL_16;
    case 10:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.ml";
      goto LABEL_16;
    case 11:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.kn";
      goto LABEL_16;
    case 12:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.or";
      goto LABEL_16;
    case 13:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.sat";
      goto LABEL_16;
    case 14:
      id v1 = (void *)MEMORY[0x1E4FB1818];
      id v2 = @"textformat.numbers.mni";
LABEL_16:
      long long v5 = [v1 systemImageNamed:v2];
      break;
    default:
      long long v3 = (void *)MEMORY[0x1E4FB1818];
      id v4 = PRBundle();
      long long v5 = [v3 imageNamed:@"textformat.12" inBundle:v4 withConfiguration:0];

      break;
  }
  return v5;
}

id PRNumberingSystemDisplayFontForFont(void *a1)
{
  if (a1) {
    [a1 fontWithSize:50.0];
  }
  else {
  id v1 = [MEMORY[0x1E4FB08E0] systemFontOfSize:50.0];
  }
  return v1;
}

__CFString *NSStringFromPRAmbientCreationBehavior(uint64_t a1)
{
  id v1 = @"(unknown creation behavior)";
  if (a1 == 1) {
    id v1 = @"Manual";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Auto";
  }
}

__CFString *NSStringFromPRAmbientDeletionBehavior(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown deletion behavior)";
  }
  else {
    return off_1E54DB1C0[a1];
  }
}

__CFString *NSStringFromPRAmbientEditingBehavior(uint64_t a1)
{
  id v1 = @"(unknown editing behavior)";
  if (a1 == 1) {
    id v1 = @"NotEditable";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Editable";
  }
}

__CFString *NSStringFromPRAmbientGalleryDisplayBehavior(uint64_t a1)
{
  id v1 = @"(unknown gallery display behavior)";
  if (a1 == 1) {
    id v1 = @"Hidden";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Visible";
  }
}

__CFString *NSStringFromPRPosterAmbientSupportedDataLayout(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown data layout)";
  }
  else {
    return off_1E54DB1A0[a1];
  }
}

BOOL PRAmbientCreationBehaviorIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PRAmbientDeletionBehaviorIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL PRAmbientEditingBehaviorIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PRAmbientGalleryDisplayBehaviorIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PRPosterAmbientSupportedDataLayoutIsValid(unint64_t a1)
{
  return a1 < 4;
}

void sub_18C1F317C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PRStringForEditingVariant(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E54DB228[a1];
  }
}

uint64_t PREditingVariantForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"home"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"lock"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"ambient"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_18C1F65A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
}

void sub_18C1FAE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C1FEFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C2038A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *a11, id *location)
{
}

void sub_18C2074E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23,id a24)
{
}

void sub_18C20B93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C212284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRPosterTitleLayoutIsVertical(uint64_t a1)
{
  return a1 == 1;
}

void sub_18C21A01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_18C21AFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
}

id PRFindLUTFilterView(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 layer];
  long long v3 = objc_opt_class();
  LODWORD(v3) = [v3 isEqual:objc_opt_class()];

  if (v3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = [v1 layer];
    long long v5 = [v4 filters];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      uint64_t v9 = *MEMORY[0x1E4F3A278];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) type];
          int v12 = [v11 isEqual:v9];

          if (v12)
          {
            id v17 = v1;
            goto LABEL_21;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v5 = objc_msgSend(v1, "subviews", 0);
  uint64_t v13 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v5);
      }
      PRFindLUTFilterView(*(void *)(*((void *)&v20 + 1) + 8 * v16));
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
LABEL_21:
    long long v18 = v17;
  }
  else
  {
LABEL_19:
    long long v18 = 0;
  }

  return v18;
}

void sub_18C224E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C225000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id PRPosterRoleAttributeForData(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    if ([v3 isEqualToString:@"PRPosterRoleAttributeTypeSuggestionMetadata"])
    {
      long long v5 = @"PRPosterSuggestionMetadata";
LABEL_18:
      uint64_t v6 = [NSClassFromString(&v5->isa) decodeObjectWithJSON:v4];
      goto LABEL_20;
    }
    if ([v3 isEqualToString:@"PRPosterRoleAttributeTypeHomeScreenConfiguration"])
    {
      long long v5 = @"PRPosterHomeScreenConfiguration";
      goto LABEL_18;
    }
    if ([v3 isEqualToString:@"PRPosterRoleAttributeTypeMetadata"])
    {
      long long v5 = @"PRPosterMetadata";
      goto LABEL_18;
    }
    if ([v3 isEqualToString:@"PRPosterRoleAttributeTypeFocusConfiguration"])
    {
      long long v5 = @"PRPosterFocusConfiguration";
      goto LABEL_18;
    }
    if ([v3 isEqualToString:@"PRPosterRoleAttributeTypeChildPosterUUID"])
    {
      long long v5 = @"PRChildPosterAttribute";
      goto LABEL_18;
    }
    if ([v3 isEqual:@"PRPosterRoleAttributeTypeUsageMetadata"])
    {
      long long v5 = @"PRPosterUsageMetadataAttribute";
      goto LABEL_18;
    }
    if ([v3 isEqual:@"PRPosterRoleAttributeTypeAmbientConfiguration"])
    {
      long long v5 = @"PRPosterAmbientConfiguration";
      goto LABEL_18;
    }
    if ([v3 isEqual:@"PRPosterRoleAttributeTypeAmbientChargerConfiguration"])
    {
      long long v5 = @"PRPosterAmbientChargerConfiguration";
      goto LABEL_18;
    }
  }
  uint64_t v6 = 0;
LABEL_20:

  return v6;
}

id PRLogCommon()
{
  if (PRLogCommon_onceToken != -1) {
    dispatch_once(&PRLogCommon_onceToken, &__block_literal_global_25);
  }
  uint64_t v0 = (void *)PRLogCommon___logObj;
  return v0;
}

uint64_t __PRLogCommon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "Common");
  uint64_t v1 = PRLogCommon___logObj;
  PRLogCommon___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRLogRendering()
{
  if (PRLogRendering_onceToken != -1) {
    dispatch_once(&PRLogRendering_onceToken, &__block_literal_global_4_2);
  }
  os_log_t v0 = (void *)PRLogRendering___logObj;
  return v0;
}

uint64_t __PRLogRendering_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "Rendering");
  uint64_t v1 = PRLogRendering___logObj;
  PRLogRendering___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRLogEditing()
{
  if (PRLogEditing_onceToken != -1) {
    dispatch_once(&PRLogEditing_onceToken, &__block_literal_global_7_1);
  }
  os_log_t v0 = (void *)PRLogEditing___logObj;
  return v0;
}

uint64_t __PRLogEditing_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "Editing");
  uint64_t v1 = PRLogEditing___logObj;
  PRLogEditing___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRLogTelemetrySignposts()
{
  if (PRLogTelemetrySignposts_onceToken != -1) {
    dispatch_once(&PRLogTelemetrySignposts_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)PRLogTelemetrySignposts___logObj;
  return v0;
}

uint64_t __PRLogTelemetrySignposts_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "TelemetrySignposts");
  uint64_t v1 = PRLogTelemetrySignposts___logObj;
  PRLogTelemetrySignposts___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRLogSnapshotter()
{
  if (PRLogSnapshotter_onceToken[0] != -1) {
    dispatch_once(PRLogSnapshotter_onceToken, &__block_literal_global_13_0);
  }
  os_log_t v0 = (void *)PRLogSnapshotter___logObj;
  return v0;
}

uint64_t __PRLogSnapshotter_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "Snapshotter");
  uint64_t v1 = PRLogSnapshotter___logObj;
  PRLogSnapshotter___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRLogUpdatingService()
{
  if (PRLogUpdatingService_onceToken != -1) {
    dispatch_once(&PRLogUpdatingService_onceToken, &__block_literal_global_16);
  }
  os_log_t v0 = (void *)PRLogUpdatingService___logObj;
  return v0;
}

uint64_t __PRLogUpdatingService_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "UpdatingService");
  uint64_t v1 = PRLogUpdatingService___logObj;
  PRLogUpdatingService___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRLogModel()
{
  if (PRLogModel_onceToken != -1) {
    dispatch_once(&PRLogModel_onceToken, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)PRLogModel___logObj;
  return v0;
}

uint64_t __PRLogModel_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PosterKit", "Model");
  uint64_t v1 = PRLogModel___logObj;
  PRLogModel___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id PRBundle()
{
  if (PRBundle___onceToken != -1) {
    dispatch_once(&PRBundle___onceToken, &__block_literal_global_26);
  }
  os_log_t v0 = (void *)PRBundle___posterKitBundle;
  return v0;
}

void __PRBundle_block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x1E4F28B50];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleForClass:v3];
  uint64_t v2 = (void *)PRBundle___posterKitBundle;
  PRBundle___posterKitBundle = v1;
}

uint64_t PRIsPlatformSupported()
{
  if (PRIsPlatformSupported_onceToken != -1) {
    dispatch_once(&PRIsPlatformSupported_onceToken, &__block_literal_global_3_0);
  }
  return PRIsPlatformSupported_isPlatformSupported;
}

uint64_t __PRIsPlatformSupported_block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    uint64_t result = _os_feature_enabled_impl();
    char v5 = 1;
  }
  else
  {
    char v6 = _os_feature_enabled_impl();
    uint64_t result = 0;
    char v5 = v6 ^ 1;
  }
  char v7 = v5 ^ 1;
  if (v1) {
    char v7 = 0;
  }
  PRIsPlatformSupported_isPlatformSupported = v7 | result;
  return result;
}

void sub_18C2334D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18C233F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_18C2356BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C235B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C236040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18C2366C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_18C23C894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location)
{
}

__CFString *NSStringFromPRPosterSnapshotDefinitionLayerSet(unint64_t a1)
{
  if (a1 < 3) {
    return off_1E54DC150[a1];
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported layerset value: %ld", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSStringFromPRPosterSnapshotDefinitionLayerSet_cold_1();
  }
  [v2 UTF8String];
  uint64_t result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  if (a1 == 2)
  {
    uint64_t v2 = +[PRPosterLevelSet compositeLevelSet];
    v7[0] = v2;
    uint64_t v3 = +[PRPosterLevelSet levelSetForLevel:-1000];
    v7[1] = v3;
    id v4 = +[PRPosterLevelSet levelSetForLevel:-2000];
    v7[2] = v4;
    uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  }
  else
  {
    if (a1 == 1)
    {
      uint64_t v2 = +[PRPosterLevelSet levelSetForLevel:1000];
      uint64_t v8 = v2;
      uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
      goto LABEL_8;
    }
    if (a1) {
      goto LABEL_9;
    }
    uint64_t v2 = +[PRPosterLevelSet compositeLevelSet];
    v9[0] = v2;
    uint64_t v3 = +[PRPosterLevelSet levelSetForLevel:-1000];
    v9[1] = v3;
    id v4 = +[PRPosterLevelSet levelSetForLevel:-2000];
    v9[2] = v4;
    char v5 = +[PRPosterLevelSet levelSetForLevel:1000];
    v9[3] = v5;
    uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  }
LABEL_8:

LABEL_9:
  return v1;
}

uint64_t PRPosterSnapshotDefinitionLayerSetForPRPosterLevelSets(void *a1)
{
  id v1 = a1;
  uint64_t v2 = 2;
  uint64_t v3 = PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(2);
  char v4 = [v1 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    char v5 = PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(1);
    unsigned int v6 = [v1 isEqual:v5];

    uint64_t v2 = v6;
  }

  return v2;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_18C23EFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C243E6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C2441F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C244330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24463C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C244774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C244A80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C244BB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C244EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C244FFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C245434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C245574(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C245880(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C2459B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C245CC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C245DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246108(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246240(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24654C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246990(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246AC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246DD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C246F0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C247218(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C247350(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24765C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C247794(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C247AA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C247BD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C247EE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24801C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_18C24A388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24A4C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24A6A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C24AE54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24AED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24AF4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24BBDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24BC60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24BF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_destroyWeak(v23);
  objc_sync_exit(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v24 - 72));
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

void sub_18C24C090(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C24C138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18C24C3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18C24C460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromPRPosterGalleryPresentationStyle(uint64_t a1)
{
  if (!a1) {
    return @"DEFAULT";
  }
  if (a1 == 1) {
    return @"SLIDEUP";
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Undefined gallery presentation style %ld", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSStringFromPRPosterGalleryPresentationStyle_cold_1((uint64_t)v2);
  }
  [v2 UTF8String];
  uint64_t result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

__CFString *NSStringFromPRPosterGalleryDisplayStyle(uint64_t a1)
{
  if (!a1) {
    return @"STATIC";
  }
  if (a1 == 1) {
    return @"LIVE";
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Undefined gallery display style %ld", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    NSStringFromPRPosterGalleryDisplayStyle_cold_1((uint64_t)v2);
  }
  [v2 UTF8String];
  uint64_t result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PRPosterGalleryPresentationStyleFromString(void *a1)
{
  id v1 = [a1 uppercaseString];
  uint64_t v2 = [v1 isEqualToString:@"SLIDEUP"];

  return v2;
}

uint64_t PRPosterGalleryDisplayStyleFromString(void *a1)
{
  id v1 = [a1 uppercaseString];
  uint64_t v2 = [v1 isEqualToString:@"LIVE"];

  return v2;
}

id _PRCAGradientLayerTypeFromPRContentStyleGradientType(uint64_t a1)
{
  id v1 = (id *)MEMORY[0x1E4F3A398];
  uint64_t v2 = (id *)MEMORY[0x1E4F3A3A0];
  if (a1 != 1) {
    uint64_t v2 = (id *)MEMORY[0x1E4F3A390];
  }
  if (a1 != 2) {
    id v1 = v2;
  }
  return *v1;
}

id PersistentIdentifierForPRSWidget(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F58DD8];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = [v2 extensionBundleIdentifier];
  char v5 = [v2 containerBundleIdentifier];
  unsigned int v6 = [v2 kind];
  uint64_t v7 = [v2 family];
  uint64_t v8 = [v2 intent];
  uint64_t v9 = (void *)[v3 initWithExtensionBundleIdentifier:v4 containerBundleIdentifier:v5 kind:v6 family:v7 intent:v8];

  uint64_t v10 = +[PRWidgetMetricsProvider sharedInstance];
  uint64_t v11 = [v10 systemMetricsForWidget:v9];

  uint64_t v12 = NSString;
  uint64_t v13 = [v2 extensionBundleIdentifier];
  uint64_t v14 = [v2 containerBundleIdentifier];
  uint64_t v15 = [v2 kind];
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "family"));
  [v11 size];
  id v17 = NSStringFromCGSize(v22);
  long long v18 = [v2 intent];

  long long v19 = [v12 stringWithFormat:@"(WIDGET:%@-%@-%@-%@-%@-%lld)", v13, v14, v15, v16, v17, objc_msgSend(v18, "_indexingHash")];

  return v19;
}

uint64_t NSStringFromPRPosterSignificantEvent()
{
  return MEMORY[0x1F4145CE8]();
}

uint64_t PRPosterSignificantEventOptionsContainsEvent()
{
  return MEMORY[0x1F4145D38]();
}

void sub_18C25A770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C260720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_18C260764()
{
}

void sub_18C263F68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_18C26419C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C264998(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C266694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_18C26A4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

id _PRCAEditingGradientLayerTypeFromPRContentStyleGradientType(uint64_t a1)
{
  id v1 = (id *)MEMORY[0x1E4F3A398];
  uint64_t v2 = (id *)MEMORY[0x1E4F3A3A0];
  if (a1 != 1) {
    uint64_t v2 = (id *)MEMORY[0x1E4F3A390];
  }
  if (a1 != 2) {
    id v1 = v2;
  }
  return *v1;
}

void sub_18C26E41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 232));
  _Unwind_Resume(a1);
}

__CFString *NSStringForPRSceneSetting(uint64_t a1)
{
  switch(a1)
  {
    case 20562:
      uint64_t result = @"Case Color";
      break;
    case 20563:
      uint64_t result = @"Poster Configurable Options";
      break;
    case 20564:
      uint64_t result = @"Poster Configured Properties";
      break;
    case 20565:
      uint64_t result = @"Poster Title Style Configuration";
      break;
    case 20566:
      uint64_t result = @"Poster Ambient Configuration";
      break;
    case 20567:
      uint64_t result = @"Depth Effect Disallowed";
      break;
    case 20568:
      uint64_t result = @"Parallax Enabled";
      break;
    case 20569:
      uint64_t result = @"Parallax Disallowed";
      break;
    case 20570:
      uint64_t result = @"Show Header Elements";
      break;
    case 20571:
      uint64_t result = @"Show Complications";
      break;
    case 20572:
      uint64_t result = @"Horizontal Title Bounding Rect";
      break;
    case 20573:
      uint64_t result = @"Vertical Title Bounding Rect";
      break;
    default:
      uint64_t v2 = a1 - 20762;
      uint64_t result = 0;
      switch(v2)
      {
        case 0:
          uint64_t result = @"Covered by Modal Presentation";
          break;
        case 1:
        case 4:
        case 5:
        case 6:
        case 7:
        case 9:
        case 10:
          return result;
        case 2:
          uint64_t result = @"Editing Variant";
          break;
        case 3:
          uint64_t result = @"Editing Context";
          break;
        case 8:
          uint64_t result = @"Editing Accept Button Type";
          break;
        case 11:
          uint64_t result = @"Title String";
          break;
        case 12:
          uint64_t result = @"Override Date";
          break;
        default:
          uint64_t result = 0;
          break;
      }
      break;
  }
  return result;
}

void sub_18C275F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *PRStringForEditingContext(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E54DC868[a1];
  }
}

uint64_t PREditingContextForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"user"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"suggested"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"hero"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

BOOL PREditingContextIsSavedConfiguration(uint64_t a1)
{
  return a1 == 0;
}

void sub_18C279E28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C27BC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return *(void *)(a1 + 80);
}

void OUTLINED_FUNCTION_14_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_18C27C5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C27DA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PRPinViewWithinView(void *a1, void *a2)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  long long v18 = [v4 leadingAnchor];
  id v17 = [v3 leadingAnchor];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  char v5 = [v4 trailingAnchor];
  unsigned int v6 = [v3 trailingAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  uint64_t v8 = [v4 topAnchor];
  uint64_t v9 = [v3 topAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  uint64_t v11 = [v4 bottomAnchor];

  uint64_t v12 = [v3 bottomAnchor];

  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v14];
  return v14;
}

void sub_18C27F234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_18C27FA20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18C281E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C282720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

id PRDefaultTimeNumberingSystem()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F70FE8];
  uint64_t v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v2 = [v1 localeIdentifier];
  id v3 = [v0 numberingSystemForLocaleID:v2];

  return v3;
}

uint64_t PRTimeNumberingSystemRequiresLanguageTagging(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"deva"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"arabext"];
  }

  return v2;
}

__CFString *PRTimeNumberingSystemLanguageTag(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"deva"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:&unk_1ED9EF070];
    id v3 = [v2 firstObject];
  }
  else if ([v1 isEqualToString:@"arabext"])
  {
    id v3 = @"ur";
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

__CFString *PRFontNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    uint64_t v2 = @".SFRoundedNumeric-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    uint64_t v2 = @".SFSoftNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoftLight"])
  {
    uint64_t v2 = @".SFSoftNumeric-Light";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    uint64_t v2 = @".ADTSlabNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    uint64_t v2 = @".SFStencilNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierRail"])
  {
    uint64_t v2 = @".SFRailNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    uint64_t v2 = @".NewYorkNumeric-Semibold";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYorkHeavy"])
  {
    uint64_t v2 = @".NewYorkNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFArabic"])
  {
    uint64_t v2 = @".SFArabic-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFArabicRounded"])
  {
    uint64_t v2 = @".SFArabicRounded-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFHebrew"])
  {
    uint64_t v2 = @".SFHebrew-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFHebrewRounded"])
  {
    uint64_t v2 = @".SFHebrewRounded-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNovember"])
  {
    uint64_t v2 = @"NovemberIndia-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNovemberCondensed"])
  {
    uint64_t v2 = @"NovemberIndia-CondensedMedium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierOctober"])
  {
    uint64_t v2 = @"OctoberIndia-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFPro"])
  {
    uint64_t v2 = @".SFUI-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFRounded"])
  {
    uint64_t v2 = @".SFUIRounded-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYorkAlpha"])
  {
    uint64_t v2 = @".NewYork-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSFCondensed"])
  {
    uint64_t v2 = @".SFUI-CondensedMedium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierPrivateSystemSoftHeavy"])
  {
    uint64_t v2 = @".SFSoftNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierPrivateSystemRoundedHeavy"])
  {
    uint64_t v2 = @".SFRoundedNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierPrivateSystemStencilHeavy"])
  {
    uint64_t v2 = @".SFStencilNumeric-Heavy";
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *PRTimeFontIdentifierForFontName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@".SFRoundedNumeric-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierRounded";
  }
  else if ([v1 isEqualToString:@".SFRoundedNumeric-Heavy"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierPrivateSystemRoundedHeavy";
  }
  else if ([v1 isEqualToString:@".SFSoftNumeric-Semibold"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSoft";
  }
  else if ([v1 isEqualToString:@".SFSoftNumeric-Light"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSoftLight";
  }
  else if ([v1 isEqualToString:@".SFSoftNumeric-Heavy"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierPrivateSystemSoftHeavy";
  }
  else if ([v1 isEqualToString:@".ADTSlabNumeric-Semibold"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSlab";
  }
  else if ([v1 isEqualToString:@".SFStencilNumeric-Semibold"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierStencil";
  }
  else if ([v1 isEqualToString:@".SFStencilNumeric-Heavy"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierPrivateSystemStencilHeavy";
  }
  else if ([v1 isEqualToString:@".SFRailNumeric-Heavy"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierRail";
  }
  else if ([v1 isEqualToString:@".NewYorkNumeric-Semibold"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierNewYork";
  }
  else if ([v1 isEqualToString:@".NewYorkNumeric-Heavy"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierNewYorkHeavy";
  }
  else if ([v1 isEqualToString:@".SFArabic-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFArabic";
  }
  else if ([v1 isEqualToString:@".SFArabicRounded-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFArabicRounded";
  }
  else if ([v1 isEqualToString:@".SFHebrew-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFHebrew";
  }
  else if ([v1 isEqualToString:@".SFHebrewRounded-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFHebrewRounded";
  }
  else if ([v1 isEqualToString:@"NovemberIndia-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierNovember";
  }
  else if ([v1 isEqualToString:@"NovemberIndia-CondensedMedium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierNovemberCondensed";
  }
  else if ([v1 isEqualToString:@"OctoberIndia-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierOctober";
  }
  else if ([v1 isEqualToString:@".SFUI-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFPro";
  }
  else if ([v1 isEqualToString:@"..SFCompactRounded-Regular"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFRounded";
  }
  else if ([v1 isEqualToString:@".SFCompact-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierSFCondensed";
  }
  else if ([v1 isEqualToString:@".NewYork-Medium"])
  {
    uint64_t v2 = @"PRTimeFontIdentifierNewYorkAlpha";
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id PRLocalizedDisplayNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    uint64_t v2 = PRBundle();
    id v3 = v2;
    id v4 = @"TIME_FONT_ROUNDED";
LABEL_13:
    char v5 = [v2 localizedStringForKey:v4 value:&stru_1ED9A3120 table:@"PosterKit"];

    goto LABEL_14;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    uint64_t v2 = PRBundle();
    id v3 = v2;
    id v4 = @"TIME_FONT_SOFT";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    uint64_t v2 = PRBundle();
    id v3 = v2;
    id v4 = @"TIME_FONT_SLAB";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    uint64_t v2 = PRBundle();
    id v3 = v2;
    id v4 = @"TIME_FONT_STENCIL";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRail"])
  {
    uint64_t v2 = PRBundle();
    id v3 = v2;
    id v4 = @"TIME_FONT_RAIL";
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    uint64_t v2 = PRBundle();
    id v3 = v2;
    id v4 = @"TIME_FONT_NEWYORK";
    goto LABEL_13;
  }
  char v5 = 0;
LABEL_14:

  return v5;
}

__CFString *PRMinimumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    uint64_t v2 = @".SFRoundedNumeric-Thin";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    uint64_t v2 = @".SFSoftNumeric-Thin";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    uint64_t v2 = @".ADTSlabNumeric-Medium";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    uint64_t v2 = @".SFStencilNumeric-Thin";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    uint64_t v2 = @".NewYorkNumeric-Medium";
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *PRMaximumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRTimeFontIdentifierRounded"])
  {
    uint64_t v2 = @".SFRoundedNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSoft"])
  {
    uint64_t v2 = @".SFSoftNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierSlab"])
  {
    uint64_t v2 = @".ADTSlabNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierStencil"])
  {
    uint64_t v2 = @".SFStencilNumeric-Heavy";
  }
  else if ([v1 isEqualToString:@"PRTimeFontIdentifierNewYork"])
  {
    uint64_t v2 = @".NewYorkNumeric-Heavy";
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id PRTimeFontIdentifiers(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = v2;
  if ((a1 & 1) == 0)
  {
    [v2 addObject:@"PRTimeFontIdentifierSoft"];
    [v3 addObject:@"PRTimeFontIdentifierSoftLight"];
    [v3 addObject:@"PRTimeFontIdentifierRounded"];
    [v3 addObject:@"PRTimeFontIdentifierStencil"];
    [v3 addObject:@"PRTimeFontIdentifierNewYork"];
    [v3 addObject:@"PRTimeFontIdentifierNewYorkHeavy"];
    [v3 addObject:@"PRTimeFontIdentifierSlab"];
    [v3 addObject:@"PRTimeFontIdentifierRail"];
  }
  if ((a1 & 2) == 0)
  {
    [v3 addObject:@"PRTimeFontIdentifierPrivateSystemSoftHeavy"];
    [v3 addObject:@"PRTimeFontIdentifierPrivateSystemRoundedHeavy"];
    [v3 addObject:@"PRTimeFontIdentifierPrivateSystemStencilHeavy"];
  }
  return v3;
}

uint64_t PRTimeFontIsDownloadable(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"PRTimeFontIdentifierNovember"] & 1) != 0
    || ([v1 isEqualToString:@"PRTimeFontIdentifierNovemberCondensed"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"PRTimeFontIdentifierOctober"];
  }

  return v2;
}

__CFString *PRStringForEditingAcceptButtonType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E54DCDD0[a1];
  }
}

uint64_t PREditingAcceptButtonTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"done"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"add"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"next"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void FBSceneSettingsApplyPRSceneSettings(void *a1, void *a2)
{
  id v30 = a1;
  id v3 = a2;
  id v4 = objc_msgSend(v30, "pui_role");

  if (v4)
  {
    char v5 = objc_msgSend(v30, "pui_role");
    objc_msgSend(v3, "pui_setRole:", v5);
  }
  unsigned int v6 = objc_msgSend(v30, "pui_provider");

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v30, "pui_provider");
    objc_msgSend(v3, "pui_setProvider:", v7);
  }
  uint64_t v8 = objc_msgSend(v30, "pui_previewIdentifier");

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v30, "pui_previewIdentifier");
    objc_msgSend(v3, "pui_setPreviewIdentifier:", v9);
  }
  uint64_t v10 = objc_msgSend(v30, "pr_caseColor");

  if (v10)
  {
    uint64_t v11 = objc_msgSend(v30, "pr_caseColor");
    objc_msgSend(v3, "pr_setCaseColor:", v11);
  }
  objc_msgSend(v3, "pui_setUserInterfaceStyle:", objc_msgSend(v30, "pui_userInterfaceStyle"));
  objc_msgSend(v3, "pui_setDeviceOrientation:", objc_msgSend(v30, "pui_deviceOrientation"));
  uint64_t v12 = objc_msgSend(v30, "pui_posterContents");

  if (v12)
  {
    uint64_t v13 = objc_msgSend(v30, "pui_posterContents");
    objc_msgSend(v3, "pui_setPosterContents:", v13);
  }
  uint64_t v14 = objc_msgSend(v30, "pr_posterConfigurableOptions");

  if (v14)
  {
    uint64_t v15 = objc_msgSend(v30, "pr_posterConfigurableOptions");
    objc_msgSend(v3, "pr_setPosterConfigurableOptions:", v15);
  }
  uint64_t v16 = objc_msgSend(v30, "pr_posterConfiguredProperties");

  if (v16)
  {
    id v17 = objc_msgSend(v30, "pr_posterConfiguredProperties");
    objc_msgSend(v3, "pr_setPosterConfiguredProperties:", v17);
  }
  long long v18 = objc_msgSend(v30, "pr_posterTitleStyleConfiguration");

  if (v18)
  {
    long long v19 = objc_msgSend(v30, "pr_posterTitleStyleConfiguration");
    objc_msgSend(v3, "pr_setPosterTitleStyleConfiguration:", v19);
  }
  else
  {
    long long v20 = objc_msgSend(v30, "pr_posterConfiguredProperties");
    long long v21 = [v20 titleStyleConfiguration];

    CGSize v22 = v30;
    if (!v21) {
      goto LABEL_20;
    }
    long long v19 = objc_msgSend(v30, "pr_posterConfiguredProperties");
    long long v23 = [v19 titleStyleConfiguration];
    objc_msgSend(v3, "pr_setPosterTitleStyleConfiguration:", v23);
  }
  CGSize v22 = v30;
LABEL_20:
  uint64_t v24 = objc_msgSend(v22, "pr_posterAmbientConfiguration");

  if (v24)
  {
    long long v25 = objc_msgSend(v30, "pr_posterAmbientConfiguration");
    objc_msgSend(v3, "pr_setPosterAmbientConfiguration:", v25);
  }
  else
  {
    long long v26 = objc_msgSend(v30, "pr_posterConfiguredProperties");
    long long v27 = [v26 ambientConfiguration];

    uint64_t v28 = v30;
    if (!v27) {
      goto LABEL_25;
    }
    long long v25 = objc_msgSend(v30, "pr_posterConfiguredProperties");
    v29 = [v25 ambientConfiguration];
    objc_msgSend(v3, "pr_setPosterAmbientConfiguration:", v29);
  }
  uint64_t v28 = v30;
LABEL_25:
  objc_msgSend(v3, "pr_setDepthEffectDisallowed:", objc_msgSend(v28, "pr_isDepthEffectDisallowed"));
  objc_msgSend(v3, "pr_setParallaxEnabled:", objc_msgSend(v30, "pr_isParallaxEnabled"));
  objc_msgSend(v3, "pr_setParallaxDisallowed:", objc_msgSend(v30, "pr_isParallaxDisallowed"));
  objc_msgSend(v3, "pui_setInlineComplicationConfigured:", objc_msgSend(v30, "pui_isInlineComplicationConfigured"));
  objc_msgSend(v3, "pui_setComplicationRowConfigured:", objc_msgSend(v30, "pui_isComplicationRowConfigured"));
  objc_msgSend(v3, "pui_setComplicationSidebarConfigured:", objc_msgSend(v30, "pui_isComplicationSidebarConfigured"));
  objc_msgSend(v3, "pr_setAlternateDateEnabled:", objc_msgSend(v30, "pr_isAlternateDateEnabled"));
  objc_msgSend(v3, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(v30, "pui_isExtensionUserInteractionEnabled"));
  objc_msgSend(v3, "pui_setShowsHeaderElements:", objc_msgSend(v30, "pui_showsHeaderElements"));
  objc_msgSend(v3, "pui_setShowsComplications:", objc_msgSend(v30, "pui_showsComplications"));
  objc_msgSend(v3, "pui_setWallpaperObscured:", objc_msgSend(v30, "pui_isWallpaperObscured"));
  objc_msgSend(v3, "pui_setPosterBoundingShape:", objc_msgSend(v30, "pui_posterBoundingShape"));
  objc_msgSend(v30, "pr_horizontalTitleBoundingRect");
  objc_msgSend(v3, "pr_setHorizontalTitleBoundingRect:");
  objc_msgSend(v30, "pr_verticalTitleBoundingRect");
  objc_msgSend(v3, "pr_setVerticalTitleBoundingRect:");
}

void FBSceneSettingsApplyPRRenderingSceneSettings(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  objc_msgSend(v3, "pui_setMode:", objc_msgSend(v7, "pui_mode"));
  objc_msgSend(v3, "pui_setContent:", objc_msgSend(v7, "pui_content"));
  objc_msgSend(v3, "pui_setPreviewContent:", objc_msgSend(v7, "pui_previewContent"));
  objc_msgSend(v3, "pui_setSnapshot:", objc_msgSend(v7, "pui_isSnapshot"));
  objc_msgSend(v3, "pui_setFloatingLayerSnapshot:", objc_msgSend(v7, "pui_isFloatingLayerSnapshot"));
  objc_msgSend(v7, "pr_unlockProgress");
  objc_msgSend(v3, "pr_setUnlockProgress:");
  objc_msgSend(v3, "pr_setWakeSourceIsSwipeToUnlock:", objc_msgSend(v7, "pr_wakeSourceIsSwipeToUnlock"));
  objc_msgSend(v3, "pui_setSignificantEventsCounter:", objc_msgSend(v7, "pui_significantEventsCounter"));
  objc_msgSend(v3, "pr_setTitleAlignment:", objc_msgSend(v7, "pr_titleAlignment"));
  objc_msgSend(v3, "pr_setAdjustedLuminance:", objc_msgSend(v7, "pr_adjustedLuminance"));
  id v4 = objc_msgSend(v7, "pui_sceneAttachments");
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unsigned int v6 = objc_msgSend(v7, "pui_sceneAttachments");
    objc_msgSend(v3, "pui_setSceneAttachments:", v6);
  }
  objc_msgSend(v3, "pui_setDeviceOrientation:", objc_msgSend(v7, "pui_deviceOrientation"));
}

void FBSceneSettingsApplyAMUIAmbientPresentationSettings(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setAmbientPresented:", objc_msgSend(v4, "isAmbientPresented"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setAmbientDisplayStyle:", objc_msgSend(v4, "ambientDisplayStyle"));
  }
}

__CFString *PRErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"Unknown error.";
  }
  else {
    return off_1E54DCE88[a1 - 1];
  }
}

uint64_t PRWidgetGridSupportsFamily(unint64_t a1)
{
  return (a1 < 0xC) & (0xC02u >> a1);
}

id PRIconGridSizeClassForWidgetFamily(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FA6280], "pr_widgetDomain");
  id v3 = [v2 iconGridSizeClassForCHSWidgetFamily:a1];

  return v3;
}

id PRIconGridSizeClassSetForWidgetFamilyMask(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FA6288]);
  id v3 = objc_msgSend(MEMORY[0x1E4FA6280], "pr_widgetDomain");
  id v4 = (void *)[v2 initWithCHSWidgetFamilyMask:a1 inDomain:v3];

  return v4;
}

uint64_t PRWidgetFamilyForIconGridSizeClass(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4FA6280];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "pr_widgetDomain");
  uint64_t v4 = [v3 chsWidgetFamilyForIconGridSizeClass:v2];

  return v4;
}

double PRWidgetPlatterCornerRadius()
{
  uint64_t v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  double result = 10.0;
  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 12.0;
  }
  return result;
}

double PRSheetCornerRadius()
{
  return 30.0;
}

double PRSheetGrabberTopSpacing()
{
  return 12.0;
}

double PRDirectionalEdgeInsetsInsetRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1) {
    a7 = a9;
  }
  return a2 + a7;
}

void sub_18C296E10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_18C298218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_18C299808()
{
  uint64_t v0 = sub_18C2CA4E0();
  __swift_allocate_value_buffer(v0, qword_1E9171CA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9171CA0);
  id result = PRLogCommon();
  if (result) {
    return (id)sub_18C2CA4F0();
  }
  __break(1u);
  return result;
}

void sub_18C29986C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_18C299874@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_18C299888(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_18C2998B8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_18C2998CC(void *result)
{
  *v1 &= *result;
  return result;
}

void sub_18C2998E0(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_18C2998E8@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_18C2998FC(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_18C29992C(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *sub_18C299940(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_18C299954(uint64_t a1, uint64_t a2)
{
  return sub_18C299AC0(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_18C29996C(uint64_t a1, id *a2)
{
  uint64_t result = sub_18C2CA9E0();
  *a2 = 0;
  return result;
}

uint64_t sub_18C2999E4(uint64_t a1, id *a2)
{
  char v3 = sub_18C2CA9F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_18C299A64@<X0>(uint64_t *a1@<X8>)
{
  sub_18C2CAA00();
  uint64_t v2 = sub_18C2CA9D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18C299AA8(uint64_t a1, uint64_t a2)
{
  return sub_18C299AC0(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_18C299AC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_18C2CAA00();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_18C299B04()
{
  sub_18C2CAA00();
  sub_18C2CAA10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18C299B58()
{
  sub_18C2CAA00();
  sub_18C2CACF0();
  sub_18C2CAA10();
  uint64_t v0 = sub_18C2CAD20();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_18C299BCC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_18C299BD8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_18C299BE4@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_18C299BF0()
{
  uint64_t v0 = sub_18C2CAA00();
  uint64_t v2 = v1;
  if (v0 == sub_18C2CAA00() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_18C2CACD0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for VerticalLabelView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_18C299D70(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_18C299D90(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_18C299DD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_18C2CA9D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18C299E18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18C2CAA00();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18C299E44(uint64_t a1)
{
  uint64_t v2 = sub_18C299F44((unint64_t *)&qword_1E916CDF8);
  uint64_t v3 = sub_18C299F44((unint64_t *)&unk_1E91704D0);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_18C299EDC()
{
  return sub_18C299F44(&qword_1E91704C0);
}

uint64_t sub_18C299F10()
{
  return sub_18C299F44(&qword_1E91704C8);
}

uint64_t sub_18C299F44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18C299F88()
{
  return sub_18C299F44((unint64_t *)&unk_1E916CE00);
}

void type metadata accessor for CTFont(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_18C299FDC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_18C299FFC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_18C29A04C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t AmbientEditingTitledViewController.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x192F91D20](v1);
}

uint64_t AmbientEditingTitledViewController.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*AmbientEditingTitledViewController.delegate.modify(void *a1))(void **a1, char a2)
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x192F91D20](v5);
  return sub_18C29A27C;
}

void sub_18C29A27C(void **a1, char a2)
{
  char v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_18C29A2FC()
{
  return sub_18C29A324();
}

uint64_t sub_18C29A310()
{
  return sub_18C29A324();
}

uint64_t sub_18C29A324()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CAAC0();
  swift_release();
  swift_release();
  return v1;
}

id AmbientEditingTitledViewController.__allocating_init(contentViewController:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AmbientEditingTitledViewController.init(contentViewController:)(a1);
}

id AmbientEditingTitledViewController.init(contentViewController:)(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  sub_18C29B910(0, &qword_1EB67E220);
  uint64_t v5 = v2;
  sub_18C2CAAE0();
  sub_18C29B910(0, &qword_1EB67E248);
  sub_18C2CAAE0();
  *(void *)&v5[OBJC_IVAR___PRAmbientEditingTitledViewController_contentViewController] = a1;
  id v6 = a1;

  v16.receiver = v5;
  v16.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  objc_msgSend(v6, sel_preferredContentSize);
  if (v8 <= 100.0) {
    double v8 = 100.0;
  }
  double v10 = v9 + 40.0;
  BOOL v11 = v9 > 50.0;
  double v12 = 90.0;
  if (v11) {
    double v12 = v10;
  }
  objc_msgSend(v7, sel_setPreferredContentSize_, v8, v12);
  id v13 = v7;
  id v14 = objc_msgSend(v6, sel_title);
  objc_msgSend(v13, sel_setTitle_, v14);

  return v13;
}

Swift::Void __swiftcall AmbientEditingTitledViewController.loadView()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v2 = (void *)sub_18C2CA9D0();
  id v3 = objc_msgSend(self, sel_materialViewWithRecipeNamed_, v2);

  if (!v3) {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  }
  id v4 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v4, sel_setCornerRadius_, 15.0);

  id v5 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v5, sel_setCornerCurve_, *MEMORY[0x1E4F39EA8]);

  id v6 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v6, sel_setMaskedCorners_, 3);

  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v3);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  id v8 = objc_msgSend(v0, sel_title);
  objc_msgSend(v7, sel_setText_, v8);

  id v9 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E4FB28C8]);
  id v10 = objc_msgSend(v9, sel_fontDescriptorWithSymbolicTraits_, 2);
  if (!v10) {
    id v10 = v9;
  }
  v85 = v9;
  v84 = v10;
  id v11 = objc_msgSend(self, sel_fontWithDescriptor_size_, v10, 0.0);
  objc_msgSend(v7, sel_setFont_, v11);

  double v12 = self;
  id v13 = objc_msgSend(v12, sel_whiteColor);
  objc_msgSend(v7, sel_setTextColor_, v13);

  objc_msgSend(v7, sel_setNumberOfLines_, 1);
  objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v14 = *MEMORY[0x1E4FB27B0];
  objc_msgSend(v7, sel_setMaximumContentSizeCategory_, *MEMORY[0x1E4FB27B0]);
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 1, v15);
  LODWORD(v16) = 1132068864;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 0, v16);
  objc_msgSend(v1, sel_addSubview_, v7);
  swift_getKeyPath();
  swift_getKeyPath();
  id v17 = v7;
  id v18 = v0;
  sub_18C2CAAD0();
  id v19 = objc_msgSend(v12, sel_whiteColor);
  id v20 = objc_msgSend(self, sel_configurationWithHierarchicalColor_, v19);

  long long v21 = (void *)sub_18C2CA9D0();
  id v22 = objc_msgSend(self, sel_systemImageNamed_, v21);

  v83 = v20;
  id v23 = objc_msgSend(v22, sel_imageByApplyingSymbolConfiguration_, v20);

  sub_18C29B910(0, &qword_1EB67E248);
  sub_18C29B910(0, &qword_1E9170560);
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v82 = v23;
  sub_18C2CAB50();
  long long v25 = (void *)sub_18C2CAB60();
  objc_msgSend(v25, sel_setMaximumContentSizeCategory_, v14, 0, 0, 0, sub_18C29B874, v24);
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, (SEL)&selRef__bestFontForTitle_inMaximumWidth_withMetrics_titleSize_fontAttributes_, v25);
  swift_getKeyPath();
  swift_getKeyPath();
  long long v26 = (char *)v18;
  id v86 = v25;
  sub_18C2CAAD0();
  long long v27 = *(void **)&v26[OBJC_IVAR___PRAmbientEditingTitledViewController_contentViewController];
  objc_msgSend(v27, sel_willMoveToParentViewController_, v26);
  objc_msgSend(v26, sel_addChildViewController_, v27);
  id v28 = objc_msgSend(v27, sel_view);
  if (v28)
  {
    v29 = v28;
    objc_msgSend(v28, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v1, (SEL)&selRef__bestFontForTitle_inMaximumWidth_withMetrics_titleSize_fontAttributes_, v29);
    objc_msgSend(v27, sel_didMoveToParentViewController_, v26);
    objc_msgSend(v27, sel_preferredContentSize);
    double v31 = v30;
    id v32 = objc_msgSend(v29, sel_heightAnchor);
    id v78 = objc_msgSend(v32, sel_constraintEqualToConstant_, v31);

    LODWORD(v33) = 1144750080;
    objc_msgSend(v78, sel_setPriority_, v33);
    id v81 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170568);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_18C2DD0D0;
    v80 = v26;
    id v35 = objc_msgSend(v17, sel_centerXAnchor);
    id v36 = objc_msgSend(v1, sel_centerXAnchor);
    id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

    *(void *)(v34 + 32) = v37;
    id v38 = objc_msgSend(v17, sel_topAnchor);
    id v39 = objc_msgSend(v1, (SEL)&selRef_snapshotOptions + 3);
    id v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v39, 12.0);

    *(void *)(v34 + 40) = v40;
    id v41 = objc_msgSend(v17, sel_trailingAnchor);
    id v42 = objc_msgSend(v86, sel_leadingAnchor);
    id v43 = objc_msgSend(v41, sel_constraintLessThanOrEqualToAnchor_constant_, v42, -8.0);

    *(void *)(v34 + 48) = v43;
    id v44 = objc_msgSend(v17, sel_leadingAnchor);
    id v45 = objc_msgSend(v1, sel_leadingAnchor);
    id v46 = objc_msgSend(v44, sel_constraintGreaterThanOrEqualToSystemSpacingAfterAnchor_multiplier_, v45, 1.0);

    *(void *)(v34 + 56) = v46;
    id v47 = objc_msgSend(v86, sel_topAnchor);
    id v48 = objc_msgSend(v1, sel_topAnchor);
    id v49 = objc_msgSend(v47, sel_constraintEqualToSystemSpacingBelowAnchor_multiplier_, v48, 1.0);

    *(void *)(v34 + 64) = v49;
    id v50 = objc_msgSend(v1, sel_trailingAnchor);
    id v51 = objc_msgSend(v86, sel_trailingAnchor);
    id v52 = objc_msgSend(v50, sel_constraintEqualToSystemSpacingAfterAnchor_multiplier_, v51, 1.0);

    *(void *)(v34 + 72) = v52;
    *(void *)(v34 + 80) = v78;
    id v79 = v78;
    id v53 = objc_msgSend(v29, sel_topAnchor);
    id v54 = objc_msgSend(v17, sel_bottomAnchor);
    id v55 = objc_msgSend(v53, sel_constraintGreaterThanOrEqualToSystemSpacingBelowAnchor_multiplier_, v54, 1.0);

    *(void *)(v34 + 88) = v55;
    id v56 = objc_msgSend(v29, sel_leftAnchor);
    id v57 = objc_msgSend(v1, sel_leftAnchor);
    id v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v57);

    *(void *)(v34 + 96) = v58;
    id v59 = objc_msgSend(v29, sel_rightAnchor);
    id v60 = objc_msgSend(v1, sel_rightAnchor);
    id v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

    *(void *)(v34 + 104) = v61;
    id v62 = objc_msgSend(v29, sel_bottomAnchor);
    id v63 = objc_msgSend(v1, sel_bottomAnchor);
    id v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v63);

    *(void *)(v34 + 112) = v64;
    id v65 = objc_msgSend(v3, sel_leftAnchor);
    id v66 = objc_msgSend(v1, sel_leftAnchor);
    id v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v66);

    *(void *)(v34 + 120) = v67;
    id v68 = objc_msgSend(v3, sel_rightAnchor);
    id v69 = objc_msgSend(v1, sel_rightAnchor);
    id v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_, v69);

    *(void *)(v34 + 128) = v70;
    id v71 = objc_msgSend(v3, sel_bottomAnchor);
    id v72 = objc_msgSend(v1, sel_bottomAnchor);
    id v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v72);

    *(void *)(v34 + 136) = v73;
    id v74 = objc_msgSend(v3, sel_topAnchor);
    id v75 = objc_msgSend(v1, sel_topAnchor);
    id v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

    *(void *)(v34 + 144) = v76;
    sub_18C2CAA90();
    sub_18C29B910(0, &qword_1E9170570);
    v77 = (void *)sub_18C2CAA80();
    swift_bridgeObjectRelease();
    objc_msgSend(v81, sel_activateConstraints_, v77);

    objc_msgSend(v80, sel_setView_, v1);
  }
  else
  {
    sub_18C2CAC50();
    __break(1u);
  }
}

void sub_18C29B398(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x192F91D20](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = v3 + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
    swift_beginAccess();
    id v6 = (void *)MEMORY[0x192F91D20](v5);
    if (v6)
    {
      objc_msgSend(v6, sel_ambientEditingTitledViewControllerWantsToClose_, v4);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id AmbientEditingTitledViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void AmbientEditingTitledViewController.init(nibName:bundle:)()
{
}

id AmbientEditingTitledViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18C29B700@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CAAC0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18C29B77C(void **a1, void **a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_18C2CAAD0();
}

uint64_t sub_18C29B7EC@<X0>(void *a1@<X8>)
{
  return sub_18C29B700(a1);
}

uint64_t sub_18C29B814(void **a1, void **a2)
{
  return sub_18C29B77C(a1, a2);
}

uint64_t sub_18C29B83C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_18C29B874(uint64_t a1)
{
  sub_18C29B398(a1, v1);
}

uint64_t sub_18C29B87C@<X0>(void *a1@<X8>)
{
  return sub_18C29B700(a1);
}

uint64_t sub_18C29B8A4(void **a1, void **a2)
{
  return sub_18C29B77C(a1, a2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_18C29B910(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_18C29B94C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x192F91D20](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18C29B9A4()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18C29B9FC()
{
  return type metadata accessor for AmbientEditingTitledViewController();
}

uint64_t type metadata accessor for AmbientEditingTitledViewController()
{
  uint64_t result = qword_1EB67E210;
  if (!qword_1EB67E210) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_18C29BA50()
{
  sub_18C29BB8C(319, &qword_1EB67E228, &qword_1EB67E220);
  if (v0 <= 0x3F)
  {
    sub_18C29BB8C(319, &qword_1EB67E240, &qword_1EB67E248);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AmbientEditingTitledViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AmbientEditingTitledViewController);
}

uint64_t dispatch thunk of AmbientEditingTitledViewController.__allocating_init(contentViewController:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_18C29BB8C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_18C29B910(255, a3);
    unint64_t v4 = sub_18C2CAAF0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_18C29BBE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_18C29BC0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v2 = sub_18C2CA840();
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v20 = v2;
  MEMORY[0x1F4188790](v2);
  unint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v22 = *v1;
  uint64_t v23 = *((void *)v1 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916C9B8);
  sub_18C2CA920();
  long long v22 = v25;
  sub_18C29C9C0();
  uint64_t v5 = sub_18C2CA880();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  long long v22 = *(long long *)((char *)v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916C9C0);
  sub_18C2CA920();
  sub_18C2CA800();
  uint64_t v10 = sub_18C2CA860();
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  swift_release();
  sub_18C29CA14(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(void *)&long long v22 = v10;
  *((void *)&v22 + 1) = v12;
  LOBYTE(v23) = v14 & 1;
  uint64_t v24 = v16;
  sub_18C2CA810();
  sub_18C2CA8B0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v20);
  sub_18C29CA14(v22, *((uint64_t *)&v22 + 1), v23);
  return swift_bridgeObjectRelease();
}

uint64_t sub_18C29BDFC()
{
  return sub_18C2CA8D0();
}

uint64_t sub_18C29BE18@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29BC0C(a1);
}

uint64_t sub_18C29BE54()
{
  return sub_18C2CAD20();
}

uint64_t sub_18C29BEB4()
{
  return sub_18C2CAD10();
}

uint64_t sub_18C29BEF8()
{
  return sub_18C2CAD20();
}

uint64_t sub_18C29BF54(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 8);
  double v3 = *(double *)(a2 + 8);
  sub_18C29B910(0, qword_1E916C9E0);
  return sub_18C2CAB30() & (v2 == v3);
}

void *sub_18C29BFC0()
{
  uint64_t result = (void *)sub_18C2A9A40(MEMORY[0x1E4FBC860]);
  off_1E916C9D0 = result;
  return result;
}

id VerticalLabel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id VerticalLabel.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VerticalLabel();
  return objc_msgSendSuper2(&v2, sel_init);
}

id VerticalLabel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VerticalLabel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s9PosterKit13VerticalLabelC17maximumTextLength3forSi12CoreGraphics7CGFloatV_tFZ_0(double a1)
{
  id v2 = objc_msgSend(self, sel_pr_fontWithTimeFontIdentifier_forRole_, @"PRTimeFontIdentifierSFPro", @"PRPosterRoleIncomingCall");
  if (!v2) {
    return 0;
  }
  uint64_t v3 = qword_1E916C9D8;
  id v4 = v2;
  if (v3 != -1) {
    goto LABEL_29;
  }
LABEL_3:
  swift_beginAccess();
  uint64_t v5 = off_1E916C9D0;
  if (*((void *)off_1E916C9D0 + 2))
  {
    id v6 = v4;
    unint64_t v7 = sub_18C2AD610((uint64_t)v6, a1);
    if (v8)
    {
      uint64_t v9 = *(void *)(v5[7] + 8 * v7);
      swift_endAccess();

      return (id)v9;
    }
  }
  swift_endAccess();
  while (1)
  {
    swift_beginAccess();
    if (!*((void *)off_1E916C9D0 + 2)) {
      goto LABEL_13;
    }
    id v10 = v4;
    sub_18C2AD610((uint64_t)v10, a1);
    if (v11)
    {
      swift_endAccess();

LABEL_20:
      swift_beginAccess();
      long long v27 = off_1E916C9D0;
      if (*((void *)off_1E916C9D0 + 2))
      {
        id v28 = v4;
        unint64_t v29 = sub_18C2AD610((uint64_t)v28, a1);
        if (v30)
        {
          uint64_t v9 = *(void *)(v27[7] + 8 * v29);
          swift_endAccess();

LABEL_26:
          swift_bridgeObjectRelease();
          return (id)v9;
        }
        swift_endAccess();
      }
      else
      {
        swift_endAccess();
      }
      uint64_t v9 = 0;
      goto LABEL_26;
    }

LABEL_13:
    swift_endAccess();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_18C2CAA20();
    swift_bridgeObjectRelease();
    if (v12 > 9) {
      goto LABEL_20;
    }
    char v13 = self;
    swift_bridgeObjectRetain();
    char v14 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_idealEmphasizedFontSizeForName_usingLayout_, v14, 1);
    double v16 = v15;

    swift_bridgeObjectRetain();
    objc_msgSend(v4, sel_fontWithSize_, v16);
    sub_18C2CA910();
    sub_18C29B910(0, (unint64_t *)&qword_1E916CE30);
    sub_18C2CA910();
    id v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E916C9B0));
    uint64_t v18 = (void *)sub_18C2CA6F0();
    id result = objc_msgSend(v18, sel_view);
    if (!result) {
      break;
    }
    uint64_t v20 = result;
    objc_msgSend(result, sel_setNeedsLayout);

    id result = objc_msgSend(v18, sel_view);
    if (!result) {
      goto LABEL_31;
    }
    uint64_t v21 = result;
    objc_msgSend(result, sel_layoutIfNeeded);

    id v22 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v22, sel_bounds);

    sub_18C2CA6C0();
    if (v23 <= a1)
    {
      sub_18C2CAA30();
    }
    else
    {
      id v24 = v4;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_18C2CAA20();
      swift_bridgeObjectRelease();
      if (__OFSUB__(v25, 1))
      {
        __break(1u);
LABEL_29:
        swift_once();
        goto LABEL_3;
      }
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      double v31 = off_1E916C9D0;
      off_1E916C9D0 = (_UNKNOWN *)0x8000000000000000;
      sub_18C2AED18(v25 - 1, v24, isUniquelyReferenced_nonNull_native, a1);
      off_1E916C9D0 = v31;

      swift_bridgeObjectRelease();
      swift_endAccess();
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for VerticalLabel()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for VerticalLabel.CacheConfig(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for VerticalLabel.CacheConfig(id *a1)
{
}

uint64_t assignWithCopy for VerticalLabel.CacheConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for VerticalLabel.CacheConfig(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalLabel.CacheConfig(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VerticalLabel.CacheConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)id result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)id result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalLabel.CacheConfig()
{
  return &type metadata for VerticalLabel.CacheConfig;
}

uint64_t destroy for VerticalLabelView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for VerticalLabelView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_retain();
  id v5 = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for VerticalLabelView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for VerticalLabelView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalLabelView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VerticalLabelView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalLabelView()
{
  return &type metadata for VerticalLabelView;
}

uint64_t sub_18C29C94C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_18C29C96C()
{
  unint64_t result = qword_1E916C9C8;
  if (!qword_1E916C9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916C9C8);
  }
  return result;
}

unint64_t sub_18C29C9C0()
{
  unint64_t result = qword_1E916CDD8;
  if (!qword_1E916CDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CDD8);
  }
  return result;
}

uint64_t sub_18C29CA14(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_18C29CA24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18C29CA78(uint64_t a1)
{
  return sub_18C29CAC0(a1, qword_1EB67E728);
}

uint64_t sub_18C29CA9C(uint64_t a1)
{
  return sub_18C29CAC0(a1, qword_1EB67E710);
}

uint64_t sub_18C29CAC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_18C2CA4B0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_18C2CA4A0();
}

uint64_t PRRenderingConfiguration.role.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29D214(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role, MEMORY[0x1E4F258A0], a1);
}

uint64_t PRRenderingConfiguration.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role;
  if (qword_1EB67E170 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18C2CA4B0();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB67E728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v4 + v5, v7, v6);
  char v8 = (void *)(v4 + OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory);
  void *v8 = a1;
  v8[1] = a2;
  return v4;
}

uint64_t PRRenderingConfiguration.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role;
  if (qword_1EB67E170 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18C2CA4B0();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB67E728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v2 + v5, v7, v6);
  char v8 = (void *)(v2 + OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory);
  void *v8 = a1;
  v8[1] = a2;
  return v2;
}

id sub_18C29CCF8()
{
  return sub_18C29CF40(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory, (Class *)off_1E54DA260);
}

uint64_t PRRenderingConfiguration.deinit()
{
  return sub_18C29CFB4(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role);
}

uint64_t PRRenderingConfiguration.__deallocating_deinit()
{
  return sub_18C29D044(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role);
}

uint64_t sub_18C29CD34@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29D108(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role, a1);
}

id sub_18C29CD40(uint64_t a1, uint64_t a2)
{
  return sub_18C29D190(a1, a2, &OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory, (Class *)off_1E54DA260);
}

uint64_t PREditingConfiguration.role.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29D214(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role, MEMORY[0x1E4F258A0], a1);
}

uint64_t PREditingConfiguration.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role;
  if (qword_1EB67E168 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18C2CA4B0();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB67E710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v4 + v5, v7, v6);
  char v8 = (void *)(v4 + OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory);
  void *v8 = a1;
  v8[1] = a2;
  return v4;
}

uint64_t PREditingConfiguration.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role;
  if (qword_1EB67E168 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18C2CA4B0();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB67E710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v2 + v5, v7, v6);
  char v8 = (void *)(v2 + OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory);
  void *v8 = a1;
  v8[1] = a2;
  return v2;
}

id sub_18C29CF2C()
{
  return sub_18C29CF40(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory, (Class *)off_1E54D9E50);
}

id sub_18C29CF40(void *a1, Class *a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithDelegate_, (*(uint64_t (**)(void))(v2 + *a1))());
  swift_unknownObjectRelease();
  return v3;
}

uint64_t PREditingConfiguration.deinit()
{
  return sub_18C29CFB4(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role);
}

uint64_t sub_18C29CFB4(void *a1)
{
  uint64_t v2 = v1 + *a1;
  uint64_t v3 = sub_18C2CA4B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  return v1;
}

uint64_t PREditingConfiguration.__deallocating_deinit()
{
  return sub_18C29D044(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role);
}

uint64_t sub_18C29D044(void *a1)
{
  uint64_t v2 = v1 + *a1;
  uint64_t v3 = sub_18C2CA4B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  uint64_t v4 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x1F4186488](v1, v4, v5);
}

uint64_t sub_18C29D0FC@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29D108(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role, a1);
}

uint64_t sub_18C29D108@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2 + *a1;
  uint64_t v5 = sub_18C2CA4B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

id sub_18C29D17C(uint64_t a1, uint64_t a2)
{
  return sub_18C29D190(a1, a2, &OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory, (Class *)off_1E54D9E50);
}

id sub_18C29D190(uint64_t a1, uint64_t a2, void *a3, Class *a4)
{
  id v5 = objc_msgSend(objc_allocWithZone(*a4), sel_initWithDelegate_, (*(uint64_t (**)(void))(*v4 + *a3))());
  swift_unknownObjectRelease();
  return v5;
}

uint64_t PRProviderConfiguration.content.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29D214(&qword_1EB67E750, MEMORY[0x1E4F25898], a1);
}

uint64_t sub_18C29D214@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  return v7(a3, v5, v6);
}

uint64_t PRProviderConfiguration.__allocating_init(updatingDelegate:content:)(uint64_t a1)
{
  swift_allocObject();
  uint64_t v2 = sub_18C29D600(a1);
  swift_unknownObjectRelease();
  swift_release();
  return v2;
}

uint64_t PRProviderConfiguration.init(updatingDelegate:content:)(uint64_t a1)
{
  uint64_t v1 = sub_18C29D600(a1);
  swift_unknownObjectRelease();
  swift_release();
  return v1;
}

uint64_t PRProviderConfiguration.__allocating_init(content:)()
{
  uint64_t v0 = swift_allocObject();
  PRProviderConfiguration.init(content:)();
  return v0;
}

uint64_t PRProviderConfiguration.init(content:)()
{
  uint64_t v1 = sub_18C2CA490();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C2CA480();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + qword_1EB67E750, v4, v1);
  *(void *)(v0 + qword_1EB67E300) = 0;
  return v0;
}

id sub_18C29D4B4(uint64_t a1)
{
  id result = *(id *)(v1 + qword_1EB67E300);
  if (result) {
    return objc_msgSend(result, sel_shouldAcceptConnection_, a1);
  }
  return result;
}

uint64_t PRProviderConfiguration.deinit()
{
  uint64_t v1 = v0 + qword_1EB67E750;
  uint64_t v2 = sub_18C2CA490();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t PRProviderConfiguration.__deallocating_deinit()
{
  PRProviderConfiguration.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

unint64_t sub_18C29D5B4(uint64_t a1)
{
  return (unint64_t)sub_18C29D4B4(a1) & 1;
}

uint64_t sub_18C29D5DC@<X0>(uint64_t a1@<X8>)
{
  return PRProviderConfiguration.content.getter(a1);
}

uint64_t sub_18C29D600(uint64_t a1)
{
  uint64_t v3 = sub_18C2CA490();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_18C2CA480();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1 + qword_1EB67E750, v6, v3);
  id v7 = objc_msgSend(objc_allocWithZone((Class)PRUpdater), sel_initWithDelegate_, a1);
  *(void *)(v1 + qword_1EB67E300) = v7;
  return v1;
}

uint64_t sub_18C29D760(void *a1)
{
  a1[1] = swift_getWitnessTable();
  a1[2] = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  a1[3] = result;
  return result;
}

uint64_t sub_18C29D7E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_18C29D7FC()
{
  return type metadata accessor for PRRenderingConfiguration(0);
}

uint64_t type metadata accessor for PRRenderingConfiguration(uint64_t a1)
{
  return sub_18C29D8A0(a1, qword_1EB67E1A0);
}

uint64_t method lookup function for PRRenderingConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PRRenderingConfiguration);
}

uint64_t dispatch thunk of PRRenderingConfiguration.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PRRenderingConfiguration.sceneDelegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_18C29D878()
{
  return type metadata accessor for PREditingConfiguration(0);
}

uint64_t type metadata accessor for PREditingConfiguration(uint64_t a1)
{
  return sub_18C29D8A0(a1, (uint64_t *)&unk_1EB67E180);
}

uint64_t sub_18C29D8A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18C29D8D8()
{
  uint64_t result = sub_18C2CA4B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PREditingConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PREditingConfiguration);
}

uint64_t dispatch thunk of PREditingConfiguration.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PREditingConfiguration.sceneDelegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_18C29D9C8()
{
  uint64_t result = sub_18C2CA490();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PRProviderConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PRProviderConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PRProviderConfiguration);
}

uint64_t dispatch thunk of PRProviderConfiguration.__allocating_init(updatingDelegate:content:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PRProviderConfiguration.__allocating_init(content:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PRProviderConfiguration.shouldAccept(connection:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void _s13ConfigurationVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t _s13ConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  id v7 = *(void **)(a2 + 56);
  *(void *)(a1 + 56) = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  swift_bridgeObjectRetain();
  id v10 = v4;
  id v11 = v5;
  swift_bridgeObjectRetain();
  id v12 = v7;
  return a1;
}

uint64_t _s13ConfigurationVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  id v7 = *(void **)(a2 + 24);
  long long v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a2 + 56);
  id v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  id v12 = v10;

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t _s13ConfigurationVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  long long v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  long long v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t _s13ConfigurationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 145)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 145) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 145) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s13ConfigurationVMa()
{
  return &_s13ConfigurationVN;
}

uint64_t sub_18C29DE98(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v11[8] = *(_OWORD *)(a1 + 128);
  char v12 = *(unsigned char *)(a1 + 144);
  long long v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  char v14 = *(unsigned char *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_18C29E038((uint64_t)v11, (uint64_t)v13) & 1;
}

uint64_t sub_18C29DF2C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  if (!a2) {
    goto LABEL_7;
  }
  uint64_t v10 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v10 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    swift_bridgeObjectRelease();
LABEL_7:

    sub_18C29E184((uint64_t)v13);
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  id v11 = a4;
  sub_18C2A911C(a1, a2, v11, (uint64_t)&v23);
  v13[0] = a1;
  v13[1] = a2;
  v13[2] = a3;
  v13[3] = v11;
  char v14 = 0;
  uint64_t v15 = v23;
  long long v16 = v24;
  long long v17 = v25;
  long long v18 = v26;
  long long v19 = v27;
  long long v20 = v28;
  long long v21 = v29;
  char v22 = v30;
  nullsub_1(v13);
LABEL_8:
  sub_18C29E1A4((uint64_t)v13, (uint64_t)v31);
  return sub_18C29E1A4((uint64_t)v31, a5);
}

uint64_t sub_18C29E038(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_18C2CACD0(), char v6 = 0, (v5 & 1) != 0))
  {
    sub_18C29E144();
    if ((sub_18C2CAB30() & 1) != 0
      && (sub_18C2CAB30() & 1) != 0
      && ((*(unsigned __int8 *)(a1 + 32) ^ *(unsigned __int8 *)(a2 + 32)) & 1) == 0)
    {
      long long v8 = *(_OWORD *)(a1 + 88);
      long long v9 = *(_OWORD *)(a1 + 120);
      v18[4] = *(_OWORD *)(a1 + 104);
      v19[0] = v9;
      *(_OWORD *)((char *)v19 + 9) = *(_OWORD *)(a1 + 129);
      long long v10 = *(_OWORD *)(a1 + 56);
      v18[0] = *(_OWORD *)(a1 + 40);
      v18[1] = v10;
      v18[2] = *(_OWORD *)(a1 + 72);
      v18[3] = v8;
      long long v11 = *(_OWORD *)(a2 + 56);
      long long v12 = *(_OWORD *)(a2 + 72);
      v16[0] = *(_OWORD *)(a2 + 40);
      v16[1] = v11;
      long long v13 = *(_OWORD *)(a2 + 88);
      long long v14 = *(_OWORD *)(a2 + 104);
      *(_OWORD *)&v17[9] = *(_OWORD *)(a2 + 129);
      long long v15 = *(_OWORD *)(a2 + 120);
      v16[4] = v14;
      *(_OWORD *)long long v17 = v15;
      v16[2] = v12;
      v16[3] = v13;
      char v6 = sub_18C2A984C((uint64_t)v18, (uint64_t)v16);
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6 & 1;
}

unint64_t sub_18C29E144()
{
  unint64_t result = qword_1E916C9E0[0];
  if (!qword_1E916C9E0[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1E916C9E0);
  }
  return result;
}

double sub_18C29E184(uint64_t a1)
{
  *(unsigned char *)(a1 + 144) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_18C29E1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CD40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t sub_18C29E224(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_18C29E22C(unsigned char *result, char a2)
{
  *double result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallTextView.CallState()
{
  return &type metadata for IncomingCallTextView.CallState;
}

uint64_t _s10NameFormatV13NameComponentOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s9PosterKit20IncomingCallTextViewV9CallStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *double result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x18C29E3A4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallTextView.Alignment()
{
  return &type metadata for IncomingCallTextView.Alignment;
}

uint64_t destroy for IncomingCallTextView()
{
  return swift_release();
}

uint64_t _s9PosterKit20IncomingCallTextViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IncomingCallTextView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IncomingCallTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingCallTextView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingCallTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallTextView()
{
  return &type metadata for IncomingCallTextView;
}

uint64_t sub_18C29E564()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_18C29E588(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_18C29E5A0()
{
  return sub_18C2CAD20();
}

uint64_t sub_18C29E5E8()
{
  return sub_18C2CAD00();
}

uint64_t sub_18C29E614()
{
  return sub_18C2CAD20();
}

double sub_18C29E658()
{
  uint64_t v0 = sub_18C2CA840();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v2);
  unsigned int v6 = &v19[-v5];
  swift_retain();
  sub_18C2BA804((uint64_t)v6);
  swift_release();
  sub_18C2CA820();
  char v7 = sub_18C2CA830();
  int v8 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if ((v7 & 1) == 0)
  {
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_18C2CA4E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_1E9171CA0);
    long long v13 = sub_18C2CA4D0();
    os_log_type_t v14 = sub_18C2CAAA0();
    if (os_log_type_enabled(v13, v14))
    {
      long long v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_18C1C4000, v13, v14, "Vertical writing mode is unsupported", v15, 2u);
      MEMORY[0x192F91CB0](v15, -1, -1);
    }

    return 0.0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v21, (uint64_t)v22);
  sub_18C2A68DC((uint64_t)v22, (uint64_t)v23);
  if (sub_18C2A6938((uint64_t)v23) != 1)
  {
    uint64_t v16 = sub_18C2A6944((uint64_t)v23);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    sub_18C2A7C4C((uint64_t)v19, (uint64_t)v20, &qword_1E916CD40);
    sub_18C2A7C4C((uint64_t)v20, (uint64_t)v21, &qword_1E916CD40);
    int v17 = sub_18C2A7154((uint64_t)v21);
    sub_18C2A6B24((uint64_t)v22);
    if (v17 != 1)
    {
      sub_18C2A733C((uint64_t)v20);
      double v10 = *(double *)&v21[17];
      double v11 = *(double *)(v16 + 128);
      return round(round(v10 + v11));
    }
    return 0.0;
  }
  uint64_t v9 = sub_18C2A6944((uint64_t)v23);
  sub_18C2A6B24((uint64_t)v22);
  double v10 = *(double *)(v9 + 136);
  double v11 = *(double *)(v9 + 280);
  return round(round(v10 + v11));
}

uint64_t sub_18C29E9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v47 = a3;
  uint64_t v46 = a1;
  uint64_t v48 = a4;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBA8);
  MEMORY[0x1F4188790](v44);
  uint64_t v39 = (uint64_t)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAF0);
  MEMORY[0x1F4188790](v40);
  uint64_t v42 = (uint64_t)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC38);
  MEMORY[0x1F4188790](v41);
  id v38 = (uint64_t *)((char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB50);
  MEMORY[0x1F4188790](v45);
  id v43 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB10);
  MEMORY[0x1F4188790](v9);
  double v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB40);
  MEMORY[0x1F4188790](v12);
  os_log_type_t v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_18C2CA840();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  long long v19 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  long long v21 = (char *)v37 - v20;
  swift_retain();
  sub_18C2BA804((uint64_t)v21);
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  uint64_t v22 = sub_18C2B89E8(v19);
  LODWORD(v19) = PRPosterTitleLayoutIsVertical(v22);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  if (v19)
  {
    sub_18C29F04C(v46, a2, v47 & 1, (uint64_t)v14);
    uint64_t v23 = &qword_1E916CB40;
    sub_18C2A7B8C((uint64_t)v14, (uint64_t)v11, &qword_1E916CB40);
    swift_storeEnumTagMultiPayload();
    sub_18C2A6C90();
    sub_18C2A6D30();
  }
  else
  {
    char v24 = v47;
    v37[0] = (uint64_t)v11;
    v37[1] = v9;
    uint64_t v25 = v46;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    sub_18C2A68DC((uint64_t)v51, (uint64_t)v49);
    sub_18C2A68DC((uint64_t)v49, (uint64_t)v50);
    int v26 = sub_18C2A6938((uint64_t)v50);
    long long v27 = (const void *)sub_18C2A6944((uint64_t)v50);
    if (v26 == 1)
    {
      memcpy(v51, v27, 0x12BuLL);
      uint64_t v28 = v39;
      sub_18C2A0E9C((uint64_t)v51, v25, a2, v24 & 1, v39);
      long long v29 = &qword_1E916CBA8;
      sub_18C2A7B8C(v28, v42, &qword_1E916CBA8);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7F08(&qword_1E916CC30, &qword_1E916CC38);
      sub_18C2A7510(&qword_1E916CBA0, &qword_1E916CBA8, (void (*)(void))sub_18C2A69A4, (void (*)(void))sub_18C2A6A64);
      os_log_type_t v14 = v43;
      sub_18C2CA7C0();
      sub_18C2A6B24((uint64_t)v49);
      uint64_t v30 = v28;
    }
    else
    {
      sub_18C2A6B24((uint64_t)v49);
      uint64_t v31 = sub_18C2CA6B0();
      int v32 = v24 & 1;
      double v33 = sub_18C29E658();
      uint64_t v34 = (uint64_t)v38;
      uint64_t *v38 = v31;
      *(double *)(v34 + 8) = v33;
      *(unsigned char *)(v34 + 16) = 0;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA98);
      sub_18C2A1CA0(v25, a2, v32, v34 + *(int *)(v35 + 44));
      long long v29 = &qword_1E916CC38;
      sub_18C2A7B8C(v34, v42, &qword_1E916CC38);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7F08(&qword_1E916CC30, &qword_1E916CC38);
      sub_18C2A7510(&qword_1E916CBA0, &qword_1E916CBA8, (void (*)(void))sub_18C2A69A4, (void (*)(void))sub_18C2A6A64);
      os_log_type_t v14 = v43;
      sub_18C2CA7C0();
      uint64_t v30 = v34;
    }
    sub_18C2A7BF0(v30, v29);
    uint64_t v23 = &qword_1E916CB50;
    sub_18C2A7B8C((uint64_t)v14, v37[0], &qword_1E916CB50);
    swift_storeEnumTagMultiPayload();
    sub_18C2A6C90();
    sub_18C2A6D30();
  }
  sub_18C2CA7C0();
  return sub_18C2A7BF0((uint64_t)v14, v23);
}

uint64_t sub_18C29F04C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v42 = a3;
  uint64_t v43 = a1;
  uint64_t v44 = a4;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBA8);
  MEMORY[0x1F4188790](v39);
  id v36 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAF0);
  MEMORY[0x1F4188790](v38);
  id v37 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC38);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB50);
  MEMORY[0x1F4188790](v40);
  double v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705B0);
  MEMORY[0x1F4188790](v12);
  uint64_t v41 = (uint64_t)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC28);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v49, (uint64_t)v48);
  sub_18C2A68DC((uint64_t)v48, (uint64_t)v49);
  if (sub_18C2A6938((uint64_t)v49) == 1)
  {
    v34[0] = v9;
    v34[1] = v12;
    uint64_t v17 = (uint64_t)v36;
    v34[3] = v7;
    uint64_t v35 = v11;
    v34[2] = v14;
    sub_18C2A6944((uint64_t)v49);
    sub_18C2A6B24((uint64_t)v48);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    sub_18C2A68DC((uint64_t)v47, (uint64_t)v45);
    sub_18C2A68DC((uint64_t)v45, (uint64_t)v46);
    int v18 = sub_18C2A6938((uint64_t)v46);
    long long v19 = (const void *)sub_18C2A6944((uint64_t)v46);
    uint64_t v20 = v43;
    uint64_t v21 = v41;
    uint64_t v22 = (uint64_t)v37;
    char v23 = v42;
    if (v18 == 1)
    {
      memcpy(v47, v19, 0x12BuLL);
      sub_18C2A0E9C((uint64_t)v47, v43, a2, v42 & 1, v17);
      char v24 = &qword_1E916CBA8;
      sub_18C2A7B8C(v17, v22, &qword_1E916CBA8);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7F08(&qword_1E916CC30, &qword_1E916CC38);
      sub_18C2A7510(&qword_1E916CBA0, &qword_1E916CBA8, (void (*)(void))sub_18C2A69A4, (void (*)(void))sub_18C2A6A64);
      uint64_t v25 = (uint64_t)v35;
      sub_18C2CA7C0();
      sub_18C2A6B24((uint64_t)v45);
    }
    else
    {
      sub_18C2A6B24((uint64_t)v45);
      uint64_t v30 = sub_18C2CA6B0();
      double v31 = sub_18C29E658();
      uint64_t v17 = v34[0];
      *(void *)v34[0] = v30;
      *(double *)(v17 + 8) = v31;
      *(unsigned char *)(v17 + 16) = 0;
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA98);
      sub_18C2A1CA0(v20, a2, v23 & 1, v17 + *(int *)(v32 + 44));
      char v24 = &qword_1E916CC38;
      sub_18C2A7B8C(v17, v22, &qword_1E916CC38);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7F08(&qword_1E916CC30, &qword_1E916CC38);
      sub_18C2A7510(&qword_1E916CBA0, &qword_1E916CBA8, (void (*)(void))sub_18C2A69A4, (void (*)(void))sub_18C2A6A64);
      uint64_t v25 = (uint64_t)v35;
      sub_18C2CA7C0();
    }
    sub_18C2A7BF0(v17, v24);
    uint64_t v28 = &qword_1E916CB50;
    sub_18C2A7B8C(v25, v21, &qword_1E916CB50);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7F08(&qword_1E916CC20, &qword_1E916CC28);
    sub_18C2A6D30();
    sub_18C2CA7C0();
    uint64_t v29 = v25;
  }
  else
  {
    uint64_t v26 = sub_18C2A6944((uint64_t)v49);
    v47[6] = *(_OWORD *)(v26 + 96);
    v47[7] = *(_OWORD *)(v26 + 112);
    v47[8] = *(_OWORD *)(v26 + 128);
    LOBYTE(v47[9]) = *(unsigned char *)(v26 + 144);
    v47[2] = *(_OWORD *)(v26 + 32);
    v47[3] = *(_OWORD *)(v26 + 48);
    v47[4] = *(_OWORD *)(v26 + 64);
    v47[5] = *(_OWORD *)(v26 + 80);
    v47[0] = *(_OWORD *)v26;
    v47[1] = *(_OWORD *)(v26 + 16);
    *(void *)uint64_t v16 = sub_18C2CA6A0();
    *((void *)v16 + 1) = 0;
    v16[16] = 1;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705B8);
    sub_18C29F748(v43, a2, v42 & 1, (uint64_t)v47, (uint64_t)&v16[*(int *)(v27 + 44)]);
    uint64_t v28 = &qword_1E916CC28;
    sub_18C2A7B8C((uint64_t)v16, v41, &qword_1E916CC28);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7F08(&qword_1E916CC20, &qword_1E916CC28);
    sub_18C2A6D30();
    sub_18C2CA7C0();
    sub_18C2A6B24((uint64_t)v48);
    uint64_t v29 = (uint64_t)v16;
  }
  return sub_18C2A7BF0(v29, v28);
}

uint64_t sub_18C29F748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC0);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  long long v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v24 - v20;
  sub_18C29F930(a1, a2, a3, (uint64_t)&v24 - v20);
  sub_18C2A018C(a4, 0, 0, 1, a2, a3, (uint64_t)v15);
  sub_18C2A7B8C((uint64_t)v21, (uint64_t)v19, &qword_1E916CBC0);
  sub_18C2A7B8C((uint64_t)v15, (uint64_t)v13, &qword_1E916CB30);
  sub_18C2A7B8C((uint64_t)v19, a5, &qword_1E916CBC0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705C0);
  sub_18C2A7B8C((uint64_t)v13, a5 + *(int *)(v22 + 48), &qword_1E916CB30);
  sub_18C2A7BF0((uint64_t)v15, &qword_1E916CB30);
  sub_18C2A7BF0((uint64_t)v21, &qword_1E916CBC0);
  sub_18C2A7BF0((uint64_t)v13, &qword_1E916CB30);
  return sub_18C2A7BF0((uint64_t)v19, &qword_1E916CBC0);
}

uint64_t sub_18C29F930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v54 = a3;
  uint64_t v49 = a1;
  uint64_t v60 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB20);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB18);
  MEMORY[0x1F4188790](v58);
  id v59 = (uint64_t *)((char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB00);
  MEMORY[0x1F4188790](v50);
  uint64_t v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  MEMORY[0x1F4188790](v51);
  uint64_t v48 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v56);
  id v53 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_18C2CA840();
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v45 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBB8);
  MEMORY[0x1F4188790](v18);
  id v57 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A7C4C((uint64_t)&v69, (uint64_t)v68, &qword_1E916CD40);
  sub_18C2A7C4C((uint64_t)v68, (uint64_t)&v69, &qword_1E916CD40);
  if (sub_18C2A7154((uint64_t)&v69) == 1) {
    goto LABEL_4;
  }
  uint64_t v45 = v18;
  uint64_t v46 = v5;
  int v47 = v7;
  v66[6] = v75;
  v66[7] = v76;
  v66[8] = v77;
  char v67 = v78;
  v66[2] = v71;
  v66[3] = v72;
  v66[4] = v73;
  v66[5] = v74;
  v66[0] = v69;
  v66[1] = v70;
  if (v71)
  {
    sub_18C2A733C((uint64_t)v68);
LABEL_4:
    swift_storeEnumTagMultiPayload();
    sub_18C2A7510(&qword_1E916CBB0, &qword_1E916CBB8, (void (*)(void))sub_18C2A7598, (void (*)(void))sub_18C2A76F0);
    return sub_18C2CA7C0();
  }
  swift_retain();
  sub_18C2BA804((uint64_t)v17);
  swift_release();
  uint64_t v21 = v55;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v15, v17, v12);
  uint64_t v22 = sub_18C2B89E8(v15);
  BOOL IsVertical = PRPosterTitleLayoutIsVertical(v22);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v12);
  if (IsVertical)
  {
    uint64_t v24 = (void *)sub_18C2CA9D0();
    int IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();

    if (IsSuitableForVerticalLayout)
    {
      uint64_t v26 = v48;
      sub_18C2A018C((uint64_t)v66, 0, 0, 1, a2, v54 & 1, v48);
      sub_18C2A7B8C(v26, v52, &qword_1E916CB30);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7614();
      uint64_t v27 = (uint64_t)v53;
      sub_18C2CA7C0();
      sub_18C2A7BF0(v26, &qword_1E916CB30);
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      sub_18C2A7614();
      uint64_t v27 = (uint64_t)v53;
      sub_18C2CA7C0();
    }
    uint64_t v36 = (uint64_t)v47;
    uint64_t v37 = (uint64_t)v57;
    sub_18C2A7B8C(v27, (uint64_t)v59, &qword_1E916CB80);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAA8);
    sub_18C2A7598();
    sub_18C2A76F0();
    sub_18C2CA7C0();
    sub_18C2A7BF0(v27, &qword_1E916CB80);
  }
  else
  {
    long long v28 = v69;
    long long v29 = v70;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    id v30 = *((id *)&v29 + 1);
    swift_bridgeObjectRetain();
    id v31 = (id)v29;
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    char v32 = v61;
    id v33 = v30;
    swift_bridgeObjectRetain();
    id v34 = v31;
    if (v54) {
      uint64_t v35 = (void *)sub_18C2A6210(v28, *((unint64_t *)&v28 + 1));
    }
    else {
      uint64_t v35 = 0;
    }
    id v38 = v35;
    id v39 = v33;

    swift_bridgeObjectRelease();
    objc_msgSend(self, sel_maximumHorizontalTextBounds, v45, v46);
    CGRectGetWidth(v79);
    sub_18C2CA930();
    sub_18C2CA590();
    uint64_t v40 = v61;
    char v41 = v62;
    uint64_t v42 = v63;
    char v43 = v64;
    uint64_t v44 = v59;
    *id v59 = v39;
    v44[1] = 0x3FF0000000000000;
    *((_OWORD *)v44 + 1) = v28;
    v44[4] = v34;
    v44[5] = v35;
    *((unsigned char *)v44 + 48) = v32;
    *((unsigned char *)v44 + 49) = 1;
    v44[7] = v40;
    *((unsigned char *)v44 + 64) = v41;
    v44[9] = v42;
    *((unsigned char *)v44 + 80) = v43;
    *(_OWORD *)(v44 + 11) = v65;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAA8);
    sub_18C2A7598();
    sub_18C2A76F0();
    uint64_t v37 = (uint64_t)v57;
    sub_18C2CA7C0();
    uint64_t v36 = (uint64_t)v47;
  }
  sub_18C2A7B8C(v37, v36, &qword_1E916CBB8);
  swift_storeEnumTagMultiPayload();
  sub_18C2A7510(&qword_1E916CBB0, &qword_1E916CBB8, (void (*)(void))sub_18C2A7598, (void (*)(void))sub_18C2A76F0);
  sub_18C2CA7C0();
  sub_18C2A733C((uint64_t)v68);
  return sub_18C2A7BF0(v37, &qword_1E916CBB8);
}

uint64_t sub_18C2A018C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X5>, char a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v114 = a3;
  uint64_t v10 = a1;
  uint64_t v122 = a7;
  long long v11 = *(_OWORD *)(a1 + 112);
  long long v155 = *(_OWORD *)(a1 + 96);
  long long v156 = v11;
  int v113 = a4 & 1;
  long long v157 = *(_OWORD *)(a1 + 128);
  char v158 = *(unsigned char *)(a1 + 144);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v151 = *(_OWORD *)(a1 + 32);
  long long v152 = v12;
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v153 = *(_OWORD *)(a1 + 64);
  long long v154 = v13;
  long long v14 = *(_OWORD *)(a1 + 16);
  long long v149 = *(_OWORD *)a1;
  long long v150 = v14;
  uint64_t v15 = sub_18C2CA670();
  uint64_t v101 = *(void *)(v15 - 8);
  uint64_t v102 = v15;
  MEMORY[0x1F4188790](v15);
  v100 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705C8);
  uint64_t v104 = *(void *)(v121 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v121);
  v99 = (char *)&v99 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  v103 = (char *)&v99 - v19;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705D0);
  MEMORY[0x1F4188790](v118);
  v120 = (char *)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAE8);
  MEMORY[0x1F4188790](v119);
  uint64_t v106 = (uint64_t)&v99 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_18C2CA840();
  uint64_t v22 = *(void *)(v124 - 8);
  MEMORY[0x1F4188790](v124);
  uint64_t v123 = (uint64_t)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705D8);
  uint64_t v110 = *(void *)(v24 - 8);
  uint64_t v111 = v24;
  MEMORY[0x1F4188790](v24);
  v125 = (char *)&v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAB8);
  MEMORY[0x1F4188790](v107);
  v109 = (char *)&v99 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAC8);
  MEMORY[0x1F4188790](v108);
  uint64_t v112 = (uint64_t)&v99 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAD8);
  MEMORY[0x1F4188790](v127);
  uint64_t v128 = (uint64_t)&v99 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_18C2CA390();
  MEMORY[0x1F4188790](v29 - 8);
  if (a6)
  {
    sub_18C2A5770(*(void *)v10, *(void *)(v10 + 8));
    uint64_t v30 = sub_18C2CA870();
  }
  else
  {
    uint64_t v34 = *(void *)(v10 + 8);
    uint64_t v131 = *(void *)v10;
    uint64_t v132 = v34;
    sub_18C29C9C0();
    v116 = a2;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_18C2CA880();
    uint64_t v37 = v36;
    uint64_t v115 = v38;
    char v40 = v39 & 1;
    uint64_t v131 = MEMORY[0x192F905F0](*(id *)(v10 + 16));
    uint64_t v41 = sub_18C2CA850();
    uint64_t v117 = a5;
    uint64_t v126 = v41;
    uint64_t v43 = v42;
    uint64_t v44 = v10;
    int v46 = v45;
    uint64_t v47 = v22;
    uint64_t v49 = v48;
    uint64_t v50 = v37;
    a2 = v116;
    sub_18C29CA14(v35, v50, v40);
    swift_release();
    swift_bridgeObjectRelease();
    int v32 = v46;
    uint64_t v10 = v44;
    uint64_t v31 = v43;
    uint64_t v30 = v126;
    uint64_t v33 = v49;
    uint64_t v22 = v47;
  }
  uint64_t v126 = v30;
  uint64_t v131 = v30;
  uint64_t v132 = v31;
  v116 = (void *)v31;
  uint64_t v117 = v33;
  LODWORD(v115) = v32;
  char v133 = v32 & 1;
  uint64_t v134 = v33;
  swift_retain();
  uint64_t v51 = v123;
  sub_18C2BA804(v123);
  swift_release();
  sub_18C2CA8B0();
  uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v52(v51, v124);
  uint64_t v105 = v22 + 8;
  if (!a2) {
    id v53 = *(id *)(v10 + 24);
  }
  id v54 = a2;
  uint64_t v55 = sub_18C2CA800();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v57 = (uint64_t)v109;
  uint64_t v58 = v110;
  id v59 = v125;
  uint64_t v60 = v111;
  (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v109, v125, v111);
  uint64_t v61 = (uint64_t *)(v57 + *(int *)(v107 + 36));
  *uint64_t v61 = KeyPath;
  v61[1] = v55;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
  uint64_t v62 = swift_getKeyPath();
  uint64_t v63 = v112;
  sub_18C2A7B8C(v57, v112, &qword_1E916CAB8);
  uint64_t v64 = v63 + *(int *)(v108 + 36);
  *(void *)uint64_t v64 = v62;
  *(void *)(v64 + 8) = 1;
  *(unsigned char *)(v64 + 16) = 0;
  sub_18C2A7BF0(v57, &qword_1E916CAB8);
  sub_18C2CA930();
  sub_18C2CA590();
  uint64_t v65 = v128;
  sub_18C2A7B8C(v63, v128, &qword_1E916CAC8);
  id v66 = (_OWORD *)(v65 + *(int *)(v127 + 36));
  long long v67 = v146[11];
  *id v66 = v146[10];
  v66[1] = v67;
  v66[2] = v146[12];
  sub_18C2A7BF0(v63, &qword_1E916CAC8);
  swift_retain();
  LOBYTE(v62) = sub_18C2BA400();
  swift_release();
  if ((v62 & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v68 = *(void *)v10;
  uint64_t v69 = *(void *)(v10 + 8);
  long long v70 = (void *)sub_18C2CA9D0();
  int IsSuitableForArabicJustification = CTStringIsSuitableForArabicJustification();

  if (!IsSuitableForArabicJustification) {
    goto LABEL_21;
  }
  objc_msgSend(self, sel_maximumHorizontalTextBounds);
  double Width = CGRectGetWidth(v159);
  long long v73 = *(_OWORD *)(v10 + 88);
  long long v74 = *(_OWORD *)(v10 + 120);
  v147[4] = *(_OWORD *)(v10 + 104);
  v148[0] = v74;
  *(_OWORD *)((char *)v148 + 9) = *(_OWORD *)(v10 + 129);
  long long v75 = *(_OWORD *)(v10 + 56);
  v147[0] = *(_OWORD *)(v10 + 40);
  v147[1] = v75;
  long long v76 = *(_OWORD *)(v10 + 72);
  v147[3] = v73;
  v147[2] = v76;
  uint64_t v77 = v123;
  sub_18C2CA820();
  sub_18C2A83E0(v77, 1.0);
  double v79 = v78;
  v52(v77, v124);
  if (v79 >= Width) {
    goto LABEL_21;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A7C4C((uint64_t)&v131, (uint64_t)v145, &qword_1E916CD40);
  sub_18C2A7C4C((uint64_t)v145, (uint64_t)v146, &qword_1E916CD40);
  if (sub_18C2A7154((uint64_t)v146) != 1)
  {
    sub_18C2A7C4C((uint64_t)v145, (uint64_t)&v131, &qword_1E916CD40);
    if ((v68 != v131 || v69 != v132) && (sub_18C2CACD0() & 1) == 0)
    {
      sub_18C2A733C((uint64_t)v145);
      goto LABEL_19;
    }
    sub_18C29B910(0, qword_1E916C9E0);
    sub_18C2A716C((void *)v10);
    sub_18C2A716C((void *)v10);
    if (sub_18C2CAB30() & 1) == 0 || (sub_18C2CAB30() & 1) == 0 || ((v135 ^ *(unsigned __int8 *)(v10 + 32)))
    {
      sub_18C2A733C((uint64_t)v145);
      sub_18C2A73A0(v10);
      sub_18C2A73A0(v10);
      goto LABEL_19;
    }
    *(_OWORD *)((char *)v129 + 8) = v137;
    *(_OWORD *)((char *)&v129[1] + 8) = v138;
    *(_OWORD *)((char *)&v129[2] + 8) = v139;
    *(_OWORD *)((char *)&v129[3] + 8) = v140;
    *(_OWORD *)((char *)&v129[4] + 8) = v141;
    *(void *)&v129[0] = v136;
    *(_OWORD *)((char *)&v129[5] + 8) = v142;
    BYTE8(v129[6]) = v143;
    char v89 = sub_18C2A984C((uint64_t)v147, (uint64_t)v129);
    sub_18C2A733C((uint64_t)v145);
    sub_18C2A73A0(v10);
    sub_18C2A73A0(v10);
    if ((v89 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_21:
    objc_msgSend(self, sel_minimumScaleFactor);
    uint64_t v91 = v90;
    uint64_t v92 = swift_getKeyPath();
    uint64_t v93 = v128;
    uint64_t v94 = v106;
    sub_18C2A7B8C(v128, v106, &qword_1E916CAD8);
    uint64_t v95 = (uint64_t)v120;
    v96 = (uint64_t *)(v94 + *(int *)(v119 + 36));
    uint64_t *v96 = v92;
    v96[1] = v91;
    sub_18C2A7B8C(v94, v95, &qword_1E916CAE8);
    swift_storeEnumTagMultiPayload();
    sub_18C2A6F18();
    uint64_t v97 = sub_18C2A7718(&qword_1E916CAD0, &qword_1E916CAD8, (void (*)(void))sub_18C2A6FDC);
    uint64_t v131 = v127;
    uint64_t v132 = v97;
    swift_getOpaqueTypeConformance2();
    sub_18C2CA7C0();
    sub_18C29CA14(v126, (uint64_t)v116, v115 & 1);
    swift_bridgeObjectRelease();
    sub_18C2A7BF0(v94, &qword_1E916CAE8);
    uint64_t v88 = v93;
    return sub_18C2A7BF0(v88, &qword_1E916CAD8);
  }
  v129[6] = v155;
  v129[7] = v156;
  v129[8] = v157;
  char v130 = v158;
  v129[2] = v151;
  v129[3] = v152;
  v129[4] = v153;
  v129[5] = v154;
  v129[0] = v149;
  v129[1] = v150;
  nullsub_1(v129);
  sub_18C2A7C4C((uint64_t)v129, (uint64_t)&v131, &qword_1E916CD40);
  sub_18C2A7C4C((uint64_t)v145, (uint64_t)&v144, &qword_1E916CD40);
  sub_18C2A716C((void *)v10);
  sub_18C2A71C4((uint64_t)&v131);
LABEL_19:
  v80 = v100;
  sub_18C2CA660();
  uint64_t v81 = sub_18C2A7718(&qword_1E916CAD0, &qword_1E916CAD8, (void (*)(void))sub_18C2A6FDC);
  id v82 = v99;
  uint64_t v83 = v127;
  uint64_t v84 = v128;
  sub_18C2CA8C0();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v80, v102);
  id v86 = v103;
  uint64_t v85 = v104;
  uint64_t v87 = v121;
  (*(void (**)(char *, char *, uint64_t))(v104 + 32))(v103, v82, v121);
  (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v120, v86, v87);
  swift_storeEnumTagMultiPayload();
  sub_18C2A6F18();
  uint64_t v131 = v83;
  uint64_t v132 = v81;
  swift_getOpaqueTypeConformance2();
  sub_18C2CA7C0();
  sub_18C29CA14(v126, (uint64_t)v116, v115 & 1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v87);
  uint64_t v88 = v84;
  return sub_18C2A7BF0(v88, &qword_1E916CAD8);
}

uint64_t sub_18C2A0E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v56 = a4;
  uint64_t v57 = a2;
  uint64_t v58 = a3;
  uint64_t v63 = a5;
  uint64_t v6 = a1 + 297;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC58);
  MEMORY[0x1F4188790](v54);
  uint64_t v50 = (uint64_t *)((char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170600);
  MEMORY[0x1F4188790](v52);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB60);
  MEMORY[0x1F4188790](v62);
  uint64_t v55 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC48);
  MEMORY[0x1F4188790](v53);
  long long v12 = (uint64_t *)((char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC78);
  MEMORY[0x1F4188790](v51);
  long long v14 = (uint64_t *)((char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170608);
  MEMORY[0x1F4188790](v59);
  uint64_t v61 = (uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170610);
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB70);
  MEMORY[0x1F4188790](v60);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC68);
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (uint64_t *)((char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((*(unsigned char *)(a1 + 297) & 1) == 0)
  {
    if (*(unsigned char *)(v6 + 1))
    {
      sub_18C2A17C8(a1, v57, v58, v56 & 1, &qword_1E9170680, &qword_1E9170688, &qword_1E9170690, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))sub_18C2A3ABC, v14, &qword_1E9170698);
      uint64_t v37 = &qword_1E916CC78;
      sub_18C2A7B8C((uint64_t)v14, (uint64_t)v18, &qword_1E916CC78);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7F08(&qword_1E916CC60, &qword_1E916CC68);
      sub_18C2A7F08(&qword_1E916CC70, &qword_1E916CC78);
      sub_18C2CA7C0();
      sub_18C2A7B8C((uint64_t)v20, v61, &qword_1E916CB70);
      swift_storeEnumTagMultiPayload();
      sub_18C2A69A4();
      sub_18C2A6A64();
      sub_18C2CA7C0();
      sub_18C2A7BF0((uint64_t)v20, &qword_1E916CB70);
      uint64_t v35 = (uint64_t)v14;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v39 = v58;
      swift_retain();
      sub_18C2CA530();
      swift_release();
      swift_release();
      swift_release();
      int v40 = v64;
      objc_msgSend(*(id *)(a1 + 176), sel_pointSize);
      double v42 = v41;
      objc_msgSend(*(id *)(a1 + 24), sel_pointSize);
      double v44 = v42 / v43;
      uint64_t v45 = sub_18C2CA6B0();
      uint64_t v46 = sub_18C2CA680();
      uint64_t *v23 = v45;
      v23[1] = v46;
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170620);
      sub_18C2A42B8(v57, v39, v56 & 1, v40, (uint64_t)v23 + *(int *)(v47 + 44), v44);
      uint64_t v37 = &qword_1E916CC68;
      sub_18C2A7B8C((uint64_t)v23, (uint64_t)v18, &qword_1E916CC68);
      swift_storeEnumTagMultiPayload();
      sub_18C2A7F08(&qword_1E916CC60, &qword_1E916CC68);
      sub_18C2A7F08(&qword_1E916CC70, &qword_1E916CC78);
      sub_18C2CA7C0();
      sub_18C2A7B8C((uint64_t)v20, v61, &qword_1E916CB70);
      swift_storeEnumTagMultiPayload();
      sub_18C2A69A4();
      sub_18C2A6A64();
      sub_18C2CA7C0();
      sub_18C2A7BF0((uint64_t)v20, &qword_1E916CB70);
      uint64_t v35 = (uint64_t)v23;
    }
    goto LABEL_8;
  }
  if ((*(unsigned char *)(v6 + 1) & 1) == 0)
  {
    sub_18C2A17C8(a1, v57, v58, v56 & 1, &qword_1E91706E0, &qword_1E91706E8, &qword_1E91706F0, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))sub_18C2A2B98, v12, &qword_1E91706F8);
    uint64_t v37 = &qword_1E916CC48;
    sub_18C2A7B8C((uint64_t)v12, (uint64_t)v9, &qword_1E916CC48);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7F08(&qword_1E916CC40, &qword_1E916CC48);
    sub_18C2A7F08(&qword_1E916CC50, &qword_1E916CC58);
    uint64_t v38 = (uint64_t)v55;
    sub_18C2CA7C0();
    sub_18C2A7B8C(v38, v61, &qword_1E916CB60);
    swift_storeEnumTagMultiPayload();
    sub_18C2A69A4();
    sub_18C2A6A64();
    sub_18C2CA7C0();
    sub_18C2A7BF0(v38, &qword_1E916CB60);
    uint64_t v35 = (uint64_t)v12;
LABEL_8:
    uint64_t v36 = v37;
    return sub_18C2A7BF0(v35, v36);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v24 = v58;
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  int v25 = v65;
  objc_msgSend(*(id *)(a1 + 24), sel_pointSize);
  double v27 = v26;
  objc_msgSend(*(id *)(a1 + 176), sel_pointSize);
  double v29 = v27 / v28;
  uint64_t v30 = sub_18C2CA6B0();
  uint64_t v31 = sub_18C2CA680();
  uint64_t v32 = (uint64_t)v50;
  *uint64_t v50 = v30;
  *(void *)(v32 + 8) = v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170618);
  sub_18C2A4C34(v57, v24, v56 & 1, v25, v32 + *(int *)(v33 + 44), v29);
  sub_18C2A7B8C(v32, (uint64_t)v9, &qword_1E916CC58);
  swift_storeEnumTagMultiPayload();
  sub_18C2A7F08(&qword_1E916CC40, &qword_1E916CC48);
  sub_18C2A7F08(&qword_1E916CC50, &qword_1E916CC58);
  uint64_t v34 = (uint64_t)v55;
  sub_18C2CA7C0();
  sub_18C2A7B8C(v34, v61, &qword_1E916CB60);
  swift_storeEnumTagMultiPayload();
  sub_18C2A69A4();
  sub_18C2A6A64();
  sub_18C2CA7C0();
  sub_18C2A7BF0(v34, &qword_1E916CB60);
  uint64_t v35 = v32;
  uint64_t v36 = &qword_1E916CC58;
  return sub_18C2A7BF0(v35, v36);
}

void sub_18C2A17C8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t *a7@<X6>, void (*a8)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double)@<X7>, uint64_t *a9@<X8>, uint64_t *a10)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  uint64_t v91 = a3;
  swift_release();
  swift_release();
  swift_release();
  unsigned int v12 = LOBYTE(v153[0]);
  char v13 = *(unsigned char *)(a1 + 297);
  if (v13)
  {
    long long v14 = *(_OWORD *)(a1 + 112);
    long long v158 = *(_OWORD *)(a1 + 96);
    long long v159 = v14;
    long long v160 = *(_OWORD *)(a1 + 128);
    char v161 = *(unsigned char *)(a1 + 144);
    long long v15 = *(_OWORD *)(a1 + 48);
    long long v154 = *(_OWORD *)(a1 + 32);
    long long v155 = v15;
    long long v16 = *(_OWORD *)(a1 + 80);
    long long v156 = *(_OWORD *)(a1 + 64);
    long long v157 = v16;
    long long v17 = *(_OWORD *)(a1 + 16);
    v153[0] = *(_OWORD *)a1;
    v153[1] = v17;
  }
  else
  {
    long long v18 = *(_OWORD *)(a1 + 248);
    long long v19 = *(_OWORD *)(a1 + 200);
    long long v154 = *(_OWORD *)(a1 + 184);
    long long v155 = v19;
    long long v20 = *(_OWORD *)(a1 + 232);
    long long v156 = *(_OWORD *)(a1 + 216);
    long long v157 = v20;
    long long v21 = *(_OWORD *)(a1 + 168);
    v153[0] = *(_OWORD *)(a1 + 152);
    v153[1] = v21;
    long long v22 = *(_OWORD *)(a1 + 264);
    long long v23 = *(_OWORD *)(a1 + 280);
    long long v158 = v18;
    long long v159 = v22;
    char v161 = *(unsigned char *)(a1 + 296);
    long long v160 = v23;
  }
  uint64_t v24 = *((void *)&v154 + 1);
  long long v87 = v158;
  long long v90 = v157;
  unint64_t v26 = *((void *)&v160 + 1);
  unint64_t v25 = v160;
  char v27 = v154;
  double v28 = (void *)*((void *)&v153[1] + 1);
  uint64_t v29 = *(void *)&v153[0];
  char v30 = v161 & 1;
  long long v81 = v156;
  long long v84 = v159;
  long long v75 = *(_OWORD *)((char *)v153 + 8);
  long long v78 = v155;
  sub_18C2A716C(v153);
  long long v124 = v75;
  uint64_t v123 = v29;
  v125 = v28;
  char v126 = v27;
  uint64_t v127 = v24;
  long long v128 = v78;
  long long v129 = v81;
  long long v130 = v90;
  long long v131 = v87;
  long long v132 = v84;
  unsigned long long v133 = __PAIR128__(v26, v25);
  char v134 = v30;
  id v31 = v28;
  sub_18C2A73A0((uint64_t)&v123);
  objc_msgSend(v31, sel_pointSize);
  double v33 = v32;

  if (v13)
  {
    long long v34 = *(_OWORD *)(a1 + 248);
    long long v35 = *(_OWORD *)(a1 + 200);
    long long v145 = *(_OWORD *)(a1 + 184);
    long long v146 = v35;
    long long v36 = *(_OWORD *)(a1 + 232);
    long long v147 = *(_OWORD *)(a1 + 216);
    long long v148 = v36;
    long long v37 = *(_OWORD *)(a1 + 168);
    v144[0] = *(_OWORD *)(a1 + 152);
    v144[1] = v37;
    long long v38 = *(_OWORD *)(a1 + 264);
    long long v39 = *(_OWORD *)(a1 + 280);
    long long v149 = v34;
    long long v150 = v38;
    char v152 = *(unsigned char *)(a1 + 296);
    long long v151 = v39;
  }
  else
  {
    long long v40 = *(_OWORD *)(a1 + 112);
    long long v149 = *(_OWORD *)(a1 + 96);
    long long v150 = v40;
    long long v151 = *(_OWORD *)(a1 + 128);
    char v152 = *(unsigned char *)(a1 + 144);
    long long v41 = *(_OWORD *)(a1 + 48);
    long long v145 = *(_OWORD *)(a1 + 32);
    long long v146 = v41;
    long long v42 = *(_OWORD *)(a1 + 80);
    long long v147 = *(_OWORD *)(a1 + 64);
    long long v148 = v42;
    long long v43 = *(_OWORD *)(a1 + 16);
    v144[0] = *(_OWORD *)a1;
    v144[1] = v43;
  }
  uint64_t v44 = *((void *)&v145 + 1);
  long long v85 = v149;
  long long v88 = v148;
  long long v45 = v151;
  char v46 = v145;
  uint64_t v47 = (void *)*((void *)&v144[1] + 1);
  uint64_t v48 = *(void *)&v144[0];
  char v49 = v152 & 1;
  long long v79 = v147;
  long long v82 = v150;
  long long v73 = *(_OWORD *)((char *)v144 + 8);
  long long v76 = v146;
  sub_18C2A716C(v144);
  long long v112 = v73;
  uint64_t v111 = v48;
  int v113 = v47;
  char v114 = v46;
  uint64_t v115 = v44;
  long long v116 = v76;
  long long v117 = v79;
  long long v118 = v88;
  long long v119 = v85;
  long long v120 = v82;
  long long v121 = v45;
  char v122 = v49;
  id v50 = v47;
  sub_18C2A73A0((uint64_t)&v111);
  objc_msgSend(v50, sel_pointSize);
  double v52 = v51;

  if (!v12)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_11:
    long long v59 = *(_OWORD *)(a1 + 112);
    long long v140 = *(_OWORD *)(a1 + 96);
    long long v141 = v59;
    long long v142 = *(_OWORD *)(a1 + 128);
    char v143 = *(unsigned char *)(a1 + 144);
    long long v60 = *(_OWORD *)(a1 + 48);
    long long v136 = *(_OWORD *)(a1 + 32);
    long long v137 = v60;
    long long v61 = *(_OWORD *)(a1 + 80);
    long long v138 = *(_OWORD *)(a1 + 64);
    long long v139 = v61;
    long long v62 = *(_OWORD *)(a1 + 16);
    v135[0] = *(_OWORD *)a1;
    v135[1] = v62;
    goto LABEL_12;
  }
  if ((v13 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  long long v53 = *(_OWORD *)(a1 + 248);
  long long v54 = *(_OWORD *)(a1 + 200);
  long long v136 = *(_OWORD *)(a1 + 184);
  long long v137 = v54;
  long long v55 = *(_OWORD *)(a1 + 232);
  long long v138 = *(_OWORD *)(a1 + 216);
  long long v139 = v55;
  long long v56 = *(_OWORD *)(a1 + 168);
  v135[0] = *(_OWORD *)(a1 + 152);
  v135[1] = v56;
  long long v57 = *(_OWORD *)(a1 + 264);
  long long v58 = *(_OWORD *)(a1 + 280);
  long long v140 = v53;
  long long v141 = v57;
  char v143 = *(unsigned char *)(a1 + 296);
  long long v142 = v58;
LABEL_12:
  uint64_t v63 = *((void *)&v136 + 1);
  long long v86 = v140;
  long long v89 = v139;
  long long v64 = v142;
  char v65 = v136;
  id v66 = (void *)*((void *)&v135[1] + 1);
  uint64_t v67 = *(void *)&v135[0];
  char v68 = v143 & 1;
  long long v80 = v138;
  long long v83 = v141;
  long long v74 = *(_OWORD *)((char *)v135 + 8);
  long long v77 = v137;
  sub_18C2A716C(v135);
  uint64_t v99 = v67;
  long long v100 = v74;
  uint64_t v101 = v66;
  char v102 = v65;
  uint64_t v103 = v63;
  long long v104 = v77;
  long long v105 = v80;
  long long v106 = v89;
  long long v107 = v86;
  long long v108 = v83;
  long long v109 = v64;
  char v110 = v68;
  id v69 = v66;
  sub_18C2A73A0((uint64_t)&v99);
  uint64_t v70 = sub_18C2CA6B0();
  uint64_t v71 = sub_18C2CA680();
  *a9 = v70;
  a9[1] = v71;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_18C2A3628(a2, v91, a4 & 1, v12, a1, (uint64_t)v69, a6, a7, (uint64_t)a9 + *(int *)(v72 + 44), v33 / v52, a8, a10);
}

uint64_t sub_18C2A1CA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v95 = a3;
  uint64_t v94 = (char *)a1;
  uint64_t v97 = a4;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC88);
  MEMORY[0x1F4188790](v98);
  uint64_t v91 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v88 = (uint64_t)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  long long v87 = (char *)&v83 - v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  long long v90 = (char *)&v83 - v12;
  MEMORY[0x1F4188790](v11);
  long long v89 = (char *)&v83 - v13;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAF8);
  MEMORY[0x1F4188790](v92);
  uint64_t v93 = (uint64_t)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC98);
  MEMORY[0x1F4188790](v96);
  long long v86 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB08);
  MEMORY[0x1F4188790](v84);
  long long v85 = (uint64_t *)((char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  MEMORY[0x1F4188790](v17);
  long long v19 = (char *)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB88);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  long long v23 = (char *)&v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  unint64_t v25 = (char *)&v83 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC0);
  uint64_t v27 = MEMORY[0x1F4188790](v26 - 8);
  uint64_t v29 = (char *)&v83 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  id v31 = (char *)&v83 - v30;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v107, (uint64_t)v106);
  sub_18C2A68DC((uint64_t)v106, (uint64_t)v107);
  int v32 = sub_18C2A6938((uint64_t)v107);
  uint64_t v33 = sub_18C2A6944((uint64_t)v107);
  if (v32 == 1)
  {
    sub_18C2A6B24((uint64_t)v106);
    char v34 = v95 & 1;
    uint64_t v35 = (uint64_t)v89;
    uint64_t v36 = (uint64_t)v94;
    sub_18C2A2650((uint64_t)v94, a2, v95 & 1);
    uint64_t v37 = (uint64_t)v90;
    sub_18C2A28EC(v36, a2, v34);
    long long v38 = &qword_1E916CB80;
    uint64_t v39 = (uint64_t)v87;
    sub_18C2A7B8C(v35, (uint64_t)v87, &qword_1E916CB80);
    uint64_t v40 = v88;
    sub_18C2A7B8C(v37, v88, &qword_1E916CB80);
    uint64_t v41 = (uint64_t)v91;
    sub_18C2A7B8C(v39, (uint64_t)v91, &qword_1E916CB80);
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705F8);
    sub_18C2A7B8C(v40, v41 + *(int *)(v42 + 48), &qword_1E916CB80);
    sub_18C2A7BF0(v40, &qword_1E916CB80);
    sub_18C2A7BF0(v39, &qword_1E916CB80);
    sub_18C2A7B8C(v41, v93, &qword_1E916CC88);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7F08(&qword_1E916CC90, &qword_1E916CC98);
    sub_18C2A7F08(&qword_1E916CC80, &qword_1E916CC88);
    sub_18C2CA7C0();
    sub_18C2A7BF0(v41, &qword_1E916CC88);
    uint64_t v43 = v37;
    uint64_t v44 = &qword_1E916CB80;
  }
  else
  {
    long long v45 = (uint64_t *)v33;
    long long v87 = v19;
    uint64_t v88 = v17;
    long long v89 = v29;
    long long v90 = v23;
    uint64_t v91 = v25;
    long long v46 = *(_OWORD *)(v33 + 112);
    v104[6] = *(_OWORD *)(v33 + 96);
    v104[7] = v46;
    v104[8] = *(_OWORD *)(v33 + 128);
    char v105 = *(unsigned char *)(v33 + 144);
    long long v47 = *(_OWORD *)(v33 + 48);
    v104[2] = *(_OWORD *)(v33 + 32);
    v104[3] = v47;
    long long v48 = *(_OWORD *)(v33 + 80);
    v104[4] = *(_OWORD *)(v33 + 64);
    v104[5] = v48;
    long long v49 = *(_OWORD *)(v33 + 16);
    v104[0] = *(_OWORD *)v33;
    v104[1] = v49;
    char v50 = v95;
    sub_18C29F930((uint64_t)v94, a2, v95 & 1, (uint64_t)v31);
    swift_retain();
    char v51 = sub_18C2BA400();
    swift_release();
    uint64_t v52 = (uint64_t)v31;
    if (v51)
    {
      objc_msgSend(self, sel_maximumHorizontalTextBounds);
      *(double *)&uint64_t v67 = CGRectGetWidth(v108);
      uint64_t v68 = (uint64_t)v87;
      sub_18C2A018C((uint64_t)v104, 0, v67, 0, a2, v50 & 1, (uint64_t)v87);
      sub_18C2A7B8C(v68, (uint64_t)v85, &qword_1E916CB30);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAA8);
      sub_18C2A7614();
      sub_18C2A76F0();
      uint64_t v69 = (uint64_t)v91;
      sub_18C2CA7C0();
      sub_18C2A7BF0(v68, &qword_1E916CB30);
      uint64_t v70 = v93;
      uint64_t v71 = (uint64_t)v86;
    }
    else
    {
      uint64_t v94 = v31;
      uint64_t v53 = *v45;
      unint64_t v54 = v45[1];
      long long v57 = v45 + 2;
      long long v56 = (void *)v45[2];
      long long v55 = (void *)v57[1];
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      id v58 = v55;
      swift_bridgeObjectRetain();
      id v59 = v56;
      sub_18C2CA530();
      swift_release();
      swift_release();
      swift_release();
      char v60 = v99;
      long long v61 = self;
      objc_msgSend(v61, sel_minimumScaleFactor);
      uint64_t v63 = v62;
      id v64 = v58;
      swift_bridgeObjectRetain();
      id v65 = v59;
      if (v50) {
        id v66 = (void *)sub_18C2A6210(v53, v54);
      }
      else {
        id v66 = 0;
      }
      id v72 = v66;
      id v73 = v64;

      swift_bridgeObjectRelease();
      objc_msgSend(v61, sel_maximumHorizontalTextBounds);
      CGRectGetWidth(v109);
      sub_18C2CA930();
      sub_18C2CA590();
      uint64_t v74 = v99;
      char v75 = v100;
      uint64_t v76 = v101;
      char v77 = v102;
      long long v78 = v85;
      void *v85 = v73;
      v78[1] = v63;
      v78[2] = v53;
      v78[3] = v54;
      v78[4] = v65;
      v78[5] = v66;
      *((unsigned char *)v78 + 48) = v60;
      *((unsigned char *)v78 + 49) = 0;
      v78[7] = v74;
      *((unsigned char *)v78 + 64) = v75;
      v78[9] = v76;
      *((unsigned char *)v78 + 80) = v77;
      *(_OWORD *)(v78 + 11) = v103;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CAA8);
      sub_18C2A7614();
      sub_18C2A76F0();
      uint64_t v69 = (uint64_t)v91;
      sub_18C2CA7C0();
      uint64_t v70 = v93;
      uint64_t v71 = (uint64_t)v86;
      uint64_t v52 = (uint64_t)v94;
    }
    uint64_t v80 = (uint64_t)v89;
    uint64_t v79 = (uint64_t)v90;
    long long v38 = &qword_1E916CBC0;
    sub_18C2A7B8C(v52, (uint64_t)v89, &qword_1E916CBC0);
    sub_18C2A7B8C(v69, v79, &qword_1E916CB88);
    sub_18C2A7B8C(v80, v71, &qword_1E916CBC0);
    uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC8);
    sub_18C2A7B8C(v79, v71 + *(int *)(v81 + 48), &qword_1E916CB88);
    sub_18C2A7BF0(v79, &qword_1E916CB88);
    sub_18C2A7BF0(v80, &qword_1E916CBC0);
    uint64_t v35 = v52;
    sub_18C2A7B8C(v71, v70, &qword_1E916CC98);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7F08(&qword_1E916CC90, &qword_1E916CC98);
    sub_18C2A7F08(&qword_1E916CC80, &qword_1E916CC88);
    sub_18C2CA7C0();
    sub_18C2A6B24((uint64_t)v106);
    sub_18C2A7BF0(v71, &qword_1E916CC98);
    uint64_t v43 = v69;
    uint64_t v44 = &qword_1E916CB88;
  }
  sub_18C2A7BF0(v43, v44);
  return sub_18C2A7BF0(v35, v38);
}

uint64_t sub_18C2A2650(uint64_t a1, uint64_t a2, char a3)
{
  v21[1] = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB00);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v25, (uint64_t)v24);
  sub_18C2A68DC((uint64_t)v24, (uint64_t)v25);
  int v11 = sub_18C2A6938((uint64_t)v25);
  uint64_t v12 = sub_18C2A6944((uint64_t)v25);
  if (v11 != 1) {
    goto LABEL_3;
  }
  long long v13 = *(_OWORD *)(v12 + 112);
  long long v14 = *(_OWORD *)(v12 + 128);
  long long v15 = *(_OWORD *)(v12 + 80);
  v22[6] = *(_OWORD *)(v12 + 96);
  v22[7] = v13;
  v22[8] = v14;
  long long v16 = *(_OWORD *)(v12 + 48);
  long long v17 = *(_OWORD *)(v12 + 64);
  v22[2] = *(_OWORD *)(v12 + 32);
  v22[3] = v16;
  char v23 = *(unsigned char *)(v12 + 144);
  v22[4] = v17;
  v22[5] = v15;
  long long v18 = *(_OWORD *)(v12 + 16);
  v22[0] = *(_OWORD *)v12;
  v22[1] = v18;
  if ((*(unsigned char *)(v12 + 32) & 1) == 0)
  {
    objc_msgSend(self, sel_maximumHorizontalTextBounds);
    *(double *)&uint64_t v20 = CGRectGetWidth(v26);
    sub_18C2A018C((uint64_t)v22, 0, v20, 0, a2, a3 & 1, (uint64_t)v10);
    sub_18C2A7B8C((uint64_t)v10, (uint64_t)v7, &qword_1E916CB30);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7614();
    sub_18C2CA7C0();
    sub_18C2A6B24((uint64_t)v24);
    return sub_18C2A7BF0((uint64_t)v10, &qword_1E916CB30);
  }
  else
  {
LABEL_3:
    sub_18C2A6B24((uint64_t)v24);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7614();
    return sub_18C2CA7C0();
  }
}

uint64_t sub_18C2A28EC(uint64_t a1, uint64_t a2, char a3)
{
  v21[1] = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB00);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v25, (uint64_t)v24);
  sub_18C2A68DC((uint64_t)v24, (uint64_t)v25);
  int v11 = sub_18C2A6938((uint64_t)v25);
  uint64_t v12 = sub_18C2A6944((uint64_t)v25);
  if (v11 != 1) {
    goto LABEL_3;
  }
  long long v13 = *(_OWORD *)(v12 + 248);
  long long v14 = *(_OWORD *)(v12 + 200);
  v22[2] = *(_OWORD *)(v12 + 184);
  v22[3] = v14;
  long long v15 = *(_OWORD *)(v12 + 232);
  v22[4] = *(_OWORD *)(v12 + 216);
  v22[5] = v15;
  long long v16 = *(_OWORD *)(v12 + 168);
  v22[0] = *(_OWORD *)(v12 + 152);
  v22[1] = v16;
  long long v17 = *(_OWORD *)(v12 + 264);
  long long v18 = *(_OWORD *)(v12 + 280);
  v22[6] = v13;
  v22[7] = v17;
  char v23 = *(unsigned char *)(v12 + 296);
  v22[8] = v18;
  if ((*(unsigned char *)(v12 + 184) & 1) == 0)
  {
    objc_msgSend(self, sel_maximumHorizontalTextBounds);
    *(double *)&uint64_t v20 = CGRectGetWidth(v26);
    sub_18C2A018C((uint64_t)v22, 0, v20, 0, a2, a3 & 1, (uint64_t)v10);
    sub_18C2A7B8C((uint64_t)v10, (uint64_t)v7, &qword_1E916CB30);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7614();
    sub_18C2CA7C0();
    sub_18C2A6B24((uint64_t)v24);
    return sub_18C2A7BF0((uint64_t)v10, &qword_1E916CB30);
  }
  else
  {
LABEL_3:
    sub_18C2A6B24((uint64_t)v24);
    swift_storeEnumTagMultiPayload();
    sub_18C2A7614();
    return sub_18C2CA7C0();
  }
}

uint64_t sub_18C2A2B98@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t v71 = a7;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v15 - 8);
  id v65 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170660);
  uint64_t v69 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  uint64_t v66 = (uint64_t)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170658);
  uint64_t v19 = MEMORY[0x1F4188790](v18 - 8);
  uint64_t v70 = (uint64_t)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v73 = (uint64_t)&v65 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91706A0);
  uint64_t v25 = MEMORY[0x1F4188790](v67);
  uint64_t v74 = (uint64_t)&v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v25);
  uint64_t v75 = (uint64_t)&v65 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170700);
  uint64_t v29 = MEMORY[0x1F4188790](v28 - 8);
  id v31 = (char *)&v65 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  uint64_t v33 = (uint64_t *)((char *)&v65 - v32);
  char v34 = a1;
  uint64_t v68 = (uint64_t)&v65 - v32;
  if (a1)
  {
    uint64_t v35 = a6;
    uint64_t v36 = sub_18C2CA6B0();
    uint64_t v37 = sub_18C2CA690();
    *uint64_t v33 = v36;
    v33[1] = v37;
    a6 = v35;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170718);
    sub_18C2A32BC(a2, a3, a4 & 1, 1, (uint64_t)v33 + *(int *)(v38 + 44), a8);
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170708);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v33, 0, 1, v39);
  }
  else
  {
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170708);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v33, 1, 1, v40);
  }
  long long v41 = *(_OWORD *)(a5 + 112);
  v77[6] = *(_OWORD *)(a5 + 96);
  v77[7] = v41;
  v77[8] = *(_OWORD *)(a5 + 128);
  char v78 = *(unsigned char *)(a5 + 144);
  long long v42 = *(_OWORD *)(a5 + 48);
  v77[2] = *(_OWORD *)(a5 + 32);
  v77[3] = v42;
  long long v43 = *(_OWORD *)(a5 + 80);
  v77[4] = *(_OWORD *)(a5 + 64);
  v77[5] = v43;
  long long v44 = *(_OWORD *)(a5 + 16);
  v77[0] = *(_OWORD *)a5;
  v77[1] = v44;
  objc_msgSend(self, sel_maximumHorizontalTextBounds);
  *(double *)&uint64_t v45 = CGRectGetWidth(v79);
  sub_18C2A018C((uint64_t)v77, a6, v45, 0, a3, a4 & 1, (uint64_t)v24);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v46 = a2;
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  char v47 = v76;
  uint64_t v48 = v74;
  sub_18C2A7B8C((uint64_t)v24, v74, &qword_1E916CB30);
  uint64_t v49 = v48 + *(int *)(v67 + 36);
  *(unsigned char *)uint64_t v49 = v47;
  char v50 = v34 & 1;
  *(unsigned char *)(v49 + 1) = v34 & 1;
  *(unsigned char *)(v49 + 2) = 0;
  *(double *)(v49 + 8) = a8;
  sub_18C2A7BF0((uint64_t)v24, &qword_1E916CB30);
  sub_18C2A7C4C(v48, v75, &qword_1E91706A0);
  uint64_t v51 = 1;
  if ((v34 & 1) == 0)
  {
    uint64_t v52 = (uint64_t)v65;
    sub_18C2A28EC(v46, a3, a4 & 1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    char v53 = v76;
    uint64_t v54 = v66;
    sub_18C2A7B8C(v52, v66, &qword_1E916CB80);
    uint64_t v55 = v54 + *(int *)(v72 + 36);
    *(unsigned char *)uint64_t v55 = v53;
    *(unsigned char *)(v55 + 1) = v50;
    *(unsigned char *)(v55 + 2) = 1;
    *(double *)(v55 + 8) = a8;
    sub_18C2A7BF0(v52, &qword_1E916CB80);
    sub_18C2A7C4C(v54, v73, &qword_1E9170660);
    uint64_t v51 = 0;
  }
  uint64_t v56 = v73;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v73, v51, 1, v72);
  uint64_t v57 = v68;
  sub_18C2A7B8C(v68, (uint64_t)v31, &qword_1E9170700);
  uint64_t v58 = (uint64_t)v31;
  uint64_t v59 = v75;
  uint64_t v60 = v74;
  sub_18C2A7B8C(v75, v74, &qword_1E91706A0);
  uint64_t v61 = v70;
  sub_18C2A7B8C(v56, v70, &qword_1E9170658);
  uint64_t v62 = v71;
  sub_18C2A7B8C(v58, v71, &qword_1E9170700);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170710);
  sub_18C2A7B8C(v60, v62 + *(int *)(v63 + 48), &qword_1E91706A0);
  sub_18C2A7B8C(v61, v62 + *(int *)(v63 + 64), &qword_1E9170658);
  sub_18C2A7BF0(v56, &qword_1E9170658);
  sub_18C2A7BF0(v59, &qword_1E91706A0);
  sub_18C2A7BF0(v57, &qword_1E9170700);
  sub_18C2A7BF0(v61, &qword_1E9170658);
  sub_18C2A7BF0(v60, &qword_1E91706A0);
  return sub_18C2A7BF0(v58, &qword_1E9170700);
}

uint64_t sub_18C2A32BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  int v34 = a3;
  int v35 = a4;
  uint64_t v36 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC0);
  MEMORY[0x1F4188790](v9 - 8);
  int v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170668);
  uint64_t v13 = v12 - 8;
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v33 = (uint64_t)&v33 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170720);
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  uint64_t v24 = (char *)&v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v33 - v25;
  int v27 = v34;
  sub_18C2A2650(a1, a2, v34);
  sub_18C2A7B8C((uint64_t)v20, (uint64_t)v24, &qword_1E916CB80);
  sub_18C2A7BF0((uint64_t)v20, &qword_1E916CB80);
  sub_18C2A7C4C((uint64_t)v24, (uint64_t)v26, &qword_1E9170720);
  sub_18C29F930(a1, a2, v27, (uint64_t)v11);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v20) = v37;
  sub_18C2A7B8C((uint64_t)v11, (uint64_t)v16, &qword_1E916CBC0);
  uint64_t v28 = &v16[*(int *)(v13 + 44)];
  char *v28 = (char)v20;
  v28[1] = v35;
  v28[2] = 1;
  *((double *)v28 + 1) = a6;
  sub_18C2A7BF0((uint64_t)v11, &qword_1E916CBC0);
  uint64_t v29 = v33;
  sub_18C2A7C4C((uint64_t)v16, v33, &qword_1E9170668);
  sub_18C2A7B8C((uint64_t)v26, (uint64_t)v24, &qword_1E9170720);
  sub_18C2A7B8C(v29, (uint64_t)v16, &qword_1E9170668);
  uint64_t v30 = v36;
  sub_18C2A7B8C((uint64_t)v24, v36, &qword_1E9170720);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170728);
  sub_18C2A7B8C((uint64_t)v16, v30 + *(int *)(v31 + 48), &qword_1E9170668);
  sub_18C2A7BF0(v29, &qword_1E9170668);
  sub_18C2A7BF0((uint64_t)v26, &qword_1E9170720);
  sub_18C2A7BF0((uint64_t)v16, &qword_1E9170668);
  return sub_18C2A7BF0((uint64_t)v24, &qword_1E9170720);
}

uint64_t sub_18C2A3628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, void (*a11)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double), uint64_t *a12)
{
  long long v41 = a8;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  unsigned int v42 = a4;
  uint64_t v46 = a9;
  char v47 = a12;
  long long v43 = a11;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(a7);
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (double *)((char *)&v40 - v21);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170630);
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v25 = (double *)((char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170638);
  uint64_t v27 = MEMORY[0x1F4188790](v26 - 8);
  uint64_t v29 = (char *)&v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  uint64_t v31 = (char *)&v40 - v30;
  uint64_t v32 = sub_18C2CA6B0();
  double v33 = sub_18C29E658();
  *(void *)uint64_t v25 = v32;
  v25[1] = v33;
  *((unsigned char *)v25 + 16) = 0;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170640);
  sub_18C2A3918(a1, a2, a3, (uint64_t)v25 + *(int *)(v34 + 44));
  sub_18C2A7B8C((uint64_t)v25, (uint64_t)v29, &qword_1E9170630);
  sub_18C2A7BF0((uint64_t)v25, &qword_1E9170630);
  sub_18C2A7C4C((uint64_t)v29, (uint64_t)v31, &qword_1E9170638);
  uint64_t v35 = sub_18C2CA6B0();
  double v36 = sub_18C29E658();
  *(void *)uint64_t v22 = v35;
  v22[1] = v36;
  *((unsigned char *)v22 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(v41);
  v43(v42, a1, a2, a3, v44, v45, a10);
  sub_18C2A7B8C((uint64_t)v31, (uint64_t)v29, &qword_1E9170638);
  sub_18C2A7B8C((uint64_t)v22, (uint64_t)v20, a7);
  uint64_t v37 = v46;
  sub_18C2A7B8C((uint64_t)v29, v46, &qword_1E9170638);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(v47);
  sub_18C2A7B8C((uint64_t)v20, v37 + *(int *)(v38 + 48), a7);
  sub_18C2A7BF0((uint64_t)v22, a7);
  sub_18C2A7BF0((uint64_t)v31, &qword_1E9170638);
  sub_18C2A7BF0((uint64_t)v20, a7);
  return sub_18C2A7BF0((uint64_t)v29, &qword_1E9170638);
}

uint64_t sub_18C2A3918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  int v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)&v22 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v22 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v22 - v18;
  sub_18C2A2650(a1, a2, a3);
  sub_18C2A28EC(a1, a2, a3);
  sub_18C2A7B8C((uint64_t)v19, (uint64_t)v14, &qword_1E916CB80);
  sub_18C2A7B8C((uint64_t)v17, (uint64_t)v11, &qword_1E916CB80);
  sub_18C2A7B8C((uint64_t)v14, a4, &qword_1E916CB80);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91705F8);
  sub_18C2A7B8C((uint64_t)v11, a4 + *(int *)(v20 + 48), &qword_1E916CB80);
  sub_18C2A7BF0((uint64_t)v17, &qword_1E916CB80);
  sub_18C2A7BF0((uint64_t)v19, &qword_1E916CB80);
  sub_18C2A7BF0((uint64_t)v11, &qword_1E916CB80);
  return sub_18C2A7BF0((uint64_t)v14, &qword_1E916CB80);
}

uint64_t sub_18C2A3ABC@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t v67 = a6;
  int v72 = a4;
  uint64_t v73 = a2;
  int v74 = a1;
  uint64_t v71 = a7;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB30);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v69 = (uint64_t)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91706A0);
  uint64_t v13 = MEMORY[0x1F4188790](v68);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v70 = (uint64_t)&v61 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170660);
  uint64_t v20 = MEMORY[0x1F4188790](v64);
  uint64_t v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v61 - v23;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91706A8);
  MEMORY[0x1F4188790](v63);
  uint64_t v26 = (char *)&v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC0);
  MEMORY[0x1F4188790](v27 - 8);
  uint64_t v29 = (char *)&v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170668);
  uint64_t v30 = MEMORY[0x1F4188790](v62);
  uint64_t v32 = (char *)&v61 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v30);
  uint64_t v34 = (char *)&v61 - v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91706B0);
  uint64_t v36 = MEMORY[0x1F4188790](v35 - 8);
  uint64_t v66 = (uint64_t)&v61 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v36);
  id v65 = (char *)&v61 - v38;
  if (v74)
  {
    sub_18C29F930(v73, a3, v72 & 1, (uint64_t)v29);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    char v39 = v76[0];
    sub_18C2A7B8C((uint64_t)v29, (uint64_t)v32, &qword_1E916CBC0);
    uint64_t v40 = &v32[*(int *)(v62 + 36)];
    char *v40 = v39;
    *(_WORD *)(v40 + 1) = 257;
    *((double *)v40 + 1) = a8;
    sub_18C2A7BF0((uint64_t)v29, &qword_1E916CBC0);
    sub_18C2A7C4C((uint64_t)v32, (uint64_t)v34, &qword_1E9170668);
    sub_18C2A7B8C((uint64_t)v34, (uint64_t)v26, &qword_1E9170668);
    swift_storeEnumTagMultiPayload();
    sub_18C2A784C();
    sub_18C2A79D0();
    uint64_t v41 = (uint64_t)v65;
    sub_18C2CA7C0();
    uint64_t v42 = (uint64_t)v34;
    long long v43 = &qword_1E9170668;
  }
  else
  {
    sub_18C2A2650(v73, a3, v72 & 1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    char v44 = v76[0];
    sub_18C2A7B8C((uint64_t)v19, (uint64_t)v22, &qword_1E916CB80);
    uint64_t v45 = &v22[*(int *)(v64 + 36)];
    *uint64_t v45 = v44;
    *(_WORD *)(v45 + 1) = 256;
    *((double *)v45 + 1) = a8;
    sub_18C2A7BF0((uint64_t)v19, &qword_1E916CB80);
    sub_18C2A7C4C((uint64_t)v22, (uint64_t)v24, &qword_1E9170660);
    sub_18C2A7B8C((uint64_t)v24, (uint64_t)v26, &qword_1E9170660);
    swift_storeEnumTagMultiPayload();
    sub_18C2A784C();
    sub_18C2A79D0();
    uint64_t v41 = (uint64_t)v65;
    sub_18C2CA7C0();
    uint64_t v42 = (uint64_t)v24;
    long long v43 = &qword_1E9170660;
  }
  sub_18C2A7BF0(v42, v43);
  long long v46 = *(_OWORD *)(a5 + 248);
  long long v47 = *(_OWORD *)(a5 + 200);
  v76[2] = *(_OWORD *)(a5 + 184);
  v76[3] = v47;
  long long v48 = *(_OWORD *)(a5 + 232);
  v76[4] = *(_OWORD *)(a5 + 216);
  v76[5] = v48;
  long long v49 = *(_OWORD *)(a5 + 168);
  v76[0] = *(_OWORD *)(a5 + 152);
  v76[1] = v49;
  long long v50 = *(_OWORD *)(a5 + 264);
  long long v51 = *(_OWORD *)(a5 + 280);
  v76[6] = v46;
  v76[7] = v50;
  char v77 = *(unsigned char *)(a5 + 296);
  v76[8] = v51;
  objc_msgSend(self, sel_maximumHorizontalTextBounds);
  *(double *)&uint64_t v52 = CGRectGetWidth(v78);
  uint64_t v53 = v69;
  sub_18C2A018C((uint64_t)v76, v67, v52, 0, a3, v72 & 1, v69);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  char v54 = v75;
  sub_18C2A7B8C(v53, (uint64_t)v15, &qword_1E916CB30);
  uint64_t v55 = &v15[*(int *)(v68 + 36)];
  char *v55 = v54;
  *(_WORD *)(v55 + 1) = v74 & 1;
  *((double *)v55 + 1) = a8;
  sub_18C2A7BF0(v53, &qword_1E916CB30);
  uint64_t v56 = v70;
  sub_18C2A7C4C((uint64_t)v15, v70, &qword_1E91706A0);
  uint64_t v57 = v66;
  sub_18C2A7B8C(v41, v66, &qword_1E91706B0);
  sub_18C2A7B8C(v56, (uint64_t)v15, &qword_1E91706A0);
  uint64_t v58 = v71;
  sub_18C2A7B8C(v57, v71, &qword_1E91706B0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91706D8);
  sub_18C2A7B8C((uint64_t)v15, v58 + *(int *)(v59 + 48), &qword_1E91706A0);
  sub_18C2A7BF0(v56, &qword_1E91706A0);
  sub_18C2A7BF0(v41, &qword_1E91706B0);
  sub_18C2A7BF0((uint64_t)v15, &qword_1E91706A0);
  return sub_18C2A7BF0(v57, &qword_1E91706B0);
}

uint64_t sub_18C2A42B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  int v35 = a4;
  uint64_t v36 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170628);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (double *)&v34[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170630);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (double *)&v34[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170638);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  uint64_t v22 = &v34[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = &v34[-v23];
  uint64_t v25 = sub_18C2CA6B0();
  double v26 = sub_18C29E658();
  *(void *)uint64_t v18 = v25;
  v18[1] = v26;
  *((unsigned char *)v18 + 16) = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170640);
  sub_18C2A3918(a1, a2, a3, (uint64_t)v18 + *(int *)(v27 + 44));
  sub_18C2A7B8C((uint64_t)v18, (uint64_t)v22, &qword_1E9170630);
  sub_18C2A7BF0((uint64_t)v18, &qword_1E9170630);
  sub_18C2A7C4C((uint64_t)v22, (uint64_t)v24, &qword_1E9170638);
  uint64_t v28 = sub_18C2CA6B0();
  double v29 = sub_18C29E658();
  *(void *)uint64_t v15 = v28;
  v15[1] = v29;
  *((unsigned char *)v15 + 16) = 0;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170648);
  sub_18C2A4590(v35, a1, a2, a3, (uint64_t)v15 + *(int *)(v30 + 44), a6);
  sub_18C2A7B8C((uint64_t)v24, (uint64_t)v22, &qword_1E9170638);
  sub_18C2A7B8C((uint64_t)v15, (uint64_t)v13, &qword_1E9170628);
  uint64_t v31 = v36;
  sub_18C2A7B8C((uint64_t)v22, v36, &qword_1E9170638);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170650);
  sub_18C2A7B8C((uint64_t)v13, v31 + *(int *)(v32 + 48), &qword_1E9170628);
  sub_18C2A7BF0((uint64_t)v15, &qword_1E9170628);
  sub_18C2A7BF0((uint64_t)v24, &qword_1E9170638);
  sub_18C2A7BF0((uint64_t)v13, &qword_1E9170628);
  return sub_18C2A7BF0((uint64_t)v22, &qword_1E9170638);
}

uint64_t sub_18C2A4590@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  int v62 = a4;
  uint64_t v60 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170658);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v61 = (uint64_t)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v59 = (char *)&v54 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170660);
  uint64_t v57 = *(void *)(v17 - 8);
  uint64_t v58 = v17;
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v64 = (uint64_t)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v63 = (uint64_t)&v54 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC0);
  MEMORY[0x1F4188790](v21 - 8);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170668);
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v27 = (char *)&v54 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170670);
  uint64_t v29 = MEMORY[0x1F4188790](v28 - 8);
  uint64_t v56 = (uint64_t)&v54 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  uint64_t v32 = (char *)&v54 - v31;
  char v33 = a1;
  uint64_t v55 = (uint64_t)&v54 - v31;
  if (a1)
  {
    sub_18C29F930(a2, a3, v62 & 1, (uint64_t)v23);
    swift_getKeyPath();
    uint64_t v54 = a2;
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    char v34 = v65;
    sub_18C2A7B8C((uint64_t)v23, (uint64_t)v27, &qword_1E916CBC0);
    int v35 = &v27[*(int *)(v24 + 36)];
    char *v35 = v34;
    *(_WORD *)(v35 + 1) = 257;
    *((double *)v35 + 1) = a6;
    a2 = v54;
    sub_18C2A7BF0((uint64_t)v23, &qword_1E916CBC0);
    sub_18C2A7C4C((uint64_t)v27, (uint64_t)v32, &qword_1E9170668);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v32, 0, 1, v24);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))((char *)&v54 - v31, 1, 1, v24);
  }
  char v36 = v62 & 1;
  sub_18C2A2650(a2, a3, v62 & 1);
  swift_getKeyPath();
  uint64_t v37 = a2;
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  char v38 = v67;
  uint64_t v39 = v64;
  sub_18C2A7B8C((uint64_t)v16, v64, &qword_1E916CB80);
  uint64_t v40 = v58;
  uint64_t v41 = v39 + *(int *)(v58 + 36);
  *(unsigned char *)uint64_t v41 = v38;
  *(unsigned char *)(v41 + 1) = v33 & 1;
  *(unsigned char *)(v41 + 2) = 0;
  *(double *)(v41 + 8) = a6;
  uint64_t v42 = v39;
  sub_18C2A7BF0((uint64_t)v16, &qword_1E916CB80);
  sub_18C2A7C4C(v39, v63, &qword_1E9170660);
  uint64_t v43 = 1;
  uint64_t v44 = (uint64_t)v59;
  if ((v33 & 1) == 0)
  {
    sub_18C2A28EC(v37, a3, v36);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    char v45 = v66;
    sub_18C2A7B8C((uint64_t)v16, v64, &qword_1E916CB80);
    uint64_t v46 = v64 + *(int *)(v40 + 36);
    *(unsigned char *)uint64_t v46 = v45;
    uint64_t v42 = v64;
    *(unsigned char *)(v46 + 1) = v33 & 1;
    *(unsigned char *)(v46 + 2) = 1;
    *(double *)(v46 + 8) = a6;
    sub_18C2A7BF0((uint64_t)v16, &qword_1E916CB80);
    sub_18C2A7C4C(v42, v44, &qword_1E9170660);
    uint64_t v43 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v44, v43, 1, v40);
  uint64_t v48 = v55;
  uint64_t v47 = v56;
  sub_18C2A7B8C(v55, v56, &qword_1E9170670);
  uint64_t v49 = v63;
  sub_18C2A7B8C(v63, v42, &qword_1E9170660);
  uint64_t v50 = v61;
  sub_18C2A7B8C(v44, v61, &qword_1E9170658);
  uint64_t v51 = v60;
  sub_18C2A7B8C(v47, v60, &qword_1E9170670);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170678);
  sub_18C2A7B8C(v42, v51 + *(int *)(v52 + 48), &qword_1E9170660);
  sub_18C2A7B8C(v50, v51 + *(int *)(v52 + 64), &qword_1E9170658);
  sub_18C2A7BF0(v44, &qword_1E9170658);
  sub_18C2A7BF0(v49, &qword_1E9170660);
  sub_18C2A7BF0(v48, &qword_1E9170670);
  sub_18C2A7BF0(v50, &qword_1E9170658);
  sub_18C2A7BF0(v42, &qword_1E9170660);
  return sub_18C2A7BF0(v47, &qword_1E9170670);
}

uint64_t sub_18C2A4C34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  int v35 = a4;
  uint64_t v36 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170730);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (double *)&v34[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170630);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (double *)&v34[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170638);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  uint64_t v22 = &v34[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = &v34[-v23];
  uint64_t v25 = sub_18C2CA6B0();
  double v26 = sub_18C29E658();
  *(void *)uint64_t v18 = v25;
  v18[1] = v26;
  *((unsigned char *)v18 + 16) = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170640);
  sub_18C2A3918(a1, a2, a3, (uint64_t)v18 + *(int *)(v27 + 44));
  sub_18C2A7B8C((uint64_t)v18, (uint64_t)v22, &qword_1E9170630);
  sub_18C2A7BF0((uint64_t)v18, &qword_1E9170630);
  sub_18C2A7C4C((uint64_t)v22, (uint64_t)v24, &qword_1E9170638);
  uint64_t v28 = sub_18C2CA6B0();
  double v29 = sub_18C29E658();
  *(void *)uint64_t v15 = v28;
  v15[1] = v29;
  *((unsigned char *)v15 + 16) = 0;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170738);
  sub_18C2A4F0C(a1, a2, a3, v35, (uint64_t)v15 + *(int *)(v30 + 44), a6);
  sub_18C2A7B8C((uint64_t)v24, (uint64_t)v22, &qword_1E9170638);
  sub_18C2A7B8C((uint64_t)v15, (uint64_t)v13, &qword_1E9170730);
  uint64_t v31 = v36;
  sub_18C2A7B8C((uint64_t)v22, v36, &qword_1E9170638);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170740);
  sub_18C2A7B8C((uint64_t)v13, v31 + *(int *)(v32 + 48), &qword_1E9170730);
  sub_18C2A7BF0((uint64_t)v15, &qword_1E9170730);
  sub_18C2A7BF0((uint64_t)v24, &qword_1E9170638);
  sub_18C2A7BF0((uint64_t)v13, &qword_1E9170730);
  return sub_18C2A7BF0((uint64_t)v22, &qword_1E9170638);
}

uint64_t sub_18C2A4F0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  int v34 = a4;
  uint64_t v35 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170660);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = &v33[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = &v33[-v18];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170748);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  uint64_t v23 = &v33[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (uint64_t *)&v33[-v24];
  uint64_t v26 = sub_18C2CA6B0();
  uint64_t v27 = sub_18C2CA690();
  uint64_t *v25 = v26;
  v25[1] = v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170750);
  LOBYTE(v26) = v34;
  sub_18C2A5214(a1, a2, a3, v34, (uint64_t)v25 + *(int *)(v28 + 44), a6);
  sub_18C2A28EC(a1, a2, a3);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(a1) = v36;
  sub_18C2A7B8C((uint64_t)v12, (uint64_t)v17, &qword_1E916CB80);
  double v29 = (double *)&v17[*(int *)(v14 + 44)];
  *(unsigned char *)double v29 = a1;
  *((unsigned char *)v29 + 1) = v26;
  *((unsigned char *)v29 + 2) = 0;
  v29[1] = a6;
  sub_18C2A7BF0((uint64_t)v12, &qword_1E916CB80);
  sub_18C2A7C4C((uint64_t)v17, (uint64_t)v19, &qword_1E9170660);
  sub_18C2A7B8C((uint64_t)v25, (uint64_t)v23, &qword_1E9170748);
  sub_18C2A7B8C((uint64_t)v19, (uint64_t)v17, &qword_1E9170660);
  uint64_t v30 = v35;
  sub_18C2A7B8C((uint64_t)v23, v35, &qword_1E9170748);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170758);
  sub_18C2A7B8C((uint64_t)v17, v30 + *(int *)(v31 + 48), &qword_1E9170660);
  sub_18C2A7BF0((uint64_t)v19, &qword_1E9170660);
  sub_18C2A7BF0((uint64_t)v25, &qword_1E9170748);
  sub_18C2A7BF0((uint64_t)v17, &qword_1E9170660);
  return sub_18C2A7BF0((uint64_t)v23, &qword_1E9170748);
}

uint64_t sub_18C2A5214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  int v53 = a3;
  uint64_t v51 = a1;
  uint64_t v61 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CBC0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v55 = (uint64_t)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170760) - 8;
  MEMORY[0x1F4188790](v56);
  uint64_t v52 = (uint64_t)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170768) - 8;
  uint64_t v13 = MEMORY[0x1F4188790](v59);
  uint64_t v60 = (uint64_t)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v57 = (uint64_t)&v51 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v58 = (uint64_t)&v51 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CB80);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170770);
  uint64_t v22 = v21 - 8;
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170778);
  uint64_t v26 = v25 - 8;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v54 = (uint64_t)&v51 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  uint64_t v31 = (char *)&v51 - v30;
  MEMORY[0x1F4188790](v29);
  char v33 = (char *)&v51 - v32;
  uint64_t v34 = a1;
  int v35 = v53;
  sub_18C2A2650(v34, a2, v53);
  sub_18C2A7B8C((uint64_t)v20, (uint64_t)v24, &qword_1E916CB80);
  if (a4) {
    double v36 = 0.0;
  }
  else {
    double v36 = 1.0;
  }
  *(double *)&v24[*(int *)(v22 + 44)] = v36;
  if (a4) {
    double v37 = 1.0;
  }
  else {
    double v37 = 0.0;
  }
  sub_18C2A7BF0((uint64_t)v20, &qword_1E916CB80);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  char v38 = v63;
  sub_18C2A7B8C((uint64_t)v24, (uint64_t)v31, &qword_1E9170770);
  uint64_t v39 = &v31[*(int *)(v26 + 44)];
  *uint64_t v39 = v38;
  char v40 = a4;
  v39[1] = a4;
  v39[2] = 1;
  *((double *)v39 + 1) = a6;
  sub_18C2A7BF0((uint64_t)v24, &qword_1E9170770);
  sub_18C2A7C4C((uint64_t)v31, (uint64_t)v33, &qword_1E9170778);
  uint64_t v41 = v55;
  sub_18C29F930(v51, a2, v35, v55);
  uint64_t v42 = v52;
  sub_18C2A7B8C(v41, v52, &qword_1E916CBC0);
  *(double *)(v42 + *(int *)(v56 + 44)) = v37;
  sub_18C2A7BF0(v41, &qword_1E916CBC0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v41) = v62;
  uint64_t v43 = v57;
  sub_18C2A7B8C(v42, v57, &qword_1E9170760);
  uint64_t v44 = v43 + *(int *)(v59 + 44);
  *(unsigned char *)uint64_t v44 = v41;
  *(unsigned char *)(v44 + 1) = v40;
  *(unsigned char *)(v44 + 2) = 1;
  *(double *)(v44 + 8) = a6;
  sub_18C2A7BF0(v42, &qword_1E9170760);
  uint64_t v45 = v58;
  sub_18C2A7C4C(v43, v58, &qword_1E9170768);
  uint64_t v46 = v54;
  sub_18C2A7B8C((uint64_t)v33, v54, &qword_1E9170778);
  uint64_t v47 = v60;
  sub_18C2A7B8C(v45, v60, &qword_1E9170768);
  uint64_t v48 = v61;
  sub_18C2A7B8C(v46, v61, &qword_1E9170778);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170780);
  sub_18C2A7B8C(v47, v48 + *(int *)(v49 + 48), &qword_1E9170768);
  sub_18C2A7BF0(v45, &qword_1E9170768);
  sub_18C2A7BF0((uint64_t)v33, &qword_1E9170778);
  sub_18C2A7BF0(v47, &qword_1E9170768);
  return sub_18C2A7BF0(v46, &qword_1E9170778);
}

void *sub_18C2A5770(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_18C2CA3C0();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_18C2CA390();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_18C2CA340();
  uint64_t v26 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C2CA370();
  __n128 result = (void *)CEMGetSharedEmojiCharacterSet();
  if (result)
  {
    id v13 = result;
    sub_18C2CA310();

    uint64_t v14 = HIBYTE(a2) & 0xF;
    uint64_t v29 = a1;
    unint64_t v30 = a2;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v14 = a1 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v31 = 0;
    uint64_t v32 = v14;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_18C2CAA40();
    if (!v16)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      return (void *)(*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v27);
    }
    unint64_t v17 = v15;
    unint64_t v18 = v16;
    uint64_t v19 = (void (**)(char *, uint64_t))(v6 + 8);
    while (1)
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_18C2A60D4(v17, v18);
      __n128 result = (void *)swift_bridgeObjectRelease();
      if ((v24 & 0x100000000) != 0) {
        break;
      }
      if (sub_18C2CA320()) {
        uint64_t v20 = sub_18C2CA8F0();
      }
      else {
        uint64_t v20 = sub_18C2CA8E0();
      }
      uint64_t v21 = v20;
      sub_18C2CA3B0();
      sub_18C2CA3A0();
      uint64_t KeyPath = swift_getKeyPath();
      *(&v25 - 2) = MEMORY[0x1F4188790](KeyPath);
      swift_getKeyPath();
      uint64_t v28 = v21;
      sub_18C2A741C();
      swift_retain();
      sub_18C2CA360();
      sub_18C2A77F4(&qword_1E91705E8, MEMORY[0x1E4F273A8]);
      sub_18C2CA380();
      swift_release();
      (*v19)(v8, v5);
      unint64_t v17 = sub_18C2CAA40();
      unint64_t v18 = v23;
      if (!v23) {
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_18C2A5AD4@<X0>(uint64_t a1@<X8>)
{
  return sub_18C29E9B0(*(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16), a1);
}

unint64_t sub_18C2A5AE4()
{
  unint64_t result = qword_1E91705A0;
  if (!qword_1E91705A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91705A0);
  }
  return result;
}

unint64_t sub_18C2A5B3C()
{
  unint64_t result = qword_1E91705A8;
  if (!qword_1E91705A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91705A8);
  }
  return result;
}

uint64_t sub_18C2A5B90()
{
  uint64_t result = sub_18C2CA950();
  qword_1E9170588 = result;
  return result;
}

uint64_t sub_18C2A5BB8()
{
  uint64_t result = sub_18C2CA960();
  qword_1E9170590 = result;
  return result;
}

uint64_t sub_18C2A5BE4()
{
  uint64_t result = sub_18C2CA940();
  qword_1E9170598 = result;
  return result;
}

uint64_t sub_18C2A5C20@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v35 = a3;
  unsigned int v5 = a2 & 0x100;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170788);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170790);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170798);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91707A0);
  MEMORY[0x1F4188790](v34);
  unint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v33 = v12;
    unsigned int v21 = v5;
    if (qword_1E91703D8 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_1E9170590;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91707A8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v8, a1, v23);
    unint64_t v24 = &v8[*(int *)(v6 + 36)];
    *(void *)unint64_t v24 = v22;
    unsigned int v20 = v21 >> 8;
    v24[8] = BYTE1(v21);
    uint64_t v25 = qword_1E91703D0;
    swift_retain();
    if (v25 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_1E9170588;
    swift_retain();
    uint64_t v12 = v33;
  }
  else
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91707A8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v8, a1, v17);
    uint64_t v18 = 0;
    uint64_t v19 = &v8[*(int *)(v6 + 36)];
    *(void *)uint64_t v19 = 0;
    unsigned int v20 = v5 >> 8;
    v19[8] = BYTE1(v5);
  }
  sub_18C2A7B8C((uint64_t)v8, (uint64_t)v11, &qword_1E9170788);
  uint64_t v26 = &v11[*(int *)(v9 + 36)];
  *(void *)uint64_t v26 = v18;
  v26[8] = v20;
  sub_18C2A7BF0((uint64_t)v8, &qword_1E9170788);
  if (a2)
  {
    if (qword_1E91703E0 != -1) {
      swift_once();
    }
    uint64_t v28 = qword_1E9170598;
    swift_retain();
    sub_18C2A7B8C((uint64_t)v11, (uint64_t)v14, &qword_1E9170790);
    uint64_t v29 = &v14[*(int *)(v12 + 36)];
    *(void *)uint64_t v29 = v28;
    v29[8] = v20;
    sub_18C2A7BF0((uint64_t)v11, &qword_1E9170790);
    if ((a2 & 0x10000) != 0)
    {
      sub_18C2CA980();
      sub_18C2CA5A0();
      sub_18C2CA5B0();
      uint64_t v30 = sub_18C2CA5C0();
      swift_release();
      swift_release();
      goto LABEL_15;
    }
  }
  else
  {
    sub_18C2A7B8C((uint64_t)v11, (uint64_t)v14, &qword_1E9170790);
    uint64_t v27 = &v14[*(int *)(v12 + 36)];
    *(void *)uint64_t v27 = 0;
    v27[8] = v20;
    sub_18C2A7BF0((uint64_t)v11, &qword_1E9170790);
  }
  uint64_t v30 = sub_18C2CA5D0();
LABEL_15:
  sub_18C2A7B8C((uint64_t)v14, (uint64_t)v16, &qword_1E9170798);
  *(void *)&v16[*(int *)(v34 + 36)] = v30;
  sub_18C2A7BF0((uint64_t)v14, &qword_1E9170798);
  return sub_18C2A7C4C((uint64_t)v16, v35, &qword_1E91707A0);
}

uint64_t sub_18C2A6084()
{
  return sub_18C2CA580();
}

uint64_t sub_18C2A60A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (v2[1]) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  int v4 = v3 | *v2;
  if (v2[2]) {
    int v5 = 0x10000;
  }
  else {
    int v5 = 0;
  }
  return sub_18C2A5C20(a1, v4 | v5, a2);
}

unint64_t sub_18C2A60D4(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_18C2A66B0(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_18C2CABE0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_18C2CAC10();
      }
      unsigned int v5 = sub_18C2CAC20();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t sub_18C2A61B4()
{
  return sub_18C2CA9C0() & 1;
}

unint64_t sub_18C2A6210(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_18C2CA340();
  uint64_t v30 = *(void *)(v4 - 8);
  uint64_t v31 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
  uint64_t v8 = (void *)sub_18C2CA9D0();
  id v9 = objc_msgSend(v7, sel_initWithString_, v8);

  unint64_t result = CEMGetSharedEmojiCharacterSet();
  if (result)
  {
    id v11 = (id)result;
    sub_18C2CA310();

    uint64_t v12 = HIBYTE(a2) & 0xF;
    uint64_t v33 = a1;
    unint64_t v34 = a2;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v35 = 0;
    uint64_t v36 = v12;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_18C2CAA40();
    if (!v14)
    {
LABEL_10:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
      return (unint64_t)v9;
    }
    unint64_t v15 = v13;
    unint64_t v16 = v14;
    uint64_t v17 = (void *)*MEMORY[0x1E4FB0700];
    long long v32 = xmmword_18C2DD530;
    while (1)
    {
      unint64_t result = sub_18C2A60D4(v15, v16);
      if ((result & 0x100000000) != 0) {
        break;
      }
      char v18 = sub_18C2CA320();
      uint64_t v19 = self;
      unsigned int v20 = &selRef_whiteColor;
      if ((v18 & 1) == 0) {
        unsigned int v20 = &selRef_clearColor;
      }
      id v21 = objc_msgSend(v19, *v20, v30, v31);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CE70);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v32;
      *(void *)(inited + 32) = v17;
      *(void *)(inited + 64) = sub_18C29B910(0, (unint64_t *)&unk_1E916CE38);
      *(void *)(inited + 40) = v21;
      id v23 = v17;
      id v24 = v21;
      sub_18C2A9B58(inited);
      id v25 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
      uint64_t v26 = (void *)sub_18C2CA9D0();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_18C2A77F4((unint64_t *)&qword_1E916CDF8, type metadata accessor for Key);
      uint64_t v27 = (void *)sub_18C2CA990();
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

      objc_msgSend(v9, sel_appendAttributedString_, v28);
      unint64_t v15 = sub_18C2CAA40();
      unint64_t v16 = v29;
      if (!v29) {
        goto LABEL_10;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_18C2A6540@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18C2A65C0()
{
  return sub_18C2CA540();
}

uint64_t sub_18C2A6634(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_18C2CAA70();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x192F90750](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_18C2A66B0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_18C2A6750(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_18C2A67C0(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_18C2A6750(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = sub_18C2A6634(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_18C2A67C0(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v10 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          unint64_t v5 = v10;
        }
        return v5 << 16;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 != (a2 & 0xFFFFFFFFFFFFLL))
        {
          do
LABEL_9:
            int v7 = *(unsigned char *)(v6 + v5--) & 0xC0;
          while (v7 == 128);
          ++v5;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_18C2CAC10();
        unint64_t v5 = v12;
        if (v12 != v9) {
          goto LABEL_9;
        }
      }
      return v5 << 16;
    }
    uint64_t v8 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v8)
    {
      return MEMORY[0x1F4184CD0]();
    }
  }
  return result;
}

uint64_t sub_18C2A68DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_18C2A6938(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 298) >> 7;
}

uint64_t sub_18C2A6944(uint64_t result)
{
  *(unsigned char *)(result + 298) &= ~0x80u;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_18C2A69A4()
{
  unint64_t result = qword_1E916CB68;
  if (!qword_1E916CB68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB70);
    sub_18C2A7F08(&qword_1E916CC60, &qword_1E916CC68);
    sub_18C2A7F08(&qword_1E916CC70, &qword_1E916CC78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB68);
  }
  return result;
}

unint64_t sub_18C2A6A64()
{
  unint64_t result = qword_1E916CB58;
  if (!qword_1E916CB58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB60);
    sub_18C2A7F08(&qword_1E916CC40, &qword_1E916CC48);
    sub_18C2A7F08(&qword_1E916CC50, &qword_1E916CC58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB58);
  }
  return result;
}

uint64_t sub_18C2A6B24(uint64_t a1)
{
  long long v5 = *(_OWORD *)(a1 + 256);
  long long v6 = *(_OWORD *)(a1 + 272);
  long long v3 = *(_OWORD *)(a1 + 224);
  long long v4 = *(_OWORD *)(a1 + 240);
  sub_18C2A6BB8(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void **)(a1 + 168),
    *(void **)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void **)(a1 + 208),
    *(void *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1),
    v6,
    *((uint64_t *)&v6 + 1),
    *(void *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
  return a1;
}

void sub_18C2A6BB8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if ((a38 & 0x800000) != 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

unint64_t sub_18C2A6C90()
{
  unint64_t result = qword_1E916CB38;
  if (!qword_1E916CB38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB40);
    sub_18C2A7F08(&qword_1E916CC20, &qword_1E916CC28);
    sub_18C2A6D30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB38);
  }
  return result;
}

unint64_t sub_18C2A6D30()
{
  unint64_t result = qword_1E916CB48;
  if (!qword_1E916CB48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB50);
    sub_18C2A7F08(&qword_1E916CC30, &qword_1E916CC38);
    sub_18C2A7510(&qword_1E916CBA0, &qword_1E916CBA8, (void (*)(void))sub_18C2A69A4, (void (*)(void))sub_18C2A6A64);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB48);
  }
  return result;
}

uint64_t sub_18C2A6E08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18C2CA620();
  *a1 = result;
  return result;
}

uint64_t sub_18C2A6E34()
{
  return sub_18C2CA630();
}

uint64_t sub_18C2A6E60@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_18C2CA640();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_18C2A6E94()
{
  return sub_18C2CA650();
}

uint64_t sub_18C2A6EC4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_18C2CA600();
  *a1 = v3;
  return result;
}

uint64_t sub_18C2A6EF0()
{
  return sub_18C2CA610();
}

unint64_t sub_18C2A6F18()
{
  unint64_t result = qword_1E916CAE0;
  if (!qword_1E916CAE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CAE8);
    sub_18C2A7718(&qword_1E916CAD0, &qword_1E916CAD8, (void (*)(void))sub_18C2A6FDC);
    sub_18C2A7F08(&qword_1E916CBD0, &qword_1E916CBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CAE0);
  }
  return result;
}

unint64_t sub_18C2A6FDC()
{
  unint64_t result = qword_1E916CAC0;
  if (!qword_1E916CAC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CAC8);
    sub_18C2A707C();
    sub_18C2A7F08(&qword_1E916CBF0, &qword_1E916CBF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CAC0);
  }
  return result;
}

unint64_t sub_18C2A707C()
{
  unint64_t result = qword_1E916CAB0;
  if (!qword_1E916CAB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CAB8);
    swift_getOpaqueTypeConformance2();
    sub_18C2A7F08(&qword_1E916CBE0, &qword_1E916CBE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CAB0);
  }
  return result;
}

uint64_t sub_18C2A7154(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_18C2A716C(void *a1)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v3 = (void *)a1[3];
  long long v4 = (void *)a1[7];
  swift_bridgeObjectRetain();
  id v5 = v2;
  id v6 = v3;
  swift_bridgeObjectRetain();
  id v7 = v4;
  return a1;
}

uint64_t sub_18C2A71C4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 168);
  uint64_t v9 = *(void *)(a1 + 160);
  uint64_t v10 = *(void *)(a1 + 152);
  uint64_t v3 = *(void **)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  id v7 = *(void **)(a1 + 208);
  sub_18C2A72CC(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56));
  sub_18C2A72CC(v10, v9, v2, v3, v4, v5, v6, v7);
  return a1;
}

void sub_18C2A72CC(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_18C2A733C(uint64_t a1)
{
  return a1;
}

uint64_t sub_18C2A73A0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void sub_18C2A73FC()
{
}

unint64_t sub_18C2A741C()
{
  unint64_t result = qword_1E91705E0;
  if (!qword_1E91705E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91705E0);
  }
  return result;
}

void sub_18C2A7470()
{
}

uint64_t sub_18C2A7498()
{
  return 8;
}

uint64_t sub_18C2A74A4()
{
  return swift_release();
}

uint64_t sub_18C2A74AC(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_18C2A74BC()
{
  return sub_18C2CA9B0();
}

void *sub_18C2A7504(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_18C2A7510(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18C2A7598()
{
  unint64_t result = qword_1E916CB78;
  if (!qword_1E916CB78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB80);
    sub_18C2A7614();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB78);
  }
  return result;
}

unint64_t sub_18C2A7614()
{
  unint64_t result = qword_1E916CB28;
  if (!qword_1E916CB28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB30);
    sub_18C2A6F18();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CAD8);
    sub_18C2A7718(&qword_1E916CAD0, &qword_1E916CAD8, (void (*)(void))sub_18C2A6FDC);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB28);
  }
  return result;
}

uint64_t sub_18C2A76F0()
{
  return sub_18C2A7718(&qword_1E916CAA0, &qword_1E916CAA8, (void (*)(void))sub_18C2A7798);
}

uint64_t sub_18C2A7718(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18C2A7798()
{
  unint64_t result = qword_1E916CCA8;
  if (!qword_1E916CCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CCA8);
  }
  return result;
}

uint64_t sub_18C2A77F4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18C2A784C()
{
  unint64_t result = qword_1E91706B8;
  if (!qword_1E91706B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9170668);
    sub_18C2A78C8();
    sub_18C2A797C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91706B8);
  }
  return result;
}

unint64_t sub_18C2A78C8()
{
  unint64_t result = qword_1E91706C0;
  if (!qword_1E91706C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CBC0);
    sub_18C2A7510(&qword_1E916CBB0, &qword_1E916CBB8, (void (*)(void))sub_18C2A7598, (void (*)(void))sub_18C2A76F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91706C0);
  }
  return result;
}

unint64_t sub_18C2A797C()
{
  unint64_t result = qword_1E91706C8;
  if (!qword_1E91706C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91706C8);
  }
  return result;
}

unint64_t sub_18C2A79D0()
{
  unint64_t result = qword_1E91706D0;
  if (!qword_1E91706D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9170660);
    sub_18C2A7598();
    sub_18C2A797C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91706D0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IncomingCallAnimationsModifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingCallAnimationsModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallAnimationsModifier()
{
  return &type metadata for IncomingCallAnimationsModifier;
}

unint64_t sub_18C2A7AF4()
{
  unint64_t result = qword_1E916CB90;
  if (!qword_1E916CB90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CB98);
    sub_18C2A6C90();
    sub_18C2A6D30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CB90);
  }
  return result;
}

uint64_t sub_18C2A7B70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18C2A7B8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_18C2A7BF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_18C2A7C4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_18C2A7CB4()
{
  unint64_t result = qword_1E91707B0;
  if (!qword_1E91707B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E91707A0);
    sub_18C2A7D78(&qword_1E91707B8, &qword_1E9170798, (void (*)(void))sub_18C2A7E1C);
    sub_18C2A7F08(&qword_1E91707E8, (uint64_t *)&unk_1E91707F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91707B0);
  }
  return result;
}

uint64_t sub_18C2A7D78(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_18C2A7F08(&qword_1E91707D8, &qword_1E91707E0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18C2A7E1C()
{
  return sub_18C2A7D78(&qword_1E91707C0, &qword_1E9170790, (void (*)(void))sub_18C2A7E44);
}

unint64_t sub_18C2A7E44()
{
  unint64_t result = qword_1E91707C8;
  if (!qword_1E91707C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9170788);
    sub_18C2A7F08(&qword_1E91707D0, &qword_1E91707A8);
    sub_18C2A7F08(&qword_1E91707D8, &qword_1E91707E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91707C8);
  }
  return result;
}

uint64_t sub_18C2A7F08(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18C2A7F5C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_18C2A7FA0()
{
  return 1;
}

uint64_t sub_18C2A7FA8(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_18C2A82F8(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2 + qword_1E9171CB8) - 8) + 8))(a1);
  return v5;
}

void *sub_18C2A8028(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_18C2A806C(a1, a2);
}

void *sub_18C2A806C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((*MEMORY[0x1E4FBC8C8] & *v2) + qword_1E9171CB8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  id v7 = (void *)sub_18C2CA6E0();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_18C2A81A4(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LockScreenHostingController();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_18C2A823C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_18C2A81A4(a3);
}

id sub_18C2A8264()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LockScreenHostingController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_18C2A82F8(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return sub_18C2CA6F0();
}

void sub_18C2A83E0(uint64_t a1, double a2)
{
  uint64_t v5 = sub_18C2CA840();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *(void **)(v2 + 16);
  objc_msgSend(v9, sel_pointSize);
  id v11 = objc_msgSend(v9, sel_fontWithSize_, v10 * a2);
  unint64_t v12 = (void *)sub_18C2CA9D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CE70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18C2DD530;
  unint64_t v14 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = sub_18C29B910(0, (unint64_t *)&qword_1E916CE30);
  *(void *)(inited + 40) = v11;
  id v15 = v14;
  id v16 = v11;
  sub_18C2A9B58(inited);
  type metadata accessor for Key(0);
  sub_18C2A99F8((unint64_t *)&qword_1E916CDF8, type metadata accessor for Key);
  uint64_t v17 = (void *)sub_18C2CA990();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_sizeWithAttributes_, v17);

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t v18 = sub_18C2B89E8(v8);
  PRPosterTitleLayoutIsVertical(v18);
}

uint64_t sub_18C2A8618()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E916CA30);
  uint64_t v1 = MEMORY[0x1F4188790](v0 - 8);
  id v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v15 - v4;
  uint64_t v6 = sub_18C2CA340();
  __swift_allocate_value_buffer(v6, qword_1E916CD18);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1E916CD18);
  uint64_t v8 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  id v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  if (!v8
    || (double v10 = (void *)v8,
        uint64_t v11 = *(void *)(v6 - 8),
        v9(v3, 1, 1, v6),
        sub_18C2A99F8(&qword_1E916CA28, MEMORY[0x1E4F26E08]),
        sub_18C2CACB0(),
        v10,
        unint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48),
        v12(v3, 1, v6) == 1))
  {
    v9(v5, 1, 1, v6);
LABEL_4:
    sub_18C2CA330();
    return sub_18C2A9998((uint64_t)v5);
  }
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v14(v5, v3, v6);
  v9(v5, 0, 1, v6);
  if (v12(v5, 1, v6) == 1) {
    goto LABEL_4;
  }
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(v7, v5, v6);
}

uint64_t sub_18C2A885C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18C2CA4E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E916CA40 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9171CA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  sub_18C2A9964(v1);
  uint64_t v7 = sub_18C2CA4D0();
  os_log_type_t v8 = sub_18C2CAAA0();
  int v9 = v8;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    int v26 = v9;
    uint64_t v11 = v10;
    uint64_t v24 = swift_slowAlloc();
    os_log_t v25 = v7;
    unint64_t v12 = (void *)v24;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v29 = v27;
    *(_DWORD *)uint64_t v11 = 136317442;
    uint64_t v14 = *(void *)v1;
    unint64_t v13 = *(void *)(v1 + 8);
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_18C2ACEC8(v14, v13, &v29);
    sub_18C2CAB70();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    uint64_t v15 = *(void **)(v1 + 16);
    uint64_t v28 = (uint64_t)v15;
    id v16 = v15;
    sub_18C2CAB70();
    *unint64_t v12 = v15;
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 22) = 2048;
    uint64_t v28 = *(void *)(v1 + 24);
    sub_18C2CAB70();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 32) = 2048;
    uint64_t v28 = *(void *)(v1 + 32);
    sub_18C2CAB70();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 42) = 2048;
    uint64_t v28 = *(void *)(v1 + 40);
    sub_18C2CAB70();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 52) = 2048;
    uint64_t v28 = *(void *)(v1 + 48);
    sub_18C2CAB70();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 62) = 2080;
    uint64_t v17 = sub_18C2CAB20();
    uint64_t v28 = sub_18C2ACEC8(v17, v18, &v29);
    sub_18C2CAB70();
    swift_bridgeObjectRelease();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 72) = 2048;
    uint64_t v28 = *(void *)(v1 + 88);
    sub_18C2CAB70();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 82) = 2048;
    uint64_t v28 = *(void *)(v1 + 96);
    sub_18C2CAB70();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    *(_WORD *)(v11 + 92) = 2080;
    if (*(unsigned char *)(v1 + 104)) {
      uint64_t v19 = 5457241;
    }
    else {
      uint64_t v19 = 20302;
    }
    if (*(unsigned char *)(v1 + 104)) {
      unint64_t v20 = 0xE300000000000000;
    }
    else {
      unint64_t v20 = 0xE200000000000000;
    }
    uint64_t v28 = sub_18C2ACEC8(v19, v20, &v29);
    sub_18C2CAB70();
    swift_bridgeObjectRelease();
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    uint64_t v7 = v25;
    _os_log_impl(&dword_18C1C4000, v25, (os_log_type_t)v26, "---\nIncomingCallTextView.Configuration.Metrics\n---\nString: %s\nFont: %@\nA1: %f, A2: %f\nD1: %f, D2: %f\nGlyph Bounds: %s\nAscender Adjustment: %f\nDescender Adjustment: %f\nNeeds Taller Line Height: %s", (uint8_t *)v11, 0x66u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
    uint64_t v21 = v24;
    swift_arrayDestroy();
    MEMORY[0x192F91CB0](v21, -1, -1);
    uint64_t v22 = v27;
    swift_arrayDestroy();
    MEMORY[0x192F91CB0](v22, -1, -1);
    MEMORY[0x192F91CB0](v11, -1, -1);
  }
  else
  {
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
    sub_18C2A9538(v1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_18C2A8E24(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[5];
  v10[4] = a1[4];
  v11[0] = v2;
  *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)a1 + 89);
  long long v3 = a1[1];
  v10[0] = *a1;
  v10[1] = v3;
  long long v4 = a1[3];
  v10[2] = a1[2];
  v10[3] = v4;
  long long v5 = a2[1];
  v12[0] = *a2;
  v12[1] = v5;
  long long v6 = a2[2];
  long long v7 = a2[3];
  *(_OWORD *)&_OWORD v13[9] = *(_OWORD *)((char *)a2 + 89);
  long long v8 = a2[5];
  v12[4] = a2[4];
  *(_OWORD *)unint64_t v13 = v8;
  v12[2] = v6;
  v12[3] = v7;
  return sub_18C2A984C((uint64_t)v10, (uint64_t)v12) & 1;
}

double static IncomingCallTextViewConfigurationMetrics.idealSpaceBetween(topText:topFont:bottomText:bottomFont:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  swift_bridgeObjectRetain();
  sub_18C2A911C(a1, a2, a3, (uint64_t)v13);
  swift_bridgeObjectRetain();
  sub_18C2A911C(a4, a5, a6, (uint64_t)v14);
  sub_18C2A9538((uint64_t)v14);
  sub_18C2A9538((uint64_t)v13);
  return round(v13[12] + v15);
}

id IncomingCallTextViewConfigurationMetrics.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id IncomingCallTextViewConfigurationMetrics.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IncomingCallTextViewConfigurationMetrics();
  return objc_msgSendSuper2(&v2, sel_init);
}

id IncomingCallTextViewConfigurationMetrics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IncomingCallTextViewConfigurationMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_18C2A911C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = qword_1E916CD38;
  swift_bridgeObjectRetain();
  id v9 = a3;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_18C2CA340();
  __swift_project_value_buffer(v10, (uint64_t)qword_1E916CD18);
  sub_18C29C9C0();
  sub_18C2CAB90();
  char v12 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CE70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18C2DD530;
  uint64_t v14 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = sub_18C29B910(0, (unint64_t *)&qword_1E916CE30);
  *(void *)(inited + 40) = v9;
  swift_bridgeObjectRetain();
  id v15 = v9;
  id v16 = v14;
  sub_18C2A9B58(inited);
  id v17 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  unint64_t v18 = (void *)sub_18C2CA9D0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_18C2A99F8((unint64_t *)&qword_1E916CDF8, type metadata accessor for Key);
  uint64_t v19 = (void *)sub_18C2CA990();
  swift_bridgeObjectRelease();
  CFAttributedStringRef v20 = (const __CFAttributedString *)objc_msgSend(v17, sel_initWithString_attributes_, v18, v19);

  uint64_t v21 = CTLineCreateWithAttributedString(v20);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 8uLL);
  CGFloat x = BoundsWithOptions.origin.x;
  CGFloat y = BoundsWithOptions.origin.y;
  CGFloat width = BoundsWithOptions.size.width;
  double height = BoundsWithOptions.size.height;
  objc_msgSend(v15, sel_pointSize);
  double v27 = v26 * 0.77;
  objc_msgSend(v15, sel_pointSize);
  CGFloat v29 = v28 * 0.95;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.double height = height;
  CGFloat v46 = v29;
  double v47 = v27;
  if (v29 >= CGRectGetMaxY(v49))
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.double height = height;
    CGFloat MaxY = CGRectGetMaxY(v50);
    double v32 = 0.0;
    if (v27 < MaxY) {
      goto LABEL_8;
    }
    double v30 = -0.07;
  }
  else
  {
    double v30 = 0.16;
  }
  objc_msgSend(v15, sel_pointSize);
  double v32 = v33 * v30;
LABEL_8:
  double v45 = v32;
  objc_msgSend(v15, sel_pointSize);
  double v35 = v34 * -0.06;
  objc_msgSend(v15, sel_pointSize);
  CGFloat v37 = v36 * -0.25;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.double height = height;
  CGFloat v44 = v37;
  if (CGRectGetMinY(v51) < v37)
  {
    double v38 = v35;
    double v39 = 0.1;
LABEL_12:
    objc_msgSend(v15, sel_pointSize);
    double v40 = v41 * v39;
    goto LABEL_13;
  }
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.double height = height;
  double v40 = 0.0;
  double v38 = v35;
  if (CGRectGetMinY(v52) >= v35)
  {
    double v39 = -0.04;
    goto LABEL_12;
  }
LABEL_13:
  id v42 = v15;
  sub_18C2A885C();

  swift_bridgeObjectRelease();
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = v42;
  *(double *)(a4 + 24) = v47;
  *(CGFloat *)(a4 + 32) = v46;
  *(double *)(a4 + 40) = v38;
  *(CGFloat *)(a4 + 48) = v44;
  *(CGFloat *)(a4 + 56) = x;
  *(CGFloat *)(a4 + 64) = y;
  double result = height;
  *(CGFloat *)(a4 + 72) = width;
  *(double *)(a4 + 80) = height;
  *(double *)(a4 + 88) = v45;
  *(double *)(a4 + 96) = v40;
  *(unsigned char *)(a4 + 104) = (v12 & 1) == 0;
  return result;
}

uint64_t sub_18C2A9538(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for IncomingCallTextViewConfigurationMetrics()
{
  return self;
}

void _s7MetricsVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 16);
}

uint64_t _s7MetricsVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t _s7MetricsVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  return a1;
}

__n128 __swift_memcpy105_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t _s7MetricsVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  return a1;
}

uint64_t _s7MetricsVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 105)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s7MetricsVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 105) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 105) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s7MetricsVMa()
{
  return &_s7MetricsVN;
}

uint64_t sub_18C2A984C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_18C2CACD0(), char v6 = 0, (v5 & 1) != 0))
  {
    sub_18C29B910(0, qword_1E916C9E0);
    if ((sub_18C2CAB30() & 1) != 0
      && *(double *)(a1 + 24) == *(double *)(a2 + 24)
      && *(double *)(a1 + 32) == *(double *)(a2 + 32)
      && *(double *)(a1 + 40) == *(double *)(a2 + 40)
      && *(double *)(a1 + 48) == *(double *)(a2 + 48)
      && CGRectEqualToRect(*(CGRect *)(a1 + 56), *(CGRect *)(a2 + 56))
      && *(double *)(a1 + 88) == *(double *)(a2 + 88)
      && *(double *)(a1 + 96) == *(double *)(a2 + 96))
    {
      char v6 = ((*(unsigned char *)(a1 + 104) & 1) == 0) ^ *(unsigned char *)(a2 + 104);
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6 & 1;
}

uint64_t sub_18C2A9964(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

uint64_t sub_18C2A9998(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E916CA30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18C2A99F8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18C2A9A40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916C9F8);
  uint64_t v2 = (void *)sub_18C2CAC80();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  BOOL v4 = (double *)(a1 + 48);
  while (1)
  {
    double v5 = *(v4 - 1);
    double v6 = *v4;
    id v7 = *((id *)v4 - 2);
    unint64_t result = sub_18C2AD610((uint64_t)v7, v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (double *)(v2[6] + 16 * result);
    *(void *)uint64_t v10 = v7;
    v10[1] = v5;
    *(double *)(v2[7] + 8 * result) = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_18C2A9B58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E916CE58);
  uint64_t v2 = sub_18C2CAC80();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_18C2A7B8C(v6, (uint64_t)&v13, (uint64_t *)&unk_1E916CE20);
    uint64_t v7 = v13;
    unint64_t result = sub_18C2AD6A0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_18C2AFCE0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_18C2A9C88(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170850);
  uint64_t v2 = (void *)sub_18C2CAC80();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_18C2AD734(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_18C2A9DA4()
{
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  v22[0] = 0;
  id v1 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v22);
  id v2 = v22[0];
  if (v1)
  {
    uint64_t v3 = sub_18C2CA420();
    unint64_t v5 = v4;

    uint64_t v6 = sub_18C2CA410();
    sub_18C2AFCF0(v3, v5);
  }
  else
  {
    uint64_t v7 = v2;
    id v8 = (void *)sub_18C2CA3E0();

    swift_willThrow();
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_18C2CA4E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1E9171CA0);
    os_log_type_t v10 = sub_18C2CAAB0();
    id v11 = v0;
    id v12 = v8;
    id v13 = v11;
    id v14 = v8;
    id v15 = sub_18C2CA4D0();
    if (os_log_type_enabled(v15, v10))
    {
      uint64_t v16 = swift_slowAlloc();
      id v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412546;
      v22[0] = v13;
      id v18 = v13;
      sub_18C2CAB70();
      void *v17 = v13;

      *(_WORD *)(v16 + 12) = 2112;
      id v19 = v8;
      CFAttributedStringRef v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v22[0] = v20;
      sub_18C2CAB70();
      v17[1] = v20;

      _os_log_impl(&dword_18C1C4000, v15, v10, "Error archiving object %@: %@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
      swift_arrayDestroy();
      MEMORY[0x192F91CB0](v17, -1, -1);
      MEMORY[0x192F91CB0](v16, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v6;
}

uint64_t sub_18C2AA08C(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = sub_18C2CA3F0();
  uint64_t v6 = 0;
  if (v5 >> 60 != 15)
  {
    uint64_t v7 = v4;
    unint64_t v8 = v5;
    sub_18C29B910(0, &qword_1E9170848);
    sub_18C29B910(0, a3);
    uint64_t v6 = sub_18C2CAB00();
    sub_18C2AFD48(v7, v8);
  }
  return v6;
}

__CFString *PRPosterHomeScreenConfiguration.attributeType.getter()
{
  return @"PRPosterRoleAttributeTypeHomeScreenConfiguration";
}

uint64_t PRPosterHomeScreenConfiguration.encodeJSON()()
{
  id v1 = v0;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(v0, sel_selectedAppearanceType);
  uint64_t v87 = MEMORY[0x1E4FBB808];
  uint64_t v88 = MEMORY[0x1E4FBB810];
  *(void *)&long long v86 = v2;
  sub_18C2AAF24(&v86, (uint64_t)v84);
  uint64_t v3 = MEMORY[0x1E4FBC868];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v82 = v3;
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (uint64_t *)((char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  sub_18C2AF7F4(*v7, 0xD000000000000016, 0x800000018C2E6000, isUniquelyReferenced_nonNull_native, &v82);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
  uint64_t v9 = v82;
  uint64_t v83 = v82;
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v1, sel_lockPosterAppearance);
  uint64_t v11 = sub_18C2A9DA4();
  uint64_t v13 = v12;

  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  uint64_t v15 = MEMORY[0x1E4FBB1A8];
  if (v13)
  {
    uint64_t v87 = MEMORY[0x1E4FBB1A0];
    uint64_t v88 = MEMORY[0x1E4FBB1A8];
    *(void *)&long long v86 = v11;
    *((void *)&v86 + 1) = v13;
    sub_18C2AAF24(&v86, (uint64_t)v84);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = v9;
    uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1F4188790](v17);
    id v19 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v20 + 16))(v19);
    sub_18C2AF9E8((uint64_t)v19, 0xD000000000000014, 0x800000018C2E6020, v16, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18C2ADAF8(0xD000000000000014, 0x800000018C2E6020, (uint64_t)&v86);
    sub_18C2A7BF0((uint64_t)&v86, &qword_1E9170800);
  }
  id v21 = objc_msgSend(v1, sel_solidColorAppearance);
  uint64_t v22 = sub_18C2A9DA4();
  uint64_t v24 = v23;

  if (v24)
  {
    uint64_t v87 = v14;
    uint64_t v88 = v15;
    *(void *)&long long v86 = v22;
    *((void *)&v86 + 1) = v24;
    sub_18C2AAF24(&v86, (uint64_t)v84);
    uint64_t v25 = v83;
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = v25;
    uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1F4188790](v27);
    CGFloat v29 = (char *)&v81 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v30 + 16))(v29);
    sub_18C2AF9E8((uint64_t)v29, 0xD000000000000014, 0x800000018C2E6040, v26, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18C2ADAF8(0xD000000000000014, 0x800000018C2E6040, (uint64_t)&v86);
    sub_18C2A7BF0((uint64_t)&v86, &qword_1E9170800);
  }
  id v31 = objc_msgSend(v1, sel_gradientAppearance);
  uint64_t v32 = sub_18C2A9DA4();
  uint64_t v34 = v33;

  if (v34)
  {
    uint64_t v87 = v14;
    uint64_t v88 = v15;
    *(void *)&long long v86 = v32;
    *((void *)&v86 + 1) = v34;
    sub_18C2AAF24(&v86, (uint64_t)v84);
    uint64_t v35 = v83;
    char v36 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = v35;
    uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1F4188790](v37);
    double v39 = (char *)&v81 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v40 + 16))(v39);
    sub_18C2AF9E8((uint64_t)v39, 0xD000000000000012, 0x800000018C2E6060, v36, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18C2ADAF8(0xD000000000000012, 0x800000018C2E6060, (uint64_t)&v86);
    sub_18C2A7BF0((uint64_t)&v86, &qword_1E9170800);
  }
  id v41 = objc_msgSend(v1, sel_homePosterAppearance);
  uint64_t v42 = sub_18C2A9DA4();
  uint64_t v44 = v43;

  if (v44)
  {
    uint64_t v87 = v14;
    uint64_t v88 = v15;
    *(void *)&long long v86 = v42;
    *((void *)&v86 + 1) = v44;
    sub_18C2AAF24(&v86, (uint64_t)v84);
    uint64_t v45 = v83;
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = v45;
    uint64_t v47 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1F4188790](v47);
    CGRect v49 = (char *)&v81 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v50 + 16))(v49);
    sub_18C2AF9E8((uint64_t)v49, 0xD000000000000014, 0x800000018C2E6080, v46, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18C2ADAF8(0xD000000000000014, 0x800000018C2E6080, (uint64_t)&v86);
    sub_18C2A7BF0((uint64_t)&v86, &qword_1E9170800);
  }
  id v51 = objc_msgSend(v1, sel_customizationConfiguration);
  uint64_t v52 = sub_18C2A9DA4();
  uint64_t v54 = v53;

  if (v54)
  {
    uint64_t v87 = v14;
    uint64_t v88 = v15;
    *(void *)&long long v86 = v52;
    *((void *)&v86 + 1) = v54;
    sub_18C2AAF24(&v86, (uint64_t)v84);
    uint64_t v55 = v83;
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = v55;
    uint64_t v57 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1F4188790](v57);
    uint64_t v59 = (char *)&v81 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v60 + 16))(v59);
    sub_18C2AF9E8((uint64_t)v59, 0xD00000000000001ALL, 0x800000018C2E60A0, v56, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18C2ADAF8(0xD00000000000001ALL, 0x800000018C2E60A0, (uint64_t)&v86);
    sub_18C2A7BF0((uint64_t)&v86, &qword_1E9170800);
  }
  uint64_t v61 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170808);
  char v62 = (void *)sub_18C2CA990();
  swift_bridgeObjectRelease();
  *(void *)&long long v86 = 0;
  id v63 = objc_msgSend(v61, sel_dataWithJSONObject_options_error_, v62, 0, &v86);

  id v64 = (id)v86;
  if (v63)
  {
    uint64_t v65 = sub_18C2CA420();
  }
  else
  {
    char v66 = v64;
    char v67 = (void *)sub_18C2CA3E0();

    swift_willThrow();
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v68 = sub_18C2CA4E0();
    __swift_project_value_buffer(v68, (uint64_t)qword_1E9171CA0);
    os_log_type_t v69 = sub_18C2CAAB0();
    id v70 = v1;
    id v71 = v67;
    id v72 = v70;
    id v73 = v67;
    int v74 = sub_18C2CA4D0();
    if (os_log_type_enabled(v74, v69))
    {
      uint64_t v75 = swift_slowAlloc();
      char v76 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v75 = 138412546;
      *(void *)&long long v86 = v72;
      id v77 = v72;
      sub_18C2CAB70();
      *char v76 = v72;

      *(_WORD *)(v75 + 12) = 2112;
      id v78 = v67;
      uint64_t v79 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v86 = v79;
      sub_18C2CAB70();
      v76[1] = v79;

      _os_log_impl(&dword_18C1C4000, v74, v69, "Error serializing into json %@ : %@", (uint8_t *)v75, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
      swift_arrayDestroy();
      MEMORY[0x192F91CB0](v76, -1, -1);
      MEMORY[0x192F91CB0](v75, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v65;
}

uint64_t sub_18C2AAF24(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t static PRPosterHomeScreenConfiguration.decodeObject(withJSON:)()
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  id v1 = (void *)sub_18C2CA400();
  *(void *)&long long v59 = 0;
  id v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 0, &v59);

  if (!v2)
  {
    id v7 = (id)v59;
    uint64_t v8 = (void *)sub_18C2CA3E0();

    swift_willThrow();
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_18C2CA4E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1E9171CA0);
    os_log_type_t v10 = sub_18C2CAAB0();
    id v11 = v8;
    id v12 = v8;
    uint64_t v13 = sub_18C2CA4D0();
    os_log_type_t v14 = v10;
    if (os_log_type_enabled(v13, v10))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      char v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 138412290;
      id v17 = v8;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v59 = v18;
      sub_18C2CAB70();
      void *v16 = v18;

      _os_log_impl(&dword_18C1C4000, v13, v14, "Error decoding json data into an object: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
      swift_arrayDestroy();
      MEMORY[0x192F91CB0](v16, -1, -1);
      MEMORY[0x192F91CB0](v15, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v3 = (id)v59;
  sub_18C2CABA0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170818);
  if (swift_dynamicCast()) {
    uint64_t v4 = v57;
  }
  else {
    uint64_t v4 = 0;
  }
  if (!v4)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
    uint64_t v19 = 0;
LABEL_20:
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_21:
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    goto LABEL_34;
  }
  if (!*(void *)(v4 + 16))
  {
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_22:
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
LABEL_23:
    uint64_t v19 = 0;
    if (!*(void *)(v4 + 16)) {
      goto LABEL_20;
    }
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_18C2AD734(0xD000000000000016, 0x800000018C2E6000);
  if (v6)
  {
    sub_18C2AFC1C(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_22;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_23;
  }
  uint64_t v19 = v57;
  if (!*(void *)(v4 + 16)) {
    goto LABEL_20;
  }
LABEL_24:
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_18C2AD734(0xD000000000000014, 0x800000018C2E6020);
  if (v23)
  {
    sub_18C2AFC1C(*(void *)(v4 + 56) + 32 * v22, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_21;
  }
  int v24 = swift_dynamicCast();
  BOOL v25 = v24 == 0;
  if (v24) {
    uint64_t v20 = v57;
  }
  else {
    uint64_t v20 = 0;
  }
  if (v25) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v58;
  }
LABEL_34:
  char v26 = (void *)sub_18C2AA08C(v20, v21, &qword_1E9170898);
  swift_bridgeObjectRelease();
  if (!v4 || !*(void *)(v4 + 16))
  {
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_39:
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    goto LABEL_48;
  }
  swift_bridgeObjectRetain();
  unint64_t v27 = sub_18C2AD734(0xD000000000000014, 0x800000018C2E6040);
  if (v28)
  {
    sub_18C2AFC1C(*(void *)(v4 + 56) + 32 * v27, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_39;
  }
  int v31 = swift_dynamicCast();
  BOOL v32 = v31 == 0;
  if (v31) {
    uint64_t v29 = v57;
  }
  else {
    uint64_t v29 = 0;
  }
  if (v32) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v58;
  }
LABEL_48:
  uint64_t v33 = (void *)sub_18C2AA08C(v29, v30, &qword_1E9170890);
  swift_bridgeObjectRelease();
  if (!v4 || !*(void *)(v4 + 16))
  {
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_53:
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_18C2AD734(0xD000000000000012, 0x800000018C2E6060);
  if (v35)
  {
    sub_18C2AFC1C(*(void *)(v4 + 56) + 32 * v34, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_53;
  }
  int v38 = swift_dynamicCast();
  BOOL v39 = v38 == 0;
  if (v38) {
    uint64_t v36 = v57;
  }
  else {
    uint64_t v36 = 0;
  }
  if (v39) {
    uint64_t v37 = 0;
  }
  else {
    uint64_t v37 = v58;
  }
LABEL_62:
  uint64_t v40 = (void *)sub_18C2AA08C(v36, v37, &qword_1E9170888);
  swift_bridgeObjectRelease();
  if (!v4 || !*(void *)(v4 + 16))
  {
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_67:
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    goto LABEL_76;
  }
  swift_bridgeObjectRetain();
  unint64_t v41 = sub_18C2AD734(0xD000000000000014, 0x800000018C2E6080);
  if (v42)
  {
    sub_18C2AFC1C(*(void *)(v4 + 56) + 32 * v41, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_67;
  }
  int v45 = swift_dynamicCast();
  BOOL v46 = v45 == 0;
  if (v45) {
    uint64_t v43 = v57;
  }
  else {
    uint64_t v43 = 0;
  }
  if (v46) {
    uint64_t v44 = 0;
  }
  else {
    uint64_t v44 = v58;
  }
LABEL_76:
  uint64_t v47 = (void *)sub_18C2AA08C(v43, v44, &qword_1E9170880);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    long long v59 = 0u;
    long long v60 = 0u;
LABEL_89:
    sub_18C2A7BF0((uint64_t)&v59, &qword_1E9170820);
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    goto LABEL_90;
  }
  if (*(void *)(v4 + 16) && (unint64_t v48 = sub_18C2AD734(0xD00000000000001ALL, 0x800000018C2E60A0), (v49 & 1) != 0))
  {
    sub_18C2AFC1C(*(void *)(v4 + 56) + 32 * v48, (uint64_t)&v59);
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v60 + 1)) {
    goto LABEL_89;
  }
  int v50 = swift_dynamicCast();
  BOOL v51 = v50 == 0;
  if (v50) {
    uint64_t v52 = v57;
  }
  else {
    uint64_t v52 = 0;
  }
  if (v51) {
    uint64_t v53 = 0;
  }
  else {
    uint64_t v53 = v58;
  }
LABEL_90:
  uint64_t v54 = (void *)sub_18C2AA08C(v52, v53, &qword_1E9170878);
  swift_bridgeObjectRelease();
  if (!v54)
  {

LABEL_99:
LABEL_100:

LABEL_101:
    return 0;
  }
  if (!v26)
  {

    goto LABEL_99;
  }
  if (!v33)
  {

    goto LABEL_100;
  }
  if (!v40)
  {

    goto LABEL_101;
  }
  if (v47)
  {
    id v55 = objc_msgSend(objc_allocWithZone((Class)PRPosterHomeScreenConfiguration), sel_initWithSelectedAppearanceType_lockPosterAppearance_solidColorAppearance_gradientAppearance_homePosterAppearance_customizationConfiguration_, v19, v26, v33, v40, v47, v54);

    uint64_t result = swift_dynamicCastUnknownClass();
    if (result) {
      return result;
    }
  }
  else
  {
  }
  return 0;
}

__CFString *PRPosterSuggestionMetadata.attributeType.getter()
{
  return @"PRPosterRoleAttributeTypeSuggestionMetadata";
}

uint64_t PRPosterSuggestionMetadata.encodeJSON()()
{
  id v1 = v0;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170828);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  unint64_t v5 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  id v7 = (char *)v46 - v6;
  uint64_t v47 = MEMORY[0x1E4FBC868];
  id v8 = objc_msgSend(v1, sel_lastModifiedDate);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_18C2CA460();

    uint64_t v10 = sub_18C2CA470();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  else
  {
    uint64_t v10 = sub_18C2CA470();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  }
  sub_18C2AFC78((uint64_t)v5, (uint64_t)v7);
  sub_18C2CA470();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
  {
    sub_18C2A7BF0((uint64_t)v7, &qword_1E9170828);
    sub_18C2ADC04(0xD000000000000010, 0x800000018C2E60C0, &v49);
    sub_18C2A7BF0((uint64_t)&v49, &qword_1E9170820);
  }
  else
  {
    sub_18C2CA440();
    uint64_t v50 = MEMORY[0x1E4FBB3D0];
    *(void *)&long long v49 = v12;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    sub_18C2AFCE0(&v49, v48);
    uint64_t v13 = v47;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v46[0] = v13;
    sub_18C2AEE88(v48, 0xD000000000000010, 0x800000018C2E60C0, isUniquelyReferenced_nonNull_native);
    uint64_t v47 = v46[0];
    swift_bridgeObjectRelease();
  }
  id v15 = objc_msgSend(v1, sel_suggestedGalleryItem);
  if (v15)
  {
    char v16 = v15;
    uint64_t v17 = sub_18C2A9DA4();
    if (v18)
    {
      uint64_t v50 = MEMORY[0x1E4FBB1A0];
      *(void *)&long long v49 = v17;
      *((void *)&v49 + 1) = v18;
      sub_18C2AFCE0(&v49, v48);
      uint64_t v19 = v47;
      char v20 = swift_isUniquelyReferenced_nonNull_native();
      v46[0] = v19;
      sub_18C2AEE88(v48, 0xD000000000000014, 0x800000018C2E6110, v20);
      uint64_t v47 = v46[0];

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_18C2ADC04(0xD000000000000014, 0x800000018C2E6110, &v49);
      sub_18C2A7BF0((uint64_t)&v49, &qword_1E9170820);
    }
  }
  id v21 = objc_msgSend(v1, sel_suggestedComplicationsByIdentifier);
  sub_18C29B910(0, &qword_1E9170830);
  uint64_t v22 = sub_18C2CA9A0();

  uint64_t v23 = sub_18C2AF5D4(v22);
  swift_bridgeObjectRelease();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170838);
  *(void *)&long long v49 = v23;
  sub_18C2AFCE0(&v49, v48);
  uint64_t v24 = v47;
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  v46[0] = v24;
  sub_18C2AEE88(v48, 0xD000000000000022, 0x800000018C2E60E0, v25);
  uint64_t v47 = v46[0];
  swift_bridgeObjectRelease();
  char v26 = self;
  unint64_t v27 = (void *)sub_18C2CA990();
  swift_bridgeObjectRelease();
  *(void *)&long long v49 = 0;
  id v28 = objc_msgSend(v26, sel_dataWithJSONObject_options_error_, v27, 0, &v49);

  id v29 = (id)v49;
  if (v28)
  {
    uint64_t v30 = sub_18C2CA420();
  }
  else
  {
    int v31 = v29;
    BOOL v32 = (void *)sub_18C2CA3E0();

    swift_willThrow();
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_18C2CA4E0();
    __swift_project_value_buffer(v33, (uint64_t)qword_1E9171CA0);
    os_log_type_t v34 = sub_18C2CAAB0();
    id v35 = v1;
    id v36 = v32;
    id v37 = v35;
    id v38 = v32;
    BOOL v39 = sub_18C2CA4D0();
    if (os_log_type_enabled(v39, v34))
    {
      uint64_t v40 = swift_slowAlloc();
      unint64_t v41 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 138412546;
      *(void *)&long long v49 = v37;
      id v42 = v37;
      sub_18C2CAB70();
      void *v41 = v37;

      *(_WORD *)(v40 + 12) = 2112;
      id v43 = v32;
      uint64_t v44 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v49 = v44;
      sub_18C2CAB70();
      v41[1] = v44;

      _os_log_impl(&dword_18C1C4000, v39, v34, "Error serializing into json %@ : %@", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
      swift_arrayDestroy();
      MEMORY[0x192F91CB0](v41, -1, -1);
      MEMORY[0x192F91CB0](v40, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v30;
}

id sub_18C2ABF40(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();
  unint64_t v7 = v6;

  if (v7 >> 60 == 15)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (void *)sub_18C2CA400();
    sub_18C2AFD48(v5, v7);
  }
  return v8;
}

uint64_t static PRPosterSuggestionMetadata.decodeObject(withJSON:)()
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170828);
  uint64_t v1 = MEMORY[0x1F4188790](v0 - 8);
  uint64_t v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x1F4188790](v1);
  unint64_t v6 = (char *)&v45 - v5;
  MEMORY[0x1F4188790](v4);
  id v8 = (char *)&v45 - v7;
  uint64_t v9 = self;
  uint64_t v10 = (void *)sub_18C2CA400();
  *(void *)&long long v48 = 0;
  id v11 = objc_msgSend(v9, sel_JSONObjectWithData_options_error_, v10, 0, &v48);

  if (!v11)
  {
    id v24 = (id)v48;
    char v25 = (void *)sub_18C2CA3E0();

    swift_willThrow();
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_18C2CA4E0();
    __swift_project_value_buffer(v26, (uint64_t)qword_1E9171CA0);
    os_log_type_t v27 = sub_18C2CAAB0();
    id v28 = v25;
    id v29 = v25;
    uint64_t v30 = sub_18C2CA4D0();
    os_log_type_t v31 = v27;
    if (os_log_type_enabled(v30, v27))
    {
      BOOL v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v32 = 138412290;
      id v34 = v25;
      uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v48 = v35;
      sub_18C2CAB70();
      *uint64_t v33 = v35;

      _os_log_impl(&dword_18C1C4000, v30, v31, "Error decoding json data into an object: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
      swift_arrayDestroy();
      MEMORY[0x192F91CB0](v33, -1, -1);
      MEMORY[0x192F91CB0](v32, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v12 = (id)v48;
  sub_18C2CABA0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170818);
  if (swift_dynamicCast()) {
    uint64_t v13 = v46;
  }
  else {
    uint64_t v13 = 0;
  }
  if (!v13 || !*(void *)(v13 + 16))
  {
    long long v48 = 0u;
    long long v49 = 0u;
LABEL_10:
    sub_18C2A7BF0((uint64_t)&v48, &qword_1E9170820);
LABEL_11:
    char v16 = 1;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_18C2AD734(0xD000000000000010, 0x800000018C2E60C0);
  if (v15)
  {
    sub_18C2AFC1C(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v49 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_11;
  }
  char v16 = 0;
LABEL_12:
  uint64_t v17 = sub_18C2CA470();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v19(v8, 1, 1, v17);
  if ((v16 & 1) == 0)
  {
    sub_18C2CA430();
    sub_18C2A7BF0((uint64_t)v8, &qword_1E9170828);
    v19(v6, 0, 1, v17);
    sub_18C2AFC78((uint64_t)v6, (uint64_t)v8);
  }
  if (!v13 || !*(void *)(v13 + 16))
  {
    long long v48 = 0u;
    long long v49 = 0u;
LABEL_19:
    sub_18C2A7BF0((uint64_t)&v48, &qword_1E9170820);
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_18C2AD734(0xD000000000000014, 0x800000018C2E6110);
  if (v21)
  {
    sub_18C2AFC1C(*(void *)(v13 + 56) + 32 * v20, (uint64_t)&v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v49 + 1)) {
    goto LABEL_19;
  }
  int v36 = swift_dynamicCast();
  BOOL v37 = v36 == 0;
  if (v36) {
    uint64_t v22 = v46;
  }
  else {
    uint64_t v22 = 0;
  }
  if (v37) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = v47;
  }
LABEL_37:
  id v38 = (void *)sub_18C2AA08C(v22, v23, &qword_1E9170860);
  swift_bridgeObjectRelease();
  if (!v13)
  {
    long long v48 = 0u;
    long long v49 = 0u;
LABEL_46:
    sub_18C2A7BF0((uint64_t)&v48, &qword_1E9170820);
    goto LABEL_47;
  }
  if (*(void *)(v13 + 16) && (unint64_t v39 = sub_18C2AD734(0xD000000000000022, 0x800000018C2E60E0), (v40 & 1) != 0))
  {
    sub_18C2AFC1C(*(void *)(v13 + 56) + 32 * v39, (uint64_t)&v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v49 + 1)) {
    goto LABEL_46;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170840);
  if (swift_dynamicCast())
  {
    sub_18C2AC744(v46);
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
LABEL_47:
  sub_18C2A9C88(MEMORY[0x1E4FBC860]);
LABEL_48:
  sub_18C2A7B8C((uint64_t)v8, (uint64_t)v3, &qword_1E9170828);
  sub_18C29B910(0, &qword_1E9170830);
  unint64_t v41 = (void *)sub_18C2CA990();
  swift_bridgeObjectRelease();
  id v42 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) != 1)
  {
    id v42 = (void *)sub_18C2CA450();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v17);
  }
  id v43 = objc_msgSend(objc_allocWithZone((Class)PRPosterSuggestionMetadata), sel_initWithSuggestedGalleryItem_suggestedComplicationsByIdentifier_lastModifiedDate_, v38, v41, v42);

  sub_18C2A7BF0((uint64_t)v8, &qword_1E9170828);
  uint64_t result = swift_dynamicCastUnknownClass();
  if (!result)
  {

    return 0;
  }
  return result;
}

void sub_18C2AC744(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v52 = a1 + 64;
  uint64_t v48 = MEMORY[0x1E4FBC868];
  uint64_t v54 = MEMORY[0x1E4FBC868];
  uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v51 = (unint64_t)(63 - v5) >> 6;
  int64_t v8 = 0;
  for (i = swift_bridgeObjectRetain(); ; uint64_t v3 = i)
  {
    while (1)
    {
      while (1)
      {
        if (v7)
        {
          unint64_t v9 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          unint64_t v10 = v9 | (v8 << 6);
        }
        else
        {
          int64_t v11 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
LABEL_51:
            __break(1u);
            goto LABEL_52;
          }
          if (v11 >= v51) {
            goto LABEL_49;
          }
          unint64_t v12 = *(void *)(v52 + 8 * v11);
          if (!v12)
          {
            int64_t v13 = v8 + 2;
            if (v8 + 2 >= v51) {
              goto LABEL_49;
            }
            unint64_t v12 = *(void *)(v52 + 8 * v13);
            if (!v12)
            {
              int64_t v13 = v8 + 3;
              if (v8 + 3 >= v51) {
                goto LABEL_49;
              }
              unint64_t v12 = *(void *)(v52 + 8 * v13);
              if (!v12)
              {
                int64_t v13 = v8 + 4;
                if (v8 + 4 >= v51) {
                  goto LABEL_49;
                }
                unint64_t v12 = *(void *)(v52 + 8 * v13);
                if (!v12)
                {
                  int64_t v13 = v8 + 5;
                  if (v8 + 5 >= v51)
                  {
LABEL_49:
                    sub_18C2AFD5C();
                    return;
                  }
                  unint64_t v12 = *(void *)(v52 + 8 * v13);
                  if (!v12)
                  {
                    while (1)
                    {
                      int64_t v11 = v13 + 1;
                      if (__OFADD__(v13, 1)) {
                        goto LABEL_51;
                      }
                      if (v11 >= v51) {
                        goto LABEL_49;
                      }
                      unint64_t v12 = *(void *)(v52 + 8 * v11);
                      ++v13;
                      if (v12) {
                        goto LABEL_20;
                      }
                    }
                  }
                }
              }
            }
            int64_t v11 = v13;
          }
LABEL_20:
          unint64_t v7 = (v12 - 1) & v12;
          unint64_t v10 = __clz(__rbit64(v12)) + (v11 << 6);
          int64_t v8 = v11;
        }
        unint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
        uint64_t v16 = *v14;
        uint64_t v15 = v14[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v17 = sub_18C2CA3F0();
        if (v18 >> 60 != 15) {
          break;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v19 = v17;
      unint64_t v20 = v18;
      sub_18C29B910(0, &qword_1E9170848);
      sub_18C29B910(0, &qword_1E9170830);
      uint64_t v21 = sub_18C2CAB00();
      if (!v2) {
        break;
      }
      sub_18C2AFD48(v19, v20);
      if (qword_1E916CA40 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_18C2CA4E0();
      __swift_project_value_buffer(v22, (uint64_t)qword_1E9171CA0);
      os_log_type_t v23 = sub_18C2CAAB0();
      id v24 = v2;
      id v25 = v2;
      uint64_t v26 = sub_18C2CA4D0();
      os_log_type_t v27 = v23;
      if (os_log_type_enabled(v26, v23))
      {
        uint64_t v28 = swift_slowAlloc();
        id v29 = (void *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        v53[0] = v49;
        *(_DWORD *)uint64_t v28 = 136315394;
        uint64_t v30 = sub_18C2CAD30();
        *(void *)(v28 + 4) = sub_18C2ACEC8(v30, v31, v53);
        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2112;
        id v32 = v2;
        uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v28 + 14) = v33;
        void *v29 = v33;

        _os_log_impl(&dword_18C1C4000, v26, v27, "Error unarchiving object for class %s: %@", (uint8_t *)v28, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170810);
        swift_arrayDestroy();
        MEMORY[0x192F91CB0](v29, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x192F91CB0](v49, -1, -1);
        MEMORY[0x192F91CB0](v28, -1, -1);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v2 = 0;
LABEL_31:
      uint64_t v3 = i;
    }
    uint64_t v34 = v21;
    sub_18C2AFD48(v19, v20);
    if (!v34)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    unint64_t v35 = *(void *)(v48 + 16);
    if (*(void *)(v48 + 24) <= v35) {
      sub_18C2AE644(v35 + 1, 1);
    }
    uint64_t v36 = v54;
    sub_18C2CACF0();
    sub_18C2CAA10();
    uint64_t v37 = sub_18C2CAD20();
    uint64_t v38 = v36 + 64;
    uint64_t v48 = v36;
    uint64_t v39 = -1 << *(unsigned char *)(v36 + 32);
    unint64_t v40 = v37 & ~v39;
    unint64_t v41 = v40 >> 6;
    if (((-1 << v40) & ~*(void *)(v36 + 64 + 8 * (v40 >> 6))) == 0) {
      break;
    }
    unint64_t v42 = __clz(__rbit64((-1 << v40) & ~*(void *)(v36 + 64 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
LABEL_48:
    *(void *)(v38 + ((v42 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v42;
    uint64_t v47 = (void *)(*(void *)(v36 + 48) + 16 * v42);
    void *v47 = v16;
    v47[1] = v15;
    *(void *)(*(void *)(v36 + 56) + 8 * v42) = v34;
    ++*(void *)(v36 + 16);
    swift_bridgeObjectRelease();
  }
  char v43 = 0;
  unint64_t v44 = (unint64_t)(63 - v39) >> 6;
  while (++v41 != v44 || (v43 & 1) == 0)
  {
    BOOL v45 = v41 == v44;
    if (v41 == v44) {
      unint64_t v41 = 0;
    }
    v43 |= v45;
    uint64_t v46 = *(void *)(v38 + 8 * v41);
    if (v46 != -1)
    {
      unint64_t v42 = __clz(__rbit64(~v46)) + (v41 << 6);
      goto LABEL_48;
    }
  }
LABEL_52:
  __break(1u);
}

id sub_18C2ACD48(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  id v5 = a3;
  uint64_t v6 = sub_18C2CA420();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  unint64_t v9 = (void *)a4(v6, v8);
  sub_18C2AFCF0(v6, v8);
  return v9;
}

uint64_t sub_18C2ACDDC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_18C2ACDEC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_18C2ACE28(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_18C2ACE50(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_18C2ACEC8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_18C2CAB70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_18C2ACEC8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_18C2ACF9C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_18C2AFC1C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_18C2AFC1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_18C2ACF9C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_18C2CAB80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_18C2AD158(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_18C2CAC10();
  if (!v8)
  {
    sub_18C2CAC40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_18C2CAC90();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_18C2AD158(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_18C2AD1F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18C2AD3D0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18C2AD3D0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18C2AD1F0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_18C2AD368(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_18C2CAC00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_18C2CAC40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_18C2CAA50();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_18C2CAC90();
    __break(1u);
LABEL_14:
    uint64_t result = sub_18C2CAC40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_18C2AD368(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170858);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18C2AD3D0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170858);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_18C2CAC90();
  __break(1u);
  return result;
}

unsigned char **sub_18C2AD520(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_18C2AD530(uint64_t (*a1)(void))
{
  return a1();
}

void sub_18C2AD558(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_18C2CAB70();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_18C2AD610(uint64_t a1, double a2)
{
  sub_18C2CACF0();
  sub_18C2CAB40();
  sub_18C2CAD10();
  uint64_t v4 = sub_18C2CAD20();
  return sub_18C2AD7AC(a2, a1, v4);
}

unint64_t sub_18C2AD6A0(uint64_t a1)
{
  sub_18C2CAA00();
  sub_18C2CACF0();
  sub_18C2CAA10();
  uint64_t v2 = sub_18C2CAD20();
  swift_bridgeObjectRelease();
  return sub_18C2AD89C(a1, v2);
}

unint64_t sub_18C2AD734(uint64_t a1, uint64_t a2)
{
  sub_18C2CACF0();
  sub_18C2CAA10();
  uint64_t v4 = sub_18C2CAD20();
  return sub_18C2ADA14(a1, a2, v4);
}

unint64_t sub_18C2AD7AC(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v5 = a3 & ~v4;
  if ((*(void *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v7 = ~v4;
    sub_18C29B910(0, qword_1E916C9E0);
    do
    {
      uint64_t v8 = *(void *)(v3 + 48) + 16 * v5;
      double v9 = *(double *)(v8 + 8);
      id v10 = *(id *)v8;
      unsigned __int8 v11 = sub_18C2CAB30();

      if ((v11 & (v9 == a1)) != 0) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_18C2AD89C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_18C2CAA00();
    uint64_t v8 = v7;
    if (v6 == sub_18C2CAA00() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_18C2CACD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_18C2CAA00();
          uint64_t v15 = v14;
          if (v13 == sub_18C2CAA00() && v15 == v16) {
            break;
          }
          char v18 = sub_18C2CACD0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_18C2ADA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_18C2CACD0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_18C2CACD0() & 1) == 0);
    }
  }
  return v6;
}

double sub_18C2ADAF8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_18C2AD734(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_18C2AF200();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_18C2AAF24((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_18C2AE954(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_18C2ADC04@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_18C2AD734(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_18C2AF3EC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_18C2AFCE0((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_18C2AEB40(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_18C2ADD08(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916C9F8);
  char v38 = a2;
  uint64_t v6 = sub_18C2CAC70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = *(void *)(v5 + 48) + 16 * v20;
    uint64_t v30 = *(void **)v29;
    uint64_t v31 = *(void *)(v29 + 8);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0) {
      id v33 = v30;
    }
    sub_18C2CACF0();
    sub_18C2CAB40();
    sub_18C2CAD10();
    uint64_t result = sub_18C2CAD20();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v30;
    v18[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_18C2AE01C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E91708A0);
  char v37 = a2;
  uint64_t v6 = sub_18C2CAC70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    char v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_18C2AAF24(v25, (uint64_t)v38);
    }
    else
    {
      sub_18C2AFF88((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_18C2CACF0();
    sub_18C2CAA10();
    uint64_t result = sub_18C2CAD20();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_18C2AAF24(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_18C2AE344(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170868);
  uint64_t v6 = sub_18C2CAC70();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_18C2AFCE0(v24, v35);
      }
      else
      {
        sub_18C2AFC1C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_18C2CACF0();
      sub_18C2CAA10();
      uint64_t result = sub_18C2CAD20();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_18C2AFCE0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_18C2AE644(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170850);
  char v38 = a2;
  uint64_t v6 = sub_18C2CAC70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_18C2CACF0();
    sub_18C2CAA10();
    uint64_t result = sub_18C2CAD20();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_18C2AE954(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_18C2CABC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_18C2CACF0();
        swift_bridgeObjectRetain();
        sub_18C2CAA10();
        uint64_t v11 = sub_18C2CAD20();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          int64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  uint64_t *v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_18C2AEB40(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_18C2CABC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_18C2CACF0();
        swift_bridgeObjectRetain();
        sub_18C2CAA10();
        uint64_t v10 = sub_18C2CAD20();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            _OWORD *v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_18C2AED18(uint64_t a1, void *a2, char a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_18C2AD610((uint64_t)a2, a4);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  id result = (id)(v12 + v13);
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  if (v16 >= (uint64_t)result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v16 >= (uint64_t)result && (a3 & 1) == 0)
  {
    id result = sub_18C2AF048();
LABEL_7:
    unint64_t v17 = (void *)*v5;
    if (v15)
    {
LABEL_8:
      *(void *)(v17[7] + 8 * v11) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_18C2ADD08((uint64_t)result, a3 & 1);
  id result = (id)sub_18C2AD610((uint64_t)a2, a4);
  if ((v15 & 1) != (v18 & 1))
  {
LABEL_17:
    id result = (id)sub_18C2CACE0();
    __break(1u);
    return result;
  }
  unint64_t v11 = (unint64_t)result;
  unint64_t v17 = (void *)*v5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  v17[(v11 >> 6) + 8] |= 1 << v11;
  uint64_t v19 = v17[6] + 16 * v11;
  *(void *)uint64_t v19 = a2;
  *(double *)(v19 + 8) = a4;
  *(void *)(v17[7] + 8 * v11) = a1;
  uint64_t v20 = v17[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17[2] = v22;
  return a2;
}

_OWORD *sub_18C2AEE88(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v12 = sub_18C2AD734(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_18C2AF3EC();
      goto LABEL_7;
    }
    sub_18C2AE344(v15, a4 & 1);
    unint64_t v21 = sub_18C2AD734(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    id result = (_OWORD *)sub_18C2CACE0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return sub_18C2AFCE0(a1, v19);
  }
LABEL_13:
  sub_18C2AEFDC(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_18C2AEFDC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  id result = sub_18C2AFCE0(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

id sub_18C2AF048()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916C9F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18C2CAC60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 16 * v15;
    char v18 = *(void **)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    char v22 = (void *)(*(void *)(v4 + 48) + v16);
    void *v22 = v18;
    v22[1] = v19;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = v18;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_18C2AF200()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E91708A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18C2CAC60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_18C2AFF88(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_18C2AAF24(v26, *(void *)(v4 + 56) + v20);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_18C2AF3EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170868);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18C2CAC60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_18C2AFC1C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_18C2AFCE0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_18C2AF5D4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170870);
  uint64_t result = sub_18C2CAC60();
  int64_t v3 = 0;
  uint64_t v32 = a1;
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v28 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & v4;
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v30 = (void *)result;
  uint64_t v31 = result + 64;
  if ((v6 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v9 = v3;
  for (unint64_t i = v8 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    unint64_t v15 = (uint64_t *)(*(void *)(v32 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(v32 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    id v19 = v18;
    uint64_t v20 = sub_18C2A9DA4();
    uint64_t v22 = v21;

    uint64_t result = (uint64_t)v30;
    *(void *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    unint64_t v23 = (void *)(v30[6] + 16 * i);
    void *v23 = v17;
    v23[1] = v16;
    int64_t v24 = (uint64_t *)(v30[7] + 16 * i);
    *int64_t v24 = v20;
    v24[1] = v22;
    uint64_t v25 = v30[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v30[2] = v27;
    int64_t v3 = v9;
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_24;
    }
    if (v11 >= v29) {
      return result;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v3 + 1;
    if (!v12)
    {
      int64_t v13 = v3 + 2;
      if (v3 + 2 >= v29) {
        return result;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v3 + 3;
        if (v3 + 3 >= v29) {
          return result;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v9 = v13;
  }
  uint64_t v14 = v3 + 4;
  if (v3 + 4 >= v29) {
    return result;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v3 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v29) {
      return result;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_18C2AF7F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  *(void *)&long long v28 = a1;
  uint64_t v9 = MEMORY[0x1E4FBB808];
  uint64_t v29 = MEMORY[0x1E4FBB808];
  uint64_t v30 = MEMORY[0x1E4FBB810];
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_18C2AD734(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 40 * v12;
      __swift_destroy_boxed_opaque_existential_1Tm(v19);
      return sub_18C2AAF24(&v28, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_18C2AF200();
    goto LABEL_7;
  }
  sub_18C2AE01C(v15, a4 & 1);
  unint64_t v21 = sub_18C2AD734(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    uint64_t result = sub_18C2CACE0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v28, v9);
  MEMORY[0x1F4188790](v23);
  uint64_t v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_18C2AFE1C(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v28);
  return swift_bridgeObjectRetain();
}

uint64_t sub_18C2AF9E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  uint64_t v15 = (void *)*a5;
  unint64_t v17 = sub_18C2AD734(a2, a3);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 >= v20 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v23 = (void *)*a5;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = v23[7] + 40 * v17;
      __swift_destroy_boxed_opaque_existential_1Tm(v24);
      return sub_18C2AAF24(&v33, v24);
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a4 & 1) == 0)
  {
    sub_18C2AF200();
    goto LABEL_7;
  }
  sub_18C2AE01C(v20, a4 & 1);
  unint64_t v26 = sub_18C2AD734(a2, a3);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_14:
    uint64_t result = sub_18C2CACE0();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  uint64_t v23 = (void *)*a5;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v33, v34);
  MEMORY[0x1F4188790](v28);
  uint64_t v30 = (char *)&v32 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v31 + 16))(v30);
  sub_18C2AFEB0(v17, a2, a3, (uint64_t)v30, v23, a6, a7);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v33);
  return swift_bridgeObjectRetain();
}

uint64_t sub_18C2AFC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18C2AFC78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_18C2AFCE0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_18C2AFCF0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_18C2AFD48(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_18C2AFCF0(a1, a2);
  }
  return a1;
}

uint64_t sub_18C2AFD5C()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_18C2AFE1C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v11 = a4;
  uint64_t v12 = MEMORY[0x1E4FBB808];
  uint64_t v13 = MEMORY[0x1E4FBB810];
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_18C2AAF24(&v11, a5[7] + 40 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_18C2AFEB0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = a6;
  uint64_t v21 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  BOOL v14 = (void *)(a5[6] + 16 * a1);
  void *v14 = a2;
  v14[1] = a3;
  uint64_t result = sub_18C2AAF24(&v19, a5[7] + 40 * a1);
  uint64_t v16 = a5[2];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    a5[2] = v18;
  }
  return result;
}

uint64_t sub_18C2AFF88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id IncomingCallTextViewAdapter.viewController.getter()
{
  return *(id *)(v0 + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
}

void *IncomingCallTextViewAdapter.emojiViewController.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  id v2 = v1;
  return v1;
}

uint64_t IncomingCallTextViewAdapter.statusIsHidden.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v5, (uint64_t)v4);
  sub_18C29E1A4((uint64_t)v4, (uint64_t)v3);
  sub_18C29E1A4((uint64_t)v4, (uint64_t)v5);
  if (sub_18C2A7154((uint64_t)v5) == 1) {
    return 1;
  }
  uint64_t v0 = v3[32];
  sub_18C29E1A4((uint64_t)v3, (uint64_t)v2);
  sub_18C2B9574((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  return v0;
}

uint64_t IncomingCallTextViewAdapter.statusIsHidden.setter(char a1)
{
  swift_retain();
  id v2 = sub_18C2B96DC(v6);
  uint64_t v4 = v3;
  sub_18C29E1A4(v3, (uint64_t)v7);
  sub_18C29E1A4((uint64_t)v7, (uint64_t)v8);
  if (sub_18C2A7154((uint64_t)v8) != 1) {
    *(unsigned char *)(v4 + 32) = a1 & 1;
  }
  ((void (*)(void *, void))v2)(v6, 0);
  return swift_release();
}

uint64_t sub_18C2B02DC(char *a1)
{
  char v1 = *a1;
  swift_retain();
  id v2 = sub_18C2B96DC(v6);
  uint64_t v4 = v3;
  sub_18C29E1A4(v3, (uint64_t)v7);
  sub_18C29E1A4((uint64_t)v7, (uint64_t)v8);
  if (sub_18C2A7154((uint64_t)v8) != 1) {
    *(unsigned char *)(v4 + 32) = v1;
  }
  ((void (*)(void *, void))v2)(v6, 0);
  return swift_release();
}

void (*IncomingCallTextViewAdapter.statusIsHidden.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x290uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t)v3 + 456;
  *((void *)v3 + 80) = v1;
  *((void *)v3 + 81) = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v3 + 456, (uint64_t)v3 + 152);
  sub_18C29E1A4((uint64_t)v3 + 152, (uint64_t)v3 + 304);
  sub_18C29E1A4((uint64_t)v3 + 152, (uint64_t)v3);
  if (sub_18C2A7154((uint64_t)v3) == 1)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = *((unsigned char *)v3 + 336);
    sub_18C29E1A4((uint64_t)v3 + 304, v4);
    sub_18C2B9574(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  *((unsigned char *)v3 + 145) = v5;
  return sub_18C2B04D4;
}

void sub_18C2B04D4(uint64_t a1, char a2)
{
  id v2 = *(void **)a1;
  uint64_t v3 = *(void *)a1 + 304;
  uint64_t v4 = *(void *)a1 + 456;
  char v5 = (void *)(*(void *)a1 + 608);
  char v6 = *(unsigned char *)(*(void *)a1 + 145);
  if (a2)
  {
    swift_retain();
    unint64_t v7 = sub_18C2B96DC(v5);
    uint64_t v9 = v8;
    sub_18C29E1A4(v8, v4);
    sub_18C29E1A4(v4, v3);
    uint64_t v10 = v3;
  }
  else
  {
    swift_retain();
    unint64_t v7 = sub_18C2B96DC(v5);
    uint64_t v9 = v11;
    sub_18C29E1A4(v11, v3);
    sub_18C29E1A4(v3, v4);
    uint64_t v10 = v4;
  }
  if (sub_18C2A7154(v10) != 1) {
    *(unsigned char *)(v9 + 32) = v6;
  }
  ((void (*)(void *, void))v7)(v5, 0);
  swift_release();
  free(v2);
}

void IncomingCallTextViewAdapter.frame.setter(double a1, double a2, double a3, double a4)
{
  id v9 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v4
                                                             + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (!v9)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v10 = v9;
  objc_msgSend(v9, sel_setFrame_, a1, a2, a3, a4);

  uint64_t v11 = *(void **)(v4 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  if (!v11) {
    return;
  }
  id v12 = objc_msgSend(v11, sel_view);
  if (!v12)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v13 = v12;
  objc_msgSend(v12, sel_setFrame_, a1, a2, a3, a4);
}

void sub_18C2B0804(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                             + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_frame);
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;

    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
    a2[3] = v12;
  }
  else
  {
    __break(1u);
  }
}

void (*IncomingCallTextViewAdapter.frame.modify(void *a1))(double **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t result = (void (*)(double **, char))objc_msgSend(*(id *)(v1 + v4), sel_view);
  if (result)
  {
    uint64_t v6 = result;
    objc_msgSend(result, sel_frame);
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;

    *id v3 = v8;
    v3[1] = v10;
    v3[2] = v12;
    v3[3] = v14;
    return sub_18C2B0948;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_18C2B0948(double **a1, char a2)
{
  id v3 = *a1;
  double v5 = **a1;
  double v4 = (*a1)[1];
  double v7 = (*a1)[2];
  double v6 = (*a1)[3];
  id v8 = objc_msgSend(*(id *)(*((void *)*a1 + 4) + *((void *)*a1 + 5)), sel_view);
  uint64_t v9 = v8;
  if (a2)
  {
    if (!v8)
    {
      __break(1u);
      goto LABEL_14;
    }
    uint64_t v10 = *((void *)v3 + 4);
    objc_msgSend(v8, sel_setFrame_, v5, v4, v7, v6);

    uint64_t v11 = *(void **)(v10 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
    if (!v11) {
      goto LABEL_10;
    }
    id v12 = objc_msgSend(v11, sel_view);
    if (v12)
    {
LABEL_9:
      uint64_t v15 = v12;
      objc_msgSend(v12, sel_setFrame_, v5, v4, v7, v6);

      goto LABEL_10;
    }
    __break(1u);
  }
  if (!v9)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v13 = *((void *)v3 + 4);
  objc_msgSend(v9, sel_setFrame_, v5, v4, v7, v6);

  uint64_t v14 = *(void **)(v13 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  if (v14)
  {
    id v12 = objc_msgSend(v14, sel_view);
    if (v12) {
      goto LABEL_9;
    }
LABEL_15:
    __break(1u);
    return;
  }
LABEL_10:
  free(v3);
}

void IncomingCallTextViewAdapter.tightFrame.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18C2CA840();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  double v6 = &v234[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  id v8 = &v234[-v7];
  swift_retain();
  sub_18C2BA804((uint64_t)v8);
  swift_release();
  sub_18C2CA820();
  char v9 = sub_18C2CA830();
  uint64_t v10 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  if ((v9 & 1) == 0)
  {
    id v34 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
    if (v34) {
      goto LABEL_9;
    }
    __break(1u);
LABEL_8:
    id v34 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
    if (!v34)
    {
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
LABEL_9:
    id v35 = v34;
    objc_msgSend(v34, sel_frame);
LABEL_32:

    return;
  }
  swift_retain();
  char v11 = sub_18C2BA400();
  swift_release();
  if (v11) {
    goto LABEL_8;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v344, (uint64_t)v343);
  sub_18C2A68DC((uint64_t)v343, (uint64_t)v344);
  int v12 = sub_18C2A6938((uint64_t)v344);
  uint64_t v13 = sub_18C2A6944((uint64_t)v344);
  uint64_t v14 = v13;
  if (v12 == 1)
  {
    uint64_t v15 = (unsigned __int8 *)(v13 + 296);
    int v235 = *(unsigned __int8 *)(v13 + 298);
    if (v235)
    {
      v13 += 152;
      uint64_t v16 = (uint64_t *)(v14 + 192);
      BOOL v17 = (uint64_t *)(v14 + 200);
      uint64_t v18 = (id *)(v14 + 208);
      long long v19 = (uint64_t *)(v14 + 216);
      uint64_t v20 = (uint64_t *)(v14 + 224);
      uint64_t v21 = (uint64_t *)(v14 + 232);
      uint64_t v22 = (uint64_t *)(v14 + 240);
      uint64_t v23 = (uint64_t *)(v14 + 248);
      uint64_t v24 = (uint64_t *)(v14 + 256);
      uint64_t v25 = (uint64_t *)(v14 + 264);
      unint64_t v26 = (uint64_t *)(v14 + 272);
      char v27 = (uint64_t *)(v14 + 280);
      uint64_t v28 = (CGFloat *)(v14 + 288);
      uint64_t v29 = (unsigned __int8 *)(v14 + 184);
      uint64_t v30 = (CGFloat *)(v14 + 176);
      uint64_t v31 = (uint64_t *)(v14 + 168);
      uint64_t v32 = (uint64_t *)(v14 + 160);
      long long v33 = (unsigned __int8 *)(v14 + 296);
    }
    else
    {
      uint64_t v16 = (uint64_t *)(v13 + 40);
      BOOL v17 = (uint64_t *)(v13 + 48);
      uint64_t v18 = (id *)(v13 + 56);
      long long v19 = (uint64_t *)(v13 + 64);
      uint64_t v20 = (uint64_t *)(v13 + 72);
      uint64_t v21 = (uint64_t *)(v13 + 80);
      uint64_t v22 = (uint64_t *)(v13 + 88);
      uint64_t v23 = (uint64_t *)(v13 + 96);
      uint64_t v24 = (uint64_t *)(v13 + 104);
      uint64_t v25 = (uint64_t *)(v13 + 112);
      unint64_t v26 = (uint64_t *)(v13 + 120);
      char v27 = (uint64_t *)(v13 + 128);
      uint64_t v28 = (CGFloat *)(v13 + 136);
      long long v33 = (unsigned __int8 *)(v13 + 144);
      uint64_t v29 = (unsigned __int8 *)(v13 + 32);
      uint64_t v30 = (CGFloat *)(v13 + 24);
      uint64_t v31 = (uint64_t *)(v13 + 16);
      uint64_t v32 = (uint64_t *)(v13 + 8);
    }
    LODWORD(v255) = *v33;
    CGFloat v254 = *v28;
    uint64_t v40 = *v27;
    uint64_t v249 = *v26;
    *(void *)&long long v250 = v40;
    uint64_t v41 = *v25;
    uint64_t v247 = *v24;
    uint64_t v248 = v41;
    uint64_t v42 = *v23;
    uint64_t v245 = *v22;
    uint64_t v246 = v42;
    uint64_t v43 = *v21;
    uint64_t v243 = *v20;
    uint64_t v244 = v43;
    uint64_t v242 = *v19;
    uint64_t v44 = *v17;
    id v257 = *v18;
    uint64_t v258 = v44;
    uint64_t v241 = *v16;
    LODWORD(v261) = *v29;
    CGFloat v256 = *v30;
    uint64_t v45 = *v31;
    uint64_t v259 = *(void *)v13;
    uint64_t v260 = v45;
    uint64_t v46 = *v32;
    sub_18C2A716C((void *)v13);
    int v253 = *(unsigned __int8 *)(v14 + 297);
    v251 = (unsigned __int8 *)(v14 + 296);
    uint64_t v252 = v1;
    if (v253)
    {
      uint64_t v47 = (uint64_t *)(v14 + 152);
      uint64_t v48 = (uint64_t *)(v14 + 192);
      uint64_t v49 = (uint64_t *)(v14 + 200);
      uint64_t v50 = (uint64_t *)(v14 + 208);
      int64_t v51 = (uint64_t *)(v14 + 216);
      uint64_t v52 = (uint64_t *)(v14 + 224);
      uint64_t v53 = (uint64_t *)(v14 + 232);
      uint64_t v54 = (uint64_t *)(v14 + 240);
      id v55 = (uint64_t *)(v14 + 248);
      char v56 = (uint64_t *)(v14 + 256);
      uint64_t v57 = (uint64_t *)(v14 + 264);
      uint64_t v58 = (uint64_t *)(v14 + 272);
      long long v59 = (uint64_t *)(v14 + 280);
      long long v60 = (uint64_t *)(v14 + 288);
      uint64_t v61 = (char *)(v14 + 184);
      char v62 = (void **)(v14 + 176);
      id v63 = (uint64_t *)(v14 + 168);
      id v64 = (uint64_t *)(v14 + 160);
    }
    else
    {
      uint64_t v48 = (uint64_t *)(v14 + 40);
      uint64_t v49 = (uint64_t *)(v14 + 48);
      uint64_t v50 = (uint64_t *)(v14 + 56);
      int64_t v51 = (uint64_t *)(v14 + 64);
      uint64_t v52 = (uint64_t *)(v14 + 72);
      uint64_t v53 = (uint64_t *)(v14 + 80);
      uint64_t v54 = (uint64_t *)(v14 + 88);
      id v55 = (uint64_t *)(v14 + 96);
      char v56 = (uint64_t *)(v14 + 104);
      uint64_t v57 = (uint64_t *)(v14 + 112);
      uint64_t v58 = (uint64_t *)(v14 + 120);
      long long v59 = (uint64_t *)(v14 + 128);
      long long v60 = (uint64_t *)(v14 + 136);
      uint64_t v15 = (unsigned __int8 *)(v14 + 144);
      uint64_t v61 = (char *)(v14 + 32);
      char v62 = (void **)(v14 + 24);
      id v63 = (uint64_t *)(v14 + 16);
      id v64 = (uint64_t *)(v14 + 8);
      uint64_t v47 = (uint64_t *)v14;
    }
    int v240 = *v15;
    uint64_t v65 = *v60;
    uint64_t v238 = *v59;
    uint64_t v239 = v65;
    uint64_t v66 = *v58;
    uint64_t v67 = *v57;
    uint64_t v68 = *v56;
    uint64_t v69 = *v55;
    uint64_t v70 = *v54;
    uint64_t v71 = *v53;
    uint64_t v72 = *v52;
    uint64_t v73 = *v51;
    uint64_t v74 = *v50;
    uint64_t v236 = *v49;
    uint64_t v237 = v74;
    uint64_t v75 = *v48;
    char v76 = *v61;
    id v77 = *v62;
    uint64_t v78 = *v63;
    uint64_t v79 = *v47;
    uint64_t v80 = *v64;
    sub_18C2A716C(v47);
    v297[0] = v259;
    v297[1] = v46;
    v297[2] = v260;
    CGFloat v81 = v256;
    *(CGFloat *)&v297[3] = v256;
    char v298 = LOBYTE(v261);
    uint64_t v299 = v241;
    uint64_t v300 = v258;
    id v301 = v257;
    uint64_t v302 = v242;
    uint64_t v303 = v243;
    uint64_t v304 = v244;
    uint64_t v305 = v245;
    uint64_t v306 = v246;
    uint64_t v307 = v247;
    uint64_t v308 = v248;
    uint64_t v309 = v249;
    uint64_t v310 = v250;
    CGFloat v311 = v254;
    char v312 = LOBYTE(v255);
    v313[0] = v79;
    v313[1] = v80;
    v313[2] = v78;
    v313[3] = v77;
    char v314 = v76;
    uint64_t v315 = v75;
    uint64_t v316 = v236;
    uint64_t v317 = v237;
    uint64_t v318 = v73;
    uint64_t v319 = v72;
    uint64_t v320 = v71;
    uint64_t v321 = v70;
    uint64_t v322 = v69;
    uint64_t v323 = v68;
    uint64_t v324 = v67;
    uint64_t v325 = v66;
    uint64_t v326 = v238;
    uint64_t v327 = v239;
    char v328 = v240;
    id v82 = v77;
    sub_18C2A73A0((uint64_t)v313);
    id v83 = v82;
    sub_18C2A716C(v297);

    id v84 = v83;
    swift_bridgeObjectRetain();
    uint64_t v85 = v259;
    sub_18C2A911C(v259, v46, v84, (uint64_t)&v345);
    uint64_t v86 = v345;
    long long v250 = v347;
    uint64_t v87 = v348;
    uint64_t v88 = v349;
    double v89 = v350;
    double v90 = v351;
    CGFloat v256 = v351;
    double v91 = v352;
    double v92 = v353;
    CGFloat v254 = v350;
    CGFloat v255 = v353;
    uint64_t v93 = v354;
    uint64_t v94 = v355;
    LOBYTE(v77) = v356;

    swift_bridgeObjectRelease();
    sub_18C2A73A0((uint64_t)v297);
    v329[0] = v85;
    v329[1] = v46;
    v329[2] = v260;
    v329[3] = v84;
    char v330 = LOBYTE(v261);
    uint64_t v331 = v86;
    long long v332 = v346;
    long long v333 = v250;
    uint64_t v334 = v87;
    uint64_t v335 = v88;
    double v336 = v89;
    double v337 = v90;
    CGFloat v261 = v91;
    double v338 = v91;
    double v339 = v92;
    uint64_t v340 = v93;
    uint64_t v341 = v94;
    char v342 = (char)v77;
    if (v253)
    {
      int v95 = (uint64_t *)(v14 + 152);
      uint64_t v96 = (uint64_t *)(v14 + 192);
      uint64_t v97 = (uint64_t *)(v14 + 200);
      uint64_t v98 = (uint64_t *)(v14 + 208);
      uint64_t v99 = (uint64_t *)(v14 + 216);
      char v100 = (uint64_t *)(v14 + 224);
      uint64_t v101 = (uint64_t *)(v14 + 232);
      char v102 = (uint64_t *)(v14 + 240);
      long long v103 = (CGFloat *)(v14 + 248);
      long long v104 = (CGFloat *)(v14 + 256);
      char v105 = (CGFloat *)(v14 + 264);
      long long v106 = (CGFloat *)(v14 + 272);
      long long v107 = (uint64_t *)(v14 + 280);
      CGRect v108 = (uint64_t *)(v14 + 288);
      CGRect v109 = (char *)(v14 + 184);
      char v110 = (uint64_t *)(v14 + 176);
      uint64_t v111 = (uint64_t *)(v14 + 168);
      long long v112 = (uint64_t *)(v14 + 160);
      int v113 = v251;
    }
    else
    {
      uint64_t v96 = (uint64_t *)(v14 + 40);
      uint64_t v97 = (uint64_t *)(v14 + 48);
      uint64_t v98 = (uint64_t *)(v14 + 56);
      uint64_t v99 = (uint64_t *)(v14 + 64);
      char v100 = (uint64_t *)(v14 + 72);
      uint64_t v101 = (uint64_t *)(v14 + 80);
      char v102 = (uint64_t *)(v14 + 88);
      long long v103 = (CGFloat *)(v14 + 96);
      long long v104 = (CGFloat *)(v14 + 104);
      char v105 = (CGFloat *)(v14 + 112);
      long long v106 = (CGFloat *)(v14 + 120);
      long long v107 = (uint64_t *)(v14 + 128);
      CGRect v108 = (uint64_t *)(v14 + 136);
      int v113 = (unsigned __int8 *)(v14 + 144);
      CGRect v109 = (char *)(v14 + 32);
      char v110 = (uint64_t *)(v14 + 24);
      uint64_t v111 = (uint64_t *)(v14 + 16);
      long long v112 = (uint64_t *)(v14 + 8);
      int v95 = (uint64_t *)v14;
    }
    LODWORD(v260) = *v113;
    uint64_t v114 = *v108;
    uint64_t v258 = *v107;
    uint64_t v259 = v114;
    CGFloat v115 = *v106;
    CGFloat v116 = *v105;
    CGFloat v117 = *v104;
    CGFloat v118 = *v103;
    uint64_t v119 = *v102;
    uint64_t v120 = *v101;
    uint64_t v121 = *v100;
    uint64_t v122 = *v99;
    uint64_t v123 = *v98;
    uint64_t v124 = *v97;
    uint64_t v125 = *v96;
    char v126 = *v109;
    uint64_t v127 = *v110;
    uint64_t v128 = *v111;
    uint64_t v129 = *v95;
    uint64_t v130 = *v112;
    sub_18C2A716C(v95);
    v281[0] = v129;
    v281[1] = v130;
    v281[2] = v128;
    v281[3] = v127;
    char v282 = v126;
    uint64_t v283 = v125;
    uint64_t v284 = v124;
    uint64_t v285 = v123;
    uint64_t v286 = v122;
    uint64_t v287 = v121;
    uint64_t v288 = v120;
    uint64_t v289 = v119;
    CGFloat v290 = v118;
    CGFloat v291 = v117;
    CGFloat v292 = v116;
    CGFloat v293 = v115;
    uint64_t v294 = v258;
    uint64_t v295 = v259;
    char v296 = v260;
    sub_18C2A73A0((uint64_t)v281);
    v357.origin.CGFloat x = v118;
    v357.origin.CGFloat y = v117;
    v357.size.CGFloat width = v116;
    v357.size.double height = v115;
    double Width = CGRectGetWidth(v357);
    v358.origin.CGFloat x = v254;
    v358.size.double height = v255;
    v358.origin.CGFloat y = v256;
    v358.size.CGFloat width = v261;
    double v132 = CGRectGetWidth(v358);
    sub_18C2A73A0((uint64_t)v329);
    if (v132 >= Width)
    {
      if (v235)
      {
        long long v151 = (uint64_t *)(v14 + 192);
        char v152 = (uint64_t *)(v14 + 200);
        long long v153 = (uint64_t *)(v14 + 208);
        long long v154 = (uint64_t *)(v14 + 216);
        long long v155 = (uint64_t *)(v14 + 224);
        long long v156 = (uint64_t *)(v14 + 232);
        long long v157 = (uint64_t *)(v14 + 240);
        long long v158 = (double *)(v14 + 248);
        long long v159 = (double *)(v14 + 256);
        long long v160 = (double *)(v14 + 264);
        char v161 = (double *)(v14 + 272);
        v162 = (uint64_t *)(v14 + 280);
        v163 = (uint64_t *)(v14 + 288);
        v164 = (char *)(v14 + 184);
        v165 = (void **)(v14 + 176);
        v166 = (uint64_t *)(v14 + 168);
        v167 = (uint64_t *)(v14 + 160);
        v14 += 152;
        v168 = v251;
      }
      else
      {
        long long v151 = (uint64_t *)(v14 + 40);
        char v152 = (uint64_t *)(v14 + 48);
        long long v153 = (uint64_t *)(v14 + 56);
        long long v154 = (uint64_t *)(v14 + 64);
        long long v155 = (uint64_t *)(v14 + 72);
        long long v156 = (uint64_t *)(v14 + 80);
        long long v157 = (uint64_t *)(v14 + 88);
        long long v158 = (double *)(v14 + 96);
        long long v159 = (double *)(v14 + 104);
        long long v160 = (double *)(v14 + 112);
        char v161 = (double *)(v14 + 120);
        v162 = (uint64_t *)(v14 + 128);
        v163 = (uint64_t *)(v14 + 136);
        v168 = (unsigned __int8 *)(v14 + 144);
        v164 = (char *)(v14 + 32);
        v165 = (void **)(v14 + 24);
        v166 = (uint64_t *)(v14 + 16);
        v167 = (uint64_t *)(v14 + 8);
      }
      LODWORD(v260) = *v168;
      uint64_t v184 = *v163;
      uint64_t v258 = *v162;
      uint64_t v259 = v184;
      double v185 = *v161;
      double v186 = *v160;
      double v187 = *v159;
      double v188 = *v158;
      uint64_t v189 = *v157;
      uint64_t v190 = *v156;
      uint64_t v191 = *v155;
      uint64_t v192 = *v154;
      uint64_t v193 = *v153;
      uint64_t v194 = *v152;
      uint64_t v195 = *v151;
      char v196 = *v164;
      v197 = *v165;
      uint64_t v198 = *v166;
      uint64_t v199 = *(void *)v14;
      uint64_t v200 = *v167;
      sub_18C2A716C((void *)v14);
      sub_18C2B9414((uint64_t)v343, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
      uint64_t v262 = v199;
      uint64_t v263 = v200;
      uint64_t v264 = v198;
      v265 = v197;
      char v266 = v196;
      uint64_t v267 = v195;
      uint64_t v268 = v194;
      uint64_t v269 = v193;
      uint64_t v270 = v192;
      uint64_t v271 = v191;
      uint64_t v272 = v190;
      uint64_t v273 = v189;
      CGFloat v274 = v188;
      double v275 = v187;
      CGFloat v276 = v186;
      double v277 = v185;
      uint64_t v278 = v258;
      uint64_t v279 = v259;
      char v280 = v260;
      id v35 = v197;
      sub_18C2A73A0((uint64_t)&v262);
      uint64_t v1 = v252;
      CGFloat v38 = v255;
      CGFloat v36 = v256;
      CGFloat v39 = v261;
      CGFloat v37 = v254;
    }
    else
    {
      if (v253)
      {
        unsigned long long v133 = (uint64_t *)(v14 + 192);
        char v134 = (uint64_t *)(v14 + 200);
        unsigned __int8 v135 = (uint64_t *)(v14 + 208);
        long long v136 = (uint64_t *)(v14 + 216);
        long long v137 = (uint64_t *)(v14 + 224);
        long long v138 = (uint64_t *)(v14 + 232);
        long long v139 = (uint64_t *)(v14 + 240);
        long long v140 = (CGFloat *)(v14 + 248);
        long long v141 = (double *)(v14 + 256);
        long long v142 = (CGFloat *)(v14 + 264);
        char v143 = (double *)(v14 + 272);
        uint64_t v144 = (uint64_t *)(v14 + 280);
        long long v145 = (uint64_t *)(v14 + 288);
        long long v146 = (char *)(v14 + 184);
        long long v147 = (void **)(v14 + 176);
        long long v148 = (uint64_t *)(v14 + 168);
        long long v149 = (uint64_t *)(v14 + 160);
        v14 += 152;
        long long v150 = v251;
      }
      else
      {
        unsigned long long v133 = (uint64_t *)(v14 + 40);
        char v134 = (uint64_t *)(v14 + 48);
        unsigned __int8 v135 = (uint64_t *)(v14 + 56);
        long long v136 = (uint64_t *)(v14 + 64);
        long long v137 = (uint64_t *)(v14 + 72);
        long long v138 = (uint64_t *)(v14 + 80);
        long long v139 = (uint64_t *)(v14 + 88);
        long long v140 = (CGFloat *)(v14 + 96);
        long long v141 = (double *)(v14 + 104);
        long long v142 = (CGFloat *)(v14 + 112);
        char v143 = (double *)(v14 + 120);
        uint64_t v144 = (uint64_t *)(v14 + 128);
        long long v145 = (uint64_t *)(v14 + 136);
        long long v150 = (unsigned __int8 *)(v14 + 144);
        long long v146 = (char *)(v14 + 32);
        long long v147 = (void **)(v14 + 24);
        long long v148 = (uint64_t *)(v14 + 16);
        long long v149 = (uint64_t *)(v14 + 8);
      }
      LODWORD(v261) = *v150;
      uint64_t v169 = *v145;
      uint64_t v259 = *v144;
      uint64_t v260 = v169;
      double v170 = *v143;
      CGFloat v39 = *v142;
      double v171 = *v141;
      CGFloat v37 = *v140;
      uint64_t v172 = *v139;
      uint64_t v173 = *v138;
      uint64_t v174 = *v137;
      uint64_t v175 = *v136;
      uint64_t v176 = *v135;
      uint64_t v177 = *v134;
      uint64_t v178 = *v133;
      char v179 = *v146;
      v180 = *v147;
      uint64_t v181 = *v148;
      uint64_t v182 = *(void *)v14;
      uint64_t v183 = *v149;
      sub_18C2A716C((void *)v14);
      sub_18C2B9414((uint64_t)v343, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
      uint64_t v262 = v182;
      uint64_t v263 = v183;
      uint64_t v264 = v181;
      v265 = v180;
      char v266 = v179;
      uint64_t v267 = v178;
      uint64_t v268 = v177;
      uint64_t v269 = v176;
      uint64_t v270 = v175;
      uint64_t v271 = v174;
      uint64_t v272 = v173;
      uint64_t v273 = v172;
      CGFloat v38 = v170;
      CGFloat v274 = v37;
      double v275 = v171;
      CGFloat v276 = v39;
      double v277 = v170;
      uint64_t v278 = v259;
      uint64_t v279 = v260;
      CGFloat v36 = v171;
      char v280 = LOBYTE(v261);
      id v35 = v180;
      sub_18C2A73A0((uint64_t)&v262);
      uint64_t v1 = v252;
    }
  }
  else
  {
    CGFloat v37 = *(double *)(v13 + 96);
    CGFloat v36 = *(double *)(v13 + 104);
    CGFloat v39 = *(double *)(v13 + 112);
    CGFloat v38 = *(double *)(v13 + 120);
    id v35 = *(id *)(v13 + 24);
    sub_18C2B9414((uint64_t)v343, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  }
  objc_msgSend(v35, sel_ascender);
  uint64_t v201 = OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController;
  id v202 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                               + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (!v202) {
    goto LABEL_34;
  }
  v203 = v202;
  objc_msgSend(v202, sel_frame);

  v359.origin.CGFloat x = v37;
  v359.origin.CGFloat y = v36;
  v359.size.CGFloat width = v39;
  v359.size.double height = v38;
  CGRectGetWidth(v359);
  id v204 = objc_msgSend(*(id *)(v1 + v201), sel_view);
  if (!v204)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v205 = v204;
  objc_msgSend(v204, sel_frame);
  CGFloat v207 = v206;
  CGFloat v209 = v208;
  CGFloat v211 = v210;
  CGFloat v213 = v212;

  v360.origin.CGFloat x = v207;
  v360.origin.CGFloat y = v209;
  v360.size.CGFloat width = v211;
  v360.size.double height = v213;
  CGRectGetMinX(v360);
  id v214 = objc_msgSend(*(id *)(v1 + v201), sel_view);
  if (!v214)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v215 = v214;
  objc_msgSend(v214, sel_frame);
  CGFloat v217 = v216;
  CGFloat v219 = v218;
  CGFloat v221 = v220;
  CGFloat v223 = v222;

  v361.origin.CGFloat x = v217;
  v361.origin.CGFloat y = v219;
  v361.size.CGFloat width = v221;
  v361.size.double height = v223;
  CGRectGetWidth(v361);
  id v224 = objc_msgSend(*(id *)(v1 + v201), sel_view);
  if (v224)
  {
    v225 = v224;
    objc_msgSend(v224, sel_frame);
    CGFloat v227 = v226;
    CGFloat v229 = v228;
    CGFloat v231 = v230;
    CGFloat v233 = v232;

    v362.origin.CGFloat x = v227;
    v362.origin.CGFloat y = v229;
    v362.size.CGFloat width = v231;
    v362.size.double height = v233;
    CGRectGetMinY(v362);
    goto LABEL_32;
  }
LABEL_37:
  __break(1u);
}

uint64_t IncomingCallTextViewAdapter.preferredAlignment.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  return v1 & 1;
}

uint64_t IncomingCallTextViewAdapter.preferredAlignment.setter(unint64_t a1)
{
  int v1 = sub_18C2B8CA0(a1) & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v3 == 2 || (v3 & 1) != v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_18C2CA540();
  }
  return result;
}

uint64_t (*IncomingCallTextViewAdapter.preferredAlignment.modify(uint64_t a1))(unint64_t *a1)
{
  *(void *)(a1 + 8) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  *(void *)a1 = *(unsigned char *)(a1 + 16) & 1;
  return sub_18C2B1A98;
}

uint64_t sub_18C2B1A98(unint64_t *a1)
{
  return IncomingCallTextViewAdapter.preferredAlignment.setter(*a1);
}

uint64_t IncomingCallTextViewAdapter.preferredLayout.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_18C2CA840();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  char v9 = (char *)&v12 - v8;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_18C2A7BF0((uint64_t)v2, &qword_1E916CA20);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    uint64_t v10 = sub_18C2B89E8(v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

uint64_t IncomingCallTextViewAdapter.preferredLayout.setter(uint64_t a1)
{
  return sub_18C2B774C(a1, (uint64_t)&unk_18C2DDD98, (uint64_t)&unk_18C2DDDC0);
}

uint64_t sub_18C2B1D74(uint64_t a1)
{
  if (a1 == 1)
  {
    return sub_18C2CA810();
  }
  else
  {
    if (a1)
    {
      if (qword_1E916CA40 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_18C2CA4E0();
      __swift_project_value_buffer(v1, (uint64_t)qword_1E9171CA0);
      uint64_t v2 = sub_18C2CA4D0();
      os_log_type_t v3 = sub_18C2CAAB0();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_18C1C4000, v2, v3, "Unrecognized PRPosterTitleLayout; fallback to horizontal.", v4, 2u);
        MEMORY[0x192F91CB0](v4, -1, -1);
      }
    }
    return sub_18C2CA820();
  }
}

void (*IncomingCallTextViewAdapter.preferredLayout.modify(void *a1))(uint64_t **a1)
{
  os_log_type_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[2] = v5;
  uint64_t v6 = sub_18C2CA840();
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  char v9 = (char *)malloc(v8);
  v3[3] = v9;
  uint64_t v10 = malloc(v8);
  v3[4] = v10;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_18C2A7BF0((uint64_t)v5, &qword_1E916CA20);
    uint64_t v11 = 0;
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v10, v5, v6);
    (*(void (**)(char *, void *, uint64_t))(v7 + 16))(v9, v10, v6);
    uint64_t v11 = sub_18C2B89E8(v9);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
  }
  *os_log_type_t v3 = v11;
  return sub_18C2B20A4;
}

void sub_18C2B20A4(uint64_t **a1)
{
  uint64_t v1 = *a1;
  os_log_type_t v3 = (void *)(*a1)[3];
  uint64_t v2 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[2];
  IncomingCallTextViewAdapter.preferredLayout.setter(**a1);
  free(v2);
  free(v3);
  free(v4);
  free(v1);
}

id IncomingCallTextViewAdapter.textColor.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v5, (uint64_t)v4);
  sub_18C2A68DC((uint64_t)v4, (uint64_t)v5);
  if (sub_18C2A6938((uint64_t)v5) == 1)
  {
    sub_18C2A6944((uint64_t)v5);
    sub_18C2A68DC((uint64_t)v4, (uint64_t)v3);
    uint64_t v0 = v3;
  }
  else
  {
    uint64_t v0 = v5;
  }
  id v1 = *(id *)(sub_18C2A6944((uint64_t)v0) + 16);
  sub_18C2B9414((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  return v1;
}

void IncomingCallTextViewAdapter.textColor.setter(id a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v15, (uint64_t)v14);
  sub_18C2A68DC((uint64_t)v14, (uint64_t)v15);
  if (sub_18C2A6938((uint64_t)v15) == 1)
  {
    sub_18C2A6944((uint64_t)v15);
    sub_18C2A68DC((uint64_t)v14, (uint64_t)v13);
    uint64_t v2 = v13;
  }
  else
  {
    uint64_t v2 = v15;
  }
  id v3 = *(id *)(sub_18C2A6944((uint64_t)v2) + 16);
  sub_18C2B9414((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  sub_18C29B910(0, (unint64_t *)&unk_1E916CE38);
  char v4 = sub_18C2CAB30();

  if ((v4 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    a1 = a1;
    sub_18C2CA530();
    swift_release();
    swift_release();
    sub_18C2A68DC((uint64_t)v13, (uint64_t)v10);
    sub_18C2A68DC((uint64_t)v10, (uint64_t)v9);
    sub_18C2BE61C(a1);

    sub_18C2A68DC((uint64_t)v9, (uint64_t)v13);
    sub_18C2B9938((uint64_t)v13);
    swift_release();
    swift_retain();
    uint64_t v5 = sub_18C2B96DC(v9);
    uint64_t v7 = v6;
    sub_18C29E1A4(v6, (uint64_t)v11);
    sub_18C29E1A4((uint64_t)v11, (uint64_t)v12);
    if (sub_18C2A7154((uint64_t)v12) != 1)
    {
      size_t v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = a1;
      a1 = a1;
    }
    ((void (*)(void *, void))v5)(v9, 0);
    swift_release();
  }
}

void (*IncomingCallTextViewAdapter.textColor.modify(void *a1))(id **a1, char a2)
{
  id v3 = malloc(0x3A0uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t)(v3 + 38);
  v3[115] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)(v3 + 76), (uint64_t)(v3 + 38));
  sub_18C2A68DC((uint64_t)(v3 + 38), (uint64_t)v3);
  if (sub_18C2A6938((uint64_t)v3) == 1)
  {
    sub_18C2A6944((uint64_t)v3);
    sub_18C2A68DC(v4, (uint64_t)(v3 + 76));
    uint64_t v5 = (uint64_t)(v3 + 76);
  }
  else
  {
    uint64_t v5 = (uint64_t)v3;
  }
  id v6 = *(id *)(sub_18C2A6944(v5) + 16);
  sub_18C2B9414(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  v3[114] = v6;
  return sub_18C2B265C;
}

void sub_18C2B265C(id **a1, char a2)
{
  uint64_t v2 = *a1;
  id v3 = (*a1)[114];
  if (a2)
  {
    IncomingCallTextViewAdapter.textColor.setter(v3);
  }
  else
  {
    IncomingCallTextViewAdapter.textColor.setter(v3);
  }
  free(v2);
}

id IncomingCallTextViewAdapter.emphasizedNameFont.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v45, (uint64_t)v44);
  sub_18C2A68DC((uint64_t)v44, (uint64_t)v45);
  int v0 = sub_18C2A6938((uint64_t)v45);
  uint64_t v1 = sub_18C2A6944((uint64_t)v45);
  if (v0 == 1)
  {
    uint64_t v2 = (char *)(v1 + 296);
    if (*(unsigned char *)(v1 + 297))
    {
      uint64_t v4 = *(void *)(v1 + 152);
      v1 += 152;
      uint64_t v3 = v4;
      uint64_t v5 = *(void *)(v1 + 40);
      long long v26 = *(_OWORD *)(v1 + 48);
      uint64_t v6 = *(void *)(v1 + 80);
      uint64_t v24 = *(void *)(v1 + 72);
      uint64_t v25 = *(void *)(v1 + 64);
      uint64_t v7 = *(void *)(v1 + 88);
      uint64_t v8 = *(void *)(v1 + 96);
      uint64_t v9 = *(void *)(v1 + 104);
      uint64_t v10 = *(void *)(v1 + 112);
      uint64_t v12 = *(void *)(v1 + 120);
      uint64_t v11 = *(void *)(v1 + 128);
      uint64_t v13 = *(void *)(v1 + 136);
      char v14 = *v2;
      char v15 = *(unsigned char *)(v1 + 32);
      uint64_t v16 = *(void **)(v1 + 24);
    }
    else
    {
      uint64_t v5 = *(void *)(v1 + 40);
      long long v26 = *(_OWORD *)(v1 + 48);
      uint64_t v6 = *(void *)(v1 + 80);
      uint64_t v24 = *(void *)(v1 + 72);
      uint64_t v25 = *(void *)(v1 + 64);
      uint64_t v7 = *(void *)(v1 + 88);
      uint64_t v8 = *(void *)(v1 + 96);
      uint64_t v9 = *(void *)(v1 + 104);
      uint64_t v10 = *(void *)(v1 + 112);
      uint64_t v12 = *(void *)(v1 + 120);
      uint64_t v11 = *(void *)(v1 + 128);
      uint64_t v13 = *(void *)(v1 + 136);
      char v14 = *(unsigned char *)(v1 + 144);
      char v15 = *(unsigned char *)(v1 + 32);
      uint64_t v16 = *(void **)(v1 + 24);
      uint64_t v3 = *(void *)v1;
    }
    long long v23 = *(_OWORD *)(v1 + 8);
    sub_18C2A716C((void *)v1);
    sub_18C2B9414((uint64_t)v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v20 = v23;
    uint64_t v19 = v24;
    uint64_t v18 = v25;
    long long v17 = v26;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 40);
    long long v17 = *(_OWORD *)(v1 + 48);
    uint64_t v18 = *(void *)(v1 + 64);
    uint64_t v19 = *(void *)(v1 + 72);
    uint64_t v6 = *(void *)(v1 + 80);
    uint64_t v7 = *(void *)(v1 + 88);
    uint64_t v8 = *(void *)(v1 + 96);
    uint64_t v9 = *(void *)(v1 + 104);
    uint64_t v10 = *(void *)(v1 + 112);
    uint64_t v12 = *(void *)(v1 + 120);
    uint64_t v11 = *(void *)(v1 + 128);
    uint64_t v13 = *(void *)(v1 + 136);
    char v14 = *(unsigned char *)(v1 + 144);
    char v15 = *(unsigned char *)(v1 + 32);
    uint64_t v16 = *(void **)(v1 + 24);
    uint64_t v3 = *(void *)v1;
    long long v20 = *(_OWORD *)(v1 + 8);
  }
  uint64_t v27 = v3;
  long long v28 = v20;
  uint64_t v29 = v16;
  char v30 = v15;
  uint64_t v31 = v5;
  long long v32 = v17;
  uint64_t v33 = v18;
  uint64_t v34 = v19;
  uint64_t v35 = v6;
  uint64_t v36 = v7;
  uint64_t v37 = v8;
  uint64_t v38 = v9;
  uint64_t v39 = v10;
  uint64_t v40 = v12;
  uint64_t v41 = v11;
  uint64_t v42 = v13;
  char v43 = v14;
  id v21 = v16;
  sub_18C2A73A0((uint64_t)&v27);
  return v21;
}

void IncomingCallTextViewAdapter.emphasizedNameFont.setter(id a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v189, (uint64_t)v188);
  sub_18C2A68DC((uint64_t)v188, (uint64_t)v189);
  int v2 = sub_18C2A6938((uint64_t)v189);
  uint64_t v3 = sub_18C2A6944((uint64_t)v189);
  if (v2 == 1)
  {
    uint64_t v4 = (char *)(v3 + 296);
    if (*(unsigned char *)(v3 + 297))
    {
      uint64_t v6 = *(void *)(v3 + 152);
      v3 += 152;
      uint64_t v5 = v6;
      uint64_t v7 = *(void *)(v3 + 40);
      long long v119 = *(_OWORD *)(v3 + 48);
      uint64_t v8 = *(void *)(v3 + 80);
      uint64_t v113 = *(void *)(v3 + 72);
      uint64_t v116 = *(void *)(v3 + 64);
      uint64_t v9 = *(void *)(v3 + 88);
      uint64_t v10 = *(void *)(v3 + 96);
      uint64_t v11 = *(void *)(v3 + 104);
      uint64_t v12 = *(void *)(v3 + 112);
      uint64_t v14 = *(void *)(v3 + 120);
      uint64_t v13 = *(void *)(v3 + 128);
      uint64_t v15 = *(void *)(v3 + 136);
      char v16 = *v4;
      char v17 = *(unsigned char *)(v3 + 32);
      uint64_t v18 = *(void **)(v3 + 24);
    }
    else
    {
      uint64_t v7 = *(void *)(v3 + 40);
      long long v119 = *(_OWORD *)(v3 + 48);
      uint64_t v8 = *(void *)(v3 + 80);
      uint64_t v113 = *(void *)(v3 + 72);
      uint64_t v116 = *(void *)(v3 + 64);
      uint64_t v9 = *(void *)(v3 + 88);
      uint64_t v10 = *(void *)(v3 + 96);
      uint64_t v11 = *(void *)(v3 + 104);
      uint64_t v12 = *(void *)(v3 + 112);
      uint64_t v14 = *(void *)(v3 + 120);
      uint64_t v13 = *(void *)(v3 + 128);
      uint64_t v15 = *(void *)(v3 + 136);
      char v16 = *(unsigned char *)(v3 + 144);
      char v17 = *(unsigned char *)(v3 + 32);
      uint64_t v18 = *(void **)(v3 + 24);
      uint64_t v5 = *(void *)v3;
    }
    long long v112 = *(_OWORD *)(v3 + 8);
    sub_18C2A716C((void *)v3);
    sub_18C2B9414((uint64_t)v188, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v22 = v112;
    uint64_t v21 = v113;
    uint64_t v20 = v116;
    long long v19 = v119;
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 40);
    long long v19 = *(_OWORD *)(v3 + 48);
    uint64_t v20 = *(void *)(v3 + 64);
    uint64_t v21 = *(void *)(v3 + 72);
    uint64_t v8 = *(void *)(v3 + 80);
    uint64_t v9 = *(void *)(v3 + 88);
    uint64_t v10 = *(void *)(v3 + 96);
    uint64_t v11 = *(void *)(v3 + 104);
    uint64_t v12 = *(void *)(v3 + 112);
    uint64_t v14 = *(void *)(v3 + 120);
    uint64_t v13 = *(void *)(v3 + 128);
    uint64_t v15 = *(void *)(v3 + 136);
    char v16 = *(unsigned char *)(v3 + 144);
    char v17 = *(unsigned char *)(v3 + 32);
    uint64_t v18 = *(void **)(v3 + 24);
    uint64_t v5 = *(void *)v3;
    long long v22 = *(_OWORD *)(v3 + 8);
  }
  long long v130 = v22;
  uint64_t v129 = v5;
  long long v131 = v18;
  char v132 = v17;
  uint64_t v133 = v7;
  long long v134 = v19;
  uint64_t v135 = v20;
  uint64_t v136 = v21;
  uint64_t v137 = v8;
  uint64_t v138 = v9;
  uint64_t v139 = v10;
  uint64_t v140 = v11;
  uint64_t v141 = v12;
  uint64_t v142 = v14;
  uint64_t v143 = v13;
  uint64_t v144 = v15;
  char v145 = v16;
  id v23 = v18;
  sub_18C2A73A0((uint64_t)&v129);
  sub_18C29B910(0, (unint64_t *)&qword_1E916CE30);
  char v24 = sub_18C2CAB30();

  if ((v24 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    id v25 = a1;
    sub_18C2CA530();
    swift_release();
    swift_release();
    sub_18C2A68DC((uint64_t)&v148, (uint64_t)v127);
    sub_18C2A68DC((uint64_t)v127, (uint64_t)v128);
    if (sub_18C2A6938((uint64_t)v128) == 1)
    {
      uint64_t v32 = sub_18C2A6944((uint64_t)v128);
      if (*(unsigned char *)(v32 + 297))
      {
        uint64_t v26 = *(void *)(v32 + 152);
        v32 += 152;
        uint64_t v31 = v26;
        long long v28 = *(void **)(v32 + 56);
        char v29 = *(unsigned char *)(v32 + 32);
        char v30 = *(void **)(v32 + 24);
      }
      else
      {
        long long v28 = *(void **)(v32 + 56);
        char v29 = *(unsigned char *)(v32 + 32);
        char v30 = *(void **)(v32 + 24);
        uint64_t v31 = *(void *)v32;
      }
      long long v120 = *(_OWORD *)(v32 + 8);
    }
    else
    {
      uint64_t v27 = sub_18C2A6944((uint64_t)v128);
      long long v28 = *(void **)(v27 + 56);
      char v29 = *(unsigned char *)(v27 + 32);
      char v30 = *(void **)(v27 + 24);
      uint64_t v31 = *(void *)v27;
      long long v120 = *(_OWORD *)(v27 + 8);
      sub_18C2A68DC((uint64_t)v127, (uint64_t)&v148);
      uint64_t v32 = sub_18C2A6944((uint64_t)&v148);
    }
    sub_18C2A716C((void *)v32);
    id v33 = v25;

    a1 = v33;
    swift_bridgeObjectRetain();
    sub_18C2A911C(v31, v120, a1, (uint64_t)v146);
    uint64_t v34 = v146[0];
    uint64_t v35 = v146[1];
    uint64_t v36 = v146[2];
    uint64_t v37 = v146[3];
    uint64_t v38 = v146[4];
    uint64_t v39 = v146[5];
    uint64_t v40 = v146[6];
    uint64_t v41 = v146[7];
    uint64_t v42 = v146[8];
    uint64_t v43 = v146[9];
    uint64_t v44 = v146[10];
    uint64_t v114 = v146[12];
    uint64_t v117 = v146[11];
    char v45 = v147;

    swift_bridgeObjectRelease();
    sub_18C2A68DC((uint64_t)v127, (uint64_t)v126);
    if (sub_18C2A6938((uint64_t)v126) == 1)
    {
      uint64_t v46 = sub_18C2A6944((uint64_t)v126);
      uint64_t v47 = *(void *)v46;
      long long v48 = *(_OWORD *)(v46 + 8);
      id v49 = *(id *)(v46 + 24);
      char v50 = *(unsigned char *)(v46 + 32);
      *(_DWORD *)uint64_t v124 = *(_DWORD *)(v46 + 33);
      *(_DWORD *)&v124[3] = *(_DWORD *)(v46 + 36);
      uint64_t v52 = *(void *)(v46 + 40);
      uint64_t v51 = *(void *)(v46 + 48);
      uint64_t v53 = *(void *)(v46 + 56);
      uint64_t v54 = *(void *)(v46 + 64);
      uint64_t v55 = *(void *)(v46 + 72);
      uint64_t v56 = *(void *)(v46 + 80);
      uint64_t v57 = *(void *)(v46 + 88);
      uint64_t v58 = *(void *)(v46 + 96);
      uint64_t v59 = *(void *)(v46 + 104);
      uint64_t v60 = *(void *)(v46 + 112);
      uint64_t v61 = *(void *)(v46 + 120);
      uint64_t v62 = *(void *)(v46 + 128);
      uint64_t v63 = *(void *)(v46 + 136);
      char v64 = *(unsigned char *)(v46 + 144);
      *(_DWORD *)uint64_t v123 = *(_DWORD *)(v46 + 145);
      *(_DWORD *)&v123[3] = *(_DWORD *)(v46 + 148);
      uint64_t v65 = v46 + 152;
      id v66 = *(id *)(v46 + 176);
      char v67 = *(unsigned char *)(v46 + 184);
      *(_DWORD *)uint64_t v122 = *(_DWORD *)(v46 + 185);
      *(_DWORD *)&v122[3] = *(_DWORD *)(v46 + 188);
      __int16 v111 = *(_WORD *)(v46 + 297);
      long long v68 = v120;
      uint64_t v69 = v40;
      uint64_t v70 = v38;
      uint64_t v71 = v39;
      uint64_t v72 = v37;
      uint64_t v73 = v42;
      uint64_t v74 = v41;
      uint64_t v75 = v44;
      uint64_t v76 = v43;
      uint64_t v77 = v114;
      uint64_t v78 = v117;
      if (*(unsigned char *)(v46 + 297))
      {
        id v66 = a1;
        char v67 = v29;
      }
      else
      {
        uint64_t v65 = v46;
        uint64_t v47 = v31;
        uint64_t v62 = v117;
        uint64_t v63 = v114;
        uint64_t v78 = *(void *)(v46 + 280);
        uint64_t v77 = *(void *)(v46 + 288);
        id v49 = a1;
        char v50 = v29;
        uint64_t v60 = v76;
        uint64_t v61 = v75;
        uint64_t v76 = *(void *)(v46 + 264);
        uint64_t v75 = *(void *)(v46 + 272);
        uint64_t v52 = v34;
        uint64_t v51 = v35;
        uint64_t v58 = v74;
        uint64_t v59 = v73;
        uint64_t v74 = *(void *)(v46 + 248);
        uint64_t v73 = *(void *)(v46 + 256);
        uint64_t v53 = v36;
        uint64_t v54 = v72;
        uint64_t v55 = v70;
        uint64_t v56 = v71;
        uint64_t v72 = *(void *)(v46 + 216);
        uint64_t v70 = *(void *)(v46 + 224);
        uint64_t v34 = *(void *)(v46 + 192);
        uint64_t v35 = *(void *)(v46 + 200);
        uint64_t v57 = v69;
        char v64 = v45;
        uint64_t v31 = *(void *)(v46 + 152);
        uint64_t v36 = *(void *)(v46 + 208);
        uint64_t v71 = *(void *)(v46 + 232);
        uint64_t v69 = *(void *)(v46 + 240);
        char v45 = *(unsigned char *)(v46 + 296);
        long long v48 = v120;
        long long v68 = *(_OWORD *)(v46 + 160);
      }
      long long v95 = v48;
      uint64_t v96 = v63;
      uint64_t v97 = v62;
      id v98 = v66;
      uint64_t v99 = v34;
      uint64_t v100 = v35;
      uint64_t v101 = v36;
      long long v121 = v68;
      uint64_t v102 = v72;
      uint64_t v103 = v70;
      uint64_t v104 = v74;
      uint64_t v105 = v71;
      uint64_t v106 = v69;
      uint64_t v107 = v76;
      char v108 = v45;
      uint64_t v109 = v73;
      uint64_t v110 = v75;
      uint64_t v115 = v77;
      uint64_t v118 = v78;
      id v79 = a1;
      uint64_t v80 = v31;
      id v81 = v49;
      char v82 = v50;
      uint64_t v83 = v60;
      uint64_t v84 = v61;
      uint64_t v85 = v51;
      uint64_t v86 = v58;
      uint64_t v87 = v59;
      uint64_t v88 = v53;
      uint64_t v89 = v54;
      uint64_t v90 = v55;
      uint64_t v91 = v56;
      uint64_t v92 = v57;
      char v93 = v64;
      char v94 = v67;
      sub_18C2A73A0(v65);
      *(_DWORD *)char v152 = *(_DWORD *)v124;
      *(_DWORD *)&v152[3] = *(_DWORD *)&v124[3];
      *(_DWORD *)v167 = *(_DWORD *)v123;
      *(_DWORD *)&v167[3] = *(_DWORD *)&v123[3];
      *(_DWORD *)uint64_t v172 = *(_DWORD *)v122;
      *(_DWORD *)&v172[3] = *(_DWORD *)&v122[3];
      long long v149 = v95;
      uint64_t v148 = v47;
      id v150 = v81;
      char v151 = v82;
      uint64_t v153 = v52;
      uint64_t v154 = v85;
      uint64_t v155 = v88;
      uint64_t v156 = v89;
      uint64_t v157 = v90;
      uint64_t v158 = v91;
      uint64_t v159 = v92;
      uint64_t v160 = v86;
      uint64_t v161 = v87;
      uint64_t v162 = v83;
      uint64_t v163 = v84;
      uint64_t v164 = v97;
      uint64_t v165 = v96;
      char v166 = v93;
      uint64_t v168 = v80;
      a1 = v79;
      long long v169 = v121;
      id v170 = v98;
      char v171 = v94;
      uint64_t v173 = v99;
      uint64_t v174 = v100;
      uint64_t v175 = v101;
      uint64_t v176 = v102;
      uint64_t v177 = v103;
      uint64_t v178 = v105;
      uint64_t v179 = v106;
      uint64_t v180 = v104;
      uint64_t v181 = v109;
      uint64_t v182 = v107;
      uint64_t v183 = v110;
      uint64_t v184 = v118;
      uint64_t v185 = v115;
      char v186 = v108;
      __int16 v187 = v111;
      sub_18C2B8E44((uint64_t)&v148);
    }
    else
    {
      sub_18C2A6944((uint64_t)v126);
      sub_18C2B9414((uint64_t)v127, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
      long long v149 = v120;
      uint64_t v148 = v31;
      id v150 = a1;
      char v151 = v29;
      uint64_t v153 = v34;
      uint64_t v154 = v35;
      uint64_t v155 = v36;
      uint64_t v156 = v37;
      uint64_t v157 = v38;
      uint64_t v158 = v39;
      uint64_t v159 = v40;
      uint64_t v160 = v41;
      uint64_t v161 = v42;
      uint64_t v162 = v43;
      uint64_t v163 = v44;
      uint64_t v164 = v117;
      uint64_t v165 = v114;
      char v166 = v45;
      sub_18C2B8E8C((uint64_t)&v148);
    }
    sub_18C2A68DC((uint64_t)&v148, (uint64_t)v125);
    sub_18C2A68DC((uint64_t)v125, (uint64_t)&v148);
    sub_18C2B9938((uint64_t)&v148);
    swift_release();
  }
}

void (*IncomingCallTextViewAdapter.emphasizedNameFont.modify(void *a1))(id **a1, char a2)
{
  uint64_t v3 = (char *)malloc(0x3A0uLL);
  *a1 = v3;
  *((void *)v3 + 115) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)(v3 + 608), (uint64_t)(v3 + 304));
  sub_18C2A68DC((uint64_t)(v3 + 304), (uint64_t)v3);
  int v4 = sub_18C2A6938((uint64_t)v3);
  uint64_t v5 = sub_18C2A6944((uint64_t)v3);
  if (v4 == 1)
  {
    uint64_t v6 = (char *)(v5 + 296);
    if (*(unsigned char *)(v5 + 297))
    {
      uint64_t v8 = *(void *)(v5 + 152);
      v5 += 152;
      uint64_t v7 = v8;
      uint64_t v9 = *(void *)(v5 + 40);
      long long v30 = *(_OWORD *)(v5 + 48);
      uint64_t v10 = *(void *)(v5 + 80);
      uint64_t v28 = *(void *)(v5 + 72);
      uint64_t v29 = *(void *)(v5 + 64);
      uint64_t v11 = *(void *)(v5 + 88);
      uint64_t v12 = *(void *)(v5 + 96);
      uint64_t v13 = *(void *)(v5 + 104);
      uint64_t v14 = *(void *)(v5 + 112);
      uint64_t v16 = *(void *)(v5 + 120);
      uint64_t v15 = *(void *)(v5 + 128);
      uint64_t v17 = *(void *)(v5 + 136);
      char v18 = *v6;
      char v19 = *(unsigned char *)(v5 + 32);
      uint64_t v20 = *(void **)(v5 + 24);
    }
    else
    {
      uint64_t v9 = *(void *)(v5 + 40);
      long long v30 = *(_OWORD *)(v5 + 48);
      uint64_t v10 = *(void *)(v5 + 80);
      uint64_t v28 = *(void *)(v5 + 72);
      uint64_t v29 = *(void *)(v5 + 64);
      uint64_t v11 = *(void *)(v5 + 88);
      uint64_t v12 = *(void *)(v5 + 96);
      uint64_t v13 = *(void *)(v5 + 104);
      uint64_t v14 = *(void *)(v5 + 112);
      uint64_t v16 = *(void *)(v5 + 120);
      uint64_t v15 = *(void *)(v5 + 128);
      uint64_t v17 = *(void *)(v5 + 136);
      char v18 = *(unsigned char *)(v5 + 144);
      char v19 = *(unsigned char *)(v5 + 32);
      uint64_t v20 = *(void **)(v5 + 24);
      uint64_t v7 = *(void *)v5;
    }
    long long v27 = *(_OWORD *)(v5 + 8);
    sub_18C2A716C((void *)v5);
    sub_18C2B9414((uint64_t)(v3 + 304), (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v24 = v27;
    uint64_t v23 = v28;
    uint64_t v22 = v29;
    long long v21 = v30;
  }
  else
  {
    uint64_t v9 = *(void *)(v5 + 40);
    long long v21 = *(_OWORD *)(v5 + 48);
    uint64_t v22 = *(void *)(v5 + 64);
    uint64_t v23 = *(void *)(v5 + 72);
    uint64_t v10 = *(void *)(v5 + 80);
    uint64_t v11 = *(void *)(v5 + 88);
    uint64_t v12 = *(void *)(v5 + 96);
    uint64_t v13 = *(void *)(v5 + 104);
    uint64_t v14 = *(void *)(v5 + 112);
    uint64_t v16 = *(void *)(v5 + 120);
    uint64_t v15 = *(void *)(v5 + 128);
    uint64_t v17 = *(void *)(v5 + 136);
    char v18 = *(unsigned char *)(v5 + 144);
    char v19 = *(unsigned char *)(v5 + 32);
    uint64_t v20 = *(void **)(v5 + 24);
    uint64_t v7 = *(void *)v5;
    long long v24 = *(_OWORD *)(v5 + 8);
  }
  *((void *)v3 + 76) = v7;
  *(_OWORD *)(v3 + 616) = v24;
  *((void *)v3 + 79) = v20;
  v3[640] = v19;
  *((void *)v3 + 81) = v9;
  *((_OWORD *)v3 + 41) = v21;
  *((void *)v3 + 84) = v22;
  *((void *)v3 + 85) = v23;
  *((void *)v3 + 86) = v10;
  *((void *)v3 + 87) = v11;
  *((void *)v3 + 88) = v12;
  *((void *)v3 + 89) = v13;
  *((void *)v3 + 90) = v14;
  *((void *)v3 + 91) = v16;
  *((void *)v3 + 92) = v15;
  *((void *)v3 + 93) = v17;
  v3[752] = v18;
  id v25 = v20;
  sub_18C2A73A0((uint64_t)(v3 + 608));
  *((void *)v3 + 114) = v25;
  return sub_18C2B3384;
}

void sub_18C2B3384(id **a1, char a2)
{
  int v2 = *a1;
  id v3 = (*a1)[114];
  if (a2)
  {
    IncomingCallTextViewAdapter.emphasizedNameFont.setter(v3);
  }
  else
  {
    IncomingCallTextViewAdapter.emphasizedNameFont.setter(v3);
  }
  free(v2);
}

id IncomingCallTextViewAdapter.secondaryNameFont.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v63, (uint64_t)v62);
  sub_18C2A68DC((uint64_t)v62, (uint64_t)v63);
  int v0 = sub_18C2A6938((uint64_t)v63);
  uint64_t v1 = sub_18C2A6944((uint64_t)v63);
  if (v0 == 1)
  {
    uint64_t v2 = v1;
    id v3 = (char *)(v1 + 296);
    if (*(unsigned char *)(v1 + 297))
    {
      int v4 = (uint64_t *)(v1 + 40);
      uint64_t v5 = (uint64_t *)(v1 + 48);
      uint64_t v6 = (uint64_t *)(v1 + 56);
      uint64_t v7 = (uint64_t *)(v1 + 64);
      uint64_t v8 = (uint64_t *)(v1 + 72);
      uint64_t v9 = (uint64_t *)(v1 + 80);
      uint64_t v10 = (uint64_t *)(v1 + 88);
      uint64_t v11 = (uint64_t *)(v1 + 96);
      uint64_t v12 = (uint64_t *)(v1 + 104);
      uint64_t v13 = (uint64_t *)(v1 + 112);
      uint64_t v14 = (uint64_t *)(v1 + 120);
      uint64_t v15 = (uint64_t *)(v1 + 128);
      uint64_t v16 = (uint64_t *)(v1 + 136);
      id v3 = (char *)(v1 + 144);
      uint64_t v17 = (char *)(v1 + 32);
      char v18 = (uint64_t *)(v1 + 24);
      char v19 = (uint64_t *)(v1 + 16);
      uint64_t v20 = (uint64_t *)(v1 + 8);
    }
    else
    {
      v1 += 152;
      int v4 = (uint64_t *)(v2 + 192);
      uint64_t v5 = (uint64_t *)(v2 + 200);
      uint64_t v6 = (uint64_t *)(v2 + 208);
      uint64_t v7 = (uint64_t *)(v2 + 216);
      uint64_t v8 = (uint64_t *)(v2 + 224);
      uint64_t v9 = (uint64_t *)(v2 + 232);
      uint64_t v10 = (uint64_t *)(v2 + 240);
      uint64_t v11 = (uint64_t *)(v2 + 248);
      uint64_t v12 = (uint64_t *)(v2 + 256);
      uint64_t v13 = (uint64_t *)(v2 + 264);
      uint64_t v14 = (uint64_t *)(v2 + 272);
      uint64_t v15 = (uint64_t *)(v2 + 280);
      uint64_t v16 = (uint64_t *)(v2 + 288);
      uint64_t v17 = (char *)(v2 + 184);
      char v18 = (uint64_t *)(v2 + 176);
      char v19 = (uint64_t *)(v2 + 168);
      uint64_t v20 = (uint64_t *)(v2 + 160);
    }
    char v22 = *v3;
    uint64_t v41 = *v15;
    uint64_t v42 = *v16;
    uint64_t v23 = *v14;
    uint64_t v24 = *v13;
    uint64_t v25 = *v12;
    uint64_t v26 = *v11;
    uint64_t v27 = *v10;
    uint64_t v28 = *v9;
    uint64_t v29 = *v8;
    uint64_t v30 = *v7;
    uint64_t v31 = *v6;
    uint64_t v32 = *v5;
    uint64_t v33 = *v4;
    char v34 = *v17;
    uint64_t v35 = *v18;
    uint64_t v36 = *v19;
    uint64_t v37 = *(void *)v1;
    uint64_t v38 = *v20;
    sub_18C2A716C((void *)v1);
    sub_18C2B9414((uint64_t)v62, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    v43[0] = v37;
    v43[1] = v38;
    v43[2] = v36;
    v43[3] = v35;
    char v44 = v34;
    uint64_t v45 = v33;
    uint64_t v46 = v32;
    uint64_t v47 = v31;
    uint64_t v48 = v30;
    uint64_t v49 = v29;
    uint64_t v50 = v28;
    uint64_t v51 = v27;
    uint64_t v52 = v26;
    uint64_t v53 = v25;
    uint64_t v54 = v24;
    uint64_t v55 = v23;
    uint64_t v56 = v41;
    uint64_t v57 = v42;
    char v58 = v22;
    nullsub_1(v43);
    sub_18C29E1A4((uint64_t)v43, (uint64_t)v60);
    uint64_t v39 = v61;
    sub_18C29E1A4((uint64_t)v60, (uint64_t)v59);
    id v21 = v39;
    sub_18C2B9574((uint64_t)v59, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  else
  {
    sub_18C2B9414((uint64_t)v62, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    return 0;
  }
  return v21;
}

void IncomingCallTextViewAdapter.secondaryNameFont.setter(void *a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    id v2 = a1;
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    sub_18C2A68DC((uint64_t)v124, (uint64_t)v126);
    sub_18C2A68DC((uint64_t)v126, (uint64_t)v127);
    int v3 = sub_18C2A6938((uint64_t)v127);
    uint64_t v4 = sub_18C2A6944((uint64_t)v127);
    id obj = a1;
    if (v3 == 1)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (char *)(v4 + 296);
      uint64_t v96 = v2;
      if (*(unsigned char *)(v4 + 297))
      {
        uint64_t v7 = (uint64_t *)(v4 + 40);
        uint64_t v8 = (uint64_t *)(v4 + 48);
        uint64_t v9 = (uint64_t *)(v4 + 56);
        uint64_t v10 = (uint64_t *)(v4 + 64);
        uint64_t v11 = (uint64_t *)(v4 + 72);
        uint64_t v12 = (uint64_t *)(v4 + 80);
        uint64_t v13 = (uint64_t *)(v4 + 88);
        uint64_t v14 = (uint64_t *)(v4 + 96);
        uint64_t v15 = (uint64_t *)(v4 + 104);
        uint64_t v16 = (uint64_t *)(v4 + 112);
        uint64_t v17 = (uint64_t *)(v4 + 120);
        char v18 = (uint64_t *)(v4 + 128);
        char v19 = (uint64_t *)(v4 + 136);
        uint64_t v6 = (char *)(v4 + 144);
        uint64_t v20 = (char *)(v4 + 32);
        id v21 = (uint64_t *)(v4 + 24);
        char v22 = (uint64_t *)(v4 + 16);
        uint64_t v23 = (uint64_t *)(v4 + 8);
      }
      else
      {
        v4 += 152;
        uint64_t v7 = (uint64_t *)(v5 + 192);
        uint64_t v8 = (uint64_t *)(v5 + 200);
        uint64_t v9 = (uint64_t *)(v5 + 208);
        uint64_t v10 = (uint64_t *)(v5 + 216);
        uint64_t v11 = (uint64_t *)(v5 + 224);
        uint64_t v12 = (uint64_t *)(v5 + 232);
        uint64_t v13 = (uint64_t *)(v5 + 240);
        uint64_t v14 = (uint64_t *)(v5 + 248);
        uint64_t v15 = (uint64_t *)(v5 + 256);
        uint64_t v16 = (uint64_t *)(v5 + 264);
        uint64_t v17 = (uint64_t *)(v5 + 272);
        char v18 = (uint64_t *)(v5 + 280);
        char v19 = (uint64_t *)(v5 + 288);
        uint64_t v20 = (char *)(v5 + 184);
        id v21 = (uint64_t *)(v5 + 176);
        char v22 = (uint64_t *)(v5 + 168);
        uint64_t v23 = (uint64_t *)(v5 + 160);
      }
      char v24 = *v6;
      uint64_t v93 = *v18;
      uint64_t v95 = *v19;
      uint64_t v25 = *v17;
      uint64_t v26 = *v16;
      uint64_t v27 = *v15;
      uint64_t v28 = *v14;
      uint64_t v29 = *v13;
      uint64_t v30 = *v12;
      uint64_t v31 = *v11;
      uint64_t v32 = *v10;
      uint64_t v33 = *v9;
      uint64_t v34 = *v8;
      uint64_t v35 = *v7;
      char v36 = *v20;
      uint64_t v37 = *v21;
      uint64_t v38 = *v22;
      uint64_t v39 = *(void *)v4;
      uint64_t v40 = *v23;
      sub_18C2A716C((void *)v4);
      sub_18C2B9414((uint64_t)v126, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
      v130[0] = v39;
      v130[1] = v40;
      v130[2] = v38;
      v130[3] = v37;
      char v131 = v36;
      uint64_t v132 = v35;
      uint64_t v133 = v34;
      uint64_t v134 = v33;
      uint64_t v135 = v32;
      uint64_t v136 = v31;
      uint64_t v137 = v30;
      uint64_t v138 = v29;
      uint64_t v139 = v28;
      uint64_t v140 = v27;
      uint64_t v141 = v26;
      uint64_t v142 = v25;
      uint64_t v143 = v93;
      uint64_t v144 = v95;
      char v145 = v24;
      nullsub_1(v130);
      sub_18C29E1A4((uint64_t)v130, (uint64_t)v124);
      uint64_t v41 = v125;
      sub_18C29E1A4((uint64_t)v124, (uint64_t)v123);
      id v42 = v41;
      sub_18C2B9574((uint64_t)v123, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
      sub_18C29B910(0, (unint64_t *)&qword_1E916CE30);
      id v2 = v96;
      id v43 = v96;
      id v44 = v42;
      LOBYTE(v42) = sub_18C2CAB30();

      if (v42)
      {

        return;
      }
    }
    else
    {
      sub_18C2B9414((uint64_t)v126, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    }
    swift_retain();
    uint64_t v45 = sub_18C2BA050(v122);
    sub_18C2A68DC(v46, (uint64_t)v123);
    sub_18C2A68DC((uint64_t)v123, (uint64_t)v124);
    int v47 = sub_18C2A6938((uint64_t)v124);
    uint64_t v48 = sub_18C2A6944((uint64_t)v124);
    if (v47 == 1)
    {
      uint64_t v49 = v48;
      uint64_t v50 = (char *)(v48 + 296);
      if (*(unsigned char *)(v48 + 297))
      {
        uint64_t v51 = (uint64_t *)(v48 + 40);
        uint64_t v52 = (uint64_t *)(v48 + 48);
        uint64_t v53 = (uint64_t *)(v48 + 56);
        uint64_t v54 = (uint64_t *)(v48 + 64);
        uint64_t v55 = (uint64_t *)(v48 + 72);
        uint64_t v56 = (uint64_t *)(v48 + 80);
        uint64_t v57 = (uint64_t *)(v48 + 88);
        char v58 = (uint64_t *)(v48 + 96);
        uint64_t v59 = (uint64_t *)(v48 + 104);
        uint64_t v60 = (uint64_t *)(v48 + 112);
        uint64_t v61 = (uint64_t *)(v48 + 120);
        uint64_t v62 = (uint64_t *)(v48 + 128);
        uint64_t v63 = (uint64_t *)(v48 + 136);
        uint64_t v50 = (char *)(v48 + 144);
        char v64 = (char *)(v48 + 32);
        uint64_t v65 = (uint64_t *)(v48 + 24);
        id v66 = (uint64_t *)(v48 + 16);
        char v67 = (uint64_t *)(v48 + 8);
      }
      else
      {
        v48 += 152;
        uint64_t v51 = (uint64_t *)(v49 + 192);
        uint64_t v52 = (uint64_t *)(v49 + 200);
        uint64_t v53 = (uint64_t *)(v49 + 208);
        uint64_t v54 = (uint64_t *)(v49 + 216);
        uint64_t v55 = (uint64_t *)(v49 + 224);
        uint64_t v56 = (uint64_t *)(v49 + 232);
        uint64_t v57 = (uint64_t *)(v49 + 240);
        char v58 = (uint64_t *)(v49 + 248);
        uint64_t v59 = (uint64_t *)(v49 + 256);
        uint64_t v60 = (uint64_t *)(v49 + 264);
        uint64_t v61 = (uint64_t *)(v49 + 272);
        uint64_t v62 = (uint64_t *)(v49 + 280);
        uint64_t v63 = (uint64_t *)(v49 + 288);
        char v64 = (char *)(v49 + 184);
        uint64_t v65 = (uint64_t *)(v49 + 176);
        id v66 = (uint64_t *)(v49 + 168);
        char v67 = (uint64_t *)(v49 + 160);
      }
      char v94 = v45;
      char v68 = *v50;
      uint64_t v91 = *v62;
      uint64_t v92 = *v63;
      uint64_t v69 = *v61;
      uint64_t v70 = *v60;
      uint64_t v71 = *v59;
      uint64_t v72 = *v58;
      uint64_t v73 = *v57;
      uint64_t v74 = *v56;
      uint64_t v75 = *v55;
      uint64_t v76 = *v54;
      uint64_t v77 = v2;
      uint64_t v78 = *v53;
      uint64_t v79 = *v52;
      uint64_t v80 = *v51;
      char v81 = *v64;
      uint64_t v82 = *v65;
      uint64_t v83 = *v66;
      uint64_t v84 = *(void *)v48;
      uint64_t v85 = *v67;
      sub_18C2A716C((void *)v48);
      v98[0] = v84;
      v98[1] = v85;
      v98[2] = v83;
      v98[3] = v82;
      char v99 = v81;
      uint64_t v100 = v80;
      uint64_t v101 = v79;
      uint64_t v102 = v78;
      uint64_t v103 = v76;
      uint64_t v104 = v75;
      uint64_t v105 = v74;
      uint64_t v106 = v73;
      uint64_t v107 = v72;
      uint64_t v108 = v71;
      uint64_t v109 = v70;
      uint64_t v110 = v69;
      uint64_t v111 = v91;
      uint64_t v112 = v92;
      char v113 = v68;
      nullsub_1(v98);
      sub_18C29E1A4((uint64_t)v98, (uint64_t)v114);
      id v86 = v77;
      objc_storeStrong(&v115, obj);
      uint64_t v87 = v114[0];
      uint64_t v88 = v114[1];
      id v89 = v86;
      swift_bridgeObjectRetain();
      sub_18C2A911C(v87, v88, v89, (uint64_t)v128);
      uint64_t v90 = (void *)v117;

      swift_bridgeObjectRelease();
      long long v119 = v128[3];
      long long v120 = v128[4];
      v121[0] = v129[0];
      *(_OWORD *)((char *)v121 + 9) = *(_OWORD *)((char *)v129 + 9);
      long long v116 = v128[0];
      long long v117 = v128[1];
      long long v118 = v128[2];
      sub_18C29E1A4((uint64_t)v114, (uint64_t)v130);
      sub_18C2BCEFC((uint64_t)v130);
      v94((void **)v122, 0);
      swift_release();
    }
    else
    {
      v45((void **)v122, 0);
      swift_release();
    }
  }
}

void (*IncomingCallTextViewAdapter.secondaryNameFont.modify(id *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = IncomingCallTextViewAdapter.secondaryNameFont.getter();
  return sub_18C2B3D74;
}

void sub_18C2B3D74(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    IncomingCallTextViewAdapter.secondaryNameFont.setter(v2);
  }
  else
  {
    IncomingCallTextViewAdapter.secondaryNameFont.setter(*a1);
  }
}

id IncomingCallTextViewAdapter.statusFont.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v7, (uint64_t)v6);
  sub_18C29E1A4((uint64_t)v6, (uint64_t)v4);
  sub_18C29E1A4((uint64_t)v6, (uint64_t)v7);
  if (sub_18C2A7154((uint64_t)v7) == 1) {
    return 0;
  }
  uint64_t v1 = v5;
  sub_18C29E1A4((uint64_t)v4, (uint64_t)v3);
  id v0 = v1;
  sub_18C2B9574((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  return v0;
}

void IncomingCallTextViewAdapter.statusFont.setter(void *a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    id v2 = a1;
    sub_18C2CA530();
    swift_release();
    swift_release();
    swift_release();
    sub_18C29E1A4((uint64_t)v14, (uint64_t)v17);
    sub_18C29E1A4((uint64_t)v17, (uint64_t)v15);
    sub_18C29E1A4((uint64_t)v17, (uint64_t)v18);
    if (sub_18C2A7154((uint64_t)v18) == 1) {
      goto LABEL_5;
    }
    id v3 = v16;
    sub_18C29E1A4((uint64_t)v15, (uint64_t)v14);
    id v4 = v3;
    sub_18C2B9574((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C29B910(0, (unint64_t *)&qword_1E916CE30);
    id v5 = v2;
    id v6 = v4;
    LOBYTE(v4) = sub_18C2CAB30();

    if ((v4 & 1) == 0)
    {
LABEL_5:
      swift_retain();
      uint64_t v7 = sub_18C2B96DC(v13);
      uint64_t v9 = v8;
      sub_18C29E1A4(v8, (uint64_t)v14);
      sub_18C29E1A4((uint64_t)v14, (uint64_t)v15);
      if (sub_18C2A7154((uint64_t)v15) != 1)
      {
        id v10 = v2;
        objc_storeStrong((id *)(v9 + 24), a1);
        uint64_t v11 = *(void *)v9;
        uint64_t v12 = *(void *)(v9 + 8);
        id v2 = v10;
        swift_bridgeObjectRetain();
        sub_18C2A911C(v11, v12, v2, (uint64_t)v19);
        sub_18C2B8ED0((uint64_t)v19, v9 + 40);
      }
      ((void (*)(void *, void))v7)(v13, 0);
      swift_release();
    }
    else
    {
    }
  }
}

void (*IncomingCallTextViewAdapter.statusFont.modify(void *a1))(id **a1, char a2)
{
  id v3 = malloc(0x270uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t)(v3 + 57);
  id v5 = v3 + 76;
  v3[77] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)(v3 + 57), (uint64_t)(v3 + 19));
  sub_18C29E1A4((uint64_t)(v3 + 19), (uint64_t)(v3 + 38));
  sub_18C29E1A4((uint64_t)(v3 + 19), (uint64_t)v3);
  if (sub_18C2A7154((uint64_t)v3) == 1)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = (void *)v3[41];
    sub_18C29E1A4((uint64_t)(v3 + 38), v4);
    id v6 = v7;
    sub_18C2B9574(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  void *v5 = v6;
  return sub_18C2B42FC;
}

void sub_18C2B42FC(id **a1, char a2)
{
  id v2 = *a1;
  id v3 = (*a1)[76];
  if (a2)
  {
    id v4 = v3;
    IncomingCallTextViewAdapter.statusFont.setter(v3);
  }
  else
  {
    IncomingCallTextViewAdapter.statusFont.setter((*a1)[76]);
  }
  free(v2);
}

uint64_t IncomingCallTextViewAdapter.displayNameText.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v44, (uint64_t)v43);
  sub_18C2A68DC((uint64_t)v43, (uint64_t)v44);
  int v0 = sub_18C2A6938((uint64_t)v44);
  uint64_t v1 = sub_18C2A6944((uint64_t)v44);
  if (v0 == 1)
  {
    id v2 = (char *)(v1 + 296);
    if (*(unsigned char *)(v1 + 298))
    {
      uint64_t v4 = *(void *)(v1 + 152);
      v1 += 152;
      uint64_t v3 = v4;
      uint64_t v5 = *(void *)(v1 + 40);
      long long v25 = *(_OWORD *)(v1 + 48);
      uint64_t v6 = *(void *)(v1 + 80);
      uint64_t v23 = *(void *)(v1 + 72);
      uint64_t v24 = *(void *)(v1 + 64);
      uint64_t v7 = *(void *)(v1 + 88);
      uint64_t v8 = *(void *)(v1 + 96);
      uint64_t v9 = *(void *)(v1 + 104);
      uint64_t v10 = *(void *)(v1 + 112);
      uint64_t v12 = *(void *)(v1 + 120);
      uint64_t v11 = *(void *)(v1 + 128);
      uint64_t v13 = *(void *)(v1 + 136);
      char v14 = *v2;
      char v15 = *(unsigned char *)(v1 + 32);
      uint64_t v16 = *(void *)(v1 + 24);
    }
    else
    {
      uint64_t v5 = *(void *)(v1 + 40);
      long long v25 = *(_OWORD *)(v1 + 48);
      uint64_t v6 = *(void *)(v1 + 80);
      uint64_t v23 = *(void *)(v1 + 72);
      uint64_t v24 = *(void *)(v1 + 64);
      uint64_t v7 = *(void *)(v1 + 88);
      uint64_t v8 = *(void *)(v1 + 96);
      uint64_t v9 = *(void *)(v1 + 104);
      uint64_t v10 = *(void *)(v1 + 112);
      uint64_t v12 = *(void *)(v1 + 120);
      uint64_t v11 = *(void *)(v1 + 128);
      uint64_t v13 = *(void *)(v1 + 136);
      char v14 = *(unsigned char *)(v1 + 144);
      char v15 = *(unsigned char *)(v1 + 32);
      uint64_t v16 = *(void *)(v1 + 24);
      uint64_t v3 = *(void *)v1;
    }
    long long v22 = *(_OWORD *)(v1 + 8);
    sub_18C2A716C((void *)v1);
    sub_18C2B9414((uint64_t)v43, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v20 = v22;
    uint64_t v19 = v23;
    uint64_t v18 = v24;
    long long v17 = v25;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 40);
    long long v17 = *(_OWORD *)(v1 + 48);
    uint64_t v18 = *(void *)(v1 + 64);
    uint64_t v19 = *(void *)(v1 + 72);
    uint64_t v6 = *(void *)(v1 + 80);
    uint64_t v7 = *(void *)(v1 + 88);
    uint64_t v8 = *(void *)(v1 + 96);
    uint64_t v9 = *(void *)(v1 + 104);
    uint64_t v10 = *(void *)(v1 + 112);
    uint64_t v12 = *(void *)(v1 + 120);
    uint64_t v11 = *(void *)(v1 + 128);
    uint64_t v13 = *(void *)(v1 + 136);
    char v14 = *(unsigned char *)(v1 + 144);
    char v15 = *(unsigned char *)(v1 + 32);
    uint64_t v16 = *(void *)(v1 + 24);
    uint64_t v3 = *(void *)v1;
    long long v20 = *(_OWORD *)(v1 + 8);
  }
  uint64_t v26 = v3;
  long long v27 = v20;
  uint64_t v28 = v16;
  char v29 = v15;
  uint64_t v30 = v5;
  long long v31 = v17;
  uint64_t v32 = v18;
  uint64_t v33 = v19;
  uint64_t v34 = v6;
  uint64_t v35 = v7;
  uint64_t v36 = v8;
  uint64_t v37 = v9;
  uint64_t v38 = v10;
  uint64_t v39 = v12;
  uint64_t v40 = v11;
  uint64_t v41 = v13;
  char v42 = v14;
  swift_bridgeObjectRetain();
  sub_18C2A73A0((uint64_t)&v26);
  return v3;
}

void IncomingCallTextViewAdapter.displayNameText.setter(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v182, (uint64_t)v181);
  sub_18C2A68DC((uint64_t)v181, (uint64_t)v182);
  int v4 = sub_18C2A6938((uint64_t)v182);
  uint64_t v5 = sub_18C2A6944((uint64_t)v182);
  if (v4 == 1)
  {
    uint64_t v6 = (char *)(v5 + 296);
    if (*(unsigned char *)(v5 + 298))
    {
      uint64_t v8 = *(void *)(v5 + 152);
      v5 += 152;
      uint64_t v7 = v8;
      uint64_t v9 = *(void *)(v5 + 40);
      long long v112 = *(_OWORD *)(v5 + 48);
      uint64_t v10 = *(void *)(v5 + 80);
      uint64_t v106 = *(void *)(v5 + 72);
      uint64_t v109 = *(void *)(v5 + 64);
      uint64_t v11 = *(void *)(v5 + 88);
      uint64_t v12 = *(void *)(v5 + 96);
      uint64_t v13 = *(void *)(v5 + 104);
      uint64_t v14 = *(void *)(v5 + 112);
      uint64_t v16 = *(void *)(v5 + 120);
      uint64_t v15 = *(void *)(v5 + 128);
      uint64_t v17 = *(void *)(v5 + 136);
      char v18 = *v6;
      char v19 = *(unsigned char *)(v5 + 32);
      uint64_t v20 = *(void *)(v5 + 24);
    }
    else
    {
      uint64_t v9 = *(void *)(v5 + 40);
      long long v112 = *(_OWORD *)(v5 + 48);
      uint64_t v10 = *(void *)(v5 + 80);
      uint64_t v106 = *(void *)(v5 + 72);
      uint64_t v109 = *(void *)(v5 + 64);
      uint64_t v11 = *(void *)(v5 + 88);
      uint64_t v12 = *(void *)(v5 + 96);
      uint64_t v13 = *(void *)(v5 + 104);
      uint64_t v14 = *(void *)(v5 + 112);
      uint64_t v16 = *(void *)(v5 + 120);
      uint64_t v15 = *(void *)(v5 + 128);
      uint64_t v17 = *(void *)(v5 + 136);
      char v18 = *(unsigned char *)(v5 + 144);
      char v19 = *(unsigned char *)(v5 + 32);
      uint64_t v20 = *(void *)(v5 + 24);
      uint64_t v7 = *(void *)v5;
    }
    long long v105 = *(_OWORD *)(v5 + 8);
    sub_18C2A716C((void *)v5);
    sub_18C2B9414((uint64_t)v181, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v24 = v105;
    uint64_t v23 = v106;
    uint64_t v22 = v109;
    long long v21 = v112;
  }
  else
  {
    uint64_t v9 = *(void *)(v5 + 40);
    long long v21 = *(_OWORD *)(v5 + 48);
    uint64_t v22 = *(void *)(v5 + 64);
    uint64_t v23 = *(void *)(v5 + 72);
    uint64_t v10 = *(void *)(v5 + 80);
    uint64_t v11 = *(void *)(v5 + 88);
    uint64_t v12 = *(void *)(v5 + 96);
    uint64_t v13 = *(void *)(v5 + 104);
    uint64_t v14 = *(void *)(v5 + 112);
    uint64_t v16 = *(void *)(v5 + 120);
    uint64_t v15 = *(void *)(v5 + 128);
    uint64_t v17 = *(void *)(v5 + 136);
    char v18 = *(unsigned char *)(v5 + 144);
    char v19 = *(unsigned char *)(v5 + 32);
    uint64_t v20 = *(void *)(v5 + 24);
    uint64_t v7 = *(void *)v5;
    long long v24 = *(_OWORD *)(v5 + 8);
  }
  long long v123 = v24;
  uint64_t v122 = v7;
  uint64_t v124 = v20;
  char v125 = v19;
  uint64_t v126 = v9;
  long long v127 = v21;
  uint64_t v128 = v22;
  uint64_t v129 = v23;
  uint64_t v130 = v10;
  uint64_t v131 = v11;
  uint64_t v132 = v12;
  uint64_t v133 = v13;
  uint64_t v134 = v14;
  uint64_t v135 = v16;
  uint64_t v136 = v15;
  uint64_t v137 = v17;
  uint64_t v25 = v24;
  char v138 = v18;
  swift_bridgeObjectRetain();
  sub_18C2A73A0((uint64_t)&v122);
  if (v7 == a1 && v25 == a2)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v26 = sub_18C2CACD0();
    swift_bridgeObjectRelease();
    if (v26)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_18C2CA530();
      swift_release();
      swift_release();
      sub_18C2A68DC((uint64_t)&v141, (uint64_t)v120);
      sub_18C2A68DC((uint64_t)v120, (uint64_t)v121);
      if (sub_18C2A6938((uint64_t)v121) == 1)
      {
        uint64_t v30 = sub_18C2A6944((uint64_t)v121);
        if (*(unsigned char *)(v30 + 298))
        {
          uint64_t v28 = *(void **)(v30 + 208);
          char v29 = *(unsigned char *)(v30 + 184);
          long long v113 = *(_OWORD *)(v30 + 168);
          v30 += 152;
        }
        else
        {
          uint64_t v28 = *(void **)(v30 + 56);
          char v29 = *(unsigned char *)(v30 + 32);
          long long v113 = *(_OWORD *)(v30 + 16);
        }
      }
      else
      {
        uint64_t v27 = sub_18C2A6944((uint64_t)v121);
        uint64_t v28 = *(void **)(v27 + 56);
        char v29 = *(unsigned char *)(v27 + 32);
        long long v113 = *(_OWORD *)(v27 + 16);
        sub_18C2A68DC((uint64_t)v120, (uint64_t)&v141);
        uint64_t v30 = sub_18C2A6944((uint64_t)&v141);
      }
      sub_18C2A716C((void *)v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      id v31 = *((id *)&v113 + 1);
      sub_18C2A911C(a1, a2, v31, (uint64_t)v139);
      uint64_t v32 = v139[0];
      uint64_t v33 = v139[1];
      uint64_t v34 = v139[2];
      uint64_t v35 = v139[3];
      uint64_t v36 = v139[4];
      uint64_t v37 = v139[5];
      uint64_t v38 = v139[6];
      uint64_t v39 = v139[7];
      uint64_t v40 = v139[8];
      uint64_t v41 = v139[9];
      uint64_t v42 = v139[10];
      uint64_t v107 = v139[12];
      uint64_t v110 = v139[11];
      char v43 = v140;

      swift_bridgeObjectRelease();
      sub_18C2A68DC((uint64_t)v120, (uint64_t)v119);
      if (sub_18C2A6938((uint64_t)v119) == 1)
      {
        uint64_t v44 = sub_18C2A6944((uint64_t)v119);
        uint64_t v45 = *(void *)v44;
        long long v46 = *(_OWORD *)(v44 + 16);
        char v47 = *(unsigned char *)(v44 + 32);
        *(_DWORD *)long long v117 = *(_DWORD *)(v44 + 33);
        *(_DWORD *)&v117[3] = *(_DWORD *)(v44 + 36);
        uint64_t v48 = *(void *)(v44 + 40);
        uint64_t v49 = *(void *)(v44 + 48);
        uint64_t v50 = *(void *)(v44 + 56);
        uint64_t v51 = *(void *)(v44 + 64);
        uint64_t v52 = *(void *)(v44 + 72);
        uint64_t v53 = *(void *)(v44 + 80);
        uint64_t v54 = *(void *)(v44 + 88);
        uint64_t v55 = *(void *)(v44 + 96);
        uint64_t v56 = *(void *)(v44 + 104);
        uint64_t v57 = *(void *)(v44 + 112);
        uint64_t v58 = *(void *)(v44 + 120);
        uint64_t v59 = *(void *)(v44 + 128);
        uint64_t v60 = *(void *)(v44 + 136);
        char v61 = *(unsigned char *)(v44 + 144);
        *(_DWORD *)long long v116 = *(_DWORD *)(v44 + 145);
        *(_DWORD *)&v116[3] = *(_DWORD *)(v44 + 148);
        uint64_t v62 = v44 + 152;
        int64x2_t v63 = *(int64x2_t *)(v44 + 160);
        *(_DWORD *)id v115 = *(_DWORD *)(v44 + 185);
        *(_DWORD *)&v115[3] = *(_DWORD *)(v44 + 188);
        __int16 v104 = *(_WORD *)(v44 + 297);
        uint64_t v64 = v38;
        uint64_t v65 = v36;
        uint64_t v66 = v37;
        uint64_t v67 = v35;
        uint64_t v68 = v40;
        uint64_t v69 = v39;
        uint64_t v70 = v42;
        uint64_t v71 = v41;
        uint64_t v72 = v107;
        uint64_t v73 = v110;
        if (*(unsigned char *)(v44 + 298))
        {
          int64x2_t v63 = vdupq_lane_s64(v113, 0);
          v63.i64[0] = a2;
          a2 = *(void *)(v44 + 8);
        }
        else
        {
          uint64_t v62 = v44;
          uint64_t v59 = v110;
          uint64_t v60 = v107;
          uint64_t v73 = *(void *)(v44 + 280);
          uint64_t v72 = *(void *)(v44 + 288);
          uint64_t v45 = a1;
          char v47 = v29;
          uint64_t v57 = v71;
          uint64_t v58 = v70;
          uint64_t v71 = *(void *)(v44 + 264);
          uint64_t v70 = *(void *)(v44 + 272);
          uint64_t v48 = v32;
          uint64_t v49 = v33;
          uint64_t v55 = v69;
          uint64_t v56 = v68;
          uint64_t v69 = *(void *)(v44 + 248);
          uint64_t v68 = *(void *)(v44 + 256);
          uint64_t v50 = v34;
          uint64_t v51 = v67;
          uint64_t v52 = v65;
          uint64_t v53 = v66;
          uint64_t v67 = *(void *)(v44 + 216);
          uint64_t v65 = *(void *)(v44 + 224);
          uint64_t v32 = *(void *)(v44 + 192);
          uint64_t v33 = *(void *)(v44 + 200);
          uint64_t v54 = v64;
          char v61 = v43;
          a1 = *(void *)(v44 + 152);
          id v31 = *(id *)(v44 + 176);
          char v29 = *(unsigned char *)(v44 + 184);
          uint64_t v34 = *(void *)(v44 + 208);
          uint64_t v66 = *(void *)(v44 + 232);
          uint64_t v64 = *(void *)(v44 + 240);
          char v43 = *(unsigned char *)(v44 + 296);
          long long v46 = v113;
        }
        long long v89 = v46;
        uint64_t v90 = v59;
        uint64_t v91 = v60;
        int64x2_t v92 = v63;
        uint64_t v93 = v32;
        uint64_t v94 = v33;
        uint64_t v95 = v34;
        uint64_t v96 = v67;
        uint64_t v97 = v65;
        uint64_t v98 = v66;
        uint64_t v99 = v69;
        uint64_t v100 = v64;
        uint64_t v101 = v71;
        char v102 = v43;
        uint64_t v103 = v68;
        uint64_t v111 = v73;
        uint64_t v114 = v70;
        uint64_t v108 = v72;
        char v74 = v29;
        uint64_t v75 = v57;
        uint64_t v76 = v58;
        id v77 = v31;
        uint64_t v78 = v48;
        uint64_t v79 = a1;
        uint64_t v80 = v49;
        uint64_t v81 = v55;
        uint64_t v82 = v56;
        uint64_t v83 = v50;
        uint64_t v84 = v51;
        uint64_t v85 = v52;
        uint64_t v86 = v53;
        uint64_t v87 = v54;
        char v88 = v61;
        sub_18C2A73A0(v62);
        *(_DWORD *)char v145 = *(_DWORD *)v117;
        *(_DWORD *)&v145[3] = *(_DWORD *)&v117[3];
        *(_DWORD *)uint64_t v160 = *(_DWORD *)v116;
        *(_DWORD *)&v160[3] = *(_DWORD *)&v116[3];
        *(_DWORD *)uint64_t v165 = *(_DWORD *)v115;
        *(_DWORD *)&v165[3] = *(_DWORD *)&v115[3];
        uint64_t v141 = v45;
        uint64_t v142 = a2;
        long long v143 = v89;
        char v144 = v47;
        uint64_t v146 = v78;
        uint64_t v147 = v80;
        uint64_t v148 = v83;
        uint64_t v149 = v84;
        uint64_t v150 = v85;
        uint64_t v151 = v86;
        uint64_t v152 = v87;
        uint64_t v153 = v81;
        uint64_t v154 = v82;
        uint64_t v155 = v75;
        uint64_t v156 = v76;
        uint64_t v157 = v90;
        uint64_t v158 = v91;
        char v159 = v88;
        uint64_t v161 = v79;
        int64x2_t v162 = v92;
        id v163 = v77;
        char v164 = v74;
        uint64_t v166 = v93;
        uint64_t v167 = v94;
        uint64_t v168 = v95;
        uint64_t v169 = v96;
        uint64_t v170 = v97;
        uint64_t v171 = v98;
        uint64_t v172 = v100;
        uint64_t v173 = v99;
        uint64_t v174 = v103;
        uint64_t v175 = v101;
        uint64_t v176 = v114;
        uint64_t v177 = v111;
        uint64_t v178 = v108;
        char v179 = v102;
        __int16 v180 = v104;
        sub_18C2B8E44((uint64_t)&v141);
      }
      else
      {
        sub_18C2A6944((uint64_t)v119);
        sub_18C2B9414((uint64_t)v120, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
        uint64_t v141 = a1;
        uint64_t v142 = a2;
        long long v143 = v113;
        char v144 = v29;
        uint64_t v146 = v32;
        uint64_t v147 = v33;
        uint64_t v148 = v34;
        uint64_t v149 = v35;
        uint64_t v150 = v36;
        uint64_t v151 = v37;
        uint64_t v152 = v38;
        uint64_t v153 = v39;
        uint64_t v154 = v40;
        uint64_t v155 = v41;
        uint64_t v156 = v42;
        uint64_t v157 = v110;
        uint64_t v158 = v107;
        char v159 = v43;
        sub_18C2B8E8C((uint64_t)&v141);
      }
      sub_18C2A68DC((uint64_t)&v141, (uint64_t)v118);
      sub_18C2A68DC((uint64_t)v118, (uint64_t)&v141);
      sub_18C2B9938((uint64_t)&v141);
      swift_release();
      IncomingCallTextViewAdapter.setupOrTeardownEmojiTextViewIfNecessary()();
    }
  }
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.setupOrTeardownEmojiTextViewIfNecessary()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18C2CA7F0();
  MEMORY[0x1F4188790](v2);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v72, (uint64_t)v71);
  sub_18C2A68DC((uint64_t)v71, (uint64_t)v72);
  int v3 = sub_18C2A6938((uint64_t)v72);
  uint64_t v4 = sub_18C2A6944((uint64_t)v72);
  if (v3 == 1)
  {
    uint64_t v5 = (char *)(v4 + 296);
    if (*(unsigned char *)(v4 + 298))
    {
      uint64_t v7 = *(void *)(v4 + 152);
      v4 += 152;
      uint64_t v6 = v7;
      uint64_t v8 = *(void *)(v4 + 40);
      long long v53 = *(_OWORD *)(v4 + 48);
      uint64_t v9 = *(void *)(v4 + 80);
      uint64_t v51 = *(void *)(v4 + 72);
      uint64_t v52 = *(void *)(v4 + 64);
      uint64_t v10 = *(void *)(v4 + 88);
      uint64_t v11 = *(void *)(v4 + 96);
      uint64_t v12 = *(void *)(v4 + 104);
      uint64_t v13 = *(void *)(v4 + 112);
      uint64_t v15 = *(void *)(v4 + 120);
      uint64_t v14 = *(void *)(v4 + 128);
      uint64_t v16 = *(void *)(v4 + 136);
      char v17 = *v5;
      char v18 = *(unsigned char *)(v4 + 32);
      uint64_t v19 = *(void *)(v4 + 24);
    }
    else
    {
      uint64_t v8 = *(void *)(v4 + 40);
      long long v53 = *(_OWORD *)(v4 + 48);
      uint64_t v9 = *(void *)(v4 + 80);
      uint64_t v51 = *(void *)(v4 + 72);
      uint64_t v52 = *(void *)(v4 + 64);
      uint64_t v10 = *(void *)(v4 + 88);
      uint64_t v11 = *(void *)(v4 + 96);
      uint64_t v12 = *(void *)(v4 + 104);
      uint64_t v13 = *(void *)(v4 + 112);
      uint64_t v15 = *(void *)(v4 + 120);
      uint64_t v14 = *(void *)(v4 + 128);
      uint64_t v16 = *(void *)(v4 + 136);
      char v17 = *(unsigned char *)(v4 + 144);
      char v18 = *(unsigned char *)(v4 + 32);
      uint64_t v19 = *(void *)(v4 + 24);
      uint64_t v6 = *(void *)v4;
    }
    long long v50 = *(_OWORD *)(v4 + 8);
    sub_18C2A716C((void *)v4);
    sub_18C2B9414((uint64_t)v71, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v23 = v50;
    uint64_t v22 = v51;
    uint64_t v21 = v52;
    long long v20 = v53;
  }
  else
  {
    uint64_t v8 = *(void *)(v4 + 40);
    long long v20 = *(_OWORD *)(v4 + 48);
    uint64_t v21 = *(void *)(v4 + 64);
    uint64_t v22 = *(void *)(v4 + 72);
    uint64_t v9 = *(void *)(v4 + 80);
    uint64_t v10 = *(void *)(v4 + 88);
    uint64_t v11 = *(void *)(v4 + 96);
    uint64_t v12 = *(void *)(v4 + 104);
    uint64_t v13 = *(void *)(v4 + 112);
    uint64_t v15 = *(void *)(v4 + 120);
    uint64_t v14 = *(void *)(v4 + 128);
    uint64_t v16 = *(void *)(v4 + 136);
    char v17 = *(unsigned char *)(v4 + 144);
    char v18 = *(unsigned char *)(v4 + 32);
    uint64_t v19 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)v4;
    long long v23 = *(_OWORD *)(v4 + 8);
  }
  uint64_t v54 = v6;
  long long v55 = v23;
  uint64_t v56 = v19;
  char v57 = v18;
  uint64_t v58 = v8;
  long long v59 = v20;
  uint64_t v60 = v21;
  uint64_t v61 = v22;
  uint64_t v62 = v9;
  uint64_t v63 = v10;
  uint64_t v64 = v11;
  uint64_t v65 = v12;
  uint64_t v66 = v13;
  uint64_t v67 = v15;
  uint64_t v68 = v14;
  uint64_t v69 = v16;
  char v70 = v17;
  swift_bridgeObjectRetain();
  sub_18C2A73A0((uint64_t)&v54);
  long long v24 = (void *)sub_18C2CA9D0();
  int v25 = CEMStringContainsEmoji();
  swift_bridgeObjectRelease();

  uint64_t v26 = OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController;
  uint64_t v27 = *(void **)(v1 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  if (!v25)
  {
    if (!v27) {
      return;
    }
    id v48 = objc_msgSend(v27, sel_view);
    if (v48)
    {
      uint64_t v49 = v48;
      objc_msgSend(v48, sel_removeFromSuperview);

      uint64_t v37 = *(void **)(v1 + v26);
      *(void *)(v1 + v26) = 0;
      goto LABEL_17;
    }
LABEL_23:
    __break(1u);
    return;
  }
  if (v27) {
    return;
  }
  _s11CoordinatorCMa();
  sub_18C2B8F2C(&qword_1E916CCF8, (void (*)(uint64_t))_s11CoordinatorCMa);
  swift_retain();
  sub_18C2CA5F0();
  id v28 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E916CDD0));
  char v29 = (void *)sub_18C2CA6F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CE68);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_18C2DDCB0;
  sub_18C2CA7D0();
  sub_18C2CA7E0();
  sub_18C2B8F2C((unint64_t *)&unk_1E916CC00, MEMORY[0x1E4F3DF98]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CDE8);
  sub_18C2B8F74();
  sub_18C2CABB0();
  sub_18C2CA6D0();
  id v30 = objc_msgSend(v29, sel_view);
  if (!v30)
  {
    __break(1u);
    goto LABEL_20;
  }
  id v31 = v30;
  id v32 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v31, sel_setBackgroundColor_, v32);

  uint64_t v33 = *(void **)(v1 + v26);
  *(void *)(v1 + v26) = v29;
  id v34 = v29;

  uint64_t v35 = *(void **)(v1 + v26);
  if (!v35)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v36 = objc_msgSend(v35, sel_view);
  if (!v36)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v37 = v36;
  id v38 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                              + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (!v38)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v39 = v38;
  objc_msgSend(v38, sel_frame);
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

  objc_msgSend(v37, sel_setFrame_, v41, v43, v45, v47);
LABEL_17:
}

void (*IncomingCallTextViewAdapter.displayNameText.modify(void *a1))(uint64_t a1, char a2)
{
  int v3 = (char *)malloc(0x3A8uLL);
  *a1 = v3;
  *((void *)v3 + 116) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)(v3 + 608), (uint64_t)(v3 + 304));
  sub_18C2A68DC((uint64_t)(v3 + 304), (uint64_t)v3);
  int v4 = sub_18C2A6938((uint64_t)v3);
  uint64_t v5 = sub_18C2A6944((uint64_t)v3);
  if (v4 == 1)
  {
    uint64_t v6 = (char *)(v5 + 296);
    if (*(unsigned char *)(v5 + 298))
    {
      uint64_t v8 = *(void *)(v5 + 152);
      v5 += 152;
      uint64_t v7 = v8;
      uint64_t v9 = *(void *)(v5 + 40);
      long long v27 = *(_OWORD *)(v5 + 48);
      uint64_t v10 = *(void *)(v5 + 80);
      uint64_t v25 = *(void *)(v5 + 72);
      uint64_t v26 = *(void *)(v5 + 64);
      uint64_t v11 = *(void *)(v5 + 88);
      uint64_t v12 = *(void *)(v5 + 96);
      uint64_t v13 = *(void *)(v5 + 104);
      uint64_t v14 = *(void *)(v5 + 112);
      uint64_t v16 = *(void *)(v5 + 120);
      uint64_t v15 = *(void *)(v5 + 128);
      uint64_t v17 = *(void *)(v5 + 136);
      char v18 = *v6;
      char v19 = *(unsigned char *)(v5 + 32);
      uint64_t v20 = *(void *)(v5 + 24);
    }
    else
    {
      uint64_t v9 = *(void *)(v5 + 40);
      long long v27 = *(_OWORD *)(v5 + 48);
      uint64_t v10 = *(void *)(v5 + 80);
      uint64_t v25 = *(void *)(v5 + 72);
      uint64_t v26 = *(void *)(v5 + 64);
      uint64_t v11 = *(void *)(v5 + 88);
      uint64_t v12 = *(void *)(v5 + 96);
      uint64_t v13 = *(void *)(v5 + 104);
      uint64_t v14 = *(void *)(v5 + 112);
      uint64_t v16 = *(void *)(v5 + 120);
      uint64_t v15 = *(void *)(v5 + 128);
      uint64_t v17 = *(void *)(v5 + 136);
      char v18 = *(unsigned char *)(v5 + 144);
      char v19 = *(unsigned char *)(v5 + 32);
      uint64_t v20 = *(void *)(v5 + 24);
      uint64_t v7 = *(void *)v5;
    }
    long long v28 = *(_OWORD *)(v5 + 8);
    sub_18C2A716C((void *)v5);
    sub_18C2B9414((uint64_t)(v3 + 304), (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    uint64_t v23 = v25;
    uint64_t v22 = v26;
    long long v21 = v27;
  }
  else
  {
    uint64_t v9 = *(void *)(v5 + 40);
    long long v21 = *(_OWORD *)(v5 + 48);
    uint64_t v22 = *(void *)(v5 + 64);
    uint64_t v23 = *(void *)(v5 + 72);
    uint64_t v10 = *(void *)(v5 + 80);
    uint64_t v11 = *(void *)(v5 + 88);
    uint64_t v12 = *(void *)(v5 + 96);
    uint64_t v13 = *(void *)(v5 + 104);
    uint64_t v14 = *(void *)(v5 + 112);
    uint64_t v16 = *(void *)(v5 + 120);
    uint64_t v15 = *(void *)(v5 + 128);
    uint64_t v17 = *(void *)(v5 + 136);
    char v18 = *(unsigned char *)(v5 + 144);
    char v19 = *(unsigned char *)(v5 + 32);
    uint64_t v20 = *(void *)(v5 + 24);
    uint64_t v7 = *(void *)v5;
    long long v28 = *(_OWORD *)(v5 + 8);
  }
  *((void *)v3 + 76) = v7;
  *(_OWORD *)(v3 + 616) = v28;
  *((void *)v3 + 79) = v20;
  v3[640] = v19;
  *((void *)v3 + 81) = v9;
  *((_OWORD *)v3 + 41) = v21;
  *((void *)v3 + 84) = v22;
  *((void *)v3 + 85) = v23;
  *((void *)v3 + 86) = v10;
  *((void *)v3 + 87) = v11;
  *((void *)v3 + 88) = v12;
  *((void *)v3 + 89) = v13;
  *((void *)v3 + 90) = v14;
  *((void *)v3 + 91) = v16;
  *((void *)v3 + 92) = v15;
  *((void *)v3 + 93) = v17;
  v3[752] = v18;
  swift_bridgeObjectRetain();
  sub_18C2A73A0((uint64_t)(v3 + 608));
  *((void *)v3 + 114) = v7;
  *((void *)v3 + 115) = v28;
  return sub_18C2B5610;
}

void sub_18C2B5610(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 912);
  uint64_t v4 = *(void *)(*(void *)a1 + 920);
  if (a2)
  {
    swift_bridgeObjectRetain();
    IncomingCallTextViewAdapter.displayNameText.setter(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    IncomingCallTextViewAdapter.displayNameText.setter(*(void *)(*(void *)a1 + 912), v4);
  }
  free(v2);
}

uint64_t IncomingCallTextViewAdapter.statusText.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v5, (uint64_t)v4);
  sub_18C29E1A4((uint64_t)v4, (uint64_t)&v3);
  sub_18C29E1A4((uint64_t)v4, (uint64_t)v5);
  if (sub_18C2A7154((uint64_t)v5) == 1) {
    return 0;
  }
  uint64_t v0 = v3;
  sub_18C29E1A4((uint64_t)&v3, (uint64_t)v2);
  swift_bridgeObjectRetain();
  sub_18C2B9574((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  return v0;
}

uint64_t IncomingCallTextViewAdapter.statusText.setter(uint64_t a1, uint64_t a2)
{
  swift_retain();
  sub_18C2BACB0(a1, a2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18C2B5908(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_18C2BACB0(v1, v2);
  swift_bridgeObjectRelease();
  return swift_release();
}

void (*IncomingCallTextViewAdapter.statusText.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x280uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t)(v3 + 57);
  v3[78] = v1;
  v3[79] = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)(v3 + 57), (uint64_t)(v3 + 19));
  sub_18C29E1A4((uint64_t)(v3 + 19), (uint64_t)(v3 + 38));
  sub_18C29E1A4((uint64_t)(v3 + 19), (uint64_t)v3);
  if (sub_18C2A7154((uint64_t)v3) == 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = v3[38];
    uint64_t v6 = v3[39];
    sub_18C29E1A4((uint64_t)(v3 + 38), v4);
    swift_bridgeObjectRetain();
    sub_18C2B9574(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  v3[76] = v5;
  v3[77] = v6;
  return sub_18C2B5AD4;
}

void sub_18C2B5AD4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 608);
  uint64_t v4 = *(void *)(*(void *)a1 + 616);
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_18C2BACB0(v3, v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    sub_18C2BACB0(v3, v4);
    swift_release();
  }
  swift_bridgeObjectRelease();
  free(v2);
}

uint64_t IncomingCallTextViewAdapter.alignment.getter()
{
  swift_retain();
  char v0 = sub_18C2BA400();
  swift_release();
  return v0 & 1;
}

uint64_t IncomingCallTextViewAdapter.layout.getter()
{
  uint64_t v0 = sub_18C2CA840();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_18C2BA804((uint64_t)v2);
  swift_release();
  return sub_18C2B89E8(v2);
}

uint64_t IncomingCallTextViewAdapter.displayNameIsSuitableForVerticalLayout.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v46, (uint64_t)v45);
  sub_18C2A68DC((uint64_t)v45, (uint64_t)v46);
  int v0 = sub_18C2A6938((uint64_t)v46);
  uint64_t v1 = sub_18C2A6944((uint64_t)v46);
  if (v0 == 1)
  {
    uint64_t v2 = (char *)(v1 + 296);
    if (*(unsigned char *)(v1 + 298))
    {
      uint64_t v4 = *(void *)(v1 + 152);
      v1 += 152;
      uint64_t v3 = v4;
      uint64_t v5 = *(void *)(v1 + 40);
      long long v27 = *(_OWORD *)(v1 + 48);
      uint64_t v6 = *(void *)(v1 + 80);
      uint64_t v25 = *(void *)(v1 + 72);
      uint64_t v26 = *(void *)(v1 + 64);
      uint64_t v7 = *(void *)(v1 + 88);
      uint64_t v8 = *(void *)(v1 + 96);
      uint64_t v9 = *(void *)(v1 + 104);
      uint64_t v10 = *(void *)(v1 + 112);
      uint64_t v12 = *(void *)(v1 + 120);
      uint64_t v11 = *(void *)(v1 + 128);
      uint64_t v13 = *(void *)(v1 + 136);
      char v14 = *v2;
      char v15 = *(unsigned char *)(v1 + 32);
      uint64_t v16 = *(void *)(v1 + 24);
    }
    else
    {
      uint64_t v5 = *(void *)(v1 + 40);
      long long v27 = *(_OWORD *)(v1 + 48);
      uint64_t v6 = *(void *)(v1 + 80);
      uint64_t v25 = *(void *)(v1 + 72);
      uint64_t v26 = *(void *)(v1 + 64);
      uint64_t v7 = *(void *)(v1 + 88);
      uint64_t v8 = *(void *)(v1 + 96);
      uint64_t v9 = *(void *)(v1 + 104);
      uint64_t v10 = *(void *)(v1 + 112);
      uint64_t v12 = *(void *)(v1 + 120);
      uint64_t v11 = *(void *)(v1 + 128);
      uint64_t v13 = *(void *)(v1 + 136);
      char v14 = *(unsigned char *)(v1 + 144);
      char v15 = *(unsigned char *)(v1 + 32);
      uint64_t v16 = *(void *)(v1 + 24);
      uint64_t v3 = *(void *)v1;
    }
    long long v24 = *(_OWORD *)(v1 + 8);
    sub_18C2A716C((void *)v1);
    sub_18C2B9414((uint64_t)v45, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v20 = v24;
    uint64_t v19 = v25;
    uint64_t v18 = v26;
    long long v17 = v27;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 40);
    long long v17 = *(_OWORD *)(v1 + 48);
    uint64_t v18 = *(void *)(v1 + 64);
    uint64_t v19 = *(void *)(v1 + 72);
    uint64_t v6 = *(void *)(v1 + 80);
    uint64_t v7 = *(void *)(v1 + 88);
    uint64_t v8 = *(void *)(v1 + 96);
    uint64_t v9 = *(void *)(v1 + 104);
    uint64_t v10 = *(void *)(v1 + 112);
    uint64_t v12 = *(void *)(v1 + 120);
    uint64_t v11 = *(void *)(v1 + 128);
    uint64_t v13 = *(void *)(v1 + 136);
    char v14 = *(unsigned char *)(v1 + 144);
    char v15 = *(unsigned char *)(v1 + 32);
    uint64_t v16 = *(void *)(v1 + 24);
    uint64_t v3 = *(void *)v1;
    long long v20 = *(_OWORD *)(v1 + 8);
  }
  uint64_t v28 = v3;
  long long v29 = v20;
  uint64_t v30 = v16;
  char v31 = v15;
  uint64_t v32 = v5;
  long long v33 = v17;
  uint64_t v34 = v18;
  uint64_t v35 = v19;
  uint64_t v36 = v6;
  uint64_t v37 = v7;
  uint64_t v38 = v8;
  uint64_t v39 = v9;
  uint64_t v40 = v10;
  uint64_t v41 = v12;
  uint64_t v42 = v11;
  uint64_t v43 = v13;
  char v44 = v14;
  swift_bridgeObjectRetain();
  sub_18C2A73A0((uint64_t)&v28);
  long long v21 = (void *)sub_18C2CA9D0();
  uint64_t IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();
  swift_bridgeObjectRelease();

  return IsSuitableForVerticalLayout;
}

uint64_t IncomingCallTextViewAdapter.statusIsSuitableForVerticalLayout.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v6, (uint64_t)v5);
  sub_18C29E1A4((uint64_t)v5, (uint64_t)&v4);
  sub_18C29E1A4((uint64_t)v5, (uint64_t)v6);
  if (sub_18C2A7154((uint64_t)v6) == 1) {
    return 1;
  }
  sub_18C29E1A4((uint64_t)&v4, (uint64_t)v3);
  swift_bridgeObjectRetain();
  sub_18C2B9574((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  uint64_t v1 = (void *)sub_18C2CA9D0();
  uint64_t IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();
  swift_bridgeObjectRelease();

  return IsSuitableForVerticalLayout;
}

uint64_t IncomingCallTextViewAdapter.marqueeRunning.getter()
{
  return sub_18C2B66E4();
}

uint64_t IncomingCallTextViewAdapter.marqueeRunning.setter()
{
  return sub_18C2CA540();
}

uint64_t sub_18C2B62CC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18C2B6364()
{
  return sub_18C2CA540();
}

uint64_t (*IncomingCallTextViewAdapter.marqueeRunning.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = v3;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_18C2B649C;
}

uint64_t sub_18C2B649C(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(a1 + 17) = v2;
  swift_retain();
  return sub_18C2CA540();
}

BOOL IncomingCallTextViewAdapter.multilineNameIsDisplayed.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v3, (uint64_t)v2);
  sub_18C2A68DC((uint64_t)v2, (uint64_t)v3);
  BOOL v0 = sub_18C2A6938((uint64_t)v3) == 1;
  sub_18C2A6944((uint64_t)v3);
  sub_18C2B9414((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  return v0;
}

uint64_t IncomingCallTextViewAdapter.callIsActive.getter()
{
  return sub_18C2B66E4();
}

uint64_t sub_18C2B66E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

id IncomingCallTextViewAdapter.__allocating_init(name:)()
{
  id v1 = objc_allocWithZone(v0);
  char v2 = (void *)sub_18C2CA9D0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithName_status_callIsActive_, v2, 0, 0);

  return v3;
}

id IncomingCallTextViewAdapter.init(name:)()
{
  id v1 = (void *)sub_18C2CA9D0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithName_status_callIsActive_, v1, 0, 0);

  return v2;
}

id IncomingCallTextViewAdapter.__allocating_init(name:status:callIsActive:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  id v11 = objc_allocWithZone(v5);
  uint64_t v12 = sub_18C2BBFFC(a1, a2, a3, a4, a5 & 1);
  id v13 = objc_allocWithZone(v5);
  id v14 = sub_18C2B6E44(v12);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

id IncomingCallTextViewAdapter.init(name:status:callIsActive:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_18C2BBFFC(a1, a2, a3, a4, a5 & 1);
  id v12 = objc_allocWithZone(ObjectType);
  id v13 = sub_18C2B6E44(v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

id IncomingCallTextViewAdapter.__allocating_init(contact:status:callIsActive:)(void *a1, uint64_t a2, unint64_t a3, int a4)
{
  id v9 = objc_allocWithZone(v4);
  return IncomingCallTextViewAdapter.init(contact:status:callIsActive:)(a1, a2, a3, a4);
}

id IncomingCallTextViewAdapter.init(contact:status:callIsActive:)(void *a1, uint64_t a2, unint64_t a3, int a4)
{
  int v25 = a4;
  Class ObjectType = (Class)swift_getObjectType();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  id v12 = &v24[-v11];
  id v13 = self;
  id v14 = a1;
  id v15 = objc_msgSend(v13, sel_labelColor);
  uint64_t v16 = self;
  sub_18C29DF2C(a2, a3, v15, objc_msgSend(v16, sel_defaultStatusFont), (uint64_t)v27);
  uint64_t v17 = sub_18C2CA840();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  id v18 = v14;
  sub_18C2BF178(v18, objc_msgSend(v13, sel_labelColor), objc_msgSend(v16, sel_defaultNameFont), (uint64_t)v28);

  sub_18C2B8DDC((uint64_t)v12, (uint64_t)v10);
  _s11CoordinatorCMa();
  swift_allocObject();
  uint64_t v19 = sub_18C2BB864((uint64_t)v28, (uint64_t)v27, 2, (uint64_t)v10, v25 & 1);
  sub_18C2B9574((uint64_t)v27, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  sub_18C2B9414((uint64_t)v28, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  sub_18C2A7BF0((uint64_t)v12, &qword_1E916CA20);
  long long v20 = *(void **)(v19 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact);
  *(void *)(v19 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact) = v18;

  id v21 = objc_allocWithZone(ObjectType);
  id v22 = sub_18C2B6E44(v19);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v22;
}

id sub_18C2B6E44(uint64_t a1)
{
  Class ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_18C2CA7F0();
  MEMORY[0x1F4188790](v3);
  *(void *)&v1[OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController] = 0;
  *(void *)&v1[OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator] = a1;
  _s11CoordinatorCMa();
  sub_18C2B8F2C(&qword_1E916CCF8, (void (*)(uint64_t))_s11CoordinatorCMa);
  swift_retain_n();
  uint64_t v4 = v1;
  sub_18C2CA5F0();
  uint64_t v6 = v5;
  id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E916CDD0));
  uint64_t v18 = v6;
  char v19 = 0;
  uint64_t v8 = (void *)sub_18C2CA6F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CE68);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_18C2DDCB0;
  sub_18C2CA7D0();
  sub_18C2CA7E0();
  uint64_t v17 = v9;
  sub_18C2B8F2C((unint64_t *)&unk_1E916CC00, MEMORY[0x1E4F3DF98]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CDE8);
  sub_18C2B8F74();
  sub_18C2CABB0();
  sub_18C2CA6D0();
  id result = objc_msgSend(v8, sel_view);
  if (result)
  {
    uint64_t v11 = result;
    id v12 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v11, sel_setBackgroundColor_, v12);

    *(void *)&v4[OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController] = v8;
    id v13 = v8;

    v16.receiver = v4;
    v16.super_class = ObjectType;
    id v14 = objc_msgSendSuper2(&v16, sel_init);
    IncomingCallTextViewAdapter.setupOrTeardownEmojiTextViewIfNecessary()();

    swift_release();
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)(UIFont newFont)
{
  uint64_t v2 = sub_18C2CA840();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v62, (uint64_t)v61);
  sub_18C2A68DC((uint64_t)v61, (uint64_t)v62);
  int v5 = sub_18C2A6938((uint64_t)v62);
  uint64_t v6 = sub_18C2A6944((uint64_t)v62);
  if (v5 == 1)
  {
    id v7 = (char *)(v6 + 296);
    if (*(unsigned char *)(v6 + 297))
    {
      uint64_t v9 = *(void *)(v6 + 152);
      v6 += 152;
      uint64_t v8 = v9;
      uint64_t v10 = *(void *)(v6 + 40);
      long long v39 = *(_OWORD *)(v6 + 48);
      uint64_t v11 = *(void *)(v6 + 64);
      uint64_t v12 = *(void *)(v6 + 80);
      uint64_t v37 = *(void *)(v6 + 72);
      uint64_t v38 = v11;
      uint64_t v13 = *(void *)(v6 + 88);
      uint64_t v14 = *(void *)(v6 + 96);
      uint64_t v15 = *(void *)(v6 + 104);
      uint64_t v16 = *(void *)(v6 + 112);
      uint64_t v18 = *(void *)(v6 + 120);
      uint64_t v17 = *(void *)(v6 + 128);
      uint64_t v19 = *(void *)(v6 + 136);
      char v20 = *v7;
      char v21 = *(unsigned char *)(v6 + 32);
      uint64_t v22 = *(void *)(v6 + 24);
    }
    else
    {
      uint64_t v10 = *(void *)(v6 + 40);
      long long v39 = *(_OWORD *)(v6 + 48);
      uint64_t v27 = *(void *)(v6 + 64);
      uint64_t v12 = *(void *)(v6 + 80);
      uint64_t v37 = *(void *)(v6 + 72);
      uint64_t v38 = v27;
      uint64_t v13 = *(void *)(v6 + 88);
      uint64_t v14 = *(void *)(v6 + 96);
      uint64_t v15 = *(void *)(v6 + 104);
      uint64_t v16 = *(void *)(v6 + 112);
      uint64_t v18 = *(void *)(v6 + 120);
      uint64_t v17 = *(void *)(v6 + 128);
      uint64_t v19 = *(void *)(v6 + 136);
      char v20 = *(unsigned char *)(v6 + 144);
      char v21 = *(unsigned char *)(v6 + 32);
      uint64_t v22 = *(void *)(v6 + 24);
      uint64_t v8 = *(void *)v6;
    }
    long long v36 = *(_OWORD *)(v6 + 8);
    sub_18C2A716C((void *)v6);
    sub_18C2B9414((uint64_t)v61, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v26 = v36;
    uint64_t v25 = v37;
    uint64_t v24 = v38;
    long long v23 = v39;
  }
  else
  {
    uint64_t v10 = *(void *)(v6 + 40);
    long long v23 = *(_OWORD *)(v6 + 48);
    uint64_t v24 = *(void *)(v6 + 64);
    uint64_t v25 = *(void *)(v6 + 72);
    uint64_t v12 = *(void *)(v6 + 80);
    uint64_t v13 = *(void *)(v6 + 88);
    uint64_t v14 = *(void *)(v6 + 96);
    uint64_t v15 = *(void *)(v6 + 104);
    uint64_t v16 = *(void *)(v6 + 112);
    uint64_t v18 = *(void *)(v6 + 120);
    uint64_t v17 = *(void *)(v6 + 128);
    uint64_t v19 = *(void *)(v6 + 136);
    char v20 = *(unsigned char *)(v6 + 144);
    char v21 = *(unsigned char *)(v6 + 32);
    uint64_t v22 = *(void *)(v6 + 24);
    uint64_t v8 = *(void *)v6;
    long long v26 = *(_OWORD *)(v6 + 8);
  }
  uint64_t v42 = v8;
  long long v43 = v26;
  uint64_t v44 = v22;
  char v45 = v21;
  uint64_t v46 = v10;
  long long v47 = v23;
  uint64_t v48 = v24;
  uint64_t v49 = v25;
  uint64_t v50 = v12;
  uint64_t v51 = v13;
  uint64_t v52 = v14;
  uint64_t v53 = v15;
  uint64_t v54 = v16;
  uint64_t v55 = v18;
  uint64_t v56 = v17;
  uint64_t v57 = v19;
  char v58 = v20;
  swift_bridgeObjectRetain();
  sub_18C2A73A0((uint64_t)&v42);
  uint64_t v28 = (void *)sub_18C2CA9D0();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v60, (uint64_t)v59);
  sub_18C29E1A4((uint64_t)v59, (uint64_t)v41);
  sub_18C29E1A4((uint64_t)v59, (uint64_t)v60);
  if (sub_18C2A7154((uint64_t)v60) == 1)
  {
    long long v29 = 0;
  }
  else
  {
    sub_18C29E1A4((uint64_t)v41, (uint64_t)v40);
    swift_bridgeObjectRetain();
    sub_18C2B9574((uint64_t)v40, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    long long v29 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
  }
  uint64_t v30 = self;
  swift_retain();
  sub_18C2BA804((uint64_t)v4);
  swift_release();
  objc_msgSend(v30, sel_idealEmphasizedFontSizeForName_status_usingLayout_, v28, v29, sub_18C2B89E8(v4));
  CGFloat v32 = v31;

  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes(newFont.super.isa, v32, 0, 0);
  IncomingCallTextViewAdapter.emphasizedNameFont.setter(CopyWithAttributes);
  objc_msgSend(v30, sel_defaultSecondaryNameFontSize);
  CTFontRef v35 = CTFontCreateCopyWithAttributes(newFont.super.isa, v34, 0, 0);
  IncomingCallTextViewAdapter.secondaryNameFont.setter(v35);
  IncomingCallTextViewAdapter.statusFont.setter(objc_msgSend(v30, sel_defaultStatusFont));
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.transitionCallToActiveState(animated:)(Swift::Bool animated)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  if ((v1 & 1) == 0) {
    sub_18C2BB000(1);
  }
  swift_release();
}

uint64_t IncomingCallTextViewAdapter.overrideTitleLayout(with:)(uint64_t a1)
{
  return sub_18C2B774C(a1, (uint64_t)&unk_18C2DDE70, (uint64_t)&unk_18C2DDE98);
}

uint64_t sub_18C2B774C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v52 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CC18);
  uint64_t v7 = v6 - 8;
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v38[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v46 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v48 = &v38[-v14];
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v42 = &v38[-v16];
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = &v38[-v18];
  MEMORY[0x1F4188790](v17);
  char v21 = &v38[-v20];
  uint64_t v22 = sub_18C2CA840();
  long long v23 = *(void **)(v22 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v41 = &v38[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v24);
  uint64_t v27 = &v38[-v26];
  sub_18C2B1D74(a1);
  uint64_t v47 = v3;
  uint64_t v45 = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  uint64_t v49 = a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v28 = (void (*)(unsigned char *, unsigned char *, uint64_t))v23[2];
  uint64_t v50 = v27;
  long long v43 = v28;
  v28(v19, v27, v22);
  uint64_t v44 = (void (*)(unsigned char *, void, uint64_t, uint64_t))v23[7];
  v44(v19, 0, 1, v22);
  uint64_t v29 = (uint64_t)&v9[*(int *)(v7 + 56)];
  sub_18C2B8DDC((uint64_t)v21, (uint64_t)v9);
  sub_18C2B8DDC((uint64_t)v19, v29);
  uint64_t v51 = v23;
  uint64_t v30 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v23[6];
  if (v30((uint64_t)v9, 1, v22) == 1)
  {
    sub_18C2A7BF0((uint64_t)v19, &qword_1E916CA20);
    sub_18C2A7BF0((uint64_t)v21, &qword_1E916CA20);
    if (v30(v29, 1, v22) == 1)
    {
      sub_18C2A7BF0((uint64_t)v9, &qword_1E916CA20);
      return ((uint64_t (*)(unsigned char *, uint64_t))v51[1])(v50, v22);
    }
    goto LABEL_6;
  }
  CGFloat v32 = v42;
  sub_18C2B8DDC((uint64_t)v9, (uint64_t)v42);
  if (v30(v29, 1, v22) == 1)
  {
    sub_18C2A7BF0((uint64_t)v19, &qword_1E916CA20);
    sub_18C2A7BF0((uint64_t)v21, &qword_1E916CA20);
    ((void (*)(unsigned char *, uint64_t))v51[1])(v32, v22);
LABEL_6:
    sub_18C2A7BF0((uint64_t)v9, &qword_1E916CC18);
LABEL_10:
    uint64_t v36 = (uint64_t)v48;
    uint64_t v37 = v50;
    v43(v48, v50, v22);
    v44((unsigned char *)v36, 0, 1, v22);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C2B8DDC(v36, (uint64_t)v46);
    swift_retain_n();
    sub_18C2CA540();
    sub_18C2A7BF0(v36, &qword_1E916CA20);
    swift_release();
    return ((uint64_t (*)(unsigned char *, uint64_t))v51[1])(v37, v22);
  }
  long long v33 = v51;
  CGFloat v34 = v41;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v51[4])(v41, v29, v22);
  sub_18C2B8F2C(&qword_1E916CC10, MEMORY[0x1E4F3E228]);
  uint64_t v40 = v9;
  int v39 = sub_18C2CA9C0();
  CTFontRef v35 = (void (*)(unsigned char *, uint64_t))v33[1];
  v35(v34, v22);
  sub_18C2A7BF0((uint64_t)v19, &qword_1E916CA20);
  sub_18C2A7BF0((uint64_t)v21, &qword_1E916CA20);
  v35(v32, v22);
  sub_18C2A7BF0((uint64_t)v40, &qword_1E916CA20);
  if ((v39 & 1) == 0) {
    goto LABEL_10;
  }
  return ((uint64_t (*)(unsigned char *, uint64_t))v35)(v50, v22);
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.removeTitleLayoutOverride()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v1 = MEMORY[0x1F4188790](v0 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x1F4188790](v1);
  uint64_t v6 = (char *)&v12 - v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v12 - v7;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = sub_18C2CA840();
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  sub_18C2A7BF0((uint64_t)v8, &qword_1E916CA20);
  if (v11 != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C2B8DDC((uint64_t)v6, (uint64_t)v3);
    swift_retain_n();
    sub_18C2CA540();
    sub_18C2A7BF0((uint64_t)v6, &qword_1E916CA20);
    swift_release();
  }
}

CGSize __swiftcall IncomingCallTextViewAdapter.sizeThatFits(in:)(CGSize in)
{
  id v2 = *(id *)(v1 + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
  sub_18C2CA6C0();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

id IncomingCallTextViewAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.posterAppearanceDidChange(_:)(PRPosterAppearance *a1)
{
  objc_super v2 = [(PRPosterAppearance *)a1 font];
  IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)((UIFont)v2);

  double v3 = [(PRPosterAppearance *)a1 labelColor];
  double v4 = [(PRPosterColor *)v3 color];

  if (v4) {
    IncomingCallTextViewAdapter.textColor.setter(v4);
  }
  IncomingCallTextViewAdapter.preferredAlignment.setter([(PRPosterAppearance *)a1 preferredTitleAlignment]);
  uint64_t v5 = [(PRPosterAppearance *)a1 preferredTitleLayout];
  IncomingCallTextViewAdapter.preferredLayout.setter(v5);
}

void _s9PosterKit27IncomingCallTextViewAdapterC5frameSo6CGRectVvg_0()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (v1)
  {
    objc_super v2 = v1;
    objc_msgSend(v1, sel_frame);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_18C2B8358@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)&v3, (uint64_t)v4);
  return sub_18C2A68DC((uint64_t)v4, a1);
}

uint64_t sub_18C2B83F0(uint64_t a1)
{
  sub_18C2A68DC(a1, (uint64_t)v3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2A68DC((uint64_t)v3, (uint64_t)&v2);
  sub_18C2B9414((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
  swift_retain();
  return sub_18C2CA540();
}

uint64_t sub_18C2B8490@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)&v3, (uint64_t)v4);
  return sub_18C29E1A4((uint64_t)v4, a1);
}

uint64_t sub_18C2B852C(uint64_t a1)
{
  sub_18C29E1A4(a1, (uint64_t)v3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C29E1A4((uint64_t)v3, (uint64_t)&v2);
  sub_18C2B9574((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
  swift_retain();
  return sub_18C2CA540();
}

uint64_t sub_18C2B85D8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18C2B8658()
{
  return sub_18C2CA540();
}

uint64_t sub_18C2B86CC()
{
  return sub_18C2B8730();
}

uint64_t sub_18C2B86E0(uint64_t a1)
{
  return sub_18C2B87BC(a1);
}

uint64_t sub_18C2B86F4@<X0>(unsigned char *a1@<X8>)
{
  return sub_18C2B88E0(a1);
}

uint64_t sub_18C2B8708()
{
  return sub_18C2B8970();
}

uint64_t sub_18C2B871C()
{
  return sub_18C2B8730();
}

uint64_t sub_18C2B8730()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  return swift_release();
}

uint64_t sub_18C2B87A8(uint64_t a1)
{
  return sub_18C2B87BC(a1);
}

uint64_t sub_18C2B87BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  double v7 = (char *)&v9 - v6;
  sub_18C2B8DDC(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2B8DDC((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_18C2CA540();
  return sub_18C2A7BF0((uint64_t)v7, &qword_1E916CA20);
}

uint64_t sub_18C2B88CC@<X0>(unsigned char *a1@<X8>)
{
  return sub_18C2B88E0(a1);
}

uint64_t sub_18C2B88E0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18C2B895C()
{
  return sub_18C2B8970();
}

uint64_t sub_18C2B8970()
{
  return sub_18C2CA540();
}

uint64_t sub_18C2B89E8(char *a1)
{
  uint64_t v2 = sub_18C2CA840();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  double v8 = (char *)&v17 - v7;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v17 - v7, a1, v2);
  sub_18C2CA820();
  sub_18C2B8F2C(&qword_1E916CC10, MEMORY[0x1E4F3E228]);
  char v9 = sub_18C2CA9C0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  if (v9)
  {
    v10(a1, v2);
    v10(v8, v2);
    return 0;
  }
  else
  {
    sub_18C2CA810();
    char v12 = sub_18C2CA9C0();
    v10(v6, v2);
    v10(v8, v2);
    if ((v12 & 1) == 0)
    {
      if (qword_1E916CA40 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_18C2CA4E0();
      __swift_project_value_buffer(v13, (uint64_t)qword_1E9171CA0);
      uint64_t v14 = sub_18C2CA4D0();
      os_log_type_t v15 = sub_18C2CAAB0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_18C1C4000, v14, v15, "Unrecognized Text.WritingMode; fallback to horizontal.", v16, 2u);
        MEMORY[0x192F91CB0](v16, -1, -1);
      }
    }
    v10(a1, v2);
    return 1;
  }
}

unint64_t sub_18C2B8CA0(unint64_t result)
{
  if (result >= 2)
  {
    if (qword_1E916CA40 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_18C2CA4E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_1E9171CA0);
    uint64_t v2 = sub_18C2CA4D0();
    os_log_type_t v3 = sub_18C2CAAB0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_18C1C4000, v2, v3, "Unrecognized PRPosterTitleAlignment; fallback to center.", v4, 2u);
      MEMORY[0x192F91CB0](v4, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t sub_18C2B8D8C()
{
  return sub_18C2B8730();
}

uint64_t sub_18C2B8DB4(uint64_t a1)
{
  return sub_18C2B87BC(a1);
}

uint64_t sub_18C2B8DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18C2B8E44(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 144) & 1;
  uint64_t v2 = *(void *)(result + 184) & 1;
  int v3 = (*(unsigned __int16 *)(result + 296) | (*(unsigned __int8 *)(result + 298) << 16)) & 0x1010101;
  *(void *)(result + 32) &= 1uLL;
  *(void *)(result + 144) = v1;
  *(void *)(result + 184) = v2;
  *(_WORD *)(result + 296) = v3;
  *(unsigned char *)(result + 298) = (v3 | 0x800000u) >> 16;
  return result;
}

uint64_t sub_18C2B8E8C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 144) & 1;
  uint64_t v2 = *(void *)(result + 184) & 1;
  int v3 = (*(unsigned __int16 *)(result + 296) | (*(unsigned __int8 *)(result + 298) << 16)) & 0x1010101;
  *(void *)(result + 32) &= 1uLL;
  *(void *)(result + 144) = v1;
  *(void *)(result + 184) = v2;
  *(_WORD *)(result + 296) = v3;
  *(unsigned char *)(result + 298) = BYTE2(v3);
  return result;
}

uint64_t sub_18C2B8ED0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_18C2B8F2C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18C2B8F74()
{
  unint64_t result = qword_1E916CDF0;
  if (!qword_1E916CDF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E916CDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CDF0);
  }
  return result;
}

uint64_t sub_18C2B8FD0@<X0>(unsigned char *a1@<X8>)
{
  return sub_18C2B88E0(a1);
}

uint64_t sub_18C2B8FF8()
{
  return sub_18C2B8970();
}

uint64_t sub_18C2B9020@<X0>(unsigned char *a1@<X8>)
{
  return sub_18C2B88E0(a1);
}

uint64_t sub_18C2B9048()
{
  return sub_18C2B8970();
}

uint64_t sub_18C2B9070()
{
  return sub_18C2B8730();
}

uint64_t sub_18C2B9098(uint64_t a1)
{
  return sub_18C2B87BC(a1);
}

uint64_t sub_18C2B90C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = IncomingCallTextViewAdapter.statusIsHidden.getter();
  *a1 = result & 1;
  return result;
}

void sub_18C2B90F8(double *a1)
{
}

uint64_t sub_18C2B9124@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IncomingCallTextViewAdapter.preferredAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_18C2B9150(unint64_t *a1)
{
  return IncomingCallTextViewAdapter.preferredAlignment.setter(*a1);
}

uint64_t sub_18C2B9178@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IncomingCallTextViewAdapter.preferredLayout.getter();
  *a1 = result;
  return result;
}

uint64_t sub_18C2B91A4(uint64_t *a1)
{
  return IncomingCallTextViewAdapter.preferredLayout.setter(*a1);
}

id sub_18C2B91CC@<X0>(void *a1@<X8>)
{
  id result = IncomingCallTextViewAdapter.textColor.getter();
  *a1 = result;
  return result;
}

void sub_18C2B91F8(id *a1)
{
}

id sub_18C2B9224@<X0>(void *a1@<X8>)
{
  id result = IncomingCallTextViewAdapter.emphasizedNameFont.getter();
  *a1 = result;
  return result;
}

void sub_18C2B9250(id *a1)
{
}

id sub_18C2B927C@<X0>(void *a1@<X8>)
{
  id result = IncomingCallTextViewAdapter.secondaryNameFont.getter();
  *a1 = result;
  return result;
}

void sub_18C2B92A8(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  IncomingCallTextViewAdapter.secondaryNameFont.setter(v1);
}

id sub_18C2B92D8@<X0>(void *a1@<X8>)
{
  id result = IncomingCallTextViewAdapter.statusFont.getter();
  *a1 = result;
  return result;
}

void sub_18C2B9304(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  IncomingCallTextViewAdapter.statusFont.setter(v1);
}

uint64_t sub_18C2B9334@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IncomingCallTextViewAdapter.displayNameText.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_18C2B9360(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  IncomingCallTextViewAdapter.displayNameText.setter(v1, v2);
}

uint64_t sub_18C2B93A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IncomingCallTextViewAdapter.statusText.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for IncomingCallTextViewAdapter()
{
  return self;
}

uint64_t method lookup function for IncomingCallTextViewAdapter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IncomingCallTextViewAdapter);
}

uint64_t sub_18C2B9414(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))
{
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  long long v5 = *(_OWORD *)(a1 + 240);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    *(void *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
  return a1;
}

id sub_18C2B94B0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  if ((a38 & 0x800000) != 0)
  {
    swift_bridgeObjectRetain();
    id v40 = a3;
    id v41 = a4;
    swift_bridgeObjectRetain();
    id v42 = a8;
    a3 = a22;
    a4 = a23;
    a8 = a27;
  }
  swift_bridgeObjectRetain();
  id v43 = a3;
  id v44 = a4;
  swift_bridgeObjectRetain();
  return a8;
}

uint64_t sub_18C2B9574(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 144);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v4);
  return a1;
}

void sub_18C2B95E0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v10 = a3;
    id v11 = a4;
    swift_bridgeObjectRetain();
    id v12 = a8;
  }
}

uint64_t sub_18C2B9650@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v3, (uint64_t)v4);
  return sub_18C29E1A4((uint64_t)v4, a1);
}

void (*sub_18C2B96DC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  _OWORD v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_18C2CA520();
  return sub_18C2B9768;
}

void sub_18C2B9768(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_18C2B97D0()
{
  return 1;
}

uint64_t sub_18C2B97D8()
{
  return sub_18C2CAD20();
}

uint64_t sub_18C2B981C()
{
  return sub_18C2CAD00();
}

uint64_t sub_18C2B9844()
{
  return sub_18C2CAD20();
}

const char *sub_18C2B9884()
{
  return "SpringBoard";
}

const char *sub_18C2B9898()
{
  return "PosterEditorKashida";
}

uint64_t sub_18C2B98AC@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)v3, (uint64_t)v4);
  return sub_18C2A68DC((uint64_t)v4, a1);
}

uint64_t sub_18C2B9938(uint64_t a1)
{
  sub_18C2A68DC(a1, (uint64_t)v139);
  sub_18C2A68DC((uint64_t)v139, (uint64_t)v142);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact);
  if (!v3) {
    goto LABEL_15;
  }
  sub_18C2A68DC(a1, (uint64_t)v141);
  if (sub_18C2A6938((uint64_t)v141) == 1)
  {
    char v4 = (const void *)sub_18C2A6944((uint64_t)v141);
    memcpy(__dst, v4, 0x12BuLL);
    if (BYTE10(__dst[18]))
    {
      long long v5 = (void *)&__dst[9] + 1;
      uint64_t v6 = *(void *)&__dst[12];
      long long v75 = *(_OWORD *)((char *)&__dst[12] + 8);
      uint64_t v78 = *(void *)&__dst[14];
      uint64_t v81 = *((void *)&__dst[13] + 1);
      uint64_t v7 = *((void *)&__dst[14] + 1);
      uint64_t v9 = *((void *)&__dst[15] + 1);
      uint64_t v8 = *(void *)&__dst[15];
      uint64_t v10 = *((void *)&__dst[16] + 1);
      uint64_t v11 = *(void *)&__dst[16];
      uint64_t v13 = *((void *)&__dst[17] + 1);
      uint64_t v12 = *(void *)&__dst[17];
      uint64_t v14 = *(void *)&__dst[18];
      char v15 = BYTE8(__dst[18]);
      char v16 = BYTE8(__dst[11]);
      uint64_t v17 = *(void **)&__dst[11];
      uint64_t v18 = *((void *)&__dst[9] + 1);
      long long v84 = __dst[10];
    }
    else
    {
      uint64_t v6 = *((void *)&__dst[2] + 1);
      long long v75 = __dst[3];
      uint64_t v78 = *((void *)&__dst[4] + 1);
      uint64_t v81 = *(void *)&__dst[4];
      uint64_t v8 = *((void *)&__dst[5] + 1);
      uint64_t v7 = *(void *)&__dst[5];
      uint64_t v11 = *((void *)&__dst[6] + 1);
      uint64_t v9 = *(void *)&__dst[6];
      uint64_t v12 = *((void *)&__dst[7] + 1);
      uint64_t v10 = *(void *)&__dst[7];
      uint64_t v14 = *((void *)&__dst[8] + 1);
      uint64_t v13 = *(void *)&__dst[8];
      char v15 = __dst[9];
      char v16 = __dst[2];
      uint64_t v17 = (void *)*((void *)&__dst[1] + 1);
      uint64_t v18 = *(void *)&__dst[0];
      long long v84 = *(_OWORD *)((char *)__dst + 8);
      long long v5 = __dst;
    }
  }
  else
  {
    uint64_t v19 = sub_18C2A6944((uint64_t)v141);
    uint64_t v18 = *(void *)v19;
    long long v84 = *(_OWORD *)(v19 + 8);
    uint64_t v17 = *(void **)(v19 + 24);
    long long v75 = *(_OWORD *)(v19 + 48);
    uint64_t v7 = *(void *)(v19 + 80);
    uint64_t v78 = *(void *)(v19 + 72);
    uint64_t v81 = *(void *)(v19 + 64);
    uint64_t v8 = *(void *)(v19 + 88);
    uint64_t v9 = *(void *)(v19 + 96);
    uint64_t v11 = *(void *)(v19 + 104);
    uint64_t v10 = *(void *)(v19 + 112);
    uint64_t v12 = *(void *)(v19 + 120);
    uint64_t v13 = *(void *)(v19 + 128);
    uint64_t v14 = *(void *)(v19 + 136);
    char v15 = *(unsigned char *)(v19 + 144) & 1;
    char v16 = *(unsigned char *)(v19 + 32) & 1;
    uint64_t v6 = *(void *)(v19 + 40);
    sub_18C2A68DC((uint64_t)v142, (uint64_t)__dst);
    long long v5 = (void *)sub_18C2A6944((uint64_t)__dst);
  }
  sub_18C2A716C(v5);
  long long v120 = v84;
  uint64_t v119 = v18;
  long long v121 = v17;
  char v122 = v16;
  uint64_t v123 = v6;
  long long v124 = v75;
  uint64_t v125 = v81;
  uint64_t v126 = v78;
  uint64_t v127 = v7;
  uint64_t v128 = v8;
  uint64_t v129 = v9;
  uint64_t v130 = v11;
  uint64_t v131 = v10;
  uint64_t v132 = v12;
  uint64_t v133 = v13;
  uint64_t v134 = v14;
  char v135 = v15;
  id v20 = v17;
  id v21 = v3;
  sub_18C2A73A0((uint64_t)&v119);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)__dst, (uint64_t)v136);
  sub_18C2A68DC((uint64_t)v136, (uint64_t)v137);
  int v22 = sub_18C2A6938((uint64_t)v137);
  uint64_t v23 = sub_18C2A6944((uint64_t)v137);
  if (v22 == 1)
  {
    uint64_t v24 = (char *)(v23 + 296);
    if (*(unsigned char *)(v23 + 298))
    {
      uint64_t v26 = *(void *)(v23 + 152);
      v23 += 152;
      uint64_t v25 = v26;
      uint64_t v27 = *(void *)(v23 + 40);
      long long v82 = *(_OWORD *)(v23 + 48);
      uint64_t v79 = *(void *)(v23 + 64);
      uint64_t v28 = *(void *)(v23 + 80);
      uint64_t v76 = *(void *)(v23 + 72);
      uint64_t v29 = *(void *)(v23 + 88);
      uint64_t v30 = *(void *)(v23 + 96);
      uint64_t v31 = *(void *)(v23 + 104);
      uint64_t v32 = *(void *)(v23 + 112);
      uint64_t v34 = *(void *)(v23 + 120);
      uint64_t v33 = *(void *)(v23 + 128);
      uint64_t v35 = *(void *)(v23 + 136);
      char v36 = *v24;
      char v37 = *(unsigned char *)(v23 + 32);
      uint64_t v38 = *(void **)(v23 + 24);
    }
    else
    {
      uint64_t v27 = *(void *)(v23 + 40);
      long long v82 = *(_OWORD *)(v23 + 48);
      uint64_t v79 = *(void *)(v23 + 64);
      uint64_t v28 = *(void *)(v23 + 80);
      uint64_t v76 = *(void *)(v23 + 72);
      uint64_t v29 = *(void *)(v23 + 88);
      uint64_t v30 = *(void *)(v23 + 96);
      uint64_t v31 = *(void *)(v23 + 104);
      uint64_t v32 = *(void *)(v23 + 112);
      uint64_t v34 = *(void *)(v23 + 120);
      uint64_t v33 = *(void *)(v23 + 128);
      uint64_t v35 = *(void *)(v23 + 136);
      char v36 = *(unsigned char *)(v23 + 144);
      char v37 = *(unsigned char *)(v23 + 32);
      uint64_t v38 = *(void **)(v23 + 24);
      uint64_t v25 = *(void *)v23;
    }
    long long v73 = *(_OWORD *)(v23 + 8);
    sub_18C2A716C((void *)v23);
    sub_18C2BC404((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    long long v42 = v73;
    uint64_t v41 = v76;
    uint64_t v40 = v79;
    long long v39 = v82;
  }
  else
  {
    uint64_t v27 = *(void *)(v23 + 40);
    long long v39 = *(_OWORD *)(v23 + 48);
    uint64_t v40 = *(void *)(v23 + 64);
    uint64_t v41 = *(void *)(v23 + 72);
    uint64_t v28 = *(void *)(v23 + 80);
    uint64_t v29 = *(void *)(v23 + 88);
    uint64_t v30 = *(void *)(v23 + 96);
    uint64_t v31 = *(void *)(v23 + 104);
    uint64_t v32 = *(void *)(v23 + 112);
    uint64_t v34 = *(void *)(v23 + 120);
    uint64_t v33 = *(void *)(v23 + 128);
    uint64_t v35 = *(void *)(v23 + 136);
    char v36 = *(unsigned char *)(v23 + 144);
    char v37 = *(unsigned char *)(v23 + 32);
    uint64_t v38 = *(void **)(v23 + 24);
    uint64_t v25 = *(void *)v23;
    long long v42 = *(_OWORD *)(v23 + 8);
  }
  long long v103 = v42;
  uint64_t v102 = v25;
  __int16 v104 = v38;
  char v105 = v37;
  uint64_t v106 = v27;
  long long v107 = v39;
  uint64_t v108 = v40;
  uint64_t v109 = v41;
  uint64_t v110 = v28;
  uint64_t v111 = v29;
  uint64_t v112 = v30;
  uint64_t v113 = v31;
  uint64_t v114 = v32;
  uint64_t v115 = v34;
  uint64_t v116 = v33;
  uint64_t v117 = v35;
  char v118 = v36;
  id v43 = v38;
  sub_18C2A73A0((uint64_t)&v102);
  sub_18C2BC4A0();
  char v44 = sub_18C2CAB30();

  if (v44)
  {

LABEL_15:
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C2A68DC(a1, (uint64_t)__dst);
    swift_retain();
    return sub_18C2CA540();
  }
  sub_18C2A68DC(a1, (uint64_t)__dst);
  uint64_t v85 = v21;
  if (sub_18C2A6938((uint64_t)__dst) == 1)
  {
    sub_18C2A6944((uint64_t)__dst);
    sub_18C2A68DC((uint64_t)v142, (uint64_t)v138);
    uint64_t v46 = sub_18C2A6944((uint64_t)v138);
    uint64_t v47 = (void *)v46;
    uint64_t v48 = *(void **)(v46 + 16);
    if (*(unsigned char *)(v46 + 298))
    {
      uint64_t v49 = (void *)(v46 + 152);
      uint64_t v67 = *(void *)(v46 + 152);
      uint64_t v74 = *(void *)(v46 + 192);
      long long v83 = *(_OWORD *)(v46 + 200);
      uint64_t v80 = *(void *)(v46 + 216);
      uint64_t v54 = *(void *)(v46 + 232);
      uint64_t v77 = *(void *)(v46 + 224);
      uint64_t v55 = *(void *)(v46 + 240);
      uint64_t v56 = *(void *)(v46 + 248);
      uint64_t v57 = *(void *)(v46 + 256);
      uint64_t v58 = *(void *)(v46 + 264);
      uint64_t v60 = *(void *)(v46 + 272);
      uint64_t v59 = *(void *)(v46 + 280);
      uint64_t v61 = *(void *)(v46 + 288);
      char v62 = *(unsigned char *)(v46 + 296);
      char v63 = *(unsigned char *)(v46 + 184);
      id v64 = *(id *)(v46 + 168);
      uint64_t v65 = *(void **)(v46 + 176);
      uint64_t v66 = *(void *)(v46 + 160);
      id v68 = v48;
      uint64_t v50 = v49;
      uint64_t v53 = v74;
      sub_18C2A716C(v50);
    }
    else
    {
      uint64_t v69 = *(void *)(v46 + 40);
      long long v83 = *(_OWORD *)(v46 + 48);
      uint64_t v80 = *(void *)(v46 + 64);
      uint64_t v54 = *(void *)(v46 + 80);
      uint64_t v77 = *(void *)(v46 + 72);
      uint64_t v55 = *(void *)(v46 + 88);
      uint64_t v56 = *(void *)(v46 + 96);
      uint64_t v57 = *(void *)(v46 + 104);
      uint64_t v58 = *(void *)(v46 + 112);
      uint64_t v60 = *(void *)(v46 + 120);
      uint64_t v59 = *(void *)(v46 + 128);
      uint64_t v61 = *(void *)(v46 + 136);
      char v62 = *(unsigned char *)(v46 + 144);
      char v63 = *(unsigned char *)(v46 + 32);
      uint64_t v65 = *(void **)(v46 + 24);
      uint64_t v67 = *(void *)v46;
      uint64_t v66 = *(void *)(v46 + 8);
      id v64 = v48;
      char v70 = v47;
      uint64_t v53 = v69;
      sub_18C2A716C(v70);
      id v68 = v64;
    }
  }
  else
  {
    uint64_t v51 = *(void **)(sub_18C2A6944((uint64_t)__dst) + 16);
    sub_18C2A68DC((uint64_t)v142, (uint64_t)v138);
    uint64_t v52 = sub_18C2A6944((uint64_t)v138);
    uint64_t v53 = *(void *)(v52 + 40);
    long long v83 = *(_OWORD *)(v52 + 48);
    uint64_t v80 = *(void *)(v52 + 64);
    uint64_t v54 = *(void *)(v52 + 80);
    uint64_t v77 = *(void *)(v52 + 72);
    uint64_t v55 = *(void *)(v52 + 88);
    uint64_t v56 = *(void *)(v52 + 96);
    uint64_t v57 = *(void *)(v52 + 104);
    uint64_t v58 = *(void *)(v52 + 112);
    uint64_t v60 = *(void *)(v52 + 120);
    uint64_t v59 = *(void *)(v52 + 128);
    uint64_t v61 = *(void *)(v52 + 136);
    char v62 = *(unsigned char *)(v52 + 144);
    char v63 = *(unsigned char *)(v52 + 32);
    id v64 = *(id *)(v52 + 16);
    uint64_t v65 = *(void **)(v52 + 24);
    uint64_t v67 = *(void *)v52;
    uint64_t v66 = *(void *)(v52 + 8);
    sub_18C2BC404(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
    id v68 = v51;
  }
  v87[0] = v67;
  v87[1] = v66;
  v87[2] = v64;
  v87[3] = v65;
  char v88 = v63;
  uint64_t v89 = v53;
  long long v90 = v83;
  uint64_t v91 = v80;
  uint64_t v92 = v77;
  uint64_t v93 = v54;
  uint64_t v94 = v55;
  uint64_t v95 = v56;
  uint64_t v96 = v57;
  uint64_t v97 = v58;
  uint64_t v98 = v60;
  uint64_t v99 = v59;
  uint64_t v100 = v61;
  char v101 = v62;
  id v71 = v85;
  id v72 = v65;
  sub_18C2A73A0((uint64_t)v87);
  sub_18C2BF178(v71, v68, v72, (uint64_t)v138);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2A68DC((uint64_t)v138, (uint64_t)v86);
  swift_retain();
  sub_18C2BC404((uint64_t)v138, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
  sub_18C2CA540();
  sub_18C2BC404(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);

  return sub_18C2BC404((uint64_t)v138, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
}

void (*sub_18C2BA050(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x5F8uLL);
  *a1 = v3;
  v3[190] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)(v3 + 152), (uint64_t)v3);
  sub_18C2A68DC((uint64_t)v3, (uint64_t)(v3 + 114));
  return sub_18C2BA11C;
}

void sub_18C2BA11C(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t)*a1 + 912;
  if (a2)
  {
    sub_18C2A68DC((uint64_t)*a1 + 912, (uint64_t)v2 + 304);
    sub_18C2BC404((uint64_t)v2 + 304, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
    sub_18C2B9938((uint64_t)v2 + 304);
    sub_18C2A68DC(v3, (uint64_t)v2 + 1216);
    sub_18C2BC404((uint64_t)v2 + 1216, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  }
  else
  {
    sub_18C2A68DC((uint64_t)*a1 + 912, (uint64_t)v2 + 608);
    sub_18C2B9938((uint64_t)v2 + 608);
  }
  free(v2);
}

uint64_t sub_18C2BA1EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18C2BA260()
{
  return sub_18C2BA288();
}

uint64_t sub_18C2BA274()
{
  return sub_18C2BA288();
}

uint64_t sub_18C2BA288()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  return swift_release();
}

uint64_t sub_18C2BA2F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18C2BA36C()
{
  return sub_18C2BA394();
}

uint64_t sub_18C2BA380()
{
  return sub_18C2BA394();
}

uint64_t sub_18C2BA394()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18C2BA400()
{
  uint64_t v0 = sub_18C2CA840();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[3] = &_s11SpringBoardON;
  v42[4] = sub_18C2BC4F0();
  char v4 = sub_18C2CA4C0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  if ((v4 & 1) == 0) {
    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)&v33, (uint64_t)v41);
  sub_18C2A68DC((uint64_t)v41, (uint64_t)v42);
  int v5 = sub_18C2A6938((uint64_t)v42);
  uint64_t v6 = sub_18C2A6944((uint64_t)v42);
  uint64_t v7 = (void *)sub_18C2CA9D0();
  int IsSuitableForArabicJustification = CTStringIsSuitableForArabicJustification();

  if (v5 == 1)
  {
    if (IsSuitableForArabicJustification)
    {
      objc_msgSend(self, sel_maximumHorizontalTextBounds);
      double Width = CGRectGetWidth(v50);
      uint64_t v10 = *(void *)(v6 + 40);
      long long v11 = *(_OWORD *)(v6 + 64);
      long long v34 = *(_OWORD *)(v6 + 48);
      long long v35 = v11;
      long long v12 = *(_OWORD *)(v6 + 96);
      long long v36 = *(_OWORD *)(v6 + 80);
      long long v37 = v12;
      long long v13 = *(_OWORD *)(v6 + 128);
      long long v38 = *(_OWORD *)(v6 + 112);
      long long v39 = v13;
      char v14 = *(unsigned char *)(v6 + 144);
      uint64_t v33 = v10;
      char v40 = v14;
      sub_18C2CA820();
      sub_18C2A83E0((uint64_t)v3, 1.0);
      double v16 = v15;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      if (v16 < Width)
      {
        sub_18C2BC404((uint64_t)v41, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
        BOOL v17 = 1;
        goto LABEL_12;
      }
    }
    uint64_t v25 = (void *)sub_18C2CA9D0();
    int v26 = CTStringIsSuitableForArabicJustification();

    if (v26)
    {
      objc_msgSend(self, sel_maximumHorizontalTextBounds);
      double v18 = CGRectGetWidth(v52);
      long long v43 = *(_OWORD *)(v6 + 200);
      long long v44 = *(_OWORD *)(v6 + 216);
      long long v45 = *(_OWORD *)(v6 + 232);
      long long v46 = *(_OWORD *)(v6 + 248);
      long long v27 = *(_OWORD *)(v6 + 280);
      long long v47 = *(_OWORD *)(v6 + 264);
      char v28 = *(unsigned char *)(v6 + 296);
      v42[38] = *(void *)(v6 + 192);
      long long v48 = v27;
      char v49 = v28;
      sub_18C2CA820();
      double v24 = 1.0;
      goto LABEL_10;
    }
  }
  else if (IsSuitableForArabicJustification)
  {
    objc_msgSend(self, sel_maximumHorizontalTextBounds);
    double v18 = CGRectGetWidth(v51);
    uint64_t v19 = *(void *)(v6 + 40);
    long long v20 = *(_OWORD *)(v6 + 64);
    long long v34 = *(_OWORD *)(v6 + 48);
    long long v35 = v20;
    long long v21 = *(_OWORD *)(v6 + 96);
    long long v36 = *(_OWORD *)(v6 + 80);
    long long v37 = v21;
    long long v22 = *(_OWORD *)(v6 + 128);
    long long v38 = *(_OWORD *)(v6 + 112);
    long long v39 = v22;
    char v23 = *(unsigned char *)(v6 + 144);
    uint64_t v33 = v19;
    char v40 = v23;
    sub_18C2CA820();
    double v24 = 1.0;
LABEL_10:
    sub_18C2A83E0((uint64_t)v3, v24);
    double v30 = v29;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_18C2BC404((uint64_t)v41, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    BOOL v17 = v30 < v18;
    goto LABEL_12;
  }
  sub_18C2BC404((uint64_t)v41, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  BOOL v17 = 0;
LABEL_12:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  if (HIBYTE(v32) == 2)
  {
    if (!v17) {
      return 0;
    }
  }
  else if ((v17 & HIBYTE(v32) & 1) == 0)
  {
    return 0;
  }
  return 1;
}

uint64_t sub_18C2BA804@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v2 = sub_18C2CA840();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v2);
  int v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v3);
  uint64_t v8 = (char *)&v38 - v7;
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  char v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  double v16 = (char *)&v38 - v15;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v44 = v1;
  sub_18C2CA530();
  swift_release();
  uint64_t v17 = v46;
  swift_release();
  double v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (v18(v16, 1, v2) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v45, v16, v2);
  }
  long long v42 = v5;
  long long v43 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v18;
  uint64_t v40 = v2;
  uint64_t v41 = v14;
  long long v38 = v8;
  long long v39 = v10;
  sub_18C2BBF9C((uint64_t)v16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C2A68DC((uint64_t)&v47, (uint64_t)v48);
  sub_18C2A68DC((uint64_t)v48, (uint64_t)v49);
  int v19 = sub_18C2A6938((uint64_t)v49);
  sub_18C2A6944((uint64_t)v49);
  if (v19 == 1)
  {
    sub_18C2BC404((uint64_t)v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    return sub_18C2CA820();
  }
  uint64_t v21 = v17;
  long long v22 = (void *)sub_18C2CA9D0();
  int IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();

  if (IsSuitableForVerticalLayout)
  {
    uint64_t v24 = sub_18C2CAA20();
    BOOL v25 = (uint64_t)objc_msgSend(self, sel_maximumVerticalTextLength) >= v24;
  }
  else
  {
    BOOL v25 = 0;
  }
  uint64_t v26 = (uint64_t)v41;
  long long v27 = v42;
  uint64_t v28 = v40;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  swift_release();
  if (v43(v26, 1, v28) != 1)
  {
    uint64_t v29 = v21;
    double v30 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
    uint64_t v31 = v39;
    v30(v39, v26, v28);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
    uint64_t v33 = v38;
    v32(v38, v31, v28);
    if (v25)
    {
      v32(v27, v33, v28);
      uint64_t v34 = sub_18C2B89E8(v27);
      BOOL IsVertical = PRPosterTitleLayoutIsVertical(v34);
      long long v36 = *(void (**)(char *, uint64_t))(v29 + 8);
      v36(v33, v28);
      v36(v31, v28);
      if (IsVertical) {
        goto LABEL_13;
      }
    }
    else
    {
      long long v37 = *(void (**)(char *, uint64_t))(v29 + 8);
      v37(v33, v28);
      v37(v31, v28);
    }
LABEL_15:
    sub_18C2CA820();
    return sub_18C2BC404((uint64_t)v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  }
  sub_18C2BBF9C(v26);
  if (!v25) {
    goto LABEL_15;
  }
LABEL_13:
  sub_18C2CA810();
  return sub_18C2BC404((uint64_t)v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
}

uint64_t sub_18C2BACB0(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    sub_18C29E184((uint64_t)v25);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C29E1A4((uint64_t)v25, (uint64_t)v24);
    swift_retain();
    return sub_18C2CA540();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  sub_18C29E1A4((uint64_t)v25, (uint64_t)v26);
  sub_18C2BC388((uint64_t)v26, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  sub_18C29E1A4((uint64_t)v26, (uint64_t)v27);
  if (sub_18C2A7154((uint64_t)v27) == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C2CA530();
    swift_release();
    swift_release();
    sub_18C2A68DC((uint64_t)v25, (uint64_t)v24);
    sub_18C2A68DC((uint64_t)v24, (uint64_t)v25);
    if (sub_18C2A6938((uint64_t)v25) == 1)
    {
      sub_18C2A6944((uint64_t)v25);
      sub_18C2A68DC((uint64_t)v24, (uint64_t)v14);
      uint64_t v4 = v14;
    }
    else
    {
      uint64_t v4 = v25;
    }
    id v8 = *(id *)(sub_18C2A6944((uint64_t)v4) + 16);
    sub_18C2BC404((uint64_t)v24, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    id v9 = objc_msgSend(self, sel_defaultStatusFont);
    swift_bridgeObjectRetain();
    id v10 = v9;
    sub_18C2A911C(a1, a2, v10, (uint64_t)&v28);
    v14[0] = a1;
    v14[1] = a2;
    v14[2] = v8;
    v14[3] = v10;
    char v15 = 0;
    uint64_t v16 = v28;
    long long v17 = v29;
    long long v18 = v30;
    long long v19 = v31;
    long long v20 = v32;
    long long v21 = v33;
    long long v22 = v34;
    char v23 = v35;
    nullsub_1(v14);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C29E1A4((uint64_t)v14, (uint64_t)v13);
    swift_retain();
    return sub_18C2CA540();
  }
  int v5 = sub_18C2B96DC(v13);
  uint64_t v7 = (void *)v6;
  sub_18C29E1A4(v6, (uint64_t)v24);
  sub_18C29E1A4((uint64_t)v24, (uint64_t)v25);
  if (sub_18C2A7154((uint64_t)v25) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    void *v7 = a1;
    v7[1] = a2;
    uint64_t v12 = (void *)v7[3];
    swift_bridgeObjectRetain();
    sub_18C2A911C(a1, a2, v12, (uint64_t)v14);
    sub_18C2B8ED0((uint64_t)v14, (uint64_t)(v7 + 5));
  }
  return ((uint64_t (*)(void *, void))v5)(v13, 0);
}

uint64_t sub_18C2BB000(char a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18C2CA530();
  swift_release();
  uint64_t result = swift_release();
  if (((((a1 & 1) == 0) ^ v5) & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18C2CA540();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18C2CA530();
    swift_release();
    uint64_t v3 = swift_release();
    if (v4 == 1)
    {
      MEMORY[0x1F4188790](v3);
      sub_18C2CA970();
      sub_18C2CA5E0();
      return swift_release();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      return sub_18C2CA540();
    }
  }
  return result;
}

uint64_t sub_18C2BB1E0()
{
  return sub_18C2CA540();
}

uint64_t sub_18C2BB25C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__status;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator___nameStyle;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredTextAlignment;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredWritingMode;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA48);
  id v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__overrideWritingMode, v8);
  uint64_t v10 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__callState;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__animationsEnabled;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA88);
  char v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  v14(v12, v13);
  v14(v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__marqueeRunning, v13);

  uint64_t v15 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v16 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v15, v16);
}

uint64_t sub_18C2BB4C8()
{
  return _s11CoordinatorCMa();
}

uint64_t _s11CoordinatorCMa()
{
  uint64_t result = qword_1E916CD00;
  if (!qword_1E916CD00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_18C2BB51C()
{
  sub_18C2BB740(319, &qword_1E916CA68, &qword_1E916CD40);
  if (v0 <= 0x3F)
  {
    sub_18C2BB790(319, &qword_1E916CA80);
    if (v1 <= 0x3F)
    {
      sub_18C2BB740(319, &qword_1E916CA78, qword_1E916CD48);
      if (v2 <= 0x3F)
      {
        sub_18C2BB740(319, &qword_1E916CA50, &qword_1E916CA20);
        if (v3 <= 0x3F)
        {
          sub_18C2BB790(319, &qword_1E916CA58);
          if (v4 <= 0x3F)
          {
            sub_18C2BB790(319, &qword_1E916CA90);
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_18C2BB740(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_18C2CA550();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_18C2BB790(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_18C2CA550();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_18C2BB7D8()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_18C2BB7E4@<X0>(uint64_t *a1@<X8>)
{
  _s11CoordinatorCMa();
  uint64_t result = sub_18C2CA500();
  *a1 = result;
  return result;
}

uint64_t sub_18C2BB844()
{
  return sub_18C2BB1E0();
}

uint64_t sub_18C2BB864(uint64_t a1, uint64_t a2, int a3, uint64_t a4, char a5)
{
  uint64_t v68 = a4;
  int v67 = a3;
  uint64_t v65 = a1;
  uint64_t v66 = a2;
  int v69 = a5 & 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA88);
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v64 = v6;
  MEMORY[0x1F4188790](v6);
  char v62 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA48);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v71 = v8;
  uint64_t v72 = v9;
  MEMORY[0x1F4188790](v8);
  CGRect v52 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v11 = MEMORY[0x1F4188790](v70);
  uint64_t v73 = (uint64_t)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  char v14 = (char *)&v47 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA70);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v58 = v15;
  uint64_t v59 = v16;
  MEMORY[0x1F4188790](v15);
  long long v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA60);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v56 = v19;
  uint64_t v57 = v20;
  MEMORY[0x1F4188790](v19);
  long long v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__status;
  uint64_t v54 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__status;
  sub_18C29E184((uint64_t)v76);
  sub_18C29E1A4((uint64_t)v76, (uint64_t)v74);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CD40);
  sub_18C2CA510();
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v22, v19);
  uint64_t v50 = v5;
  uint64_t v24 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredTextAlignment;
  uint64_t v55 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredTextAlignment;
  v74[0] = 2;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(qword_1E916CD48);
  sub_18C2CA510();
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v24, v18, v15);
  uint64_t v25 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredWritingMode;
  uint64_t v53 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredWritingMode;
  uint64_t v26 = sub_18C2CA840();
  char v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
  uint64_t v27 = (uint64_t)v14;
  v49(v14, 1, 1, v26);
  sub_18C2B8DDC((uint64_t)v14, v73);
  uint64_t v28 = v52;
  sub_18C2CA510();
  sub_18C2BBF9C(v27);
  long long v29 = *(void (**)(uint64_t, char *, uint64_t))(v72 + 32);
  uint64_t v30 = v25;
  long long v31 = v28;
  uint64_t v32 = v71;
  v29(v30, v28, v71);
  uint64_t v33 = v50;
  uint64_t v48 = v50 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__overrideWritingMode;
  v49((char *)v27, 1, 1, v26);
  uint64_t v51 = v27;
  sub_18C2B8DDC(v27, v73);
  sub_18C2CA510();
  sub_18C2BBF9C(v27);
  v29(v48, v31, v32);
  uint64_t v34 = v33 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__animationsEnabled;
  v74[0] = 1;
  char v35 = v62;
  sub_18C2CA510();
  uint64_t v36 = v64;
  long long v37 = *(void (**)(uint64_t, char *, uint64_t))(v63 + 32);
  v37(v34, v35, v64);
  uint64_t v38 = v33 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__marqueeRunning;
  v74[0] = 1;
  sub_18C2CA510();
  v37(v38, v35, v36);
  *(void *)(v33 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact) = 0;
  swift_beginAccess();
  uint64_t v39 = v65;
  sub_18C2A68DC(v65, (uint64_t)v74);
  sub_18C2BC404(v39, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
  sub_18C2CA510();
  swift_endAccess();
  uint64_t v40 = v54;
  swift_beginAccess();
  uint64_t v41 = v66;
  sub_18C2BC388(v66, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v40, v56);
  sub_18C29E1A4(v41, (uint64_t)v74);
  sub_18C2CA510();
  swift_endAccess();
  uint64_t v42 = v55;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v42, v58);
  char v75 = v67;
  sub_18C2CA510();
  swift_endAccess();
  uint64_t v43 = v68;
  uint64_t v44 = v51;
  sub_18C2B8DDC(v68, v51);
  uint64_t v45 = v53;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v45, v71);
  sub_18C2B8DDC(v44, v73);
  sub_18C2CA510();
  sub_18C2BBF9C(v44);
  swift_endAccess();
  swift_beginAccess();
  char v75 = v69;
  sub_18C2CA510();
  swift_endAccess();
  sub_18C2BBF9C(v43);
  return v33;
}

uint64_t sub_18C2BBF9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18C2BBFFC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CA20);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v34 = (uint64_t)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  char v35 = (char *)&v31 - v13;
  char v14 = (void *)sub_18C2CA9D0();
  uint64_t v32 = a3;
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
  }
  int v33 = a5 & 1;
  uint64_t v16 = self;
  objc_msgSend(v16, sel_idealEmphasizedFontSizeForName_status_usingLayout_, v14, v15, 0);
  double v18 = v17;

  id v19 = objc_msgSend(v16, sel_defaultNameFont);
  id v20 = objc_msgSend(v19, sel_fontWithSize_, v18);

  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_labelColor);
  id v23 = v20;
  swift_bridgeObjectRetain();
  sub_18C2A911C(a1, a2, v23, (uint64_t)&v48);
  *(void *)&long long v36 = a1;
  *((void *)&v36 + 1) = a2;
  *(void *)&long long v37 = v22;
  *((void *)&v37 + 1) = v23;
  LOBYTE(v38) = 0;
  *((void *)&v38 + 1) = v48;
  long long v39 = v49;
  long long v40 = v50;
  long long v41 = v51;
  long long v42 = v52;
  long long v43 = v53;
  long long v44 = v54;
  char v45 = v55;
  id v24 = objc_msgSend(v21, sel_secondaryLabelColor);
  id v25 = objc_msgSend(v16, sel_defaultStatusFont);
  sub_18C29DF2C(v32, a4, v24, v25, (uint64_t)v56);
  uint64_t v26 = sub_18C2CA840();
  uint64_t v27 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v35, 1, 1, v26);
  v46[6] = v42;
  v46[7] = v43;
  v46[8] = v44;
  char v47 = v45;
  void v46[2] = v38;
  v46[3] = v39;
  v46[4] = v40;
  v46[5] = v41;
  v46[0] = v36;
  v46[1] = v37;
  sub_18C2B8E8C((uint64_t)v46);
  sub_18C2A68DC((uint64_t)v46, (uint64_t)v57);
  uint64_t v28 = v34;
  sub_18C2B8DDC(v27, v34);
  _s11CoordinatorCMa();
  swift_allocObject();
  uint64_t v29 = sub_18C2BB864((uint64_t)v57, (uint64_t)v56, 2, v28, v33);
  sub_18C2BC388((uint64_t)v56, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  sub_18C2A73A0((uint64_t)&v36);
  sub_18C2BBF9C(v27);

  return v29;
}

uint64_t sub_18C2BC388(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 144);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v4);
  return a1;
}

uint64_t sub_18C2BC404(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))
{
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  long long v5 = *(_OWORD *)(a1 + 240);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    *(void *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
  return a1;
}

unint64_t sub_18C2BC4A0()
{
  unint64_t result = qword_1E916CE30;
  if (!qword_1E916CE30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E916CE30);
  }
  return result;
}

unint64_t sub_18C2BC4F0()
{
  unint64_t result = qword_1E916CD10;
  if (!qword_1E916CD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CD10);
  }
  return result;
}

uint64_t _s11SpringBoardOwet(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s11SpringBoardOwst(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x18C2BC634);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_18C2BC65C()
{
  return 0;
}

ValueMetadata *_s11SpringBoardOMa()
{
  return &_s11SpringBoardON;
}

unint64_t sub_18C2BC678()
{
  unint64_t result = qword_1E91709F0;
  if (!qword_1E91709F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91709F0);
  }
  return result;
}

void _s9NameStyleOwxx(uint64_t a1)
{
  long long v3 = *(_OWORD *)(a1 + 256);
  long long v4 = *(_OWORD *)(a1 + 272);
  long long v1 = *(_OWORD *)(a1 + 224);
  long long v2 = *(_OWORD *)(a1 + 240);
  sub_18C2A6BB8(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void **)(a1 + 168),
    *(void **)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void **)(a1 + 208),
    *(void *)(a1 + 216),
    v1,
    *((uint64_t *)&v1 + 1),
    v2,
    *((uint64_t *)&v2 + 1),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    *(void *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
}

uint64_t _s9NameStyleOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *(void *)(a2 + 72);
  uint64_t v42 = *(void *)(a2 + 64);
  uint64_t v39 = *(void *)(a2 + 88);
  uint64_t v40 = *(void *)(a2 + 80);
  uint64_t v13 = *(void *)(a2 + 96);
  uint64_t v14 = *(void *)(a2 + 104);
  uint64_t v15 = *(void *)(a2 + 112);
  uint64_t v16 = *(void *)(a2 + 120);
  uint64_t v17 = *(void *)(a2 + 128);
  uint64_t v18 = *(void *)(a2 + 136);
  uint64_t v19 = *(void *)(a2 + 144);
  uint64_t v20 = *(void *)(a2 + 152);
  uint64_t v21 = *(void *)(a2 + 160);
  id v22 = *(void **)(a2 + 168);
  uint64_t v3 = *(void *)(a2 + 192);
  id v23 = *(void **)(a2 + 176);
  uint64_t v24 = *(void *)(a2 + 184);
  uint64_t v25 = *(void *)(a2 + 200);
  uint64_t v26 = *(void **)(a2 + 208);
  uint64_t v27 = *(void *)(a2 + 216);
  uint64_t v28 = *(void *)(a2 + 224);
  uint64_t v29 = *(void *)(a2 + 232);
  uint64_t v30 = *(void *)(a2 + 240);
  uint64_t v31 = *(void *)(a2 + 248);
  uint64_t v32 = *(void *)(a2 + 256);
  uint64_t v33 = *(void *)(a2 + 264);
  uint64_t v34 = *(void *)(a2 + 272);
  uint64_t v35 = *(void *)(a2 + 280);
  uint64_t v36 = *(void *)(a2 + 288);
  int v37 = *(unsigned __int8 *)(a2 + 298);
  int v38 = *(unsigned __int16 *)(a2 + 296);
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  long long v7 = *(void **)(a2 + 24);
  long long v6 = *(void **)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v11 = *(void **)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 48);
  sub_18C2B94B0(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v42, v41, v40, v39, v13, v14, v15, v16, v17, v18, v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v3,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v38 | (v37 << 16));
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v42;
  *(void *)(a1 + 72) = v41;
  *(void *)(a1 + 80) = v40;
  *(void *)(a1 + 88) = v39;
  *(void *)(a1 + 96) = v13;
  *(void *)(a1 + 104) = v14;
  *(void *)(a1 + 112) = v15;
  *(void *)(a1 + 120) = v16;
  *(void *)(a1 + 128) = v17;
  *(void *)(a1 + 136) = v18;
  *(void *)(a1 + 144) = v19;
  *(void *)(a1 + 152) = v20;
  *(void *)(a1 + 160) = v21;
  *(void *)(a1 + 168) = v22;
  *(void *)(a1 + 176) = v23;
  *(void *)(a1 + 184) = v24;
  *(void *)(a1 + 192) = v3;
  *(void *)(a1 + 200) = v25;
  *(void *)(a1 + 208) = v26;
  *(void *)(a1 + 216) = v27;
  *(void *)(a1 + 224) = v28;
  *(void *)(a1 + 232) = v29;
  *(void *)(a1 + 240) = v30;
  *(void *)(a1 + 248) = v31;
  *(void *)(a1 + 256) = v32;
  *(void *)(a1 + 264) = v33;
  *(void *)(a1 + 272) = v34;
  *(void *)(a1 + 280) = v35;
  *(void *)(a1 + 288) = v36;
  *(unsigned char *)(a1 + 298) = v37;
  *(_WORD *)(a1 + 296) = v38;
  return a1;
}

uint64_t _s9NameStyleOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v65 = *(void *)a2;
  uint64_t v66 = *(void *)(a2 + 8);
  uint64_t v63 = *(void **)(a2 + 24);
  uint64_t v64 = *(void **)(a2 + 16);
  uint64_t v61 = *(void *)(a2 + 40);
  uint64_t v62 = *(void *)(a2 + 32);
  uint64_t v59 = *(void **)(a2 + 56);
  uint64_t v60 = *(void *)(a2 + 48);
  uint64_t v57 = *(void *)(a2 + 72);
  uint64_t v58 = *(void *)(a2 + 64);
  uint64_t v55 = *(void *)(a2 + 88);
  uint64_t v56 = *(void *)(a2 + 80);
  uint64_t v37 = *(void *)(a2 + 96);
  uint64_t v38 = *(void *)(a2 + 104);
  uint64_t v3 = *(void *)(a2 + 128);
  uint64_t v39 = *(void *)(a2 + 112);
  uint64_t v40 = *(void *)(a2 + 120);
  uint64_t v4 = *(void *)(a2 + 136);
  uint64_t v5 = *(void *)(a2 + 144);
  uint64_t v6 = *(void *)(a2 + 152);
  uint64_t v7 = *(void *)(a2 + 160);
  uint64_t v8 = *(void **)(a2 + 168);
  uint64_t v9 = *(void **)(a2 + 176);
  uint64_t v10 = *(void *)(a2 + 184);
  uint64_t v11 = *(void *)(a2 + 192);
  uint64_t v41 = *(void *)(a2 + 200);
  uint64_t v42 = *(void **)(a2 + 208);
  uint64_t v43 = *(void *)(a2 + 216);
  uint64_t v44 = *(void *)(a2 + 224);
  uint64_t v45 = *(void *)(a2 + 232);
  uint64_t v46 = *(void *)(a2 + 240);
  uint64_t v47 = *(void *)(a2 + 248);
  uint64_t v48 = *(void *)(a2 + 256);
  uint64_t v49 = *(void *)(a2 + 264);
  uint64_t v50 = *(void *)(a2 + 272);
  uint64_t v51 = *(void *)(a2 + 280);
  uint64_t v52 = *(void *)(a2 + 288);
  int v53 = *(unsigned __int8 *)(a2 + 298);
  int v54 = *(unsigned __int16 *)(a2 + 296);
  sub_18C2B94B0(*(void *)a2, v66, v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v37, v38, v39, v40, v3, v4, v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v54 | (v53 << 16));
  int v12 = *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16);
  uint64_t v13 = *(void *)a1;
  uint64_t v14 = *(void *)(a1 + 8);
  *(void *)a1 = v65;
  *(void *)(a1 + 8) = v66;
  uint64_t v15 = *(void **)(a1 + 16);
  uint64_t v16 = *(void **)(a1 + 24);
  *(void *)(a1 + 16) = v64;
  *(void *)(a1 + 24) = v63;
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v62;
  *(void *)(a1 + 40) = v61;
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void **)(a1 + 56);
  *(void *)(a1 + 48) = v60;
  *(void *)(a1 + 56) = v59;
  long long v21 = *(_OWORD *)(a1 + 64);
  long long v22 = *(_OWORD *)(a1 + 80);
  *(void *)(a1 + 64) = v58;
  *(void *)(a1 + 72) = v57;
  *(void *)(a1 + 80) = v56;
  *(void *)(a1 + 88) = v55;
  long long v23 = *(_OWORD *)(a1 + 96);
  long long v24 = *(_OWORD *)(a1 + 112);
  *(void *)(a1 + 96) = v37;
  *(void *)(a1 + 104) = v38;
  *(void *)(a1 + 112) = v39;
  long long v25 = *(_OWORD *)(a1 + 128);
  long long v26 = *(_OWORD *)(a1 + 144);
  *(void *)(a1 + 120) = v40;
  *(void *)(a1 + 128) = v3;
  *(void *)(a1 + 136) = v4;
  *(void *)(a1 + 144) = v5;
  long long v27 = *(_OWORD *)(a1 + 160);
  long long v28 = *(_OWORD *)(a1 + 176);
  *(void *)(a1 + 152) = v6;
  *(void *)(a1 + 160) = v7;
  *(void *)(a1 + 168) = v8;
  *(void *)(a1 + 176) = v9;
  long long v29 = *(_OWORD *)(a1 + 192);
  long long v30 = *(_OWORD *)(a1 + 208);
  *(void *)(a1 + 184) = v10;
  *(void *)(a1 + 192) = v11;
  *(void *)(a1 + 200) = v41;
  *(void *)(a1 + 208) = v42;
  *(void *)(a1 + 216) = v43;
  long long v31 = *(_OWORD *)(a1 + 224);
  long long v32 = *(_OWORD *)(a1 + 240);
  *(void *)(a1 + 224) = v44;
  *(void *)(a1 + 232) = v45;
  *(void *)(a1 + 240) = v46;
  *(void *)(a1 + 248) = v47;
  long long v33 = *(_OWORD *)(a1 + 256);
  long long v34 = *(_OWORD *)(a1 + 272);
  *(void *)(a1 + 256) = v48;
  *(void *)(a1 + 264) = v49;
  *(void *)(a1 + 272) = v50;
  *(void *)(a1 + 280) = v51;
  uint64_t v35 = *(void *)(a1 + 288);
  *(void *)(a1 + 288) = v52;
  *(unsigned char *)(a1 + 298) = v53;
  *(_WORD *)(a1 + 296) = v54;
  sub_18C2A6BB8(v13, v14, v15, v16, v17, v18, v19, v20, v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25, *((uint64_t *)&v25 + 1), v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((void **)&v27 + 1),
    (void *)v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    (void *)v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    v12);
  return a1;
}

void *__swift_memcpy299_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x12BuLL);
}

uint64_t _s9NameStyleOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 288);
  __int16 v5 = *(_WORD *)(a2 + 296);
  char v6 = *(unsigned char *)(a2 + 298);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void **)(a1 + 16);
  uint64_t v10 = *(void **)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void **)(a1 + 56);
  long long v15 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 80);
  long long v17 = *(_OWORD *)(a1 + 96);
  long long v18 = *(_OWORD *)(a1 + 112);
  long long v19 = *(_OWORD *)(a1 + 128);
  long long v20 = *(_OWORD *)(a1 + 144);
  long long v21 = *(_OWORD *)(a1 + 160);
  long long v22 = *(_OWORD *)(a1 + 176);
  long long v23 = *(_OWORD *)(a1 + 192);
  long long v24 = *(_OWORD *)(a1 + 208);
  long long v25 = *(_OWORD *)(a1 + 224);
  long long v26 = *(_OWORD *)(a1 + 240);
  long long v27 = *(_OWORD *)(a1 + 256);
  long long v28 = *(_OWORD *)(a1 + 272);
  uint64_t v29 = *(void *)(a1 + 288);
  int v30 = *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16);
  long long v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v31;
  long long v32 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v32;
  long long v33 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v33;
  long long v34 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v34;
  long long v35 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v35;
  long long v36 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v36;
  long long v37 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v37;
  long long v38 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v38;
  long long v39 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v39;
  *(void *)(a1 + 288) = v4;
  *(unsigned char *)(a1 + 298) = v6;
  *(_WORD *)(a1 + 296) = v5;
  sub_18C2A6BB8(v7, v8, v9, v10, v11, v12, v13, v14, v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18, *((uint64_t *)&v18 + 1), v19, *((uint64_t *)&v19 + 1), v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((void **)&v21 + 1),
    (void *)v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    (void *)v24,
    *((uint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    v30);
  return a1;
}

uint64_t _s9NameStyleOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 299)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 32) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t _s9NameStyleOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 298) = 0;
    *(_WORD *)(result + 296) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 299) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(_OWORD *)unint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(void *)(result + 32) = 2 * -a2;
      *(_OWORD *)(result + 56) = 0u;
      *(_OWORD *)(result + 72) = 0u;
      *(_OWORD *)(result + 88) = 0u;
      *(_OWORD *)(result + 104) = 0u;
      *(_OWORD *)(result + 120) = 0u;
      *(_OWORD *)(result + 136) = 0u;
      *(_OWORD *)(result + 152) = 0u;
      *(_OWORD *)(result + 168) = 0u;
      *(_OWORD *)(result + 184) = 0u;
      *(_OWORD *)(result + 200) = 0u;
      *(_OWORD *)(result + 216) = 0u;
      *(_OWORD *)(result + 232) = 0u;
      *(_OWORD *)(result + 248) = 0u;
      *(_OWORD *)(result + 40) = 0u;
      result += 40;
      *(_OWORD *)(result + 224) = 0u;
      *(_OWORD *)(result + 240) = 0u;
      *(_DWORD *)(result + 255) = 0;
      return result;
    }
    *(unsigned char *)(result + 299) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_18C2BCEA4(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 144) & 1;
  uint64_t v3 = *(void *)(result + 184) & 1;
  int v4 = (*(unsigned __int16 *)(result + 296) | (*(unsigned __int8 *)(result + 298) << 16)) & 0x1010101;
  *(void *)(result + 32) &= 1uLL;
  *(void *)(result + 144) = v2;
  *(void *)(result + 184) = v3;
  *(_WORD *)(result + 296) = v4;
  *(unsigned char *)(result + 298) = (v4 | (a2 << 23)) >> 16;
  return result;
}

ValueMetadata *_s9NameStyleOMa()
{
  return &_s9NameStyleON;
}

uint64_t sub_18C2BCEFC(uint64_t a1)
{
  sub_18C2A68DC(v1, (uint64_t)v27);
  sub_18C2A68DC((uint64_t)v27, (uint64_t)v28);
  int v3 = sub_18C2A6938((uint64_t)v28);
  int v4 = (const void *)sub_18C2A6944((uint64_t)v28);
  if (v3 != 1) {
    return sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  uint64_t v5 = (uint64_t)v4;
  memcpy(__dst, v4, 0x12BuLL);
  sub_18C2A7C4C(a1, (uint64_t)v15, &qword_1E916CD40);
  uint64_t result = sub_18C2A7154((uint64_t)v15);
  if (result != 1)
  {
    long long v23 = v15[6];
    long long v24 = v15[7];
    long long v25 = v15[8];
    char v26 = v16;
    long long v19 = v15[2];
    long long v20 = v15[3];
    long long v21 = v15[4];
    long long v22 = v15[5];
    long long v17 = v15[0];
    long long v18 = v15[1];
    if (*(unsigned char *)(v5 + 297))
    {
      sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
      sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
      sub_18C2BF5B8((uint64_t)v27, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
      sub_18C2A73A0(v5);
      uint64_t v7 = __dst;
    }
    else
    {
      sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
      sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
      sub_18C2BF5B8((uint64_t)v27, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
      sub_18C2A73A0(v5 + 152);
      uint64_t v7 = &__dst[152];
    }
    long long v8 = v24;
    *((_OWORD *)v7 + 6) = v23;
    *((_OWORD *)v7 + 7) = v8;
    *((_OWORD *)v7 + 8) = v25;
    v7[144] = v26;
    long long v9 = v20;
    *((_OWORD *)v7 + 2) = v19;
    *((_OWORD *)v7 + 3) = v9;
    long long v10 = v22;
    *((_OWORD *)v7 + 4) = v21;
    *((_OWORD *)v7 + 5) = v10;
    long long v11 = v18;
    *(_OWORD *)uint64_t v7 = v17;
    *((_OWORD *)v7 + 1) = v11;
    memcpy(__src, __dst, 0x12BuLL);
    sub_18C2BF740(__src);
    sub_18C2BF5B8((uint64_t)v27, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C2BF7D0((uint64_t)__src);
    memcpy(v13, __src, 0x12BuLL);
    sub_18C2B8E44((uint64_t)v13);
    return sub_18C2A68DC((uint64_t)v13, v1);
  }
  return result;
}

uint64_t sub_18C2BD1A0(uint64_t a1)
{
  sub_18C2A68DC(v1, (uint64_t)v36);
  sub_18C2A68DC((uint64_t)v36, (uint64_t)v37);
  int v3 = sub_18C2A6938((uint64_t)v37);
  uint64_t v4 = sub_18C2A6944((uint64_t)v37);
  if (v3 != 1) {
    return sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  uint64_t v5 = v4;
  sub_18C2A7C4C(a1, (uint64_t)v34, &qword_1E916CD40);
  uint64_t result = sub_18C2A7154((uint64_t)v34);
  if (result != 1)
  {
    long long v28 = v34[6];
    long long v29 = v34[7];
    long long v30 = v34[8];
    char v31 = v35;
    long long v24 = v34[2];
    long long v25 = v34[3];
    long long v26 = v34[4];
    long long v27 = v34[5];
    long long v22 = v34[0];
    long long v23 = v34[1];
    uint64_t v7 = *(void **)(v5 + 168);
    long long v8 = *(void **)(v5 + 176);
    long long v9 = *(void **)(v5 + 208);
    char v20 = *(unsigned char *)(v5 + 298);
    char v21 = *(unsigned char *)(v5 + 297);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
    sub_18C2BF5B8((uint64_t)v36, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
    swift_bridgeObjectRetain();
    id v19 = v7;
    id v10 = v8;
    swift_bridgeObjectRetain();
    id v11 = v9;
    sub_18C2A73A0(v5);
    __src[6] = v28;
    __src[7] = v29;
    __src[8] = v30;
    LOBYTE(__src[9]) = v31;
    void __src[2] = v24;
    __src[3] = v25;
    __src[4] = v26;
    __src[5] = v27;
    __src[0] = v22;
    __src[1] = v23;
    long long v12 = *(_OWORD *)(v5 + 248);
    char v13 = *(unsigned char *)(v5 + 296);
    long long v14 = *(_OWORD *)(v5 + 280);
    *(_OWORD *)((char *)&__src[16] + 8) = *(_OWORD *)(v5 + 264);
    *(_OWORD *)((char *)&__src[17] + 8) = v14;
    long long v15 = *(_OWORD *)(v5 + 152);
    *(_OWORD *)((char *)&__src[10] + 8) = *(_OWORD *)(v5 + 168);
    *(_OWORD *)((char *)&__src[9] + 8) = v15;
    long long v16 = *(_OWORD *)(v5 + 184);
    long long v17 = *(_OWORD *)(v5 + 200);
    long long v18 = *(_OWORD *)(v5 + 216);
    *(_OWORD *)((char *)&__src[14] + 8) = *(_OWORD *)(v5 + 232);
    *(_OWORD *)((char *)&__src[13] + 8) = v18;
    *(_OWORD *)((char *)&__src[12] + 8) = v17;
    *(_OWORD *)((char *)&__src[11] + 8) = v16;
    BYTE8(__src[18]) = v13;
    *(_OWORD *)((char *)&__src[15] + 8) = v12;
    BYTE9(__src[18]) = v21;
    BYTE10(__src[18]) = v20;
    sub_18C2BF740(__src);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_18C2BF5B8((uint64_t)v36, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C2BF7D0((uint64_t)__src);
    memcpy(__dst, __src, 0x12BuLL);
    sub_18C2B8E44((uint64_t)__dst);
    return sub_18C2A68DC((uint64_t)__dst, v1);
  }
  return result;
}

uint64_t sub_18C2BD464(uint64_t a1)
{
  sub_18C2A68DC(v1, (uint64_t)v36);
  sub_18C2A68DC((uint64_t)v36, (uint64_t)v37);
  int v3 = sub_18C2A6938((uint64_t)v37);
  uint64_t v4 = sub_18C2A6944((uint64_t)v37);
  if (v3 != 1) {
    return sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
  }
  uint64_t v5 = v4;
  sub_18C2A7C4C(a1, (uint64_t)v34, &qword_1E916CD40);
  uint64_t result = sub_18C2A7154((uint64_t)v34);
  if (result != 1)
  {
    long long v28 = v34[6];
    long long v29 = v34[7];
    long long v30 = v34[8];
    char v31 = v35;
    long long v24 = v34[2];
    long long v25 = v34[3];
    long long v26 = v34[4];
    long long v27 = v34[5];
    long long v22 = v34[0];
    long long v23 = v34[1];
    uint64_t v7 = *(void **)(v5 + 16);
    long long v8 = *(void **)(v5 + 24);
    long long v9 = *(void **)(v5 + 56);
    char v20 = *(unsigned char *)(v5 + 298);
    char v21 = *(unsigned char *)(v5 + 297);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2B95E0);
    sub_18C2BF5B8((uint64_t)v36, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
    swift_bridgeObjectRetain();
    id v19 = v7;
    id v10 = v8;
    swift_bridgeObjectRetain();
    id v11 = v9;
    sub_18C2A73A0(v5 + 152);
    long long v12 = *(_OWORD *)(v5 + 16);
    __src[0] = *(_OWORD *)v5;
    __src[1] = v12;
    long long v13 = *(_OWORD *)(v5 + 32);
    long long v14 = *(_OWORD *)(v5 + 48);
    long long v15 = *(_OWORD *)(v5 + 80);
    __src[4] = *(_OWORD *)(v5 + 64);
    __src[5] = v15;
    void __src[2] = v13;
    __src[3] = v14;
    long long v16 = *(_OWORD *)(v5 + 96);
    long long v17 = *(_OWORD *)(v5 + 112);
    long long v18 = *(_OWORD *)(v5 + 128);
    LOBYTE(__src[9]) = *(unsigned char *)(v5 + 144);
    __src[7] = v17;
    __src[8] = v18;
    __src[6] = v16;
    *(_OWORD *)((char *)&__src[16] + 8) = v29;
    *(_OWORD *)((char *)&__src[17] + 8) = v30;
    *(_OWORD *)((char *)&__src[15] + 8) = v28;
    BYTE8(__src[18]) = v31;
    *(_OWORD *)((char *)&__src[11] + 8) = v24;
    *(_OWORD *)((char *)&__src[12] + 8) = v25;
    *(_OWORD *)((char *)&__src[13] + 8) = v26;
    *(_OWORD *)((char *)&__src[14] + 8) = v27;
    *(_OWORD *)((char *)&__src[9] + 8) = v22;
    *(_OWORD *)((char *)&__src[10] + 8) = v23;
    BYTE9(__src[18]) = v21;
    BYTE10(__src[18]) = v20;
    sub_18C2BF740(__src);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_18C2BF5B8((uint64_t)v36, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C2B9574(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_18C2A72CC);
    sub_18C2BF7D0((uint64_t)__src);
    memcpy(__dst, __src, 0x12BuLL);
    sub_18C2B8E44((uint64_t)__dst);
    return sub_18C2A68DC((uint64_t)__dst, v1);
  }
  return result;
}

uint64_t sub_18C2BD718()
{
  sub_18C2A68DC(v0, (uint64_t)v12);
  if (sub_18C2A6938((uint64_t)v12) == 1)
  {
    uint64_t v1 = (const void *)sub_18C2A6944((uint64_t)v12);
    memcpy(__dst, v1, 0x12BuLL);
    *(void *)&v8[0] = 0x6E696C69746C756DLL;
    *((void *)&v8[0] + 1) = 0xEB000000005B3A65;
    sub_18C2BF5B8(v0, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
    sub_18C2BD97C();
    sub_18C2CAA30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = sub_18C2A6944((uint64_t)v12);
    long long v3 = *(_OWORD *)(v2 + 112);
    __dst[6] = *(_OWORD *)(v2 + 96);
    __dst[7] = v3;
    __dst[8] = *(_OWORD *)(v2 + 128);
    LOBYTE(__dst[9]) = *(unsigned char *)(v2 + 144);
    long long v4 = *(_OWORD *)(v2 + 48);
    __dst[2] = *(_OWORD *)(v2 + 32);
    __dst[3] = v4;
    long long v5 = *(_OWORD *)(v2 + 80);
    __dst[4] = *(_OWORD *)(v2 + 64);
    __dst[5] = v5;
    long long v6 = *(_OWORD *)(v2 + 16);
    __dst[0] = *(_OWORD *)v2;
    __dst[1] = v6;
    uint64_t v10 = 0;
    unint64_t v11 = 0xE000000000000000;
    sub_18C2BF5B8(v0, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);
    sub_18C2CAA30();
    v8[6] = __dst[6];
    v8[7] = __dst[7];
    v8[8] = __dst[8];
    char v9 = __dst[9];
    v8[2] = __dst[2];
    v8[3] = __dst[3];
    v8[4] = __dst[4];
    v8[5] = __dst[5];
    v8[0] = __dst[0];
    v8[1] = __dst[1];
    sub_18C2CAC30();
  }
  sub_18C2CAA30();
  sub_18C2BF5B8(v0, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  sub_18C2CABF0();
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "NameStyle: { ");
  sub_18C2CAA30();
  swift_bridgeObjectRelease();
  sub_18C2CAA30();
  return *(void *)&v8[0];
}

uint64_t sub_18C2BD97C()
{
  return 0;
}

BOOL sub_18C2BDB6C(uint64_t a1)
{
  uint64_t v162 = a1;
  uint64_t v2 = sub_18C2CA840();
  uint64_t v164 = *(void *)(v2 - 8);
  uint64_t v165 = v2;
  MEMORY[0x1F4188790](v2);
  id v163 = (char *)&v136 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v4 = self;
  objc_msgSend(v4, sel_maximumHorizontalTextBounds);
  CGFloat Width = CGRectGetWidth(v257);
  objc_msgSend(v4, sel_minimumScaleFactor);
  double v160 = v5;
  char v6 = *((unsigned char *)v1 + 297);
  if ((v6 & 1) == 0)
  {
    if (*((unsigned char *)v1 + 298))
    {
      long long v37 = v1[6];
      long long v226 = v1[7];
      long long v227 = v1[8];
      char v228 = *((unsigned char *)v1 + 144);
      long long v38 = v1[3];
      long long v221 = v1[2];
      long long v222 = v38;
      long long v39 = v1[5];
      long long v223 = v1[4];
      long long v224 = v39;
      long long v225 = v37;
      long long v40 = v1[1];
      long long v219 = *v1;
      long long v220 = v40;
      uint64_t v35 = *((void *)&v219 + 1);
      uint64_t v36 = v219;
      char v31 = v221;
      char v34 = v228 & 1;
      uint64_t v7 = *((void *)&v219 + 1);
      uint64_t v166 = v219;
      long long v32 = (void *)*((void *)&v40 + 1);
      long long v33 = (void *)v40;
      id v157 = (id)*((void *)&v221 + 1);
      id v158 = (id)v40;
      uint64_t v149 = *((void *)&v221 + 1);
      uint64_t v150 = (void *)*((void *)&v40 + 1);
      int v138 = v221;
      long long v24 = (void *)*((void *)&v224 + 1);
      uint64_t v23 = v224;
      uint64_t v153 = *((void *)&v222 + 1);
      uint64_t v147 = (void *)*((void *)&v222 + 1);
      id v154 = (id)v222;
      uint64_t v148 = v222;
      uint64_t v151 = *((void *)&v223 + 1);
      uint64_t v155 = (void *)*((void *)&v223 + 1);
      uint64_t v152 = v223;
      uint64_t v156 = (void *)v223;
      uint64_t v26 = *((void *)&v37 + 1);
      uint64_t v25 = v37;
      uint64_t v145 = *((void *)&v224 + 1);
      uint64_t v146 = v224;
      uint64_t v143 = *((void *)&v37 + 1);
      uint64_t v144 = v37;
      uint64_t v28 = *((void *)&v226 + 1);
      uint64_t v141 = (void *)*((void *)&v226 + 1);
      uint64_t v27 = v226;
      uint64_t v142 = v226;
      uint64_t v30 = *((void *)&v227 + 1);
      uint64_t v139 = *((void *)&v227 + 1);
      uint64_t v29 = v227;
      char v140 = (void *)v227;
      int v137 = v228 & 1;
      goto LABEL_6;
    }
LABEL_8:
    long long v70 = v1[6];
    long long v226 = v1[7];
    long long v227 = v1[8];
    char v228 = *((unsigned char *)v1 + 144);
    long long v71 = v1[3];
    long long v221 = v1[2];
    long long v222 = v71;
    long long v72 = v1[5];
    long long v223 = v1[4];
    long long v224 = v72;
    long long v225 = v70;
    long long v73 = v1[1];
    long long v219 = *v1;
    long long v220 = v73;
    long long v74 = *(long long *)((char *)v1 + 264);
    long long v75 = *(long long *)((char *)v1 + 280);
    long long v215 = *(long long *)((char *)v1 + 248);
    long long v216 = v74;
    long long v217 = v75;
    char v218 = *((unsigned char *)v1 + 296);
    long long v76 = *(long long *)((char *)v1 + 200);
    long long v211 = *(long long *)((char *)v1 + 184);
    long long v212 = v76;
    long long v77 = *(long long *)((char *)v1 + 232);
    long long v213 = *(long long *)((char *)v1 + 216);
    long long v214 = v77;
    long long v78 = *(long long *)((char *)v1 + 168);
    long long v209 = *(long long *)((char *)v1 + 152);
    long long v210 = v78;
    uint64_t v155 = (void *)v222;
    uint64_t v156 = (void *)*((void *)&v221 + 1);
    id v154 = (id)*((void *)&v222 + 1);
    uint64_t v152 = *((void *)&v223 + 1);
    uint64_t v153 = v223;
    uint64_t v150 = (void *)*((void *)&v224 + 1);
    uint64_t v151 = v224;
    uint64_t v148 = *((void *)&v225 + 1);
    uint64_t v149 = v225;
    uint64_t v146 = *((void *)&v226 + 1);
    uint64_t v147 = (void *)v226;
    uint64_t v144 = *((void *)&v227 + 1);
    uint64_t v145 = v227;
    LODWORD(v142) = v221;
    id v157 = (id)*((void *)&v220 + 1);
    id v158 = (id)v220;
    uint64_t v159 = *((void *)&v219 + 1);
    uint64_t v166 = v219;
    LODWORD(v143) = v228 & 1;
    uint64_t v79 = *((void *)&v211 + 1);
    uint64_t v80 = (void *)*((void *)&v212 + 1);
    uint64_t v81 = v212;
    char v140 = (void *)*((void *)&v213 + 1);
    uint64_t v141 = (void *)v213;
    uint64_t v82 = *((void *)&v214 + 1);
    uint64_t v83 = v214;
    uint64_t v85 = *((void *)&v215 + 1);
    uint64_t v84 = v215;
    uint64_t v87 = (void *)*((void *)&v216 + 1);
    uint64_t v86 = v216;
    uint64_t v88 = *((void *)&v75 + 1);
    uint64_t v89 = (void *)v75;
    char v90 = v211;
    id v91 = (id)*((void *)&v78 + 1);
    id v92 = (id)v78;
    char v93 = v218 & 1;
    uint64_t v94 = *((void *)&v209 + 1);
    uint64_t v95 = v209;
    sub_18C2A716C(&v219);
    sub_18C2A716C(&v209);
    uint64_t v96 = v95;
    uint64_t v97 = v94;
    uint64_t v98 = v81;
    id v100 = v154;
    uint64_t v99 = v155;
    uint64_t v102 = v159;
    id v101 = v158;
    uint64_t v103 = v166;
    __int16 v104 = v156;
    id v105 = v157;
    uint64_t v106 = v140;
    long long v107 = v141;
    char v108 = v142;
    char v109 = v143;
    uint64_t v110 = v152;
    uint64_t v111 = v153;
    uint64_t v112 = v150;
    uint64_t v113 = v151;
    uint64_t v115 = v146;
    uint64_t v114 = (uint64_t)v147;
    uint64_t v117 = v148;
    uint64_t v116 = v149;
    uint64_t v118 = v144;
    uint64_t v119 = v145;
    goto LABEL_11;
  }
  if (*((unsigned char *)v1 + 298)) {
    goto LABEL_8;
  }
  uint64_t v7 = *((void *)v1 + 1);
  uint64_t v166 = *(void *)v1;
  id v158 = (id)*((void *)v1 + 2);
  long long v8 = (void *)*((void *)v1 + 3);
  char v9 = *((unsigned char *)v1 + 32);
  uint64_t v149 = *((void *)v1 + 5);
  uint64_t v150 = v8;
  uint64_t v10 = *((void *)v1 + 6);
  uint64_t v147 = (void *)*((void *)v1 + 7);
  uint64_t v148 = v10;
  unint64_t v11 = (void *)*((void *)v1 + 8);
  uint64_t v155 = (void *)*((void *)v1 + 9);
  uint64_t v156 = v11;
  uint64_t v12 = *((void *)v1 + 10);
  uint64_t v145 = *((void *)v1 + 11);
  uint64_t v146 = v12;
  uint64_t v13 = *((void *)v1 + 12);
  uint64_t v143 = *((void *)v1 + 13);
  uint64_t v144 = v13;
  uint64_t v14 = *((void *)v1 + 14);
  uint64_t v141 = (void *)*((void *)v1 + 15);
  uint64_t v142 = v14;
  long long v15 = (void *)*((void *)v1 + 16);
  uint64_t v139 = *((void *)v1 + 17);
  char v140 = v15;
  char v16 = *((unsigned char *)v1 + 144);
  long long v17 = *(long long *)((char *)v1 + 184);
  long long v18 = *(long long *)((char *)v1 + 248);
  long long v19 = *(long long *)((char *)v1 + 280);
  long long v226 = *(long long *)((char *)v1 + 264);
  long long v227 = v19;
  char v228 = *((unsigned char *)v1 + 296);
  long long v20 = *(long long *)((char *)v1 + 200);
  long long v221 = v17;
  long long v222 = v20;
  long long v21 = *(long long *)((char *)v1 + 232);
  long long v223 = *(long long *)((char *)v1 + 216);
  long long v224 = v21;
  long long v225 = v18;
  long long v22 = *(long long *)((char *)v1 + 168);
  long long v219 = *(long long *)((char *)v1 + 152);
  long long v220 = v22;
  id v157 = (id)*((void *)&v17 + 1);
  uint64_t v153 = *((void *)&v222 + 1);
  id v154 = (id)v222;
  uint64_t v151 = *((void *)&v223 + 1);
  uint64_t v152 = v223;
  long long v24 = (void *)*((void *)&v224 + 1);
  uint64_t v23 = v224;
  uint64_t v26 = *((void *)&v18 + 1);
  uint64_t v25 = v18;
  uint64_t v28 = *((void *)&v226 + 1);
  uint64_t v27 = v226;
  uint64_t v30 = *((void *)&v19 + 1);
  uint64_t v29 = v19;
  char v31 = v17;
  long long v32 = (void *)*((void *)&v22 + 1);
  long long v33 = (void *)v22;
  char v34 = v228 & 1;
  int v137 = v16 & 1;
  int v138 = v9 & 1;
  uint64_t v35 = *((void *)&v219 + 1);
  uint64_t v36 = v219;
LABEL_6:
  sub_18C2A716C(&v219);
  uint64_t v186 = v36;
  uint64_t v187 = v35;
  id v188 = v33;
  uint64_t v189 = v32;
  char v190 = v31;
  id v191 = v157;
  id v192 = v154;
  uint64_t v193 = v153;
  uint64_t v194 = v152;
  uint64_t v195 = v151;
  uint64_t v196 = v23;
  v197 = v24;
  uint64_t v198 = v25;
  uint64_t v199 = v26;
  uint64_t v200 = v27;
  uint64_t v201 = v28;
  uint64_t v202 = v29;
  uint64_t v203 = v30;
  char v204 = v34;
  swift_bridgeObjectRetain();
  id v41 = v158;
  id v42 = v32;
  sub_18C2A73A0((uint64_t)&v186);
  swift_bridgeObjectRetain();
  id v43 = v42;
  uint64_t v44 = v166;
  sub_18C2A911C(v166, v7, v43, (uint64_t)v205);
  long long v45 = *(long long *)((char *)v1 + 264);
  long long v46 = *(long long *)((char *)v1 + 280);
  long long v215 = *(long long *)((char *)v1 + 248);
  long long v216 = v45;
  long long v217 = v46;
  char v218 = *((unsigned char *)v1 + 296);
  long long v47 = *(long long *)((char *)v1 + 200);
  long long v211 = *(long long *)((char *)v1 + 184);
  long long v212 = v47;
  long long v48 = *(long long *)((char *)v1 + 232);
  long long v213 = *(long long *)((char *)v1 + 216);
  long long v214 = v48;
  long long v49 = *(long long *)((char *)v1 + 168);
  long long v209 = *(long long *)((char *)v1 + 152);
  long long v210 = v49;
  uint64_t v50 = *((void *)&v209 + 1);
  uint64_t v51 = v209;
  id v154 = (id)v49;
  id v158 = v41;
  uint64_t v159 = v7;
  id v157 = v43;
  if (v6)
  {
    uint64_t v52 = *((void *)&v211 + 1);
    int v53 = (void *)*((void *)&v212 + 1);
    uint64_t v54 = v212;
    uint64_t v155 = (void *)*((void *)&v213 + 1);
    uint64_t v156 = (void *)v213;
    uint64_t v56 = *((void *)&v214 + 1);
    uint64_t v55 = v214;
    uint64_t v58 = *((void *)&v215 + 1);
    uint64_t v57 = v215;
    uint64_t v60 = (void *)*((void *)&v216 + 1);
    uint64_t v59 = v216;
    uint64_t v62 = *((void *)&v217 + 1);
    uint64_t v61 = (void *)v217;
    char v63 = v211;
    char v64 = v218 & 1;
    uint64_t v65 = (void *)*((void *)&v210 + 1);
    sub_18C2A716C(&v209);
    uint64_t v66 = v51;
    uint64_t v67 = v50;
    id v68 = v154;
    uint64_t v69 = v50;
  }
  else
  {
    uint64_t v167 = v44;
    uint64_t v168 = v7;
    uint64_t v52 = v149;
    uint64_t v65 = v150;
    id v169 = v41;
    id v170 = v150;
    uint64_t v153 = v209;
    char v120 = v138;
    char v171 = v138;
    int v53 = v147;
    uint64_t v54 = v148;
    uint64_t v172 = v149;
    uint64_t v173 = v148;
    uint64_t v174 = v147;
    uint64_t v175 = v156;
    uint64_t v176 = v155;
    uint64_t v56 = v145;
    uint64_t v55 = v146;
    uint64_t v177 = v146;
    uint64_t v178 = v145;
    uint64_t v58 = v143;
    uint64_t v57 = v144;
    uint64_t v179 = v144;
    uint64_t v180 = v143;
    uint64_t v60 = v141;
    uint64_t v59 = v142;
    uint64_t v181 = v142;
    uint64_t v182 = v141;
    uint64_t v62 = v139;
    uint64_t v61 = v140;
    uint64_t v183 = v140;
    uint64_t v184 = v139;
    uint64_t v152 = *((void *)&v209 + 1);
    char v121 = v137;
    char v185 = v137;
    sub_18C2A716C(&v167);
    uint64_t v66 = v44;
    char v63 = v120;
    uint64_t v67 = v7;
    char v64 = v121;
    id v68 = v41;
    uint64_t v69 = v152;
    uint64_t v51 = v153;
  }
  uint64_t v167 = v66;
  uint64_t v168 = v67;
  id v169 = v68;
  id v170 = v65;
  char v171 = v63;
  uint64_t v172 = v52;
  uint64_t v173 = v54;
  uint64_t v174 = v53;
  uint64_t v175 = v156;
  uint64_t v176 = v155;
  uint64_t v177 = v55;
  uint64_t v178 = v56;
  uint64_t v179 = v57;
  uint64_t v180 = v58;
  uint64_t v181 = v59;
  uint64_t v182 = v60;
  uint64_t v183 = v61;
  uint64_t v184 = v62;
  char v185 = v64;
  swift_bridgeObjectRetain();
  id v92 = v154;
  id v122 = v65;
  sub_18C2A73A0((uint64_t)&v167);
  swift_bridgeObjectRetain();
  id v91 = v122;
  sub_18C2A911C(v51, v69, v91, (uint64_t)v207);
  char v108 = 0;
  char v90 = 0;
  char v109 = v206;
  uint64_t v118 = v205[12];
  uint64_t v119 = v205[11];
  uint64_t v116 = v205[7];
  uint64_t v117 = v205[8];
  uint64_t v114 = v205[9];
  uint64_t v115 = v205[10];
  uint64_t v112 = (void *)v205[6];
  uint64_t v113 = v205[5];
  uint64_t v110 = v205[4];
  uint64_t v111 = v205[3];
  id v100 = (id)v205[2];
  __int16 v104 = (void *)v205[0];
  uint64_t v97 = v69;
  uint64_t v99 = (void *)v205[1];
  uint64_t v96 = v51;
  char v93 = v208;
  uint64_t v88 = v207[12];
  uint64_t v89 = (void *)v207[11];
  uint64_t v84 = v207[7];
  uint64_t v85 = v207[8];
  uint64_t v86 = v207[9];
  uint64_t v87 = (void *)v207[10];
  uint64_t v82 = v207[6];
  uint64_t v83 = v207[5];
  uint64_t v106 = (void *)v207[4];
  long long v107 = (void *)v207[3];
  uint64_t v80 = (void *)v207[2];
  uint64_t v79 = v207[0];
  uint64_t v98 = v207[1];
  uint64_t v103 = v166;
  uint64_t v102 = v159;
  id v101 = v158;
  id v105 = v157;
LABEL_11:
  uint64_t v229 = v79;
  uint64_t v230 = v98;
  CGFloat v231 = v80;
  double v232 = v107;
  CGFloat v233 = v106;
  uint64_t v234 = v83;
  uint64_t v235 = v82;
  uint64_t v236 = v84;
  uint64_t v237 = v85;
  uint64_t v238 = v86;
  uint64_t v239 = v87;
  int v240 = v89;
  uint64_t v241 = v88;
  char v242 = v93;
  uint64_t v167 = v96;
  uint64_t v168 = v97;
  id v169 = v92;
  id v170 = v91;
  char v171 = v90;
  uint64_t v172 = v79;
  uint64_t v173 = v98;
  uint64_t v174 = v80;
  uint64_t v175 = v107;
  uint64_t v176 = v106;
  uint64_t v177 = v83;
  uint64_t v178 = v82;
  uint64_t v179 = v84;
  uint64_t v180 = v85;
  uint64_t v181 = v86;
  uint64_t v182 = v87;
  uint64_t v183 = v89;
  uint64_t v184 = v88;
  char v185 = v93;
  uint64_t v243 = v104;
  uint64_t v244 = v99;
  id v245 = v100;
  uint64_t v246 = v111;
  uint64_t v247 = v110;
  uint64_t v248 = v113;
  uint64_t v249 = v112;
  uint64_t v250 = v116;
  uint64_t v251 = v117;
  uint64_t v252 = v114;
  uint64_t v253 = v115;
  uint64_t v254 = v119;
  uint64_t v255 = v118;
  char v256 = v109;
  uint64_t v186 = v103;
  uint64_t v187 = v102;
  id v188 = v101;
  uint64_t v189 = v105;
  char v190 = v108;
  id v191 = v104;
  id v192 = v99;
  uint64_t v193 = (uint64_t)v100;
  uint64_t v194 = v111;
  uint64_t v195 = v110;
  uint64_t v196 = v113;
  v197 = v112;
  uint64_t v198 = v116;
  uint64_t v199 = v117;
  uint64_t v200 = v114;
  uint64_t v201 = v115;
  uint64_t v202 = v119;
  uint64_t v203 = v118;
  char v204 = v109;
  swift_bridgeObjectRetain();
  id v123 = v100;
  uint64_t v125 = v162;
  uint64_t v124 = (uint64_t)v163;
  sub_18C2B1D74(v162);
  double v126 = v160;
  sub_18C2A83E0(v124, v160);
  double v128 = v127;

  swift_bridgeObjectRelease();
  uint64_t v129 = v165;
  uint64_t v130 = *(void (**)(uint64_t, uint64_t))(v164 + 8);
  v130(v124, v165);
  swift_bridgeObjectRetain();
  id v131 = v80;
  sub_18C2B1D74(v125);
  sub_18C2A83E0(v124, v126);
  double v133 = v132;
  sub_18C2A73A0((uint64_t)&v167);
  sub_18C2A73A0((uint64_t)&v186);

  swift_bridgeObjectRelease();
  v130(v124, v129);
  if (v128 > v133) {
    double v134 = v128;
  }
  else {
    double v134 = v133;
  }
  return v134 <= Width;
}

uint64_t sub_18C2BE490()
{
  sub_18C2A68DC(v0, (uint64_t)&v2);
  return sub_18C2BD718();
}

unint64_t sub_18C2BE4C8()
{
  return 0xD00000000000001BLL;
}

void *sub_18C2BE5E4@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_18C2BE604(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_18C2BE610()
{
  return sub_18C2BE4C8();
}

uint64_t sub_18C2BE61C(void *a1)
{
  sub_18C2A68DC(v1, (uint64_t)v60);
  sub_18C2A68DC((uint64_t)v60, (uint64_t)v61);
  if (sub_18C2A6938((uint64_t)v61) == 1)
  {
    sub_18C2A6944((uint64_t)v61);
LABEL_4:
    uint64_t v13 = v60;
    goto LABEL_6;
  }
  uint64_t v3 = sub_18C2A6944((uint64_t)v61);
  long long v4 = *(_OWORD *)(v3 + 16);
  v57[0] = *(_OWORD *)v3;
  v57[1] = v4;
  long long v5 = *(_OWORD *)(v3 + 64);
  long long v7 = *(_OWORD *)(v3 + 32);
  long long v6 = *(_OWORD *)(v3 + 48);
  v57[5] = *(_OWORD *)(v3 + 80);
  v57[4] = v5;
  v57[2] = v7;
  v57[3] = v6;
  long long v9 = *(_OWORD *)(v3 + 112);
  long long v8 = *(_OWORD *)(v3 + 128);
  long long v10 = *(_OWORD *)(v3 + 96);
  char v58 = *(unsigned char *)(v3 + 144);
  v57[8] = v8;
  v57[6] = v10;
  v57[7] = v9;
  nullsub_1(v57);
  sub_18C2A7C4C((uint64_t)v57, (uint64_t)v54, &qword_1E916CD40);
  unint64_t v11 = v55;
  id v12 = a1;
  sub_18C2BF5B8((uint64_t)v60, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2B94B0);

  id v55 = v12;
  sub_18C2A7C4C((uint64_t)v54, (uint64_t)v39, &qword_1E916CD40);
  sub_18C2A7C4C((uint64_t)v39, (uint64_t)&v40, &qword_1E916CD40);
  if (sub_18C2A7154((uint64_t)&v40) == 1) {
    goto LABEL_4;
  }
  sub_18C2BF5B8((uint64_t)v60, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2A6BB8);
  v52[6] = v46;
  v52[7] = v47;
  v52[8] = v48;
  char v53 = v49;
  v52[2] = v42;
  v52[3] = v43;
  v52[4] = v44;
  v52[5] = v45;
  v52[0] = v40;
  v52[1] = v41;
  sub_18C2B8E8C((uint64_t)v52);
  sub_18C2A68DC((uint64_t)v52, v1);
  uint64_t v13 = v52;
LABEL_6:
  sub_18C2A68DC((uint64_t)v13, (uint64_t)v59);
  sub_18C2A68DC((uint64_t)v59, (uint64_t)v52);
  if (sub_18C2A6938((uint64_t)v52) == 1)
  {
    uint64_t v14 = sub_18C2A6944((uint64_t)v52);
    long long v15 = *(_OWORD *)(v14 + 16);
    long long v40 = *(_OWORD *)v14;
    long long v41 = v15;
    long long v16 = *(_OWORD *)(v14 + 80);
    long long v18 = *(_OWORD *)(v14 + 32);
    long long v17 = *(_OWORD *)(v14 + 48);
    long long v44 = *(_OWORD *)(v14 + 64);
    long long v45 = v16;
    long long v42 = v18;
    long long v43 = v17;
    long long v20 = *(_OWORD *)(v14 + 112);
    long long v19 = *(_OWORD *)(v14 + 128);
    long long v21 = *(_OWORD *)(v14 + 96);
    char v49 = *(unsigned char *)(v14 + 144);
    long long v47 = v20;
    long long v48 = v19;
    long long v46 = v21;
    nullsub_1(&v40);
    sub_18C2A7C4C((uint64_t)&v40, (uint64_t)v50, &qword_1E916CD40);
    long long v22 = v51;
    id v23 = a1;
    sub_18C2A716C((void *)v14);

    id v51 = v23;
    sub_18C2A7C4C((uint64_t)v50, (uint64_t)v57, &qword_1E916CD40);
    sub_18C2BD1A0((uint64_t)v57);
  }
  else
  {
    sub_18C2A6944((uint64_t)v52);
  }
  sub_18C2A68DC(v1, (uint64_t)v39);
  sub_18C2A68DC((uint64_t)v39, (uint64_t)&v40);
  if (sub_18C2A6938((uint64_t)&v40) != 1) {
    return sub_18C2A6944((uint64_t)&v40);
  }
  uint64_t v24 = sub_18C2A6944((uint64_t)&v40);
  long long v25 = *(_OWORD *)(v24 + 248);
  uint64_t v26 = (void *)(v24 + 152);
  long long v27 = *(_OWORD *)(v24 + 200);
  _OWORD v35[2] = *(_OWORD *)(v24 + 184);
  v35[3] = v27;
  long long v28 = *(_OWORD *)(v24 + 232);
  v35[4] = *(_OWORD *)(v24 + 216);
  v35[5] = v28;
  long long v29 = *(_OWORD *)(v24 + 168);
  v35[0] = *(_OWORD *)(v24 + 152);
  v35[1] = v29;
  long long v30 = *(_OWORD *)(v24 + 264);
  long long v31 = *(_OWORD *)(v24 + 280);
  v35[6] = v25;
  v35[7] = v30;
  char v36 = *(unsigned char *)(v24 + 296);
  v35[8] = v31;
  nullsub_1(v35);
  sub_18C2A7C4C((uint64_t)v35, (uint64_t)v37, &qword_1E916CD40);
  long long v32 = v38;
  id v33 = a1;
  sub_18C2A716C(v26);

  id v38 = v33;
  sub_18C2A7C4C((uint64_t)v37, (uint64_t)v56, &qword_1E916CD40);
  return sub_18C2BD464((uint64_t)v56);
}

uint64_t sub_18C2BE95C@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v10 = objc_msgSend(self, sel_posterNameComponentsForContact_, a1);
  id v11 = objc_msgSend(v10, sel_secondNameComponent);
  if (!v11) {
    goto LABEL_4;
  }
  id v12 = v11;
  uint64_t v13 = sub_18C2CAA00();
  unint64_t v15 = v14;

  if (a4) {
    goto LABEL_3;
  }
  id v17 = objc_msgSend(v10, sel_firstNameComponent);
  uint64_t v18 = sub_18C2CAA00();
  unint64_t v20 = v19;

  swift_bridgeObjectRelease();
  uint64_t v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
  }
  if (!v21) {
    goto LABEL_3;
  }
  uint64_t v22 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v22 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (!v22) {
    goto LABEL_3;
  }
  id v23 = objc_msgSend(v10, sel_singleNameComponentIndex);
  if (v23)
  {
    if (v23 == (id)1)
    {
      char v24 = 1;
      goto LABEL_16;
    }
LABEL_3:
    swift_bridgeObjectRelease();
LABEL_4:

    sub_18C2BF70C(&v112);
    goto LABEL_5;
  }
  char v24 = 0;
LABEL_16:
  uint64_t v25 = sub_18C2CAB10();
  uint64_t v107 = v13;
  if (v26)
  {
LABEL_19:
    char v105 = v24;
    char v27 = 1;
    goto LABEL_21;
  }
  if (v25)
  {
    if (v25 == 1) {
      goto LABEL_19;
    }
    goto LABEL_3;
  }
  char v105 = v24;
  char v27 = 0;
LABEL_21:
  id v28 = objc_msgSend(v10, sel_firstNameComponent);
  sub_18C2CAA00();

  long long v29 = (void *)sub_18C2CA9D0();
  char IsSuitableForArabicJustification = CTStringIsSuitableForArabicJustification();
  swift_bridgeObjectRelease();

  if ((IsSuitableForArabicJustification & 1) != 0
    || (long long v31 = (void *)sub_18C2CA9D0(), v32 = CTStringIsSuitableForArabicJustification(), v31, v32))
  {
    char v105 = 0;
    char v27 = 0;
  }
  char v102 = v27;
  uint64_t v98 = self;
  objc_msgSend(v98, sel_defaultSecondaryNameFontSize);
  id v33 = objc_msgSend(a3, sel_fontWithSize_);
  id v34 = objc_msgSend(v10, sel_firstNameComponent);
  uint64_t v35 = sub_18C2CAA00();
  uint64_t v37 = v36;

  id v38 = v33;
  id v39 = a2;
  swift_bridgeObjectRetain();
  uint64_t v106 = v35;
  sub_18C2A911C(v35, v37, v38, (uint64_t)&v144);
  uint64_t v83 = v144;
  long long v95 = v145;
  uint64_t v40 = v146;
  uint64_t v41 = v147;
  uint64_t v91 = v149;
  uint64_t v93 = v148;
  uint64_t v88 = v151;
  uint64_t v89 = v150;
  uint64_t v86 = v153;
  uint64_t v87 = v152;
  uint64_t v84 = v155;
  uint64_t v85 = v154;
  char v82 = v156;
  id v42 = v38;
  swift_bridgeObjectRetain_n();
  id v43 = v42;
  id v101 = v39;
  swift_bridgeObjectRetain();
  sub_18C2A911C(v107, v15, v43, (uint64_t)&v157);
  uint64_t v72 = v157;
  long long v80 = v158;
  uint64_t v44 = v160;
  uint64_t v78 = v159;
  uint64_t v45 = v161;
  uint64_t v46 = v162;
  uint64_t v47 = v163;
  uint64_t v48 = v164;
  uint64_t v49 = v165;
  uint64_t v74 = v167;
  uint64_t v76 = v166;
  uint64_t v73 = v168;
  char v71 = v169;
  swift_bridgeObjectRetain();
  uint64_t v50 = v37;
  swift_bridgeObjectRelease();
  uint64_t v97 = v37;
  if (v102)
  {
    id v51 = v43;
    uint64_t v52 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
    char v53 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v98, sel_idealEmphasizedFontSizeForHorizontalName_nonEmphasizedText_nonEmphasizedFont_emphasizedNameIsTopName_, v52, v53, v51, 0);
    uint64_t v54 = v40;
    double v56 = v55;

    id v57 = objc_msgSend(a3, sel_fontWithSize_, v56);
    swift_bridgeObjectRetain();
    id v58 = v57;
    sub_18C2A911C(v107, v15, v58, (uint64_t)&v170);
    uint64_t v75 = v170;
    long long v79 = v173;
    long long v81 = v172;
    long long v77 = v174;
    long long v103 = v175;
    uint64_t v59 = v41;
    uint64_t v60 = v176;
    uint64_t v61 = v177;
    char v99 = v178;
    sub_18C2A9538((uint64_t)&v157);

    *(_DWORD *)uint64_t v116 = *(_DWORD *)v110;
    *(_DWORD *)&v116[3] = *(_DWORD *)&v110[3];
    *(_DWORD *)double v132 = *(_DWORD *)v108;
    *(_DWORD *)&v132[3] = *(_DWORD *)&v108[3];
    *(void *)&long long v112 = v106;
    *((void *)&v112 + 1) = v37;
    id v113 = v101;
    id v114 = v51;
    char v115 = 0;
    uint64_t v117 = v83;
    long long v118 = v95;
    *(void *)&long long v119 = v54;
    *((void *)&v119 + 1) = v59;
    *(void *)&long long v120 = v93;
    *((void *)&v120 + 1) = v91;
    *(void *)&long long v121 = v89;
    *((void *)&v121 + 1) = v88;
    *(void *)&long long v122 = v87;
    *((void *)&v122 + 1) = v86;
    uint64_t v123 = v85;
    uint64_t v124 = v84;
    char v125 = v82;
    *(_DWORD *)&v126[3] = *(_DWORD *)&v109[3];
    *(_DWORD *)double v126 = *(_DWORD *)v109;
    uint64_t v127 = v107;
    unint64_t v128 = v15;
    id v129 = v101;
    id v130 = v58;
    char v131 = 0;
    uint64_t v133 = v75;
    long long v134 = v171;
    long long v135 = v81;
    long long v136 = v79;
    long long v137 = v77;
    long long v138 = v103;
    uint64_t v139 = v60;
    uint64_t v140 = v61;
    char v141 = v99;
    char v142 = 1;
  }
  else
  {
    uint64_t v62 = v43;
    char v63 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
    char v64 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v98, sel_idealEmphasizedFontSizeForHorizontalName_nonEmphasizedText_nonEmphasizedFont_emphasizedNameIsTopName_, v63, v64, v62, 1);
    double v66 = v65;

    id v67 = objc_msgSend(a3, sel_fontWithSize_, v66);
    swift_bridgeObjectRetain();
    id v68 = v67;
    sub_18C2A911C(v35, v50, v68, (uint64_t)&v170);
    uint64_t v90 = v170;
    long long v104 = v172;
    *(_OWORD *)id v100 = v173;
    long long v94 = v175;
    long long v96 = v174;
    uint64_t v69 = v176;
    uint64_t v70 = v177;
    char v92 = v178;
    sub_18C2A9538((uint64_t)&v144);

    *(_DWORD *)uint64_t v116 = *(_DWORD *)v108;
    *(_DWORD *)&v116[3] = *(_DWORD *)&v108[3];
    *(void *)&long long v112 = v35;
    *((void *)&v112 + 1) = v97;
    id v113 = v101;
    id v114 = v68;
    char v115 = 0;
    uint64_t v117 = v90;
    long long v118 = v171;
    long long v119 = v104;
    long long v120 = *(_OWORD *)v100;
    long long v121 = v96;
    long long v122 = v94;
    uint64_t v123 = v69;
    uint64_t v124 = v70;
    char v125 = v92;
    *(_DWORD *)&v126[3] = *(_DWORD *)&v109[3];
    *(_DWORD *)double v126 = *(_DWORD *)v109;
    uint64_t v127 = v107;
    unint64_t v128 = v15;
    id v129 = v101;
    id v130 = v62;
    char v131 = 0;
    *(_DWORD *)&v132[3] = *(_DWORD *)&v111[3];
    *(_DWORD *)double v132 = *(_DWORD *)v111;
    uint64_t v133 = v72;
    long long v134 = v80;
    *(void *)&long long v135 = v78;
    *((void *)&v135 + 1) = v44;
    *(void *)&long long v136 = v45;
    *((void *)&v136 + 1) = v46;
    *(void *)&long long v137 = v47;
    *((void *)&v137 + 1) = v48;
    *(void *)&long long v138 = v49;
    *((void *)&v138 + 1) = v76;
    uint64_t v139 = v74;
    uint64_t v140 = v73;
    char v141 = v71;
    char v142 = 0;
  }
  char v143 = v105;
  nullsub_1(&v112);
LABEL_5:
  sub_18C2A7C4C((uint64_t)&v112, (uint64_t)v179, (uint64_t *)&unk_1E916CA10);
  return sub_18C2A7C4C((uint64_t)v179, a5, (uint64_t *)&unk_1E916CA10);
}

uint64_t sub_18C2BF178@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  sub_18C2BE95C(v7, v8, v9, 0, (uint64_t)v44);
  sub_18C2A7C4C((uint64_t)v44, (uint64_t)__src, (uint64_t *)&unk_1E916CA10);
  if (sub_18C2A7154((uint64_t)__src) == 1)
  {
    id v10 = objc_msgSend(self, sel_posterNameComponentsForContact_, v7);
    id v11 = objc_msgSend(v10, sel_firstNameComponent);

    uint64_t v12 = sub_18C2CAA00();
    uint64_t v14 = v13;

LABEL_11:
    char v24 = (void *)sub_18C2CA9D0();
    unsigned int IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();

    uint64_t v26 = IsSuitableForVerticalLayout;
    char v27 = self;
    id v28 = (void *)sub_18C2CA9D0();
    objc_msgSend(v27, sel_idealEmphasizedFontSizeForName_usingLayout_, v28, v26);
    double v30 = v29;

    id v31 = objc_msgSend(v9, sel_fontWithSize_, v30);
    swift_bridgeObjectRetain();
    id v32 = v31;
    sub_18C2A911C(v12, v14, v32, (uint64_t)&v45);
    uint64_t v33 = v45;
    LOBYTE(v28) = v52;

    *(_DWORD *)((char *)&v43[2] + 1) = *(_DWORD *)v42;
    DWORD1(v43[2]) = *(_DWORD *)&v42[3];
    *(void *)&v43[0] = v12;
    *((void *)&v43[0] + 1) = v14;
    *(void *)&v43[1] = v8;
    *((void *)&v43[1] + 1) = v32;
    LOBYTE(v43[2]) = 0;
    *((void *)&v43[2] + 1) = v33;
    v43[3] = v46;
    void v43[4] = v47;
    v43[5] = v48;
    v43[6] = v49;
    v43[7] = v50;
    v43[8] = v51;
    LOBYTE(v43[9]) = (_BYTE)v28;
    sub_18C2B8E8C((uint64_t)v43);
    unint64_t v15 = v43;
    goto LABEL_12;
  }
  memcpy(__dst, __src, 0x12BuLL);
  memcpy(v43, __src, 0x12BuLL);
  if (!sub_18C2BDB6C(0))
  {
    id v16 = objc_msgSend(self, sel_stringFromContact_style_, v7, 0);
    if (v16)
    {
      id v17 = v16;
      uint64_t v12 = sub_18C2CAA00();
      uint64_t v14 = v18;

      sub_18C2BF5B8((uint64_t)v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2BF654);
    }
    else
    {
      if (BYTE10(__dst[18]))
      {
        v41[2] = *(_OWORD *)((char *)&__dst[11] + 8);
        v41[3] = *(_OWORD *)((char *)&__dst[12] + 8);
        v41[4] = *(_OWORD *)((char *)&__dst[13] + 8);
        v41[5] = *(_OWORD *)((char *)&__dst[14] + 8);
        v41[0] = *(_OWORD *)((char *)&__dst[9] + 8);
        v41[1] = *(_OWORD *)((char *)&__dst[10] + 8);
        v41[6] = *(_OWORD *)((char *)&__dst[15] + 8);
        v41[7] = *(_OWORD *)((char *)&__dst[16] + 8);
        LOBYTE(v41[9]) = BYTE8(__dst[18]);
        v41[8] = *(_OWORD *)((char *)&__dst[17] + 8);
      }
      else
      {
        v41[6] = __dst[6];
        v41[7] = __dst[7];
        v41[8] = __dst[8];
        LOBYTE(v41[9]) = __dst[9];
        v41[2] = __dst[2];
        v41[3] = __dst[3];
        v41[4] = __dst[4];
        v41[5] = __dst[5];
        v41[0] = __dst[0];
        v41[1] = __dst[1];
      }
      uint64_t v19 = *((void *)&v41[2] + 1);
      long long v39 = v41[6];
      long long v40 = v41[5];
      long long v20 = v41[8];
      char v21 = v41[2];
      uint64_t v22 = *((void *)&v41[1] + 1);
      uint64_t v12 = *(void *)&v41[0];
      char v23 = v41[9] & 1;
      long long v37 = v41[4];
      long long v38 = v41[7];
      long long v35 = *(_OWORD *)((char *)v41 + 8);
      long long v36 = v41[3];
      sub_18C2A716C(v41);
      sub_18C2BF5B8((uint64_t)v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_18C2BF654);
      uint64_t v55 = v12;
      long long v56 = v35;
      uint64_t v57 = v22;
      char v58 = v21;
      uint64_t v59 = v19;
      long long v60 = v36;
      long long v61 = v37;
      long long v62 = v40;
      long long v63 = v39;
      long long v64 = v38;
      long long v65 = v20;
      uint64_t v14 = v35;
      char v66 = v23;
      swift_bridgeObjectRetain();
      sub_18C2A73A0((uint64_t)&v55);
    }
    goto LABEL_11;
  }

  memcpy(v41, v43, 0x12BuLL);
  sub_18C2B8E44((uint64_t)v41);
  unint64_t v15 = v41;
LABEL_12:
  sub_18C2A68DC((uint64_t)v15, (uint64_t)&v55);
  return sub_18C2A68DC((uint64_t)&v55, a4);
}

uint64_t sub_18C2BF5B8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))
{
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  long long v5 = *(_OWORD *)(a1 + 240);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    *(void *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
  return a1;
}

void sub_18C2BF654(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

double sub_18C2BF70C(_OWORD *a1)
{
  double result = 0.0;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 283) = 0u;
  return result;
}

void *sub_18C2BF740(void *a1)
{
  char v2 = (void *)a1[2];
  uint64_t v3 = (void *)a1[3];
  long long v4 = (void *)a1[7];
  long long v5 = (void *)a1[21];
  long long v6 = (void *)a1[22];
  long long v7 = (void *)a1[26];
  swift_bridgeObjectRetain();
  id v8 = v2;
  id v9 = v3;
  swift_bridgeObjectRetain();
  id v10 = v4;
  swift_bridgeObjectRetain();
  id v11 = v5;
  id v12 = v6;
  swift_bridgeObjectRetain();
  id v13 = v7;
  return a1;
}

uint64_t sub_18C2BF7D0(uint64_t a1)
{
  char v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  long long v4 = *(void **)(a1 + 56);
  long long v5 = *(void **)(a1 + 168);
  long long v6 = *(void **)(a1 + 176);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *_s10NameFormatV13NameComponentOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *double result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x18C2BF930);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s10NameFormatV13NameComponentOMa()
{
  return &_s10NameFormatV13NameComponentON;
}

void _s10NameFormatVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  char v2 = *(void **)(a1 + 208);
}

uint64_t _s10NameFormatVwcp(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v5 = (void *)a2[2];
  unsigned int v6 = (void *)a2[3];
  char v7 = *((unsigned char *)a2 + 32);
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  id v10 = (void *)a2[7];
  long long v11 = *((_OWORD *)a2 + 5);
  *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
  *(_OWORD *)(a1 + 80) = v11;
  uint64_t v13 = a2[19];
  id v12 = a2 + 19;
  long long v14 = *(_OWORD *)(v12 - 5);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v12 - 7);
  *(_OWORD *)(a1 + 112) = v14;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(v12 - 3);
  *(void *)(a1 + 152) = v13;
  long long v15 = *((_OWORD *)v12 + 5);
  *(_OWORD *)(a1 + 216) = *((_OWORD *)v12 + 4);
  *(_OWORD *)(a1 + 232) = v15;
  long long v16 = *((_OWORD *)v12 + 6);
  *(_OWORD *)(a1 + 264) = *((_OWORD *)v12 + 7);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 144) = *((unsigned char *)v12 - 8);
  id v17 = (void *)v12[2];
  *(void *)(a1 + 160) = v12[1];
  *(void *)(a1 + 168) = v17;
  uint64_t v18 = (void *)v12[3];
  *(void *)(a1 + 176) = v18;
  *(unsigned char *)(a1 + 184) = *((unsigned char *)v12 + 32);
  uint64_t v19 = v12[6];
  *(void *)(a1 + 192) = v12[5];
  *(void *)(a1 + 200) = v19;
  long long v20 = (void *)v12[7];
  *(void *)(a1 + 208) = v20;
  *(_OWORD *)(a1 + 248) = v16;
  uint64_t v21 = v12[17];
  *(void *)(a1 + 280) = v12[16];
  *(void *)(a1 + 288) = v21;
  *(unsigned char *)(a1 + 296) = *((unsigned char *)v12 + 144);
  *(unsigned char *)(a1 + 297) = *((unsigned char *)v12 + 145);
  *(unsigned char *)(a1 + 298) = *((unsigned char *)v12 + 146);
  swift_bridgeObjectRetain();
  id v22 = v5;
  id v23 = v6;
  swift_bridgeObjectRetain();
  id v24 = v10;
  swift_bridgeObjectRetain();
  id v25 = v17;
  id v26 = v18;
  swift_bridgeObjectRetain();
  id v27 = v20;
  return a1;
}

uint64_t _s10NameFormatVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 + 296;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a2 + 16);
  unsigned int v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  id v7 = v5;

  uint64_t v8 = *(void **)(a2 + 24);
  uint64_t v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  id v10 = v8;

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v11 = *(void **)(a2 + 56);
  id v12 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v11;
  id v13 = v11;

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v14 = *(void **)(a2 + 168);
  long long v15 = *(void **)(a1 + 168);
  *(void *)(a1 + 168) = v14;
  id v16 = v14;

  id v17 = *(void **)(a2 + 176);
  uint64_t v18 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = v17;
  id v19 = v17;

  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v20 = *(void **)(a2 + 208);
  uint64_t v21 = *(void **)(a1 + 208);
  *(void *)(a1 + 208) = v20;
  id v22 = v20;

  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(unsigned char *)(a1 + 297) = *(unsigned char *)(v4 + 1);
  *(unsigned char *)(a1 + 298) = *(unsigned char *)(v4 + 2);
  return a1;
}

uint64_t _s10NameFormatVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 + 296;
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  unsigned int v6 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a1 + 168);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);

  long long v11 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);

  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease();
  id v12 = *(void **)(a1 + 208);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);

  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(unsigned char *)(a1 + 297) = *(unsigned char *)(v4 + 1);
  *(unsigned char *)(a1 + 298) = *(unsigned char *)(v4 + 2);
  return a1;
}

uint64_t _s10NameFormatVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 299)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s10NameFormatVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 298) = 0;
    *(_WORD *)(result + 296) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 299) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 299) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s10NameFormatVMa()
{
  return &_s10NameFormatVN;
}

unint64_t sub_18C2BFF4C()
{
  unint64_t result = qword_1E91709F8;
  if (!qword_1E91709F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91709F8);
  }
  return result;
}

void destroy for MarqueeLabel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  id v6 = v3;
  swift_bridgeObjectRetain();
  id v7 = v4;
  id v8 = v5;
  return a1;
}

uint64_t assignWithCopy for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a2 + 32);
  id v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  id v10 = *(void **)(a1 + 40);
  long long v11 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v11;
  id v12 = v11;

  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarqueeLabel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 50)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarqueeLabel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 50) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 50) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel()
{
  return &type metadata for MarqueeLabel;
}

void sub_18C2C0244(void *a1)
{
  double v3 = *(double *)(v1 + 8);
  objc_msgSend(a1, sel_setMinimumScaleFactor_, v3);
  uint64_t v4 = *(void *)(v1 + 40);
  if (v4)
  {
    objc_msgSend(a1, sel_setAttributedText_, v4);
  }
  else
  {
    uint64_t v5 = (void *)sub_18C2CA9D0();
    objc_msgSend(a1, sel_setText_, v5);

    objc_msgSend(a1, sel_setTextColor_, *(void *)(v1 + 32));
  }
  id v6 = *(void **)v1;
  objc_msgSend(a1, sel_setFont_, *(void *)v1);
  objc_msgSend(v6, sel_pointSize);
  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)v6, v3 * v7, 0, 0);
  id v9 = (void *)sub_18C2CA9D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E916CE70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18C2DD530;
  long long v11 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  type metadata accessor for CTFont(0);
  *(void *)(inited + 64) = v12;
  *(void *)(inited + 40) = CopyWithAttributes;
  id v13 = v11;
  long long v14 = CopyWithAttributes;
  sub_18C2A9B58(inited);
  type metadata accessor for Key(0);
  sub_18C2C06C4();
  long long v15 = (void *)sub_18C2CA990();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_sizeWithAttributes_, v15);
  double v17 = v16;

  objc_msgSend(self, sel_maximumHorizontalTextBounds);
  if (CGRectGetWidth(v19) >= v17)
  {
    objc_msgSend(a1, sel_setMarqueeEnabled_, 0);
    objc_msgSend(a1, sel_setMarqueeRunning_, 0);
    uint64_t v18 = 0;
  }
  else
  {
    objc_msgSend(a1, sel_setMarqueeEnabled_, 1);
    objc_msgSend(a1, sel_setMarqueeRunning_, *(unsigned __int8 *)(v1 + 48));
    uint64_t v18 = *(unsigned __int8 *)(v1 + 49);
  }
  objc_msgSend(a1, sel__setMarqueeUpdatable_, v18);
}

id sub_18C2C046C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 1);
  LODWORD(v1) = 1132068864;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1144750080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v2);
  return v0;
}

uint64_t sub_18C2C0530()
{
  return sub_18C2CA720();
}

uint64_t sub_18C2C0574()
{
  return MEMORY[0x1E4F3F158];
}

uint64_t sub_18C2C0580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18C2C0670();
  return MEMORY[0x1F40F9EF0](a1, a2, a3, v6);
}

uint64_t sub_18C2C05E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18C2C0670();
  return MEMORY[0x1F40F9E78](a1, a2, a3, v6);
}

void sub_18C2C0648()
{
}

unint64_t sub_18C2C0670()
{
  unint64_t result = qword_1E916CCA0;
  if (!qword_1E916CCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CCA0);
  }
  return result;
}

unint64_t sub_18C2C06C4()
{
  unint64_t result = qword_1E916CDF8;
  if (!qword_1E916CDF8)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E916CDF8);
  }
  return result;
}

uint64_t sub_18C2C071C()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void NSStringFromPRPosterSnapshotDefinitionLayerSet_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"NSString * _Nonnull NSStringFromPRPosterSnapshotDefinitionLayerSet(PRPosterSnapshotDefinitionLayerSet)"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void NSStringFromPRPosterGalleryPresentationStyle_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"NSString * _Nullable NSStringFromPRPosterGalleryPresentationStyle(PRPosterGalleryPresentationStyle)"];
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = @"PRPosterDescriptorGalleryOptions.m";
  __int16 v6 = 1024;
  int v7 = 27;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

void NSStringFromPRPosterGalleryDisplayStyle_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"NSString * _Nullable NSStringFromPRPosterGalleryDisplayStyle(PRPosterGalleryDisplayStyle)"];
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = @"PRPosterDescriptorGalleryOptions.m";
  __int16 v6 = 1024;
  int v7 = 38;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

uint64_t sub_18C2CA310()
{
  return MEMORY[0x1F40E3370]();
}

uint64_t sub_18C2CA320()
{
  return MEMORY[0x1F40E33E8]();
}

uint64_t sub_18C2CA330()
{
  return MEMORY[0x1F40E3418]();
}

uint64_t sub_18C2CA340()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_18C2CA350()
{
  return MEMORY[0x1F40F7D18]();
}

uint64_t sub_18C2CA360()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_18C2CA370()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_18C2CA380()
{
  return MEMORY[0x1F40E3E20]();
}

uint64_t sub_18C2CA390()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_18C2CA3A0()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_18C2CA3B0()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_18C2CA3C0()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_18C2CA3D0()
{
  return MEMORY[0x1F40F7D50]();
}

uint64_t sub_18C2CA3E0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_18C2CA3F0()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_18C2CA400()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_18C2CA410()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_18C2CA420()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_18C2CA430()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_18C2CA440()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_18C2CA450()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_18C2CA460()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_18C2CA470()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_18C2CA480()
{
  return MEMORY[0x1F40E09B8]();
}

uint64_t sub_18C2CA490()
{
  return MEMORY[0x1F40E09C0]();
}

uint64_t sub_18C2CA4A0()
{
  return MEMORY[0x1F40E09E8]();
}

uint64_t sub_18C2CA4B0()
{
  return MEMORY[0x1F40E09F0]();
}

uint64_t sub_18C2CA4C0()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_18C2CA4D0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_18C2CA4E0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_18C2CA4F0()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_18C2CA500()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_18C2CA510()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_18C2CA520()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_18C2CA530()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_18C2CA540()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_18C2CA550()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_18C2CA560()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_18C2CA570()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_18C2CA580()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_18C2CA590()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_18C2CA5A0()
{
  return MEMORY[0x1F40F8420]();
}

uint64_t sub_18C2CA5B0()
{
  return MEMORY[0x1F40F8430]();
}

uint64_t sub_18C2CA5C0()
{
  return MEMORY[0x1F40F8438]();
}

uint64_t sub_18C2CA5D0()
{
  return MEMORY[0x1F40F8440]();
}

uint64_t sub_18C2CA5E0()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_18C2CA5F0()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_18C2CA600()
{
  return MEMORY[0x1F40F93C0]();
}

uint64_t sub_18C2CA610()
{
  return MEMORY[0x1F40F93D0]();
}

uint64_t sub_18C2CA620()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_18C2CA630()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_18C2CA640()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_18C2CA650()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_18C2CA660()
{
  return MEMORY[0x1F40F9860]();
}

uint64_t sub_18C2CA670()
{
  return MEMORY[0x1F40F9870]();
}

uint64_t sub_18C2CA680()
{
  return MEMORY[0x1F40F9878]();
}

uint64_t sub_18C2CA690()
{
  return MEMORY[0x1F40F9888]();
}

uint64_t sub_18C2CA6A0()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_18C2CA6B0()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_18C2CA6C0()
{
  return MEMORY[0x1F40F9DD8]();
}

uint64_t sub_18C2CA6D0()
{
  return MEMORY[0x1F40F9DE0]();
}

uint64_t sub_18C2CA6E0()
{
  return MEMORY[0x1F40F9E00]();
}

uint64_t sub_18C2CA6F0()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_18C2CA700()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_18C2CA710()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_18C2CA720()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_18C2CA740()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_18C2CA750()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_18C2CA760()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_18C2CA770()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_18C2CA780()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_18C2CA790()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_18C2CA7B0()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_18C2CA7C0()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_18C2CA7D0()
{
  return MEMORY[0x1F40FAC40]();
}

uint64_t sub_18C2CA7E0()
{
  return MEMORY[0x1F40FAC48]();
}

uint64_t sub_18C2CA7F0()
{
  return MEMORY[0x1F40FAC50]();
}

uint64_t sub_18C2CA800()
{
  return MEMORY[0x1F40FB180]();
}

uint64_t sub_18C2CA810()
{
  return MEMORY[0x1F40FB330]();
}

uint64_t sub_18C2CA820()
{
  return MEMORY[0x1F40FB340]();
}

uint64_t sub_18C2CA830()
{
  return MEMORY[0x1F40FB348]();
}

uint64_t sub_18C2CA840()
{
  return MEMORY[0x1F40FB350]();
}

uint64_t sub_18C2CA850()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_18C2CA860()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_18C2CA870()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_18C2CA880()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_18C2CA890()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_18C2CA8A0()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_18C2CA8B0()
{
  return MEMORY[0x1F40FB7E8]();
}

uint64_t sub_18C2CA8C0()
{
  return MEMORY[0x1F40FB8E8]();
}

uint64_t sub_18C2CA8D0()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_18C2CA8E0()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_18C2CA8F0()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_18C2CA900()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_18C2CA910()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_18C2CA920()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_18C2CA930()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_18C2CA940()
{
  return MEMORY[0x1F40FCC88]();
}

uint64_t sub_18C2CA950()
{
  return MEMORY[0x1F40FCCC0]();
}

uint64_t sub_18C2CA960()
{
  return MEMORY[0x1F40FCCE0]();
}

uint64_t sub_18C2CA970()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_18C2CA980()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_18C2CA990()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_18C2CA9A0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_18C2CA9B0()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_18C2CA9C0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_18C2CA9D0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_18C2CA9E0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_18C2CA9F0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_18C2CAA00()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_18C2CAA10()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_18C2CAA20()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_18C2CAA30()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_18C2CAA40()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_18C2CAA50()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_18C2CAA60()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_18C2CAA70()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_18C2CAA80()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_18C2CAA90()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_18C2CAAA0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_18C2CAAB0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_18C2CAAC0()
{
  return MEMORY[0x1F4166550]();
}

uint64_t sub_18C2CAAD0()
{
  return MEMORY[0x1F4166558]();
}

uint64_t sub_18C2CAAE0()
{
  return MEMORY[0x1F4166560]();
}

uint64_t sub_18C2CAAF0()
{
  return MEMORY[0x1F4166568]();
}

uint64_t sub_18C2CAB00()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_18C2CAB10()
{
  return MEMORY[0x1F40D6F48]();
}

uint64_t sub_18C2CAB20()
{
  return MEMORY[0x1F40D9728]();
}

uint64_t sub_18C2CAB30()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_18C2CAB40()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_18C2CAB50()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_18C2CAB60()
{
  return MEMORY[0x1F4166A68]();
}

uint64_t sub_18C2CAB70()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_18C2CAB80()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_18C2CAB90()
{
  return MEMORY[0x1F40E6C30]();
}

uint64_t sub_18C2CABA0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_18C2CABB0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_18C2CABC0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_18C2CABE0()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_18C2CABF0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_18C2CAC00()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_18C2CAC10()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_18C2CAC20()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_18C2CAC30()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_18C2CAC40()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_18C2CAC50()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_18C2CAC60()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_18C2CAC70()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_18C2CAC80()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_18C2CAC90()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_18C2CACB0()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_18C2CACC0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_18C2CACD0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_18C2CACE0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_18C2CACF0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_18C2CAD00()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_18C2CAD10()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_18C2CAD20()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_18C2CAD30()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AMUIAmbientDisplayStyleString()
{
  return MEMORY[0x1F41081C8]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x1F410C050]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchTimeWithInterval()
{
  return MEMORY[0x1F410C2C0]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualDoubles()
{
  return MEMORY[0x1F410C2E0]();
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

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1F410C340]();
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

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1F410C3A0]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1F410C4D0]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1F410C538]();
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

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1F410C5E8]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t BSSizeSwap()
{
  return MEMORY[0x1F410C638]();
}

uint64_t CABackingStoreCollectWithCompletionHandler()
{
  return MEMORY[0x1F40F4A40]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1F40F4BE8]();
}

uint64_t CARenderNotificationPostNotification()
{
  return MEMORY[0x1F40F4C30]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

uint64_t CEMGetSharedEmojiCharacterSet()
{
  return MEMORY[0x1F4113C80]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1F4113C88]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
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

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGFontCreateFontsWithURL()
{
  return MEMORY[0x1F40DA420]();
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0F0](path);
  result.size.double height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1F41117C0]();
}

uint64_t CHSWidgetFromATXComplication()
{
  return MEMORY[0x1F4108F18]();
}

uint64_t CSTimeNumberingSystemStringToType()
{
  return MEMORY[0x1F4116E40]();
}

uint64_t CTCopySampleStringForLanguage()
{
  return MEMORY[0x1F40DF268]();
}

CFTypeRef CTFontCopyAttribute(CTFontRef font, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF270](font, attribute);
}

CFArrayRef CTFontCopyDefaultCascadeListForLanguages(CTFontRef font, CFArrayRef languagePrefList)
{
  return (CFArrayRef)MEMORY[0x1F40DF288](font, languagePrefList);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DF2E8](font);
}

CFArrayRef CTFontCopySupportedLanguages(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1F40DF2F8](font);
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF318](font);
}

uint64_t CTFontCopyVariationAxesInternal()
{
  return MEMORY[0x1F40DF328]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1F40DF338](font, matrix, attributes, size);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1F40DF368](font, glyph, matrix);
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1F40DF388](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF398](name, matrix, options, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateMatchingFontDescriptorsWithOptions()
{
  return MEMORY[0x1F40DF400]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return MEMORY[0x1F40DF468](descriptors, mandatoryAttributes, progressBlock);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1F40DF510](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1F40DF7A0]();
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

uint64_t CTRunGetFont()
{
  return MEMORY[0x1F40DF8D0]();
}

uint64_t CTStringIsSuitableForArabicJustification()
{
  return MEMORY[0x1F40DF960]();
}

uint64_t CTStringIsSuitableForVerticalLayout()
{
  return MEMORY[0x1F40DF968]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

uint64_t NSStringFromBLSAdjustedLuminance()
{
  return MEMORY[0x1F410C0D0]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromFBSceneContentState()
{
  return MEMORY[0x1F4119F90]();
}

uint64_t NSStringFromPFServerPosterType()
{
  return MEMORY[0x1F4145C10]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

uint64_t PFCurrentDeviceClass()
{
  return MEMORY[0x1F4145C20]();
}

uint64_t PFPosterRoleDefaultRoleForCurrentExtensionProcess()
{
  return MEMORY[0x1F4145C48]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x1F4145C58]();
}

uint64_t PRSLogPosterContents()
{
  return MEMORY[0x1F4145B98]();
}

uint64_t PRSPosterSnapshotOptionsIsFloatingLayerOnly()
{
  return MEMORY[0x1F4145BA0]();
}

uint64_t PRSPosterUpdateAmbientWidgetsIdentifiers()
{
  return MEMORY[0x1F4145BA8]();
}

uint64_t PUIDynamicRotationIsActive()
{
  return MEMORY[0x1F4145D00]();
}

uint64_t PUIPosterBoundingShapeFromInt()
{
  return MEMORY[0x1F4145D20]();
}

uint64_t PUIPosterParallaxDesiredOverhangForDeviceClass()
{
  return MEMORY[0x1F4145D28]();
}

uint64_t PUIPosterParallaxRequiredOverhangForDeviceClass()
{
  return MEMORY[0x1F4145D30]();
}

uint64_t PUIRenderingContentIsPreview()
{
  return MEMORY[0x1F4145D48]();
}

uint64_t SBHIconDragItemWithIconAndIconView()
{
  return MEMORY[0x1F415BE58]();
}

uint64_t SBIconImageInfoEqualToIconImageInfo()
{
  return MEMORY[0x1F415BF20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4166B28]();
}

uint64_t UIApplicationSceneStringForUserInterfaceStyle()
{
  return MEMORY[0x1F4166B80]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4166CD8]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1F4178E10]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityContentSizeCategoryName()
{
  return MEMORY[0x1F4166F68]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1F4167078]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

long double nexttoward(long double __x, long double __y)
{
  MEMORY[0x1F40CD008](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}