void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21E653878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E6543B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id REUIActionsAlertProviderServerInterface()
{
  if (REUIActionsAlertProviderServerInterface_onceToken != -1) {
    dispatch_once(&REUIActionsAlertProviderServerInterface_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)REUIActionsAlertProviderServerInterface_interface;

  return v0;
}

void __REUIActionsAlertProviderServerInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFC8968];
  v1 = (void *)REUIActionsAlertProviderServerInterface_interface;
  REUIActionsAlertProviderServerInterface_interface = v0;

  v2 = (void *)REUIActionsAlertProviderServerInterface_interface;
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_displayAlertWithProperties_backgroundImageData_reply_ argumentIndex:0 ofReply:0];

  v4 = (void *)REUIActionsAlertProviderServerInterface_interface;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_displayAlertWithProperties_backgroundImageData_reply_ argumentIndex:1 ofReply:0];
}

id REUIActionsAlertProviderClientInterface()
{
  if (REUIActionsAlertProviderClientInterface_onceToken != -1) {
    dispatch_once(&REUIActionsAlertProviderClientInterface_onceToken, &__block_literal_global_49);
  }
  uint64_t v0 = (void *)REUIActionsAlertProviderClientInterface_interface;

  return v0;
}

uint64_t __REUIActionsAlertProviderClientInterface_block_invoke()
{
  REUIActionsAlertProviderClientInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFC89C8];

  return MEMORY[0x270F9A758]();
}

uint64_t REUINowPlayingPlaceholderAlbumArtwork()
{
  return 0;
}

id REUISampleRelevanceProviderForPosition(double a1)
{
  v2 = RELogForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21E651000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: Please consider using the new alternative method when generating a Sample Content RERelevanceProvider with position.", v6, 2u);
  }

  float v3 = a1;
  v4 = softRESampleRelevanceProviderForPosition(v3);

  return v4;
}

id softRESampleRelevanceProviderForPosition(float a1)
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void (*)(float))getRESampleRelevanceProviderForPositionSymbolLoc_ptr;
  v10 = getRESampleRelevanceProviderForPositionSymbolLoc_ptr;
  if (!getRESampleRelevanceProviderForPositionSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getRESampleRelevanceProviderForPositionSymbolLoc_block_invoke;
    v6[3] = &unk_2644B7CE0;
    v6[4] = &v7;
    __getRESampleRelevanceProviderForPositionSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void (*)(float))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v5 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  float v3 = v2(a1);

  return v3;
}

id REUISampleRelevanceProviderForSamplePosition(unint64_t a1)
{
  return REUISampleRelevanceProviderForSamplePositionWithPercentage(a1, 0.0);
}

id REUISampleRelevanceProviderForSamplePositionWithPercentage(unint64_t a1, double a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v4 = fmin(a2, 1.0);
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  if (v4 == 1.0) {
    double v5 = 0.99;
  }
  else {
    double v5 = v4;
  }
  if (v5 != a2)
  {
    v6 = RELogForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      double v11 = a2;
      __int16 v12 = 2048;
      double v13 = v5;
      _os_log_impl(&dword_21E651000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Your given percentage of %f is being clamped to %f; please stay within your bounds.",
        (uint8_t *)&v10,
        0x16u);
    }
  }
  float v7 = v5 + (double)a1;
  v8 = softRESampleRelevanceProviderForPosition(v7);

  return v8;
}

void *__getRESampleRelevanceProviderForPositionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __RelevanceEngineLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644B7D00;
    uint64_t v7 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
    float v3 = (void *)v5[0];
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary;
    if (RelevanceEngineLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      float v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "RESampleRelevanceProviderForPosition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRESampleRelevanceProviderForPositionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RelevanceEngineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary = result;
  return result;
}

double ClippingRadiusForDevice(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&ClippingRadiusForDevice___lock);
  id WeakRetained = objc_loadWeakRetained(&ClippingRadiusForDevice___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  float v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&ClippingRadiusForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&ClippingRadiusForDevice___cachedDevice, v1);
    ClippingRadiusForDevice___previousCLKDeviceVersion = [v1 version];

    __ClippingRadiusForDevice_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = ClippingRadiusForDevice___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&ClippingRadiusForDevice___lock);
  double v9 = *(double *)&ClippingRadiusForDevice__clippingRadius;

  return v9;
}

void __ClippingRadiusForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:3];
  v5[0] = &unk_26CF9ABB0;
  v5[1] = &unk_26CF9ABC8;
  v6[0] = &unk_26CF9ABE0;
  v6[1] = &unk_26CF9ABE0;
  float v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:3.0];
  ClippingRadiusForDevice__clippingRadius = v4;
}

void sub_21E65E214(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t RelevanceEngineLibraryCore()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0) {
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_0;
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getREIntentBySimplifyingParametersForIntentSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)RelevanceEngineLibrary();
  uint64_t result = dlsym(v2, "REIntentBySimplifyingParametersForIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t RelevanceEngineLibrary()
{
  uint64_t v0 = RelevanceEngineLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getREAppNameCacheClass_block_invoke(uint64_t a1)
{
  RelevanceEngineLibrary();
  Class result = objc_getClass("REAppNameCache");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREAppNameCacheClass_block_invoke_cold_1();
  }
  getREAppNameCacheClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREAppIconCacheClass_block_invoke(uint64_t a1)
{
  RelevanceEngineLibrary();
  Class result = objc_getClass("REAppIconCache");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getREAppIconCacheClass_block_invoke_cold_1();
  }
  getREAppIconCacheClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21E66109C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id REEncodeImage(void *a1)
{
  v16[7] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v15[0] = @"data";
    uint64_t v1 = a1;
    v2 = UIImagePNGRepresentation(v1);
    v16[0] = v2;
    v15[1] = @"scale";
    float v3 = NSNumber;
    [(UIImage *)v1 scale];
    uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
    v16[1] = v4;
    v15[2] = @"orientation";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIImage imageOrientation](v1, "imageOrientation"));
    v16[2] = v5;
    v15[3] = @"template";
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIImage renderingMode](v1, "renderingMode"));
    v16[3] = v6;
    v15[4] = @"capInsets";
    id v7 = (void *)MEMORY[0x263F08D40];
    [(UIImage *)v1 capInsets];
    uint64_t v8 = objc_msgSend(v7, "valueWithUIEdgeInsets:");
    v16[4] = v8;
    v15[5] = @"resizingMode";
    double v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIImage resizingMode](v1, "resizingMode"));
    v16[5] = v9;
    v15[6] = @"supressHairline";
    int v10 = NSNumber;
    uint64_t v11 = [(UIImage *)v1 _suppressesAccessibilityHairlineThickening];

    __int16 v12 = [v10 numberWithBool:v11];
    v16[6] = v12;
    double v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:7];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

id REDecodeImage(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    v2 = [v1 objectForKeyedSubscript:@"data"];
    float v3 = [v1 objectForKeyedSubscript:@"scale"];
    [v3 doubleValue];
    double v5 = v4;

    uint64_t v6 = [v1 objectForKeyedSubscript:@"orientation"];
    uint64_t v7 = [v6 unsignedIntegerValue];

    uint64_t v8 = [v1 objectForKeyedSubscript:@"template"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    int v10 = [v1 objectForKeyedSubscript:@"capInsets"];
    [v10 UIEdgeInsetsValue];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [v1 objectForKeyedSubscript:@"resizingMode"];
    uint64_t v20 = [v19 unsignedIntegerValue];

    v21 = [MEMORY[0x263F1C6B0] imageWithData:v2];
    v22 = (void *)MEMORY[0x263F1C6B0];
    id v23 = v21;
    v24 = objc_msgSend(v22, "imageWithCGImage:scale:orientation:", objc_msgSend(v23, "CGImage"), v7, v5);

    v25 = objc_msgSend(v24, "resizableImageWithCapInsets:resizingMode:", v20, v12, v14, v16, v18);

    v26 = [v1 objectForKeyedSubscript:@"supressHairline"];

    LODWORD(v1) = [v26 BOOLValue];
    if (v1)
    {
      uint64_t v27 = [v25 _imageThatSuppressesAccessibilityHairlineThickening];

      v25 = (void *)v27;
    }
    v28 = [v25 imageWithRenderingMode:v9];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

id REImageNamedFromBundle(void *a1, void *a2)
{
  float v3 = (void *)MEMORY[0x263EFD1F0];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 sharedRenderingContext];
  uint64_t v7 = [v6 device];
  uint64_t v8 = CLKUIImageNamedFromBundleForDevice();

  return v8;
}

id REUILocalizedString(void *a1)
{
  uint64_t v1 = REUILocalizedString_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&REUILocalizedString_onceToken, &__block_literal_global_4);
  }
  float v3 = [(id)REUILocalizedString_Bundle localizedStringForKey:v2 value:&stru_26CF96A58 table:@"RelevanceEngineUI"];

  return v3;
}

uint64_t __REUILocalizedString_block_invoke()
{
  REUILocalizedString_Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

uint64_t REApplicationTintColor()
{
  return 0;
}

id RELegibilityColorForContentColor(void *a1)
{
  [a1 _luminance];
  if (v1 <= 0.7) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  id v2 = [MEMORY[0x263F1C550] blackColor];
  }

  return v2;
}

double RESuggestedHeaderImageSizeForStyle(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFD180] currentDevice];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  float v3 = (double (*)(uint64_t, id))getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr;
  double v11 = getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr;
  if (!getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr)
  {
    id v4 = (void *)NanoTimeKitLibrary();
    v9[3] = (uint64_t)dlsym(v4, "NTKSuggestedHeaderImageSizeForStyle");
    getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    float v3 = (double (*)(uint64_t, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    uint64_t v7 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  double v5 = v3(a1, v2);

  return v5;
}

double RESuggestedBodyImageSizeForStyle(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFD180] currentDevice];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  float v3 = (double (*)(uint64_t, id))getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr;
  double v11 = getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr;
  if (!getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr)
  {
    id v4 = (void *)NanoTimeKitLibrary();
    v9[3] = (uint64_t)dlsym(v4, "NTKSuggestedBodyImageSizeForStyle");
    getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    float v3 = (double (*)(uint64_t, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    uint64_t v7 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  double v5 = v3(a1, v2);

  return v5;
}

uint64_t REUIScaledFullColorImageProviderWithImage()
{
  return 0;
}

uint64_t REUIGraphicCircularTemplateForAppWithIdentifier()
{
  return 0;
}

void *__getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoTimeKitLibrary();
  Class result = dlsym(v2, "NTKSuggestedHeaderImageSizeForStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoTimeKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoTimeKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __NanoTimeKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2644B7FA8;
    uint64_t v5 = 0;
    NanoTimeKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoTimeKitLibraryCore_frameworkLibrary;
  double v1 = (void *)v3[0];
  if (!NanoTimeKitLibraryCore_frameworkLibrary)
  {
    double v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __NanoTimeKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoTimeKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNTKSuggestedBodyImageSizeForStyleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoTimeKitLibrary();
  uint64_t result = dlsym(v2, "NTKSuggestedBodyImageSizeForStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double REUpNextUnitRectForFrameInBounds(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v15.origin.x = a5;
  v15.origin.y = a6;
  v15.size.width = a7;
  v15.size.height = a8;
  CGRectGetMinY(v15);
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  CGRectGetHeight(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  double v13 = a1 / CGRectGetWidth(v17);
  v18.origin.x = a5;
  v18.origin.y = a6;
  v18.size.width = a7;
  v18.size.height = a8;
  CGRectGetHeight(v18);
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetWidth(v19);
  return v13;
}

uint64_t soft_RETrainingSimulationIsCurrentlyActive()
{
  uint64_t result = RelevanceEngineLibraryCore_0();
  if (result)
  {
    uint64_t v4 = 0;
    uint64_t v5 = &v4;
    uint64_t v6 = 0x2020000000;
    double v1 = (uint64_t (*)(void))getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr;
    uint64_t v7 = getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr;
    if (!getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __getRETrainingSimulationIsCurrentlyActiveSymbolLoc_block_invoke;
      v3[3] = &unk_2644B7CE0;
      v3[4] = &v4;
      __getRETrainingSimulationIsCurrentlyActiveSymbolLoc_block_invoke((uint64_t)v3);
      double v1 = (uint64_t (*)(void))v5[3];
    }
    _Block_object_dispose(&v4, 8);
    if (!v1)
    {
      id v2 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
      _Block_object_dispose(&v4, 8);
      _Unwind_Resume(v2);
    }
    return v1();
  }
  return result;
}

uint64_t RelevanceEngineLibraryCore_0()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1) {
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_1;
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getRETrainingSimulationIsCurrentlyActiveSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)RelevanceEngineLibraryCore_0();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "RETrainingSimulationIsCurrentlyActive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double NTKInterpolateBetweenFloatsClipped(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * fmin(fmax(a3, 0.0), 1.0);
}

uint64_t softRESampleRelevanceProviderForPosition_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[REUIDonatedElementProperties _loadContentForRelevantShortcut:completion:](v0);
}

void __getREAppNameCacheClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getREAppIconCacheClass_block_invoke_cold_1(v0);
}

void __getREAppIconCacheClass_block_invoke_cold_1()
{
  abort_report_np();
  CGAffineTransformMakeScale(v0, v1, v2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t CLKUIImageNamedFromBundleForDevice()
{
  return MEMORY[0x270F16918]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t REApplicationGetType()
{
  return MEMORY[0x270F59A60]();
}

uint64_t REDiffOperationTypeDescription()
{
  return MEMORY[0x270F59A68]();
}

uint64_t REEnumerateTrainingStateForDate()
{
  return MEMORY[0x270F59A78]();
}

uint64_t REIsCurrentLocaleCJK()
{
  return MEMORY[0x270F59A80]();
}

uint64_t RELogForDomain()
{
  return MEMORY[0x270F59A88]();
}

uint64_t RERaiseInternalException()
{
  return MEMORY[0x270F59A90]();
}

uint64_t REStringForSectionPath()
{
  return MEMORY[0x270F59AA0]();
}

uint64_t RESupergreenSuggestedImageDonationWidth()
{
  return MEMORY[0x270F59AA8]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F06270]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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